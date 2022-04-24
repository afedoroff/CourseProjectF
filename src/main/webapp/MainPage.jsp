<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<div class="tabs">

    <input type="radio" id="participantTab" name="tab-control" onclick="openPage('Participants', this)">
    <input type="radio" id="projectTab" name="tab-control" onclick="openPage('Project', this)">
    <input type="radio" id="taskTab" name="tab-control" onclick="openPage('Task', this)">
    <ul>
        <li title="Participants"><label for="participantTab" role="button">
            <br><span>Participants</span></label>
        </li>
        <li title="Projects"><label for="projectTab" role="button">
            <br><span>Projects</span></label>
        </li>
        <li title="Tasks"><label for="taskTab" role="button">
            <br><span>Tasks</span></label>
        </li>
    </ul>

    <div class="slider"><div class="indicator"></div></div>
    <div class="content">
        <section>
            <%@include file="TabParticipant.jsp" %>
        </section>
        <section>
            <%@include file="TabProject.jsp" %>
        </section>
        <section>
            <%@include file="TabTask.jsp" %>
        </section>
    </div>
</div>

<%@include file="Modals/Edit/ModalEditParticipant.jsp" %>
<%@include file="Modals/Edit/ModalEditProject.jsp" %>
<%@include file="Modals/Edit/ModalEditTask.jsp" %>

<%@include file="Modals/Create/ModalCreateParticipant.jsp" %>
<%@include file="Modals/Create/ModalCreateProject.jsp" %>
<%@include file="Modals/Create/ModalCreacteTask.jsp" %>

<%@include file="Modals/Delete/ModalDeleteParticipant.jsp" %>
<%@include file="Modals/Delete/ModalDeleteProject.jsp" %>
<%@include file="Modals/Delete/ModalDeleteTask.jsp" %>

<script>
  function openPage(pageName,elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tab-panel");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    sessionStorage.setItem('tab', elmnt.id);
  }

  window.onload = function () {
    if (sessionStorage.getItem("tab") == null)
      document.getElementById("participantTab").click();
    else
      document.getElementById(sessionStorage.getItem("tab")).click();
  }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>
</html>