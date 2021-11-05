# hackeruso-candidate
Repo for DevOps candidate position
<br/><br/>

----------
<br/><br/>

**Credentials:**
```
  Jenkins:
    username: hackeruso
    password: hackeruso

```
<br/>

----------
<br/><br/>

## Step 1:

Creating public repo (this) for necessary jenkinsFile depencies

<br/><br/>

## Step 2:

creating the docker machines

<br />

#####  *MASTER*

Explanation:<br />
> Running Jenkins master with lts version<br />
  Name: master<br />
  Exposed Ports: 11011 (web) | 50000 (agent)<br />

```
docker run --name master -d -p 11011:8080 -p 50000:50000 jenkins/jenkins:lts
```

<br />

##### *SLAVE*

`Prerequisite: *Build jenkins volume drive beforehand on node*`

Explanation:<br />
> Running Jenkins slave with lts version<br />
  Name: slave<br />
  Exposed Ports: 8080 (web) | 500001 (agent)<br />
  Mounted Volume: binding jenkins volume built earlier<br />
  Priviledge: true (allowing root os capabilities)<br />

<br />

```
docker run --name slave -d -p 8080:8080 -p 50001:50001 -v jenkins --privileged --env JENKINS_SLAVE_AGENT_PORT=50001 jenkins/jenkins:lts
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

## Step 3:

creating the docker jenkinsFile and upload it to github

