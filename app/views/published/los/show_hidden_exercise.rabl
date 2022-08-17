object @exercise
attributes :id, :title, :content

node(:canAnswer) { @can_answer }

node :questions do |parent|
  partial("published/los/questions", :object => @exercise.questions_avaiable)
end
