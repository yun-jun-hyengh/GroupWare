<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link
      href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../resources/css/include/include.css" />
</head>
<body>
	<%@ include file="../include/header.jsp" %>
    <div class="container-fluid">
      <div class="row">
        <%@ include file="../include/nav.jsp" %>
        <main class="col-md-10 ms-sm-auto breack">
        <table class="table">
		  <thead>
		    <tr>
		      <th scope="col"><h2 class="fw-bold "> 회사 규칙</h2></th>
		    </tr>
		  </thead>
		  </table>
			<div class="accordion breack" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" >
			       고객에 대한 책무
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOneone">
			      		 제1조 (고객만족경영)
			    	  </button>
			    	</h2>
				    <div id="collapseOneone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사와 임직원은 고객이 회사의 이익과 성장의 원천임을 명심하고, 고객의 요구에 최대한 부응하기 위하여 노력한다.<br>
						임직원은 고객의 다양한 의견에 항상 귀를 기울이고, “고객만족”을 모든 판단 및 행동의 최우선 기준으로 삼는다.<br>
						회사와 임직원은 정직성과 투명성을 바탕으로 고객으로부터 무한한 신뢰와 존중을 받을 수 있도록 끊임없이 노력한다.<br>
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOnetwo">
			      		 제2조 (고품질 경영)
			    	  </button>
			    	</h2>
				    <div id="collapseOnetwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사는 최고의 상품과 서비스를 합리적인 가격으로 제공하며 임직원은 업무 효율을 통하여 원가 절감에 노력한다.<br>
						임직원은 상품안내 · 계약체결 · 신상품 · 약관 및 제도 변경 등의 경우, 그 내용을 숙지하여 고객에게 정확히 알리고 설명 · 답변하며, 회사는 관련사항에 대한 정보를 인터넷 등 각종 매체를 통해 신속 · 정확히 제공한다.<br>
						회사와 임직원은 정직성과 투명성을 바탕으로 고객으로부터 무한한 신뢰와 존중을 받을 수 있도록 끊임없이 노력한다.<br>
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOnethr">
			      		 제3조 (고객의 이익보호)
			    	  </button>
			    	</h2>
				    <div id="collapseOnethr" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사와 임직원은 고객정보 등을 회사재산과 동일하게 보호한다.<br>
						회사와 임직원은 고객과 관련된 정보를 취득한 경우, 고객의 사전승인 없이 그 정보를 누설하거나 타 용도에 사용하지 않는다.<br>
						회사와 임직원은 기타 비윤리적 · 불법적 행위로 고객의 이익을 침해하지 아니한다.<br>
				      </div>
				    </div>
			    
			    </div>
			  </div>
			 	 <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" >
			       주주 및 투자자에 대한 책무
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header " id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwoone">
			      		제4조 (주주의 이익보호)
			    	  </button>
			    	</h2>
				    <div id="collapseTwoone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
						회사는 이익 실현과 합리적인 투자로 주주의 이익보호를 위하여 최선을 다한다.
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwotwo">
			      		 제5조 (주주에 대한 공평한 대우)
			    	  </button>
			    	</h2>
				    <div id="collapseTwotwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사는 모든 주주에게 평등한 대우를 보장한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwothr">
			      		 제6조 (신뢰성 있는 정보제공)
			    	  </button>
			    	</h2>
				    <div id="collapseTwothr" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사는 회사의 현황과 전망에 대한 신뢰성 있고, 유용한 정보를 적극 제공하여, 투자판단에 도움을 주며, 주요 의사결정에 대한 참여기회를 개방한다.
				      </div>
				    </div>
			    	<h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwofor">
			      		 제7조 (투명한 회계처리)
			    	  </button>
			    	</h2>
				    <div id="collapseTwofor" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사는 일반적으로 인정된 기업회계 기준에 따라 재무상태를 기록 · 관리하여 투명한 회계 처리를 하도록 한다.
				      </div>
				    </div>
			    	<h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwofiv">
			      		 제8조 (기업가치에 합당한 평가법)
			    	  </button>
			    	</h2>
				    <div id="collapseTwofiv" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				       회사는 적극적 홍보 · IR 등을 통해 기업가치에 합당한 평가를 받도록 노력한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwosix">
			      		 제9조 (내부정보를 이용한 불공정행위 금지)
			    	  </button>
			    	</h2>
				    <div id="collapseTwosix" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				       임직원은 회사의 재산을 철저히 보호하여야 하며, 회사의 내부정보를 이용한 불공정 증권거래, 영업비밀 침해행위 등 불공정행위를 하여서는 아니 된다.
				      </div>
				    </div>
			    </div>
			  </div>
			  
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThr" >
			       시장질서에 대한 책무
			      </button>
			    </h2>
			    <div id="collapseThr" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header " id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThrone">
			      		제10조 (시장질서의 존중)
			    	  </button>
			    	</h2>
				    <div id="collapseThrone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
						회사는 시장의 자유경쟁원칙에 따라 국내 동일업종의 시장질서를 존중하며, 최적의 상품 및 서비스를 고객에게 제공한다.<br>
						회사는 영업활동을 수행함에 있어서, 경쟁사와의 상호존중 및 선의의 경쟁을 기반으로 하며, 경쟁사의 약점을 부당하게 이용하지 아니한다.<br>
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThrtwo">
			      		제11조 (정보의 정당한 입수 활용)
			    	  </button>
			    	</h2>
				    <div id="collapseThrtwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        임직원은 정보취득 시, 관련법령은 물론 윤리적으로도 적합한 경로와 방법을 통하여야 하며, 경쟁사의 기밀을 불법, 부당하게 취득하지 아니한다.
						임직원은 입수된 정보를 비방광고나 근거 없는 상호비교 등 불법 · 부당하게 이용하지 아니한다.
				      </div>
				    </div>
				    
			    </div>
			  </div>
			   <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFor" >
			       회사와 임직원의 관계
			      </button>
			    </h2>
			    <div id="collapseFor" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header " id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseForone">
			      		제14조 (임직원 존중)
			    	  </button>
			    	</h2>
				    <div id="collapseForone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
						회사는 임직원 개개인을 독립된 인격체로서 대하며, 각자의 기본권을 존중한다.<br>
