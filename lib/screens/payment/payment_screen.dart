import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_booking_ui/core/utils/formatters.dart';
import 'package:travel_booking_ui/core/utils/responsive.dart';
import 'package:travel_booking_ui/router/routes.dart';
import 'package:travel_booking_ui/widgets/app_scaffold.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.amount, required this.title});

  final double amount;
  final String title;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardController = TextEditingController(text: '4532 1234 5678 9010');
  final _nameController = TextEditingController(text: 'Ibraheem Inusah');
  final _expiryController = TextEditingController(text: '08/28');
  final _cvvController = TextEditingController(text: '123');
  int _paymentMethod = 0;
  bool _isProcessing = false;

  @override
  void dispose() {
    _cardController.dispose();
    _nameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Future<void> _pay() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isProcessing = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isProcessing = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment of ${Formatters.currency(widget.amount)} successful!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    context.go(AppRoutes.tickets);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: theme.colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                          ),
                          Text(
                            'Total amount',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        Formatters.currency(widget.amount),
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95)),
              const SizedBox(height: 24),
              Text(
                'Payment method',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Card'), icon: Icon(Icons.credit_card)),
                  ButtonSegment(value: 1, label: Text('Mobile'), icon: Icon(Icons.phone_android)),
                ],
                selected: {_paymentMethod},
                onSelectionChanged: (set) => setState(() => _paymentMethod = set.first),
              ),
              const SizedBox(height: 24),
              if (_paymentMethod == 0) ...[
                TextFormField(
                  controller: _cardController,
                  decoration: const InputDecoration(
                    labelText: 'Card number',
                    prefixIcon: Icon(Icons.credit_card_outlined),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (v) => (v == null || v.length < 12) ? 'Enter valid card number' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Cardholder name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? 'Enter name' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryController,
                        decoration: const InputDecoration(labelText: 'Expiry'),
                        validator: (v) => (v == null || v.length < 4) ? 'MM/YY' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        decoration: const InputDecoration(labelText: 'CVV'),
                        obscureText: true,
                        validator: (v) => (v == null || v.length < 3) ? 'CVV' : null,
                      ),
                    ),
                  ],
                ),
              ] else
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile money number',
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (v) => (v == null || v.length < 10) ? 'Enter phone number' : null,
                ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _isProcessing ? null : _pay,
                child: _isProcessing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text('Pay ${Formatters.currency(widget.amount)}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
