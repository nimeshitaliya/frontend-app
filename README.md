## Frontend: 

Here we use the `Angular` application as a frontend server that calls configured backend server.

## CI/CD

- [GitHub Actions](./.github)
- Trigger on `push` request on this branch
- Runes on `GitHub-hosted` runner
- Steps performed by GitHub Actions workflow

`cross-compile` - Compile code and build package
1. Clone the latest repo
2. Install npm
3. Build angular application package
4. Upload `./dist` on GitHub artifact

`release` - Build a docker image and release it
1. Clone the latest repo
4. Download `./dist` from the GitHub artifact
2. docker build
3. docker tag
4. docker login (access token stored in GitHub action's secret)
4. docker push (on `nitaliya/frontend-server:feat3` public docker registry)

## Note: 
### Enhancement
- Use private docker registry - this need docker login on ec2 instance and GitHub runner
- Push two image on registry `latest`, and `feat3-v*`
- The `self-hosted` runner run GitHub actions
- Write GitHub actions to `lint` and `test` change on push or pull-request
