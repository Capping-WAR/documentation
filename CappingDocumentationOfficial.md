Title Page

Writliing Advisor Review Tool 

CMPT475/477

Senior Capping Project 

Fall 2019

Samantha DiMaio, Dayna Eidle, Daniel Gisolfi, Alissa Systma, Lauren Urena-Clark

Dr. Pablo Rivas 

## Executive Summary

The Writing Advising Reviewing Tool is a web application created for a Fall 2019 senior capping project at Marist College. The members of the team include Samantha DiMaio, Dayna Eidle, Daniel Gisolfi, Lauren Urena-Clark, and Alissa Systma. Our client is Dr. Pablo Rivas, who is also the professor for the capping course. Throughout the semester, our team has taken on a number of roles including setting up, designing, developing, integrating, managing, implementating and documenting the system. The tool will be utilized by the Marist College Writing Center as an efficient way to review essay sentences. The writing center takes pride in assisting students with their papers, brainstorming to create new ideas, and ultimately educating students on how to correctly edit their papers. Our project places strong emphasis on the idea of "how to correctly edit their papers." This is the start to a project that has the potential to expand into a full editing system. Currently, our system focuses on the efficiency of the smallest component of a student's paper: the sentences. The rewiewer will review sentences that have been tagged by the system. It is up to their own critique to classify the sentence as incorrect or correct. If incorrect, the reviewer can choose which rule the sentence violates. The five rules available to select from include Spelling, Verbs, Introductory Phrases, Nouns, and Consiceness. The system was designed so that if rules need to be added or deleted as per the writing center's standards, it may be done. The Reviewer also has oppotunity to earn reputation points through their sentence reviews. The system is designed to be simple, functional, and user friendly. The Reviewer has the ability to advance skills in editing by using our system. In the long run, they are also contributing to benefiting the users who create these sentences. 

## Project Analysis

###Requirements 

​	A.  **Functional Requirements**

*The user will be recognized as the sentence reviewer for this system. 

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

​		 i.     When sentences are definitely marked as correct or incorrect, the system triggers the sentence to be moved to a definitive table. Thus, there must be a table in the database to hold this data. This will be the definitive dataset that will be used train and deploy new models. 

​		ii. The system must be designed to easily integrate additional rules if needed. Thus, there must be a table to hold each individual rule. 

​       iii. Sentences will appear up for review based on highest priority. The sentences with the lowest amount of current reviews maintain the highest priority.   

​       iv.     The AI page will include the following components: 

			1.   Current Threads Table displaying different parameters of the models
			2. 	 Thread Status Table
			3.   Hyper-Parameter Search Space Gif
In the future, the system will be set up to achieve further accuracy of the training model to determine if the new models are better than the previous model through hyperparameter optimization techniques such as grid search and evolution strategies. It will retrain a new machine learning model and if that model is better than the previous model, it will deploy the new model. The purpose of the current thread tables is to keep track of all trained model versions. Not all versions will be deployed, but all versions will be tracked in this table including information regarding other parameters of the version model. 

​      v.      The administration page will report visual statistics to the admin including:

			1.   Total Users
			2. 	 Login Data
			3.   User's by Operating System
			4.   Latest Views - populates according to latest user activity
   vi.     All development will occur in a Linux environment.

   vii.     There will be separate development servers for the database and the web app. There will also be a testing server and a production server.

### Use Case Diagram and Documentation 

![](/Users/samanthadimaio/Desktop/Capping Pictures/Capping Use Case Diagram.png)

The Reviewer as a user has multiple roles in the system. They will log onto the system through Marist CAS Authentication. They will validate tagged sentences as correct or incorrect. If determined incorrect, they will choose the rule the sentence violates. The system has a reputation system in which the user can gain reputation through correctly validating sentences that agree with majority of votes.  The reviewer can lose reputation by incorrectly validating sentences that do not agree with majority of votes. The reviewer is able to view their reputation score on the rank progress bar. They can also see if there reputation score is one of the highest by looking at the leaderboard. The leaderboard displays the top three reputation scores. The Admin as a user can view visual statistics about the system including total users on the system, latest activity, and what operating system the users are reviewing on. Also, the Admin can review AI tables and charts to get information on training models.  

###Activity Diagram and Documentation 

