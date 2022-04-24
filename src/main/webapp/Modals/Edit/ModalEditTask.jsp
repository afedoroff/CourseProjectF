<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="EditTaskModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditTaskModalTitle">Edit task</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="unselect()"></button>
            </div>
            <div class="modal-body">

                <form id="editTaskForm" action = "${pageContext.request.contextPath}/addTask" method="post" onsubmit="submit()">
                    <input type="hidden" id="taskEditInput" name="task_id">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="EditTaskTitle"
                               placeholder="Enter task title" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="EditTaskDescription"
                               placeholder="Enter task description" required min="1">
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="project_id" required id="EditTaskProject">
                            <c:forEach var="project" items="${listProject}">
                                <option value="${project.getProject_id()}">${project.getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="participant_id" id="EditTaskPriority" required>
                            <option value="high">high</option>
                            <option value="medium">medium</option>
                            <option value="low">low</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="participant_id" id="EditTaskStatus" required>
                            <option value="open">open</option>
                            <option value="closed">closed</option>
                            <option value="in process">in process</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" name="participant_id" multiple id="EditTaskParticipants" required>
                            <c:forEach var="participant" items="${listParticipant}">
                                <option value="${participant.getParticipant_id()}" class="participant">${participant.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <input type="date" class="form-control" name="deadline" id="EditTaskDeadline"
                               placeholder="Enter task title" required lang="en">
                    </div>
                </form>
                <button type="submit" form="editTaskForm"
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
    let form = document.getElementById("editTaskForm");
    let options = document.getElementsByClassName("participant");
    for(let option of options){
      option.removeAttribute("selected")
      option.removeAttribute("hidden")
    }
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
    }, false)
  }

  function unselect(){
    let options = document.getElementsByClassName("participant");
    for(let option of options){
      option.removeAttribute("selected")
      option.removeAttribute("hidden")
    }
  }
</script>

