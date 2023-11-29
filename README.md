# easyGDB_docker

- Postgress DB-Credentials are inside easyGDB_docker/src/egdb_files
- 


# Create new image from running execution

1. Verify container exists with `docker ps -a` 
  - named: *ohadii_chlorella_gdb*
2. Use `docker commit ohadii_chlorella_gdb ohadii_chlorella_gdb`, this will create a new image with the tag *ohadii_chlorella_gdb*