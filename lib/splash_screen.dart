import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidjet {
	const ({super.key});

	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			body: Center(
				child: Image.asset(
					'assets/business_card.png',
					width: 180,
					height: 180,
				),
			),
		);
	}
}