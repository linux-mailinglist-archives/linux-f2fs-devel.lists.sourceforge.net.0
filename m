Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BB32E583
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Mar 2021 11:00:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lI7Fu-0000GT-PO; Fri, 05 Mar 2021 10:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lI7CM-0008T0-4M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 09:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m9+Emy4FUJ25L9S9vd3Vsfq9wUSYFR4RLRxMK8pRmD4=; b=CuFi/bsWRq6896W+0h19LnnN3G
 lPLYRcDUIfxWAO8wbMIYn8tOZceccLLK+xTm4b9kaa5V6w2VCRfgjLL4lxBntI3vPa9Wn/ZBfK1Jm
 Bs6f+u/J9cSfQpFIktBob/Iqp0JsQLnaxPMDwfZLBx8onO902hEDHFU/MrUhzw9Vs1fw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m9+Emy4FUJ25L9S9vd3Vsfq9wUSYFR4RLRxMK8pRmD4=; b=V
 y2rYXsGw0cpHyqXL8pvcVa5oIBtirVEESfhDl1UqNLOfsIak2j/n9xekvk3ZSp21axPzR+vWKH0CZ
 psV+Z/byoszTL8Dp0z7HdhjhtMC9qBH+bZsNLT9a++jUFuPOGso0LvLfty/d60rUI+2DW+5NEEgP9
 2JLKhrX2+iSMbUG8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lI7CE-00ErYG-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 09:56:42 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DsNPT1VkYz16G97;
 Fri,  5 Mar 2021 17:54:37 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Mar 2021 17:56:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 5 Mar 2021 17:56:01 +0800
Message-ID: <20210305095601.96591-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lI7CE-00ErYG-Fx
Subject: [f2fs-dev] [PATCH] f2fs: fix to align to section for fallocate() on
 pinned file
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

Now, fallocate() on a pinned file only allocates blocks which aligns
to segment rather than section, so GC may try to migrate pinned file's
block, and after several times of failure, pinned file's block could
be migrated to other place, however user won't be aware of such
condition, and then old obsolete block address may be readed/written
incorrectly.

To avoid such condition, let's try to allocate pinned file's blocks
with section alignment.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/file.c    |  2 +-
 fs/f2fs/segment.c | 34 ++++++++++++++++++++++++++--------
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 700ef46e4147..ff6c212bf2c5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3399,7 +3399,7 @@ void f2fs_get_new_segment(struct f2fs_sb_info *sbi,
 			unsigned int *newseg, bool new_sec, int dir);
 void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
-void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type);
+void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1863944f4073..1b70b56434e4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1666,7 +1666,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		down_write(&sbi->pin_sem);
 
 		f2fs_lock_op(sbi);
-		f2fs_allocate_new_segment(sbi, CURSEG_COLD_DATA_PINNED);
+		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED);
 		f2fs_unlock_op(sbi);
 
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b26217910b85..ff50e79d2bb7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2918,7 +2918,8 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 	up_read(&SM_I(sbi)->curseg_lock);
 }
 
-static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
+static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
+								bool new_sec)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int old_segno;
@@ -2926,10 +2927,22 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
 	if (!curseg->inited)
 		goto alloc;
 
-	if (!curseg->next_blkoff &&
-		!get_valid_blocks(sbi, curseg->segno, false) &&
-		!get_ckpt_valid_blocks(sbi, curseg->segno))
-		return;
+	if (curseg->next_blkoff ||
+		get_valid_blocks(sbi, curseg->segno, new_sec))
+		goto alloc;
+
+	if (new_sec) {
+		unsigned int segno = START_SEGNO(curseg->segno);
+		int i;
+
+		for (i = 0; i < sbi->segs_per_sec; i++, segno++) {
+			if (get_ckpt_valid_blocks(sbi, segno))
+				goto alloc;
+		}
+	} else {
+		if (!get_ckpt_valid_blocks(sbi, curseg->segno))
+			return;
+	}
 
 alloc:
 	old_segno = curseg->segno;
@@ -2937,10 +2950,15 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
 	locate_dirty_segment(sbi, old_segno);
 }
 
-void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type)
+static void __allocate_new_section(struct f2fs_sb_info *sbi, int type)
+{
+	__allocate_new_segment(sbi, type, true);
+}
+
+void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type)
 {
 	down_write(&SIT_I(sbi)->sentry_lock);
-	__allocate_new_segment(sbi, type);
+	__allocate_new_section(sbi, type);
 	up_write(&SIT_I(sbi)->sentry_lock);
 }
 
@@ -2950,7 +2968,7 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 
 	down_write(&SIT_I(sbi)->sentry_lock);
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
-		__allocate_new_segment(sbi, i);
+		__allocate_new_segment(sbi, i, false);
 	up_write(&SIT_I(sbi)->sentry_lock);
 }
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
