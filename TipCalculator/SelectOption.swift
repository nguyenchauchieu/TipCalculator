import UIKit

class SelectOption: UIView {

    let checkBox = CheckBox()
    let label = UILabel()
    let borderSize: CGFloat = 0.5


    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        self.setup()
    }

    private func setup() {
        addComponent()
        styleComponent()

        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }

    private func addComponent() {
        self.addSubview(label)
        self.addSubview(checkBox)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: -20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.numberOfLines = 0

        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox.heightAnchor.constraint(equalTo: checkBox.widthAnchor).isActive = true
    }

    func styleComponent() {
        label.font = FontUtil.normalFontMedium()
        label.textColor = ColorUtil.inputTextColor()
    }

    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()

        aPath.move(to: CGPoint(x: 0, y: 0))
        aPath.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))

        aPath.move(to: CGPoint(x: 0, y: self.bounds.size.height - borderSize))
        aPath.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height - borderSize))
        aPath.close()

        aPath.lineWidth = borderSize

        ColorUtil.borderColor().set()
        aPath.stroke()
        aPath.fill()
    }
}
