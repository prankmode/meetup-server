class MeetupsController < ProtectedController
  before_action :set_meetup, only: [:show, :update, :destroy]
  # require 'pry'
  require 'meetup_client'

  # GET /meetups
  # gets the meetups that belong to the logged in user
  def index
    @my_meetups = current_user.meetups.all
    render json: @my_meetups
  end

  def search
    # binding.pry
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


  # GET /meetups/1
  def show
    render json: @meetup
  end

  # POST /meetups_multiple
  def multiple
    # binding.pry
    meetups_list = params["meetups"]
    meetups_list.each do |m|
      m_params = { name: m['name'],
                   plain_text_description: m['plain_text_description'],
                   event_id: m['event_id'],
                   event_url: m['event_url'] }
      nm = Meetup.new(m_params)
      nm.save
    end


    # if @meetup.save
    #   render json: @meetup, status: :created, location: @meetup
    # else
    #   render json: @meetup.errors, status: :unprocessable_entity
    # end
  end

  # POST /meetups/:id
  # we are going to send in the id of the meetup we want to save
  def create_id
    meetup_id = params[:id]
    # binding.pry
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

  # PATCH/PUT /meetups/1
  def update
    if @meetup.update(meetup_params)
      render json: @meetup
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
                                     :event_url, :time)
    end
end
