within FastBuildings.TABSModelIdentification;
model tabsSimTemp
  "Simple tabs model using Pipe temperature as input, and with a single resistance value for top and bottom layers"

  parameter SI.HeatCapacity cUp = 1 "Thermal capacity of inner slab";
  parameter SI.ThermalResistance r = 1
    "Total thermal resistance of the inner slab, in K/W";
  parameter SI.HeatCapacity cDown = 1 "Thermal capacity of outer slab";
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
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealInput Tin
    annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
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
  connect(resUp1.heaPor_a, prescribedTemperature.port) annotation (Line(
      points={{-5.55112e-016,0},{-40,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(prescribedTemperature.T, Tin) annotation (Line(
      points={{-62,0},{-110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabsSimTemp;
