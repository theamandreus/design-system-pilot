import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'pilot_theme.dart';
import 'keystone_theme.dart';

/// Available themes
enum ThemeType { pilot, keystone }

/// Theme provider for switching between themes
class ThemeProvider extends InheritedWidget {
  final AppTheme theme;
  final ThemeType themeType;
  final void Function(ThemeType) setTheme;

  const ThemeProvider({
    super.key,
    required this.theme,
    required this.themeType,
    required this.setTheme,
    required super.child,
  });

  static ThemeProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(provider != null, 'No ThemeProvider found in context');
    return provider!;
  }

  static AppTheme themeOf(BuildContext context) => of(context).theme;

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return theme != oldWidget.theme || themeType != oldWidget.themeType;
  }
}

/// Stateful wrapper for theme management
class ThemeManager extends StatefulWidget {
  final Widget child;
  final ThemeType initialTheme;

  const ThemeManager({
    super.key,
    required this.child,
    this.initialTheme = ThemeType.pilot,
  });

  @override
  State<ThemeManager> createState() => _ThemeManagerState();
}

class _ThemeManagerState extends State<ThemeManager> {
  late ThemeType _currentTheme;
  late AppTheme _theme;

  @override
  void initState() {
    super.initState();
    _currentTheme = widget.initialTheme;
    _theme = _getTheme(_currentTheme);
  }

  AppTheme _getTheme(ThemeType type) {
    switch (type) {
      case ThemeType.pilot:
        return PilotTheme();
      case ThemeType.keystone:
        return KeystoneTheme();
    }
  }

  void _setTheme(ThemeType type) {
    setState(() {
      _currentTheme = type;
      _theme = _getTheme(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: _theme,
      themeType: _currentTheme,
      setTheme: _setTheme,
      child: widget.child,
    );
  }
}

/// Extension for easy theme access
extension ThemeContextExtension on BuildContext {
  AppTheme get appTheme => ThemeProvider.themeOf(this);
  ThemeType get themeType => ThemeProvider.of(this).themeType;
  void setTheme(ThemeType type) => ThemeProvider.of(this).setTheme(type);
}
