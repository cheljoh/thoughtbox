module Api
  module V1
    class LinksController < ApiController
      respond_to :json

      def index
        if current_user.links
          links = current_user.links
          respond_with links
        else
          respond_with "No links yet! Add some!"
        end
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
      # def update
      #   idea = Idea.update(params[:id], idea_params)
      #   if idea.save
      #     respond_with({ idea: idea }, status: 200, location: api_v1_ideas_path(idea))
      #   else
      #     respond_with({ errors: idea.errors }, status: 422, location: api_v1_ideas_path)
      #   end
      # end
      #
      # private
      #
      # def link_params
      #   params.require(:idea).permit(:body, :title, :quality)
      # end
    end
  end
end
