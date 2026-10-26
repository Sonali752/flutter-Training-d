import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // This is a sample balance; it resets when the app restarts.
  double balance = 1250.00;

  void changeBalance(double amount) {
    setState(() {
      balance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bank')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Available balance'),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => changeBalance(50),
              child: const Text('Deposit \$50'),
            ),
            ElevatedButton(
              onPressed: balance >= 50 ? () => changeBalance(-50) : null,
              child: const Text('Withdraw \$50'),
            ),
          ],
        ),
      ),
    );
  }
}
