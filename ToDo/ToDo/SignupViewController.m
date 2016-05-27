//
//  SignupViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 3/30/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "SignupViewController.h"
#import "Helpers.h"

@interface SignupViewController() <UITextFieldDelegate>
//@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *emailImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UIImageView *birthdayImageView;
//@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
//@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
//@property (weak, nonatomic) IBOutlet UIButton *joinButton;
@property(strong,nonatomic) UIDatePicker *datePicker;
@property(strong,nonatomic)NSDate *birthdayDate;

@end

@implementation SignupViewController

#pragma mark - Properties

- (NSDate *)birthdayDate {
    if (!_birthdayDate) {
        _birthdayDate = [NSDate date];
    }
    return _birthdayDate;
}

#pragma mark - Actions

- (IBAction)backButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonTapped {
    if (![Helpers isEmailValid:self.emailTextField.text]) {
        [self presentErrorWithTitle:@"Greska" andError:@"Email nije ispravan"];
    }
}

- (void)datePickerValueChanged {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    self.birthdayTextField.text = [dateFormatter stringFromDate:self.datePicker.date];
    [self.birthdayTextField resignFirstResponder];
                                      
    self.birthdayDate = self.datePicker.date;
}

#pragma mark - Public API

- (void)configureTextFieldPlaceholders {
    [super configureTextFieldPlaceholders];
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    [attributes setObject:[UIFont fontWithName:@"Avenir-Book" size:15.0] forKey:NSFontAttributeName];
    [attributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    NSAttributedString *emailPlaceholder = [[NSAttributedString alloc] initWithString:self.emailTextField.placeholder attributes:attributes];
    self.emailTextField.attributedPlaceholder = emailPlaceholder;
    
    NSAttributedString *birthdayPlaceholder = [[NSAttributedString alloc] initWithString:self.birthdayTextField.placeholder attributes:attributes];
    self.birthdayTextField.attributedPlaceholder = birthdayPlaceholder;
}

#pragma mark - Private API

- (void)configureDatePickerInputWithStartDate:(NSDate *)startDate{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    self.birthdayTextField.inputView = datePicker;
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.tintColor = [UIColor darkGrayColor];
    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(ZERO_VALUE, ZERO_VALUE, self.view.frame.size.width, 44.0)];
    toolbar.translucent = NO;
    toolbar.tintColor = [UIColor darkGrayColor];
    toolbar.barTintColor = [UIColor whiteColor];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(datePickerValueChanged)];
    
    [toolbar setItems:@[flexibleSpace,doneButton]];
    self.birthdayTextField.inputAccessoryView = toolbar;
    
    if (startDate) {
        datePicker.date = startDate;
    }
    self.datePicker = datePicker;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [super textFieldDidBeginEditing:textField];
    if (textField == self.emailTextField) {
        self.emailImageView.image = [UIImage imageNamed:@"email-active"];
    }
    if (textField == self.birthdayTextField) {
        self.birthdayImageView.image = [UIImage imageNamed:@"birthday-active"];
        [self configureDatePickerInputWithStartDate:self.birthdayDate];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [super textFieldDidEndEditing:textField];
    
    self.emailImageView.image = [UIImage imageNamed:@"email"];
    self.birthdayImageView.image = [UIImage imageNamed:@"birthday"];
}

















@end