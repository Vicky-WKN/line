//
//  ViewController.m
//  MixWeatherLine
//
//  Created by Kuina Wei on 2018/12/26.
//  Copyright © 2018年 Kuina Wei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@property (nonatomic, strong) AAChartView *bbChartView;
@property (nonatomic, strong) AAChartModel *bbChartModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = 200;
    _aaChartView = [[AAChartView alloc]init];
    _aaChartView.frame = CGRectMake(0, 100, chartViewWidth, chartViewHeight);
    self.aaChartView.scrollEnabled = YES;
    ////设置图表视图的内容高度(默认 contentHeight 和 AAChartView 的高度相同)
    //_aaChartView.contentHeight = chartViewHeight;
    [self.view addSubview:_aaChartView];
    
    self.aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeArea)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .yAxisLineWidthSet(@0)//Y轴轴线线宽为0即是隐藏Y轴轴线
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .yAxisMaxSet(@20)
    .yAxisMinSet(@0)
    .seriesSet(@[
                 AASeriesElement.new
                 .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @16.5, @17.2, @12.5, @10.3, @8.3, @6.9, @5.6, @4.8, @4.4, @3.2, @2.0, @1.4]),
                 ]
               );
    _aaChartModel.markerSymbolStyle = AAChartSymbolStyleTypeInnerBlank;//设置折线连接点样式为:内部白色
    _aaChartModel.gradientColorsThemeEnabled = NO;//启用渐变色
    _aaChartModel.animationType = AAChartAnimationEaseOutQuart;//图形的渲染动画为 EaseOutQuart 动画
    _aaChartModel.xAxisCrosshairWidth = @0.9;//Zero width to disable crosshair by default
    _aaChartModel.xAxisCrosshairColor = @"#FFE4C4";//(浓汤)乳脂,番茄色准星线
    _aaChartModel.xAxisCrosshairDashStyleType = AALineDashSyleTypeLongDashDot;
    _aaChartModel.xAxisVisible = NO;
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
    
    //柱状图
    _bbChartView =[[AAChartView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 150)];
    _bbChartView.contentHeight = 150;
    [self.view addSubview:_bbChartView];
    _bbChartView.scrollEnabled = YES;
    
//    AAOptions *aaOptions = configureTheNoGapColunmChart;
    self.bbChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeColumn)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置 Y 轴标题
    .tooltipValueSuffixSet(@"℃")//设置浮动提示框单位后缀
    .yAxisGridLineWidthSet(@0)//y轴横向分割线宽度为0(即是隐藏分割线)
    .xAxisGridLineWidthSet(@0)
    .markerRadiusSet(@0)
    .borderRadiusSet(@5)
    .yAxisMaxSet(@80)
    .yAxisMinSet(@40)
    .tooltipEnabledSet(false)
    .seriesSet(@[
                 AASeriesElement.new
                 .dataSet(@[@(52), @(53), @(51), @(49), @(54), @(60), @(61), @(59), @(58), @(70), @(69), @(64)]),
                 ]
               );
    
    AAOptions *aaOptions = [AAOptionsConstructor configureChartOptionsWithAAChartModel:self.bbChartModel];
    aaOptions.plotOptions.column.groupPadding = @0.05;//Padding between each column or bar, in x axis units. default：0.1.
    aaOptions.plotOptions.column.pointPadding = @0;//Padding between each value groups, in x axis units. default：0.2.
    
    aaOptions.plotOptions.column.dataLabels = AADataLabels.new
    .enabledSet(true)
    .ySet(@(-10))
    .backgroundColorSet(@"rgba(0, 0, 0, 0.75)")
    .shapeSet(@"callout")
    .styleSet(AAStyle.new
              .colorSet(@"#FFFFFF")
              .textOutlineSet(@"none"));
    [self.bbChartView aa_drawChartWithOptions:aaOptions];
}


@end
