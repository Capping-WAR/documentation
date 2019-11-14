---
id: project_overview
title: Project Overview
sidebar_label: Overview
---

## Title Page

Writing Advisor Reviewing Tool 

Senior Capping Project 

Samantha DiMaio, Dayna Eidle, Daniel Gisolfi, Alissa Systma, Lauren Urena-Clark

## Table of Contents

About WAR

Project Analysis

Project Design

Project Plan

Infrastructure Design

Protype Development Intructions

Cost Analysis

Ethics of War

## About the Project - Relevant Facts/Overview 

The WAR (Writing Advising Reviewing) Tool is a web application created for a Fall 2019 senior capping project at Marist College. The members of the team include Samantha DiMaio, Dayna Eidle, Ali Systma, Daniel Gisolfi, and Lauren Urena-Clark. Our team has engaged in a number of roles including setting up, designing, developing, integrating, managing, implementating, and training the system. The tool will be utilized by the Marist College Writing center as an efficient way to review essay sentences. One at a time, the rewiewer will review sentences that have been tagged by the system. It is up to their own critique to classify the sentence as incorrect or correct. If incorrect, the reviewer can choose which rule the sentence violates. The five rules available to select from inclue Spelling, Verbs, Introductory Phrases, Nouns, and Consiceness. The Reviewer also has oppotunity to earn reputation points through their sentence reviews.

## Project Analysis

### Requirements

​	A.  **Functional Requirements**

*The user will be recognized as the sentence reviewer for this system. 

​        i.     The user interface will be designed as simple, functional, lightweight, fast, and user-friendly. 

​       ii.     The user should be able to login as reviewer with no GUI. If there is no session, the session needs to be created through Marist’s SSO/CAS and validated through your code, saving their CWID and email as identification. Users will be directed to the user-side of the writing advisor (if they are not supposed to be there) and reviewers will stay on the reviewer-side of the writing advisor.

​      iii.     The reviewer will check a sentence that has been marked incorrect by the system and tagged by the student.

  iv.     The reviewer can mark the sentence as correct.

   v.     The reviewer can mark the sentence as incorrect. If the sentence is incorrect, the reviewer will choose the reason the sentence is incorrect from a list. 

  vi.     The reviewer cannot see why the sentence was originally marked as incorrect.

 vii.     A sentence is definitively marked as correct or incorrect if there are only 5 votes that all agree or, if there are more than 5 votes, ¾ of the votes agree. At this point, the sentence will no longer be up for review, and should be added to dataset permanently.

viii.     The reviewer interacts with a reputation system.

​     ix.     The reputation system will motivate the reviewer. The reviewer will see a progress bar tracking their reputation count.

​    x.     The reviewer’s status will be displayed on the leaderboard with a reputation count. 

​      xi.     The reviewer’s reputation will be positively impacted if they were in agreement with the majority of the votes with the sentence being correct or incorrect.

  xii.     The reviewer’s reputation will be negatively impacted if they were not in agreement with the majority of the votes with the sentence being correct or incorrect.

  xiii.     The reviewer can logout when they are done reviewing.

1.   Logging out clears the session.

B.  **System Requirements** 

​		 i.     When sentences are definitely marked as correct or incorrect, the system triggers a new event to train from the new data set. It will retrain a new machine learning model and if that model is better than the previous model, it will deploy the new model.

​       ii.     Have a table to keep track of all trained model versions. Not all versions will be deployed, but all versions and their dates will be tracked in this table.

​      iii.     The system will achieve further accuracy of the training model to determine if the new models are better than the previous model through hyperparameter optimization techniques such as grid search and evolution strategies. 

   iv.     All development will occur in a Linux environment.

   v.     There will be separate development servers for the database and the web app. There will also be a testing server and a production server.

 vi.     The administration side will report visual statistics to the user including:

				1.   Latest/current training stats
   				2.   Hyper-parameter optimization status

### Use Case Diagram and Documentation

### ![Capping Use Case Diagram](/Users/samanthadimaio/Desktop/Capping/Capping Use Case Diagram.png)

### Activity Diagram

## Project Design

### ERD and Documentation 

Entity-Relational Diagram: 

### User Interface Design

#### Components

#### Theme - Darkmode, Simple, Functional

The theme for WAR is a darkmode. Research has proven darkmode to be extremely. Especially for reviewers who have to undergo eyestrain with reading tons of papers everyday, darkmode will prove extremely beneficial to the user. 

## Project Plan  

Attach Final Project Plan 



### Lessons Learned 

### List of Client Meetings: 

## Infrastructure Design

### IT Requirements

### Technologies Used?

## Cost Analysis 

## Ethics Essay

​	When developing a project there are many ethical implications the creators must take into account to ensure their application will abide by a standard code/conduct of ethics. As this tool will be utilized by reviewers, 