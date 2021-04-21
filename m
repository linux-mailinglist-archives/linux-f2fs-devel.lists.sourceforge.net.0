Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0E366382
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Apr 2021 04:00:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZ2Ac-0006mv-Ic; Wed, 21 Apr 2021 02:00:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lZ2Aa-0006me-Lc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Apr 2021 02:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L3TdNo3y35FYXSh1sb3fStzsV1uxnVImd+6PYNeLuHY=; b=KJGypYa5JTkHFGQF0+oZ3PVUav
 KtN0O4+jyyXT3Euptk0NJtJ73ll7xIU0jHqKRgZE2gjFMtFcTJUEZ7ixP9YDZKr+BYATjWSQm1HVu
 7F6TRsm0+3yzUNxCqjzGftP6cxD/B/OskFBoQ9rRkUAkxRqIemYpw6fmdSM4iKRSkAQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L3TdNo3y35FYXSh1sb3fStzsV1uxnVImd+6PYNeLuHY=; b=G
 jWg1hgZ5brXUYxO2pf8dmm0zZ5PIGUZkdxByrtkBDPvBgLUyl1YbHJu7+zzSgn51NExwryb7gDTcY
 HiC7TPW8h9uBgID2t0qfC1tXGGPbheYEi2LzRzmAMww80Uh5I+chO3l7ESWrlTrkHkqrwbajLahSY
 8yGQPVzj5+WXCs+c=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lZ2AP-0006SM-NB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Apr 2021 02:00:48 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQ3cS2hvbzlYhn;
 Wed, 21 Apr 2021 09:58:32 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 21 Apr 2021 10:00:20 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 21 Apr 2021 09:54:55 +0800
Message-ID: <20210421015455.18165-1-yuchao0@huawei.com>
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
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lZ2AP-0006SM-NB
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid using native
 allocate_segment_by_default()
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

As we did for other cases, in fix_curseg_write_pointer(), let's
use wrapped f2fs_allocate_new_section() instead of native
allocate_segment_by_default(), by this way, it fixes to cover
segment allocation with curseg_lock and sentry_lock.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- call wrapped function f2fs_allocate_new_section()
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/file.c    |  2 +-
 fs/f2fs/segment.c | 18 ++++++++++--------
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 87d734f5589d..20f78281e9f0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3396,7 +3396,7 @@ void f2fs_get_new_segment(struct f2fs_sb_info *sbi,
 			unsigned int *newseg, bool new_sec, int dir);
 void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
-void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type);
+void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d697c8900fa7..af7230fb9c1f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1664,7 +1664,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		down_write(&sbi->pin_sem);
 
 		f2fs_lock_op(sbi);
-		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED);
+		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
 		f2fs_unlock_op(sbi);
 
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6e740ecf0814..efd1e57384b9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2933,7 +2933,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 }
 
 static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
-								bool new_sec)
+						bool new_sec, bool force)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int old_segno;
@@ -2941,7 +2941,7 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 	if (!curseg->inited)
 		goto alloc;
 
-	if (curseg->next_blkoff ||
+	if (force || curseg->next_blkoff ||
 		get_valid_blocks(sbi, curseg->segno, new_sec))
 		goto alloc;
 
@@ -2953,16 +2953,17 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 	locate_dirty_segment(sbi, old_segno);
 }
 
-static void __allocate_new_section(struct f2fs_sb_info *sbi, int type)
+static void __allocate_new_section(struct f2fs_sb_info *sbi,
+						int type, bool force)
 {
-	__allocate_new_segment(sbi, type, true);
+	__allocate_new_segment(sbi, type, true, force);
 }
 
-void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type)
+void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
 {
 	down_read(&SM_I(sbi)->curseg_lock);
 	down_write(&SIT_I(sbi)->sentry_lock);
-	__allocate_new_section(sbi, type);
+	__allocate_new_section(sbi, type, force);
 	up_write(&SIT_I(sbi)->sentry_lock);
 	up_read(&SM_I(sbi)->curseg_lock);
 }
@@ -2974,7 +2975,7 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 	down_read(&SM_I(sbi)->curseg_lock);
 	down_write(&SIT_I(sbi)->sentry_lock);
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
-		__allocate_new_segment(sbi, i, false);
+		__allocate_new_segment(sbi, i, false, false);
 	up_write(&SIT_I(sbi)->sentry_lock);
 	up_read(&SM_I(sbi)->curseg_lock);
 }
@@ -4844,7 +4845,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 
 	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
 		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
-	allocate_segment_by_default(sbi, type, true);
+
+	f2fs_allocate_new_section(sbi, type, true);
 
 	/* check consistency of the zone curseg pointed to */
 	if (check_zone_write_pointer(sbi, zbd, &zone))
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
