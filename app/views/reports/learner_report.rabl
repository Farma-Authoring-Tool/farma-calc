#encoding: utf-8
object false

node(:completeness) { @learner.completeness_of(@team, @lo) }

node :questions_answer do
  result = []
  @lo.exercises_avaiable.each do |exercise|
    exercise.questions_avaiable.each do |question|
      # primeira resposta correta
      answer = @learner.answers.where(from_question_id: question.id,
                                      correct: true).asc(:created_at).limit(1).first

      if answer.nil?
        # última resposta
        answer = @learner.answers.where(from_question_id: question.id).
                                  asc(:created_at).limit(1).last
      end

      # number of retroactions
      answer_ids = @learner.answers.where(from_question_id: question.id).pluck(:id)
      number_of_retroaction = Reports::RetroactionView.where(user_id: @learner.id).in(answer_id: answer_ids).count


      result << {
          name: @learner.name,
          exercise: exercise.title,
          question: question.title,
          response: (answer.nil? ? 'Não respondido' : "$#{answer.response}$"),
          correct: (answer.nil? ? 'Não respondido' : (answer.correct ? 'Sim' : 'Não')),
          attempt_number: (answer.nil? ? 'Não respondido' : answer.attempt_number),
          created_at: (answer.nil? ? 'Não respondido' : l(answer.created_at)),
          number_of_retroaction: number_of_retroaction
      }
    end
  end
  result
end
