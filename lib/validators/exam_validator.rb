# encoding: utf-8

class ExamValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "Você precisa criar ao menos uma questão" if record.questions.empty?
  end
end
