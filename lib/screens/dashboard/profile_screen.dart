import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeInAnimation =
        Tween<double>(begin: 0, end: 1).animate(_fadeInController);
    _fadeInController.forward();
  }

  @override
  void dispose() {
    _fadeInController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedBuilder(
                  animation: _fadeInAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeInAnimation.value,
                      child: Container(
                        height: constraints.maxHeight * 0.35,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(70)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.orange, // Replace with your desired color
                              Colors.deepOrangeAccent, // Replace with your desired color
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: constraints.maxHeight * 0.076,
                              left: 10,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context); // Go back to the previous page
                                },
                              ),
                            ),
                            Positioned(
                              bottom: constraints.maxHeight * 0.23,
                              left: constraints.maxWidth * 0.42,
                              child: FadeTransition(
                                opacity: _fadeInAnimation,
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: constraints.maxHeight * 0.11,
                              left: constraints.maxWidth * 0.45,
                              child: FadeTransition(
                                opacity: _fadeInAnimation,
                                child: Text(
                                  'Atharva Gawali',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Department',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: departmentController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your department',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: addressController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your address',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Shop Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: shopNameController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your shop name',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Mobile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: mobileController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your mobile number',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: dobController,
                        enabled: isEditing,
                        decoration: InputDecoration(
                          hintText: 'Enter your date of birth',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _toggleEditing();
                        },
                        child: Text(
                          isEditing ? 'Save' : 'Edit',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}
