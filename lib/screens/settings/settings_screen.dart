import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _locationServices = true;
  String _language = 'English';
  String _currency = 'USD';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferences',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Push notifications'),
              subtitle: const Text('Booking updates and travel deals'),
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v),
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              subtitle: const Text('Use dark theme across the app'),
              value: _darkMode,
              onChanged: (v) => setState(() => _darkMode = v),
            ),
            SwitchListTile(
              title: const Text('Location services'),
              subtitle: const Text('Show nearby destinations and deals'),
              value: _locationServices,
              onChanged: (v) => setState(() => _locationServices = v),
            ),
            const SizedBox(height: 24),
            Text(
              'Regional',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.language_rounded),
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: _language,
                underline: const SizedBox.shrink(),
                items: ['English', 'French', 'Spanish', 'Arabic']
                    .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _language = v);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money_rounded),
              title: const Text('Currency'),
              trailing: DropdownButton<String>(
                value: _currency,
                underline: const SizedBox.shrink(),
                items: ['USD', 'EUR', 'GBP', 'GHS']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _currency = v);
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Account',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: Icon(Icons.lock_outline, color: theme.colorScheme.primary),
              title: const Text('Change password'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: theme.colorScheme.primary),
              title: const Text('Privacy policy'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline_rounded, color: theme.colorScheme.primary),
              title: const Text('Help & support'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => context.go('/login'),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
                side: BorderSide(color: theme.colorScheme.error),
              ),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
