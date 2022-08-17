glue @exercise do
  attributes :id , :title, :content, :available, :hidden

  node(:created_at) { |exer| l exer.created_at }
  node(:updated_at) { |exer| l exer.updated_at }

  child(:questions) do
    attributes :id, :title, :content, :available
    child(:tips) do
      attributes :id, :title, :content, :number_of_tries
    end
  end
end
