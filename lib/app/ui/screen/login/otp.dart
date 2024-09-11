import 'dart:async'; // Timer uchun
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/login_elevated_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _timer;
  int _start = 60; // 1 daqiqa (60 soniya)
  String _correctOtp = '1234'; // To'g'ri OTP
  bool _isOtpCorrect = true; // OTP holati
  bool _submited = false; // OTP holati

  @override
  void initState() {
    super.initState();
    // Ekranga o'tilgandan so'ng avtomatik cursorni ko'rsatish
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    // Sekundomerni ishga tushirish
    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    _timer?.cancel(); // Timerni to'xtatish
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _checkOtp(String otp) {
    setState(() {
      if (otp == _correctOtp) {
        _isOtpCorrect = true;
      } else {
        _isOtpCorrect = false;
      }
    });
  }

  void _register() {
    _submited = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Spacer(),
          const Text(
            'Saver',
            style: TextStyles.s20w500white,
          ),const SizedBox(height: 55),
          const Text(
            'SMS dagi kodni kriting',
            style: TextStyles.s18w500white,
          ),const SizedBox(height: 10),
          const Text(
            'Ushbu +998 90 ***** 04 raqamiga 4\nxonalik kod jo‘natiladi',
            style: TextStyles.s16w400white,
          ),const SizedBox(height: 35),
         
          Pinput(
            length: 4,
            controller: _otpController,
            focusNode: _focusNode,
            keyboardType: TextInputType.number,
            onCompleted: (pin) {
              // OTP to'liq kiritilganda bajariladigan amallar
              _checkOtp(pin); // OTP tekshirish
              print('OTP: $pin');
            },
            onChanged: (value) {
              // OTP to'liq kiritilganda yoki o'chirilganda
              if (value.length < 4) {
                // Avvalgi kodni qabul qilish
              }
            },
            defaultPinTheme: PinTheme(
              width: 50,
              height: 50,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.pink),
              ),
            ),
            submittedPinTheme: PinTheme(
              width: 60,
              height: 60,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: BoxDecoration(
                color: _submited
                    ? _isOtpCorrect
                        ? AppColors.deepBlue
                        : AppColors.pink
                    : AppColors.deepBlue,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: _submited
                        ? _isOtpCorrect
                            ? AppColors.deepBlue
                            : AppColors.pink
                        : AppColors.deepBlue),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 60,
              height: 60,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: BoxDecoration(
                color: _submited
                    ? _isOtpCorrect
                        ? AppColors.deepBlue
                        : AppColors.pink
                    : AppColors.deepBlue,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.deepBlue),
              ),
            ),
            errorPinTheme: PinTheme(
              decoration: BoxDecoration(
                color: AppColors.pink,
                border: Border.all(color: AppColors.pink),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (_start > 30)
            const Text(
              'Kodni kiriting!',
              style: TextStyles.s18w500grey,
            )
          else
            GestureDetector(
              onTap: () {
                // Kodni qayta yuborish funksiyasi
              },
              child: const Text(
                'Kod yuborilmadimi? Qayta yuborish!',
                style: TextStyles.s18w500white,
              ),
            ),
          const SizedBox(height: 12),
          Text(
            _start > 0
                ? '00 : ${_start.toString().padLeft(2, '0')}'
                : '00 : 00',
            style: TextStyles.s24w600white,
          ),
        Spacer(flex: 5,),
          LoginElevatedButton(title: 'Login', onTap: _register),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}