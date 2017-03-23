function chk() {
	f = document.insertform;
	if (!f.name.value || f.name.value.trim().length == 0) {
		alert('이름을 입력하세요.');
		f.name.value = "";
		f.name.focus();
		return false;
	}
	if (!f.password.value || f.password.value.trim().length == 0) {
		alert('암호를 입력하세요.');
		f.password.value = "";
		f.password.focus();
		return false;
	}
	if (!f.title.value || f.title.value.trim().length == 0) {
		alert('제목을 입력하세요.');
		f.title.value = "";
		f.title.focus();
		return false;
	}
	if (!f.content.value || f.content.value.trim().length == 0) {
		alert('내용을 입력하세요.');
		f.content.value = "";
		f.content.focus();
		return false;
	}
	return true;
}
