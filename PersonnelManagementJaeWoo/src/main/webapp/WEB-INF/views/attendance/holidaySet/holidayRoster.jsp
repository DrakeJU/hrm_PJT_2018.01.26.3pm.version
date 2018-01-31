<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/spring/resources/common/css/demo.css">
<link type="text/css" rel="stylesheet" href="/spring/resources/common/helpers/demo.css?v=3110" />
<link type="text/css" rel="stylesheet" href="/spring/resources/common/helpers/media/layout.css?v=3110" />
<link type="text/css" rel="stylesheet" href="/spring/resources/common/helpers/media/elements.css?v=3110" />
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/areas.css?v=3110" />    
        
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/month_white.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/month_green.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/month_transparent.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/month_traditional.css?v=3110" />      
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/navigator_8.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/navigator_white.css?v=3110" />        
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/calendar_transparent.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/calendar_white.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/calendar_green.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/calendar_traditional.css?v=3110" />
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/scheduler_8.css?v=3110" />
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/scheduler_white.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/scheduler_green.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/scheduler_blue.css?v=3110" />    
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/scheduler_traditional.css?v=3110" />
<link type="text/css" rel="stylesheet" href="/spring/resources/common/themes/scheduler_transparent.css?v=3110" />    

<script src="/spring/resources/common/js/daypilot-all.min.js?v=3110" type="text/javascript"></script>

<body>

<div class="main">
	<div class="main-content">
		<div class="container-fluid">
<%-- 		map : ${fn:length(map) } --%>
			<c:forEach items="${map }" var = "item">	
				<c:choose>
					<c:when test="${item.key=='yearMonth' }">
						<input type="hidden" name="yearMonth" value="${item.value }">
					</c:when>
					
					<c:when test="${item.key=='numberOfPeople' }">
						<input type="hidden" name="numberOfPeople" value="${item.value }"> 
					</c:when>
				</c:choose>
			</c:forEach>
			
			<div id="dp"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
    var dp;

	function validate(){
		var numberOfPeople = $('input[name=numberOfPeople]').val();
		var yearMonth = $('input[name=yearMonth]').val();
		var obj = new Object();
		var jArray = new Array();
		
		//근무자 수 설정한 인원값에 맞게 json 데이터 형식으로 맞춰주는 데이터
		for(var i = 0 ; i < numberOfPeople ; i++){
			obj.name = "근무자" + (i+1);
			obj.id = (i+1);
			jArray.push(obj);
			obj = {};
		}
		
		console.log(jArray);
		
		var options = {
            startDate: "",
            days: 31,
            scale: "Day",
            timeHeaders: [
                { groupBy: "Month", format: "MMM yyyy" },
                { groupBy: "Cell", format: "ddd d" }
            ],
            treeEnabled: true,
            resources: [
//                 { name: "Room A", id: "A", expanded: true, children:[
//                     { name : "Room A.1", id : "A.1" },
//                     { name : "Room A.2", id : "A.2" }
//                 ]
//                 },
//                 { name: "Room B", id: "2" },
//                 { name: "Room C", id: "3" },
//                 { name: "Room D", id: "4" },
//                 { name: "Room E", id: "5" },
//                 { name: "Room F", id: "6" },
//                 { name: "Room G", id: "7" },
//                 { name: "Room H", id: "H" },
//                 { name: "Room I", id: "I" },
//                 { name: "Room J", id: "J" },
//                 { name: "Room K", id: "K" },
            ],

            /*
            events: [
                {
                    start: "2014-03-25T00:00:00",
                    end: "2014-03-25T12:00:00",
                    id: DayPilot.guid(),
                    resource: "B",
                    text: "Event"
                }
            ],
            */

            events: [
                {
                    start: "2014-01-25T00:00:00",
                    end: "2014-01-25T12:00:00",
                    id: DayPilot.guid(),
                    resource: "B",
                    text: "Event"
                },
				{
					start: "2014-01-25T00:00:00",
                    end: "2014-01-26T00:00:00",
                    id: DayPilot.guid(),
                    resource: "C",
                    text: "D"
				}
            ],

            // event moving
            onEventMoved: function (args) {
                dp.message("Moved: " + args.e.text());
            },

            // event resizing
            onEventResized: function (args) {
                dp.message("Resized: " + args.e.text());
				
            },

            // event creating
            onTimeRangeSelected: function (args) {
                var name = prompt("New event name:", "Event");
                dp.clearSelection();
                if (!name) return;
                var e = new DayPilot.Event({
                    start: args.start,
                    end: args.end,
                    id: DayPilot.guid(),
                    resource: args.resource,
                    text: name
                });
                dp.events.add(e);
                dp.message("Created");
            },

            scrollTo: "2014-03-25"

        };
		//console.log(JSON.stringify(options.events));

		options.resources = jArray;
		
		//console.log(JSON.stringify(options.resources));
		
		options.startDate = yearMonth;
		
// 		console.log(options.startDate);
// 		console.log(yearMonth);
		
		return options;
	}

    $(document).ready(function() {
		var option2 = validate();
		
        dp = $("#dp").daypilotScheduler(option2);
		dp.allowEventOverlap = false;

		dp.bubble = new DayPilot.Bubble();
		dp.resourceBubble = new DayPilot.Bubble();

		dp.contextMenu = new DayPilot.Menu({items: [
        {text:"Edit", onClick: function(args) { dp.events.edit(args.source); } },
        {text:"Delete", onClick: function(args) { dp.events.remove(args.source); } },
        {text:"-"},
        {text:"Select", onClick: function(args) { dp.multiselect.add(args.source); } },
		]});

		console.log(JSON.stringify(option2.events));
    });

</script>

<script type="text/javascript">
$(document).ready(function() {
    var url = window.location.href;
    var filename = url.substring(url.lastIndexOf('/')+1);
    if (filename === "") filename = "index.html";
    $(".menu a[href='" + filename + "']").addClass("selected");
});
        
</script>
	<!-- /bottom -->

</body>
</html>