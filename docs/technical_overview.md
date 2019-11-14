---
id: technical_overview
title: Overview
sidebar_label: What is WAR?
---

## What is WAR?

The WAR (**W**riting **A**dvisor **R**eviewing) Tool is a web application created for a Fall 2019 senior capping project at Marist College. The members of the team include Samantha DiMaio, Dayna Eidle, Ali Systma, Daniel Gisolfi, and Lauren Urena-Clark. Our team has engaged in a number of roles including setting up, designing, developing, integrating, managing, implementing, and training the system. The tool will be utilized by the Marist College Writing center as an efficient way to review essay sentences. One at a time, the reviewer will review sentences that have been tagged by the system. It is up to their own critique to classify the sentence as incorrect or correct. If incorrect, the reviewer can choose which rule the sentence violates. The five rules available to select from include Spelling, Verbs, Introductory Phrases, Nouns, and Conciseness. The Reviewer also has the opportunity to earn reputation points through their sentence reviews.

## System Architecture

The WAR Architecture is made up of five components or services.


![System Architecture](./assets/SystemArchitecture.png)

The five services can all be run independently as well as within docker containers or simply on there own. For further details and each individual component and how it interacts with the others, visit the docs listed on the left.



### How do I access the services?

|       Name       | Port |   URL    |
| :--------------: | :--: | :------: |
|     Database     | 5432 |    n/a      |
|     WAR API      | 8080 |    n/a      |
| AI API(see docs) | n/a  |   n/a    |
|        UI        | 3000 |    /      |
|  Documentation   | 3001 |  /docusaurus|