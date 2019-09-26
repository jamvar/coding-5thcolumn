class ComputersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_computer, only: [:link, :policy]

  def index
    @computers = Computer.all
  end

  def credentials
    @credentials = ApiCredential.where(api_name: "5thcolumn").first
  end

  def link
    @link = @computer.link
  end

  def policy
    @policy = @computer.policy
  end

  private

  def set_computer
    @computer = Computer.find_by_id(params[:id])
  end
end
