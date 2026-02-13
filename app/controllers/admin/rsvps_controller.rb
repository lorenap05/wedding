class Admin::RsvpsController < Admin::BaseController
  layout "admin"

  def index
    @rsvps = Rsvp.order(created_at: :desc)
  end
end
