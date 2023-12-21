import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kot/payment_verification/successfull_page.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 5.0,
        toolbarHeight: 125,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {},
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Table No.01',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            TextButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text(
                'View Invoice',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 20.0 // Customize the text color
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
              colors: [Color(0XFFFF4D00), Color(0XFFFFB800)],
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.0),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
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
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ), // You can add more widgets like trailing, onTap, etc., as needed
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Collect Payment',
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Manual Settlement',
                  style: TextStyle(fontSize: 19.0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XD9D9D9), //BackGroundcolor
                  onPrimary: Colors.black, // Text color
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('images/card.png'),
                      const SizedBox(width: 8.0),
                      //  Text(
                      //   'Card', style: TextStyle(
                      //     fontSize: 18.0
                      // ),
                      // ),
                      const Text('Card',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XD9D9D9), //backgroundcolor
                  onPrimary: Colors.black, // Text color
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(image: AssetImage('images/cash.png')),
                      SizedBox(width: 8.0),
                      Text('Cash',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),

              // CustomButton(
              //   imagePath: 'assets/Group-removebg-preview.png',
              //   buttonText: 'Card',
              //   onPressed: () {
              //     // Handle button 1 press
              //     print('Button 1 pressed');
              //   },
              // ),
              // const SizedBox(
              //     width: 90,
              //   ),
              // CustomButton(
              //   imagePath: 'assets/Group__1_-removebg-preview.png',
              //   buttonText: 'Cash',
              //   onPressed: () {
              //     // Handle button 2 press
              //     print('Button 2 pressed');
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showConfirmationDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController paidController = TextEditingController();
      TextEditingController returnController = TextEditingController();
      TextEditingController tipController = TextEditingController();
      TextEditingController amountController = TextEditingController();
      return SingleChildScrollView(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          titlePadding: const EdgeInsets.all(0),
          // contentPadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                // Set the background color of the header
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                    colors: [Color(0XFFFF4D00), Color(0XFFFFB800)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            // color: Colors.deepOrange,
            height: 70,
            width: 130,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cash',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: paidController,
                decoration: const InputDecoration(
                    labelText: 'Customer Paid',
                    hintText: '0',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: returnController,
                decoration: const InputDecoration(
                    labelText: 'Return to Customer',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: tipController,
                decoration: const InputDecoration(
                    hintText: '0',
                    labelText: 'Enter Tip',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: amountController,
                decoration: const InputDecoration(
                    labelText: 'Enter Settlement Amount',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              Text(
                'Are you sure want to settle bill by cash?',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400]),
                      onPressed: () {
                        // Handle cancel logic here
                        Navigator.of(context).pop(); // Close the dialog
                        // _showCancelDialog();
                      },
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        side: const BorderSide(
                            width: 3, color: Colors.deepOrange),
                      ),
                      onPressed: () {
                        // Handle submit logic here
                        // Navigator.of(context).pop(); // Close the dialog
                        Navigator.of(context).pop(); // Close the success dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => paymentVerify()),
                        );
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
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
