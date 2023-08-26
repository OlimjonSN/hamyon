import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetWindow extends StatefulWidget {
  final Function addItemFunction;
  const BottomSheetWindow({required this.addItemFunction, super.key});

  @override
  State<BottomSheetWindow> createState() => _BottomSheetWindowState();
}

class _BottomSheetWindowState extends State<BottomSheetWindow> {
  DateTime? selectedDate;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void addExpense(context) {
    showDatePicker(context: context, helpText: 'harajat kuni tanlang', initialDate: selectedDate ?? DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime.now()).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  @override
  void dispose() {
    _titleController.clear();
    _priceController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 100),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Nima uchun',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Qancha',
                border: OutlineInputBorder(),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                selectedDate == null ? 'Xarajat kuni tanlanmadi' : 'Xarajat kuni: ${DateFormat('dd MMM yyyy').format(selectedDate!)}',
                style: const TextStyle(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {
                    addExpense(context);
                  },
                  child: const Text(
                    'KUNNI TANLASH',
                    style: TextStyle(color: Colors.blue),
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Icon tanlanmagan',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'ICON TANLASH',
                    style: TextStyle(color: Colors.blue),
                  ))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Bekor qilish',
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    )),
                const SizedBox(width: 18),
                ElevatedButton(
                    onPressed: () {
                      if (_titleController.text.isEmpty || _priceController.text.isEmpty || selectedDate == null || double.parse(_priceController.text) < 0) {
                        return;
                      }
                      setState(() {
                        widget.addItemFunction(name: _titleController.text, price: double.parse(_priceController.text), date: selectedDate!);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Qo\'shish')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
