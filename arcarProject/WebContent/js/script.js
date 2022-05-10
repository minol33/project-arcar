 function fn_submit(){
	 var f = document.frm;
	 if(f.empno.value == ""){
		 alert("사원번호를 입력해주세요.");
		 f.empno.focus();
		 return false;
	 }
	 if(f.ename.value == ""){
		 alert("사원이름을 입력해주세요.");
		 f.ename.focus();
		 return false;
	 }
	 f.submit();
 }