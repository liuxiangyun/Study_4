@Entry
@Component
struct Index {
  //状态变量 ，私有 ，必须指定类型及初始化，或从父组件完成初始化
  @State message: string = 'Hello World'
  @State num: number = 0
  @State bool: boolean = false
  @State dire: Direction = Direction.TOP

  changeMessage() {
    this.message = "hello ArkUI"
  }

  changeNum = () => {
    this.num += 1
  }
  changeBool = () => {
    this.bool = true
  }
  changeEnum = () => {
    this.dire = Direction.BOTTOM
  }

  build() {
    Row() {
      Column() {
        Text(`${this.message} ,click count:${this.num} , clicked:${this.bool},direction:${this.dire}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .onClick(this.changeMessage.bind(this))
            // .onClick(this.changeNum)
            // .onClick(this.changeBool)
          .onClick(this.changeEnum)

        Child({ content: `child component receive parent message:${this.message}` })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @Prop content: string

  build() {
    Text(this.content).onClick(() => {
      this.content = "child component message"
    })
  }
}

enum Direction {
  TOP, BOTTOM
}