import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/repository/semester_repository.dart';
import 'package:flutter/material.dart';

class SemestersProvider extends ChangeNotifier {
  final _semesterRepository = SemesterRepository();

  List<Semester>? _semesters;
  int? _currentSemesterIndex;

  Future<void> loadSemesters() async {
    _semesters = await _semesterRepository.getAllSemester();
    if (_semesters != null && _semesters!.isNotEmpty) {
      _currentSemesterIndex = 0;
    }
  }

  List<Semester>? get semesters {
    return _semesters;
  }

  Semester? getCurrentSemester() {
    if (_semesters != null && _currentSemesterIndex != null) {
      return _semesters![_currentSemesterIndex!];
    } else {
      return null;
    }
  }

  Future<List<Week>?> getCurrentSemesterWeek() async {
    Semester? currentSemester = getCurrentSemester();
    if (currentSemester != null) {
      return _semesterRepository.getAllSemesterWeek(currentSemester.id);
    } else {
      return null;
    }
  }

  Future<Week?> getCurrentWeek() async {
    Semester? currentSemester = getCurrentSemester();
    if (currentSemester != null) {
      return _semesterRepository.getCurrentWeek(currentSemester.id);
    } else {
      return null;
    }
  }
}