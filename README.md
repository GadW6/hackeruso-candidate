# hackeruso-candidate
Repo for DevOps candidate position
<br/><br/>

----------
<br/><br/>

**Credentials:**
```

  Jenkins (master) ['http://34.230.217.72:11011/']:
    username: hackeruso
    password: hackeruso
  
  Jenkins (slave) ['http://34.235.96.208:11011/']:
    username: hackeruso
    password: hackeruso

```
<br/>

----------
<br/><br/>

## Step 1:

connect to instances.
find out OS
make necessary install/update (docker + git)
make public address lookup (curl http://checkip.amazonaws.com)

## Step 2:

Creating public repo (this) for necessary jenkinsFile depencies

<br/><br/>

## Step 3:

creating the docker machines with their architecture in mind

<br />

#####  *MASTER*

Explanation:<br />
> Running Jenkins master with lts version<br />
  Name: master<br />
  Exposed Ports: 11011 (web) | 50000 (agent)<br />
  Mounted Volume: binding jenkins volume built earlier<br />

```
docker run --name master -d -p 11011:8080 -p 50000:50000 -v jenkins jenkins/jenkins:lts
```

<br />

##### *SLAVE*


`Prerequisites`:
*Build jenkins volume drive beforehand on node and build jenkins image with docker capabilities* <br />
```
docker build -t jenkins_with_docker .
```


Explanation:<br />
> Running Jenkins slave with lts version<br />
  Name: slave<br />
  Exposed Ports: 11011 (web) | 500001 (agent)<br />
  Mounted Volume: binding jenkins volume built earlier<br />
  Priviledge: true (allowing root os capabilities)<br />

<br />

```
docker run --name slave -d -p 11011:8080 -p 50001:50000 --privileged --env JENKINS_SLAVE_AGENT_PORT=50001 jenkins_with_docker
```

<br />

Explanation:<br />
> Running web nginx server latest version<br />
  Name: web<br />
  Exposed Ports: 80 (web)<br />
  Mounted Volume: binding jenkins volume built earlier<br />

<br />

```
docker run --name web -d -p 80:80 -v jenkins:/usr/local/apache2/htdocs/ nginx
```

<br/><br/>

## Step 4:

creating the docker jenkinsFile and upload it to github

## Step 5:

When Jenkins is loaded i need to perform some simple steps:
1. Github API usage rate limiting strategy to Throttle at near rate limit (default Github public api limit are 60 calls per hour)
2. Create a Job > multibranch pipeline
3. Sync my github account to it (from my public repo in step 1)
4. Adding docker functionality. Manage Jenkins > Manage Plugins > installing [Docker, Docker Commons, Docker Pipeline]

## STEP 6:

creating pipeline  - multibranch

The pipeline is composed of 5 stages.
1. Create samplefiles<br />
    { using a bash script }
3. Samplefiles timestamps<br />
    { using a bash script }
4. Set Samplefiles RO<br />
    { using a bash script }
5. Build Nginx Docker<br />
    { <br />
      Docker in Docker (or DinD) is tricky !


      At first i thought i would handle this step using jenkins docker plugins only - FAILED  
      Then i thought it was due agent not being defined in jenkins script (declarative supports docker out of the box) - FAILED  
      Then i tried mounting the docker socket from host to running docker (-v /var/run/docker.sock:/var/run/docker.sock) - FAILED
      finally i decided bulding my own image of Jenkins, supporting docker out of the box - PENDING  
    }
6. Run Nginx<br />
