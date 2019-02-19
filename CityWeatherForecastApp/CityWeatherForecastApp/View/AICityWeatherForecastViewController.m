//
//  CityWeatherForecastViewController.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastViewController.h"
#import "AICityWeatherForecastViewOutputProtocol.h"
#import "AICityWeatherForecastConfigurator.h"
#import "AICityWeatherForecastPlainObject.h"

@interface AICityWeatherForecastViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTempValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTempValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDIrectionValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriseValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetValueLabel;

@property (assign, nonatomic) BOOL errorAlertShowing;

@end

@implementation AICityWeatherForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [AICityWeatherForecastConfigurator configureForView:self];
    [_presenter viewIsReady];
    
    [self showNullableForecastValues];
}

- (void)showNullableForecastValues {
    _cityNameValueLabel.text = @"-";
    _weatherValueLabel.text = @"-";
    _tempValueLabel.text = @"-";
    
    _pressureValueLabel.text = @"-";
    _humidityValueLabel.text = @"-";
    _minTempValueLabel.text = @"-";
    _maxTempValueLabel.text = @"-";
    
    _windSpeedValueLabel.text = @"-";
    _windDIrectionValueLabel.text = @"-";
    
    _sunriseValueLabel.text = @"-";
    _sunsetValueLabel.text = @"-";
}

#pragma mark - AICityWeatherForecastViewInputProtocol

- (void)showObtainingForecastDataProcessingError:(NSString *)errorText {
    
    [self showNullableForecastValues];
    
    if (_errorAlertShowing) {
        return;
    }
    
    UIAlertController *alertController = [UIAlertController new];
    
    alertController.title = NSLocalizedString(@"ERROR_TITLE_TEXT", nil);
    alertController.message = errorText;
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    _errorAlertShowing = YES;
    
    NSInteger timeInSecondsBeforeHiding = 2;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInSecondsBeforeHiding * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.errorAlertShowing = NO;
        [alertController dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)showWeatherForecastData:(AICityWeatherForecastPlainObject *)forecastData {
    _cityNameValueLabel.text = forecastData.cityName;
    _weatherValueLabel.text = forecastData.weatherCharacteristic;
    _tempValueLabel.text = [NSString stringWithFormat:@"%.01f", forecastData.tempInCelsius];
    
    _pressureValueLabel.text = [NSString stringWithFormat:@"%.01f", forecastData.pressure];
    _humidityValueLabel.text = [NSString stringWithFormat:@"%.01f", forecastData.humidity];
    _minTempValueLabel.text = [NSString stringWithFormat:@"%.01f", forecastData.minTempInCelsius];
    _maxTempValueLabel.text = [NSString stringWithFormat:@"%.01f", forecastData.maxTempInCelsius];
    
    _windSpeedValueLabel.text = [NSString stringWithFormat:@"%.01f", forecastData.windSpeed];
    _windDIrectionValueLabel.text = forecastData.windDirection;
    
    _sunriseValueLabel.text = forecastData.sunriseTime;
    _sunsetValueLabel.text = forecastData.sunsetTime;
}

@end
