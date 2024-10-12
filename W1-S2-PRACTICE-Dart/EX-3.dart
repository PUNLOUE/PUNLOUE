void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  //example code in Stackoverflow
  /*var fruits = ['apples', 'oranges', 'bananas'];
          fruits[0]; // apples
          fruits.add('pears');
          fruits.length == 4;
          fruits.where((fruits) => fruits.startsWith('a')).toList();
          */

  //my code
    //we use the where function to filter out the scores that are 50 or higher
    // is used to convert the iterable returned by the where function into a list so it is mean
    // when we have a packet(Scores) full of apple and then you take it out to count by where function and then 
    //you put it agian in the packet(passignScores) by toList()
    List<int> passingScores = scores.where((score) => score >= 50).toList();

      // Printing the list of passing scores
      print(passingScores);
      
      // Printing the number of students who passed
      print('${passingScores.length} students passed');

}