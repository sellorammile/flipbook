import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// Global AudioPlayer
final AudioPlayer _audioPlayer = AudioPlayer();

void main() => runApp(const RepairHoldingsCatalogueApp());

class RepairHoldingsCatalogueApp extends StatelessWidget {
  final int initialIndex;

  const RepairHoldingsCatalogueApp({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repair Holdings Flipbook',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.indigo,
      ),
      home: CatalogueFlipbook(initialIndex: initialIndex),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ------------------ Flipbook ------------------
class CatalogueFlipbook extends StatefulWidget {
  final int initialIndex;

  const CatalogueFlipbook({super.key, this.initialIndex = 0});

  @override
  State<CatalogueFlipbook> createState() => _CatalogueFlipbookState();
}

class _CatalogueFlipbookState extends State<CatalogueFlipbook>
    with TickerProviderStateMixin {
  late int currentIndex;
  late int nextIndex;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  bool isFlipping = false;
  bool flipForward = true;

  final List<CataloguePageData> pages = const [
    CataloguePageData(
      image: 'assets/images/image1.png',
      sections: [
        SectionData(title: "Overview", content: "Information about RH Asphalt"),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image2.png',
      sections: [
        SectionData(
          title: "Introduction",
          content:
              "RH Asphalt (Pty) Ltd is a 100% black-owned subsidiary of Repair Holdings (Pty) Ltd founded in 2024 to provide innovative and sustainable asphalt manufacturing solutions.",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image3.png',
      sections: [
        SectionData(
          title: "Specialize",
          content:
              "We specialize in high-quality, cost-effective Asphalt production for road rehabilitation and maintenance projects across South Africa. \n:As a key player in infrastructure development, RH Asphalt leverages strategic partnerships, including collaboration with Central University of Technology (CUT) and the Department of Community safety, Roads, and Transport",
        ),
        SectionData(
          title: "Partnerships",
          content:
              "These partnerships allow us to actively contribute to major infrastructure programs, such as the Pothole Eradication Program (PEP). \nOur Commitment to quality innovation, and sustainability ensures that we supply high-performance Asphalt, playing a pivotal role in developing durable safer road networks across the region",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image4.png',
      sections: [
        SectionData(
          title: "Company Details",
          content:
              "Company Name: RH Asphalt (Pty) Ltd. \nRegistration Number: 2024/736851/07. \nLegal Entity: Private Company. \nOwnership: 100% Black-Owned.",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image5.png',
      sections: [
        SectionData(
          title: "Our Identity",
          content:
              "Vision Statement \nTo be the leading provider of innovative, sustainable, and high-quality Asphalt manufacturing and supply solutions in South Africa and the SADC region, driving infrastructure excellence and environmental responsibility.",
        ),
        SectionData(
          title: "Our Mission",
          content:
              "Mission Statement \nAt RH Asphalt and optimizing manufacturing processes through continuous research and development \nDelivering durable, High-performance Asphalt Solutions tailored to the evolving needs of the construction and infrastructure sectors \nFostering strong partnerships with clients, suppliers, and community to drive infrastructure development in South Africa and the SADC registration. \nInvesting in cutting-edge technology and skilled to continuous improvement and industry leadership..",
        ),
        SectionData(
            title: "Our Core Values - We Are a CARE Team",
            content:
                "Collaboration - We believe in team work and strong partnerships. \nAdvancement - We embrace innovation and technology. \nReliability - We build trust through quality and Consistency. \nReliability - We build trust through quality and consistency. \nExcellence - We uphold the highest standards in every project"),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image6.png',
      sections: [
        SectionData(
          title: "Our Strategic Pillars & Goals",
          content:
              "Innovation & Product Excellence \nEnhance product durability through continuous R&D. \nUtilize advanced manufacturing technologies and cost-effectiveness \nWorkforce Development & Community Engagement \nInvest in training and skills development for employees. \nCreate job opportunities and engage in social responsibility initiatives.",
        ),
        SectionData(
          title: "Strategic Growth & Market Expansion",
          content:
              "Establish Strong partnerships with government entities, private developers and contractors.\nExpand into the SADC region with innovation-driven solutions",
        ),
        SectionData(
          title: "Sustainability & Environmental Responsibility",
          content:
              "Implement eco-friendly production processes to reduce carbon emissions \nPromote a circular economy by increasing the use of recycled material in asphalt production",
        ),
        SectionData(
          title: "Customer-Centric Approach",
          content:
              "Deliver tailored solutions that meet diverse client needs. \nEnsure exceptional service reliability, and technical expertise. \nOperational Efficency & Safety \nOptimizing the supply chain and logics for timely deliver. \nMaintain the highest safety standard and regulator compliance. ",
        ),
        SectionData(
          title: "Operational Efficiency & Safety",
          content:
              "Implement eco-friendly production processes to reduce carbon emissions \nPromote a circular economy by increasing the use of recycled material",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image7.png',
      sections: [
        SectionData(
          title: "Our Projects & Services",
          content:
              "Pothole Eradication Programme(PEP) \nRH Asphalt actively contributes to the Pothole Eradication Program collaboration with Central University Of Technology(CUT) and the Department of Community.",
        ),
        SectionData(
          title: "Pothole Eradication Programme(PEP)",
          content:
              "RH Asphalt actively contributes to the Pothole Eradication Programme in collaboration with Central University of Technology(CUT) and the Department of Community\nSafety, Roads, and Transport\nWe supply Cold Mix Asphalt(CMA) through Robust Road Repair, ensuring long-term road durability.\nWe prioritize youth training and skills development as part of our community impact.\nOur Bloemfontein-based asphalt plant serves as a key supply hub for ongoing and future road repair initiatives.",
        ),
        SectionData(
          title: "Bloemfontein Asphalt Manufacturing Plant",
          content:
              "Our LAP Series Asphalt Plant is designed for efficiency, mobility, and quality control, ensuring compliance with SABS industry standards.\nMobile unit for easy relocation between job sites\nLower transportation and installation costs.\nFast and easy setup with no need for a fixed foundation.\nFuel-efficient and environmentally friendly operation",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image8.png',
      sections: [
        SectionData(
          title: "Our Products",
          content:
              "Hot Mix Asphalt (HMA). \nDurable and resistant to wear. \nExcellent skid resistance for road safety. \nIdeal for high-tac areas like highways and airports.",
        ),
        SectionData(
          title: "Cold Mix Asphalt",
          content:
              "Specialize high-aromatic solvent for long-lasting viscosity. \nSelf-planing ability no priming required. \nCan be stored for extended periods without losing effectiveness.",
        ),
        SectionData(
          title: "Versatile Solutions for durable infrastructure",
          content:
              "Our instant and permanent repair solution tackles:\nPotholes: Any size, shape, or depth.\nSurface defects:\nUtility repairs:\nInfilling of cable ducts, trenches, and as joint filler.\nManhole and utility cover reinstatement: Around manhole covers, cats eyes, and more.\nMetal and composite bonding: Excellent adhesion to various materials.\nBridge repairs: Deck and core hole repairs for durable restoration.\nTraffic calming measures: Ramping and Construction of speed humps and rumble strips.\nSurface overlays: Complete overlays for a renewed, durable surface.\nOur Robust Repair Asphalt delivers long-lasting results, ensuring a safer, smoother infrastructure.",
        ),
        SectionData(
          title: "Specifications: Compliance with SABS Specifications",
          content:
              "Our aggregates and binders adhere to the following SABS(South African Bureau of Standards) specifications:\nAggregates\nSABS 1083 for road materials, ensuring compliance with standards for:\nGrading\nFlakiness\nCrushing Value\nAdhesion\nAbsorption\nPolishing Value\nBinders:\nCutback Bitumen: SABS 308",
        ),
        SectionData(
          title: "Mechanical Properties",
          content:
              "We maintain strict control over the following mechanical properties to ensure optimal performance:\n Indicator                        Test Value                Method\n Marshall Stability(kN)          5.3          TMH1 C2/86\n Marshall Flow(mm)          2.6          TMH1 C2/86\n Bulk Relative Density          2.432          TMH1 C3/86\n Air Void Content(%)          5.5          TMH1 C2 & C3/86\n Deviation from test method: After compaction the briquettes were left to cure for 8 weeks ",
        ),
        SectionData(
          title:
              "The grading of the product meets the requirements as tabulated below:",
          content:
              "Sieve size(mm)               Cum.Percentage Passing(%)               Method\n13.2                                           100                                                TMH1 B4/86\n9.5                                             100                              \n6.7                                             91                                                        \n4.75                                           48                              \n2.36                                                                           \n1.18                                           14                              \n0.600                             \n0.300                                         17                              \n0.150                                         6                                 \n0.075                                         4.8                              ",
        ),
        SectionData(
          title: "Specifications: Other Characteristics",
          content:
              "Base Bitumen\n Penetration grade:70/100(previously known as 80/100)\n Modified with:\n-Specialized High Aromatic Solvent(for viscosity and penetration)\n-Additives for:\n Anti-Stripping\n Moisture Repellent(improved binder adhesion and coating)\n Anti-Oxidization\n Adhesion Agent\n Workability Enhancer\n Aggregate\n Type:Dolomite(supplied by Afrisam/PPC)\n Workability\n Flows freely out of the bag\n Easily workable with a garden rake\n Priming\n No priming required, self-priming through special solvent & additives.\n Packaging\n 25 kg sealed recycled plastic bags, 200-micron thickness.\n Pallets:1 ton, containing 40 bags, cling wrapped for protection during transportation.",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image9.png',
      sections: [
        SectionData(
            title: "Material Safety Data Sheet",
            content:
                "Section 1:     Product and Company Information\nProduct Name:     RH Asphalt\nCompany Name:    RH Asphalt(Pty)Ltd\n Address:        33 Donald Murray Avenue\n                             Park West, Bloemfontein, 9301\n Telephone:        051-247-5059\n           M.Hallett "),
        SectionData(
          title: "Section 2: COMPOSITION / INFORMATION ON THE THE INGREDIENTS",
          content:
              "Our cold asphalt is road surfacing and road maintenance material consisting of bitumen and crushed stone aggregates. The product is packed in handy, spill free 25kg green or clear plastic bags.\n Binder: Petroleum distillate(Bitumen)CAS No888955-27-1. Occupational Health and Safety Act: Annexure 1 OEL and BEI Tables.\n RH Asphalt in its final packaged from and under normal use poses no hazards since the liquid bitumen and stone aggregates are integrated.",
        ),
        SectionData(
          title:
              "Section 3: HAZARDOUS IDENTIFICATION\n EEC Hazard Classification: Not dangerous Hazard Risk Symbols: None",
          content:
              "Quality Control\n Manufactured under stringent quality control measures\n Aggregates pre-dried in a gas-heated drying tunnel.\n Specialized moisture repellent ensure uniform coating of stone with bitumen binder.\n Shelf Life\n Meets specifications for months after delivery date if handled and stored correctly",
        ),
        SectionData(
          title:
              "Section 4: FIRST AID MEASURES CONTACT WITH SKIN:\n After contact with skin, wash immediately with plenty of soap and water(S28)",
          content:
              "CONTACT WITH EYES:\n if substance has got into eyes, immediately wash out with plenty of water. Seek medical attention if irritation persists\n INGESTION\n Rinse mouth with water(do not swallow)\n IHALATION:\n Inhalation is unlikely to occur.",
        ),
        SectionData(
          title: "Section 5: FIRE-FIGHTING MEASURES",
          content:
              "Not Flammable and will not support combustion. There are no specific hazards. In case of fire use extinguishing media appropriate to surrounding conditions",
        ),
        SectionData(
          title: "Section 6: ACCIDENTAL RELEASE",
          content:
              "Collect as much as possible in clean container for reuse or disposal in landfill site. Disposal should be in accordance with local, state or national legislation. ",
        ),
        SectionData(
          title: "Section 7: HANDLING AND STORAGE",
          content:
              "Wash Thoroughly after use.\n Keep Containers/ bags tightly close in a cool, well-ventilated place",
        ),
        SectionData(
          title: "Section 8: EXPOSURE CONTROLS/PERSONAL PROTECTION",
          content:
              "Use a suitable barrier cream to protect skin and or wear suitable gloves",
        ),
        SectionData(
          title: "Section 9: PHYSICAL AND CHEMICAL PROPERTIES",
          content:
              "Soli, black, granuies insoluble in water White spirit odour Boiling point - not applicable Ph - not applicable Bulk density approx 1700kg/m*3(Loose Vapour pressure - not applicable Water solubility - not applicable Fat solubility - not applicable Partition coefficient: n-Octanol/water not applicable)",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image10.png',
      sections: [
        SectionData(
          title: "Section 10: STABILITY AND REACTIVITY",
          content: "Stable",
        ),
        SectionData(
          title: "Section 11: TOXICOLOGICAL INFORMATION",
          content: "Non-Toxic",
        ),
        SectionData(
          title: "Section 12: ECOLOGICAL INFORMATION",
          content: "Presents no hazard to the environment",
        ),
        SectionData(
          title: "Section 13: DISPOSAL INFORMATION",
          content:
              "Collect as much as possible in clean container for reuse or disposal in landfill site. Disposal should be in a accordance with local, state or national",
        ),
        SectionData(
          title: "Section 14: TRANSPORT INFORMATION",
          content: "The COSHH Regulation apply in the UK.",
        ),
        SectionData(
          title: "Section 16: OTHER INFORMATION",
          content:
              "In case of any discomfort always seek medical advice. All information is given in good faith but without guarantee in respect of accuracy.\n No responsibility is accepted for errors or omissions or the consequences thereof",
        ),
      ],
    ),
    CataloguePageData(
      image: 'assets/images/image11.jpg',
      sections: [
        SectionData(
          title: "Contact Information",
          content:
              "📍 Office Address: N1 Avenham turnoff, Mimosa Glen 885/9\n☎ Telephone: TBC\n📧 Emails: lucia@repairholdings.co.za, mark@repairholdings.co.za\n🌐 Website: www.repairholdings.co.za\n🕔 Operating Hours: Monday to Friday (07:30 - 17:30)",
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    nextIndex = currentIndex;

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currentIndex = nextIndex;
          _flipController.reset();
          isFlipping = false;
        });
      }
    });
  }

  Future<void> _playFlipSound() async {
    try {
      await _audioPlayer.setAsset('assets/sounds/flip.mp3');
      await _audioPlayer.setVolume(0.0);
      _audioPlayer.play();

      // Fade in
      for (double v = 0.0; v <= 1.0; v += 0.1) {
        await Future.delayed(const Duration(milliseconds: 20));
        _audioPlayer.setVolume(v);
      }

      // Fade out
      Future.delayed(const Duration(milliseconds: 200), () async {
        for (double v = 1.0; v >= 0.0; v -= 0.1) {
          await Future.delayed(const Duration(milliseconds: 20));
          _audioPlayer.setVolume(v);
        }
        _audioPlayer.stop();
      });
    } catch (e) {
      print("Error playing flip sound: $e");
    }
  }

  Future<void> flipToPage(int newIndex, {bool forward = true}) async {
    if (newIndex < 0 || newIndex >= pages.length || isFlipping) return;

    _playFlipSound();

    setState(() {
      isFlipping = true;
      nextIndex = newIndex;
      flipForward = forward;
    });

    await _flipController.forward();
  }

  @override
  void dispose() {
    _flipController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = pages[currentIndex];
    final nextPage = pages[nextIndex];

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null &&
              details.primaryVelocity! < -200) {
            if (currentIndex < pages.length - 1)
              flipToPage(currentIndex + 1, forward: true);
          } else if (details.primaryVelocity != null &&
              details.primaryVelocity! > 200) {
            if (currentIndex > 0) flipToPage(currentIndex - 1, forward: false);
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: AnimatedBuilder(
              animation: _flipController,
              builder: (context, child) {
                double angle = _flipAnimation.value;
                if (!flipForward) angle = -angle;

                bool showNext = angle > pi / 2 || angle < -pi / 2;
                double shadowOpacity = sin(angle).abs() * 0.5;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isFlipping)
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: flipForward
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                end: flipForward
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                colors: [
                                  Colors.black.withOpacity(shadowOpacity * 0.4),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle)
                        ..scale(1.0 - 0.05 * sin(angle), 1.0, 1.0),
                      child: ClipPath(
                        clipper: PageCurlClipper(angle, flipForward),
                        child: showNext
                            ? CataloguePage(data: nextPage)
                            : CataloguePage(data: currentPage),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black.withOpacity(0.05),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Page ${currentIndex + 1} of ${pages.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 14 : 8,
                  height: currentIndex == index ? 14 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Colors.indigo
                        : Colors.indigo.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16),
          if (currentIndex > 0)
            FloatingActionButton.extended(
              heroTag: 'prev',
              onPressed: () => flipToPage(currentIndex - 1, forward: false),
              label: const Text("Previous"),
              icon: const Icon(Icons.arrow_back),
            ),
          const Spacer(),
          if (currentIndex < pages.length - 1)
            FloatingActionButton.extended(
              heroTag: 'next',
              onPressed: () => flipToPage(currentIndex + 1, forward: true),
              label: const Text("Next"),
              icon: const Icon(Icons.arrow_forward),
            ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

// ------------------ Page Curl Clipper ------------------
class PageCurlClipper extends CustomClipper<Path> {
  final double angle;
  final bool forward;

  PageCurlClipper(this.angle, this.forward);

  @override
  Path getClip(Size size) {
    final Path path = Path();
    double curl = sin(angle) * 40;
    if (forward) {
      path.moveTo(0, 0);
      path.lineTo(size.width - curl, 0);
      path.quadraticBezierTo(
          size.width, size.height / 2, size.width - curl, size.height);
      path.lineTo(0, size.height);
      path.close();
    } else {
      path.moveTo(curl, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(curl, size.height);
      path.quadraticBezierTo(0, size.height / 2, curl, 0);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(covariant PageCurlClipper oldClipper) =>
      oldClipper.angle != angle || oldClipper.forward != forward;
}

// ------------------ Data Models ------------------
class CataloguePageData {
  final String image;
  final List<SectionData> sections;

  const CataloguePageData({
    required this.image,
    required this.sections,
  });
}

class SectionData {
  final String title;
  final String content;

  const SectionData({
    required this.title,
    required this.content,
  });
}

// ------------------ Catalogue Page ------------------
class CataloguePage extends StatefulWidget {
  final CataloguePageData data;

  const CataloguePage({super.key, required this.data});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage>
    with SingleTickerProviderStateMixin {
  bool _showOverlay = false;

  void _toggleOverlay() => setState(() => _showOverlay = !_showOverlay);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOverlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage(widget.data.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: _showOverlay ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  padding: const EdgeInsets.all(20),
                  color: Colors.black.withOpacity(0.1),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.data.sections
                          .map(
                              (section) => SmoothAnimatedCard(section: section))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ Smooth Animated Card ------------------
class SmoothAnimatedCard extends StatefulWidget {
  final SectionData section;

  const SmoothAnimatedCard({required this.section});

  @override
  State<SmoothAnimatedCard> createState() => _SmoothAnimatedCardState();
}

class _SmoothAnimatedCardState extends State<SmoothAnimatedCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggle() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_isExpanded ? 0.25 : 0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.section.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: _toggle,
          ),
          ClipRect(
            child: AnimatedAlign(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 350),
              heightFactor: _isExpanded ? 1.0 : 0.0,
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 350),
                  opacity: _isExpanded ? 1 : 0,
                  child: Text(
                    widget.section.content,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
