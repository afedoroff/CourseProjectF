<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateParticipantModal"
                        data-bs-toggle="modal"
                >
                    Add Participant
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 20%">#</th>
                    <th scope="col" style="width: 20%">Name</th>
                    <th scope="col" style="width: 20%">Surname</th>
                    <th scope="col" style="width: 20%">Project</th>
                    <th scope="col" style="width: 20%">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="participant" items="${listParticipant}">
                    <tr>
                        <td id="participantId">${participant.getParticipant_id()}</td>
                        <td>${participant.getName()}</td>
                        <td>${participant.getSurname()}</td>
                        <td>${participant.getProject().getTitle()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editParticipant(this)"
                                    data-id="${participant.getParticipant_id()}"
                                    data-name="${participant.getName()}"
                                    data-surname="${participant.getSurname()}"
                                    data-project="${participant.getProject().getProject_id()}"
                                    data-bs-target="#EditParticipantModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteParticipant(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${participant.getParticipant_id()}"
                                    data-bs-target="#DeleteParticipantModal"
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
  function deleteParticipant(but) {
    document.getElementById('participantRemoveInput').value = but.dataset.id;
  }

  function editParticipant(but) {
    document.getElementById("participantEditInput").value = but.dataset.id;
    document.getElementById("EditParticipantName").value = but.dataset.name;
    document.getElementById("EditParticipantSurname").value = but.dataset.surname;
    document.getElementById("EditParticipantProject").value = but.dataset.project;
  }
</script>