<%@ page pageEncoding="UTF-8" %>
<div class="modal fade" id="DeleteProjectModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="DelBookModalTitle">Are you sure you want to delete the project?</h5><br>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <h6 class="modal-title">The task will be deleted. This action is irreversible.</h6><br>
                <button type="button" class="btn btn-dark px-4 md-close" data-bs-dismiss="modal"
                        style="float: left; padding-top: 10px; padding-bottom: 10px;">Отмена
                </button>
                <form id="delProjectForm" style="display: none" action="${pageContext.request.contextPath}/deleteProject"
                      method="post">
                    <input type="hidden" id="projectRemoveInput" name="project_id">
                </form>

                <button type="submit"
                        form="delProjectForm"
                        data-id=""
                        class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">
                    Удалить
                </button>
            </div>
        </div>
    </div>
</div>

<script>

</script>