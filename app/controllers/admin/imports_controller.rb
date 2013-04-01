require 'importer'
class Admin::ImportsController < ApplicationController

  def new; end

  def create
    case params[:resource]
    when 'subjects'
      importer = SubjectImporter.new
    when 'crowds'
      importer = CrowdImporter.new
    when 'students'
      importer = StudentImporter.new
    when 'professors'
      importer = ProfessorImporter.new
    else
      raise 'Parametro Invalido'
    end
    importer.import(params[:csv_file].tempfile)
    redirect_to new_admin_import_path
  end
end
