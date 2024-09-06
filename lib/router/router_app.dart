import 'package:go_router/go_router.dart';
import 'package:me_chat/module/chat/view/chat_detail_page.dart';
import 'package:me_chat/module/navigation/view/navigation_page.dart';
import 'package:me_chat/module/signin/view/signin_page.dart';
import 'package:me_chat/module/signup/view/sign_up_page.dart';

class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: SignInPage.routePath,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: SignUpPage.routePath,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: NavigationPage.routePath,
        builder: (context, state) => const NavigationPage(),
      ),
      GoRoute(
        path: ChatDetailPage.routePath,
        builder: (context, state) => const ChatDetailPage(),
      ),
    ],
  );
}
