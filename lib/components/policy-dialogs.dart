import 'package:flutter/material.dart';

// Dialog box for the pirvacy policy
class privacyDialog extends StatelessWidget {
  const privacyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                const Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("This statement sets forth the Privacy Policy of LEGAL COMPANY NAME HERE (the “Company”) for "
                    "the use of the Company’s website (the “website” or “site”), and describes the practices that the "
                    "Company will follow with respect to the privacy of users of the website.  This Privacy Policy does not "
                    "apply to the Company’s offline information collection activities.  From time to time, we may change this "
                    "Privacy Policy. For example, as we update and improve our service, new features may require modifications to "
                    "the Privacy Policy. Accordingly, you should note the date of the latest revision of this Privacy Policy "
                    "posted at the bottom of this Privacy Policy, which should alert you to changes in this Privacy Policy "
                    "since your prior visit to this website."),
                const SizedBox(height: 5),
                const Text(
                  "1. Personally Identifiable Information:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("“Personally identifiable information” is information specifically about you that can be used to identify "
                    "you, such as name, address, e-mail address, a user ID, a driver’s license number or a credit card number."),
                const SizedBox(height: 5),
                const Text(
                  "2. Information Collection, Use and Distribution:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                const Text("We want you to understand what private information we collect about you, and how we use your private "
                    "information. The nature of the services that we provide through our website requires that we collect and "
                    "use information about you as more fully described below. Some of your private information may be disclosed "
                    "to third parties (for example, accrediting bodies) in order to provide the information and services that you "
                    "request, and may be used by both the Company and third parties to provide that information and/or perform "
                    "those services. In addition, the Company and third parties may use your private information to offer you "
                    "additional information, products, or services that match your areas of interest. "
                    "We may request that you voluntarily supply us with information, including your e-mail address, street address, "
                    "telephone number or other information so that we may enhance your site visit, fulfill any orders you may place "
                    "through our site, or follow up with you after your visit. Whether you provide any information is entirely up to you. "
                    "If you have voluntarily provided information, you consented to the collection and use of your personally identifiable "
                    "information as described in this Privacy Policy.   We do not sell or rent personally identifiable information collected "
                    "through this site to anyone. Also, the Company may provide aggregate statistics about visitors to our website, such as "
                    "volume, traffic patterns, and related site information to reputable third-parties, but these statistics will not include "
                    "any personally identifiable information.  the Company may also disclose information in special cases when we have a good "
                    "faith belief that such action is necessary to: (a) conform to legal requirements or comply with legal process; (b) protect "
                    "and enforce our rights or property; (c) enforce the website Terms and Conditions of Use or this Privacy Policy; (d) act to "
                    "protect the interests of our users or others; (e) resolve disputes, or (f) troubleshoot website problems."
                    "If you have voluntarily provided personally identifiable information, we may, from time to time, send you mail "
                    "or e-mail regarding products and services. If you do not want to receive such offers and mailings, you can easily "
                    "indicate that by checking the appropriate box on the submission form."),
                const SizedBox(height: 5),
                const Text(
                  "3. Children’s Privacy and App Age Limitations:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("This website is intended for use by persons aged 13 or older, and by your use of this site you affirm that you are at least "
                    "13 years of age.  In addition, if you are under the age of 18, you are only permitted to use this website with the consent of "
                    "your parents or an adult guardian.  The Company will not knowingly allow registration of an account for any person that the "
                    "Company believes to be younger than 13.  We also do not collect any personally identifiable information from any persons under "
                    "the age of 13 and if we discover that we have been provided any such information, we will delete this information from our records."),
                const SizedBox(height: 5),
                const Text(
                  "4. Information Security:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                const Text("We exercise great care to protect your personally identifiable information. This includes, among other things, using commercially "
                    "reasonable and industry standard security practices. Unfortunately, no data transmission over the Internet can be guaranteed to be "
                    "completely secure. As a result, while we strive to protect your personally identifiable information, we cannot ensure or warrant "
                    "the security of any information you transmit to us or receive from us or through one of our applications. This is especially true "
                    "for information you transmit via e-mail. We have no way of protecting that information until it reaches us. Once we receive your "
                    "transmission, we use what we believe are commercially reasonable efforts to ensure its security on our servers. "
                    "Internally, we will use reasonable efforts to restrict access to your personally identifiable information to employees or contractors"
                    " who need access to the information to do their jobs. These employees and contractors are required to adhere to our privacy policies."
                    "We will review and update our security arrangements and procedures from time to time as we deem appropriate."),
                const SizedBox(height: 5),
                const Text(
                  "5. Protecting Your Information:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("We recommend that you do not divulge your user password to anyone. We will never ask you for your password in an unsolicited phone "
                    "call or in an unsolicited e-mail. Also remember to sign out of the website and close your browser window when you have finished visiting "
                    "our site. This is to ensure that others cannot access your personally identifiable information and correspondence if others have access to your computer."
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Close")
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

// Dialog box for the terms of use and conditions
class termsDialog extends StatelessWidget {
  const termsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  const Text(
                    "Terms of Use",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text("PLEASE READ THE FOLLOWING TERMS AND CONDITIONS OF USE CAREFULLY BEFORE USING THIS WEBSITE. ALL USERS OF "
                      "THIS SITE AGREE THAT ACCESS TO AND USE OF THIS SITE ARE SUBJECT TO THESE TERMS AND CONDITIONS AND OTHER APPLICABLE "
                      "LAW. IF YOU DO NOT AGREE TO THESE TERMS AND CONDITIONS, PLEASE DO NOT USE THIS SITE. "
                      "INSERT COMANY NAME HERE (the “Company”) provides this website (the “website” or “site”) for its customers and other"
                      " permitted users.  We’ve worked hard to give you the essential information here and elsewhere on our site to get you"
                      " comfortable with our site and to make it useful to you.  These Terms and Conditions of Use (the “Terms and Conditions”)"
                      " help enable us to provide you with the products and services, information, other content and features available through "
                      "our site. "),
                  const SizedBox(height: 5),
                  const Text(
                    "1. Scope of Access to App and Related Rights:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text("Subject to these Terms and Conditions, the Company grants you a limited, revocable right to access and use the "
                      "site solely for your own use.  You agree not to modify, adapt, translate, or reverse engineer, decompile, disassemble, "
                      "or otherwise attempt to discern the source code of this website. Further, you may not reproduce all or any portion of "
                      "the site. This website and its contents are the intellectual property of and are owned by the Company and/or its licensors."
                      " The Company reserves the right to suspend or terminate use of this website or its services by you or other users in its "
                      "sole discretion."),
                  const SizedBox(height: 5),
                  const Text(
                    "2. User Account:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),
                  const Text("Prior to placing an order from this site you may  establish a user account, however this is not required to place"
                      " your order.  If you establish a user account it will be accessible upon input of an authorized e-mail address and a "
                      "designated password.  You are responsible for maintaining the security of any user passwords and other account details "
                      "issued to you for use with the site, and you are also responsible for the integrity and security of the operating "
                      "environment from which you access the site. "),
                  const SizedBox(height: 5),
                  const Text(
                    "3. Children’s Privacy and App Age Limitations:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text("This website is intended for use by persons aged 13 or older, and by your use of this site you affirm that you are at least "
                      "13 years of age.  In addition, if you are under the age of 18, you are only permitted to use this website with the consent of "
                      "your parents or an adult guardian.  The Company will not knowingly allow registration of an account for any person that the "
                      "Company believes to be younger than 13.  We also do not collect any personally identifiable information from any persons under "
                      "the age of 13 and if we discover that we have been provided any such information, we will delete this information from our records."),
                  const SizedBox(height: 5),
                  const Text(
                    "4. Pricing or other Information Errors:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),
                  const Text("Although the Company strives at all times to maintain the accuracy of information maintained on this site, including "
                      "pricing information and product details, occasionally pricing or other information errors may occur on this site.  In the "
                      "event that any Company product that is available through this site is mistakenly listed at an incorrect price or with other "
                      "incorrect information, the Company reserves the right to either refuse or cancel the order or to charge you the correct price "
                      "when you come to pick up your order."),
                  const SizedBox(height: 5),
                  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close")
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}