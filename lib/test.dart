// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testproject/pages/explore/repo/explore_model.dart';
// import 'package:testproject/pages/home/bloc/home_bloc.dart';
// import 'package:testproject/pages/home/bloc/home_state.dart';
// import 'package:testproject/pages/memory/user_details.dart';
// import 'package:testproject/pages/sign_in/repo/signIn_model.dart';
//
// import '../../../flutter_flow/flutter_flow_model.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
//
//
// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({Key? key}) : super(key: key);
//
//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }
// class _HomePageWidgetState extends State<HomePageWidget> {
//   UserDetailsService userDetailsService = UserDetailsService();
//   String? add;
//   String? name;
//
//   List<ProductDetails> recentProducts = [];
//   List<ProductDetails> popularProducts = [];
//
//   @override
//   void initState() {
//     Future<LoggedInData?> shareData =
//     userDetailsService.getUserDataFromSharedPreferences();
//     shareData.then((value) {
//       if (value != null) {
//         setState(() {
//           add = value.city;
//           name = value.fName;
//         });
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomTheme.of(context).primaryText,
//       body: SafeArea(
//         top: true,
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: CustomTheme.of(context).primaryText,
//           ),
//           child: SingleChildScrollView(
//             child: BlocBuilder<HomeBloc, HomePageState>(
//               builder: (context, state) {
//                 if (state is HomePageLoadingState) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is HomePageSuccessState) {
//                   List<ProductDetails> products = state.productDetails;
//                   recentProducts = getProductsByCategory(products, "RECENT");
//                   popularProducts = getProductsByCategory(products, "POPULAR");
//
//                   return Column(
//                     children: [
//                       _buildCategoryList("RECENT", recentProducts),
//                       _buildCategoryGrid("POPULAR", popularProducts),
//                     ],
//                   );
//                 } else if (state is HomePageErrorState) {
//                   return Center(
//                     child: Text(
//                       "An error occurred ${state.error}",
//                       style: CustomTheme.of(context).bodyMedium.override(
//                         fontFamily: 'Poppins',
//                         color: CustomTheme.of(context).secondaryBackground,
//                       ),
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: Text("Unknown STATE"),
//                   );
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<ProductDetails> getProductsByCategory(
//       List<ProductDetails> products, String category) {
//     return products.where((product) => product.category == category).toList();
//   }
//
//   Widget _buildCategoryList(String category, List<ProductDetails> products) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             category,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return ListTile(
//                 title: Text(product.name),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryGrid(String category, List<ProductDetails> products) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             category,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 8,
//               mainAxisSpacing: 8,
//               childAspectRatio: 1.0,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return GridTile(
//                 child: Container(
//                   color: Colors.grey[200],
//                   child: Center(
//                     child: Text(product.name),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
