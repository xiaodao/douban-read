#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"

@class DOUBook;


@interface BooksViewController : UITableViewController<BookImageRequestDelegate>{
    NSString *bookStatus;
}

- (void)retrieveBooks;

- (void)bookStatusChanged:(DOUBook *)book;

- (void)retrieveNewBooks;

- (void)retrieveMoreBooks;


- (BOOL)isLoading;

- (void)newBookRequestDidFinish:(NSArray *)theBooks;

- (void)moreBookRequestDidFinish:(NSArray *)theBooks;


- (void)connectionFailed;
@end