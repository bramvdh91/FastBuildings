within FastBuildings.TABSModelIdentification;
model tabs3InpSym4
  "Symmetric floor with four states. Outer resistances and inner resistances, together with their capacities, are equal. One capacity at the measured state, and an input capacity where the heat is put in."

  parameter SI.HeatCapacity cMid = 1 "Thermal capacity of middle slab";
  parameter SI.HeatCapacity c = 1 "Thermal capacity of upper slab";
  parameter SI.HeatCapacity cIn = 1 "Thermal capacity of down slab";
  parameter SI.ThermalResistance r1 = 1
    "Thermal resistance of upper half of lower slab, in K/W";
  parameter SI.ThermalResistance rLong = 1
    "Thermal resistance of lower half of upper slab, in K/W";
  parameter SI.ThermalResistance r2 = 1
    "Thermal resistance of upper half of uppper slab, in K/W";

  Zones.BaseClasses.Resistance resUp1(r=r1/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,24})));
  Zones.BaseClasses.Resistance resDown1(r=r1/2)   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-28})));
  HT.Sources.PrescribedHeatFlow preQIn
    annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
  Modelica.Blocks.Interfaces.RealInput QIn
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  HT.Sensors.TemperatureSensor TMiddle
    annotation (Placement(transformation(extent={{52,2},{72,22}})));
  Zones.BaseClasses.Capacitor capMid(c=cMid) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-4})));
  HT.Sources.PrescribedTemperature TUp
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
  Modelica.Blocks.Interfaces.RealInput TInUp
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  HT.Sources.PrescribedTemperature TDown
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  Modelica.Blocks.Interfaces.RealInput TInDown
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Zones.BaseClasses.Resistance resUp2(r=r2/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,58})));
  Zones.BaseClasses.Resistance resDown2(r=r2/2)   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-68})));
  Zones.BaseClasses.Capacitor capDown(c=c)   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={32,-50})));
  Zones.BaseClasses.Capacitor capUp(c=c)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,40})));
  Zones.BaseClasses.Capacitor capIn(c=cIn) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-10})));
  Zones.BaseClasses.Resistance resLong(r=rLong) "Longitudinal resitance"
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
equation
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-84,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TUp.T, TInUp) annotation (Line(
      points={{-42,90},{-76,90},{-76,80},{-120,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TDown.T, TInDown) annotation (Line(
      points={{-42,-90},{-82,-90},{-82,-80},{-120,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resDown1.heaPor_b, resUp1.heaPor_a) annotation (Line(
      points={{4.44089e-016,-18},{4.44089e-016,10},{-4.44089e-016,10},{-4.44089e-016,
          14}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(TMiddle.port, resUp1.heaPor_a) annotation (Line(
      points={{52,12},{26,12},{26,0},{0,0},{0,14},{-4.44089e-016,14}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capMid.heaPor, resUp1.heaPor_a) annotation (Line(
      points={{20,-4},{10,-4},{10,0},{0,0},{0,14},{-4.44089e-016,14}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(resUp2.heaPor_a, resUp1.heaPor_b) annotation (Line(
      points={{-6.66134e-016,48},{0,48},{0,34}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TUp.port, resUp2.heaPor_b) annotation (Line(
      points={{-20,90},{0,90},{0,68},{6.66134e-016,68}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown1.heaPor_a, resDown2.heaPor_b) annotation (Line(
      points={{0,-38},{0,-58}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TDown.port, resDown2.heaPor_a) annotation (Line(
      points={{-20,-90},{0,-90},{0,-78},{-6.66134e-016,-78}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capDown.heaPor, resDown2.heaPor_b) annotation (Line(
      points={{22,-50},{0,-50},{0,-58},{5.55112e-016,-58}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capUp.heaPor, resUp1.heaPor_b) annotation (Line(
      points={{20,40},{0,40},{0,34},{5.55112e-016,34}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.port, capIn.heaPor) annotation (Line(
      points={{-64,0},{-50,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capIn.heaPor, resLong.heaPor_a) annotation (Line(
      points={{-50,0},{-34,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resLong.heaPor_b, resUp1.heaPor_a) annotation (Line(
      points={{-14,0},{0,0},{4.44089e-016,10},{-4.44089e-016,10},{-4.44089e-016,
          14},{-5.55112e-016,14}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -120},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-120},
            {100,120}}, preserveAspectRatio=false), graphics));
end tabs3InpSym4;
