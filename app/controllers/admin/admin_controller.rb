module Admin
  class AdminController < ApplicationController
    before_action :authorize
  end
end
