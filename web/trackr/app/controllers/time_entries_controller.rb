# frozen_string_literal: true

class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: %i[show edit update destroy]

  # GET /time_entries
  # GET /time_entries.json
  def index
    @time_groups = TimeEntry.order(start: :desc)
                            .limit(100)
                            .where(user_id: current_user.id)
                            .where.not(end: nil)
                            .group_by { |a| a.start.beginning_of_day }
  end

  # GET /time_entries/1
  # GET /time_entries/1.json
  def show; end

  # GET /time_entries/new
  def new
    @time_entry = TimeEntry.new(user_id: current_user.id)
  end

  # GET /time_entries/active
  def active
    respond_to :json
    @time_entry = TimeEntry.where(user_id: current_user.id, end: nil).first
    if @time_entry
      render :show
    else
      render json: nil
    end
  end

  # GET /time_entries/1/edit
  def edit; end

  # POST /time_entries
  # POST /time_entries.json
  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.user_id = current_user.id

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to time_entries_path, notice: 'Time entry was successfully created.' }
        format.json { render :show, status: :created, location: @time_entry }
      else
        format.html { render :new }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_entries/1
  # PATCH/PUT /time_entries/1.json
  def update
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to time_entries_path, notice: 'Time entry was successfully updated.' }
        format.json { render :show, status: :ok, location: time_entries_path }
      else
        format.html { render :edit }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.json
  def destroy
    @time_entry.destroy
    respond_to do |format|
      format.html { redirect_to time_entries_url, notice: 'Time entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_entry
    @time_entry = TimeEntry.where(user_id: current_user.id).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_entry_params
    params.require(:time_entry).permit(:title, :start, :end, :user_id)
  end
end
