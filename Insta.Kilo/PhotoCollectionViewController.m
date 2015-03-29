//
//  PhotoCollectionViewController.m
//  Insta.Kilo
//
//  Created by Shahin on 2015-03-27.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "PhotoCollectionViewController.h"

@interface PhotoCollectionViewController ()

@property (nonatomic, assign) NSInteger numSections;
@property (nonatomic, assign) NSInteger numCells;
@property (nonatomic, assign) NSInteger choice;
@property (nonatomic, strong) NSArray *allPhotos;
@property (nonatomic, strong) NSArray *photosBySubject;
@property (nonatomic, strong) NSArray *photosBySubjectLabels;
@property (nonatomic, strong) NSArray *photosByLocation;
@property (nonatomic, strong) NSArray *photosByLocationLabels;
@property (strong, nonatomic) IBOutlet UISegmentedControl *selection;

@end

@implementation PhotoCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.clearsSelectionOnViewWillAppear = NO;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    Photo *photo01 = [[Photo alloc] initWithTitle:@"IMG01.JPG"
                                          subject:@"Artsy"
                                         location:@"Inside"];
    
    Photo *photo02 = [[Photo alloc] initWithTitle:@"IMG02.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo03 = [[Photo alloc] initWithTitle:@"IMG03.JPG"
                                          subject:@"Artsy"
                                         location:@"Outside"];
    
    Photo *photo04 = [[Photo alloc] initWithTitle:@"IMG04.JPG"
                                          subject:@"Objects"
                                         location:@"Computer"];
    
    Photo *photo05 = [[Photo alloc] initWithTitle:@"IMG05.JPG"
                                          subject:@"Nature"
                                         location:@"Indide"];
    
    Photo *photo06 = [[Photo alloc] initWithTitle:@"IMG06.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo07 = [[Photo alloc] initWithTitle:@"IMG07.JPG"
                                          subject:@"Nature"
                                         location:@"Computer"];
    
    Photo *photo08 = [[Photo alloc] initWithTitle:@"IMG08.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo09 = [[Photo alloc] initWithTitle:@"IMG09.JPG"
                                          subject:@"Objects"
                                         location:@"Inside"];
    
    Photo *photo10 = [[Photo alloc] initWithTitle:@"IMG10.JPG"
                                          subject:@"Nature"
                                         location:@"Outside"];
    
    self.allPhotos = @[photo01, photo02, photo03, photo04, photo05, photo06, photo07, photo08, photo09, photo10, photo01, photo02, photo03, photo04, photo05, photo06, photo07, photo08, photo09, photo10];
    
    NSArray *artsyPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Artsy"]];
    NSArray *objectPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Objects"]];
    NSArray *naturePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Nature"]];
    
    NSArray *computerPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Computer"]];
    NSArray *insidePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Inside"]];
    NSArray *outsidePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Outside"]];

    self.photosBySubject = @[artsyPhotos, objectPhotos, naturePhotos];
    self.photosBySubjectLabels = @[@"Artsy", @"Objects", @"Nature"];
    
    self.photosByLocation = @[computerPhotos, insidePhotos, outsidePhotos];
    self.photosByLocationLabels = @[@"Computer", @"Inside", @"Outside"];
    
    self.choice = self.selection.selectedSegmentIndex;
}

-(NSPredicate *)predicateWithSubject:(NSString *)subject {
    return [NSPredicate predicateWithFormat:@"SELF.subject contains %@", subject];
}

-(NSPredicate *)predicateWithLocation:(NSString *)location {
    return [NSPredicate predicateWithFormat:@"SELF.location contains %@", location];
}

- (IBAction)selector:(UISegmentedControl *)sender {
    self.choice = self.selection.selectedSegmentIndex;
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(Photo *)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        Photo *selectedPhoto = [Photo new];
        switch (self.choice) {
            case 0:
                selectedPhoto = self.photosByLocation[indexPath.section][indexPath.row];
                break;
            case 1:
                selectedPhoto = self.allPhotos[indexPath.row];
                break;
            case 2:
                selectedPhoto = self.photosBySubject[indexPath.section][indexPath.row];;
                break;
            default:
                break;
        }
        PhotoDetailViewController *photoDetail = (PhotoDetailViewController *)[[segue destinationViewController] topViewController];
        [photoDetail setDetailItem:selectedPhoto];
        photoDetail.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        photoDetail.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
   [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    switch (self.choice) {
        case 0:
            self.numSections = self.photosByLocationLabels.count;
            break;
        case 1:
            self.numSections = 1;
            break;
        case 2:
            self.numSections = self.photosBySubjectLabels.count;;
            break;
        default:
            break;
    }
    return self.numSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (self.choice) {
        case 0:
            self.numCells = [[self.photosByLocation objectAtIndex:section] count];
            break;
        case 1:
            self.numCells = self.allPhotos.count;
            break;
        case 2:
            self.numCells = [[self.photosBySubject objectAtIndex:section] count];
            break;
        default:
            break;
    }
    return self.numCells;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {    
    PhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Photo" forIndexPath:indexPath];
    Photo *photo = [Photo new];
    
    switch (self.choice) {
        case 0:
            photo = [self.photosByLocation[indexPath.section] objectAtIndex:indexPath.row];
            break;
        case 1:
            photo = [self.allPhotos objectAtIndex:indexPath.row];
            break;
        case 2:
            photo = [self.photosBySubject[indexPath.section] objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.photoCellImageView.image = [UIImage imageNamed:photo.title];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}


#pragma mark <UICollectionReusableView>

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    PhotosSupplementaryView *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"Header"
                                                           forIndexPath:indexPath];
        switch (self.choice) {
            case 0:
                header.selectionLabel.text = self.photosByLocationLabels[indexPath.section];
                break;
            case 1:
                header.selectionLabel.text = @"All Photos";
                break;
            case 2:
                header.selectionLabel.text = self.photosBySubjectLabels[indexPath.section];
                break;
            default:
                break;
        }
    }
    return header;
}

@end
