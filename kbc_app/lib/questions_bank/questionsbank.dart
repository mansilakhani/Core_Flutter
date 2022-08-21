import 'package:flutter/material.dart';

int initialquestion = 0;

List<Map> Questions = [
  {
    'question': " 1. World Tourism Day is celebrated on-",
    'answer': "C.September 27",
    'color': Colors.pink[600],
    'price': 1000,
  },
  {
    'question': "2. When is International Yoga Day celebrated?",
    'answer': "A.June 21",
    'price': 2000,
    'color': Colors.blue,
  },
  {
    'question': "3.'Line of Blood' is a book written by whom",
    'answer': "A.Bairaj Khanna",
    'price': 3000,
    'color': Colors.redAccent,
  },
  {
    'question': "4.Beighton Cup is associated with which of the following?",
    'answer': "B.Hockey",
    'price': 5000,
    'color': Colors.yellowAccent,
  },
  {
    'question':
        "5. Which of the following was Indian’s first mapping satellite?",
    'answer': "A.CARTOSAT-1",
    'price': 10000,
    'color': Colors.green,
  },
  {
    'question': "6. Who is said to be the father of Indian Space Programme? ",
    'answer': "C.Vikram Sarabhai",
    'price': 20000,
    'color': Colors.lightBlueAccent,
  },
  {
    'question': "7. International Bio-Diversity day is celebrated on ",
    'answer': "B.1972",
    'price': 40000,
    'color': Colors.deepOrangeAccent,
  },
  {
    'question': "8. Where is the world's oldest railway station?",
    'answer': "A.Liverpool",
    'price': 80000,
    'color': Colors.deepPurpleAccent,
  },
  {
    'question':
        "9. How many kilometer long is the Bogda Paripanjal, the country's longest railway?",
    'answer': "B.0 .610 m",
    'price': 160000,
    'color': Colors.orange,
  },
  {
    'question': "10. What is the length of narrow gauge?",
    'answer': "A.11.26 km",
    'price': 320000,
    'color': Colors.teal[500],
  },
];

List<Map> Options = [
  {
    '1': "A.September 12",
    '2': "B.September 25",
    '3': "C.September 27",
    '4': "D.September 29"
  },
  {
    '1': "A.June 21",
    '2': "B.March 21",
    '3': "C.April 22",
    '4': "D.May 31",
  },
  {
    '1': "A.Bairaj Khanna",
    '2': "B.Ursula Vernon",
    '3': "C.Amal EI-Mohtar",
    '4': "D.Diksha Basu",
  },
  {
    '1': "A.Cricket",
    '2': "B.Hockey",
    '3': "C. Football",
    '4': "D.Volleyball",
  },
  {
    '1': "A.CARTOSAT-1",
    '2': "B.Aryabhatta",
    '3': "C.Bhaskara -II",
    '4': "D.INSAT-IA",
  },
  {
    '1': "A.Abdul Kalam",
    '2': "B.Rakesh Sharma",
    '3': "C.Vikram Sarabhai",
    '4': "D.Homi Bhabha",
  },
  {
    '1': "A.1962",
    '2': "B.1972",
    '3': "C.1882",
    '4': "D.1992",
  },
  {
    '1': "A.Liverpool",
    '2': "B.Stockton",
    '3': "C.Darlington",
    '4': "D.Others",
  },
  {
    '1': "A.1 meter",
    '2': "B.0 .610 m",
    '3': "C.2 .031 m",
    '4': "D.0 0.762 m",
  },
  {
    '1': "A.11.26 km",
    '2': "B.8.6 km",
    '3': "C.9.02 km",
    '4': "D.5.1 km",
  },
];
