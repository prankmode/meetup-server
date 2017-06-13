Meetupclass MeetupsController < ProtectedController
  before_action :set_meetup, only: [:show, :update, :destroy]
  require 'pry'

  # GET /meetups
  # gets the meetups that belong to the logged in user
  def index
    @meetups = current_user.meetups.all
    render json: @meetups
  end

  def search

    render json: @events
  end


  # GET /meetups/1
  def show
    render json: @meetup
  end

  # POST /meetups_multiple
  def multiple
    binding.pry
    meetups_list = params["meetups"]
    meetups_list.each do |m|
      m_params = { name: m['name'],
                   plain_text_description: m['plain_text_description'],
                   event_id: m['event_id'],
                   short_link: m['short_link'] }
      nm = Meetup.new(m_params)
      nm.save
    end


    # if @meetup.save
    #   render json: @meetup, status: :created, location: @meetup
    # else
    #   render json: @meetup.errors, status: :unprocessable_entity
    # end
  end

  # POST /meetups
  def create
    @meetup = Meetup.new(meetup_params)

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
      params.require(:meetup).permit(:name, :plain_text_description, :event_id, :short_link)
    end
end
