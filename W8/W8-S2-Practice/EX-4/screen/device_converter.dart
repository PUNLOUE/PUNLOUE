 import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  // Controllers
  final TextEditingController _dollarController = TextEditingController();
  
  // Default values
  String? selectedDevice = "EURO";  // Default selection (can be changed to others)
  double convertedAmount = 0.0; // To hold the converted amount

  // Exchange rates
  final Map<String, double> exchangeRates = {
    "EURO": 0.9,    // Example exchange rate for Euro
    "RIELS": 4060,   // Example exchange rate for Riels (Cambodia)
    "DONG": 23200,   // Example exchange rate for Dong (Vietnam)
  };

  @override
  void initState() {
    super.initState();
  }

  // Convert the amount in dollars to the selected device
  void convertAmount() {
    double dollars = double.tryParse(_dollarController.text) ?? 0.0;
    setState(() {
      convertedAmount = dollars * (exchangeRates[selectedDevice] ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),

            // Dollar input field with validation
            TextField(
              controller: _dollarController,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (_) => convertAmount(),  // Recalculate when input changes
            ),
            const SizedBox(height: 30),

            // Device dropdown
            const Text("Device:"),
            DropdownButton<String>(
              value: selectedDevice,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDevice = newValue!;
                  convertAmount();  // Recalculate when device changes
                });
              },
              items: <String>["EURO", "RIELS", "DONG"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),

            // Display the converted amount as an integer
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                convertedAmount > 0
                    ? "${convertedAmount.toInt()}"  // Converted to integer
                    : "Enter an amount to convert",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
