# JSPatchDemo
使用JSPatch实现热更新，用JSPatch创建常用控件，创建tableview和自定义tableviewCell

## JSPatch网站
http://jspatch.com

## 部分代码示例

```javascript
require('UIView, UIColor, UIButton, UIImageView, UITableView, UIImage, ThirdViewController, ModelItem, JPObject')


defineClass('ThirdViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>', ['data'],{
            
            dataSource: function() {
            var data = self.data();
            if (data) return data;
            var data = [];
            for (var i = 0; i < 20; i ++) {
            data.push("cell from js " + i);
            }
            self.setData(data)
            return data;
            },
            
            
            viewDidLoad: function() {
            self.super().viewDidLoad()
            self.setTitle("ThirdViewController")
            var UITableViewStylePlain = 0;
            var UITableViewCellSeparatorStyleNone = 0;
            var tableView = UITableView.alloc().initWithFrame_style({x:0, y:0, width:self.view().frame().width, height: self.view().frame().height+64}, UITableViewStylePlain)
            tableView.setDelegate(self)
            tableView.setDataSource(self)
            tableView.setTableFooterView(UIView.alloc().init())
            tableView.setSeparatorStyle(UITableViewCellSeparatorStyleNone)
            self.view().addSubview(tableView)
            },
            
            
            numberOfSectionsInTableView: function(tableView) {
            return 1;
            },
            
            tableView_numberOfRowsInSection: function(tableView, section) {
            return self.dataSource().length;
            },
            
            
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (!cell) {
            cell = require('ThirdTableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
            }
            cell.leftImage().setImage(UIImage.imageNamed("img"))
            cell.title().setText(self.dataSource()[indexPath.row()])
            return cell
            },

            
            tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
            return 80
            },
            
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            tableView.deselectRowAtIndexPath_animated(indexPath, YES)
            var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataSource()[indexPath.row()], self, "OK",  null);
            alertView.show()
            },
            
            })
```

## AppDelegate中的设置，读取本地的js文件或获取网络的js文件
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //读取本地的JavaScript文件进行代码运行(main.js文件)
    /*
    [JPEngine startEngine];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
     */
     
     
    
    //获取网络的JavaScript文件进行代码运行(main.js文件)
    [JSPatch startWithAppKey:@"4a4ce3160911c906"];
    //用来检测回调的状态，是更新或者是执行脚本之类的，相关信息，会打印在你的控制台
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
    }];
    [JSPatch setupDevelopment];
    [JSPatch sync];
    

    return YES;
}



```
