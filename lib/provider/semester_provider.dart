import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/repository/semester_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SemestersProvider extends ChangeNotifier {
  final _semesterRepository = SemesterRepository();

  List<Semester>? _semesters;
  Semester? _currentSemester;
  List<Week>? _currentSemesterWeek;
  Week? _currentWeek;

  Future<void> loadSemesters() async {
    _semesters = await _semesterRepository.getAllSemester();
    if (_semesters != null && _semesters!.isNotEmpty) {
      _currentSemester = _semesters![0];
      await _loadCurrentSemesterWeek();
      await _getCurrentWeek();
    }
    notifyListeners();
  }

  Future<void> _loadCurrentSemesterWeek() async {
    if (_currentSemester != null) {
      _currentSemesterWeek =
          await _semesterRepository.getAllSemesterWeek(_currentSemester!.id);
    } else {
      _currentSemesterWeek = null;
    }
  }

  Future<void> _getCurrentWeek() async {
    if (_currentSemester != null) {
      _currentWeek =
          await _semesterRepository.getCurrentWeek(_currentSemester!.id);
    } else {
      _currentWeek = null;
    }
  }

  List<Semester>? get semesters {
    return _semesters;
  }

  Semester? get currentSemester {
    return _currentSemester;
  }

  set currentSemester(Semester? semester) {
    _currentSemester = semester;
    _loadCurrentSemesterWeek()
        .then((value) => _getCurrentWeek())
        .whenComplete(() => notifyListeners());
  }

  List<Week>? get currentSemesterWeek {
    return _currentSemesterWeek;
  }

  Week? get currentWeek {
    return _currentWeek;
  }
}
