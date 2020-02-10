#import "ChooseTemporaryFamilyController.h"
#import "ReferThroughoutSection.h"

@interface ChooseTemporaryFamilyController ()


@end

@implementation ChooseTemporaryFamilyController
- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void)getRequestData{
        
}



- (IBAction)home:(UIButton *)sender {
     [self performSegueWithIdentifier:@"Rare" sender:nil];
}
- (IBAction)play:(UIButton *)sender {
       [self performSegueWithIdentifier:@"PlayGame" sender:nil];
}
- (IBAction)set:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Setting" sender:nil];
}

-(void)loadDatespl{

}
@end