회사는 임직원이 주인의식을 가지고 일을 통해 긍지와 보람을 성취할 수 있도록 근무 · 교육체제를 확립한다.
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFortwo">
			      		 제15조 (공정한 대우)
			    	  </button>
			    	</h2>
				    <div id="collapseFortwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				       회사는 임직원의 능력과 자질에 따라 공평한 기회를 부여하며, 공정한 기준을 적용하여 평가하고 정당하게 보상한다.<br>
회사는 고용, 업무, 승진 등에 있어서 성별. 종교. 연령. 신체조건. 출신지역 등을 이유로 차별대우를 하지 아니한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseForthr">
			      		 제16조 (인재의 육성과 창의성의 촉진)
			    	  </button>
			    	</h2>
				    <div id="collapseForthr" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        회사는 임직원의 독창적 사고와 자율적 행동을 장려하며, 그 능력 개발을 위해 적극지원하고, 교육의 기회를 제공하며, 장기적인 관점에서 인재를 육성한다.<br>
회사는 임직원이 자유롭게 제안. 건의하고, 애로사항을 표시할 수 있도록 내부제안. 건의제도를 갖추고 분위기를 조성한다.
				      </div>
				    </div>
			    	
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFiv" >
			       회사의 임직원에 대한 의무
			      </button>
			    </h2>
			    <div id="collapseFiv" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header " id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFivone">
			      		제17조 (공정한 직무수행)
			    	  </button>
			    	</h2>
				    <div id="collapseFivone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
						직원은 직무와 관련하여 공정성을 저해할 수 있는 어떠한 형태의 금전적, 비금전적 이익도 이해관계자에게 요구. 수취하거나 전달하지 아니한다.<br>
						직원은 어떠한 경우에도 회사의 재산을 유용, 횡령하는 등 사적 목적을 위해 사용하지 아니하며, 업무수행 시 회사와 개인의 이해가 상충될 경우 회사의 이익을 우선으로 행동한다.
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFivtwo">
			      		 제18조 (사명의 완수)
			    	  </button>
			    	</h2>
				    <div id="collapseFivtwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				      직원은 회사의 경영이념을 공유하고, 주어진 직무를 최선의 방법으로 수행한다.<br>
						임직원은 본인에게 주어진 권한과 책임을 명확히 인식하고, 회사가 추구하는 목표에 부합되도록 권한 내에서 의사결정하고 행동한다.<br>
						직원은 동료 및 관련부서간 적극적인 협조와 원활한 의사소통으로 업무의 효과와 효율을 높인다.<br>
						임직원은 회사의 허가 없이 다른 기업의 직무를 겸하거나 사적 이익 도모의 목적으로 영리사업에 종사하지 아니한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFivthr">
			      		 제19조 (자기계발)
			    	  </button>
			    	</h2>
				    <div id="collapseFivthr" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        임직원은 국제화. 개방화 시대에 바람직한 인재상을 스스로 정립하고, 끊임없는 자기계발을 통해 인재상에 부합되도록 꾸준히 노력한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFivfor">
			      		 제20조 (직장 내 성희롱 방지)
			    	  </button>
			    	</h2>
				    <div id="collapseFivfor" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				        직원은 성희롱이 개인의 인권을 침해하고 직장의 분위기를 저해할 뿐만 아니라, 노동의욕 상실. 업무생산성 저하 등의 결과를 초래하는 위법행위임을 인식하고, 회사의 성희롱방지규정을 준수하며, 이에 저촉되는 일체의 행동을 하지 아니한다.<br>
						음담패설을 삼가고 회식 때 술 시중이나 춤을 강요하지 아니한다.<br>
						회사 동료의 신체에 대해 성적인 평가나 비유를 하지 아니한다.<br>
						불필요한 신체접촉을 삼가고 고정된 성역할을 강조하는 말(여자이기 때문에, 남자이기 때문에 라는)을 하지 아니한다.
				      </div>
				    </div>
			    	
			    </div>
			  </div>
			 <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" >
			       직원상호간의 관계
			      </button>
			    </h2>
			    <div id="collapseSix" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header " id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSixone">
			      		제21조 (직원상호간의 동료의식 재고)
			    	  </button>
			    	</h2>
				    <div id="collapseSixone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
						직장의 상 · 하 동료는 한 가족으로서, 신의와 성실을 바탕으로 결속하여야 한다. 후배는 선배를 존경하고 따르며, 선배는 후배를 존중하며 올바르게 이끈다.<br>
						상사의 업무상 지시에 대하여는 열과 성을 다하여 이행한다. 그러나 그 지시가 명백히 위법. 부당한 경우에는 이를 거부하고, 시정되지 않을 때는 해당 임원 또는 감사에게 보고하여야 한다.<br>
						회사는 직원이 위 보고사항을 공정히 심의 · 처리하며, 이를 이유로 불이익을 가하여서는 아니 된다.
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSixtwo">
			      		 제22조 (직원 상호간의 선물 등 제공 금지)
			    	  </button>
			    	</h2>
				    <div id="collapseSixtwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				      임직원은 하위직급자가 상사에게 개인적으로 금품을 제공하는 행위는 일절 하지 아니한다.<br> 
				      다만, 상사의 하위직급 자에 대한 선물과 상사 또는 동료간의 생일, 전 배, 경조사 등에 사회통념상 인정되는 범위 내에서 부서원들의 가벼운 선물은 예외로 한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSixthr">
			      		제23조 (직원 상호간의 금전거래 금지)
			    	  </button>
			    	</h2>
				    <div id="collapseSixthr" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				       직원 상호간의 금전거래 행위는 조직력 약화, 개인파산 등의 중대한 손실을 초래할 수 있음을 명심하고 직원 상호간에는 금전대차, 담보제공, 보증 등 일체의 금전행위를 하지 아니한다.
				      </div>
				    </div>
			    	
			    </div>
			  </div> 
			  
			  
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSev" >
			       국가와 사회에 대한 책임
			      </button>
			    </h2>
			    <div id="collapseSev" class="accordion-collapse collapse" >
			     	 <h2 class="accordion-header " id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSevone">
			      		제24조 (건전한 기업활동)
			    	  </button>
			    	</h2>
				    <div id="collapseSevone" class="accordion-collapse collapse" >
				      <div class="accordion-body">
						회사는 사무소가 위치한 국내외 주재국 또는 지역사회의 가치관을 존중하고, 각종규범. 통제기준을 준수하며, 건전한 기업문화 창달에 노력한다.<br>
