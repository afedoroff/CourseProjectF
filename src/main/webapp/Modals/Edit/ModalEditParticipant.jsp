<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="EditParticipantModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditParticipantModalTitle">Edit participant</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="editParticipantForm" action="${pageContext.request.contextPath}/editParticipant" method="post" onsubmit="submit()">
                    <input type="hidden" id="participantEditInput" name="participant_id">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" id="EditParticipantName"
                               placeholder="Enter participant name" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="surname" id="EditParticipantSurname"
                               placeholder="Enter participant surname" required>
                    </div>
                    <select class="form-select" name="project_id" id="EditParticipantProject" required>
                        <option value="" disabled selected hidden>Project</option>
                        <c:forEach var="project" items="${listProject}">
                            <option value="${project.getProject_id()}">${project.getTitle()}</option>
                        </c:forEach>
                    </select>
                </form>
                <button type="submit" form="editParticipantForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">
                    Save
                </button>

            </div>

        </div>
    </div>
</div>

<script>
  function submit(){
    let form = document.getElementById("editParticipantForm")
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
    }, false)
  }
</script>