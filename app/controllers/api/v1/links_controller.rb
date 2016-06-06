module Api
  module V1
    class LinksController < ApiController
      respond_to :json

      def index
        links = Link.order('title ASC')
        respond_with links
      end

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
