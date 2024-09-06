import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';
import 'package:me_chat/component/widget/close_keyboard.dart';
import 'package:me_chat/component/widget/filled_button_custom.dart';
import 'package:me_chat/component/widget/text_field_custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routePath = '/signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscureText = true;
  bool obscureTextConfirm = true;

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
                  const SizedBox(height: AppSpacing.xlg),
                  TextFieldCustom(
                    onSuffixTap: () {
                      setState(() {
                        obscureTextConfirm = !obscureTextConfirm;
                      });
                    },
                    suffixIcon: SvgPicture.asset(
                      obscureTextConfirm
                          ? 'assets/svg/hide.svg'
                          : 'assets/svg/show.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.kPrimaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Confirm Password',
                    obscureText: obscureTextConfirm,
                  ),
                  const SizedBox(height: AppSpacing.xlg * 3),
                  FilledButtonCustom(
                    onPressed: () {},
                    text: 'Sign Up',
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: AppColors.kColorGray600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Text(
                          'Sign In',
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
