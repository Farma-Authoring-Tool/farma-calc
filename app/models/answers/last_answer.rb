class Answers::LastAnswer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :response 
  field :correct, type: Boolean, default: false
  field :attempt_number, type: Integer

  embedded_in :question, class_name: "Answers::Question",  inverse_of: :last_answer

  attr_accessible :question_id, :response, :correct, :attempt_number

  def tips
    if question.display_tips?(:sequential)
      @tips ||= question.tips_for(self.attempt_number)
    else
      @tips ||= question.tips.reverse
    end
  end
end

