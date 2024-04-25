class Questions {
  Questions(this.questionsText, this.answetList);
  final String questionsText;
  List<Answer> answetList;
}

class Answer {
  Answer(this.answerText, this.isCorrert);
  final String answerText;
  final bool isCorrert;
}

List<Questions> getQuestions() {
  List<Questions> list = [];
  list.add(Questions(
    "who is owner of Flutter ?",
    [
      Answer("Nokia", false),
      Answer("Samsung", false),
      Answer("Google", true),
      Answer("Apple", false),
    ]
  ));

    list.add(Questions(
    "who is owner of Iphone ?",
    [
      Answer("Apple", true),
      Answer("Mircrosoft", false),
      Answer("Google", true),
      Answer("Apple", false),
    ]
  ));
      list.add(Questions(
    "who is owner of Iphone ?",
    [
      Answer("Apple", true), //here I need add some questions about Kyrgystan
      Answer("Mircrosoft", false),
      Answer("Google", true),
      Answer("Apple", false),
    ]
  ));
  return list;
}
