## Title Page

Writing Advisor Review Tool 

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

​    x.     The reviewer’s status will be displayed on the leaderboard with a reputation count. 

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

### Use Case Diagram and Documentation 

![](/Users/samanthadimaio/Downloads/Capping Use Case Diagram.png)

The Reviewer as a user has multiple roles in the system. They will log onto the system through Marist CAS Authentication. They will validate tagged sentences as correct or incorrect. If determined incorrect, they will choose the rule the sentence violates. The system has a reputation system in which the user can gain reputation through correctly validating sentences that agree with majority of votes.  The reviewer can lose reputation by incorrectly validating sentences that do not agree with majority of votes. The reviewer is able to view their reputation score on the rank progress bar. They can also see if there reputation score is one of the highest by looking at the leaderboard. The leaderboard displays the top three reputation scores. The Admin as a user can view visual statistics about the system including total users on the system, latest activity, and what operating system the users are reviewing on. Also, the Admin can review AI tables and charts to get information on training models.  

###Activity Diagram and Documentation 

![](/Users/samanthadimaio/Downloads/Activity Diagram for Capping WAR -2.png)This activity diagram represents the sequential flow of actions in the system. The user will be brought to the Log In screen and enter their Marist credentials via CAS Authentication. The system will check if the user is registered or not in the system. If not, they will be directed to the Sign Up screen. Once entering registration information, they will be redirected back to the Log In screen and must re-enter Marist Login credentials to use the system. The opening page displays the front dashboard with options to review a sentence, view the rules, view the leaderboard and current user rank, and also access the side bar tabs. If the user chooses to review a sentence, they must validate the sentence as correct or incorrect. If they choose in correct. To end the session, the user must log out of the system. 

## Project Design

### Database Design

1.  Figure 1.1  ER Diagram

![image-20191118191306297](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191118191306297.png)

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

![](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120201321307.png) 

This screenshot shows the main view of the front landing page which includes the main components of the reviewing tool. This includes a side bar, a leaderboard, a rank system, the sentence reviewer, and a display of the rules. There is also a log out button on the top right corner. The below screenshots will include more detail on each of these components.  

**Sidebar**

![image-20191120201345222](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120201345222.png)

On the left hand side of the application there is a side bar which consists of tabs. The **Dashboard** tab is the main landing page. The **About** tab page will include information about the application as well as information about the creators of the application. The **AI** tab will tables and a graphical display that act as a placeholder for future training model data that will be collected from the application involving the accuracy of reviewing. The **Admin** tab will be used to look at site statistics involving total users on the application, latest activity on the system, and what operating system users are using. The **Help** tab is for FAQs the reviewer may come across when using the tool. 

**Sentence Review** 

![image-20191120201825336](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120201825336.png)

The Sentence Reviewer component is the center of the front landing page. It will display sentences that have been tagged for review. The reviewer can select correct if they believe the sentence is correct. If they believe the sentence contains an error, the user can select incorrect and check off the rule(s) they believe the sentence violates. Another sentences will keep appearing once marked.  

**Display of Rules** 

![image-20191120201911454](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120201911454.png)

Below the sentence review section there is a display of the rules. It shows each rule with a drop down explaining the rule and what a violation of that rule entails. This will help the reviewer understand more clearly if they are unsure whether or not a rule pertains to a tagged sentence. 

**Leaderboard and Ranking System**

**![](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120202009656.png)**

