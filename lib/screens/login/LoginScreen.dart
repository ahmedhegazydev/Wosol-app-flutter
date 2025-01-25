import 'package:flutter/material.dart';
import 'package:flutter_apps/utils/HexColor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../custom/Common.dart';
import '../../custom/CustomButton.dart';
import '../../utils/Common.dart';
import '../../utils/FontStyle.dart';
import 'LoginState.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateProvider);
    final notifier = ref.read(loginStateProvider.notifier);

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Login", style: TextStyle(color: Colors.white)),
      // ),
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    logoView(),

                    const SizedBox(height: 20),

                    Image.asset(
                      'assets/images/lock.png',
                      width: 200, // Optional: Specify width
                      height: 200, // Optional: Specify height
                      fit:
                          BoxFit.contain, // Optional: Adjust how the image fits
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      state.textResources?['data']?.firstWhere(
                            (item) => (item['ItemFields']['Language'] == 'ar' &&
                                item['ItemFields']['TextKey'] == 'Login'),
                            orElse: () => null,
                          )?['ItemFields']['TextValue'] ??
                          'Welcome Message 1',
                      style: TextStyle(
                        color: HexColor("#4C3C8D"),
                        fontFamily: Fonts.titleBold28.fontFamily,
                        fontSize: Fonts.titleBold28.fontSize,
                        height: Fonts.titleBold28.lineHeight /
                            Fonts.titleBold28.fontSize,
                        fontWeight: Fonts.titleBold28.fontWeight,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      state.textResources?['data']?.firstWhere(
                            (item) => (item['ItemFields']['Language'] == 'ar' &&
                                item['ItemFields']['TextKey'] ==
                                    'WelcomeLetter'),
                            orElse: () => null,
                          )?['ItemFields']['TextValue'] ??
                          'Welcome Message 2',
                      style: TextStyle(
                        color: HexColor("#6C609D"),
                        fontFamily: Fonts.subTitleRegular20.fontFamily,
                        fontSize: Fonts.subTitleRegular20.fontSize,
                        height: Fonts.subTitleRegular20.lineHeight /
                            Fonts.subTitleRegular20.fontSize,
                        fontWeight: Fonts.subTitleRegular20.fontWeight,
                      ),
                    ),

                    const SizedBox(height: 20),
                    // MaterialSegmentedControl(
                    //   children: state.tabsLoginTypes,
                    //   selectionIndex: state.currentLoginTypeSelection,
                    //   borderColor: Colors.grey,
                    //   selectedColor: Colors.redAccent,
                    //   unselectedColor: Colors.white,
                    //   selectedTextStyle: TextStyle(color: Colors.white),
                    //   unselectedTextStyle: TextStyle(color: Colors.redAccent),
                    //   borderWidth: 0.7,
                    //   borderRadius: 32.0,
                    //   disabledChildren: [3],
                    //   onSegmentTapped: (index) {
                    //     notifier.updateCurrentIndex(index);
                    //   },
                    // ),

                    TextField(
                      controller: state.usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: state.passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        WebViewUtils.pressLink(
                            'https://selfservice.etec.gov.sa/', context);
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        state.textResources?['data']?.firstWhere(
                              (item) =>
                                  (item['ItemFields']['Language'] == 'ar' &&
                                      item['ItemFields']['TextKey'] ==
                                          'ForgetPassword'),
                              orElse: () => null,
                            )?['ItemFields']['TextValue'] ??
                            'Welcome Message 1',
                        style: TextStyle(
                          color: HexColor("#4C3C8D"),
                          fontFamily: Fonts.contentMedium16.fontFamily,
                          fontSize: Fonts.contentMedium16.fontSize,
                          height: Fonts.contentMedium16.lineHeight /
                              Fonts.contentMedium16.fontSize,
                          fontWeight: Fonts.contentMedium16.fontWeight,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () => notifier.handleLogin(context),
                    //   child: Text("Login"),
                    // ),
                    CustomButton(
                      title: state.textResources?['data']?.firstWhere(
                            (item) => (item['ItemFields']['Language'] == 'ar' &&
                                item['ItemFields']['TextKey'] == 'Login'),
                            orElse: () => null,
                          )?['ItemFields']['TextValue'] ??
                          'Welcome Message 3',
                      onPress: () {
                        print('Button Pressed');
                      },
                      loading: false,
                      disabled: false,
                      // passedIcon: Icon(Icons.check, color: Colors.white),
                      backgroundColor: "#4C3C8D",
                    ),

                    if (state.showBiometricsButton)
                      ElevatedButton.icon(
                        onPressed: () => notifier.handleBiometricLogin(context),
                        icon: Icon(Icons.fingerprint),
                        label: Text("Login with Biometrics"),
                      ),
                    if (state.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          state.errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
