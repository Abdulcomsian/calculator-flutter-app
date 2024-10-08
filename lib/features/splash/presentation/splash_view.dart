import 'package:calculator_flutter_app/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), navigate);
  }

  Future<void> navigate() async {
    final bearer = await ref.read(bearerTokenProvider.future);

    if (!mounted) return;

    if (bearer == null) {
      GoRouter.of(context).pushReplacement(RoutePaths.login);
      return;
    }

    GoRouter.of(context).pushReplacement(RoutePaths.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              R.colors.primary,
              R.colors.primary2,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 110.w),
          child: SizedBox(
            child: Assets.pngs.splashText.image(
              height: 170.h,
              width: 154.w,
            ),
          ),
        ),
      ),
    );
  }
}
