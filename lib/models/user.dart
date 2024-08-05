part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String password;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  User(this.id, this.email, this.password, this.profilePicture,
      this.selectedGenres, this.selectedLanguage, this.balance);
  @override
  List<Object> get props => [
        id,
        email,
        password,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
