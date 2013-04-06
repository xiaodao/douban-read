#import "SearchViewController.h"
#import "BookInfoRequest.h"

@implementation SearchViewController {
    UISearchBar *searchBar;
    UITableView *theTableView;
    UISearchDisplayController *theSearchDisplayController;
    BookInfoRequest *bookInfoRequest;
}

- (id)init{
    self = [super init];
    if(self){
        self.navigationItem.title = @"搜索";
        bookInfoRequest = [[BookInfoRequest alloc] initWithDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    theTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    theTableView.dataSource = self;
    theTableView.delegate = self;
    [self.view addSubview:theTableView];

    searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    searchBar.placeholder = @"搜索图书";
    searchBar.delegate = self;
    [searchBar sizeToFit];

    [theTableView addSubview:searchBar];

    theTableView.scrollIndicatorInsets = UIEdgeInsetsMake(CGRectGetHeight(searchBar.bounds), 0, 0, 0);
    theSearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    NSLog(@"%@", [theSearchBar text]);
    [bookInfoRequest searchBooks:[theSearchBar text]];
}

@end