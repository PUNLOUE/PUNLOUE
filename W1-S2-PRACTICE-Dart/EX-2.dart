void main() {
  // 1 - iLike
  String iLike = 'I like pizza';
    //the value of iLike it doesn't change, so it can be const

  // 2 - toppings
  String toppings = 'with tomatoes';
  toppings += " and cheese";
    //The value of toppings changes after its initial assignment , so it can be var

  // 3 - message
  String message = '$iLike $toppings';
  print(message);
    //the value of message is assigned onece ,and it can be change at runtime, so it can be final

  // 4 - rbgColors
  List<String> rbgColors = ['red', 'blue', 'green'];
  print(rbgColors);
    //the values of lists of rbgColors doesn't change , so it can be const

  // 5 - weekDays
  List<String> weekDays = ['monday', 'tuesday', 'wednesday'];
  weekDays.add('thursday');
  print(weekDays);
    //the list of weekDays is initial or modifie, so it can be var

  // 6 - scores
  List<int> scores = [45,35,50];
  scores = [45,35,50, 78];
  print(scores);
    //the list of scores is modified or reassigned , so it can be var

}


