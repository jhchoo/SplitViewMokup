//
//  MainTableViewCell.swift
//  pushMokup
//
//  Created by jae hwan choo on 2020/10/23.
//

import UIKit

class DealerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var reply: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 그림자를 캐시에 저장해서 재활용
        //container.layer.shouldRasterize = true
        // 기본적으로 막혀있는걸 풀어준다.
        container.layer.masksToBounds = false
    }
    
    func configure(index: Int) {
        title.text = "GHEPS"
        desc.text = "[긴급] 보안 정책 변경으로 인한 긴급 시스템 점검 \(index)"
        date.text = "2020.10.16  17:10"
        reply.text = "댓글 \(index + 5)"
    }
    
}
