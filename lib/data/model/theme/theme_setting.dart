class ThemeSetting {
  final bool isDarkMode;

  ThemeSetting({required this.isDarkMode});

  Map<String, dynamic> toJson() {
    return {"isDarkMode": isDarkMode};
  }

  factory ThemeSetting.fromJson(Map<String, dynamic> json) {
    return ThemeSetting(isDarkMode: json["isDarkMode"] ?? false);
  }
}
