import "package:flutter/material.dart";

class UnIssuedLicenseStatus extends StatefulWidget {
  const UnIssuedLicenseStatus({super.key});

  @override
  State<UnIssuedLicenseStatus> createState() => _UnIssuedLicenseStatusState();
}

class _UnIssuedLicenseStatusState extends State<UnIssuedLicenseStatus> {
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: screenWidth > 600
          ? const EdgeInsets.fromLTRB(24, 14, 20, 14)
          : const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Color.fromARGB(255, 17, 83, 8)])),
      child: Column(
        children: [
          const FlutterLogo(
            size: 150,
          ),
          const SizedBox(height: 25),
          Container(
            padding: screenWidth > 600
                ? const EdgeInsets.fromLTRB(15, 7, 15, 7)
                : const EdgeInsets.fromLTRB(10, 20, 10, 20),
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(35)),
            child: Column(
              children: [showStatus()],
            ),
          ),
        ],
      ),
    )));
  }
}

Widget showStatus() {
  const LicenseStatus oldStatusofLicense = LicenseStatus.draftSave;
  switch (oldStatusofLicense) {
    case LicenseStatus.draftSave:
      return draftSaved(
          "DRAFT SAVED", "Mr. Person X", "01/01/1995", "DM1392548");
    case LicenseStatus.learnerIssued:
      return Column(
        children: [
          const Center(
            child: Text(
              "Status",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "DRAFT SAVED",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(
            height: 25,
            thickness: 1.5,
            color: Colors.grey,
          ),
          const Center(
            child: Text(
              "License Details",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.all(5),
            child: const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "Mr. Person X",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.all(5),
            child: const Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "01/01/1995",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.all(5),
            child: const Row(
              children: [
                Icon(
                  Icons.document_scanner,
                  color: Colors.black,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "DM1392548",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ],
      );
      ;
    case LicenseStatus.learnerExamPassed:
      return const Text('It\'s Wednesday!');
    case LicenseStatus.licenseFeePaid:
      return const Text('It\'s Thursday!');
    case LicenseStatus.paperLicenseGenerated:
      return const Text('It\'s Friday!');
    case LicenseStatus.nodata:
      return const Text('It\'s Friday!');
  }
}

enum LicenseStatus {
  draftSave,
  learnerIssued,
  learnerExamPassed,
  licenseFeePaid,
  paperLicenseGenerated,
  nodata
}

Widget draftSaved(String status, String name, String dob, String refNo) {
  return Column(
    children: [
      const Center(
        child: Text(
          "Status",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      const SizedBox(height: 10),
      const Center(
        child: Text(
          "DRAFT SAVED",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, color: Colors.green, fontWeight: FontWeight.w500),
        ),
      ),
      const Divider(
        height: 25,
        thickness: 1.5,
        color: Colors.grey,
      ),
      const Center(
        child: Text(
          "License Details",
          style: TextStyle(
              fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(5),
        child: const Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.black,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                "Mr. Person X",
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(5),
        child: const Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                "01/01/1995",
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(5),
        child: const Row(
          children: [
            Icon(
              Icons.document_scanner,
              color: Colors.black,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                "DM1392548",
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
