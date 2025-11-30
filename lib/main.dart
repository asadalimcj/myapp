import 'package:flutter/material.dart';

void main() {
  runApp(PCMSelectionApp());
}

class PCMSelectionApp extends StatelessWidget {
  const PCMSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCM Selection Advisor',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: PCMSelectionHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PCMSelectionHome extends StatefulWidget {
  const PCMSelectionHome({super.key});

  @override
  _PCMSelectionHomeState createState() => _PCMSelectionHomeState();
}

class _PCMSelectionHomeState extends State<PCMSelectionHome>
    with SingleTickerProviderStateMixin {
  // Animation Controller
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // Material Selection Variables
  String? _buildingType;
  String? _regionTemperature;
  String? _buildingMaterial;
  String? _priorityAspect;

  // Positioning Variables
  String? _climateType;
  String? _coolingSystem;
  String? _wallMaterial;
  String? _integrationMethod;
  String? _applicationType;
  String? _pcmThickness;
  String? _wallOrientation;
  String? _wallSystemType;
  String? _pcmType;
  String? _nightTemperature;
  String? _thermalResistance;
  String? _solarRadiation;

  // Results
  String? _selectedPCM;
  String? _selectedPosition;
  String? _confidenceLevel;
  String? _justification;
  String? _positionConfidenceLevel;
  String? _positionJustification;
  int? _matchedMaterialRule;
  int? _matchedPositionRule;

  // Dropdown Options
  final List<String> _buildingTypes = [
    'residential',
    'office',
    'commercial',
    'industrial',
  ];

  final List<String> _regionTemperatures = [
    'cold (-10°C to 10°C)',
    'cold (-5°C to 15°C)',
    'moderate (10°C to 30°C)',
    'hot (25°C to 40°C)',
    'hot (30°C to 45°C)',
  ];

  final List<String> _buildingMaterials = [
    'brick',
    'wood',
    'concrete',
    'insulation',
    'curtain wall',
  ];

  final List<String> _priorityAspects = [
    'technical',
    'economical',
    'chemical properties',
    'thermodynamic',
    'kinetic properties',
  ];

  final List<String> _climateTypes = [
    'hot-dry during summer',
    'tropics',
    'very hot during summer and mild during winter',
    'mild summer/winter especially in April',
    'cold during winter',
    'mediterranean',
    'hot',
    'cold',
    'hot-arid',
  ];

  final List<String> _coolingSystems = [
    'Free running/night ventilation',
    'Mechanical cooling',
    'Mechanical heating and cooling',
    'Mechanical heating',
    'Free running',
  ];

  final List<String> _wallMaterials = [
    'perforated bricks',
    'concrete',
    'geopolymer concrete + insulation materials',
    'insulation materials',
    'bricks with multiple column of holes',
    'two to five insulation materials',
    'five rigid foam insulation materials',
    'wood',
    'brick masonry wall',
    'two insulation materials',
    'five insulation materials',
  ];

  final List<String> _integrationMethods = [
    'macro-encapsulated',
    'micro/nano encapsulated',
    'shape-stabilized PCM (SSPCM)',
  ];

  final List<String> _applicationTypes = [
    'reducing internal heat during day and reuse at night',
    'reducing external heat gain',
    'absorbing external heat during day and reuse at night',
    'peak temperature reduction',
    'peak load shifting',
    'temperature swings reduction',
    'heat gain delay',
    'space heating',
    'heat reduction',
  ];

  final List<String> _pcmThicknesses = ['1 mm', '2 mm', '5 to 7 mm', '1-2 cm'];

  final List<String> _wallOrientations = ['south', 'west', 'north', 'east'];

  final List<String> _wallSystemTypes = [
    'ventilated double skin façade',
    'lightweight type',
  ];

  final List<String> _pcmTypes = [
    'paraffinic hydrocarbon',
    'micro-encapsulated paraffinic',
    'shape-stabilized PCM (SSPCM)',
    'high melting temperature',
    'low melting temperature',
  ];

  final List<String> _nightTemperatures = [
    'below 27°C',
    'above 27°C',
    'around PCM melting temperature',
  ];

  final List<String> _thermalResistances = [
    'high thermal resistance',
    'low thermal resistance',
  ];

  final List<String> _solarRadiations = [
    'high incident solar radiation',
    'low incident solar radiation',
  ];

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    // Start animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Material Selection Rules (1-60)
  void _selectPCMMaterial() {
    setState(() {
      _selectedPCM = null;
      _confidenceLevel = null;
      _justification = null;
      _matchedMaterialRule = null;
    });

    // Apply all 60 material rules in sequence
    List<bool Function()> materialRules = [
      _applyMaterialRule1,
      _applyMaterialRule2,
      _applyMaterialRule3,
      _applyMaterialRule4,
      _applyMaterialRule5,
      _applyMaterialRule6,
      _applyMaterialRule7,
      _applyMaterialRule8,
      _applyMaterialRule9,
      _applyMaterialRule10,
      _applyMaterialRule11,
      _applyMaterialRule12,
      _applyMaterialRule13,
      _applyMaterialRule14,
      _applyMaterialRule15,
      _applyMaterialRule16,
      _applyMaterialRule17,
      _applyMaterialRule18,
      _applyMaterialRule19,
      _applyMaterialRule20,
      _applyMaterialRule21,
      _applyMaterialRule22,
      _applyMaterialRule23,
      _applyMaterialRule24,
      _applyMaterialRule25,
      _applyMaterialRule26,
      _applyMaterialRule27,
      _applyMaterialRule28,
      _applyMaterialRule29,
      _applyMaterialRule30,
      _applyMaterialRule31,
      _applyMaterialRule32,
      _applyMaterialRule33,
      _applyMaterialRule34,
      _applyMaterialRule35,
      _applyMaterialRule36,
      _applyMaterialRule37,
      _applyMaterialRule38,
      _applyMaterialRule39,
      _applyMaterialRule40,
      _applyMaterialRule41,
      _applyMaterialRule42,
      _applyMaterialRule43,
      _applyMaterialRule44,
      _applyMaterialRule45,
      _applyMaterialRule46,
      _applyMaterialRule47,
      _applyMaterialRule48,
      _applyMaterialRule49,
      _applyMaterialRule50,
      _applyMaterialRule51,
      _applyMaterialRule52,
      _applyMaterialRule53,
      _applyMaterialRule54,
      _applyMaterialRule55,
      _applyMaterialRule56,
      _applyMaterialRule57,
      _applyMaterialRule58,
      _applyMaterialRule59,
      _applyMaterialRule60,
    ];

    for (int i = 0; i < materialRules.length; i++) {
      if (materialRules[i]()) {
        return;
      }
    }

    // Default if no rule matches
    setState(() {
      _selectedPCM = 'paraffin wax';
      _confidenceLevel = 'Medium';
      _justification =
          'No specific rule matched. General purpose PCM recommended.';
      _matchedMaterialRule = 0;
    });
  }

  // Positioning Rules (61-120)
  void _selectPCMPosition() {
    setState(() {
      _selectedPosition = null;
      _positionConfidenceLevel = null;
      _positionJustification = null;
      _matchedPositionRule = null;
    });

    // Apply all 60 positioning rules in order (61-120)
    List<bool Function()> positionRules = [
      _applyPositionRule61,
      _applyPositionRule62,
      _applyPositionRule63,
      _applyPositionRule64,
      _applyPositionRule65,
      _applyPositionRule66,
      _applyPositionRule67,
      _applyPositionRule68,
      _applyPositionRule69,
      _applyPositionRule70,
      _applyPositionRule71,
      _applyPositionRule72,
      _applyPositionRule73,
      _applyPositionRule74,
      _applyPositionRule75,
      _applyPositionRule76,
      _applyPositionRule77,
      _applyPositionRule78,
      _applyPositionRule79,
      _applyPositionRule80,
      _applyPositionRule81,
      _applyPositionRule82,
      _applyPositionRule83,
      _applyPositionRule84,
      _applyPositionRule85,
      _applyPositionRule86,
      _applyPositionRule87,
      _applyPositionRule88,
      _applyPositionRule89,
      _applyPositionRule90,
      _applyPositionRule91,
      _applyPositionRule92,
      _applyPositionRule93,
      _applyPositionRule94,
      _applyPositionRule95,
      _applyPositionRule96,
      _applyPositionRule97,
      _applyPositionRule98,
      _applyPositionRule99,
      _applyPositionRule100,
      _applyPositionRule101,
      _applyPositionRule102,
      _applyPositionRule103,
      _applyPositionRule104,
      _applyPositionRule105,
      _applyPositionRule106,
      _applyPositionRule107,
      _applyPositionRule108,
      _applyPositionRule109,
      _applyPositionRule110,
      _applyPositionRule111,
      _applyPositionRule112,
      _applyPositionRule113,
      _applyPositionRule114,
      _applyPositionRule115,
      _applyPositionRule116,
      _applyPositionRule117,
      _applyPositionRule118,
      _applyPositionRule119,
      _applyPositionRule120,
    ];

    for (int i = 0; i < positionRules.length; i++) {
      if (positionRules[i]()) {
        return;
      }
    }

    // Default if no rule matches
    setState(() {
      _selectedPosition = 'Middle of the wall (balanced positioning)';
      _positionConfidenceLevel = 'Medium';
      _positionJustification =
          'No specific positioning rule matched. General balanced positioning recommended.';
      _matchedPositionRule = 0;
    });
  }

  // ========== MATERIAL SELECTION RULES (1-60) ==========

  bool _applyMaterialRule1() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'sodium nitrate/potassium nitrate eutectic mixture';
        _confidenceLevel = 'High';
        _justification =
            'Eutectic mixtures provide stable phase change temperatures and high heat storage capacity.';
        _matchedMaterialRule = 1;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule2() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Cost-effective for reducing cooling loads in wooden office buildings.';
        _matchedMaterialRule = 2;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule3() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'High';
        _justification =
            'Good chemical stability for insulation in cold climates.';
        _matchedMaterialRule = 3;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule4() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Excellent thermodynamic properties for concrete industrial buildings.';
        _matchedMaterialRule = 4;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule5() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Rapid kinetics for efficient heat transfer in wooden buildings.';
        _matchedMaterialRule = 5;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule6() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification =
            'Good compatibility with concrete structures in cold climates.';
        _matchedMaterialRule = 6;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule7() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Cost-effective thermal regulation for brick commercial buildings.';
        _matchedMaterialRule = 7;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule8() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification =
            'Excellent thermodynamic properties for insulation materials.';
        _matchedMaterialRule = 8;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule9() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'High';
        _justification =
            'Good chemical stability for wooden residential buildings in cold climates.';
        _matchedMaterialRule = 9;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule10() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification =
            'Cost-effective for reducing cooling loads in concrete offices.';
        _matchedMaterialRule = 10;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule11() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good thermal conductivity and easy integration with wood structures.';
        _matchedMaterialRule = 11;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule12() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium sulfate decahydrate';
        _confidenceLevel = 'High';
        _justification = 'Cost-effective with high heat absorption capacity.';
        _matchedMaterialRule = 12;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule13() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'sodium nitrate/potassium nitrate eutectic mixture';
        _confidenceLevel = 'High';
        _justification =
            'Stable phase change temperatures for moderate climates.';
        _matchedMaterialRule = 13;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule14() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'magnesium chloride hexahydrate';
        _confidenceLevel = 'Medium';
        _justification = 'Good chemical stability for industrial applications.';
        _matchedMaterialRule = 14;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule15() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'curtain wall' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'High';
        _justification =
            'Fast kinetics for rapid heat absorption in curtain walls.';
        _matchedMaterialRule = 15;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule16() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification = 'Good compatibility with concrete structures.';
        _matchedMaterialRule = 16;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule17() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'High';
        _justification =
            'Relatively inexpensive for commercial building applications.';
        _matchedMaterialRule = 17;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule18() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'Medium';
        _justification = 'Good chemical stability for industrial insulation.';
        _matchedMaterialRule = 18;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule19() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'sodium nitrate/potassium nitrate eutectic mixture';
        _confidenceLevel = 'High';
        _justification = 'High heat storage capacity for cold climate comfort.';
        _matchedMaterialRule = 19;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule20() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification = 'Cost-effective for peak cooling load reduction.';
        _matchedMaterialRule = 20;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule21() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'fatty acids';
        _confidenceLevel = 'High';
        _justification = 'Good kinetic properties for rapid heat transfer.';
        _matchedMaterialRule = 21;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule22() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'sodium sulfate decahydrate';
        _confidenceLevel = 'High';
        _justification =
            'Excellent thermodynamic properties for cold industrial environments.';
        _matchedMaterialRule = 22;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule23() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good compatibility with brick structures in hot climates.';
        _matchedMaterialRule = 23;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule24() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'High';
        _justification = 'Cost-effective for wood-based office buildings.';
        _matchedMaterialRule = 24;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule25() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM =
            'magnesium nitrate hexahydrate/potassium nitrate eutectic mixture';
        _confidenceLevel = 'High';
        _justification =
            'Good chemical stability for harsh hot climate conditions.';
        _matchedMaterialRule = 25;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule26() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification = 'Readily available and cost-effective for insulation.';
        _matchedMaterialRule = 26;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule27() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Fast kinetics for quick heat transfer in cold climates.';
        _matchedMaterialRule = 27;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule28() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin-based PCM (e.g., hexadecane)';
        _confidenceLevel = 'High';
        _justification =
            'Suitable melting temperatures and excellent thermal cycling stability.';
        _matchedMaterialRule = 28;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule29() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good compatibility with concrete structures for thermal storage.';
        _matchedMaterialRule = 29;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule30() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Rapid kinetics for efficient heat transfer in cold environments.';
        _matchedMaterialRule = 30;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule31() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'High';
        _justification =
            'Cost-effective integration into wood-based residential buildings.';
        _matchedMaterialRule = 31;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule32() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'High';
        _justification =
            'Good chemical stability for brick walls in cold climates.';
        _matchedMaterialRule = 32;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule33() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good thermodynamic properties for wood structures in hot climates.';
        _matchedMaterialRule = 33;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule34() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Rapid kinetics for concrete structures in moderate climates.';
        _matchedMaterialRule = 34;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule35() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Cost-effective integration into insulation materials.';
        _matchedMaterialRule = 35;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule36() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Fast kinetics for rapid heat transfer in brick walls.';
        _matchedMaterialRule = 36;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule37() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'High';
        _justification =
            'Good compatibility with wood structures for technical performance.';
        _matchedMaterialRule = 37;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule38() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification =
            'Excellent thermodynamic properties for concrete in cold environments.';
        _matchedMaterialRule = 38;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule39() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Good chemical stability for insulation in hot environments.';
        _matchedMaterialRule = 39;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule40() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'High';
        _justification =
            'Fast kinetics for rapid heat transfer in wood structures.';
        _matchedMaterialRule = 40;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule41() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'High';
        _justification =
            'Cost-effective thermal regulation for brick commercial buildings.';
        _matchedMaterialRule = 41;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule42() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification =
            'Readily available and cost-effective for moderate climates.';
        _matchedMaterialRule = 42;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule43() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'Medium';
        _justification =
            'Good chemical stability for concrete in cold climates.';
        _matchedMaterialRule = 43;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule44() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good compatibility with wood structures for technical performance.';
        _matchedMaterialRule = 44;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule45() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'Medium';
        _justification =
            'Rapid kinetics for efficient heat transfer in brick walls.';
        _matchedMaterialRule = 45;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule46() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'High';
        _justification = 'Cost-effective integration into wood structures.';
        _matchedMaterialRule = 46;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule47() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Excellent thermodynamic properties for concrete structures.';
        _matchedMaterialRule = 47;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule48() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'High';
        _justification =
            'Good chemical stability for reliable thermal regulation.';
        _matchedMaterialRule = 48;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule49() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Cost-effective thermal regulation for wood structures.';
        _matchedMaterialRule = 49;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule50() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification = 'Good thermodynamic properties for brick structures.';
        _matchedMaterialRule = 50;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule51() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'stearic acid';
        _confidenceLevel = 'Medium';
        _justification = 'Good chemical stability for insulation materials.';
        _matchedMaterialRule = 51;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule52() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good compatibility with wood structures for technical performance.';
        _matchedMaterialRule = 52;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule53() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'High';
        _justification =
            'Rapid kinetics for efficient heat transfer in brick walls.';
        _matchedMaterialRule = 53;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule54() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'cold (-10°C to 10°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'economical') {
      setState(() {
        _selectedPCM = 'sodium acetate trihydrate';
        _confidenceLevel = 'Medium';
        _justification = 'Cost-effective integration into wood structures.';
        _matchedMaterialRule = 54;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule55() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification = 'Excellent thermodynamic properties for insulation.';
        _matchedMaterialRule = 55;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule56() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'bio-based fatty acids';
        _confidenceLevel = 'High';
        _justification =
            'Rapid kinetics for efficient heat transfer in concrete.';
        _matchedMaterialRule = 56;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule57() {
    if (_buildingType == 'commercial' &&
        _regionTemperature == 'hot (25°C to 40°C)' &&
        _buildingMaterial == 'wood' &&
        _priorityAspect == 'chemical properties') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification =
            'Good chemical stability for reliable thermal regulation.';
        _matchedMaterialRule = 57;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule58() {
    if (_buildingType == 'industrial' &&
        _regionTemperature == 'moderate (10°C to 30°C)' &&
        _buildingMaterial == 'brick' &&
        _priorityAspect == 'thermodynamic') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'High';
        _justification = 'Good thermodynamic properties for brick structures.';
        _matchedMaterialRule = 58;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule59() {
    if (_buildingType == 'residential' &&
        _regionTemperature == 'cold (-5°C to 15°C)' &&
        _buildingMaterial == 'insulation' &&
        _priorityAspect == 'kinetic properties') {
      setState(() {
        _selectedPCM = 'fatty acids';
        _confidenceLevel = 'High';
        _justification = 'Rapid kinetics for efficient heat storage.';
        _matchedMaterialRule = 59;
      });
      return true;
    }
    return false;
  }

  bool _applyMaterialRule60() {
    if (_buildingType == 'office' &&
        _regionTemperature == 'hot (30°C to 45°C)' &&
        _buildingMaterial == 'concrete' &&
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'paraffin wax';
        _confidenceLevel = 'Medium';
        _justification = 'Good compatibility with concrete structures.';
        _matchedMaterialRule = 60;
      });
      return true;
    }
    return false;
  }

  // ========== POSITIONING RULES (61-120) ==========
  // COMPLETE IMPLEMENTATION OF ALL 60 POSITIONING RULES

  bool _applyPositionRule61() {
    if (_climateType == 'hot-dry during summer' &&
        _coolingSystem == 'Free running/night ventilation' &&
        _wallMaterial == 'perforated bricks') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves better peak indoor temperature reduction and time delay';
        _matchedPositionRule = 61;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule62() {
    if (_climateType == 'tropics' &&
        _coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'concrete') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves heat gain reduction within the walls by 10-40% depending on the PCM thickness';
        _matchedPositionRule = 62;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule63() {
    if (_climateType == 'very hot during summer and mild during winter' &&
        _coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'geopolymer concrete + insulation materials') {
      setState(() {
        _selectedPosition = '50 mm from the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves energy reduction by 28-30%';
        _matchedPositionRule = 63;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule64() {
    if (_coolingSystem == 'Mechanical heating and cooling' &&
        _wallMaterial == 'insulation materials' &&
        _integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'Mid-outer layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves the best results in peak load shifting and reductions during both heating and cooling seasons';
        _matchedPositionRule = 64;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule65() {
    if (_climateType == 'very hot during summer' &&
        _coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'bricks with multiple column of holes') {
      setState(() {
        _selectedPosition = 'Into the middle holes of the brick holes';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves the highest reduction in the total heat flux by 82%';
        _matchedPositionRule = 65;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule66() {
    if (_climateType == 'mild summer/winter especially in April' &&
        _coolingSystem == 'Free running' &&
        _wallMaterial == 'concrete') {
      setState(() {
        _selectedPosition = 'In the middle part';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves indoor temperature reduction by 2-4°C and indoor relative humidity reduction by 12%';
        _matchedPositionRule = 66;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule67() {
    if (_coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'two to five insulation materials' &&
        _integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition =
            'Within cavity between inner surface and insulation layer OR within cavity between first and second insulation layer from inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Helps in the heat discharge process';
        _matchedPositionRule = 67;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule68() {
    if (_climateType == 'hot-dry during summer' &&
        _coolingSystem == 'Free running' &&
        _wallMaterial == 'insulation materials') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves a better reduction in indoor air temperature and the best performance (absorbed internal and external heat)';
        _matchedPositionRule = 68;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule69() {
    if (_coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'two insulation materials') {
      setState(() {
        _selectedPosition = 'In the middle part';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves peak reduction in the thermal load';
        _matchedPositionRule = 69;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule70() {
    if (_coolingSystem == 'Mechanical cooling' && _wallMaterial == 'wood') {
      setState(() {
        _selectedPosition =
            'Distributed as: wood-PCM-wood-PCM-external finishes';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Achieves the lowest internal surface temperatures and peak heat flux';
        _matchedPositionRule = 70;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule71() {
    if (_climateType == 'hot-dry during summer' &&
        _coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'five rigid foam insulation materials' &&
        _wallOrientation == 'south') {
      setState(() {
        _selectedPosition =
            'Within cavity between second and third layer from inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Achieve the maximum peak heat flux reduction and maximum peak heat flux delays';
        _matchedPositionRule = 71;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule72() {
    if (_climateType == 'hot-dry during summer' &&
        _coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'five rigid foam insulation materials' &&
        _wallOrientation == 'west') {
      setState(() {
        _selectedPosition =
            'Within cavity between first and second layer from inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Optimal positioning for west-facing walls';
        _matchedPositionRule = 72;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule73() {
    if (_climateType == 'hot-dry during summer' &&
        _coolingSystem == 'Mechanical cooling' &&
        _wallMaterial == 'five insulation materials' &&
        _integrationMethod == 'micro/nano encapsulated' &&
        _wallSystemType == 'lightweight type') {
      setState(() {
        _selectedPosition = 'In third insulation layer from outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves maximum temperature reduction during summer';
        _matchedPositionRule = 73;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule74() {
    if (_climateType == 'cold during winter' &&
        _coolingSystem == 'Mechanical heating' &&
        _wallMaterial == 'five insulation materials' &&
        _integrationMethod == 'micro/nano encapsulated' &&
        _wallSystemType == 'lightweight type') {
      setState(() {
        _selectedPosition = 'In fourth insulation layer from outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Achieves maximum temperature reduction during winter';
        _matchedPositionRule = 74;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule75() {
    if (_wallSystemType == 'ventilated double skin façade' &&
        _integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'Within the cavity';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Reduces energy consumption for summer cooling and winter heating';
        _matchedPositionRule = 75;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule76() {
    if (_wallMaterial == 'brick masonry wall' &&
        _integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'In the mid layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces temperature peaks';
        _matchedPositionRule = 76;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule77() {
    if (_wallMaterial == 'concrete' &&
        _pcmType == 'shape-stabilized PCM (SSPCM)') {
      setState(() {
        _selectedPosition = 'Both behind outer and inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Achieve energy savings during summer and winter';
        _matchedPositionRule = 77;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule78() {
    if (_climateType == 'mediterranean') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Average energy consumption reduction of 20%';
        _matchedPositionRule = 78;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule79() {
    if (_applicationType == 'fire resistance' &&
        _pcmType == 'paraffinic hydrocarbon') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Mitigates flammability issues';
        _matchedPositionRule = 79;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule80() {
    if (_applicationType == 'fire resistance' &&
        _pcmType == 'micro-encapsulated paraffinic') {
      setState(() {
        _selectedPosition = 'In the wall cavity';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Safe positioning for fire resistance concerns';
        _matchedPositionRule = 80;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule81() {
    if (_climateType == 'hot' || _climateType == 'cold') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Leverages the thermal mass to absorb heat during the day and release it at night';
        _matchedPositionRule = 81;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule82() {
    if (_nightTemperature == 'below 27°C') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces annual cooling loads by 64%';
        _matchedPositionRule = 82;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule83() {
    if (_pcmThickness == '1 mm') {
      setState(() {
        _selectedPosition = '1/16 of total wall thickness from inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces wall peak heat flux by 9%';
        _matchedPositionRule = 83;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule84() {
    if (_pcmThickness == '2 mm') {
      setState(() {
        _selectedPosition = '2/16 of total wall thickness from inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces wall peak heat flux by 36%';
        _matchedPositionRule = 84;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule85() {
    if (_pcmThickness == '5 to 7 mm') {
      setState(() {
        _selectedPosition = '3/16 of total wall thickness from inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces wall peak heat flux by 55%';
        _matchedPositionRule = 85;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule86() {
    if (_climateType == 'mediterranean') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Reduce the heating and cooling loads of building and thus achieve reduced energy usage';
        _matchedPositionRule = 86;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule87() {
    if (_climateType == 'cold') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Reduce the heating and cooling loads of building and thus achieve reduced energy usage';
        _matchedPositionRule = 87;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule88() {
    if (_climateType == 'hot') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Reduce the heating and cooling loads of building and thus achieve reduced energy usage';
        _matchedPositionRule = 88;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule89() {
    if (_climateType == 'hot' && _coolingSystem == 'Mechanical cooling') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Enables PCM to work as an insulation layer that reduces the heat gain through the wall';
        _matchedPositionRule = 89;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule90() {
    if (_climateType == 'cold' && _coolingSystem == 'Mechanical heating') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'To enable the PCM to work as heat retention layer that keeps the heat inside the space';
        _matchedPositionRule = 90;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule91() {
    if (_climateType == 'cold' &&
        _coolingSystem == 'Free running/night ventilation') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'To help absorb the heat efficiently from the solar temperature acting on the wall, and release it during the night';
        _matchedPositionRule = 91;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule92() {
    if (_thermalResistance == 'high thermal resistance' &&
        _pcmType == 'high melting temperature') {
      setState(() {
        _selectedPosition = 'Towards the exterior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'To allow the PCM to receive more temperature variation to complete the solidification and melting process';
        _matchedPositionRule = 92;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule93() {
    if (_climateType == 'cold' &&
        _applicationType ==
            'reducing internal heat during day and reuse at night') {
      setState(() {
        _selectedPosition =
            'Behind the interior surface OR on the Mid-Interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'To allow the PCM to directly release energy to the space during the night after absorbing it during the day';
        _matchedPositionRule = 93;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule94() {
    if (_climateType == 'hot' &&
        _applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition =
            'Behind the exterior surface or on the Mid-Exterior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Enables PCM to work as an insulation layer that reduces heat gain through the wall and reduce temperature swings';
        _matchedPositionRule = 94;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule95() {
    if (_climateType == 'cold' &&
        _applicationType ==
            'absorbing external heat during day and reuse at night') {
      setState(() {
        _selectedPosition = 'On the Mid-Interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Optimal location in absorbing sufficient amount of heat during the day, and release acceptable amount of heat during the night';
        _matchedPositionRule = 95;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule96() {
    if (_climateType == 'hot' &&
        _applicationType == 'reducing external heat gain' &&
        _applicationType ==
            'absorbing external heat during day and reuse at night') {
      setState(() {
        _selectedPosition = 'On the Mid-Exterior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Optimal location in absorbing sufficient amount of heat during the day, and release acceptable amount of heat during the night';
        _matchedPositionRule = 96;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule97() {
    if (_coolingSystem == 'Free running/night ventilation' &&
        _solarRadiation == 'high incident solar radiation') {
      setState(() {
        _selectedPosition = 'Towards the interior and away from the middle';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'To enable the PCM to work as heat insulation layer that keeps the heat outside the space';
        _matchedPositionRule = 97;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule98() {
    if (_coolingSystem == 'Mechanical cooling' &&
        _thermalResistance == 'high thermal resistance') {
      setState(() {
        _selectedPosition = 'Away from the interior and closer to the middle';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'To allow the PCM to receive more temperature variation to complete the solidification and melting process';
        _matchedPositionRule = 98;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule99() {
    if (_climateType == 'cold') {
      setState(() {
        _selectedPosition =
            'Behind the interior surface or on the Mid-Interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'To allow the PCM to directly release energy to the space during the night after absorbing it during the day';
        _matchedPositionRule = 99;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule100() {
    if (_climateType == 'hot') {
      setState(() {
        _selectedPosition =
            'Behind the exterior surface or on the Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Enables PCM to work as an insulation layer that reduces heat gain through the wall and reduce temperature swings';
        _matchedPositionRule = 100;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule101() {
    if (_applicationType ==
        'reducing internal heat during day and reuse at night') {
      setState(() {
        _selectedPosition =
            'Behind the interior surface or on the Mid-Interior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Optimal locations for absorbing sufficient heat during day and releasing acceptable amount during night';
        _matchedPositionRule = 101;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule102() {
    if (_applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition =
            'Behind the exterior surface or on the Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Enables PCM to work as heat retention layer that keeps heat inside space';
        _matchedPositionRule = 102;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule103() {
    if (_applicationType ==
        'absorbing external heat during day and reuse at night') {
      setState(() {
        _selectedPosition =
            'Behind the Mid-Interior Layer or Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Optimal locations for absorbing sufficient heat during day and releasing acceptable amount during night';
        _matchedPositionRule = 103;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule104() {
    if (_coolingSystem == 'Free running/night ventilation') {
      setState(() {
        _selectedPosition = 'Towards the interior and away from the middle';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Helps absorb and store excess heat during day which can be released during night when free cooling is utilized';
        _matchedPositionRule = 104;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule105() {
    if (_coolingSystem == 'Mechanical cooling') {
      setState(() {
        _selectedPosition = 'Away from the interior and towards the middle';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Reduces heat transfer from exterior to interior, reducing load on mechanical cooling systems';
        _matchedPositionRule = 105;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule106() {
    if (_thermalResistance == 'high thermal resistance') {
      setState(() {
        _selectedPosition = 'Towards the exterior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Enhances ability to absorb and store heat from external environment, improving thermal performance';
        _matchedPositionRule = 106;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule107() {
    if (_solarRadiation == 'high incident solar radiation') {
      setState(() {
        _selectedPosition = 'Towards the interior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Allows PCM to absorb and store solar heat gain, preventing it from reaching interior spaces';
        _matchedPositionRule = 107;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule108() {
    if (_pcmType == 'high melting temperature') {
      setState(() {
        _selectedPosition = 'Towards the exterior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Facilitates higher heat absorption and storage capacity for high melting temperature PCMs';
        _matchedPositionRule = 108;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule109() {
    if (_pcmType == 'low melting temperature') {
      setState(() {
        _selectedPosition = 'Towards the interior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Allows better utilization of low melting temperature for interior space applications';
        _matchedPositionRule = 109;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule110() {
    if (_pcmThickness == '1-2 cm') {
      setState(() {
        _selectedPosition = 'Towards the exterior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Helps dissipate heat stored in multiple PCM layers, preventing excessive heat buildup';
        _matchedPositionRule = 110;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule111() {
    if (_applicationType == 'peak temperature reduction' &&
        _applicationType == 'heat gain delay') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Allows PCM to absorb and delay heat gain, contributing to peak temperature reduction';
        _matchedPositionRule = 111;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule112() {
    if (_applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition = 'Behind the exterior surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Enhances insulation properties by preventing external heat transfer';
        _matchedPositionRule = 112;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule113() {
    if (_applicationType == 'temperature swings reduction') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Absorbs and releases heat, smoothing out temperature fluctuations and improving thermal comfort';
        _matchedPositionRule = 113;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule114() {
    if (_applicationType == 'peak load shifting') {
      setState(() {
        _selectedPosition = 'Mid-interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Allows PCM to absorb and store excess heat during off-peak periods, shifting load to later hours';
        _matchedPositionRule = 114;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule115() {
    if (_climateType == 'hot-arid' &&
        _applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition = 'In the middle';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Helps reduce total heat flux through wall system, mitigating impact of hot-arid climates';
        _matchedPositionRule = 115;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule116() {
    if (_thermalResistance == 'high thermal resistance') {
      setState(() {
        _selectedPosition = 'Away from the interior and towards the middle';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Reduces total heat flux through wall system in highly insulated walls';
        _matchedPositionRule = 116;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule117() {
    if (_applicationType == 'space heating' && _pcmThickness == '1-2 cm') {
      setState(() {
        _selectedPosition = 'Towards the exterior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Enhances insulation properties and minimizes heat transfer to interior spaces';
        _matchedPositionRule = 117;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule118() {
    if (_nightTemperature == 'around PCM melting temperature') {
      setState(() {
        _selectedPosition = 'Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification =
            'Absorb and store solar heat gain while ensuring stored heat can be utilized for space heating';
        _matchedPositionRule = 118;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule119() {
    if (_thermalResistance == 'low thermal resistance' &&
        _applicationType == 'heat reduction' &&
        _pcmThickness == '1-2 cm') {
      setState(() {
        _selectedPosition = 'Towards the exterior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Effectively absorbs and releases heat within temperature range close to melting point';
        _matchedPositionRule = 119;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule120() {
    if (_wallOrientation == 'south' && _wallMaterial == 'high glazed façade') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification =
            'Reduces heat transfer through wall by utilizing PCM phase change properties';
        _matchedPositionRule = 120;
      });
      return true;
    }
    return false;
  }

  void _resetForm() {
    setState(() {
      _buildingType = null;
      _regionTemperature = null;
      _buildingMaterial = null;
      _priorityAspect = null;
      _climateType = null;
      _coolingSystem = null;
      _wallMaterial = null;
      _integrationMethod = null;
      _applicationType = null;
      _pcmThickness = null;
      _wallOrientation = null;
      _wallSystemType = null;
      _pcmType = null;
      _nightTemperature = null;
      _thermalResistance = null;
      _solarRadiation = null;
      _selectedPCM = null;
      _selectedPosition = null;
      _confidenceLevel = null;
      _justification = null;
      _positionConfidenceLevel = null;
      _positionJustification = null;
      _matchedMaterialRule = null;
      _matchedPositionRule = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Text('PCM Selection Advisor'),
            ),
          ),
          backgroundColor: Colors.green[700],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.architecture), text: 'Material Selection'),
              Tab(icon: Icon(Icons.place), text: 'Positioning'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetForm,
              tooltip: 'Reset Form',
            ),
          ],
        ),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: TabBarView(
              children: [
                // Material Selection Tab
                SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Student and Supervisor Information
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color.fromARGB(255, 173, 200, 174),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Students: Sidra Idress, Samia, Sally Gogo, Saly Abdou',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Supervisor: Dr. Adel Abdou',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.green[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'PCM Material Selection',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              SizedBox(height: 20),
                              _buildDropdown(
                                'Building Type',
                                _buildingTypes,
                                _buildingType,
                                (value) =>
                                    setState(() => _buildingType = value),
                              ),
                              _buildDropdown(
                                'Region Temperature',
                                _regionTemperatures,
                                _regionTemperature,
                                (value) =>
                                    setState(() => _regionTemperature = value),
                              ),
                              _buildDropdown(
                                'Building Material',
                                _buildingMaterials,
                                _buildingMaterial,
                                (value) =>
                                    setState(() => _buildingMaterial = value),
                              ),
                              _buildDropdown(
                                'Priority Aspect',
                                _priorityAspects,
                                _priorityAspect,
                                (value) =>
                                    setState(() => _priorityAspect = value),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _selectPCMMaterial,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[600],
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  child: Text(
                                    'Find Recommended PCM Material',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (_selectedPCM != null) ...[
                        SizedBox(height: 20),
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.architecture,
                                        color: Colors.green,
                                        size: 24,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'PCM Material Recommendation',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  _buildResultItem(
                                    'Recommended PCM:',
                                    _selectedPCM!,
                                    Icons.emoji_objects,
                                  ),
                                  _buildResultItem(
                                    'Confidence Level:',
                                    _confidenceLevel!,
                                    _confidenceLevel == 'High'
                                        ? Icons.verified
                                        : Icons.help_outline,
                                  ),
                                  if (_matchedMaterialRule != null &&
                                      _matchedMaterialRule != 0)
                                    // _buildResultItem('Matched Rule:', 'Material Rule #$_matchedMaterialRule', Icons.rule),
                                    _buildResultItem(
                                      'Justification:',
                                      _justification!,
                                      Icons.lightbulb,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Positioning Tab
                SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Student and Supervisor Information
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color.fromARGB(255, 167, 185, 168),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Students: Sidra Idress, Samia, Sally Gogo, Saly Abdou',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Supervisor: Dr. Adel Abdou',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.green[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'PCM Positioning',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              SizedBox(height: 20),
                              _buildDropdown(
                                'Climate Type',
                                _climateTypes,
                                _climateType,
                                (value) => setState(() => _climateType = value),
                              ),
                              _buildDropdown(
                                'Cooling System',
                                _coolingSystems,
                                _coolingSystem,
                                (value) =>
                                    setState(() => _coolingSystem = value),
                              ),
                              _buildDropdown(
                                'Wall Material',
                                _wallMaterials,
                                _wallMaterial,
                                (value) =>
                                    setState(() => _wallMaterial = value),
                              ),
                              _buildDropdown(
                                'Integration Method',
                                _integrationMethods,
                                _integrationMethod,
                                (value) =>
                                    setState(() => _integrationMethod = value),
                              ),
                              _buildDropdown(
                                'Application Type',
                                _applicationTypes,
                                _applicationType,
                                (value) =>
                                    setState(() => _applicationType = value),
                              ),
                              _buildDropdown(
                                'PCM Thickness',
                                _pcmThicknesses,
                                _pcmThickness,
                                (value) =>
                                    setState(() => _pcmThickness = value),
                              ),
                              _buildDropdown(
                                'Wall Orientation',
                                _wallOrientations,
                                _wallOrientation,
                                (value) =>
                                    setState(() => _wallOrientation = value),
                              ),
                              _buildDropdown(
                                'Wall System Type',
                                _wallSystemTypes,
                                _wallSystemType,
                                (value) =>
                                    setState(() => _wallSystemType = value),
                              ),
                              _buildDropdown(
                                'PCM Type',
                                _pcmTypes,
                                _pcmType,
                                (value) => setState(() => _pcmType = value),
                              ),
                              _buildDropdown(
                                'Night Temperature',
                                _nightTemperatures,
                                _nightTemperature,
                                (value) =>
                                    setState(() => _nightTemperature = value),
                              ),
                              _buildDropdown(
                                'Thermal Resistance',
                                _thermalResistances,
                                _thermalResistance,
                                (value) =>
                                    setState(() => _thermalResistance = value),
                              ),
                              _buildDropdown(
                                'Solar Radiation',
                                _solarRadiations,
                                _solarRadiation,
                                (value) =>
                                    setState(() => _solarRadiation = value),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _selectPCMPosition,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[600],
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  child: Text(
                                    'Find Optimal PCM Position',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (_selectedPosition != null) ...[
                        SizedBox(height: 20),
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.place,
                                        color: Colors.green,
                                        size: 24,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'PCM Positioning Recommendation',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  _buildResultItem(
                                    'Optimal Position:',
                                    _selectedPosition!,
                                    Icons.location_on,
                                  ),
                                  _buildResultItem(
                                    'Confidence Level:',
                                    _positionConfidenceLevel!,
                                    _positionConfidenceLevel == 'High'
                                        ? Icons.verified
                                        : Icons.help_outline,
                                  ),
                                  if (_matchedPositionRule != null &&
                                      _matchedPositionRule != 0)
                                    // _buildResultItem('Matched Rule:', 'Position Rule #$_matchedPositionRule', Icons.rule),
                                    _buildResultItem(
                                      'Justification:',
                                      _positionJustification!,
                                      Icons.lightbulb,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 6),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                underline: SizedBox(),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
                hint: Text('Select $label'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem(String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.green[600]),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4),
                Text(value, style: TextStyle(color: Colors.grey[800])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
