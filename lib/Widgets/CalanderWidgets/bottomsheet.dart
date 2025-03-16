import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tournament/Models/Task.dart';
import 'package:flutter_tournament/Providers/TasksProvider.dart';
import 'package:google_fonts/google_fonts.dart';


class MyBottomSheet extends ConsumerStatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends ConsumerState<MyBottomSheet> {
  final textController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // Initialize with the current date

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                'Add Task',
                style: GoogleFonts.rubik(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Task Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Select Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style:  GoogleFonts.rubik(
                      color: Color.fromARGB(255, 77, 75, 75),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(34, 56, 67, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      _selectDate(context);
                    },
                    child:  Text('Pick Date', style: GoogleFonts.rubik(),),
                  ),
                  Spacer(),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        side: BorderSide(
                          color: Color.fromRGBO(34, 56, 67, 1),
                        ),
                        foregroundColor: Color.fromRGBO(34, 56, 67, 1)),
                    onPressed: () {
                      // Add your logic to save the task or perform any action
                      ref.read(fDutiesProvider.notifier).addTask(Task(
                          title: textController.text, date: _selectedDate));
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child:  Text('Save', style: GoogleFonts.rubik(),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary:Color.fromRGBO(34, 56, 67, 1),
              
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
