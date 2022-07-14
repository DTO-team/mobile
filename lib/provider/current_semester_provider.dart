import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/repository/semester_repository.dart';
import 'package:flutter/material.dart';

class SemestersProvider extends ChangeNotifier {
  final _semesterRepository = SemesterRepository();

  late List<Semester> semesters;
  late int currentSemesterIndex;

  SemestersProvider() {
    _semesterRepository.getAllSemester().then((value) {
      semesters = value;
      currentSemesterIndex = 0;
    });
  }

  Semester getCurrentSemester() {
    return semesters[currentSemesterIndex];
  }

  Future<List<Week>> getCurrentSemesterWeek() async {
    return _semesterRepository.getAllSemesterWeek(getCurrentSemester().id);
  }

  Future<Week> getCurrentWeek() async {
    return await _semesterRepository.getCurrentWeek(getCurrentSemester().id);
  }
}