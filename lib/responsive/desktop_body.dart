import 'package:adaptive_flutter/data/api_constants.dart';
import 'package:adaptive_flutter/data/base_dio_request.dart';
import 'package:adaptive_flutter/widgets/advanced_button.dart';
import 'package:adaptive_flutter/widgets/text_form_field.dart';
import 'package:adaptive_flutter/widgets/utils/colors.dart';
import 'package:flutter/material.dart';


class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  bool isChecked = false;
  bool downCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Center(
              child: SizedBox(
                width: 400,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    TextFieldForm(
                      hintText: 'Имя пользователя',
                      iconShower: true,
                      iconPressed: () {},
                      customIcon: const Icon(Icons.info_outline),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const TextFieldForm(
                        hintText: 'Электронная почта или телефон'),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldForm(
                      hintText: 'Пароль',
                      iconShower: true,
                      iconPressed: () {},
                      customIcon: const Icon(Icons.visibility_off_outlined),
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
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              Icons.arrow_downward_sharp,
                              size: 18,
                              color: AppColors.PRIMARY_COLOR,
                            )
                          else
                            const Icon(
                              Icons.arrow_upward_sharp,
                              size: 18,
                              color: AppColors.PRIMARY_COLOR,
                            )
                        ],
                      ),
                    ),
                    if (!downCode)
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
                      colors: AppColors.PRIMARY_COLOR,
                      onPressed: () {
                        BaseDioApiRequest().sendRequest(url: login_URL, body: {
                          "userName": "asdvpetnpcmew",
                          "identificator": "asfan7899@gmail.com",
                          "password": "string",
                          "referral": "string",
                          "language": "En",
                          "timeZone": "string",
                          "clientId": "string",
                          "url": "string",
                          "captchaName": "string",
                          "captchaToken": "string",
                        });
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
                              )),
                          GestureDetector(
                              onTap: () {},
                              child: const ImageIcon(
                                AssetImage('assets/google.png'),
                                color: AppColors.PRIMARY_COLOR,
                                size: 42,
                              )),
                          GestureDetector(
                              onTap: () {},
                              child: const ImageIcon(
                                AssetImage('assets/Shape.png'),
                                color: AppColors.PRIMARY_COLOR,
                                size: 42,
                              )),
                          GestureDetector(
                              onTap: () {},
                              child: const ImageIcon(
                                AssetImage('assets/Combined-Shape.png'),
                                color: AppColors.PRIMARY_COLOR,
                                size: 42,
                              )),
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
            ),
          ),
        ),
      ),
    );
  }
}
