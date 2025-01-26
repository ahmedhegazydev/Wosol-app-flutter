import 'package:flutter/material.dart';
import 'package:flutter_apps/utils/Constants.dart';
import 'package:flutter_apps/utils/HexColor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../custom/Common.dart';
import '../../custom/CustomButton.dart';
import '../../custom/LabeledTextInput.dart';
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
                      width: 200,
                      height: 200,
                      fit:
                          BoxFit.contain,
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

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: HexColor("#4C3C8D"),
                        fontFamily: Fonts.contentRegular16.fontFamily,
                        fontSize: Fonts.contentRegular16.fontSize,
                        height: Fonts.contentRegular16.lineHeight /
                            Fonts.contentRegular16.fontSize,
                        fontWeight: Fonts.contentRegular16.fontWeight,
                      ),
                    ),
                    // Vertical Divider
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.purple,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                    ),

                    Text(
                      'الدخول السريع',
                      style: TextStyle(
                        color: HexColor("#4C3C8D"),
                        fontFamily: Fonts.contentRegular16.fontFamily,
                        fontSize: Fonts.contentRegular16.fontSize,
                        height: Fonts.contentRegular16.lineHeight /
                            Fonts.contentRegular16.fontSize,
                        fontWeight: Fonts.contentRegular16.fontWeight,
                      ),
                    ),
                  ],),

                    const SizedBox(height: 20),

                    LabeledTextInput(
                      // value: "a.ali@dev",
                      placeholder: "اسم المستخدم",
                      secureTextEntry: false,
                      isRequired: true,
                      onChangeText: (value) {
                        // notifier.updateUsername(value);
                      },
                    ),

                    const SizedBox(height: 10),

                    LabeledTextInput(
                      // value: "Wosol2030@",
                      placeholder: "كلمة المرور",
                      secureTextEntry: true,
                      isRequired: true,
                      onChangeText: (value) {
                        // notifier.updatePassword(value);
                      },
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          WebViewUtils.pressLink(
                              Constants.FORGET_PASSWORD_URL, context);
                        },
                        child: Text(
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
                          textAlign: TextAlign.end, // Ensures text is centered
                        ),
                      ),
                    ),


                    const SizedBox(height: 150),
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
