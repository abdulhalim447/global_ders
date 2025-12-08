import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms and Conditions')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text('''Terms & Conditions – Global Ders

Last Updated: 28 November 2025

Please read these Terms & Conditions carefully before using the Global Ders application (“App”). By downloading, installing, or using this App, you agree to comply with these terms. If you do not agree, you should not use the App.

1. App Usage

The purpose of Global Ders is to provide access to Mathematics books for educational purposes.
You may use the App only for personal, non-commercial learning and reference.

2. Intellectual Property

All book contents, texts, and materials available in the App are the exclusive property of their respective author(s), including Ibrahim Halil Babaoğlu.
Users are not allowed to copy, reproduce, distribute, modify, or share any content from the App without prior written permission from the copyright holders.

3. User Responsibilities

You agree not to use the App in any manner that may harm the App, other users, or any related services.
You must ensure your own device security and internet connection while using the App.

4. No Guarantee

We aim to provide accurate and up-to-date educational content. However, the App is offered “as is,” and we do not guarantee complete accuracy, solving errors, or uninterrupted access.

5. Third-Party Links

If the App contains links or references to external websites or services, Global Ders is not responsible for their content, privacy practices, or terms.

6. Modifications to the App or Terms

We may update the App or modify these Terms & Conditions at any time.
Continued use of the App after updates means you accept the new Terms.

7. Limitation of Liability

Global Ders or its creators will not be responsible for any damages or losses—direct or indirect—arising from the use of this App.

8. Termination

We reserve the right to restrict or terminate access to the App at any time if a user is found violating these Terms.

9. Governing Law

These Terms shall be governed by applicable local and international laws.

10. Contact

If you have any questions about these Terms & Conditions, please contact us:
Email: contact@global-ders.com'''),
      ),
    );
  }
}
