Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB05B877D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2WW-0003rz-P0; Fri, 09 Aug 2019 10:53:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2WW-0003rj-46
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3D6begZLYkO/j5vRb0Wbx4tYr0lqDgdVVE+Q5lI+kOc=; b=SRzZ435NC2vq29L+i54W5CSPgl
 HsWXSFmLhPSDRy8zk2EiHmAY/4KbtgEXVMtABzlReYCNlYHA+LDcviSHb4osFCj6okpO7cSHMEywR
 kQTat9l7m3dYnWtUy0uKk9/5wL+/54pfjxErBFe/tpwWOY7BKX0tm9tzmhKXB/foE1YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3D6begZLYkO/j5vRb0Wbx4tYr0lqDgdVVE+Q5lI+kOc=; b=JjQWOgukAQ0uexmyHXa/Ee+yrh
 6g4sMT/h7OONZoyHPCj+OX9xV9JwGh4uLnsDmjZbsV1PAQOgyOV8N/eChKfd6pOXaKnl/ivkaBu7c
 sMHuf73v0NHS/8Gt9+1QNc6Y2pfaIYWz8WX2t/zlpVmuzfrtlcFxfFeCuBLerihunnHI=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WU-00Frqz-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:28 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EA680EEF0DCC6576348C;
 Fri,  9 Aug 2019 18:53:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:56 +0800
Message-ID: <20190809105302.79876-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hw2WU-00Frqz-Mu
Subject: [f2fs-dev] [PATCH 04/10] fsck.f2fs: introduce current_sit_addr()
 for cleanup
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just clean up, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index bed22d5..eed27bf 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1700,13 +1700,12 @@ static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
 	ASSERT(segno <= end_segno);
 }
 
-void get_current_sit_page(struct f2fs_sb_info *sbi,
-			unsigned int segno, struct f2fs_sit_block *sit_blk)
+static inline block_t current_sit_addr(struct f2fs_sb_info *sbi,
+						unsigned int segno)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	unsigned int offset = SIT_BLOCK_OFFSET(sit_i, segno);
 	block_t blk_addr = sit_i->sit_base_addr + offset;
-	int ret;
 
 	check_seg_range(sbi, segno);
 
@@ -1714,24 +1713,23 @@ void get_current_sit_page(struct f2fs_sb_info *sbi,
 	if (f2fs_test_bit(offset, sit_i->sit_bitmap))
 		blk_addr += sit_i->sit_blocks;
 
-	ret = dev_read_block(sit_blk, blk_addr);
-	ASSERT(ret >= 0);
+	return blk_addr;
 }
 
-void rewrite_current_sit_page(struct f2fs_sb_info *sbi,
+void get_current_sit_page(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct f2fs_sit_block *sit_blk)
 {
-	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int offset = SIT_BLOCK_OFFSET(sit_i, segno);
-	block_t blk_addr = sit_i->sit_base_addr + offset;
-	int ret;
+	block_t blk_addr = current_sit_addr(sbi, segno);
 
-	/* calculate sit block address */
-	if (f2fs_test_bit(offset, sit_i->sit_bitmap))
-		blk_addr += sit_i->sit_blocks;
+	ASSERT(dev_read_block(sit_blk, blk_addr) >= 0);
+}
 
-	ret = dev_write_block(sit_blk, blk_addr);
-	ASSERT(ret >= 0);
+void rewrite_current_sit_page(struct f2fs_sb_info *sbi,
+			unsigned int segno, struct f2fs_sit_block *sit_blk)
+{
+	block_t blk_addr = current_sit_addr(sbi, segno);
+
+	ASSERT(dev_write_block(sit_blk, blk_addr) >= 0);
 }
 
 void check_block_count(struct f2fs_sb_info *sbi,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
