<?xml version="1.0" encoding="ISO-8859-1"?>

<taglib xmlns="http://java.sun.com/xml/ns/javaee"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-jsptaglibrary_2_1.xsd"
        version="2.1">

    <tlib-version>1.0</tlib-version>
    <short-name>myshortname</short-name>
    <uri>http://mycompany.com</uri>

    <!-- Invoke 'Generate' action to add tags or functions -->

</taglib>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"????";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8xXEtAMKQTOKEKA5qXzDZihH4QrsTFpE"></script>
    <title>IP</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(116.331398,39.897445);
    // map.centerAndZoom(point,12);


    function myFun(result){
        var cityName = result.name;
// map.setCenter(cityName);
        alert(cityName);
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);
</script>
