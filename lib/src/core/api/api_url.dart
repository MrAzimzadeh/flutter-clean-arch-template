class ApiUrl {
  ApiUrl._();

  static const String baseUrl = 'https://dummyjson.com';

  // static const products = "/products";
  // Url By  Account
  static const authBase = "$baseUrl/auth";
  static const login = "$authBase/login"; //  Base Url for account
  static const refreshToken = "$authBase/refresh"; //  Base Url for account

  // * User 
  static const myaccount = "$baseUrl/user"; //  Base Url for user
  static const userProfile = "$myaccount/me"; //  Base Url for user profile
  
}
