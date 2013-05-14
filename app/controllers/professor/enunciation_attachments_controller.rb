class Professor::EnunciationAttachmentsController < ApplicationController
  def create
    enunciation = Enunciation.find_by_name(params[:enunciation_id])
    attachment = Attachment.new
    attachment.file = params[:file]
    attachment.attachable = enunciation
    attachment.save
    redirect_to professor_subject_crowd_enunciation_path(enunciation.crowd.subject, enunciation.crowd, enunciation)
  end
end
