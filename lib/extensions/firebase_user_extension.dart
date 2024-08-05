part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {required String name = "No Name",
          required List<String> selectedGenres = const [],
          required String selectedLanguage = "English",
          required int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
}
