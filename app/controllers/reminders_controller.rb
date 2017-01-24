class RemindersController < ApplicationController
  before_action :set_reminder, only: [ :show, :edit, :update, :destroy ]

  def index
    @reminders = Reminder.order("due_date ASC")
  end

  def new
    @reminder = Reminder.new
  end

  def show
    redirect_to edit_reminder_path(@feature.id)
  end

  def edit
  end

  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      redirect_to reminders_path, notice: 'Reminder was successfully created.'
    else
      render :new
    end
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to reminders_path, notice: 'Reminder was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reminder.destroy
    redirect_to reminders_url, notice: 'Reminder was successfully destroyed.'
  end

  private

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def reminder_params
    params.fetch(:reminder, {}).permit(:description, :due_date)
  end
end
