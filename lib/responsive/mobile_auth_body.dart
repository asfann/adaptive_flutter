// ignore_for_file: unnecessary_statements

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

class MobileAuthBody extends StatefulWidget {
  const MobileAuthBody({Key? key}) : super(key: key);

  @override
  State<MobileAuthBody> createState() => _MobileAuthBodyState();
}

class _MobileAuthBodyState extends State<MobileAuthBody> {
  bool isChecked = false;
  bool downCode = false;

  TextEditingController tokenController = TextEditingController();


  Alice alice = Alice();
  void _doCall1() async {
    final response = await http.post(Uri.parse('https://front.bitqi.com/v2/Login/sign-in/registration'),
      body: {
        "userName": 'aivnrepb',
        "identificator": 'asfan7899@gmail.com',
        "password": 'password',
        "referral": "string",
        "language": "En",
        "timeZone": "string",
        "clientId": "string",
        "url": "string",
        "captchaName": "string",
        "captchaToken": "string",
      },);
    alice.onHttpResponse(response);
  }

  @override
  void initState() {
    _doCall1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      body: Builder(
        builder: (BuildContext newContext) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 400,
                  height: MediaQuery.of(context).size.height,
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
                          TextFieldForm(
                            controller: tokenController,
                            hintText: 'Код e-mail',
                            iconShower: true,
                            onChanged: (value) {
                              if (value.length == 6) {
                                BaseDioApiRequest().sendRequest(
                                  type: RequestType.put,
                                  url: confirm_URL,
                                  body: {
                                    "token": SharedPreferencesRepository()
                                        .getToken(),
                                    "password":
                                        state is RegistrationStateSuccess
                                            ? state.password
                                            : null,
                                    "codeList": [
                                      {
                                        "nfaServiceType": "Email",
                                        "code": tokenController.text,
                                      }
                                    ],
                                    "clientId": "string",
                                    "captchaName": "string",
                                    "captchaToken": "string"
                                  },
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HiPage(),
                                  ),
                                );
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
                            customIcon: const Icon(Icons.timelapse),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Код №121 выслан на ${state is RegistrationStateSuccess ? state.email : null}',
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
          );
        },
      ),
    );
  }
}
