module Api
  module V1
    class LinksController < ApiController
      respond_to :json

      def index
        links = Link.order('title ASC')
        respond_with links
      end

      # def create
      #   idea = Idea.new(idea_params)
      #   if idea.save
      #     respond_with({idea: idea}, status: 201, location: api_v1_ideas_path(idea))
      #   else
      #     respond_with({ errors: idea.errors }, status: 422, location: api_v1_ideas_path)
      #   end
      # end
      #
      # def destroy
      #   respond_with Idea.find(params[:id]).destroy
      # end
      #
      def update
        link = Link.update(params[:id], link_params)
        if link.save
          respond_with({ link: link }, status: 200, location: api_v1_links_path(link))
        else
          respond_with({ errors: link.errors }, status: 422, location: api_v1_links_path)
        end
      end

      private

      def link_params
        params.require(:link).permit(:title, :url, :read)
      end
    end
  end
end
