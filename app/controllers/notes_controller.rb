class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params_notes)
    if @note.save
      redirect_to notes_path
    else
      render :new
  end
end

  def show
    @notes = Note.find(params[:id])
  end

  private
  def params_notes
    params.require(:note).permit(:title,:body).merge(user_id: current_user.id)
  end
end
