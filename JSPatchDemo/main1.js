
require('UIView, UIColor, UIButton, UIImageView, UITableView, UIImage, ThirdViewController, ModelItem, JPObject')
autoConvertOCType(1)


defineClass('ViewController', {
            handleBtn: function(sender) {
            var tableViewCtrl = JSTableViewController.alloc().init()
            self.navigationController().pushViewController_animated(tableViewCtrl, YES)
            },
            handlebtnSecond: function(sender) {
            var secondController = SecondViewController.alloc().init()
            self.navigationController().pushViewController_animated(secondController, YES)
            }
})



defineClass('SecondViewController:UIViewController <UIAlertViewDelegate>', {
            //instance method
            viewDidLoad: function() {
//                self.super().viewDidLoad()//不调用SecondViewController中的viewDidLoad方法
            self.ORIGviewDidLoad();//调用SecondViewController中的viewDidLoad方法

            //UIView
            var view1 = UIView.alloc().initWithFrame({x:20, y:100, width:50, height:50})
            var redColor = UIColor.redColor();
            view1.setBackgroundColor(redColor);
            self.view().addSubview(view1)

            
            //UIImageView
            var img = UIImageView.alloc().initWithFrame({x:90, y:100, width:50, height:50})
            img.setImage(UIImage.imageNamed("img"))
            self.view().addSubview(img)
            
            
            //UIButton
            var UIControlEventTouchUpInside  = 1 << 6;
            var UIButtonTypeCustom = 0;
            var UIControlStateNormal = 0;
            var button2 = UIButton.buttonWithType(UIButtonTypeCustom)
            button2.setTag(100)
            button2.setFrame({x:160, y:100, width:50, height:50})
            button2.setBackgroundColor(UIColor.blackColor())
            button2.addTarget_action_forControlEvents(self, "handleJSButton:", UIControlEventTouchUpInside)
            button2.setTitle_forState("点我", UIControlStateNormal)
            button2.setTitleColor_forState(UIColor.whiteColor, UIControlStateNormal)
//button2.setBackgroundImage_forState(UIImage.imageNamed("img"), UIControlStateNormal)
            self.view().addSubview(button2)
            
            },
            
            //push thirdController
            handleJSButton: function(sender) {
                console.log("click button--------" + sender.tag())
            var thirdController = ThirdViewController.alloc().init()
            self.navigationController().pushViewController_animated(thirdController, YES)
            },
            
            
            viewDidAppear: function(animated) {
                var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Show title", "message", self, "OK", "Cancel", null)
//            alertView.show()
            },
            
            alertView_clickedButtonAtIndex: function(alertView, buttonIndex) {
                console.log("click index=========" + buttonIndex)
            },
            
            },{
            //class method
            })


//自定制cell
defineClass('ThirdViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>', ['data', 'tableView'],{
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
//            self.super().viewDidLoad()
            self.ORIGviewDidLoad()
            
            self.setTitle("ThirdViewController")
            var UITableViewStylePlain = 0;
            var UITableViewCellSeparatorStyleNone = 0;
            tableView = UITableView.alloc().initWithFrame_style({x:0, y:0, width:self.view().frame().width, height: self.view().frame().height+64}, UITableViewStylePlain)
            tableView.setDelegate(self)
            tableView.setDataSource(self)
            tableView.setTableFooterView(UIView.alloc().init())
            tableView.setSeparatorStyle(UITableViewCellSeparatorStyleNone)
            self.view().addSubview(tableView)
            var array = self.dataArray()
//4       1
            
//             xvar string = self.stringOne();
//            console.log("-----kkkkkk000-----:"+string.toJS())
            console.log("-----kkkkkk111-----:"+array)
            
            

            
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


/*
//自定制cell
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

*/
//系统cell
defineClass('JSTableViewController : UITableViewController <UIAlertViewDelegate>', ['data'], {
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
  numberOfSectionsInTableView: function(tableView) {
    return 1;
  },
  tableView_numberOfRowsInSection: function(tableView, section) {
    return self.dataSource().length;
  },
  tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
    var cell = tableView.dequeueReusableCellWithIdentifier("cell") 
    if (!cell) {
      cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
    }
    cell.textLabel().setText(self.dataSource()[indexPath.row()])
    return cell
  },
  tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
    return 60
  },
  tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
     var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataSource()[indexPath.row()], self, "OK",  null);
     alertView.show()
  },
  alertView_willDismissWithButtonIndex: function(alertView, idx) {
    console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
  }
})
