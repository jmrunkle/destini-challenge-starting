import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  static const List<Story> _storyData = [
    Story(
        storyText:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyText: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyText:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyText:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyText:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyText:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  Map<int, Map<Choice, int>> _storyPlan = {
    0: {
      Choice.one: 2,
      Choice.two: 1,
    },
    1: {
      Choice.one: 2,
      Choice.two: 3,
    },
    2: {
      Choice.one: 5,
      Choice.two: 4,
    },
  };

  Story getStory() => _storyData[_storyNumber];

  String getChoice1() => getStory().choice1;

  String getChoice2() => getStory().choice2;

  void nextStory(Choice choice) {
    if (_storyPlan.containsKey(_storyNumber)) {
      _storyNumber = _storyPlan[_storyNumber][choice];
    } else {
      restart();
    }
  }

  bool buttonShouldBeVisible() => _storyPlan.containsKey(_storyNumber);

  void restart() {
    _storyNumber = 0;
  }
}

enum Choice { one, two }
