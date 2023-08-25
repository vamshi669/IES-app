import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String profileImageUrl = ''; // Set the profile image URL here
  bool isEditEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView to handle overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display image
              if (profileImageUrl.isNotEmpty)
                CircleAvatar(
                  radius: 40.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ClipOval(
                      child: Image.network(
                        profileImageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              if (profileImageUrl.isEmpty)
                Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                  size: 54.0,
                ),
              TextButton(
                onPressed: isEditEnabled ? pickAndUploadImage : null,
                child: const Text('Select Photo'),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                enabled: isEditEnabled,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: rollNumberController,
                decoration: const InputDecoration(labelText: 'USN'),
                enabled: isEditEnabled,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your USN.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                enabled: true, // Set enabled to true to make it editable
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                enabled: isEditEnabled,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: isEditEnabled ? saveUserData : enableEdit,
                child: Text(isEditEnabled ? 'Submit' : 'Edit'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: showChangePasswordSection,
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pickAndUploadImage() async {
    // Implement picking and uploading image functionality here
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImageUrl = pickedFile.path;
      });
    }
  }

  void saveUserData() {
    // Implement saving user data functionality here
  }

  void enableEdit() {
    setState(() {
      isEditEnabled = true;
    });
  }

  void showChangePasswordSection() {
    // Implement showing change password section functionality here
  }
}
