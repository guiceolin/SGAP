class CloneEnunciationsController < ApplicationController
  def show
    enunciation = Enunciation.find(params[:id])
    crowd = Crowd.find(params[:crowd_id])
    new_enunciation = enunciation.dup
    new_enunciation.clone_attachments(enunciation)
    new_enunciation.crowd = crowd
    new_enunciation.name += ' - Clonado'
    new_enunciation.save
    redirect_to edit_professor_subject_crowd_enunciation_path(crowd.subject, crowd, new_enunciation)
  end
end
