within FastBuildings.TABSModelIdentification;
model tabs3InpSimpleSecond
  "Simple tabs model using heat flow as input, and with a single resistance value for top and bottom layers, one capacity per half slab"

  parameter SI.HeatCapacity cUp = 1 "Thermal capacity of upper slab";
  parameter SI.HeatCapacity cDown = 1 "Thermal capacity of lower slab";
  parameter SI.ThermalResistance r = 1
    "Total thermal resistance of one half of the slab, in K/W";

  Zones.BaseClasses.Resistance resUp2(r=r/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,68})));
  Zones.BaseClasses.Resistance resDown2(r=r/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-64})));
  HT.Sources.PrescribedHeatFlow preQIn
    annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
  Modelica.Blocks.Interfaces.RealInput QIn
    annotation (Placement(transformation(extent={{-126,-20},{-86,20}})));
  HT.Sensors.TemperatureSensor TMiddle
    annotation (Placement(transformation(extent={{52,2},{72,22}})));
  HT.Sources.PrescribedTemperature TUp
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
  Modelica.Blocks.Interfaces.RealInput TInUp
    annotation (Placement(transformation(extent={{-128,62},{-88,102}})));
  HT.Sources.PrescribedTemperature TDown
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  Modelica.Blocks.Interfaces.RealInput TInDown
    annotation (Placement(transformation(extent={{-128,-110},{-88,-70}})));
  Zones.BaseClasses.Resistance resUp1(r=r/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,34})));
  Zones.BaseClasses.Resistance resDown1(r=r/2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-28})));
  Zones.BaseClasses.Capacitor capUp(c=cUp) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,50})));
  Zones.BaseClasses.Capacitor capDown(c=cDown) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-50})));
equation
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-74,0},{-106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resUp2.heaPor_b, TUp.port) annotation (Line(
      points={{6.66134e-016,78},{0,78},{0,90},{-20,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TUp.T, TInUp) annotation (Line(
      points={{-42,90},{-76,90},{-76,82},{-108,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TDown.T, TInDown) annotation (Line(
      points={{-42,-90},{-108,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resDown2.heaPor_a, TDown.port) annotation (Line(
      points={{-4.44089e-016,-74},{0,-74},{0,-90},{-20,-90}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(resDown1.heaPor_a, resDown2.heaPor_b) annotation (Line(
      points={{0,-38},{0,-54}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown1.heaPor_b, resUp1.heaPor_a) annotation (Line(
      points={{0,-18},{0,24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resUp1.heaPor_b, resUp2.heaPor_a) annotation (Line(
      points={{0,44},{0,58}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.port, resUp1.heaPor_a) annotation (Line(
      points={{-54,0},{0,0},{0,24},{-5.55112e-016,24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TMiddle.port, resUp1.heaPor_a) annotation (Line(
      points={{52,12},{28,12},{28,0},{0,0},{0,24},{-5.55112e-016,24}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capUp.heaPor, resUp2.heaPor_a) annotation (Line(
      points={{20,50},{0,50},{0,58},{-5.55112e-016,58}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capDown.heaPor, resDown2.heaPor_b) annotation (Line(
      points={{20,-50},{0,-50},{0,-54},{5.55112e-016,-54}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabs3InpSimpleSecond;
