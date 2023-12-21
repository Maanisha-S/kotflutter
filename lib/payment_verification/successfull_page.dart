import 'package:flutter/material.dart';
import 'package:kot/table_engaged/table.dart';

import '../tables/ui/all_tables_page.dart';

class paymentVerify extends StatefulWidget {
  const paymentVerify({super.key});

  @override
  State<paymentVerify> createState() => _paymentVerifyState();
}

class _paymentVerifyState extends State<paymentVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5.0,
        toolbarHeight: 120,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Table No.01',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              width: 46,
            ),
            TextButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text(
                'View Invoice',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20 // Customize the text color
                    ),
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.red, Colors.orange],
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.0),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "₹150.00",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40.0),
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.deepOrangeAccent.shade100,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // elevation: 4.0,
                child: const ListTile(
                  leading: Icon(Icons.check_circle_outline_outlined,
                      size: 30.0, color: Colors.green),
                  title: Text(
                    'Your bill is printed successfully please collect it on assigned printer ',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset('images/tick.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Payment Successfull',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '₹150.00',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 40,
          ),
          // ElevatedButton(onPressed: (){},
          //   child: Text('Close'),
          // )
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              minimumSize: const Size(150, 40),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the success dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstTables()),
              );
            },
            child: const Text(
              'Close',
              style: TextStyle(fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            _buildDetailRow('Date:', '2023-12-11'),
            _buildDetailRow('Time:', '19:30'),
            _buildDetailRow('Table Number:', '01'),
            const SizedBox(height: 56.0),
            const Center(
              child: Text(
                'Receipt',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(thickness: 2),
            _buildItemRow('ItemDetails', 'Qty', 'Price', 'Total'),
            const SizedBox(height: 16),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            const Divider(
              height: 4,
              thickness: 2,
            ),
            _buildMenuItem('Thai veg soup', 3, 150.00, 450.00),
            const Divider(
              thickness: 2,
            ),
            _buildMenuItem('Thai prawn soup', 3, 150.00, 450.00),
            const Divider(
              thickness: 2,
            ),
            _buildMenuItem('Thai Noodles soup', 3, 150.00, 450.00),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 16.0),
            _buildTotalColumn('subTotal', 1350.00),
            _buildTotalColumn('tax', 0.0),
            _buildTotalColumn('Total', 1350.00),
          ],
        ),
      );
    },
  );
}

Widget _buildDetailRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(value),
    ],
  );
}

Widget _buildItemRow(String itemName, String qty, String price, String Total) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(itemName),
      Text(qty),
      Text(price),
      Text(Total),
    ],
  );
}

Widget _buildMenuItem(
    String itemName, int quantity, double price, double total) {
  double total = quantity * price;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(itemName),
      Text('$quantity'),
      Text('\$$price'),
      Text('\$$total'),
    ],
  );
}

Widget _buildTotalColumn(String label, double totalAmount) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '\$$totalAmount',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

class CustomButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey, // Background color of the second container
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 80, // Adjust the image width as needed
              height: 80, // Adjust the image height as needed
            ),
            const SizedBox(
                height: 8), // Adjust the spacing between image and text
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