On the left side of the front landing page there is a leaderboard and a rank component underneath. The leaderboard corresponds to the reputation system of the application. Reputation is earned through correctly reviewing a sentence (as correct or incorrect in accordance to agreement with majority of rewiewer's votes for a specific rule). If a submitted review meets this criteria, the reviewer gains 10 points. If the review does not meet this criteria, the reviewer loses 10 points. The Reviewer themself and the other Top 2 Reviewer's, based on the highest reputation, will be displayed on the leaderboard along with their current scores. The ranking will show what the user’s current score is. This allows the user's to see where they stand alongside the top Reviewer's in the system. 

##### About US



The About US page consists of information related to the purpose of the Writing Advisor Review tool. 

#####Artifical Intelligence 

1. Current Threads

![image-20191121141824133](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191121141824133.png)

This table is used to display current models along with parameters regarding the model. A parameter is a variable that is internal to the model and can be estimated from data. They are required by the model when making predictions. 

1. Thread Status

![image-20191121141840251](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191121141840251.png)

This table displays the ID of the model alongside it's current status. 

1. Hyper-Parameter Search Space 

![image-20191121141906858](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191121141906858.png)

This section will be used to diplay images generated based on the model training data. 

#####Admin

1.   Full View

<img src="/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120200859600.png" alt="image-20191120200859600" style="zoom:67%;" />

Here is the full frontal view of the Admin Page, which can be accessed through the left hand tab. 

2. Total Users

![image-20191120200919947](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120200919947.png)

This section displays the total number of users currently in the system. 

3. Login Data

<img src="/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120200948666.png" alt="image-20191120200948666" style="zoom: 25%;" />

This section displays a graphical chart of login data by date. When hovering over the bar graphs, the number of logins appears along with the number of reviews submitted for that day. As the dates progress, this chart will update accordingly. 

4. Users by Operating System

<img src="/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191120201007799.png" alt="image-20191120201007799" style="zoom:50%;" />

This section displays a chart that shows what operating system users are using. It is cateogorized into Windows, Mac, and Other with the percentage of users below. 

#####FAQ

<img src="/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191121135609673.png" alt="image-20191121135609673" style="zoom: 69%;" />

This page is used for FAQ's the user might have when using our system. They can access this page by choosing the tab with question mark labeled "Help" on the left hand side. If they see a question they would like to know the answer to, they can click on the drop down arrow on the right hand side to retrieve the answer. 

#### Theme

As per the clients request, the theme for the Writing Advisor Review tool is simple, functional, and user-friendly. Simple design has many advantages over complicated designs. They are easier for the user to navigate as well as easier for the developer to make fixes. We wanted to ensure the reviewer will not be overwhelmed when using our system as they need to focus to make proper judgements. We designed the system in darkmode for two main reasons. The first reason is that darkmode is very simple and astetically pleasing. Users want to use an application that they find appealing. The second reason takes into account the specific users of the system. Research has proven darkmode to be extremely beneficial in helping reduce headaches, dry eyes, headaches, and eyestrain. We want to promote minimal heath risk to the users on our system, as we recongnize this is their job and they could potentially spend hours using our system. Darkmode will prove extremely beneficial to reviewers reading many sentences a day. 

## Project Plan

###Final Project Schedule

| Date      | Milstone |
| --------- | -------- |
| 8/28/2019 |          |
| 9/03/2019 |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |
|           |          |

In the Project Analysis section, all requirements are listed. Over the course of the semester, there have been 

### Expectations Vs. Reality  

*Each week we have made alterations to our project plan based on changes, added requirements, team setbacks, and unanticipated alterations. 

### Seven Lessons Learned 

1. Anticipate changes from the client
2. Plan with more time needed 
3. Ensure requirements are understood 
4. Under commit and over deliver
5. Constantly communicate with team 
6. Never be afraid to ask for help
7. Voice your thoughts and opinons 
8. Google Slides Only

### Client Meetings

Meeting #1 -Questions with the client

A.  **What is the program?**

​        i.     There’s a prototype for an online writing center program for uploading essays and getting critiques on those essays. The task is to create a web app so that reviewers can go on and correct sentences that students have tagged.

B.  **What does tagging mean?**

​        i.     When the system corrects a student’s essay, the student will tag a sentence if they think that it was correct (incorrectly marked as wrong) for further review by the reviewer.

C.**  **So reviewers are going to see what the student tagged and what the computer marked as wrong?**

​        i.     No. It should be ambiguous so the reviewer will know that the sentence was marked as incorrect by the computer and tagged by the student for further review, but they won’t know why it was originally marked as incorrect.

D.**  **What are some main features that you want included?**

​        i.     There are 5 main criteria (provided by the writing center) for whether or not a sentence is correct. Reviewers should be able to see those 5 criteria and base their review on the criteria. I would also like AI to be incorporated into the program so that the computer will learn for further essays what is correct and what is incorrect based on past reviews from reviewers. It would also be nice if graphs based on site statistics were displayed. There should also be an about page about your team. For reviewers, I want there to be an incentive to correct sentences so reviewers gain reputation based on their corrections and if multiple people had the same corrections.

E.**  **How many people correct the sentences?**

​        i.     Sentences are definitively declared wrong or right if they have 5 votes from reviewers that completely agree (either all yes or all no) or if there are more than 5 votes, ¾ of the votes must be in agreement for the sentence to be marked right or wrong.

F.**   **Is login necessary for this site?**

​        i.     Yes, it should use Marist Authentication to sign in.

G.**  **What type of design would you like the web app to follow?**

​        i.     It needs to be simple and functional so that it’s easy to use for the users and reviewers. It should also be lightweight and fast.

H.**  **What type of environment should we develop this in?**

​        i.     It should be a Linux environment

I.**   **Are there any specific requirements for the database?**

​        i.     Yes. It needs to be in Postgres or MySQL and queries need to be secure across the servers.

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

<img src="https://miro.medium.com/max/630/1*j_zP74-cpvXRcs8dM_pkMQ.jpeg" alt="Image result for docker" style="zoom:33%;" />

<img src="https://cavedweller92.files.wordpress.com/2019/07/swagger-logo-horizontal.png" alt="Image result for swagger" style="zoom: 50%;" />

<img src="https://www.netclipart.com/pp/m/79-793376_flask-png-python-flask-logo-png.png" alt="Image result for python flask logo" style="zoom: 25%;" />

<img src="https://mildaintrainings.com/wp-content/uploads/2017/11/react-logo.png" alt="Image result for react logo" style="zoom: 67%;" />

<img src="https://cdn.pixabay.com/photo/2015/04/23/17/41/node-js-736399_960_720.png" alt="Image result for nodejs logo" style="zoom: 50%;" />

<img src="https://portworx.com/wp-content/uploads/2018/05/postgresql-logo.png" alt="Image result for postgres logo" style="zoom: 50%;" />

<img src="https://mondrian.mashable.com/uploads%252Fcard%252Fimage%252F918220%252F316bce31-4c38-4f3b-b743-a17406175286.png%252F950x534__filters%253Aquality%252880%2529.png?signature=ASyPwdNVsAIo5E7uzfpoydo-rmc=&amp;source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com" alt="Image result for slack logo" style="zoom: 33%;" />

<img src="http://pngimg.com/uploads/github/github_PNG20.png" alt="Image result for github logo" style="zoom: 25%;" />

<img src="https://d2k1ftgv7pobq7.cloudfront.net/meta/u/res/images/brand-assets/Logos/0099ec3754bf473d2bbf317204ab6fea/trello-logo-blue.png" alt="Image result for trello logo png" style="zoom: 25%;" />



##Test Plan

Test Case 1: 

Log In

Test Case 2: 

Submitting a review

##Cost Analysis 

Cost Analysis can be used to assess the value of the system. In looking at costs, one can compares the project's costs to the value it will deliver.  

Costs based on categories: Labor, Software, Hardware, & Facilities: 

- **Labor:** The cost of human effort expended towards project objectives.

|        Role         | HRs         | SKILLS/Technologies                                          | COST   |      |      |
| :-----------------: | ----------- | ------------------------------------------------------------ | ------ | ---- | ---- |
|                     |             |                                                              |        |      |      |
|   Project Manager   | 8 hrs/week  | Diagrams, Documentation, Communication, Organization, Trello, Github | $22/hr |      |      |
|      Developer      | 14 hrs/week | Java, Python, Node.js, Swagger, Docker, CAS Authentication   | $28/hr |      |      |
|   Database Admin    | 8 hrs/week  | SQL, Postgres                                                | $22/hr |      |      |
|         IT          | 4 hrs/week  | Routers, Switches, Setting up servers                        | $18/hr |      |      |
| Front-End Developer | 6 hrs/week  | HTML, CSS, Javascript, React                                 | $20/hr |      |      |

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

  - This entire project can be hosted on the cloud such as AWS or Google Server. The memory needed for our current system is approximately 1 GB. This would amount to a cost of approximately $5/Month to run this system.
  - No office space necessary   

**Totals** 

This project took aproximately 13 weeks to complete. 



Test Cases for the use cases: 

1. When you sign in  
2. When you choose sentence 

## Ethics Essay

​	When developing a project there are many ethical implications the creators must take into account to ensure their application will abide by a standard code/conduct of ethics. As this tool will be utilized by reviewers, 

Privacy -> we are not associating the user's information with the log in data. We are simply 

1.1 Contribute to society and human well-being, acknowledge that all people are stakeholders in computingWe acknowledge that our product will

 1.3 Be honest and trustworthy No false advertisementUsing our service will not result in an A on the assignmentGuaranteeing an honest review Our product will not write students essay’s for themWill aid the students in their writing processOur product is free and will not charge students for using (for now?) (yes always free (marist service)

No false qualificationsThe reviewers are professional and hired by the Marist College writing centerNot accepting bribesThe reviewers will not accept bribes from students to write their paper

 1.4 Be fair and take action not to discriminate*We do not discriminate against who can use our product Marist celebrates diversity As long a student is enrolled at Marist college they can use our product no matter what age, color, disability, ethnicity, family status, gender identity, labor union membership, military status, nationality, race, religion or belief, sex, or sexual orientation. Colorblind is a check 

1.6 Respect privacy *We will be transparent that the data entered will be used to train our models as per the disclaimer on the sign on-page. We will only collect the minimum amount of information needed (ex full name & student ID)Data cannot be sent to third party applicants On the admin page data is collected to see login activity however, this will not be tied to the specific user.Users do not have to worry about their data being exploited. 

1.7 Honor Confidentiality. We will not expose the contents of the data we receive. We realize that some writing assignments that will be submitted may be personal essays. 

![image-20191121160344793](/Users/samanthadimaio/Library/Application Support/typora-user-images/image-20191121160344793.png)



Question: Can you evaluate a sentence based on these specific criteria? 

These are the main crieria. However, if there are feels there are other guidelines, our system is designed to easily integrate another rule into the system. 

