glue @question do
  attributes :id, :title, :content, :available, :exp_variables, :many_answers, :eql_sinal,
             :cmas_order, :precision, :correct_feeback

  child(:tips) do
    attributes :id, :content, :number_of_tries
  end
end
