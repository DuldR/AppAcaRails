class NotesController < ApplicationController

    def new

    end

    def create
        @note = Note.new(note_params)
        @note.user_id = current_user.id
        @note.save!

        redirect_to track_url(@note.track_id)
    end

    def update

    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy

        redirect_to track_url(@note.track_id)

    end

    def note_params
        params.require(:note).permit(:body, :track_id)
    end
end