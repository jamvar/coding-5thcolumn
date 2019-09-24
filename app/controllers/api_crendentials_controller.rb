class ApiCredentialsController < ApplicationController
  before_action :authenticate_user!
end
