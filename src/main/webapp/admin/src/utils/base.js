const base = {
    get() {
                return {
            url : "http://localhost:8080/ssm2f3db/",
            name: "ssm2f3db",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/ssm2f3db/front/index.html'
        };
            },
    getProjectName(){
        return {
            projectName: "电子竞技周边商城"
        } 
    }
}
export default base
