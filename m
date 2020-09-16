Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C747D26B986
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 03:52:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIMcS-00083e-93; Wed, 16 Sep 2020 01:52:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1kIMcQ-000828-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Sep 2020 01:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQXinUZo3kkvv+C/kbOf/a+aONN44hp6sBgLjvoojKw=; b=bo6ExFgrSs0P5/xJDO8kPcZ140
 XTVTD4HCys73w19k2TSsXO5E67QrMmm/lQwjh99dpurVMYpZQkk0m0dtJjpsafhQw3+Y5DL7BSkKs
 GVlxAUpPTot4JQgrjpy13S4kCpZ9Og5RgwPIyhTzJ6D4aetaEuVLH0kxNJTB7DGNTBOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XQXinUZo3kkvv+C/kbOf/a+aONN44hp6sBgLjvoojKw=; b=e
 rJNkER4rLXQajCXXyZHMS86lvJVm5p4PdaRoXjV6TreElkceHfR7klIax0v11m/JFbuZob46ctyAx
 qI3ygYjnv4XJGStxwW6IIDUidKNh1nUGTtqQjavM2EXWos9vEhenyCVHoiuBhW/MnP0I8PWDFNqoL
 aAfRlRNBfRwlvDHU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIMcJ-00AhfT-78
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Sep 2020 01:52:22 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0DD3D217BA23243E797B;
 Wed, 16 Sep 2020 09:51:58 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 09:51:48 +0800
From: Xiaojun Wang <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 16 Sep 2020 09:54:10 +0800
Message-ID: <20200916015410.4135737-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kIMcJ-00AhfT-78
Subject: [f2fs-dev] [PATCH] f2fs: fix wrong total_sections check
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Meta area is not included in section_count computation.
The code in mkfs/f2fs_format.c is:
	total_zones = get_sb(segment_count) / (c.segs_per_zone) -
					total_meta_zones;
	set_sb(section_count, total_zones * c.secs_per_zone);

So the minimum total_sections is 1.

Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>
---
 fs/f2fs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dfa072fa8081..a450c8589841 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2799,8 +2799,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	if (total_sections > segment_count ||
-			total_sections < F2FS_MIN_SEGMENTS ||
+	if (total_sections > segment_count || total_sections < 1 ||
 			segs_per_sec > segment_count || !segs_per_sec) {
 		f2fs_info(sbi, "Invalid segment/section count (%u, %u x %u)",
 			  segment_count, total_sections, segs_per_sec);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
