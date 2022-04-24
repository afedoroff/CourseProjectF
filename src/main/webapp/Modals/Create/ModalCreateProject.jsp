<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="CreateProjectModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateProjectModalTitle">Add project</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="createProjectForm" action="${pageContext.request.contextPath}/addProject" method="post" onsubmit="submit()">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="CreateProjectName"
                               placeholder="Enter project title" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="CreateProjectDescription"
                               placeholder="Enter project description"required>
                    </div>
                </form>
                <button type="submit" form="createProjectForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">
                    Add
                </button>

            </div>

        </div>
    </div>
</div>

<script>
  function submit(){
    let form = document.getElementById("createProjectorm")
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
    }, false)
  }
</script>