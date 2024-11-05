import 'package:idly_factory/controllers/signup_login_controllers/signin_controllers.dart';
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/services/auth_service/signin_service/signin_apiservice.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    final SliverAppBarController appBarController = Get.put(SliverAppBarController());
    final SignInController _signInController = Get.put(SignInController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButtons(
          icon: Icons.arrow_back,
          onPressed: () => Navigator.popAndPushNamed(context, "/mainPage"),
        ),
        title: Obx(() => AnimatedOpacity(
          opacity: appBarController.isShow.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Text("Account", style: AppTextStyle.subHeadLineH2),
        )),
        actions: [
          IconButtons(
            icon: AppIcons.chatMessage,
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        controller: appBarController.scrollController,
        slivers: [
          SliverAppbar(text: "Account", isShow: appBarController.isShow.value),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ProfileCard(
                  imagePath: "assets/images/logo/coffee-app.png",
                  title: "Join now to order ahead, save time & earn rewards!",
                  buttonLabel1: "Join Now",
                  onButtonPressed1: () {
                   Get.to( const SignupPage(initialTabIndex: 0,));
                  },
                  buttonLabel2: "Sign In",
                  onButtonPressed2: () {
                    Get.to( const SignupPage(initialTabIndex: 1,));
                  },
                ),

                SizedBox(height: 20),
                buildSupportCard(),
                SizedBox(height: 20),
                buildSettingsCard(),
                SizedBox(height: 20),
                buildRewardsCard(),
                SizedBox(height: 20),
                buildInformationCard(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("Sign in or Create an account", style: AppTextStyle.errorMessages),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSupportCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Support".tr, style: AppTextStyle.sectionTitlesH3),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: Text("How Can we help?".tr),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
              onTap: (){
                setState(() {
                  Get.to(Support());
                });},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings", style: TextStyle(fontSize: 18)),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Language and Region"),
                  Text("English(USA)"),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRewardsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rewards & Payment", style: TextStyle(fontSize: 18)),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Tims Rewards"),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInformationCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Information", style: TextStyle(fontSize: 18)),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.kayaking),
                  title: Text("Allergens"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
                Divider(color: Colors.brown, thickness: 0.5,height: 0.5,),
                ListTile(
                  leading: Icon(Icons.sticky_note_2_sharp),
                  title: Text("Terms and Privacy"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String buttonLabel1;
  final String buttonLabel2;
  final VoidCallback onButtonPressed1;
  final VoidCallback onButtonPressed2;

  const ProfileCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.buttonLabel1,
    required this.onButtonPressed1,
    required this.buttonLabel2,
    required this.onButtonPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Aligns buttons to the start
                children: [
                  ElevatedButton(
                    onPressed: onButtonPressed1,
                    child: Text(buttonLabel1),
                  ),
                  SizedBox(width: 10), // Adds space between buttons
                  TextButton(
                    onPressed: onButtonPressed2,
                    child: Text(buttonLabel2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileController extends GetxController {
  var user = UserModel(email: '', isSignedIn: false).obs;

  void updateUser(String email, bool isSignedIn) {
    user.update((val) {
      val?.email = email;
      val?.isSignedIn = isSignedIn;
    });
  }
}

// models/user_model.dart
class UserModel {
  late final String email;
  late final bool isSignedIn;

  UserModel({required this.email, required this.isSignedIn});
}
