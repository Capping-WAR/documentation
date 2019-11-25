---
id: ai_api
title: AI API
sidebar_label: AI API
---

The AI exists outside of the production server and resides on the LinuxOne(Ask Pablo for the IP). This API facilitates the process of retraining the models as well as getting the current status of all threads.

Base Path: `/marist/ai/wa/` 

# Endpoints

## /threads

**method**: `GET`

### response 

**status code**: 200

```json
{
    "data":
    {
        "imgurl": "url",
        "system":
        {
            "cpu": float,
            "dsk": float,
            "mem": float
        },
        "threads":
        [
            {
                "id": int,
                "parameters": "Comma Seperated String of Params",
                "status": "running | pending | ..."
            },
        ]
    }
}
```

## /retrain

**method**: `POST`

### request body

**Content-Type**: application/json

**Auth**: Basic Auth (Ask Pablo for Username and Password)

```json
{
    "callerID":"Webadmin"
}
```

### response
**status code**: 201

```json
{
  "q_size": "8", 
  "response": "ok", 
  "values": "Re-train called by _Webdmin_ on >> 05/11/2019 at 18:59:53"
}
```