import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';




class ScholarshipForm extends StatefulWidget {
  @override
  _ScholarshipFormState createState() => _ScholarshipFormState();
}

class _ScholarshipFormState extends State<ScholarshipForm> {
  final _formKey = GlobalKey<FormState>();
  PickedFile? _pickedFile;
  PickedFile? _signaturePhoto;
  DateTime? _selectedDate;
  DateTime? _submissionDate;
  TextEditingController parentEmailController = TextEditingController();
  TextEditingController parentMobileController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController permanentPinCodeController = TextEditingController();
  TextEditingController officeTelephoneController = TextEditingController();
  TextEditingController officeStateController = TextEditingController();
  TextEditingController officeCountryController = TextEditingController();
  TextEditingController institutionNameController = TextEditingController();
  TextEditingController boardNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController maxMarksController = TextEditingController();
  TextEditingController percentageScoredController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController applicantNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController correspondenceAddressController = TextEditingController();
  TextEditingController telResidenceController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentOccupationController = TextEditingController();
  TextEditingController parentIncomeController = TextEditingController();
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('scholarship_forms').add({

          'name': nameController.text,
          'email': emailController.text,
          'gender': selectedGender,
          'dob': _selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : '',
          'religion': religionController.text,
          'category': selectedCategory,
          'nationality': selectedNationality,
          'correspondenceAddress': correspondenceAddressController.text,
          'telResidence': telResidenceController.text,
          'mobile': mobileController.text,
          'parentName': parentNameController.text,
          'parentOccupation': parentOccupationController.text,
          'parentIncome': parentIncomeController.text,
          'parentEmail': parentEmailController.text,
          'parentMobile': parentMobileController.text,
          'permanentAddress': permanentAddressController.text,
          'permanentPinCode': permanentPinCodeController.text,
          'officeTelephone': officeTelephoneController.text,
          'officeState': officeStateController.text,
          'officeCountry': officeCountryController.text,
          'institutionName': institutionNameController.text,
          'boardName': boardNameController.text,
          'course': courseController.text,
          'semester': semesterController.text,
          'maxMarks': maxMarksController.text,
          'percentageScored': percentageScoredController.text,
          'grade': gradeController.text,
          'applicantName': applicantNameController.text,
          'declarationAccepted': declarationAccepted,
          'submissionDate': _submissionDate != null ? DateFormat('yyyy-MM-dd').format(_submissionDate!) : '',
          // Add other fields similarly
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form submitted successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting form: $e')),
        );
      }
    }
  }

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> catergoryOptions = ['GM', 'SC', 'ST', 'OBC', 'Minority'];
  List<String> NationalityOptions = ['Indian', 'NRI', 'Foreign National (Citizenship)'];
  String? selectedGender;
  String? selectedCategory;
  String? selectedNationality;
  bool declarationAccepted = false;

  bool _isCardExpanded = false;

  Widget _sizedBox(PickedFile? pickedFile) {
    if (pickedFile != null) {
      return SizedBox(
        height: 200,
        child: Image.file(File(pickedFile.path)),
      );
    } else {
      return SizedBox();
    }
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _pickedFile = pickedFile;
    });
  }

  void _pickSignaturePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _signaturePhoto = pickedFile;
    });
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectSubmissionDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _submissionDate) {
      setState(() {
        _submissionDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Center(
          child: Text(
            'Scholarship Application Form',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isCardExpanded = !_isCardExpanded;
            });
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Fill Personal Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_isCardExpanded) ...[
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Upload Passport Photo'),
                    ),
                    _sizedBox(_pickedFile),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      items: genderOptions.map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      decoration: InputDecoration(labelText: 'Gender'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                      readOnly: true,
                      onTap: _selectDate,
                      controller: TextEditingController(
                        text: _selectedDate != null ? DateFormat('yyyy-MM-dd')
                            .format(_selectedDate!) : '',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Religion'),
                      controller: religionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your religion';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: catergoryOptions.map((Category) {
                        return DropdownMenuItem<String>(
                          value: Category,
                          child: Text(Category),
                        );
                      }).toList(),
                      decoration: InputDecoration(labelText: 'Category'),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedNationality,
                      onChanged: (newValue) {
                        setState(() {
                          selectedNationality = newValue;
                        });
                      },
                      items: NationalityOptions.map((Nationality) {
                        return DropdownMenuItem<String>(
                          value: Nationality,
                          child: Text(Nationality),
                        );
                      }).toList(),
                      decoration: InputDecoration(labelText: 'Nationality'),
                    ),

                    TextFormField(
                      decoration: InputDecoration(labelText: 'Correspondence Address'),
                      controller: correspondenceAddressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Correspondence Address';
                        }
                        return null;
                      },
                      //inputFormatters: [
                      //FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      //],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Mobile Number'),
                      keyboardType: TextInputType.number,
                      controller: mobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Mobile Number';
                        }
                        // Additional validation logic if needed
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),// Allow only digits
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'E-Mail'),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Invalid email format';
                        }
                        return null; // Return null to indicate no error
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Parents's/Gurdaian's Contact Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Parents's/Gurdaian's Name"),
                      controller: parentNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Occupation'),
                      controller:parentOccupationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Occupation';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Income'),
                      keyboardType: TextInputType.number,
                      controller: parentIncomeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Income';
                        }
                        // Additional validation logic if needed
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Parents E-Mail'),
                      controller:  parentEmailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Invalid email format';
                        }
                        return null; // Return null to indicate no error
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Parent's/Guardian's Mobile Number"),
                      keyboardType: TextInputType.number,
                      controller: parentMobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Mobile Number';
                        }
                        // Additional validation logic if needed
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),// Allow only digits
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Permanent Address'),
                      controller:permanentAddressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Permanent Address';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Telephone (Office) (with STD/ISD code)'),
                      keyboardType: TextInputType.number,
                      controller:officeTelephoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Semester';
                        }
                        // Additional validation logic if needed
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(14),// Allow only digits
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Your Educational Qualifications'),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name of Institution and address'),
                      controller: institutionNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name of Institution and address';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name of Board'),
                      controller:boardNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name of Board';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Course'),
                      controller:courseController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Course';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Maximum marks obtained'),
                      keyboardType: TextInputType.number,
                      controller: maxMarksController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Maximum marks obtained';
                        }
                        // Additional validation logic if needed
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),// Allow only digits
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Percentage Scored'),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      controller: percentageScoredController, // Use your controller here
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Percentage Scored';
                        }
                        final double? percentage = double.tryParse(value);
                        if (percentage == null || percentage < 0 || percentage > 100) {
                          return 'Please enter a valid percentage between 0 and 100';
                        }
                        return null; // Return null to indicate no error
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grade'),
                      controller:gradeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Grade';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name of the Applicant'),
                      controller:applicantNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name of the Applicant';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                      ],
                    ),

                    Text(
                      'I am fully aware of and abide by the rules and regulations regarding the Scholarship. I understand that my scholarship will be granted only if I apply and take admission through IES. Further, I declare that the information furnished by me is correct.',
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: _pickSignaturePhoto,
                      child: Text('Upload Signature Photo'),
                    ),
                    _sizedBox(_signaturePhoto),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Signature",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Date of Submission'),
                      readOnly: true,
                      onTap: _selectSubmissionDate,
                      controller: TextEditingController(
                        text: _submissionDate != null ? DateFormat('yyyy-MM-dd').format(_submissionDate!) : '',
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Validate the form and show the warning messages if needed
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, proceed with submission
                          // You can add your submission logic here
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
