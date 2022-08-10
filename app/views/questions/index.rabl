collection @questions, object_root: false

attributes :id, :title, :content, :available, :correct_feedback

child(:tips) do
  attributes :id, :title, :content, :number_of_tries
end
