import 'package:flutter/material.dart';

void main() {
  runApp(PCMSelectionApp());
}

class PCMSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCM Selection Advisor',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: PCMSelectionHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PCMSelectionHome extends StatefulWidget {
  @override
  _PCMSelectionHomeState createState() => _PCMSelectionHomeState();
}

class _PCMSelectionHomeState extends State<PCMSelectionHome> {
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
  final List<String> _buildingTypes = ['residential', 'office', 'commercial', 'industrial'];
  
  final List<String> _regionTemperatures = [
    'cold (-10°C to 10°C)',
    'cold (-5°C to 15°C)', 
    'moderate (10°C to 30°C)',
    'hot (25°C to 40°C)',
    'hot (30°C to 45°C)'
  ];
  
  final List<String> _buildingMaterials = ['brick', 'wood', 'concrete', 'insulation', 'curtain wall'];
  
  final List<String> _priorityAspects = [
    'technical',
    'economical', 
    'chemical properties',
    'thermodynamic',
    'kinetic properties'
  ];

  final List<String> _climateTypes = [
    'hot-dry during summer',
    'tropics',
    'very hot during summer and mild during winter',
    'mild summer/winter',
    'cold during winter',
    'mediterranean',
    'hot',
    'cold',
    'hot-arid'
  ];

  final List<String> _coolingSystems = [
    'Free running/night ventilation',
    'Mechanical cooling',
    'Mechanical heating and cooling',
    'Mechanical heating'
  ];

  final List<String> _integrationMethods = [
    'macro-encapsulated',
    'micro/nano encapsulated',
    'shape-stabilized PCM (SSPCM)'
  ];

  final List<String> _applicationTypes = [
    'reducing internal heat during day and reuse at night',
    'reducing external heat gain',
    'absorbing external heat during day and reuse at night',
    'peak temperature reduction',
    'peak load shifting',
    'temperature swings reduction',
    'heat gain delay',
    'space heating'
  ];

  final List<String> _pcmThicknesses = [
    '1 mm',
    '2 mm',
    '5 to 7 mm',
    '1-2 cm'
  ];

