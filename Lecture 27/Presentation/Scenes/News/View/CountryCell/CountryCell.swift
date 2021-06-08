//
//  CountryCell.swift
//  MVVM+DataSource+Coordinator
//
//  Created by Nika Kirkitadze on 05.06.21.
//

import UIKit

// https://github.com/onevcat/Kingfisher/issues/1225

class CountryCell: UITableViewCell {

    @IBOutlet weak var theImg: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelType: UILabel!

    @IBOutlet weak var labelTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: NewsViewModel) {
        theImg.kf.setImage(with: item.newsImg, options: [.processor(SVGImgProcessor())])
        
        labelName.text = item.content
        labelType.text = item.type
        labelTime.text = item.time

    }

}
