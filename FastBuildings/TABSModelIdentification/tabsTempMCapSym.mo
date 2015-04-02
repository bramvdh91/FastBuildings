within FastBuildings.TABSModelIdentification;
model tabsTempMCapSym
  "Simple tabs model using Pipe temperature as input, and with a single resistance value for top and bottom layers. Additionally, there is a resistance from the pipe to the central point in the floor, at which a third capacitance is added. Symmetrical capacities in top and bottom of the floor."

  parameter SI.HeatCapacity c = 1
    "Thermal capacity of top or bottom half of the floor";
  parameter SI.HeatCapacity cMid = 1 "Thermal capacity of outer slab";
  parameter SI.ThermalResistance r = 1
    "Total thermal resistance of the outer slab, in K/W";
  parameter SI.ThermalResistance rSurUp = 1
    "Conv + rad resistance of the inside surface, in K/W";
  parameter SI.ThermalResistance rSurDown = 1
    "Conv + rad resistance of the outside surface, in K/W";
  parameter SI.ThermalResistance rLong = 1
    "Longitudinal resistance from pipe to center of floor, in K/W";

  Zones.BaseClasses.Capacitor capUp(c=c/2) annotation (Placement(transformation(
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
  Zones.BaseClasses.Capacitor capDown(c=c/2)   annotation (Placement(
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
  HT.Sources.FixedTemperature TBouIn(T=288.15)
    annotation (Placement(transformation(extent={{-68,76},{-48,96}})));
  HT.Sources.FixedTemperature TBouOut(T=288.15)
    annotation (Placement(transformation(extent={{-68,-104},{-48,-84}})));
  HT.Sensors.TemperatureSensor TBouInSen
    annotation (Placement(transformation(extent={{28,50},{48,70}})));
  HT.Sensors.TemperatureSensor TBouOutSen
    annotation (Placement(transformation(extent={{28,-74},{48,-54}})));
  Zones.BaseClasses.Resistance resSurUp(r=rSurUp) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,76})));
  Zones.BaseClasses.Resistance resSurDown(r=rSurDown) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-84})));
  HT.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.RealInput Tin
    annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
  Zones.BaseClasses.Resistance resLong(r=rLong)
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Zones.BaseClasses.Capacitor capMid(c=cMid) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,0})));
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
  connect(resUp2.heaPor_b, TBouInSen.port) annotation (Line(
      points={{5.55112e-16,60},{28,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown2.heaPor_a, TBouOutSen.port) annotation (Line(
      points={{-5.55112e-16,-64},{28,-64}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurUp.heaPor_a,resUp2. heaPor_b) annotation (Line(
      points={{0,66},{0,60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurUp.heaPor_b, TBouIn.port) annotation (Line(
      points={{5.55112e-016,86},{-48,86}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurDown.heaPor_b, resDown2.heaPor_a) annotation (Line(
      points={{6.66134e-16,-74},{0,-74},{0,-64}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resSurDown.heaPor_a, TBouOut.port) annotation (Line(
      points={{-5.55112e-016,-94},{-48,-94}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(prescribedTemperature.T, Tin) annotation (Line(
      points={{-82,0},{-110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resUp1.heaPor_a, resLong.heaPor_b) annotation (Line(
      points={{-5.55112e-016,0},{-22,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resLong.heaPor_a, prescribedTemperature.port) annotation (Line(
      points={{-42,0},{-60,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resUp1.heaPor_a, capMid.heaPor) annotation (Line(
      points={{-5.55112e-016,0},{0,0},{0,1.77636e-015},{12,1.77636e-015}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabsTempMCapSym;
