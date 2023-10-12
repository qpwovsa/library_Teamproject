<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#calenderWrap{
	
	}
    #cal { 
      border-spacing:0px;
      box-sizing: border-box;
    }
    #cal tr{
    	height: 125px;
    }
    #cal tr:nth-child(1){
    	height: 50px;
	    background: #f6f6f6;
    }
    #cal tr:nth-child(1) td{
    	border-top:1px solid #5e6062;
    }
    #cal td {
		border-bottom: 1px solid #e5e8eb;
		border-right: 1px solid #e5e8eb;
		text-align:center;
		font-size: 14px;
		font-family: 'NotoSansM';
		padding: 20px;
	    vertical-align: top;
	    text-align: left;
    }
    #cal tr:first-child td{
    	padding: 0;
	    vertical-align: middle;
	    text-align: center;
    }
    #cal tr td:first-child {
		color:#ec2626;
		border-left: 1px solid #e5e8eb;
    }
    #cal tr td:last-child {
      color:#00679d;
    }
    #cal .inner {
	    font-size: 13px;
	    width: 100px;
	    height: 20px;
	    margin-top: 8px;
	    color: #555;
	}
	#cal .inner:after{
		display:block;
		content: "";
		position: absolute;
		left: 0;
		
	}
	caption{
		height: 66px;
	    font-size: 25px;
	    font-family: 'NotoSansM';
	    color: #333;
	    letter-spacing: 1px;
	}
	#prev{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	    display: inline-block;
	    background-position-y: -27px;
	    vertical-align: middle;
	    margin-right: 15px;
	    cursor: pointer;
	    position: relative;
	    top: -2px;
	}
	#next{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	    display: inline-block;
	    background-position-y: -52px;
	    vertical-align: middle;
	    margin-left: 15px;
	    cursor: pointer;
	    position: relative;
	    top: -2px;
	}
	.inner i{
		background: url(/static/img/calender/icon_schedule_r.gif) 0 0 no-repeat;
	    display: inline-block;
	    width: 13px;
	    height: 13px;
	    vertical-align: middle;
	    margin-right: 2px;
	}
	#sswrap{
		position: relative;
	}
	.ss{
		position: absolute;
	    display: inline-block;
	    width: 36px;
	    height: 36px;
	    background: #171d33;
	    top: 12px;
	    left: 10px;
	    border-radius: 50%;
	}
	.to{
	    position: relative;
	    z-index: 3;
	    color: #fff;
	}
	.chktd{
		position: relative;
	}
</style>
<script>
	function calView(y,m)
	{
		if(!y) 
		/* 달력의 y,m를 받아와야해서 , 매개변수 받아줘야한다!  */
		{
			var today=new Date();
			var y=today.getFullYear();
			var m=today.getMonth();
		}
		if(m == -1)
		{
			y=y-1;
			m=11;
		}

		if(m == 12)
		{
			y=y+1;
			m=0;
		}	
		
		var todate=new Date();
		var aa=todate.getDate(); // 오늘날짜
		var bb=todate.getMonth()+1; //오늘월 
		var cc=todate.getFullYear(); //오늘년도
		
		var xday=new Date(y,m,1);
		
		var month=[31,28,31,30,31,30,31,31,30,31,30,31];
		var chong=month[m];
		var yoil=xday.getDay();
		
		if( (y % 4 == 0 && y % 100 != 0) || y%400 == 0 )
		{
			if(m == 1)
				chong =chong+1;
		}
		
		var ju=Math.ceil( (chong+yoil)/7 );
		
		var calData="<table id='cal'>";
	
		calData=calData+"<caption>";
		
		calData=calData+"<span onclick='calView("+y+","+(m-1)+")' id='prev'></span>"; // 이전달
		
		calData=calData+y+"년 "+(m+1)+"월"; // 년월 출력
		
		calData=calData+"<span onclick='calView("+y+","+(m+1)+")' id='next'></span>"; // 다음달
		
		calData=calData+" </caption>";
		calData=calData+"<tr>";
		calData=calData+"<td>일</td>";
		calData=calData+"<td>월</td>";
		calData=calData+"<td>화</td>";
		calData=calData+"<td>수</td>";
		calData=calData+"<td>목</td>";
		calData=calData+"<td>금</td>";
		calData=calData+"<td>토</td>";
		calData=calData+"</tr>";
		
		var day=1;
		
		for(i=1; i<=ju; i++)
		{
			calData=calData+"<tr>";
			
			for(j=0; j<7; j++)
			{		
				if( (i==1 && j<yoil) || chong < day)
				{
					calData=calData+"<td> &nbsp; </td>";
				}
				else 
				{	
					var sday=y+"-"+(m+1)+"-"+day;
	
					/*
						빈값을 만들고 , 그 빈값에 값을 넣어주고
						그 해당하는 값에 필요한 값을 넣어준다.
					*/
					var insertText="";
					
					var inback="";
					
					if( j == 5 ) // 휴관일 체크
					{
						insertText="휴관일";
						calData=calData+"<td  class='chktd' onclick='thisDay("+y+","+(m+1)+","+day+")'>"+inback+day+
						"<div class='inner'><i></i>"+insertText+"</div></td>";
					}
					else if(day==aa && (m+1)==bb && y==cc) // 오늘날짜
					{
						calData=calData+"<td  class='chktd' onclick='thisDay("+y+","+(m+1)+","+day+")'><div class='ss'></div><span class='to'>"+inback+day+
						"</span><div class='inner'>"+insertText+"</div></td>";
					}
					else // 휴관일,공휴일이 아닐 경우
					{
						calData=calData+"<td  class='chktd' onclick='thisDay("+y+","+(m+1)+","+day+")'>"+inback+day+
						"<div class='inner'>"+insertText+"</div></td>";
					} 
					
					day++;
				}
				
			}
			calData=calData+"</tr>";
		}
		// 달력 출력
		document.getElementById("calender").innerHTML=calData;
		
		/* 
		 db에서 값을 가져와야하기때문에 , ajax를 통해서 값 보내주기!
		 단 값을 보낼땐 함수명을 다르게 해서 만들어줘야 한다!
		*/
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			var data=JSON.parse(chk.responseText);
			var str=data.str;
			for(i=0; i<data.length; i++)
			{
				document.getElementsByClassName("chktd")[data[i].xday-1].querySelector('.inner').style.color="#a50000 ";
				document.getElementsByClassName("inner")[data[i].xday-1].innerHTML="<span>"+data[i].str+"</span>"; 
			}
		}
			chk.open("get","cal2?y="+y+"&m="+(m+1));
			chk.send();
		}
		
	
	/* calview 호출 */
	window.onload=function()
	{
		calView();
	}
	
	function thisDay(y,m,d)
	{
		m=m+"";
		d=d+"";
		m=m.padStart(2,'0');
		d=d.padStart(2,'0');
		
		document.getElementById("calender").value=y+"-"+m+"-"+d;
	}

</script>
</head>
<body>
	<!--
		sitemesh에 제이쿼리 onload가 있어서 , 충돌이 생김 그래서
		익명함수를 통해 함수를 호출한다.
	-->
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관일정</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/calender/calenderTab"><span>도서관일정</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서관일정</h3>
					<p>도서관 일정</p>
				</div>
				<div id="contents">
					<div id="calenderWrap">
						<div id="calender">
						</div>		
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>