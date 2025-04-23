/// Bu Enum Userin Hansi tipde oldugunu gosterir
/// !{admin, user}
/// !admin - Admin olan user
/// !user - Normal olan user
/// Eger  Login olan userin tipini bilimirikse default olaraq user tipinde olacaq
/// 
enum UserType {
  admin('admin'),
  user('user');
  
  final String value;
  const UserType(this.value);
}