function chk(){
	f = document.writed_comment;
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
	if (!f.content.value || f.content.value.trim().length == 0) {
		alert('내용을 입력하세요.');
		f.content.value = "";
		f.content.focus();
		return false;
	}
	return true;
}


function comment_2(mode,idx) {
	f = document.writed_comment;
	f.mode.value = mode;
	f.idx.value = idx;
}

