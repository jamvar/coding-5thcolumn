class ComputersController < ApplicationController
  before_action :authenticate_user!

  def index
    @computers = Computer.all
  end

end
