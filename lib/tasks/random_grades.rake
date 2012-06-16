require File.expand_path("../../../config/environment", __FILE__)

desc "Random notes for a new exam"
task :random_notes do
  def random_number
    begin
      number = (Kernel.rand * 10).round(1)
    end while (number <= 2.0)

    number
  end

  Student.all.each do |student|
    Assessment.create(student_id: student.id,
                      exam_id: Exam.last.id,
                      grade: random_number)
  end
  
  puts "Novas notas criadas."
end