회사는 부동산 투기 등 국민경제를 해치거나 국민정서에 위화감을 조성하는 행위를 하지 아니한다.<br>
회사는 건전한 기업활동을 저해하는 모든 형태의 부조리를 배격한다.<br>
				      </div>
				    </div>
			    
			     	 <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSevtwo">
			      		 제25조 (사회발전에 기여)
			    	  </button>
			    	</h2>
				    <div id="collapseSevtwo" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				     	회사는 고용창출과 납세 기타 각종 의무를 성실히 수행한다.<br>
						회사는 임직원의 건전한 사회활동 및 봉사활동 참여를 보장하고 적극 지원한다.<br>
						회사는 사회 각 계층과 지역주민의 정당한 요구를 겸허하게 수용하며, 이를 해결하는데 최선을 다한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSevthr">
			      		제26조 (정치관여 금지)
			    	  </button>
			    	</h2>
				    <div id="collapseSevthr" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				      	회사는 정치에 관여하지 않는다. 다만, 회사의 이해와 관련되는 정책의 입안이나 법규제정에 대해서는 입장을 표명할 수 있다.<br>
						회사는 임직원의 개인적인 참정권을 존중한다. 임직원은 회사와 관계없는 개인자격으로 정치적 입장을 밝힐 수 있으나, 개인의 견해가 회사의 입장으로 오해 받지 않도록 주의하여야 한다.
				      </div>
				    </div>
				    <h2 class="accordion-header" id="headingOneone">
			     	 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSevfor">
			      		제27조 (부정청탁 금지)
			    	  </button>
			    	</h2>
				    <div id="collapseSevfor" class="accordion-collapse collapse" >
				      <div class="accordion-body">
				      	회사는 어떠한 부정한 청탁도 행하지 아니 한다. 다만 회사의 이해와 관련되는 정책의 청탁이나, 정당한 절차와 방법에 따른 청탁은 예외로 한다.<br>
임직원은 정당하지 아니 하며, 사회 통념상 어긋나는 어떠한 응대와 청탁도 행하지 아니 한다.
				      </div>
				    </div>
			    	
			    </div>
			  </div>
			  
			  
			  
			</div>
			      
        </main>
      </div>
    </div>


   <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
</body>
</html>