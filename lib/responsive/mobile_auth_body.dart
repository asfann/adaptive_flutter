// ignore_for_file: unnecessary_statements

import 'package:adaptive_flutter/confirm_cubit/confirm_cubit.dart';
import 'package:adaptive_flutter/data/api_constants.dart';
import 'package:adaptive_flutter/data/base_dio_request.dart';
import 'package:adaptive_flutter/data/secure_storage_client.dart';
import 'package:adaptive_flutter/registration_cubit/registration_cubit.dart';
import 'package:adaptive_flutter/responsive/hi_page.dart';
import 'package:adaptive_flutter/widgets/advanced_button.dart';
import 'package:adaptive_flutter/widgets/text_form_field.dart';
import 'package:adaptive_flutter/widgets/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_count_down.dart';

class MobileAuthBody extends StatefulWidget {
  const MobileAuthBody({Key? key}) : super(key: key);

  @override
  State<MobileAuthBody> createState() => _MobileAuthBodyState();
}

class _MobileAuthBodyState extends State<MobileAuthBody> {
  bool isChecked = false;
  bool downCode = false;

  TextEditingController tokenController = TextEditingController();
  int count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      body: SafeArea(
        child: BlocListener<ConfirmCubit, ConfirmState>(
          listener: (BuildContext context, state) {
            if (state is ConfirmStateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("не правильный код"),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is ConfirmStateSuccess) {}
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HiPage(),
              ),
            );
          },
          child: Center(
            child: SizedBox(
              width: 400,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Аутентификация',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          TextFieldForm(
                            controller: tokenController,
                            hintText: 'Код e-mail',
                            iconShower: true,
                            onChanged: (value) {
                              if (value.length == 6) {
                                context.read<ConfirmCubit>().confirm(
                                    tokenController.text,
                                    state is RegistrationStateSuccess
                                        ? state.password
                                        : '');
                              }
                            },
                            iconPressed: () {
                              BaseDioApiRequest().sendRequest(
                                url: resend_URL,
                                type: RequestType.put,
                                body: {
                                  "token":
                                  SharedPreferencesRepository().getToken(),
                                  "captchaName": "string",
                                  "captchaToken": "string"
                                },
                              );
                            },
                            customIcon: Countdown(
                              seconds: count,
                              build: (BuildContext, double time) {
                                if (time == 0) {
                                  return const Positioned(
                                    top: 20,
                                    left: 250,
                                    child: Text('повторно отправить'),
                                  );
                                } else {
                                  return Text(time.toInt().toString());
                                }
                              },
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Код №121 выслан на ${state is RegistrationStateSuccess
                              ? state.email
                              : ""}',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AdvancedButton(
                        textColor: AppColors.LIGHT_COLOR,
                        colors: AppColors.SECOND_COLOR,
                        onPressed: () {
                          // BaseDioApiRequest().sendRequest(
                          //     type: RequestType.put,
                          //     url: confirm_URL,
                          //     body: {
                          //       "token": widget.token,
                          //       "password": widget.password,
                          //       "codeList": [
                          //         {
                          //           "nfaServiceType": "Email",
                          //           "code": tokenController.text,
                          //         }
                          //       ],
                          //       "clientId": "string",
                          //       "captchaName": "string",
                          //       "captchaToken": "string"
                          //     },);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HiPage(),
                            ),
                          );
                        },
                        text: 'Продолжить',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AdvancedButton(
                        textColor: AppColors.SECOND_COLOR,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Назад",
                        colors: AppColors.LIGHT_COLOR,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
