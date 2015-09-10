Carrie.Helpers.MathJax =
  displayExpression: (el, delay) ->
    delay = 50 unless delay
    setTimeout ( ->
      MathJax.Hub.Queue(["Typeset",MathJax.Hub, el])
    ), delay
