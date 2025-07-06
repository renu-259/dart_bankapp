import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BankApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class BankApp extends StatefulWidget {
  @override
  _BankAppState createState() => _BankAppState();
}

class _BankAppState extends State<BankApp> {
  double balance = 0.0; // Initial balance
  TextEditingController amountController = TextEditingController();

  void deposit() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    setState(() {
      balance += amount;
    });
    amountController.clear();
  }

  void withdraw() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount > balance) {
      showMessage("Insufficient balance");
    } else {
      setState(() {
        balance -= amount;
      });
    }
    amountController.clear();
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank App"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Balance: ₹ ${balance.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Amount",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: deposit,
                  child: Text("Deposit"),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 223, 215, 61)),
                ),
                ElevatedButton(
                  onPressed: withdraw,
                  child: Text("Withdraw"),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 38, 191, 135)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
