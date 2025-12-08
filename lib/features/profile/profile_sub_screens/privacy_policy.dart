import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '''Global Ders respects your privacy and is committed to protecting the information of all users who use this application. This Privacy Policy explains how user information is handled within the app.

Information Collection

Global Ders does not collect, store, or require any personal information from users.
No registration, login, or personal data submission is needed to access the content.

Usage Data

Some non-personal and anonymous data (such as device information, app version, and performance statistics) may be collected automatically to improve app usability and performance.
These data do not identify any user personally.

Data Sharing

We do not sell, trade, distribute, or transfer any kind of user information to third parties.
No personal data is shared with external services.

Children’s Privacy

Global Ders is safe for children and students of all levels.
Since no personal information is collected, no data from children is stored or tracked.

Third-Party Links or Content

If the app contains any links to external sites or content in the future, please note that those websites may have their own privacy policies.
We recommend users review those policies separately.

Security

Even though we do not collect personal data, we always try to maintain a secure environment and ensure the app remains safe from vulnerabilities.

Policy Changes

We may update this Privacy Policy occasionally.
In case of any change, the new policy will be posted here along with an updated effective date.

Contact

If you have any questions, concerns, or suggestions regarding this Privacy Policy, please contact us at:
Email: contact@global-ders.com''',
        ),
      ),
    );
  }
}
