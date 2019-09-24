class ComputersController < ApplicationController

  def index
    @computers = Computer.all
  end
  
end
