<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="EditProjectModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditProjectModalTitle">Edit project</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="editProjectForm" action="${pageContext.request.contextPath}/editProject" method="post" onsubmit="submit()">
                    <input type="hidden" id="projectEditInput" name="project_id">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="title" id="EditProjectTitle"
                               placeholder="Enter project title" required>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="description" id="EditProjectDescription"
                               placeholder="Enter participant description" required>
                    </div>
                </form>
                <button type="submit" form="editProjectForm"
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">
                    Сохранить
                </button>

            </div>

        </div>
    </div>
</div>

<script>
  function submit(){
    let form = document.getElementById("editProjectForm")
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
    }, false)
  }
</script>