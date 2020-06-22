Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776B203397
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2020 11:39:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnIv6-0004oG-WF; Mon, 22 Jun 2020 09:39:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jnIv5-0004nj-GK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jun 2020 09:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0EyXREC0HQddzN+AV75+uEpiQPXOm4HqxbZUhTKLJQ=; b=VSoopkLF1HwVOjTlSQxAhlFU/L
 mCsjg8R+LfvmJRsdOygS3gkRyR5pNwIZ4wuJjx2t+rAqK1+mFJCGoWeJzZmzxva7ZJtSzSFXXUm64
 HBz+M5u9FSgVxY/oPQPwlPut8dHN0tDf0HNsZo+NMU0Mglx3xdb3AfofQM9WWUng8oew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T0EyXREC0HQddzN+AV75+uEpiQPXOm4HqxbZUhTKLJQ=; b=n
 A6gdGgn5WxqAEIxiHPHlFGNeoXhtMuD3KlC6b3CCDGaHtfQsDpA32P3r54R8ffIxtgUbyv6S5oO+I
 K7MVVLO+x0ZMerGs0+CVh8dXuMofpomeuEuJchCb3djS0jHCy7uXo+ZoNB+rlf27sgPhzHIss7NUK
 ZjTjjJwGcBASeQ6Q=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnIv1-00Dh4Q-SV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jun 2020 09:39:15 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4495D8EE0C1133803FFC;
 Mon, 22 Jun 2020 17:38:57 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 22 Jun 2020 17:38:51 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 22 Jun 2020 17:38:48 +0800
Message-ID: <20200622093849.35684-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
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
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnIv1-00Dh4Q-SV
Subject: [f2fs-dev] [PATCH 1/2] f2fs: split f2fs_allocate_new_segments()
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

to two independent functions:
- f2fs_allocate_new_segment() for specified type segment allocation
- f2fs_allocate_new_segments() for all data type segments allocation

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h     |  3 ++-
 fs/f2fs/file.c     |  2 +-
 fs/f2fs/recovery.c |  2 +-
 fs/f2fs/segment.c  | 39 +++++++++++++++++++++++----------------
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 70565d81320b..07290943e91d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3327,7 +3327,8 @@ void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
 void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
-void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type);
+void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type);
+void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f196187159e9..67c65e40b22b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1659,7 +1659,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
 
 		f2fs_lock_op(sbi);
-		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
+		f2fs_allocate_new_segment(sbi, CURSEG_COLD_DATA_PINNED);
 		f2fs_unlock_op(sbi);
 
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index ae5310f02e7f..af974ba273b3 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -742,7 +742,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		f2fs_put_page(page, 1);
 	}
 	if (!err)
-		f2fs_allocate_new_segments(sbi, NO_CHECK_TYPE);
+		f2fs_allocate_new_segments(sbi);
 	return err;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 113114f98087..f15711e8ee5b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2707,28 +2707,35 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 	up_read(&SM_I(sbi)->curseg_lock);
 }
 
-void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type)
+void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
 {
-	struct curseg_info *curseg;
+	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int old_segno;
-	int i;
 
-	down_write(&SIT_I(sbi)->sentry_lock);
+	if (!curseg->next_blkoff &&
+		!get_valid_blocks(sbi, curseg->segno, false) &&
+		!get_ckpt_valid_blocks(sbi, curseg->segno))
+		return;
 
-	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
-		if (type != NO_CHECK_TYPE && i != type)
-			continue;
+	old_segno = curseg->segno;
+	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
+	locate_dirty_segment(sbi, old_segno);
+}
 
-		curseg = CURSEG_I(sbi, i);
-		if (type == NO_CHECK_TYPE || curseg->next_blkoff ||
-				get_valid_blocks(sbi, curseg->segno, false) ||
-				get_ckpt_valid_blocks(sbi, curseg->segno)) {
-			old_segno = curseg->segno;
-			SIT_I(sbi)->s_ops->allocate_segment(sbi, i, true);
-			locate_dirty_segment(sbi, old_segno);
-		}
-	}
+void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type)
+{
+	down_write(&SIT_I(sbi)->sentry_lock);
+	__allocate_new_segment(sbi, type);
+	up_write(&SIT_I(sbi)->sentry_lock);
+}
 
+void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
+{
+	int i;
+
+	down_write(&SIT_I(sbi)->sentry_lock);
+	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
+		__allocate_new_segment(sbi, i);
 	up_write(&SIT_I(sbi)->sentry_lock);
 }
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
