// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_architecture_learn/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clean_architecture_learn/main.dart';

void main() {
  ProfileRemoteDataSourceImplementation profileDataSourceImplementation =
      ProfileRemoteDataSourceImplementation();
  test('check datasource logic list data', () async {
    final listOfData = await profileDataSourceImplementation.getAllProfiles(1);
    // Assert: Mengecek apakah hasilnya sesuai harapan
    expect(listOfData.isNotEmpty, true);

    for (var element in listOfData) {
      print(element.toJson());
    }
  });
  test('check datasource logic single data', () async {
    final data = await profileDataSourceImplementation.getProfileById(1);
    // Assert: Mengecek apakah hasilnya sesuai harapan
    print(data.toJson());
  });
}
