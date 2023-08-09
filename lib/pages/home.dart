//import 'package:david/pages/update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:koksapp/pages/activity_feed.dart';
import 'package:david/pages/profile.dart';
import 'package:david/pages/search.dart';
import 'package:david/pages/timeline.dart';
import 'package:david/pages/upload.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    //Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account!);
    }, onError: (err) {
      // ignore: avoid_print
      print('Error signing in: $err');
    });
    // Reauthentic user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account!);
    }).catchError((err) {
      // ignore: avoid_print
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    // ignore: unnecessary_null_comparison
    if (account != null) {
      // ignore: avoid_print
      print('User signed in!: $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  void logoutAndRedirect() async {
    logout();

    // Wait for user to sign in again after logging out
    await googleSignIn.signIn();

    // Check if the user is authenticated after signing in again
    bool userAuthenticated = await googleSignIn.isSignedIn();

    // Navigate to the appropriate screen based on the authentication status
    if (userAuthenticated) {
      // User is authenticated, go to the authenticated screen
      setState(() {
        isAuth = true;
      });
      pageController
          .jumpToPage(0); // Go to the first page after logging in again
    } else {
      // User is not authenticated, go to the unauthenticated screen
      setState(() {
        isAuth = false;
      });
    }
  }

  Widget buildDrawer() {
    GoogleSignInAccount? currentUser = googleSignIn.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              currentUser?.displayName ?? 'User Name',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              currentUser?.email ?? 'user@example.com',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(currentUser?.photoUrl ?? ''),
            ),
          ),
          // Drawer header with user details if needed
          // DrawerHeader(
          //   child: Text('User Details'),
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          // ),
          const SizedBox(height: 30),
          // Drawer items
          ListTile(
            // ignore: prefer_const_constructors
            leading: Icon(Icons.logout),
            // ignore: prefer_const_constructors
            title: Text('Logout'),
            onTap: logoutAndRedirect,
          ),
          // ListTile(
          //   // Add this ListTile for the "Updates" option
          //   leading: const Icon(Icons.notifications),
          //   title: const Text('Updates'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             const NotificationPage(), // Navigate to the NotificationPage
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
          'assets/images/boosted20.PNG',
          height: 36,
        )),
        // Add hamburger icon to open the drawer
        leading: Builder(
          builder: (context) => IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: buildDrawer(), // Add the drawer here
      body: PageView(
        // ignore: sort_child_properties_last
        children: const <Widget>[
          Timeline(),
          //NotificationPage(),
          Upload(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications_active),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
    // return ElevatedButton(
    //   onPressed: logout,
    //   child: const Text('Logout'),
    // );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal,
              Colors.purple,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'boosted technologies',
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              // ignore: avoid_print
              onTap: login,
              child: Container(
                width: 260.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/btn_google_signin_dark_focus_web.PNG'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
