<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
function checkUserRole() {
    fetch('/manage/checkRole')
        .then(response => response.text())
        .then(role => {
            if (role !== 'm' && role !== 'M') {
                window.location.href = '/manage/manageLoginForm';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            window.location.href = '/manage/manageLoginForm';
        });
}

document.addEventListener('DOMContentLoaded', (event) => {
    checkUserRole();
    setInterval(checkUserRole, 5000); // 5초마다 role 값 검사
});
</script>