![](/Users/samanthadimaio/Desktop/Capping Pictures/Activity Diagram for Capping WAR -2.png)This activity diagram represents the sequential flow of actions in the system. The user will be brought to the Log In screen and enter their Marist credentials via CAS Authentication. The system will check if the user is registered or not in the system. If not, they will be directed to the Sign Up screen. Once entering registration information, they will be redirected back to the Log In screen and must re-enter Marist Login credentials to use the system. The opening page displays the front dashboard with options to review a sentence, view the rules, view the leaderboard and current user rank, and also access the side bar tabs. If the user chooses to review a sentence, they must validate the sentence as correct or incorrect. If they choose in correct. To end the session, the user must log out of the system. 

## Project Design

### Database Design

1.  Figure 1.1  ER Diagram

![image-20191118191306297](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191118191306297.png)

2.  Documentation

Figure 1.1 displays the Marist Writing Advisor Reviewer ER Diagram. It consists of seven tables. Each cell within each table only contains atomic values. The **Reviewers** table has a primary key called reviewerID which is a reviewer’s CWID (their definitive identity). This provides unique authentication for each user of the system. Other non-key attributes in this table are dependent on the primary key. These include emailAddress, firstName, lastName, isAdmin, and reputation. One reviewer can complete zero to many reviews, which is referred to as a **People Review**. A **People Review** belongs to one **Reviewer**. 

The **People Reviews** table consists of three composite primary keys. These include: sentenceID (the ID of sentence being reviewed), reviewerID (the ID of the reviewer), and ruleReviewID (which is the ID of the rule). The other non-key attributes in the PeopleReview table are dependent on the primary key. The attribute ruleReview is the grade the reviewer gives each rule for each sentence. For each rule, 1 is correct and 0 is incorrect or a violation of that rule. The dateAdded refers to the date in which the review is added. 

A single **People Review** refers to a rule. There will be five inserts into **People Reviews** regarding each rule for that review. A **Rule** can be associated with many **People Reviews**. The rules of the sentence are reviewed many times for however many reviews it takes to reach the ¾ criteria. The **Rules** table primary key is ruleID (a rule’s unique identity). Other non-key attributes in this table are dependent on the primary key. These include ruleName, description of the rule, and the rule’s priority. Sentences that have the lowest reviews will have the highest priority because the goal is to have amount of reviews on all sentences to help train the model. 

A **Rule** is related to many **Model Reviews**. A **Model Review** is associated with an individual **Rule**. There will be five inserts into Model Reviews regarding each rule for that review. The **Model Reviews** and the **Sentences** table holds the information regarding why the system originally tagged the sentence. The **Model Reviews** table has four composite primary keys. These include: sentenceID (the ID of sentence being reviewed), ruleID (the ID of the rule), modelID (the unique identity of the model), and version (the numerical count of the model released).  This table can be used as a basis of comparison to hold information regarding previous models and see why they were originally tagged. 

A **Model Review** refers to one **Model**. A **Model** can have many **Model Reviews**.  The **Models** table has two primary keys: modelID and version. The table holds all data regarding the AI. Other non-key attributes in this table are dependent on the primary key. These include balance accuracy, location of the model, and the date the model was added. 

A **Model Review** relates to one **Sentence**. A **Sentence** can belong to many **Model Reviews**. The **Setences** table has a primary key called sentenceID which is the unique identity of the sentence. Other non-key attributes in this table are dependent on the primary key. These include: userID (the ID of the user who the sentence was written by), the actual sentence, and the date the sentence was originally added. A **Sentence** is associated with zero or many **People Reviews**. A Sentence is also associated with one or many **Sentence Rules.** These are the rules tagged in the Sentence (AS INCORRECT OR AS BOTH CORRECT INCORRECT). 

The **Sentence Rules** table has two composite primary keys. SentenceID is the unique of the sentence. TaggedRuleID is the unique ruleID, or whichever rule the Reviewer is referring to at the time. For example, a rule that the system has marked as wrong and the reviewer thinks is correct. A **Rule** is associated with many **Sentence** **Rules** because all rules are taken into account for each sentence. Other non-key attributes in this table are dependent on the primary key. The attribute status is the status review of the rule for each sentence. 

