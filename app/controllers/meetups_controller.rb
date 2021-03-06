class MeetupsController < ProtectedController
  before_action :set_meetup, only: [:show, :update, :destroy]
  require 'meetup_client'

  # GET /meetups
  # gets the meetups that belong to the logged in user
  def index
    @my_meetups = current_user.meetups.all
    render json: @my_meetups
  end

  def search
    meetup_api = MeetupApi.new
    s_params = { category: '34',
                 zip: params['m_search']['location'],
                 radius: params['m_location']['radius'],
                 status: 'upcoming',
                 format: 'json',
                 page: '50' }
    @@search_meetups = meetup_api.open_events(s_params)
    render json: @@search_meetups
  end

  def reminder_email
    my_meetups = current_user.meetups.all
    UserMailer.reminder_email(current_user, my_meetups).deliver_now
    render json: my_meetups
  end


  # POST /meetups/:id
  # we are going to send in the id of the meetup we want to save
  def create_id
    meetup_id = params[:id]
    #  now look in the @search_meetups list for this meetup - all
    # the data is there - no need to pink the Meetup API again
    m_idx = @@search_meetups['results'].index { |m| m['id'] == meetup_id }
    newm = @@search_meetups['results'][m_idx]
    the_time = newm['time']
    m_params = { name: newm['name'],
                 event_id: newm['event_id'],
                 event_url: newm['event_url'],
                 time: newm['time'],
                 group: newm['group']['name'] }
    @meetup = current_user.meetups.build(m_params)
    if @meetup.save
      render json: @meetup, status: :created, location: @meetup
    else
      render json: @meetup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meetups/1
  def destroy
    @meetup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meetup_params
      params.require(:meetup).permit(:name, :plain_text_description, :event_id,
                                     :event_url, :time, :group)
    end
end
