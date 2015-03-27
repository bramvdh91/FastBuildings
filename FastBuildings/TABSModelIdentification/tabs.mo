within FastBuildings;
model tabs

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
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
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
  connect(resOut1.heaPor_b, preQIn.port) annotation (Line(
      points={{5.55112e-16,-4},{-12,-4},{-12,0},{-22,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-42,0},{-106,0}},
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
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabs;
