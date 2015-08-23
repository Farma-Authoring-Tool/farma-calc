# encoding: utf-8
namespace :xls do
  # ******** to excel *********** #
  class Array
    def to_xls
      content = ''
      self.each do |row|
        row.map! {|col| col = col.to_s.gsub(/(\t|\r\n|\r|\n)/, " ").gsub(/ +/, " ") }
        content << row.join("\t")
        content << "\n"
      end
      content
    end
  end
  # ********* end *************** #

  desc "Create a xls document"
  task :generate => :environment do
    require 'remove_accents'
    datas = []
    headers = ['Turma', 'ID da Turma', 'Aprendiz', 'ID do Aprendiz', 'Exercício', 'Questão',
               'Data de ocorrência', 'Hora de ocorrência',
               'Resposta', 'Correta', 'Resposta Correta', 'Tentativa']
    datas.push headers

    #answers = Answer.every.sort {|a,b| a.user.name <=> b.user.name }
    #answers = answers.select {|a| a.lo.name = 'Pitágoras Mix - Senai - Curitiba/PR' }
    #oas = ['Relatividade Especial', 'A invenção dos logaritmos', 'Pitágoras Mix - Senai - Curitiba/PR',
    #       'Pitágoras Max - Senai - Curitiba/PR', 'Uma Ética para alem do bem e do mal', 'Logaritmos']
    
    oas = ['Equações Exponenciais - GE']
    
    #oas.each do |oa|
    #  lo = Lo.find_by(name: oa)
    #  puts "#{lo.id} \t #{lo.name}"
    #end
    lo = Lo.find('53eb526f759b74c420000001')
    #exit
    #oas.each do |el|
      answers = Answers::Soluction.every.where('lo.from_id' => lo.id).asc(:'user.name')
      answers = answers.sort {|a,b| [a.team.name, a.created_at] <=> [b.team.name, b.created_at] }

      answers.each do |answer|
        next if answer.user.nil?
        datas.push [answer.team.name, answer.team_id, answer.user.name, answer.user.id, answer.exercise.title, answer.question.title,
                    I18n.l(answer.created_at, format: :date),
                    I18n.l(answer.created_at, format: :only_time),
                    answer.response, answer.correct?, answer.question.correct_answer,
                    answer.attempt_number]
      end

      file_name = "answers-#{lo.name.removeaccents.urlize(convert_spaces: '-')}"

      f = File.new("#{file_name}.csv", "w+")
      f << datas.to_xls
      f.close
    #end
  end
end
