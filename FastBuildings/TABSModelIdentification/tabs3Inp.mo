within FastBuildings.TABSModelIdentification;
model tabs3Inp
  "Simple tabs model using heat flow as input, and with a single resistance value for top and bottom layers"

  parameter SI.HeatCapacity cUp = 1 "Thermal capacity of inner slab";
  parameter SI.HeatCapacity cDown = 1 "Thermal capacity of outer slab";
  parameter SI.HeatCapacity cMid = 1 "Thermal capacity of outer slab";
  parameter SI.ThermalResistance r = 1
    "Total thermal resistance of one half of the slab, in K/W";
  parameter SI.ThermalResistance rSurUp = 1
    "Conv + rad resistance of the inside surface, in K/W";
  parameter SI.ThermalResistance rSurDown = 1
    "Conv + rad resistance of the outside surface, in K/W";

  Zones.BaseClasses.Capacitor capUp(c=cUp) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,30})));
  Zones.BaseClasses.Resistance resUp1(r=r/2)   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,10})));
  Zones.BaseClasses.Resistance resUp2(r=r/2)   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,50})));
  Zones.BaseClasses.Capacitor capDown(c=cDown) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,-34})));
  Zones.BaseClasses.Resistance resDown2(r=r/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-54})));
  Zones.BaseClasses.Resistance resDown1(r=r/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-14})));
  HT.Sources.PrescribedHeatFlow preQIn
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
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
equation
  connect(resUp1.heaPor_b,resUp2. heaPor_a) annotation (Line(
      points={{5.55112e-16,20},{-6.66134e-16,20},{-6.66134e-16,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capUp.heaPor,resUp2. heaPor_a) annotation (Line(
      points={{12,30},{0,30},{0,40},{-6.66134e-16,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown2.heaPor_b, resDown1.heaPor_a) annotation (Line(
      points={{0,-44},{0,-24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capDown.heaPor, resDown1.heaPor_a) annotation (Line(
      points={{12,-34},{0,-34},{0,-24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown1.heaPor_b, resUp1.heaPor_a) annotation (Line(
      points={{6.66134e-16,-4},{0,-4},{0,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown1.heaPor_b, preQIn.port) annotation (Line(
      points={{5.55112e-016,-4},{-12,-4},{-12,0},{-36,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-56,0},{-106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resUp1.heaPor_a, TMiddle.port) annotation (Line(
      points={{-6.66134e-016,0},{20,0},{20,12},{52,12}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown1.heaPor_b, capMid.heaPor) annotation (Line(
      points={{5.55112e-016,-4},{20,-4}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resUp2.heaPor_b, TUp.port) annotation (Line(
      points={{6.66134e-016,60},{0,60},{0,90},{-20,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TUp.T, TInUp) annotation (Line(
      points={{-42,90},{-76,90},{-76,82},{-108,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resDown2.heaPor_a, TDown.port) annotation (Line(
      points={{-6.66134e-016,-64},{0,-64},{0,-90},{-20,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TDown.T, TInDown) annotation (Line(
      points={{-42,-90},{-108,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabs3Inp;
