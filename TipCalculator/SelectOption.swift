import UIKit

class SelectOption: UIView {

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

        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }

    private func addComponent() {
        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.numberOfLines = 0

    }

    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()

        aPath.move(to: CGPoint(x: 0, y: 0))
        aPath.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))

        aPath.move(to: CGPoint(x: 0, y: self.bounds.size.height - borderSize))
        aPath.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height - borderSize))
        aPath.close()

        aPath.lineWidth = borderSize

        aPath.stroke()
        aPath.fill()
    }
}
