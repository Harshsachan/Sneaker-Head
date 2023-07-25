import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class MeetDeveloper extends StatefulWidget {
  const MeetDeveloper({Key? key}) : super(key: key);

  @override
  State<MeetDeveloper> createState() => _MeetDeveloperState();
}

class _MeetDeveloperState extends State<MeetDeveloper> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: CustomTheme.of(context).primaryBackground,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: AutoSizeText(
            'Meet The Developer',
            style: CustomTheme.of(context).bodySmall.override(
                  color: CustomTheme.of(context).primaryBackground,
                  fontFamily: CustomTheme.of(context).bodySmallFamily,
                  fontSize: 22,
                  useGoogleFonts: GoogleFonts.asMap()
                      .containsKey(CustomTheme.of(context).bodySmallFamily),
                ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/developer.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.40),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: CustomTheme.of(context).primaryText,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25, 20, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Harshit Sachan',
                            style: CustomTheme.of(context)
                                .headlineLarge
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  // fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .displayLargeFamily),
                                ),
                          ),
                          AutoSizeText(
                            'Contact Me',
                            style: CustomTheme.of(context).labelLarge.override(
                                  color: CustomTheme.of(context).accent2,
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  // fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          Divider(
                            color: CustomTheme.of(context).secondaryBackground,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 5, 0),
                                    child: AutoSizeText(
                                      '+91 8400370072',
                                      style: CustomTheme.of(context)
                                          .labelLarge
                                          .override(
                                            color: CustomTheme.of(context)
                                                .secondaryBackground,
                                            fontFamily: CustomTheme.of(context)
                                                .bodySmallFamily,
                                            // fontSize: 16,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    CustomTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors
                                      .green, // Set the icon background color to green
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.phone),
                                  onPressed: () async {
                                    final Uri url =
                                        Uri(scheme: 'tel', path: "8400370072");
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      if (kDebugMode) {
                                        print("cannot place url");
                                      }
                                    }
                                  },
                                  color: Colors
                                      .white, // Set the icon color to white
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail_outline,
                                      color: CustomTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 5, 0),
                                      child: AutoSizeText(
                                        'harshit.26sachan@gmail.com',
                                        style: CustomTheme.of(context)
                                            .labelLarge
                                            .override(
                                              color: CustomTheme.of(context)
                                                  .secondaryBackground,
                                              fontFamily:
                                                  CustomTheme.of(context)
                                                      .bodySmallFamily,
                                              // fontSize: 16,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          CustomTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors
                                        .blue, // Set the icon background color to blue
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.email),
                                    onPressed: () async {
                                      String? encodeQueryParameters(
                                          Map<String, String> params) {
                                        return params.entries
                                            .map((MapEntry<String, String> e) =>
                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                            .join('&');
                                      }

// ···
                                      final Uri emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: 'harshit.26sacha@gmail.com',
                                        query: encodeQueryParameters(<String,
                                            String>{
                                          'subject': 'App review',
                                          'body': 'Hi ! Harshit',
                                        }),
                                      );
                                      if (await canLaunchUrl(emailLaunchUri)) {
                                        await launchUrl(emailLaunchUri);
                                      } else {
                                        if (kDebugMode) {
                                          print('Cannot launch email');
                                        }
                                      }
                                      launchUrl(emailLaunchUri);
                                    },
                                    color: Colors
                                        .white, // Set the icon color to white
                                  ),
                                )
                              ],
                            ),
                          ),
                          //TODO - Linkedin
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 20),
                            child: AutoSizeText(
                              'About Me',
                              style: CustomTheme.of(context)
                                  .labelLarge
                                  .override(
                                    color: CustomTheme.of(context).accent2,
                                    fontFamily:
                                        CustomTheme.of(context).bodySmallFamily,
                                    // fontSize: 16,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(CustomTheme.of(context)
                                            .bodySmallFamily),
                                  ),
                            ),
                          ),
                          Divider(
                            //thickness: 0.1,
                            color: CustomTheme.of(context).secondaryBackground,
                          ),
                          AutoSizeText(
                            'I am a passionate Full Stack App Developer with 1.6 years of experience, specializing in Flutter & Dart for frontend and NestJS for backend development. Currently employed at Apollo, I am dedicated to pushing the boundaries of innovation in creating cutting-edge app. ',
                            style: CustomTheme.of(context).labelLarge.override(
                                  color: CustomTheme.of(context)
                                      .secondaryBackground,
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            textAlign: TextAlign.justify,
                            softWrap: true,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 10),
                            child: AutoSizeText(
                              'I excel in crafting visually appealing and user-friendly interfaces using Flutter & Dart, adhering to UI/UX principles and optimizing performance for seamless user experiences. ',
                              style: CustomTheme.of(context)
                                  .labelLarge
                                  .override(
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                    fontFamily:
                                        CustomTheme.of(context).bodySmallFamily,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(CustomTheme.of(context)
                                            .bodySmallFamily),
                                  ),
                              textAlign: TextAlign.justify,
                              softWrap: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 10),
                            child: AutoSizeText(
                              'My proficiency in NestJS allows me to build robust and scalable server-side solutions. I have experience developing RESTful / GraphQL APIs, implementing authentication, integrating with databases, and third-party services, all while maintaining clean and maintainable code.',
                              style: CustomTheme.of(context)
                                  .labelLarge
                                  .override(
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                    fontFamily:
                                        CustomTheme.of(context).bodySmallFamily,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(CustomTheme.of(context)
                                            .bodySmallFamily),
                                  ),
                              textAlign: TextAlign.justify,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
