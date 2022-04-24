<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <div class="container">
        <div class="d-flex bd-highlight mb-3">
            <div class="p-2 bd-highlight">
                <button type="button"
                        class="btn btn-secondary"
                        data-bs-target="#CreateProjectModal"
                        data-bs-toggle="modal"
                >
                    Add Project
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 5%">#</th>
                    <th scope="col" style="width: 30%">Title</th>
                    <th scope="col" style="width: 50%">Description</th>
                    <th scope="col" style="width: 15%">Action</th>
                </tr>
                </thead>
                <tbody id="mytable">
                <c:forEach var="project" items="${listProject}">
                    <tr>
                        <td id="projectId">${project.getProject_id()}</td>
                        <td>${project.getTitle()}</td>
                        <td>${project.getDescription()}</td>
                        <td>
                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="editProject(this)"
                                    data-id="${project.getProject_id()}"
                                    data-title="${project.getTitle()}"
                                    data-description="${project.getDescription()}"
                                    data-bs-target="#EditProjectModal"
                                    data-bs-toggle="modal"
                            >
                                Edit
                            </button>
                            <button type="button"
                                    onclick="deleteProject(this)"
                                    class="btn btn-outline-danger"
                                    data-id="${project.getProject_id()}"
                                    data-bs-target="#DeleteProjectModal"
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
  function deleteProject(but) {
    document.getElementById('projectRemoveInput').value = but.dataset.id;
  }

  function editProject(but) {
    document.getElementById("projectEditInput").value = but.dataset.id;
    document.getElementById("EditProjectTitle").value = but.dataset.title;
    document.getElementById("EditProjectDescription").value = but.dataset.description;
  }
</script>