# encoding: utf-8

class ExamValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "Ao menos uma questão é obrigatória" if record.questions.empty?
  end
end
