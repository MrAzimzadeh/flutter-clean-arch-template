enum AppRoutes {
  login(path: "/login"),
  home(path: "/home"),


  splash(path: "/");
  final String path;
  const AppRoutes({required this.path});
}
