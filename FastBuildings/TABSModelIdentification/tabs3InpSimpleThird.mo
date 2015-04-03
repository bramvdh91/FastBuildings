within FastBuildings.TABSModelIdentification;
model tabs3InpSimpleThird
  "Simple tabs model using heat flow as input, and with a single resistance value for top and bottom layers, only 1 capacity"

  parameter SI.HeatCapacity cMid = 1 "Thermal capacity of middle slab";
  parameter SI.HeatCapacity cUp = 1 "Thermal capacity of upper slab";
  parameter SI.HeatCapacity cDown = 1 "Thermal capacity of down slab";
  parameter SI.ThermalResistance rDown1 = 1
    "Thermal resistance of upper half of lower slab, in K/W";
  parameter SI.ThermalResistance rDown2 = 1
    "Thermal resistance of lower half of lower slab, in K/W";
  parameter SI.ThermalResistance rUp1 = 1
    "Thermal resistance of lower half of upper slab, in K/W";
  parameter SI.ThermalResistance rUp2 = 1
    "Thermal resistance of upper half of uppper slab, in K/W";

  Zones.BaseClasses.Resistance resUp1(r=rUp1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,24})));
  Zones.BaseClasses.Resistance resDown1(r=rDown1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-28})));
  HT.Sources.PrescribedHeatFlow preQIn
    annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
  Modelica.Blocks.Interfaces.RealInput QIn
    annotation (Placement(transformation(extent={{-126,-20},{-86,20}})));
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
    annotation (Placement(transformation(extent={{-128,62},{-88,102}})));
  HT.Sources.PrescribedTemperature TDown
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  Modelica.Blocks.Interfaces.RealInput TInDown
    annotation (Placement(transformation(extent={{-128,-110},{-88,-70}})));
  Zones.BaseClasses.Resistance resUp2(r=rUp2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,58})));
  Zones.BaseClasses.Resistance resDown2(r=rDown2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-68})));
  Zones.BaseClasses.Capacitor capDown(c=cDown)
                                             annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={32,-50})));
  Zones.BaseClasses.Capacitor capUp(c=cUp) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,40})));
equation
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-74,0},{-106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TUp.T, TInUp) annotation (Line(
      points={{-42,90},{-76,90},{-76,82},{-108,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TDown.T, TInDown) annotation (Line(
      points={{-42,-90},{-108,-90}},
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

  connect(preQIn.port, resUp1.heaPor_a) annotation (Line(
      points={{-54,0},{0,0},{0,14},{-4.44089e-016,14}},
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
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabs3InpSimpleThird;
