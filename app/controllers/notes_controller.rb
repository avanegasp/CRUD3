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

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(params_notes)
      flash[:notice] = 'note update!'
      redirect_to notes_path
    else
      flash[:error] = 'failed to edit note'
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
      if @note.delete
        flash[:notice]
        redirect_to notes_path
      else
        flash[:error]
        render :destroy
      end
  end

  private
  def params_notes
    params.require(:note).permit(:title,:body).merge(user_id: current_user.id)
  end
end
