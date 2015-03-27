within FastBuildings;
model tabs2

  parameter SI.HeatCapacity cIn = 1 "Thermal capacity of inner slab";
  parameter SI.ThermalResistance rIn = 1
    "Total thermal resistance of the inner slab, in K/W";
  parameter SI.HeatCapacity cOut = 1 "Thermal capacity of outer slab";
  parameter SI.ThermalResistance rOut = 1
    "Total thermal resistance of the outer slab, in K/W";
  parameter SI.ThermalResistance rSurIn = 1
    "Conv + rad resistance of the inside surface, in K/W";
  parameter SI.ThermalResistance rSurOut = 1
    "Conv + rad resistance of the outside surface, in K/W";
  parameter SI.ThermalResistance rx = 1
    "Resistance between water and core temperature, in K/W";
  Zones.BaseClasses.Capacitor capIn(c=cIn) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,30})));
  Zones.BaseClasses.Resistance resIn1(r=rIn/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,10})));
  Zones.BaseClasses.Resistance resIn2(r=rIn/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,50})));
  Zones.BaseClasses.Capacitor capOut(c=cOut) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,-34})));
  Zones.BaseClasses.Resistance resOut2(r=rOut/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-54})));
  Zones.BaseClasses.Resistance resOut1(r=rOut/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-14})));
  HT.Sources.PrescribedHeatFlow preQIn
    annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  Modelica.Blocks.Interfaces.RealInput QIn
    annotation (Placement(transformation(extent={{-126,-20},{-86,20}})));
  HT.Sources.FixedTemperature TBouIn(T=288.15)
    annotation (Placement(transformation(extent={{-50,76},{-30,96}})));
  HT.Sources.FixedTemperature TBouOut(T=288.15)
    annotation (Placement(transformation(extent={{-68,-102},{-48,-82}})));
  HT.Sensors.TemperatureSensor TBouInSen
    annotation (Placement(transformation(extent={{28,50},{48,70}})));
  HT.Sensors.TemperatureSensor TBouOutSen
    annotation (Placement(transformation(extent={{28,-74},{48,-54}})));
  Zones.BaseClasses.Resistance resSurIn(r=rSurIn) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,76})));
  Zones.BaseClasses.Resistance resSurOut(r=rSurOut) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-84})));
  Zones.BaseClasses.Resistance resx(r=rx) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-26,0})));
  HT.Sensors.TemperatureSensor TPESen
    annotation (Placement(transformation(extent={{-38,22},{-18,42}})));
equation
  connect(resIn1.heaPor_b, resIn2.heaPor_a) annotation (Line(
      points={{5.55112e-16,20},{-6.66134e-16,20},{-6.66134e-16,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capIn.heaPor, resIn2.heaPor_a) annotation (Line(
      points={{12,30},{0,30},{0,40},{-6.66134e-16,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resOut2.heaPor_b, resOut1.heaPor_a) annotation (Line(
      points={{0,-44},{0,-24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capOut.heaPor, resOut1.heaPor_a) annotation (Line(
      points={{12,-34},{0,-34},{0,-24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resOut1.heaPor_b, resIn1.heaPor_a) annotation (Line(
      points={{6.66134e-16,-4},{0,-4},{0,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-72,0},{-106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resIn2.heaPor_b, TBouInSen.port) annotation (Line(
      points={{5.55112e-16,60},{28,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resOut2.heaPor_a, TBouOutSen.port) annotation (Line(
      points={{-5.55112e-16,-64},{28,-64}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurIn.heaPor_a, resIn2.heaPor_b) annotation (Line(
      points={{0,66},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurIn.heaPor_b, TBouIn.port) annotation (Line(
      points={{5.55112e-16,86},{-30,86}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurOut.heaPor_b, resOut2.heaPor_a) annotation (Line(
      points={{6.66134e-16,-74},{0,-74},{0,-64}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurOut.heaPor_a, TBouOut.port) annotation (Line(
      points={{-5.55112e-16,-94},{-24,-94},{-24,-92},{-48,-92}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.port, resx.heaPor_b) annotation (Line(
      points={{-52,0},{-36,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resIn1.heaPor_a, resx.heaPor_a) annotation (Line(
      points={{-5.55112e-16,0},{-8,0},{-8,-1.22125e-15},{-16,-1.22125e-15}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TPESen.port, resx.heaPor_b) annotation (Line(
      points={{-38,32},{-42,32},{-42,0},{-36,0},{-36,1.22125e-15}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabs2;
