within FastBuildings.TABSModelIdentification;
model tabs3InpSimpleSecond
  "Simple tabs model using heat flow as input, and with a single resistance value for top and bottom layers, with an inlet capacity and a capacity in the middle of the floor"

  parameter SI.HeatCapacity cMid = 1 "Thermal capacity of outer slab";
  parameter SI.HeatCapacity cIn = 1
    "Thermal capacity at which energy is added to the floor";
  parameter SI.ThermalResistance r = 1
    "Total thermal resistance of one half of the slab, in K/W";
  parameter SI.ThermalResistance rLong = 1
    "Thermal resistance of the horizontal heat transfer, in K/W";

  Zones.BaseClasses.Resistance resUp(r=r) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,50})));
  Zones.BaseClasses.Resistance resDown(r=r) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-40})));
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
  Zones.BaseClasses.Capacitor capIn(c=cIn) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-38,-32})));
  Zones.BaseClasses.Resistance resLong(r=rLong)
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
equation
  connect(preQIn.Q_flow, QIn) annotation (Line(
      points={{-74,0},{-106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(resUp.heaPor_b, TUp.port) annotation (Line(
      points={{6.66134e-016,60},{0,60},{0,90},{-20,90}},
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
  connect(resDown.heaPor_a, TDown.port) annotation (Line(
      points={{-4.44089e-016,-50},{0,-50},{0,-90},{-20,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resDown.heaPor_b, resUp.heaPor_a) annotation (Line(
      points={{6.66134e-016,-30},{6.66134e-016,10},{0,10},{0,40}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(TMiddle.port, resUp.heaPor_a) annotation (Line(
      points={{52,12},{26,12},{26,0},{0,0},{6.66134e-016,10},{0,10},{0,40},{-5.55112e-016,
          40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(capMid.heaPor, resUp.heaPor_a) annotation (Line(
      points={{20,-4},{10,-4},{10,0},{0,0},{6.66134e-016,10},{0,10},{0,40},{-5.55112e-016,
          40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preQIn.port, capIn.heaPor) annotation (Line(
      points={{-54,0},{-38,0},{-38,-22}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resLong.heaPor_a, capIn.heaPor) annotation (Line(
      points={{-28,0},{-38,0},{-38,-22}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(resLong.heaPor_b, resUp.heaPor_a) annotation (Line(
      points={{-8,0},{0,0},{6.66134e-016,10},{0,10},{0,40},{-5.55112e-016,40}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,120}}), graphics), Icon(coordinateSystem(extent={{-100,-140},
            {100,120}})));
end tabs3InpSimpleSecond;
