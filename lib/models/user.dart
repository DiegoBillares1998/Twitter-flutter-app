class UserModel {
  final String id;
  final String name;
  final String? phoneNumber;
  final String? email;
  final String birthDay;
  final String password;

  UserModel(
      {required this.id,
      required this.name,
      this.phoneNumber,
      this.email,
      required this.birthDay,
      required this.password});
}
