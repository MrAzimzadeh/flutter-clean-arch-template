enum AppRoutes {
  login(path: "/login"),
  home(path: "/home"),
  profile(path: "/profile"),

  splash(path: "/");
  final String path;
  const AppRoutes({required this.path});
}
