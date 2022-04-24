<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateTaskModal"
                        data-bs-toggle="modal"
                >
                    Add Task
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 5%">#</th>
                    <th scope="col" style="width: 9.43%">Title</th>
                    <th scope="col" style="width: 17.43%">Description</th>
                    <th scope="col" style="width: 11.43%">Project</th>
                    <th scope="col" style="width: 11.43%">Participant</th>
                    <th scope="col" style="width: 9.43%">Priority</th>
                    <th scope="col" style="width: 9.43%">Status</th>
                    <th scope="col" style="width: 11.43%">Deadline</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="task" items="${listTask}">
                    <tr>
                        <td id="taskId">${task.getTask_id()}</td>
                        <td>${task.getTitle()}</td>
                        <td class="description">${task.getDescription()}</td>
                        <td>${task.getProject().getTitle()}</td>
                        <td>
                            <c:forEach var="participant" items="${task.getParticipants()}">
                                <span>${participant.getName()} ${participant.getSurname()}</span>
                            </c:forEach>
                        </td>
                        <td>${task.getPriority()}</td>
                        <td>${task.getStatus()}</td>
                        <td class="deadline" id="dl${task.getTask_id()}">${task.getDeadline()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editTask(this)"
                                    data-id="${task.getTask_id()}"
                                    data-title="${task.getTitle()}"
                                    data-description="${task.getDescription()}"
                                    data-project="${task.getProject().getProject_id()}"
                                    data-priority="${task.getPriority()}"
                                    data-status="${task.getStatus()}"
                                    data-deadline="${task.getDeadline()}"
                                    data-participants="${task.getArrayId()}"
                                    data-p="${task.getArrayProjectId()}"
                                    data-bs-target="#EditTaskModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteTask(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${task.getTask_id()}"
                                    data-bs-target="#DeleteTaskModal"
                                    data-bs-toggle="modal"
                            >
                                Del
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
  function deleteTask(but) {
    document.getElementById('taskRemoveInput').value = but.dataset.id;
  }

  function editTask(but) {
    document.getElementById("taskEditInput").value = but.dataset.id;
    document.getElementById("EditTaskTitle").value = but.dataset.title;
    document.getElementById("EditTaskDescription").value = but.dataset.description;
    document.getElementById("EditTaskProject").value = but.dataset.project;
    document.getElementById("EditTaskPriority").value = but.dataset.priority;
    document.getElementById("EditTaskStatus").value = but.dataset.status;
    let projectParticipants = but.dataset.p;
    let participants = but.dataset.participants;
    console.log(projectParticipants)
    console.log(participants)
    let options = document.getElementsByClassName("participant");
    for(let option of options){
      if(!projectParticipants.includes(option.value)){
        option.setAttribute("hidden", "hidden")
      }
      if(participants.includes(option.value)){
        option.setAttribute("selected", "selected")
      }
    }
    const dl = document.getElementById("dl" + but.dataset.id).innerText;
    document.getElementById("EditTaskDeadline").value = formatDateValue(dl);
  }
</script>

<script>
  let tds = document.getElementsByClassName("deadline");
  for(let i = 0; i < tds.length; i++){
    let date = new Date(tds[i].innerText);
    tds[i].innerText = formatDate(date);
  }

  function padTo2Digits(num) {
    return num.toString().padStart(2, '0');
  }

  function formatDate(date) {
    console.log(date)
    return [
      padTo2Digits(date.getDate()),
      padTo2Digits(date.getMonth() + 1),
      date.getFullYear(),
    ].join('.');
  }

  function formatDateValue(date) {
    date = date.split(".");
    return [date[2], date[1], date[0]].join("-")
  }
</script>