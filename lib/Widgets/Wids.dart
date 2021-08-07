import 'dart:math';

class CurrentUser {
  CurrentUser(this.uid, this.parameter);
  String uid, parameter;

  String getuid() {
    return uid;
  }

  String getpara() {
    return parameter;
  }
}

class GraphData {
  GraphData(
    this.value,
    this.date,
  );
  var value;
  String date;
}

class FitnessCal {
  FitnessCal(
      {this.gender,
      this.weight,
      this.height,
      this.age,
      this.waist,
      this.workout});
  bool gender;
  var height;
  double  waist, workout, fatperc, calorie, calorieup, caloriedown;
  double bmi;
  int age,weight;
  double fat, muscle;
  List bmiwording = ["asd", "sdds"];

  void bmical() {
    bmi = weight / (pow((height / 100), 2));
    if (bmi < 18.5) {
      bmiwording[0] = "under";
      bmiwording[1] = "underweight";
    } else if (bmi > 18.5 && bmi < 25.5) {
      bmiwording[0] = "ideal";
      bmiwording[1] = "fit";
    } else if (bmi > 25.5 && bmi < 30) {
      bmiwording[0] = "over";
      bmiwording[1] = "Overweight";
    } else if (bmi > 30) {
      bmiwording[0] = "highly over";
      bmiwording[1] = "Obese";
    }
  }

  void fatcal() {
    if (gender && age < 28) {
      fatperc = 1.51 * (weight / (pow((height / 100), 2))) - 0.7 * age - 2.2;
    } else if (!gender && age < 28) {
      fatperc = 1.51 * (weight / (pow((height / 100), 2))) - 0.7 * age + 1.4;
    } else if (gender && age > 28) {
      fatperc = 1.20 * (weight / (pow((height / 100), 2))) + 0.23 * age - 16.2;
    } else if (!gender && age > 28) {
      fatperc = 1.20 * (weight / (pow((height / 100), 2))) + 0.23 * age - 5.4;
    }
    fat = fatperc / 100 * weight;
    muscle = weight - fat;
  }

  void caloriecal() {
    if (workout == 0) {
      print(workout);
      calorie =
          (weight * 2.2 * 4.5) + ((height / 2.54) * 15.88) - (age * 5) - 161;
      calorie = calorie + (.2 * calorie) + 100;
    } else if (workout > 0 && workout < 3) {
      print(workout);
      calorie =
          (weight * 2.2 * 4.5) + ((height / 2.54) * 15.88) - (age * 5) - 161;
      calorie = calorie + (.3 * calorie) + 150;
    } else if (workout > 2 && workout < 5) {
      print(workout);
      calorie =
          (weight * 2.2 * 4.5) + ((height / 2.54) * 15.88) - (age * 5) - 161;
      calorie = calorie + (.5 * calorie) + 200;
    } else if (workout > 4 && workout < 8) {
      print(workout);
      calorie =
          (weight * 2.2 * 4.5) + ((height / 2.54) * 15.88) - (age * 5) - 161;
      calorie = calorie + (.7 * calorie) + 250;
    }
    calorieup = calorie + 500;
    caloriedown = calorie - 500;
  }
}
