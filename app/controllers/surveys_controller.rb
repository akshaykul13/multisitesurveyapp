class SurveysController < ApplicationController
  def index
    @surveys = Survey.order(created_at: :desc)
  end

  def new
    # default: render ’new’ template
  end

  def create
    @survey = Survey.create!(params[:survey])
    flash[:notice] = "#{@survey.survey_name} was successfully created."
    redirect_to surveys_path
  end

  def search_surveys
    @surveys = Survey.find_by_survey_name(params[:search][:survey_name])
    redirect_to surveys_path
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Survey ’#{@survey.survey_name}’ deleted."
    redirect_to surveys_path
  end
end

