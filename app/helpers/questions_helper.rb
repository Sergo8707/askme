module QuestionsHelper

  # метод выводит автора вопроса, если он зарегистрирован
  def put_author_question(author)
    if author.nil?
      "Автор: Аноним"
    else
      p "Автор: #{link_to author.name, user_path(author)}"
    end
  end
end