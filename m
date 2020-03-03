Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78F1775AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Mar 2020 13:09:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j96Mr-0001dn-B6; Tue, 03 Mar 2020 12:09:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j96Mp-0001dg-OY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 12:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=64IIWQsKmuesDHgDblt1D25xr0H7HuplW7d4Z+tJ5z8=; b=NZOt2wq6vTSVhTmmD3TmTBgxw/
 mW5n0VL1qZGm4mrxZPQiIVfOcUb2T0jiwMd5HGddH27yKnmY/3CC/g20Mnd4uJPIZzZ9fEf+ZPvzj
 7C2t0o9hLBjFFnUsBZOj4hJwxbyh+iHF0rFX0vzcilg6XFBHzjyfCSdpeCRAL7pTNLPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=64IIWQsKmuesDHgDblt1D25xr0H7HuplW7d4Z+tJ5z8=; b=G
 TNWcBFckOYThmLZMJxyjpKPK7z84k+jC0wn98WdrNPMjfVZEuNrJZBfE5/vcCyNQlIChDaALsy9F6
 wYpQCSl78k1woTgR7cJ5Xdkaitwwbe1xPDrwNtCPC1s3D+9zmJuwSy3+OrgJBhdMwVDeByNuhf0gg
 YXF4unHDO/cJ8UmE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j96Mo-00FUpr-2m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 12:09:43 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E32F0599BCD4FDDF444A;
 Tue,  3 Mar 2020 20:09:34 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Mar 2020 20:09:27 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 3 Mar 2020 20:09:25 +0800
Message-ID: <20200303120925.66259-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j96Mo-00FUpr-2m
Subject: [f2fs-dev] [PATCH] f2fs: fix to update f2fs_super_block fields
 under sb_lock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fields in struct f2fs_super_block should be updated under coverage
of sb_lock, fix to adjust update_sb_metadata() for that rule.

Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/gc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9ead93fcf78a..a45ba7da1737 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1442,12 +1442,19 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
 static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 {
 	struct f2fs_super_block *raw_sb = F2FS_RAW_SUPER(sbi);
-	int section_count = le32_to_cpu(raw_sb->section_count);
-	int segment_count = le32_to_cpu(raw_sb->segment_count);
-	int segment_count_main = le32_to_cpu(raw_sb->segment_count_main);
-	long long block_count = le64_to_cpu(raw_sb->block_count);
+	int section_count;
+	int segment_count;
+	int segment_count_main;
+	long long block_count;
 	int segs = secs * sbi->segs_per_sec;
 
+	down_write(&sbi->sb_lock);
+
+	section_count = le32_to_cpu(raw_sb->section_count);
+	segment_count = le32_to_cpu(raw_sb->segment_count);
+	segment_count_main = le32_to_cpu(raw_sb->segment_count_main);
+	block_count = le64_to_cpu(raw_sb->block_count);
+
 	raw_sb->section_count = cpu_to_le32(section_count + secs);
 	raw_sb->segment_count = cpu_to_le32(segment_count + segs);
 	raw_sb->segment_count_main = cpu_to_le32(segment_count_main + segs);
@@ -1461,6 +1468,8 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 		raw_sb->devs[last_dev].total_segments =
 						cpu_to_le32(dev_segs + segs);
 	}
+
+	up_write(&sbi->sb_lock);
 }
 
 static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
