
class ZeroLifeComponet extends Component {

    static propTypes={
        //指定类型的对象
        person:PropTypes.any,
    }

    //getDefaltProps 
    static defaultProps = {
        items:require('../../data.json').data,
        onGridSelected:()=>{}
    }
    //   ｜
    //   ｜ 
    //   ｜
    //   ｜ 
    //getInitialState state初始化
    constructor(props) {
        super(props);
        this.state = {
            isRefresh: false, // 下拉刷新
        }
    }
    //   ｜
    //   ｜
    //   ｜ 
    //组件将要加载时调用 // Mounting：挂载
    componentWillMount() {

    }
    //   ｜
    //   ｜
    //   ｜ 
    //组件渲染时调用
    render() {
        const { items,onGridSelected } = this.props;
        return (
            <Container>
            </Container>
        );
    }
    //   ｜
    //   ｜
    //   ｜ 
   //组件加载完成时调用,发送网络请求
      componentDidMount() {
    }
    //   ｜
    //   ｜
    //   ｜ 
    // app运行中状态  ---->>> 组件状态(state)发生改变 --->shouldComponentUpdate(nextProps, nextState)
    // props改变时调用 
    componentWillReceiveProps(nextProps,nextContext){
    
    }
    //   ｜
    //   ｜
    //   ｜
    //   ｜ 
    //返回false不更新组件刷新，一下两个方法不执行,返回ture更新
    shouldComponentUpdate(nextProps, nextState) {
       return true;
    }
    //   ｜
    //   ｜
    //   ｜
    //组件将要更新时调用   //Updating：更新
      omponentWillUpdate(nextProps, nextState) {

    } 
    //   ｜
    //   ｜
    //   ｜
    //   render()重新渲染
    //   ｜
    //   ｜
    //   ｜
    //   ｜
    //   ｜
    //组件完成更新时调用
    componentDidUpdate(nextProps, nextState) {

    }
    //   ｜
    //   ｜
    //   ｜
    // app运行中状态  
    //   ｜
    //   ｜
    //   ｜
    //   ｜
    //   ｜
    //组件销毁时调用,卸载移除
      componentWillUnmount() {

    }
    //   ｜
    //   ｜
    //   ｜
    //   ｜
    //   ｜
    //   结束
    

}
