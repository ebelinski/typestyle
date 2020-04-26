import UIKit

class OutputTableViewCell: UITableViewCell {

  static let identifier = "OutputTableViewCell"

  let outputLabel = UILabel()
  let favoriteLabel = UILabel()
  let padding: CGFloat = 10

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    backgroundColor = .clear

    let selectedView = UIView()
    selectedView.backgroundColor = .appSelected
    selectedBackgroundView = selectedView

    setUpOutputLabel()
    setUpFavoriteLabel()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setUpOutputLabel() {
    outputLabel.textColor = .appText
    outputLabel.font = UIFont.preferredFont(forTextStyle: .body)
    outputLabel.adjustsFontForContentSizeCategory = true
    outputLabel.numberOfLines = 0 // unlimited

    addSubview(outputLabel)

    outputLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(padding)
      make.leading.equalToSuperview().inset(padding)
      make.bottom.equalToSuperview().inset(padding)
    }
  }

  func setUpFavoriteLabel() {
    favoriteLabel.textColor = .appText
    favoriteLabel.font = UIFont.preferredFont(forTextStyle: .body)
    favoriteLabel.adjustsFontForContentSizeCategory = true
    favoriteLabel.textAlignment = .right
    favoriteLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 10000), for: .horizontal)

    addSubview(favoriteLabel)

    favoriteLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(padding)
      make.leading.greaterThanOrEqualTo(outputLabel.snp.trailing).inset(padding)
      make.trailing.equalToSuperview().inset(padding)
      make.bottom.equalToSuperview().inset(padding)
    }
  }

}
