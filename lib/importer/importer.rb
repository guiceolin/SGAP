require 'csv'
class Importer
  def import(file)
    ::CSV.foreach(file) do |row|
      add row
    end
  end

  class InvalidFormatException < Exception; end
  class InvalidDataException < Exception; end
end

class SubjectImporter < Importer
  def add(arry)
    raise Importer::InvalidFormatException.new if arry.size != 3
    attr = {}
    attr[:code], attr[:name], attr[:description] = arry
    Subject.new(attr).save
  end
end

class CrowdImporter < Importer
  def add(arry)
    attr = {}
    subject = Subject.find_by_code(arry.shift)
    professor = Professor.find_by_username(arry.shift)
    raise Importer::InvalidDataException.new unless subject && professor
    attr[:name], attr[:semester], attr[:year], *students = arry
    crowd = Crowd.new(attr)
    crowd.subject = subject
    crowd.professor = professor
    students.each do |username|
      student =  Student.find_by_username(username)
      if student
        crowd.students << student
      else
        raise Importer::InvalidDataException.new
      end
    end
    crowd.save
  end
end

class StudentImporter < Importer
  def add(arry)
    raise Importer::InvalidFormatException if arry.size != 4
    attr = {}
    attr[:username], attr[:name], attr[:email], password = arry
    student = Student.new(attr)
    student.password = password
    student.password_confirmation = password
    student.save
  end
end
class ProfessorImporter < Importer
  def add(arry)
    raise Importer::InvalidFormatException if arry.size != 4
    attr = {}
    attr[:username], attr[:name], attr[:email], password = arry
    professor = Professor.new(attr)
    professor.password = password
    professor.password_confirmation = password
    professor.save
  end
end
