// ignore_for_file: unnecessary_statements, implementation_imports
import 'package:adaptive_flutter/registration_cubit/registration_cubit.dart';
import 'package:adaptive_flutter/responsive/mobile_auth_body.dart';
import 'package:adaptive_flutter/widgets/advanced_button.dart';
import 'package:adaptive_flutter/widgets/text_form_field.dart';
import 'package:adaptive_flutter/widgets/utils/colors.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/core/alice_http_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  bool isChecked = false;
  bool downCode = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool _submitted = false;
  bool _isSecret = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose;
  }

  String? get _userErrorText {
    final text = usernameController.value.text;
    if (text.isEmpty) {
      return 'Допустимые символы (от 6 до 32): a-z, 0-9,_. Имя должно начитатся с буквы.';
    }
    if (text.length < 6) {
      return 'Минимальное количество символов 6';
    }
    if (text.length > 32){
      return 'Максимальное количество символов 32';
    }
    return null;
  }

  String? get _emailErrorText {
    final text = emailController.value.text;
    if (!EmailValidator.validate(text) && text.isEmpty) {
      return 'Формат E-mail: somebody@somewhere.ru';
    }

    return null;
  }

  String? get _passwordErrorText {
    final text = passwordController.value.text;
    if (text.isEmpty) {
      return 'не может быть пустым';
    }
    if (text.length < 6) {
      return 'Минимум 6 символов';
    }
    return null;
  }
  //
  // Alice alice = Alice();
  // void _doCall1() async {
  //   final response = await http.post(Uri.parse('https://front.bitqi.com/v2/Login/sign-in/registration'),
  //     body: {
  //       "userName": 'aivnrepb',
  //       "identificator": 'asfan7899@gmail.com',
  //       "password": 'password',
  //       "referral": "string",
  //       "language": "En",
  //       "timeZone": "string",
  //       "clientId": "string",
  //       "url": "string",
  //       "captchaName": "string",
  //       "captchaToken": "string",
  //     },).interceptWithAlice(alice, body: {
  //     "userName": 'aivnrepb',
  //     "identificator": 'asfan7899@gmail.com',
  //     "password": 'password',
  //     "referral": "string",
  //     "language": "En",
  //     "timeZone": "string",
  //     "clientId": "string",
  //     "url": "string",
  //     "captchaName": "string",
  //     "captchaToken": "string",
  //   },);
  //   alice.onHttpResponse(response);
  // }
  //
  // @override
  // void initState() {
  //   _doCall1();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      body: SafeArea(
        child: Builder(
          builder: (BuildContext newContext) {
            return Center(
              child: SizedBox(
                width: 400,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ValueListenableBuilder(
                      valueListenable: usernameController,
                      builder: (BuildContext context, value, Widget? child) {
                        return TextFieldForm(
                          controller: usernameController,
                          hintText: 'Имя пользователя',
                          iconShower: true,
                          iconPressed: () {
                            // alice.showInspector();
                          },
                          customIcon: const Icon(Icons.info_outline),
                          errorText: _submitted ? _userErrorText : null,
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[a-z0-9_]"),
                            ),
                            CodeFormatter(),
                            FilteringTextInputFormatter.deny(RegExp(r"\s"))
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ValueListenableBuilder(
                      valueListenable: emailController,
                      builder: (BuildContext context, value, Widget? child) {
                        return TextFieldForm(
                          controller: emailController,
                          hintText: 'Электронная почта или телефон',
                          errorText: _submitted ? _emailErrorText : null,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ValueListenableBuilder(
                      valueListenable: passwordController,
                      builder: (BuildContext context, value, Widget? child) {
                        return TextFieldForm(
                          controller: passwordController,
                          hintText: 'Пароль',
                          iconShower: true,
                          textShow: _isSecret,
                          iconPressed: () {},
                          customIcon: InkWell(
                            onTap: () =>
                                setState(() => _isSecret = !_isSecret),
                            child: Icon(
                              _isSecret
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          errorText: _submitted ? _passwordErrorText : null,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          downCode = !downCode;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Реферальный код',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.PRIMARY_COLOR,
                              ),
                            ),
                          ),
                          if (downCode)
                            const Icon(
                              Icons.arrow_upward_sharp,
                              size: 18,
                              color: AppColors.PRIMARY_COLOR,
                            )
                          else
                            const Icon(
                              Icons.arrow_downward_sharp,
                              size: 18,
                              color: AppColors.PRIMARY_COLOR,
                            )
                        ],
                      ),
                    ),
                    if (downCode)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldForm(
                            hintText: 'Реферальный код',
                            iconShower: true,
                            iconPressed: () {},
                            customIcon: const Icon(Icons.percent),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Код дает скидку, не упустите',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.PRIMARY_COLOR,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: const TextSpan(
                              text: 'Я соглашаюсь с ',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.PRIMARY_COLOR,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Пользовательским соглашением \n',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.SECOND_COLOR,
                                  ),
                                ),
                                TextSpan(
                                  text: 'и ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.PRIMARY_COLOR,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Политикой конфиденциальности',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.SECOND_COLOR,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AdvancedButton(
                      textColor: AppColors.LIGHT_COLOR,
                      colors: AppColors.SECOND_COLOR,
                      onPressed: () async {
                        setState(() => _submitted = true);
                        if (usernameController.value.text.length >= 6 &&
                            usernameController.value.text.length <= 32 &&
                            usernameController.value.text.isNotEmpty &&
                            !EmailValidator.validate(emailController.value.text.isNotEmpty.toString()) &&
                            passwordController.value.text.length >= 6 &&
                            isChecked) {
                          newContext.read<RegistrationCubit>().register(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MobileAuthBody(),
                            ),
                          );
                        }
                      },
                      text: 'Далее',
                    ),
                    const SizedBox(
                      height: 43,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const ImageIcon(
                              AssetImage('assets/pay-code-one.png'),
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const ImageIcon(
                              AssetImage('assets/google.png'),
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const ImageIcon(
                              AssetImage('assets/Shape.png'),
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const ImageIcon(
                              AssetImage('assets/Combined-Shape.png'),
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Уже зарегистрированы? ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Войти',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.SECOND_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    if (newValue.text.isNotEmpty &&
        RegExp('[a-zA-Z]').hasMatch(newValue.text[0])) return newValue;
    return oldValue;
  }
}
