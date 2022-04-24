<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="CreateTaskModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateTaskModalTitle">Добавить трек</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="createTaskForm" action = "${pageContext.request.contextPath}/addTask" method="post" onsubmit="submit()">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="CreateTaskTitle"
                               placeholder="Enter task title" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="CreateTaskDescription"
                               placeholder="Enter task description" required min="1">
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="project_id" required>
                            <option value="" disabled selected hidden>Project</option>
                            <c:forEach var="project" items="${listProject}">
                                <option value="${project.getProject_id()}">${project.getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="participant_id" multiple id="participants-select" required>
                            <c:forEach var="participant" items="${listParticipant}">
                                <option value="${participant.getParticipant_id()}">${participant.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <input type="date" class="form-control" name="deadline" id="CreateTaskDeadline"
                               placeholder="Enter task title" required>
                    </div>
                </form>
                <button type="submit" form="createTaskForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">
                    Добавить
                </button>

            </div>

        </div>
    </div>
</div>
<script>
  function submit(){
    let form = document.getElementById("createTaskForm")
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
    }, false)
  }
</script>