  final List<String> _wallOrientations = [
    'south',
    'west',
    'north',
    'east'
  ];

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
      _applyMaterialRule1, _applyMaterialRule2, _applyMaterialRule3, _applyMaterialRule4, _applyMaterialRule5,
      _applyMaterialRule6, _applyMaterialRule7, _applyMaterialRule8, _applyMaterialRule9, _applyMaterialRule10,
      _applyMaterialRule11, _applyMaterialRule12, _applyMaterialRule13, _applyMaterialRule14, _applyMaterialRule15,
      _applyMaterialRule16, _applyMaterialRule17, _applyMaterialRule18, _applyMaterialRule19, _applyMaterialRule20,
      _applyMaterialRule21, _applyMaterialRule22, _applyMaterialRule23, _applyMaterialRule24, _applyMaterialRule25,
      _applyMaterialRule26, _applyMaterialRule27, _applyMaterialRule28, _applyMaterialRule29, _applyMaterialRule30,
      _applyMaterialRule31, _applyMaterialRule32, _applyMaterialRule33, _applyMaterialRule34, _applyMaterialRule35,
      _applyMaterialRule36, _applyMaterialRule37, _applyMaterialRule38, _applyMaterialRule39, _applyMaterialRule40,
      _applyMaterialRule41, _applyMaterialRule42, _applyMaterialRule43, _applyMaterialRule44, _applyMaterialRule45,
      _applyMaterialRule46, _applyMaterialRule47, _applyMaterialRule48, _applyMaterialRule49, _applyMaterialRule50,
      _applyMaterialRule51, _applyMaterialRule52, _applyMaterialRule53, _applyMaterialRule54, _applyMaterialRule55,
      _applyMaterialRule56, _applyMaterialRule57, _applyMaterialRule58, _applyMaterialRule59, _applyMaterialRule60,
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
      _justification = 'No specific rule matched. General purpose PCM recommended.';
      _matchedMaterialRule = 0;
    });
  }

  // Positioning Rules (61-120) - ORDERED BY SPECIFICITY
  void _selectPCMPosition() {
    setState(() {
      _selectedPosition = null;
      _positionConfidenceLevel = null;
      _positionJustification = null;
      _matchedPositionRule = null;
    });

    // Apply positioning rules in order of specificity (most specific first)
    List<bool Function()> positionRules = [
      // Most specific rules (multiple conditions)
      _applyPositionRule61, _applyPositionRule62, _applyPositionRule63, _applyPositionRule65, _applyPositionRule66,
      _applyPositionRule67, _applyPositionRule68, _applyPositionRule70, _applyPositionRule71, _applyPositionRule72,
      _applyPositionRule73, _applyPositionRule74, _applyPositionRule77, _applyPositionRule93, _applyPositionRule94,
      _applyPositionRule95, _applyPositionRule96, _applyPositionRule97, _applyPositionRule111, _applyPositionRule112,
      _applyPositionRule113, _applyPositionRule114, _applyPositionRule115, _applyPositionRule117, _applyPositionRule119,
      
      // Medium specificity rules
      _applyPositionRule83, _applyPositionRule84, _applyPositionRule85, _applyPositionRule89, _applyPositionRule98,
      _applyPositionRule116, _applyPositionRule120,
      
      // Less specific but still multiple conditions
      _applyPositionRule75, _applyPositionRule76, _applyPositionRule79, _applyPositionRule80, _applyPositionRule92,
      _applyPositionRule101, _applyPositionRule102, _applyPositionRule103, _applyPositionRule104, _applyPositionRule105,
      _applyPositionRule106, _applyPositionRule107, _applyPositionRule108, _applyPositionRule109, _applyPositionRule110,
      
      // Single condition rules (most general)
      _applyPositionRule69, _applyPositionRule78, _applyPositionRule81, _applyPositionRule82, _applyPositionRule86,
      _applyPositionRule87, _applyPositionRule88, _applyPositionRule90, _applyPositionRule91, _applyPositionRule99,
      _applyPositionRule100,
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
      _positionJustification = 'No specific positioning rule matched. General balanced positioning recommended.';
      _matchedPositionRule = 0;
    });
  }

  // ========== MATERIAL SELECTION RULES (1-60) ==========
  // [Previous material rules remain exactly the same...]
  bool _applyMaterialRule1() {
    if (_buildingType == 'residential' && 
        _regionTemperature == 'moderate (10°C to 30°C)' && 
        _buildingMaterial == 'brick' && 
        _priorityAspect == 'technical') {
      setState(() {
        _selectedPCM = 'sodium nitrate/potassium nitrate eutectic mixture';
        _confidenceLevel = 'High';
        _justification = 'Eutectic mixtures provide stable phase change temperatures and high heat storage capacity.';
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
        _justification = 'Cost-effective for reducing cooling loads in wooden office buildings.';
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
        _justification = 'Good chemical stability for insulation in cold climates.';
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
        _justification = 'Excellent thermodynamic properties for concrete industrial buildings.';
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
        _justification = 'Rapid kinetics for efficient heat transfer in wooden buildings.';
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
        _justification = 'Good compatibility with concrete structures in cold climates.';
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
        _justification = 'Cost-effective thermal regulation for brick commercial buildings.';
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
        _justification = 'Excellent thermodynamic properties for insulation materials.';
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
        _justification = 'Good chemical stability for wooden residential buildings in cold climates.';
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
        _justification = 'Cost-effective for reducing cooling loads in concrete offices.';
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
        _justification = 'Good thermal conductivity and easy integration with wood structures.';
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
        _justification = 'Stable phase change temperatures for moderate climates.';
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
        _justification = 'Fast kinetics for rapid heat absorption in curtain walls.';
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
        _justification = 'Relatively inexpensive for commercial building applications.';
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
        _justification = 'Excellent thermodynamic properties for cold industrial environments.';
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
        _justification = 'Good compatibility with brick structures in hot climates.';
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
        _selectedPCM = 'magnesium nitrate hexahydrate/potassium nitrate eutectic mixture';
        _confidenceLevel = 'High';
        _justification = 'Good chemical stability for harsh hot climate conditions.';
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
        _justification = 'Fast kinetics for quick heat transfer in cold climates.';
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
        _justification = 'Suitable melting temperatures and excellent thermal cycling stability.';
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
        _justification = 'Good compatibility with concrete structures for thermal storage.';
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
        _justification = 'Rapid kinetics for efficient heat transfer in cold environments.';
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
        _justification = 'Cost-effective integration into wood-based residential buildings.';
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
        _justification = 'Good chemical stability for brick walls in cold climates.';
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
        _justification = 'Good thermodynamic properties for wood structures in hot climates.';
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
        _justification = 'Rapid kinetics for concrete structures in moderate climates.';
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
        _justification = 'Cost-effective integration into insulation materials.';
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
        _justification = 'Fast kinetics for rapid heat transfer in brick walls.';
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
        _justification = 'Good compatibility with wood structures for technical performance.';
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
        _justification = 'Excellent thermodynamic properties for concrete in cold environments.';
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
        _justification = 'Good chemical stability for insulation in hot environments.';
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
        _justification = 'Fast kinetics for rapid heat transfer in wood structures.';
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
        _justification = 'Cost-effective thermal regulation for brick commercial buildings.';
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
        _justification = 'Readily available and cost-effective for moderate climates.';
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
        _justification = 'Good chemical stability for concrete in cold climates.';
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
        _justification = 'Good compatibility with wood structures for technical performance.';
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
        _justification = 'Rapid kinetics for efficient heat transfer in brick walls.';
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
        _justification = 'Excellent thermodynamic properties for concrete structures.';
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
        _justification = 'Good chemical stability for reliable thermal regulation.';
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
        _justification = 'Cost-effective thermal regulation for wood structures.';
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
        _justification = 'Good compatibility with wood structures for technical performance.';
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
        _justification = 'Rapid kinetics for efficient heat transfer in brick walls.';
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
        _justification = 'Rapid kinetics for efficient heat transfer in concrete.';
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
        _justification = 'Good chemical stability for reliable thermal regulation.';
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
  // Rules are now ordered by specificity (most specific first)

  bool _applyPositionRule61() {
    if (_climateType == 'hot-dry during summer' && 
        _coolingSystem == 'Free running/night ventilation' && 
        _wallMaterial == 'brick') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves better peak indoor temperature reduction and time delay in perforated brick rooms';
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
        _positionJustification = 'Achieves heat gain reduction within the walls by 10-40% depending on PCM thickness';
        _matchedPositionRule = 62;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule63() {
    if (_climateType == 'very hot during summer and mild during winter' && 
        _coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'concrete') {
      setState(() {
        _selectedPosition = '50 mm from the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves energy reduction by 28-30% in geopolymer concrete walls';
        _matchedPositionRule = 63;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule65() {
    if (_climateType == 'very hot during summer' && 
        _coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'brick') {
      setState(() {
        _selectedPosition = 'Into the middle holes of the brick';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves highest reduction in total heat flux by 82%';
        _matchedPositionRule = 65;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule66() {
    if (_climateType == 'mild summer/winter' && 
        _coolingSystem == 'Free running/night ventilation' && 
        _wallMaterial == 'concrete') {
      setState(() {
        _selectedPosition = 'In the middle part';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves indoor temperature reduction by 2-4°C and indoor relative humidity reduction by 12%';
        _matchedPositionRule = 66;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule67() {
    if (_coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'insulation' && 
        _integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'Within cavity between inner surface and insulation layer OR between first and second insulation layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Helps in the heat discharge process in multi-layered insulation walls';
        _matchedPositionRule = 67;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule68() {
    if (_climateType == 'hot-dry during summer' && 
        _coolingSystem == 'Free running/night ventilation' && 
        _wallMaterial == 'insulation') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves better reduction in indoor air temperature and best performance for absorbing internal and external heat';
        _matchedPositionRule = 68;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule70() {
    if (_coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'wood') {
      setState(() {
        _selectedPosition = 'Distributed as: wood-PCM-wood-PCM-external finishes';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Achieves lowest internal surface temperatures and peak heat flux in wood walls';
        _matchedPositionRule = 70;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule71() {
    if (_climateType == 'hot-dry during summer' && 
        _coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'insulation' &&
        _wallOrientation == 'south') {
      setState(() {
        _selectedPosition = 'Between second and third layer from inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Achieves maximum peak heat flux reduction and delays for south-facing walls';
        _matchedPositionRule = 71;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule72() {
    if (_climateType == 'hot-dry during summer' && 
        _coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'insulation' &&
        _wallOrientation == 'west') {
      setState(() {
        _selectedPosition = 'Between first and second layer from inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Optimal positioning for west-facing walls with rigid foam insulation';
        _matchedPositionRule = 72;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule73() {
    if (_climateType == 'hot-dry during summer' && 
        _coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'insulation' && 
        _integrationMethod == 'micro/nano encapsulated') {
      setState(() {
        _selectedPosition = 'In third insulation layer from outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves maximum temperature reduction during summer in lightweight walls';
        _matchedPositionRule = 73;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule74() {
    if (_climateType == 'cold during winter' && 
        _coolingSystem == 'Mechanical heating' && 
        _wallMaterial == 'insulation' && 
        _integrationMethod == 'micro/nano encapsulated') {
      setState(() {
        _selectedPosition = 'In fourth insulation layer from outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves maximum temperature reduction during winter in lightweight walls';
        _matchedPositionRule = 74;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule77() {
    if (_wallMaterial == 'concrete' && 
        _integrationMethod == 'shape-stabilized PCM (SSPCM)') {
      setState(() {
        _selectedPosition = 'Both behind outer and inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Achieves energy savings during both summer and winter in Chinese climate regions';
        _matchedPositionRule = 77;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule93() {
    if (_regionTemperature?.contains('cold') == true && 
        _applicationType == 'reducing internal heat during day and reuse at night') {
      setState(() {
        _selectedPosition = 'Behind interior surface OR Mid-Interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Allows PCM to directly release energy to space during night after absorbing it during day in cold regions';
        _matchedPositionRule = 93;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule94() {
    if (_regionTemperature?.contains('hot') == true && 
        _applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition = 'Behind exterior surface OR Mid-Exterior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Enables PCM to work as insulation layer that reduces heat gain through wall and reduces temperature swings in hot regions';
        _matchedPositionRule = 94;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule95() {
    if (_regionTemperature?.contains('cold') == true && 
        _applicationType == 'absorbing external heat during day and reuse at night') {
      setState(() {
        _selectedPosition = 'Mid-Interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Optimal location for absorbing sufficient heat during day and releasing acceptable amount during night in cold regions';
        _matchedPositionRule = 95;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule96() {
    if (_regionTemperature?.contains('hot') == true && 
        _applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition = 'Mid-Exterior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Optimal location for absorbing sufficient heat during day and releasing acceptable amount during night in hot regions';
        _matchedPositionRule = 96;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule97() {
    if (_coolingSystem == 'Free running/night ventilation' && 
        _wallOrientation == 'south') {
      setState(() {
        _selectedPosition = 'Towards the interior and away from the middle';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Enables PCM to work as heat insulation layer that keeps heat outside space for walls receiving high solar radiation';
        _matchedPositionRule = 97;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule111() {
    if (_applicationType == 'peak temperature reduction' || 
        _applicationType == 'heat gain delay') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Allows PCM to absorb and delay heat gain, contributing to peak temperature reduction';
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
        _positionJustification = 'Enhances insulation properties by preventing external heat transfer';
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
        _positionJustification = 'Absorbs and releases heat, smoothing out temperature fluctuations and improving thermal comfort';
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
        _positionJustification = 'Allows PCM to absorb and store excess heat during off-peak periods, shifting load to later hours';
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
        _positionJustification = 'Helps reduce total heat flux through wall system, mitigating impact of hot-arid climates';
        _matchedPositionRule = 115;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule117() {
    if (_applicationType == 'space heating' && 
        _pcmThickness == '1-2 cm') {
      setState(() {
        _selectedPosition = 'Towards the exterior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Enhances insulation properties and minimizes heat transfer to interior spaces for space heating';
        _matchedPositionRule = 117;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule119() {
    if (_wallMaterial == 'insulation' && 
        _pcmThickness == '1-2 cm') {
      setState(() {
        _selectedPosition = 'Towards the exterior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Effectively absorbs and releases heat within temperature range close to melting point in uninsulated walls';
        _matchedPositionRule = 119;
      });
      return true;
    }
    return false;
  }

  // Medium specificity rules
  bool _applyPositionRule83() {
    if (_pcmThickness == '1 mm') {
      setState(() {
        _selectedPosition = '1/16 of total wall thickness from inner surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces wall peak heat flux by 9% for thin PCM layers';
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
        _positionJustification = 'Reduces wall peak heat flux by 36% for 2mm PCM layers';
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
        _positionJustification = 'Reduces wall peak heat flux by 55% for 5-7mm PCM layers';
        _matchedPositionRule = 85;
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
        _positionJustification = 'Works as insulation layer that reduces heat gain through the wall when cooling is primary concern';
        _matchedPositionRule = 89;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule98() {
    if (_coolingSystem == 'Mechanical cooling' && 
        _wallMaterial == 'insulation') {
      setState(() {
        _selectedPosition = 'Away from the interior and closer to the middle';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Allows PCM to receive more temperature variation to complete solidification and melting process in high thermal resistance walls';
        _matchedPositionRule = 98;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule116() {
    if (_wallMaterial == 'insulation') {
      setState(() {
        _selectedPosition = 'Away from the interior and towards the middle';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces total heat flux through wall system in highly insulated walls';
        _matchedPositionRule = 116;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule120() {
    if (_wallOrientation == 'south') {
      setState(() {
        _selectedPosition = 'Behind the interior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces heat transfer through wall by utilizing PCM phase change properties in south-oriented walls';
        _matchedPositionRule = 120;
      });
      return true;
    }
    return false;
  }

  // Less specific but still multiple conditions
  bool _applyPositionRule75() {
    if (_integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'Within the cavity';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces energy consumption for summer cooling and winter heating in ventilated double skin façades';
        _matchedPositionRule = 75;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule76() {
    if (_wallMaterial == 'brick' && 
        _integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'In the mid layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces temperature peaks in brick masonry walls';
        _matchedPositionRule = 76;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule79() {
    if (_integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Mitigates flammability issues with paraffinic hydrocarbon PCMs';
        _matchedPositionRule = 79;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule80() {
    if (_integrationMethod == 'micro/nano encapsulated') {
      setState(() {
        _selectedPosition = 'In the wall cavity';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Safe positioning for micro-encapsulated paraffinic PCMs with fire resistance concerns';
        _matchedPositionRule = 80;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule92() {
    if (_wallMaterial == 'concrete' || _wallMaterial == 'brick') {
      setState(() {
        _selectedPosition = 'Towards the exterior surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Allows PCM to receive more temperature variation to complete solidification and melting process in high thermal resistance walls';
        _matchedPositionRule = 92;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule101() {
    if (_applicationType == 'reducing internal heat during day and reuse at night') {
      setState(() {
        _selectedPosition = 'Behind the interior surface or on the Mid-Interior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Optimal locations for absorbing sufficient heat during day and releasing acceptable amount during night';
        _matchedPositionRule = 101;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule102() {
    if (_applicationType == 'reducing external heat gain') {
      setState(() {
        _selectedPosition = 'Behind the exterior surface or on the Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Enables PCM to work as heat retention layer that keeps heat inside space';
        _matchedPositionRule = 102;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule103() {
    if (_applicationType == 'absorbing external heat during day and reuse at night') {
      setState(() {
        _selectedPosition = 'Behind the Mid-Interior Layer or Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Optimal locations for absorbing sufficient heat during day and releasing acceptable amount during night';
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
        _positionJustification = 'Helps absorb and store excess heat during day which can be released during night when free cooling is utilized';
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
        _positionJustification = 'Reduces heat transfer from exterior to interior, reducing load on mechanical cooling systems';
        _matchedPositionRule = 105;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule106() {
    if (_wallMaterial == 'insulation') {
      setState(() {
        _selectedPosition = 'Towards the exterior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Enhances ability to absorb and store heat from external environment, improving thermal performance';
        _matchedPositionRule = 106;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule107() {
    if (_wallOrientation == 'south') {
      setState(() {
        _selectedPosition = 'Towards the interior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Allows PCM to absorb and store solar heat gain, preventing it from reaching interior spaces';
        _matchedPositionRule = 107;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule108() {
    if (_integrationMethod == 'macro-encapsulated') {
      setState(() {
        _selectedPosition = 'Towards the exterior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Facilitates higher heat absorption and storage capacity for high melting temperature PCMs';
        _matchedPositionRule = 108;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule109() {
    if (_integrationMethod == 'micro/nano encapsulated') {
      setState(() {
        _selectedPosition = 'Towards the interior';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Allows better utilization of low melting temperature for interior space applications';
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
        _positionJustification = 'Helps dissipate heat stored in multiple PCM layers, preventing excessive heat buildup';
        _matchedPositionRule = 110;
      });
      return true;
    }
    return false;
  }

  // Single condition rules (most general)
  bool _applyPositionRule69() {
    if (_wallMaterial == 'insulation') {
      setState(() {
        _selectedPosition = 'In the middle part';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Achieves peak reduction in thermal load for insulation materials';
        _matchedPositionRule = 69;
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
        _positionJustification = 'Average energy consumption reduction of 20% in Mediterranean climates';
        _matchedPositionRule = 78;
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
        _positionJustification = 'Leverages thermal mass to absorb heat during day and release it at night in climates with significant diurnal variations';
        _matchedPositionRule = 81;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule82() {
    if (_coolingSystem == 'Mechanical cooling') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Reduces annual cooling loads by 64% when external nighttime temperature is below 27°C';
        _matchedPositionRule = 82;
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
        _positionJustification = 'Reduces heating and cooling loads for buildings in Southern European climates';
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
        _positionJustification = 'Reduces heating and cooling loads for buildings in Central European climates';
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
        _positionJustification = 'Reduces heating and cooling loads for buildings in Northern European climates';
        _matchedPositionRule = 88;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule90() {
    if (_climateType == 'cold') {
      setState(() {
        _selectedPosition = 'Behind the inner surface';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Enables PCM to work as heat retention layer that keeps heat inside the space in cold climates';
        _matchedPositionRule = 90;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule91() {
    if (_climateType == 'cold' || _climateType == 'hot') {
      setState(() {
        _selectedPosition = 'Behind the outer surface';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Helps absorb heat efficiently from solar temperature acting on the wall and release it during night';
        _matchedPositionRule = 91;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule99() {
    if (_regionTemperature?.contains('cold') == true) {
      setState(() {
        _selectedPosition = 'Behind the interior surface or on the Mid-Interior Layer';
        _positionConfidenceLevel = 'High';
        _positionJustification = 'Allows PCM to directly release energy to space during night after absorbing it during day in cold regions';
        _matchedPositionRule = 99;
      });
      return true;
    }
    return false;
  }

  bool _applyPositionRule100() {
    if (_regionTemperature?.contains('hot') == true) {
      setState(() {
        _selectedPosition = 'Behind the exterior surface or on the Mid-Exterior Layer';
        _positionConfidenceLevel = 'Medium';
        _positionJustification = 'Enables PCM to work as insulation layer that reduces heat gain through wall and reduces temperature swings in hot regions';
        _matchedPositionRule = 100;
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
          title: Text('PCM Selection Advisor'),
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
        body: TabBarView(
          children: [
            // Material Selection Tab
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                          _buildDropdown('Building Type', _buildingTypes, _buildingType, 
                              (value) => setState(() => _buildingType = value)),
                          _buildDropdown('Region Temperature', _regionTemperatures, _regionTemperature, 
                              (value) => setState(() => _regionTemperature = value)),
                          _buildDropdown('Building Material', _buildingMaterials, _buildingMaterial, 
                              (value) => setState(() => _buildingMaterial = value)),
                          _buildDropdown('Priority Aspect', _priorityAspects, _priorityAspect, 
                              (value) => setState(() => _priorityAspect = value)),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _selectPCMMaterial,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Text(
                                'Find Recommended PCM Material',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[600],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  if (_selectedPCM != null) ...[
                    SizedBox(height: 20),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.architecture, color: Colors.green, size: 24),
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
                            _buildResultItem('Recommended PCM:', _selectedPCM!, Icons.emoji_objects),
                            _buildResultItem('Confidence Level:', _confidenceLevel!, 
                                _confidenceLevel == 'High' ? Icons.verified : Icons.help_outline),
                            if (_matchedMaterialRule != null && _matchedMaterialRule != 0)
                              _buildResultItem('Matched Rule:', 'Material Rule #$_matchedMaterialRule', Icons.rule),
                            _buildResultItem('Justification:', _justification!, Icons.lightbulb),
                          ],
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
                          _buildDropdown('Climate Type', _climateTypes, _climateType, 
                              (value) => setState(() => _climateType = value)),
                          _buildDropdown('Cooling System', _coolingSystems, _coolingSystem, 
                              (value) => setState(() => _coolingSystem = value)),
                          _buildDropdown('Wall Material', _buildingMaterials, _wallMaterial, 
                              (value) => setState(() => _wallMaterial = value)),
                          _buildDropdown('Integration Method', _integrationMethods, _integrationMethod, 
                              (value) => setState(() => _integrationMethod = value)),
                          _buildDropdown('Application Type', _applicationTypes, _applicationType, 
                              (value) => setState(() => _applicationType = value)),
                          _buildDropdown('PCM Thickness', _pcmThicknesses, _pcmThickness, 
                              (value) => setState(() => _pcmThickness = value)),
                          _buildDropdown('Wall Orientation', _wallOrientations, _wallOrientation, 
                              (value) => setState(() => _wallOrientation = value)),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _selectPCMPosition,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Text(
                                'Find Optimal PCM Position',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[600],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  if (_selectedPosition != null) ...[
                    SizedBox(height: 20),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.place, color: Colors.green, size: 24),
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
                            _buildResultItem('Optimal Position:', _selectedPosition!, Icons.location_on),
                            _buildResultItem('Confidence Level:', _positionConfidenceLevel!, 
                                _positionConfidenceLevel == 'High' ? Icons.verified : Icons.help_outline),
                            if (_matchedPositionRule != null && _matchedPositionRule != 0)
                              _buildResultItem('Matched Rule:', 'Position Rule #$_matchedPositionRule', Icons.rule),
                            _buildResultItem('Justification:', _positionJustification!, Icons.lightbulb),
                          ],
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
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value, ValueChanged<String?> onChanged) {
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
          Container(
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
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}