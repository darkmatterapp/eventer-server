module Admin
  class LinksController < Admin::AdminController
    before_action :set_event
    before_action :set_link, only: [:show, :edit, :update, :destroy]
    after_action :get_tweet, only: [:create, :update]

    def index
      @links = @event.links
    end

    def show
    end

    def new
      @link     = @event.links.new
      @previous = [:admin, @event, :links]
    end

    def edit
      @previous = [:admin, @event, @link]
    end

    def create
      @link = @event.links.build(link_params)

      if @link.save
        redirect_to [:admin, @event, @link], notice: "Link was successfully created."
      else
        render :new
      end
    end

    def update
      if @link.update(link_params)
        redirect_to [:admin, @event, @link], notice: "Link was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @link.destroy
      redirect_to [:admin, @event], notice: "Link was successfully destroyed."
    end

    private

    def set_link
      @link = @event.links.find(params[:link_id])
    end

    def get_tweet
      if @link.url =~ /twitter\.com/
        doc                = Nokogiri::HTML(open(@link.url))
        twitter_username   = doc.css(".permalink-tweet-container .username").text
        @link.creator_name = doc.css(".permalink-tweet-container .fullname").text
        @link.title        = "Tweet by #{@link.creator_name} (#{twitter_username})"
        @link.content      = doc.css(".permalink-tweet-container .tweet-text").text
        @link.creator_url  = "https://twitter.com/#{twitter_username}"
        @link.creator_photo = doc.css(".permalink-tweet-container .avatar").attribute("src")
        @link.published_at = Date.parse(doc.css(".time .tweet-timestamp").attribute("title"))
        @link.save!
      end
    end

    def link_params
      params.require(:link).permit(
        :url,
        :title,
        :content,
        :creator_name,
        :creator_url,
        :creator_photo,
        :published_at,
        :user_id
      )
    end
  end
end
