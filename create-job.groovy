#!/usr/bin/env groovy
import jenkins.model.*
import hudson.util.PersistedList
import jenkins.branch.*
import jenkins.plugins.git.*
import org.jenkinsci.plugins.workflow.multibranch.*
 
// Define GIT repo 
String git = "https://github.com/hygosr/backbase-java-sample.git"
 
// Define Jenkins JOB name
String job = "backbase"
 
// Create pipeline job
Jenkins jenkins = Jenkins.get()
WorkflowMultiBranchProject mbp = jenkins.createProject(WorkflowMultiBranchProject.class, job)
 
// Load GIT repo
GitSCMSource gitSCMSource = new GitSCMSource("not_null", git, "", "*", "", false)
BranchSource branchSource = new BranchSource(gitSCMSource)
PersistedList sources = mbp.getSourcesList()
sources.add(branchSource)
 
// Run first Jenkinsfile check
jenkins.getItem(job).scheduleBuild()
 
// Save Jenkins config
jenkins.save()
