class ComputersController < ApplicationController
  before_action :authenticate_user!

  def index
    @computers = Computer.all
  end

  def credentials
    @credentials = ApiCredential.where(api_name: "5thcolumn").first
  end
end
