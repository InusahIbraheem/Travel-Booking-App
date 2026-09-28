import 'package:flutter/material.dart';

class TravelSearchBar extends StatelessWidget {
  const TravelSearchBar({
    super.key,
    this.hintText = 'Search destinations, hotels...',
    this.onTap,
    this.readOnly = true,
    this.controller,
    this.onChanged,
  });

  final String hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search_rounded, color: theme.colorScheme.primary),
        suffixIcon: Icon(Icons.tune_rounded, color: theme.colorScheme.onSurfaceVariant),
      ),
    );
  }
}
