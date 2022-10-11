import 'package:flutter/material.dart';
import 'package:adaptive_flutter/widgets/advanced_button.dart';
import 'package:adaptive_flutter/widgets/text_form_field.dart';
import 'package:adaptive_flutter/widgets/utils/colors.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
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
                    const TextFieldForm(hintText: 'Электронная почта или телефон'),
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
                      colors: AppColors.PRIMARY_COLOR,
                      onPressed: () {},
                      text: 'Далее',
                      textColor: AppColors.LIGHT_COLOR,
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
                            child: const Icon(
                              Icons.qr_code_2,
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.mic_none,
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.telegram_outlined,
                              color: AppColors.PRIMARY_COLOR,
                              size: 42,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.apple,
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
            ),
          ),
        ),
      ),
    );
}
}