There is also a **TrainingDataset** table that has no direct relationship with other tables in the database. This table holds all the data regarding definitive reviews of the sentences that meet the criteria. It will be used to train the model and produce definitive output. There are two primary keys in this table. The sentenceID is the unique identification of the sentence in the training data. The ruleCorrectID is the unique identification of a rule being correct. The other non-key attributes in the **TrainingDataset** table are dependent on the primary key. These include the actual sentence, a percentage of correctness based on the original rule that was in question for review (RuleCorrect), and the date the sentence was added to the Training Data.  There are no transitive functional dependencies among the attributes.

### User Interface

#### Components 

#####Main Dashboard 

![](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120201321307.png) 

This screenshot shows the main view of the front landing page which includes the main components of the reviewing tool. This includes a side bar, a leaderboard, a rank system, the sentence reviewer, and a display of the rules. There is also a log out button on the top right corner. The below screenshots will include more detail on each of these components.  

**Sidebar**

![image-20191120201345222](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120201345222.png)

On the left hand side of the application there is a side bar which consists of tabs. The **Dashboard** tab is the main landing page. The **About** tab page will include information about the application as well as information about the creators of the application. The **AI** tab will tables and a graphical display that act as a placeholder for future training model data that will be collected from the application involving the accuracy of reviewing. The **Admin** tab will be used to look at site statistics involving total users on the application, latest activity on the system, and what operating system users are using. The **Help** tab is for FAQs the reviewer may come across when using the tool. 

**Sentence Review** 

![image-20191120201825336](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120201825336.png)

The Sentence Reviewer component is the center of the front landing page. It will display sentences that have been tagged for review. The reviewer can select correct if they believe the sentence is correct. If they believe the sentence contains an error, the user can select incorrect and check off the rule(s) they believe the sentence violates. Another sentences will keep appearing once marked.  

**Display of Rules** 

![image-20191120201911454](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120201911454.png)

Below the sentence review section there is a display of the rules. It shows each rule with a drop down explaining the rule and what a violation of that rule entails. This will help the reviewer understand more clearly if they are unsure whether or not a rule pertains to a tagged sentence. 

**Leaderboard and Ranking System**

**![](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120202009656.png)**

