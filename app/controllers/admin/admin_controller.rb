module Admin
  class AdminController < ApplicationController
    before_action :authorize
    around_action :user_time_zone, if: :current_event

    private

    def user_time_zone(&block)
      Time.use_zone(current_event.time_zone, &block)
    end

    # TODO memoize this before we start getting hammered
    def current_event
      Event.find_by(permalink: params[:event_id]) if params[:event_id]
    end

    # used for before_actions in all the admin controllers
    def set_event
      @event = current_event
    end
    helper_method :set_event
  end
end
