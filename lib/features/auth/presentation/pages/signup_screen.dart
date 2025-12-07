import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/contact_icon_button.dart';
import 'login_screen.dart';

/// Signup screen for authentication
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreedToTerms = false;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_formKey.currentState!.validate()) {
      if (!_agreedToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please agree to Terms of Service and Privacy Policy',
            ),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      // Simulate signup process
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          // Navigate to home or show success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Signup successful!'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  _buildHeader(),
                  const SizedBox(height: 60),
                  _buildWelcomeText(),
                  const SizedBox(height: 40),
                  _buildForm(),
                  const SizedBox(height: 20),
                  _buildTermsCheckbox(),
                  const SizedBox(height: 32),
                  _buildContinueButton(),
                  const SizedBox(height: 24),
                  _buildSignInLink(),
                  const SizedBox(height: 32),
                  _buildContactSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        _buildLogo(),
        // Menu button
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
            border: Border.all(
              color: AppColors.darkSurfaceVariant.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.darkIconPrimary,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 60,
      height: 60,

      child: ClipOval(
        child: Image.asset('assets/logo/logo.jpg', fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyles.h2(color: AppColors.darkTextPrimary),
            children: [
              const TextSpan(text: 'Welcome to '),
              TextSpan(
                text: 'Global Ders',
                style: AppTextStyles.h2(color: AppColors.accentGreen),
              ),
              const TextSpan(text: '!'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'By Ibrahim Halil Babaoğlu',
          style: AppTextStyles.bodyMedium(color: AppColors.darkTextSecondary),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Name',
          controller: _nameController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: 'E-mail',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: 'Password',
          controller: _passwordController,
          obscureText: _obscurePassword,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: AppColors.darkIconSecondary,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _agreedToTerms,
            onChanged: (value) {
              setState(() {
                _agreedToTerms = value ?? false;
              });
            },
            activeColor: AppColors.accentGreen,
            checkColor: AppColors.black,
            side: BorderSide(
              color: AppColors.darkSurfaceVariant.withOpacity(0.5),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall(
                color: AppColors.darkTextSecondary,
              ),
              children: [
                const TextSpan(text: 'I have read and agree to '),
                TextSpan(
                  text: 'Terms of Service',
                  style: AppTextStyles.bodySmall(
                    color: AppColors.darkTextSecondary,
                  ).copyWith(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to Terms of Service
                    },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: AppTextStyles.bodySmall(
                    color: AppColors.darkTextSecondary,
                  ).copyWith(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to Privacy Policy
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return CustomButton(
      text: 'CONTINUE',
      onPressed: _handleContinue,
      isLoading: _isLoading,
    );
  }

  Widget _buildSignInLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.bodyMedium(color: AppColors.darkTextSecondary),
          children: [
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Sign In',
              style: AppTextStyles.bodyMedium(
                color: AppColors.accentGreen,
              ).copyWith(fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.darkSurfaceVariant.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'CONTACT WITH US',
                style: AppTextStyles.overline(
                  color: AppColors.darkTextTertiary,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.darkSurfaceVariant.withOpacity(0.3),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContactIconButton(
              icon: Icons.phone_rounded,
              onPressed: () {
                // Handle phone contact
              },
            ),
            const SizedBox(width: 12),
            ContactIconButton(
              icon: Icons.language_rounded,
              onPressed: () {
                // Handle website contact
              },
            ),
            const SizedBox(width: 12),
            ContactIconButton(
              icon: Icons.email_rounded,
              onPressed: () {
                // Handle email contact
              },
            ),
          ],
        ),
      ],
    );
  }
}
