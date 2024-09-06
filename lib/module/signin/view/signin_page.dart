import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';
import 'package:me_chat/component/widget/close_keyboard.dart';
import 'package:me_chat/component/widget/filled_button_custom.dart';
import 'package:me_chat/component/widget/text_field_custom.dart';
import 'package:me_chat/module/navigation/view/navigation_page.dart';
import 'package:me_chat/module/signup/view/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const routePath = '/';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboard.close(context),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/logo_mechat.png'),
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                  Text(
                    'Welcome to MeChat',
                    style: context.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const TextFieldCustom(
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                  TextFieldCustom(
                    onSuffixTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    suffixIcon: SvgPicture.asset(
                      obscureText
                          ? 'assets/svg/hide.svg'
                          : 'assets/svg/show.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.kPrimaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Password',
                    obscureText: obscureText,
                  ),
                  const SizedBox(height: AppSpacing.xlg * 3),
                  FilledButtonCustom(
                    onPressed: () {
                      context.push(NavigationPage.routePath);
                    },
                    text: 'Sign In',
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: AppColors.kColorGray600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.push(SignUpPage.routePath);
                        },
                        child: Text(
                          'Sign Up',
                          style: context.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
