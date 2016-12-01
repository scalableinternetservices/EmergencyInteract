class CommentsController < ApplicationController
    def create
      @event = Event.find(params[:event_id])
      @comment = @event.comments.create(comment_params)
      # increase interactions count
      @event.interactions += 1
      @event.save
      redirect_to event_path(@event)
    end
     
    private
      def comment_params
        params.require(:comment).permit(:body, :event_id)
      end
end
