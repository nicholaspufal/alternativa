# encoding: utf-8

class QuestionValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "Todas as questões devem ter selecionada uma resposta correta" if record.answers.select(&:correct?).count == 0
    record.errors[:base] << "Apenas uma alternativa pode ser válida por questão" if record.answers.select(&:correct?).count > 1
  end
end
