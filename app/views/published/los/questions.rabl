attributes :id, :title, :content, :exp_variables, :many_answers, :eql_sinal

#node(:test, if: lambda { |question| @user }) { |question| @user.name }

node :last_answer,
  if: lambda { |question| question.has_last_answer?(@user, @team)} do |question|
  la = question.last_answer(@user, @team).answer
  {
    id: la.id,
    response: la.response,
    attempt_number: la.attempt_number,
    correct: la.correct,
    correct_feedback: la.original_question.correct_feedback,
    tips: la.tips.as_json
  }
end
