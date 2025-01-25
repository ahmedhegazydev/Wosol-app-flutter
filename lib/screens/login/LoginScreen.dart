import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../custom/Common.dart';
import '../../custom/CustomNetworkImage.dart';
import 'LoginState.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateProvider);
    final notifier = ref.read(loginStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              // SvgPicture.asset(
              //   'assets/icons/etec_logo_splash_screen.svg',
              //   width: 150,
              // ),
              logoView(),

              const SizedBox(height: 20),
              CustomNetworkImage(
                imageUrl: "imageUrl",
                height: 250,
                width: 250,
                fit: BoxFit.cover,
                // errorWidget: const Icon(
                //   Icons.broken_image,
                //   size: 100,
                //   color: Colors.grey,
                // ),
              ),

              const SizedBox(height: 20),
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
              ElevatedButton(
                onPressed: () => notifier.handleLogin(context),
                child: Text("Login"),
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