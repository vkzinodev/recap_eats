import 'dart:math' as math;
import 'package:porco_eats/shared/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static const _assets = 'assets/images/porco_eats_images/';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _recover() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Se o e-mail estiver cadastrado, enviaremos o código de redefinição.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), behavior: SnackBarBehavior.floating),
    );
  }

  Widget _pos(
    double u,
    String file,
    double left,
    double top,
    double width, {
    Color? color,
  }) {
    return Positioned(
      left: left * u,
      top: top * u,
      width: width * u,
      child: Image.asset(
        '$_assets$file',
        fit: BoxFit.fitWidth,
        color: color,
        colorBlendMode: color == null ? null : BlendMode.srcIn,
        filterQuality: FilterQuality.medium,
      ),
    );
  }

  OutlineInputBorder _outline(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final safeBottom = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.brownWhite,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cw = math.min(constraints.maxWidth, 520.0);
            final u = cw / 545;
            final k = (cw / 360).clamp(0.9, 1.35).toDouble();

            final fTitle = 22 * k;
            final fSub = 12.5 * k;
            final fHint = 13.5 * k;
            final fButton = 13 * k;
            final fSocial = 10.5 * k;
            final fOu = 12 * k;
            final fVoltar = 12.5 * k;

            final headerH = 300 * u;
            final fieldH = math.max(46 * u, 44.0);
            final buttonH = math.max(50 * u, 48.0);
            final socialH = math.max(40 * u, 40.0);
            final bottomPad = math.max(45 * u, 28.0) + safeBottom;

            final titleTop = math.max(320 * u - 0.131 * fTitle, headerH);

            final subTop = math.max(373 * u - 0.942 * fSub, titleTop + fTitle);

            final subH = 2 * 1.2 * fSub;

            final fieldTop = math.max(451 * u, subTop + subH + 16);

            final vPad = math.max((fieldH - 1.2 * fHint) / 2, 8.0);

            final sideIndent = 27 * u;

            return SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: cw,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          _pos(u, 'deco_burger.png', -8.5, 290, 100),

                          _pos(u, 'deco_pizza.png', 439, 234.5, 104.5),

                          Positioned(
                            left: 0,
                            bottom: 10 * u,
                            width: 70 * u,
                            child: Image.asset(
                              '${_assets}deco_stripes_left.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),

                          Positioned(
                            right: 0,
                            bottom: 10 * u,
                            width: 75 * u,
                            child: Image.asset(
                              '${_assets}deco_stripes_right.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: headerH,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        '${_assets}header_bg.png',
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.medium,
                                      ),
                                    ),

                                    _pos(u, 'Vector 1.png', 12, 45, 161),

                                    _pos(u, 'Vector 5.png', 438, 70, 94),

                                    _pos(
                                      u,
                                      'Vector 4.png',
                                      339.5,
                                      58,
                                      207,
                                      color: AppColors.darkYellow,
                                    ),

                                    _pos(
                                      u,
                                      'Vector 2.png',
                                      0,
                                      214,
                                      118,
                                      color: AppColors.darkYellow,
                                    ),

                                    _pos(
                                      u,
                                      'Vector 3.png',
                                      0,
                                      233,
                                      160,
                                      color: AppColors.darkRed2,
                                    ),

                                    _pos(
                                      u,
                                      'logoporcoeats 1.png',
                                      137,
                                      14,
                                      287,
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 78 * u,
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(height: titleTop - headerH),

                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: sideIndent,
                                        ),
                                        child: Text(
                                          'Esqueceu a senha?',
                                          style: TextStyle(
                                            color: AppColors.title,
                                            fontSize: fTitle,
                                            fontWeight: FontWeight.w700,
                                            height: 1.0,
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: subTop - (titleTop + fTitle),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: sideIndent,
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Insira seu e-mail cadastrado e enviaremos um\ncódigo de redefinição.',
                                            style: TextStyle(
                                              color: AppColors.text,
                                              fontSize: fSub,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: fieldTop - (subTop + subH),
                                      ),

                                      TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (_) => _recover(),
                                        cursorColor: AppColors.redDelivery,
                                        validator: (value) {
                                          final email = value?.trim() ?? '';

                                          if (email.isEmpty) {
                                            return 'Digite seu e-mail';
                                          }

                                          if (!RegExp(
                                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                          ).hasMatch(email)) {
                                            return 'Digite um e-mail válido';
                                          }

                                          return null;
                                        },
                                        style: TextStyle(
                                          color: AppColors.text,
                                          fontSize: fHint,
                                          height: 1.2,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'E-mail',
                                          hintStyle: TextStyle(
                                            color: AppColors.lightGray,
                                            fontSize: fHint,
                                            height: 1.2,
                                          ),
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.only(
                                              left: 14,
                                              right: 11,
                                            ),
                                            child: Icon(
                                              Icons.mail_outline,
                                              size: 22,
                                              color: AppColors.darkIcon,
                                            ),
                                          ),
                                          prefixIconConstraints:
                                              const BoxConstraints(
                                                minWidth: 47,
                                                minHeight: 22,
                                              ),
                                          filled: true,
                                          fillColor: AppColors.lightBackground,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: vPad,
                                          ),
                                          border: _outline(
                                            AppColors.lightBorder,
                                          ),
                                          enabledBorder: _outline(
                                            AppColors.lightBorder,
                                          ),
                                          focusedBorder: _outline(
                                            AppColors.redDelivery,
                                            1.4,
                                          ),
                                          errorBorder: _outline(
                                            AppColors.redDelivery,
                                          ),
                                          focusedErrorBorder: _outline(
                                            AppColors.redDelivery,
                                            1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const Spacer(),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 78 * u,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 24),

                                    Container(
                                      height: buttonH,
                                      decoration: BoxDecoration(
                                        color: AppColors.redDelivery,
                                        borderRadius: BorderRadius.circular(40),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.redDelivery
                                                .withValues(alpha: 0.28),
                                            blurRadius: 14,
                                            offset: const Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
                                          onTap: _recover,
                                          child: Center(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.arrow_forward,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  'ENVIAR CÓDIGO',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: fButton,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Divider(
                                            color: AppColors.lightLine,
                                            thickness: 1,
                                            height: 16,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                          ),
                                          child: Text(
                                            'ou',
                                            style: TextStyle(
                                              color: AppColors.gray,
                                              fontSize: fOu,
                                            ),
                                          ),
                                        ),

                                        const Expanded(
                                          child: Divider(
                                            color: AppColors.lightLine,
                                            thickness: 1,
                                            height: 16,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: _SocialButton(
                                            height: socialH,
                                            fontSize: fSocial,
                                            onPressed: () => _showMessage(
                                              'Continuar com Google',
                                            ),
                                            icon: Image.asset(
                                              '${_assets}google_g.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                            label: 'Continuar com Google',
                                          ),
                                        ),

                                        SizedBox(width: 10 * u),

                                        Expanded(
                                          child: _SocialButton(
                                            height: socialH,
                                            fontSize: fSocial,
                                            onPressed: () => _showMessage(
                                              'Continuar com Apple',
                                            ),
                                            icon: Image.asset(
                                              '${_assets}apple_logo.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                            label: 'Continuar com Apple',
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 20),

                                    Center(
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () =>
                                            Navigator.of(context).maybePop(),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 6,
                                            horizontal: 8,
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                fontSize: fVoltar,
                                                color: AppColors.gray,
                                                height: 1.2,
                                              ),
                                              children: const [
                                                TextSpan(text: 'Voltar para '),
                                                TextSpan(
                                                  text: 'Entrar',
                                                  style: TextStyle(
                                                    color: AppColors.lightRed,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: bottomPad - 6),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.height,
    required this.fontSize,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final String label;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(40);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.brownWhite,
        borderRadius: radius,
        border: Border.all(color: AppColors.lightBorder),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: radius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  const SizedBox(width: 6),
                  Text(
                    label,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
