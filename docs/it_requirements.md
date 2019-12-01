---
id: it_requirements
title: IT Requirements
sidebar_label: IT Requirements
---

**Primary Development VM** **Resources Required** 

8GB Memory 

This is a lot of memory however the AI package will need plenty to play with on top of the docker that is running alongside Postgres. 20GB Storage 

**VM Requiremnts** OS: **Ubuntu 18.04** 

An ISO mounted from a flash drive can be used A designated directory for long term data storage 

This can be as simple as a directory specified for data storage. 

If possible it should be put on an HD in RAID A internal Foxnet IP Address. 

**Second Development VM** **Resources Required** 

2GB Memory 20GB Storage 

**VM Requiremnts** OS: **Ubuntu 18.04** 

An ISO mounted from a flash drive can be used A designated directory for long term data storage 

This can be as simple as a directory specified for data storage. 

If possible it should be put on an HD in RAID An internal Foxnet IP Address. 

**Possible Cluster Requirements** 

*Note: This is not needed for development but may be used for production deployment, so keep this in mind* 

Minimum of 1 available node(VM), with at least 4gb of memory.
1 Persistent Volume to be claimed and used by Postgres deployment.
 If need be one of the development VMs can be repurposed for use as a secondary node 