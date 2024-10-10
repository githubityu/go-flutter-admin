import 'package:flutter/material.dart';
import 'package:ityu_tools/util/export_util.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';

import '../gen/export_gen.dart';
import '../layout/export_layout.dart';
import '../local/dimens.dart';
import '../router/router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultLayout(
        route: RoutePath.error404,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding),
                    child: Text(
                      '404',
                      style: context.textTheme.displayMedium!.copyWith(
                        color: ColorName.warning,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                          child: Text(
                            context.L!.error404Title,
                            style: context.textTheme.titleLarge!.copyWith(
                              color: ColorName.warning,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                          child: Text(context.L!.error404Message),
                        ),
                        SizedBox(
                          height: 36.0,
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: () => userAppRouter().go(RoutePath.home),
                            child: Text(context.L!.homePage),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
