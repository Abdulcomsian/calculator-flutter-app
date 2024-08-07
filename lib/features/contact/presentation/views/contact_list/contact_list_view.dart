import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/common/widgets/user_avatar.dart';
import 'package:calculator_flutter_app/features/premium/domain/models/card/card_model.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ContactListView extends ConsumerWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackButtonWidget(
              title: 'Contact List',
              icon: Icon(
                Icons.search,
                size: 24.r,
                color: R.colors.black,
              ),
            ),
            31.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              text: 'Your Friends',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            8.hb,
                            AppText(
                              text: '24 Contacts',
                              fontSize: 14,
                              color: R.colors.secondary.withOpacity(0.6),
                            )
                          ],
                        ),
                        const Spacer(),
                        AppFilledButton(
                          text: '+ Add Contact',
                          width: 142,
                          onTap: () {
                            GoRouter.of(context).push(RoutePaths.addContact);
                          },
                        ),
                      ],
                    ),
                    39.hb,
                    Column(
                      children: List.generate(24, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 28.h),
                          child: Row(
                            children: [
                              UserProfileAvatar(
                                image:
                                    'https://randomuser.me/api/portraits/men/${index}.jpg',
                                size: 54.r,
                              ),
                              12.wb,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppText(
                                    text: 'MJ Price',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  AppText(
                                    text: '+92 35 4857154',
                                    fontSize: 12,
                                    color: R.colors.secondary.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Assets.svgs.deleteIcon.svg(),
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required CardModel card,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? R.colors.primary : R.colors.greyTextField,
          ),
          color: R.colors.greyTextField,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          leading: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Image.asset(
              card.icon,
              height: 15.h,
              width: 38.w,
            ),
          ),
          title: AppText(
            text: card.name,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          subtitle: AppText(
            text: card.number,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: R.colors.secondary.withOpacity(0.5),
          ),
          trailing: isSelected
              ? CircleAvatar(
                  radius: 12.r,
                  backgroundColor: R.colors.primary,
                  child: Icon(
                    Icons.check,
                    size: 18.r,
                    color: R.colors.white,
                  ),
                )
              : Icon(
                  Icons.radio_button_off,
                  size: 28.r,
                  color: R.colors.secondary.withOpacity(0.4),
                ),
        ),
      ),
    );
  }
}
