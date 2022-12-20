import 'package:autobaloo/models/enums/cta_text_size.dart';
import 'package:autobaloo/models/enums/oauth_provider.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/auth_service.dart';
import 'package:flutter/material.dart';

class OAuthLoginButton extends StatelessWidget {
  const OAuthLoginButton({
    super.key,
    required this.provider,
    required this.textSize});

  final OAuthProvider provider;
  final CtaTextSize textSize;

  static const Map<CtaTextSize, double> fontSizes = {
    CtaTextSize.small: 12,
    CtaTextSize.medium: 16,
    CtaTextSize.large: 20,
  };

  @override
  Widget build(BuildContext context) {
    final providerInfo = OAuthProviderInfo.forProvider(provider);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: providerInfo.brandColor,
        textStyle: TextStyle(
          fontSize: fontSizes[textSize],
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: () async {
        final authService = sl.get<AuthService>();
        await authService.loginOAuth(providerInfo.key);
      },
      child: Text('Connexion avec ${providerInfo.brandName}'),
    );
  }
}
