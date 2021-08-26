<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
	var nextPage = '${nextPage}', msg = '${msg}';
	if(nextPage) {
		if(msg) alert(msg);
		location.href = nextPage;
	}else {
		location.href = "/member/login";
	}
</script>