On the left side of the front landing page there is a leaderboard and a rank component underneath. The leaderboard corresponds to the reputation system of the application. Reputation is earned through correctly reviewing a sentence (as correct or incorrect in accordance to agreement with majority of rewiewer's votes for a specific rule). If a submitted review meets this criteria, the reviewer gains 10 points. If the review does not meet this criteria, the reviewer loses 10 points. The Reviewer themself and the other Top 2 Reviewer's, based on the highest reputation, will be displayed on the leaderboard along with their current scores. The ranking will show what the user’s current score is. This allows the user's to see where they stand alongside the top Reviewer's in the system. 

##### About US

The About US page consists of information related to the purpose of the Writing Advisor Review tool and the creators of it. 

#####Artifical Intelligence 

1. Current Threads

![image-20191121141824133](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191121141824133.png)

This table is used to display current models along with parameters regarding the model. A parameter is a variable that is internal to the model and can be estimated from data. They are required by the model when making predictions. 

1. Thread Status

![image-20191121141840251](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191121141840251.png)

This table displays the ID of the model alongside it's current status. 

1. Hyper-Parameter Search Space 

![image-20191121141906858](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191121141906858.png)

This section will be used to diplay images generated based on the model training data. 

#####Admin

1.   Full View

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120200859600.png" alt="image-20191120200859600" style="zoom:67%;" />

Here is the full frontal view of the Admin Page, which can be accessed through the left hand tab. 

2. Total Users

![image-20191120200919947](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120200919947.png)

This section displays the total number of users currently in the system. 

3. Login Data

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120200948666.png" alt="image-20191120200948666" style="zoom: 25%;" />

This section displays a graphical chart of login data by date. When hovering over the bar graphs, the number of logins appears along with the number of reviews submitted for that day. As the dates progress, this chart will update accordingly. 

4. Users by Operating System

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/image-20191120201007799.png" alt="image-20191120201007799" style="zoom:50%;" />

This section displays a chart that shows what operating system users are using. It is cateogorized into Windows, Mac, and Other with the percentage of users below. 

#####FAQ

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/image-20191121135609673.png" alt="image-20191121135609673" style="zoom: 69%;" />

This page is used for FAQ's the user might have when using our system. They can access this page by choosing the tab with question mark labeled "Help" on the left hand side. If they see a question they would like to know the answer to, they can click on the drop down arrow on the right hand side to retrieve the answer. 

#### Theme

As per the clients request, the theme for the Writing Advisor Review tool is simple, functional, and user-friendly. Simple design has many advantages over complicated designs. They are easier for the user to navigate as well as easier for the developer to make fixes. We wanted to ensure the reviewer will not be overwhelmed when using our system as they need to focus to make proper judgements. We designed the system in darkmode for two main reasons. The first reason is that darkmode is very simple and astetically pleasing. Users want to use an application that they find appealing. The second reason takes into account the specific users of the system. Research has proven darkmode to be extremely beneficial in helping reduce headaches, dry eyes, headaches, and eyestrain. We want to promote minimal heath risk to the users on our system, as we recongnize this is their job and they could potentially spend hours using our system. Darkmode will prove extremely beneficial to reviewers reading many sentences a day. 

## Project Plan

###Final Project Schedule

| Date       | Milstone                                                     | Tasks                                                        | Responsible   | Notes                                         |
| ---------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------- | --------------------------------------------- |
| 8/28/2019  | Project Start                                                | Assigned Team, Project, and  Roles                           | ALL           |                                               |
| 9/03/2019  | Project Start #2                                             | Sceduele first team meeting, establish communication plan    | ALL           |                                               |
| 9/04/2019  | Project Planning                                             | Develop Project Plan and delegate responsibilites among team members | ALL           |                                               |
| 9/06/2019  | Client Meeting                                               | Meet with client to gather initial requirements              | ALL           | These meetings will occur every Friday @2 PM  |
| 9/09/2019  | Team Meeting                                                 | Discuss requirements, work on Homework #1                    | ALL           | These meetings will occur every Monday @ 2 PM |
| 9/11/2019  | Homework #1 Due                                              | Client Questions, User Requirements, Use Case, and Project Plan | SAM/ALL       |                                               |
| 9/11/2019  | Weekly Status Update Due                                     | Complete Weekly Status Updates, Ensure Team is on track      | SAM           |                                               |
| 9/16/2019  | VM Setup                                                     | Setup Linux Server Environment                               | LAUREN        |                                               |
| 9/18/2019  | Homework #2 Due                                              | E-R Diagram complete with supporting documentation           | ALL           |                                               |
| 9/25/2019  | Front-End Design  Complete                                   | Learn React and complete mock-up of front end including all landing page components | DAN/ALI       |                                               |
| 9/25/2019  | Database Complete                                            | Database is fully set up                                     | DAYNA         |                                               |
| 9/25/2019  | Homework #3 Due                                              | Complete wireframes of user interface                        | ALL           |                                               |
| 10/09/2019 | Integration Tasks                                            | Set up API routes to handle all interactions between the database and the front - end | DAN           |                                               |
| 10/16/2019 | Install Servers in the Data Center                           | Pysically install in the racks and configure                 | LAUREN        |                                               |
| 10/16/2019 | Homework #4 Due                                              | Early Mature Demo, user interfaces connected, a proper connection to the DBMS, all external APIs and accounts tests, implemented test cases in a functional stage | ALL           |                                               |
| 10/16/2019 | Mid-semester lifeboat due                                    | Determine which team member we would promote and which we would fire | ALL           |                                               |
| 10/23/2019 | About US Page, FAQ Page,                                     | Ensure these pages are  displayed on the front-end           | DAN/ALI       |                                               |
| 10/30/2019 | Stored Procedures, Integration Cont'd, SSO Authentication    | Write and implement stored procedures, All user data displayed on the Front End, | DAN/DAYNA     |                                               |
| 11/06/2019 | AI Placeholder Tasks, Integration complete, Prepare for Draft Demo | Use client data python scripts to create placeholder tables and charts on the AI Page | ALL           |                                               |
| 11/06/2019 | Rough Mature Draft Demo Due                                  | Ensure system's main functionalities are functional for this demo | ALL           |                                               |
| 11/13/2019 | AI Placeholder Tasks, Admin Page, Code Review                | Implement images generated by python scripts, Design Admin page, pull user information from database to display on charts | ALI/DAN       |                                               |
| 11/20/2019 | Final Documentation                                          | Ensure all components of the projects are included and document: Project Analysis, Design, and Plan | SAM           |                                               |
| 11/20/2019 | Last Code Fixes, Deployment to Production                    | Ensure code is clean, comment everything, make any last fixes, and deploy to production server | DAN/ALI/DAYNA |                                               |
| 11/27/2019 | No Meeting - HOLIDAY                                         |                                                              |               |                                               |
| 12/02/2019 | Project Prototype Complete                                   | On this date at 8 AM, our prototype will be handed over to the client | ALL           |                                               |
| 12/04/2019 | Final Paper Due                                              | Ensure Paper is completed and meets professor's guidelines   | ALL           |                                               |
| 12/04/2019 | Final Peer Evaluations                                       | Perform honest and sincere evaluations of team members       | ALL           |                                               |
| 12/04/2019 | Final Video Due                                              | Create video emphasising the purpose/importance of our system | ALL           |                                               |
| 12/04/2019 | Final Presentation                                           | Ensure Presentation is completed and follows professor's rubric | ALL           |                                               |
|            |                                                              |                                                              |               |                                               |

 

#### Expectation vs. Reality

Above is Team WAR's final project plan. In comparison to the initital project plan, there has been many alterations, setbacks, and updates to the schedule. This is typical for any software development project as it is hard to anticipate final outcomes. It is also difficult to anticipate what the client will ask of the team, so one must do their best to prepare. 

The first requirement that the client added beyond initial requirements was that the leaderboard must display the top users of the system. This posed no major alterations to the system. The second requirement the client proposed was that the system had to be designed so that if the writing center asked for other rules to be added (other than the five original rules), it could easily be done so. At this point, the ER diagram had been completed, the database had been created, and the swagger definition was set up with all appropriate API routes. To complete this request called for an entire renovation of our ER Diagram, which eventually led to a re-do of all other activities mentioned. This set us back a few weeks in terms of the progress we had initially made. Once the new renovation was approved the team pondered on further questions regarding this new design and needed clarifications from the client until we could proceed. In essence, the final approval was needed to continue on, or else we might find ourselves back at square one once again.

Fortunately, the new design was approved and Team War was able to get back on track. The client had initial plans for training models from the system. This was not part of the original requirements but was mentioned as a potential extra feature to the system. We had left a few weeks in our schedule dedicated to complete these AI tasks. However, the client said we did not have the necessary outside information and work completed to carry out these tasks. This led to the client providing python scripts which we used to produce the outcome seen on the AI Page. In the future, these tables could display real information based on training model data. Throughout the semester, we also have encounted work items that took us longer than expected due to bugs. One example of this was facing issues with connecting the front end to the API. The Redux state was not assigning correct values 100 percent of the time. In due time, we were able to resolve this issue by chaining promise resolutions to a dedicated attribute in the state to allow asynchronous calls to be handled synchronously. Integration to the front-end also took us more weeks than we had initially planned for. Our original sceduele planned for all integration to be completed by October 9th! However, we found ourselves integrating from the back end to the front end until almost the end of the project timeline. 

Overall, Team WAR is very satisfied with the outcome of the project and believes we have met all of the requirements requested by the client. We have taken all measures to document our work accurately so that this project may be useful and possibily expanded on in the future. This project is the foundation to a project that has great potential to expand its functionalities in addition to AI model training. All meetings with the client are documented below. 

#### Client Meetings

**Meeting with client #1 (8/30)**

Summary: The purpose of this meeting is to understand background of the project, gather inital requirements from the client, ask questions to further understand the requirements. We established means of communication with the client for outside scedueled meeting time. Below are the questions asked: 

A.  *What is the program?*

​        i.     There’s a prototype for an online writing center program for uploading essays and getting critiques on those essays. The task is to create a web app so that reviewers can go on and correct sentences that students have tagged.

B.  *What does tagging mean?*

​        i.     When the system corrects a student’s essay, the student will tag a sentence if they think that it was correct (incorrectly marked as wrong) for further review by the reviewer.

C. *So reviewers are going to see what the student tagged and what the computer marked as wrong?*

​        i.     No. It should be ambiguous so the reviewer will know that the sentence was marked as incorrect by the computer and tagged by the student for further review, but they won’t know why it was originally marked as incorrect.

D.  *What are some main features that you want included?*

​        i.     There are 5 main criteria (provided by the writing center) for whether or not a sentence is correct. Reviewers should be able to see those 5 criteria and base their review on the criteria. I would also like AI to be incorporated into the program so that the computer will learn for further essays what is correct and what is incorrect based on past reviews from reviewers. It would also be nice if graphs based on site statistics were displayed. There should also be an about page about your team. For reviewers, I want there to be an incentive to correct sentences so reviewers gain reputation based on their corrections and if multiple people had the same corrections.

E.  *How many people correct the sentences?*

​        i.     Sentences are definitively declared wrong or right if they have 5 votes from reviewers that completely agree (either all yes or all no) or if there are more than 5 votes, ¾ of the votes must be in agreement for the sentence to be marked right or wrong.

F.  *Is login necessary for this site?*

​        i.     Yes, it should use Marist Authentication to sign in.

G.  *What type of design would you like the web app to follow?*

​        i.     It needs to be simple and functional so that it’s easy to use for the users and reviewers. It should also be lightweight and fast.

H.  *What type of environment should we develop this in?*

​        i.     It should be a Linux environment

I.  *Are there any specific requirements for the database?*

​        i.     Yes. It needs to be in Postgres or MySQL and queries need to be secure across the servers.

**Meeting with client #2 (9/6)** 

Summary: The purpose of these was to provide status current status of the  project. Team WAR asked further questions regarding the system requirements and clarified anything misunderstood by the team. Client explains what he wants out of the reputation system. 

**Meeting with client #3 (9/13)**

Summary: Meeting with client canceled -- client had to attend conference. 

**Meeting with client #4 (9/20)**

Summary: The purpose of this meeting was to show client user interface design. Client approved designed and was pleased with the dark mode. Client asked team to make minor changes regarding page alignment which was resolved immediately. Client also added the requirement to display top scores on the leaderboard. 

**Meeting with client #5 (9/27)**

Summary: The purpose of this meeting was to review the Entity-Relational Diagram. The Client brought up the question of what if another rule was added? Our current database did not have a rules table to easily integrate another rule into the system. This led to a total renovation of the current ERD. It also led to an entire re-do of most of the progress made for database functionalities and API controls. 

**Meeting with client #6 (10/4)**

Summary: No meeting - Client out of the country. 

**Meeting with client #7 (10/11)**

Summary:  Team went to Professor Alan Labouseur prior to meeting to get feedback on re-designed ERD, in which he made minor changes. Client approved final changes and gave the team approval to continue on with this database design. 

**Meeting with client #8 (10/18) - No Meeting Fall Break**

No meeting this week with client due to break. Client gave approval for ERD and team is getting back on progress. 

**Meeting with client #9 (November 1st)**

The purpose of this meeting is to discuss next steps for AI tasks. We received news from the client that the work needed on his end for us to continue our part was not going to be finished in the allotted time. Thus, he will provide us scripts to act as placeholders for training model data on the AI Page. 

**Meeting with client #10 (November 6th)**

The purpose of this meeting was for the client to check the team's progress. Client described the process of the final handoff. The team proposed an idea for documentation: Docusaurus, which the client approved. All currently on track. 

**Meeting with client #11 (November 13th)**

The purpose of this meeting was to ask client questions memory issues on the Google Server in which the team and client came to a few possible resolutions. The team also asked questions regarding clarification on the admin page. 

**Meeting with client #12 (November 20th)**

The purpose of this meeting was to ask client clarification questions on documentation. The client and team scedueled date and time for the final handoff. 

**Meeting with client #13 (December 2nd)**

The purpose of this meeting is to handoff the complete prototype to client. The project is now in full posession of the client. 

### Lessons Learned 

1. Anticipate changes from the client
   1. There were situations mentioned above where the client introduced new requirements. We learned to always expect there can be changes to the initial requirements so we can best prepare for them. By preparing for alterations, there will be less of a setback when it actually occurs. 
2. Plan with more time than needed 
   1. Originally we set up the schedule plan to finish specific work days before official deadlines. In doing this, we were able to get ahead of sceduele. This proved critical when we had our major setback and was one of the reasons we were able to resume back on track. This also left time for us to review code and make last fixes. 
3. Ensure requirements are understood 
   1. After reviewing initial requirements, the team had many questions. This led us to go back and clarify with the client, which ultimately led to more requirements and bit more confusion. This taught us to ensure we understand what is being asked from the start. 
4. Constantly communicate with team
   1. From the project start, the team set up a communication plan. We decided on a time we would meet every week. We also exchanged phone numbers, made a group chat, and created a slack channel. This would allow us to be in constant contact with one another in and out of the classroom. This ultimately brough us closer together not only as co-workers but as friends that could collaborate effectively. We learned that open communication leads to a more comfortable working environment and the creation of a more efficient system. 
5. Never be afraid to ask for help
   1. In carrying out a project, we learned that the best results stem from asking for help. We learned that you can try your best but sometimes guidance from a team member goes a long way. Also, this is the whole reason why we are on a team, to guide one another and help learn from one another. 
6. Voice your thoughts and opinons
   1. Working with a team on a project where everyone has different personalities and skills, it can be hard to voice one's opinion. We learned that to work with a team means we must always be upfront and voice our thoughts which leads to more knowledge and better outcomes.  
7. Google Slides Only
   1. During the first week of presenting our weekly updates (that was completed on a Power Point, the power point failed to open and we had to resort to alternative forms of. We learned the lesson of not only use google slides only, but always have a back up. Presentations will not always turn out the way you expect them too, especially in the world of technology where live demos are risky. We learned to always have a back-up plan. 

## Infrastructure

### IT Requirements

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

## Technologies/Frameworks 

Below are the technologies and frameworks Team WAR has utilized in managing, designing, developing, and deploying this system. 

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/1*j_zP74-cpvXRcs8dM_pkMQ.png" alt="Image result for docker" style="zoom:33%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/swagger-logo-horizontal.png" alt="Image result for swagger" style="zoom: 50%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/79-793376_flask-png-python-flask-logo-png.png" alt="Image result for python flask logo" style="zoom: 25%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/react-logo.png" alt="Image result for react logo" style="zoom: 67%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/node-js-736399_960_720.png" alt="Image result for nodejs logo" style="zoom: 50%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/postgresql-logo.png" alt="Image result for postgres logo" style="zoom: 50%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/uploads%2Fcard%2Fimage%2F918220%2F316bce31-4c38-4f3b-b743-a17406175286.png%2F950x534__filters%3Aquality(80).png?signature=ASyPwdNVsAIo5E7uzfpoydo-rmc=&amp;source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com.png" alt="Image result for slack logo" style="zoom: 33%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/github_PNG20.png" alt="Image result for github logo" style="zoom: 25%;" />

<img src="/Users/samanthadimaio/Desktop/Capping Pictures/trello-logo-blue.png" alt="Image result for trello logo png" style="zoom: 25%;" />



##Test Plan

Test Case 1: 

Log In

Test Case 2: 

Submitting a review

##Cost Analysis 

Cost Analysis can be used to assess the value of the system. In looking at costs, one can compares the project's costs to the value it will deliver.  

Costs based on categories: Labor, Software, Hardware, & Facilities: 

- **Labor:** The cost of human effort expended towards project objectives.

|        Role         | HRs         | SKILLS/Technologies                                          | COST      |      | 13 Weeks Salary |
| :-----------------: | ----------- | ------------------------------------------------------------ | --------- | ---- | --------------- |
|                     |             |                                                              |           |      |                 |
|   Project Manager   | 8 hrs/week  | Diagrams, Documentation, Communication, Organization, Trello, Github | $22/hr    |      | $2,288          |
|      Developer      | 14 hrs/week | Java, Python, Node.js, Swagger, Docker, CAS Authentication   | $28/hr    |      | $5,096          |
|   Database Admin    | 8 hrs/week  | SQL, Postgres                                                | $22/hr    |      | $2,288          |
|         IT          | 4 hrs/week  | Routers, Switches, Setting up servers                        | $18/hr    |      | $936            |
| Front-End Developer | 6 hrs/week  | HTML, CSS, Javascript, React                                 | $20/hr    |      | $1,560          |
|                     |             |                                                              | **Total** |      | $12, 168        |

NOTE: Batchelor's degree preffered, but no degree is required to assume these roles as long as necessary skills are applicable. 

- **Software:** Non-physical computer resources.

  - All softwares used contained no cost 

    

- **Hardware:** Physical computer resources.

  | Laptop | Cost (Approx.) |      |      |
  | ------ | -------------- | ---- | ---- |
  | 1      | $1000          |      |      |
  | 2      | $1000          |      |      |
  | 3      | $1000          |      |      |
  | 4      | $1000          |      |      |
  | 5      | $1000          |      |      |
  |        | Total: $5000   |      |      |

  Note: A team of five could thoroughly complete this project. The technologies used are avaiable on all macOS, Windows, and Linux operating systems. 

  

- **Facilities:** The cost of renting or using specialized equipment, services, or locations.

  - This entire project can be hosted on the cloud such as AWS or Google Server. The memory needed for our current system is approximately 1 GB. This would amount to a cost of approximately $5/month to run this system.
  - No office space necessary   

**Totals** 

This chart provides the total cost for one year of building and maintaining the system. Note: This project took aproximately 13 weeks to complete. 

| Category       | Total                |      |
| -------------- | -------------------- | ---- |
| **Labor**      | $12, 168             |      |
| **Software**   | 0                    |      |
| **Hardware**   | $5,000               |      |
| **Facilities** | $5 * 12 months = $60 |      |
|                | **$17,228**          |      |



## Ethical Implications

​	

​	There are many ethical standards that professionals must take into account when building a system. They must ensure that their application will abide by a standard code of ethical conduct. This is very important for computing professionals, as their products and services will be potentially utilized by thousands of users on daily basis. The Writing Advisor Review System follows ethical guidelines in accordance to the ACM Code of Ethics and basic human rights such as privacy. The ACM Code of Ethic is designed to "inspire and guide the ethical conduct of all computing professionals, including current and aspiring practitioners, instructors, students, influencers, and anyone who uses computing technology in an impactful way."

​	ACM general ethical principle 1.1 states professionals must contribute to society and human well-being, acklowledge that all people are stakeholders in computing. Team WAR acknowledges that the users of this system will contribute to the well-being of the writing community as professional reviewers. ACM general ethical principle 1.1 states professionals must be honest and trustworthy. There is no false advertisment to the reviewer on our system. There is no way for the reviewer to use the system for harm against users who submit these essays. The reviewer will validate sentences as correct or incorrect to the best of their professional ability. To use the system, our users must agree to abide by the standards of Marist College Writing Center, as they are an employees at the Marist College Writing Center. Also, per standards of the Marist Writing Center, ACM general principle 1.7 states to honor confidentiality. Administrators of the system, nor it's users will not expose the contents of the sentences being reviewed. We recognize that some sentences may come from assignments be personal and contain private information that the student does not want to be released.   

ACM general ethical principle 1.4 states that professionals must be fair and take action not to discriminate Team WAR does not discriminate against the users of our who can use our product Marist celebrates diversity As long a student is enrolled at Marist college they can use our product no matter what age, color, disability, ethnicity, family status, gender identity, labor union membership, military status, nationality, race, religion or belief, sex, or sexual orientation. As our system is in dark mode, it is colorblind friendly. 

​	All users of our system maintain a right to privacy. Improper access to personal information is a violation of a user's privacy. In the technology world, even authorized access may lead to privacy concerns. As our database stores user information, we consider the ethical implications of holding this information. 

Firstly, WAR does not allow anyone to acccess site statistics unless they have authorized access to the system. 

![image-20191121160344793](/Users/samanthadimaio/Desktop/Capping Pictures/image-20191121160344793.png)

Privacy The Writing Advisor Reviewing System . 1.6 Respect privacy *We will be transparent that the data entered will be used to train our models as per the disclaimer on the sign on-page. We will only collect the minimum amount of information needed (ex full name & student ID)Data cannot be sent to third party applicants On the admin page data is collected to see login activity however, this will not be tied to the specific user. Users do not have to worry about their data being exploited. not associating the user's information with the log in data. We are simply 

Designing or implement systems that deliberately demean an individuals ability is not ethical. This system does not demean or take away from the reviewing skills of the individual but is used to motivate the reviewer to grow their skills. We understand we are repsonsible for enhancing, and not degrade the quality of working life. Through this system, we are not replacing the jobs the of the individuals in the writing center but motivating them to perform their work more efficiently. We recognize and accept the reviewers safety, professional development and knowledge. 

Freedom of speech -> 

Can you evaluate a sentence based on these specific criteria? These are the main crieria. However, if there are feels there are other guidelines, our system is designed to easily integrate another rule into the system. 

​	The introduction of new technological systems can have a significant effect on human behavior. New technologies present new opportunities to the user in which they did not previously have. 







