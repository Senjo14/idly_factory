import 'package:get/get.dart';

class RollUpList extends GetxController {
  Map<String, List<Map<String, dynamic>>> entryList = {
    'Contact Us': [
      {
        'title': 'Roll Up To Win',
        'subTopics': [
          'I did not receive my rolls',
          'I need help with my prizes',
          'Email verification',
          'General inquiry'
        ]
      },
      {
        'title': 'Account Access',
        'subTopics': [
          'Email Link Not Received',
          'Sign in Code Doesn\'t Work',
          'Email Address is Invalid',
          'Account Doesn\t /Already Exists',
          'I Have Been Logged Out',
          'Error Message on Sign In',
          'App Does Not Load',
          'NetWork Errors'
        ]
      },
      {
        'title': 'Delivery',
        'subTopics': [
          'Cancelled Order',
          'Order Never Arrived',
          'Poor Food Quality',
          'Missing Items/ Incorrect Order',
          'Store Coundn\t Find Order'
        ]
      },
      {
        'title': 'Rewards',
        'subTopics': [
          'Cannot Link My Rewards Card',
          'Did not Receive My Points',
          'Lost My Balance',
          'Offer Wasn\t Applied to Order',
          'Incorrect Region for Account',
          'Promotion Does Not Work'
        ]
      },
      {
        'title': 'TimCard & Payment',
        'subTopics': [
          'Cannot Add Tim Card To My Account',
          'Not Able to Add Funds',
          'Double Charged',
          'Lost My Balance'
          'I Cannot Place An Order',
          'In- Restaurant Issue:Tims Card'
        ]
      },
      {
        'title': 'General Inquiry',
        'subTopics': [
          'Menu Suggestions',
          'Other',
          'In-Restaurant Issue:Other',

        ]
      },
      {
        'title': 'In-Restaurant',
        'subTopics': [
          'In-Restaurant Issue:Order Accuracy',
          'In-Restaurant Issue:Food Quality',
          'In-Restaurant Issue:Service Issue',
          'In-Restaurant Issue:Payment Issue',
          'In-Restaurant Issue:Tims Card',
          'In-Restaurant Issue:Other'
        ]
      }
    ],
    'Frequently Asked Questions': [
    ],
    'Tim Financial Support': [],
    'Feedback Survey': []
  };
}
