---
id: requirements 
title: Requirements 
sidebar_label: Requirements
---

​	A.  **Functional Requirements**

*Note: The user will be recognized as the sentence reviewer for this system.*

​        i.     The user interface will be designed as simple, functional, lightweight, fast, and user-friendly. 

​       ii.     The user should be able to login as reviewer with no GUI. If there is no session, the session needs to be created through Marist’s SSO/CAS and validated through the code, saving their CWID and email as identification. 

​      iii.     The reviewer will check a sentence that has been marked incorrect by the system and tagged by the student.

  iv.     The reviewer can mark the sentence as correct.

   v.     The reviewer can mark the sentence as incorrect. If the sentence is incorrect, the reviewer will choose the reason the sentence is incorrect from a list. 

  vi.     The reviewer cannot see why the sentence was originally marked as incorrect.

 vii.     A sentence is definitively marked as correct or incorrect if there are only 5 votes that all agree or, if there are more than 5 votes, ¾ of the votes agree. At this point, the sentence will no longer be up for review, and should be added to dataset permanently.

viii.     The reviewer interacts with a reputation system.

​     ix.     The reputation system will motivate the reviewer. The reviewer will see a progress bar tracking their reputation count.

​    x.     The reviewer and the other Top 2 users in the system will be displayed on the leaderboard along with their reputation score.  

​      xi.     The reviewer’s reputation will be positively impacted by 10 points if they were in agreement with the majority of the votes with the sentence being correct or incorrect.

  xii.     The reviewer’s reputation will be negatively impacted by 10 points if they were not in agreement with the majority of the votes with the sentence being correct or incorrect.

  xiii.     The reviewer can logout when they are done reviewing.

1.   Logging out clears the session.

B.  **System Requirements** 

​		 i.     When sentences are definitely marked as correct or incorrect, the system triggers the sentence to be moved to a definitive table. Thus, there must be a table in the database to hold this data. This will be the definitive dataset that will be used train and deploy new models. The system must also be designed to easily integrate additional rules if needed. Thus, there must be a table to hold each individual rule. 

​       ii.     The AI page will include the following components: 

			1.   Current Threads Table displaying different parameters of the models
			2. 	 Thread Status Table
			3.   Hyper-Parameter Search Space Gif
In the future, the system will be set up to achieve further accuracy of the training model to determine if the new models are better than the previous model through hyperparameter optimization techniques such as grid search and evolution strategies. It will retrain a new machine learning model and if that model is better than the previous model, it will deploy the new model. The purpose of the current thread tables is to keep track of all trained model versions. Not all versions will be deployed, but all versions will be tracked in this table including information regarding other parameters of the version model. 

​      iii.      The administration side will report visual statistics to the user including:

			1.   Total Users
			2. 	 Login Data
			3.   User's by Operating System
			4.   Latest Views - populates according to latest user activity
   iv.     All development will occur in a Linux environment.

   v.     There will be separate development servers for the database and the web app. There will also be a testing server and a production server.

