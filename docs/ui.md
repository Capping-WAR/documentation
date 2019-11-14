---
id: ui
title: UI
sidebar_label: UI
---

The War frontend is written in ReactJS, it takes advantage of reacts ability to split code into components which can be loaded independently, allowing for the state of any of the components to update on the fly. This is tremendously useful as this UI mostly serves as a dashboard.

## Theme/Style

The UI is written using the [MaterialUI Component](https://material-ui.com) and is a key part of the look and style of the app. As far as the coding style/standards we attempted to stick to the newest for JS, ES6. One of the most important aspects of this standard is implementing functional components rather than class components. We ask that this style is continued if any changes are made. Here is a quick example:

### Class Component

```javascript
class Hello extends Component{
    render(){
        return <div>Hello {this.props.name}</div>
    }
}
```

### ES6 Functional Component
```javascript
const Hello = ({name}) => <div>Hello {name}</div>
```

Also be aware of the unintentional consequences that can occur when adding dependencies, some components don't play nice with each other. Remember to find the best solution, not the quickest one...it will make developing in ReactJS far smoother.

Lastly, on the topic of code style, ES6 Bans `var`. I second that...it shall never enter this source code! For some of the reasoning behind this, see [this article](https://hackernoon.com/why-you-shouldnt-use-var-anymore-f109a58b9b70).


## Running for Development
To run the server in development in order to make changes run the following command after cloning the [github repository](https://github.com/Capping-WAR/frontend).

```bash
yarn start
```

## Deploying for Production

### Standalone (Without Docker)

To run in production without docker run the following command from the root of the repo.

```bash
node index.js
```

### Docker 

To deploy using docker simply run the following command in the root of the repo

```bash
docker-compose up -d
```

