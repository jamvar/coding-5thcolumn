namespace :get_daily_data do
  desc "Gets Data of computer daily for 5thcolumn"
  task computers: :environment do

    def getting_results(offset=0)
      @api_endpoint = "api.amp.cisco.com/v1/computers"
      @api_credential = ApiCredential.where(api_name: "5thcolumn").first
      @api_id = @api_credential.api_id
      @api_key = @api_credential.api_key

      url = "https://" + @api_id + ":" + @api_key + "@" + @api_endpoint + "?offset=" + offset.to_s

      response = RestClient.get(url)
      parsed_response = JSON.parse(response)
      return parsed_response
    end

    def add_computer_data_to_db(response_data)
      @computer = Computer.create do |computer|
        computer.connector_guid = response_data["connector_guid"]
        computer.hostname = response_data["hostname"]
        computer.active = response_data["active"]
        computer.connector_version = response_data["connector_version"]
        computer.operating_system = response_data["operating_system"]
        computer.external_ip = response_data["external_ip"]
        computer.group_guid = response_data["group_guid"]
        computer.install_date = response_data["install_date"].to_datetime
        computer.last_seen = response_data["last_seen"].to_datetime
      end

      Link.create do |link|
        link.computer_id = @computer.id
        link.computer_link = response_data["links"]["computer"]
        link.trajectory = response_data["links"]["trajectory"]
        link.group = response_data["links"]["group"]
      end

      Policy.create do |policy|
        policy.computer_id = @computer.id
        policy.guid = response_data["policy"]["guid"]
        policy.name = response_data["policy"]["name"]
      end
    end

    start_time = Time.now
    offset = 0

    results = getting_results
    result_count = results["metadata"]["results"]["total"]
    max_per_page = results["metadata"]["results"]["items_per_page"]

    while result_count >= offset
      results["data"].each do |result|
        add_computer_data_to_db(result)
      end
      puts "#{results["data"].count}. Time elapsed: #{Time.now - start_time}"
      offset += max_per_page
      results = getting_results(offset) if offset <= result_count
    end

    @api_result = ApiResult.new
    @api_result.item_type =  "computers"
    @api_result.result_count = result_count
    @api_result.save!

  end

end
