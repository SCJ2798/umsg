class Message {
  String msgs;
  int type;
  bool viewImg = true;
  String owner;
  String imgs;
  Message({this.type, this.msgs, this.owner, this.imgs});
}

List<Map<String, dynamic>> receivedMessages = [
  {
    "type": 1,
    "name": "Group 01",
    "img": 'assets/icons/group.png',
    "msgs": [
      Message(type: 0, msgs: "where....", owner: "Anna", imgs: ""),
    ]
  },
  {
    "type": 0,
    "name": "Olivia",
    "img": "assets/imgs/p3.png",
    "msgs": [Message(type: 0, msgs: "best...", owner: "Olivia")]
  },
  {
    "type": 0,
    "name": "Ava",
    "img": "assets/imgs/p6.png",
    "msgs": [
      Message(type: 0, msgs: "papa", owner: "Ava"),
    ]
  },
  {
    "type": 0,
    "name": "Oscar",
    "img": "assets/imgs/p4.png",
    "msgs": [
      Message(type: 0, msgs: "waiting for you", owner: "Oscar"),
    ]
  },
  {
    "type": 1,
    "name": "Group 02",
    "img": 'assets/icons/group.png',
    "msgs": [
      Message(type: 0, msgs: "go go", owner: "Hary"),
    ]
  },
  {
    "type": 1,
    "name": "Group 03",
    "img": 'assets/icons/group.png',
    "msgs": [
      Message(type: 0, msgs: "joooooooooooooooy", owner: "Leo"),
    ]
  },
  {
    "type": 0,
    "name": "Ivy",
    "img": "assets/imgs/p1.png",
    "msgs": [
      Message(type: 0, msgs: "hi, how are you ?", owner: "Ivy"),
    ]
  },
  {
    "type": 0,
    "name": "Jack",
    "img": "assets/imgs/p5.png",
    "msgs": [
      Message(type: 0, msgs: "hi, how are you ?", owner: "Jack"),
    ]
  },
  {
    "type": 0,
    "name": "Liam",
    "img": "assets/imgs/p5.png",
    "msgs": [
      Message(
          type: 0,
          msgs:
              "Does anybody know what we are looking for? Another hero.another mindless",
          owner: "Liam"),
      Message(
          type: 0,
          msgs: "Behind the curtain , in the pontamime, Hold the line",
          owner: "Liam"),
      Message(
          type: 1,
          msgs: "Behind the curtain , in the pontamime, Hold the line",
          owner: "Liam"),
    ]
  },
];
