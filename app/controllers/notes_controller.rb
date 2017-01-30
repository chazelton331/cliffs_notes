class NotesController < ApplicationController
  before_action :set_note,                only: [       :show, :edit, :bump, :update, :destroy ]
  before_action :set_top_note_priorities, only: [ :new,        :edit                           ]

  def index
    @notes = Note.order("priority DESC")
  end

  def new
    @note = Note.new
  end

  def show
    renderer_options = {
      filter_html:         true,
      hard_wrap:           true,
      link_attributes:     { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks:  true,
    }

    @markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(renderer_options),
      { autolink: true, superscript: true, disable_indented_code_blocks: true }
    )
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def bump
    highest_priority = Note.order("priority DESC").limit(1).first.try(:priority).to_i

    @note.priority = highest_priority + 1
    @note.save!

    redirect_to notes_path, notice: 'Note was successfully bumped.'
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def set_top_note_priorities
    @top_priorities = Note.order("priority DESC").limit(5).pluck(:priority)
  end

  def note_params
    params.fetch(:note, {}).permit(:description, :priority, :keywords, :due_date)
  end
end
