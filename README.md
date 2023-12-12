# easyGDB_docker

- Postgress DB-Credentials are inside `easyGDB_docker/src/egdb_files`

# Create new image from running execution

1. Run `.\createNewDockerImage.cmd` (will create a new image from src with *new* tag)
2. Verify image by building container with `verifyNewImage.cmd`. 👀 Remember to delete `easyGDB_docker/postgres-data` to reset db and verify correct db setup.