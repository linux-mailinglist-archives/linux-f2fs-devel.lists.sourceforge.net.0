Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 092072C36F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Nov 2020 04:00:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khl2D-0000gh-Ks; Wed, 25 Nov 2020 02:59:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1khl1D-0000Z9-2n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 02:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kz5/n0CueZSVi6hSz9uokUTI3SKa0oXeNU/MRa6FOaY=; b=FiJMdx34HuEIC0q/5pB5Xr7UMa
 QwgyJ3LnTblsPL3mbOvhS3ATkVilVh9ozb/+28MI5X7i2HOU31el2L0NFeKSE0FemaUjGTLuP6sk9
 YBIJQTUfIi7vTc2vjld4cr40/XgCFgdO9DEXfqgoiQv99oybPB/XDG4M//tsS5EYRo9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kz5/n0CueZSVi6hSz9uokUTI3SKa0oXeNU/MRa6FOaY=; b=G
 Dn9E5tC0o2usk4GIJhM/P9oUS5eQ4quAvXelDxOdv63iVKqeQdO2EgwVJDUMJWwQ1MTvOhtiaRK0U
 nyIxy4h9T4hq2CcQRvZJa5JKI43lRXeFMCjEEBxL227gIhFnEo2R+tnQhO3tC91vKRkB7KDRGirGu
 nuhGF0T1u0Mn0Yt4=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khl16-00E9di-EH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 02:58:55 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cglv34JSVz15RqZ;
 Wed, 25 Nov 2020 10:58:07 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 10:58:19 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 25 Nov 2020 10:57:36 +0800
Message-ID: <20201125025736.58540-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1khl16-00E9di-EH
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid REQ_TIME and CP_TIME collision
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
Cc: Lei Li <noctis.akm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Lei Li reported a issue: if foreground operations are frequent, background
checkpoint may be always skipped due to below check, result in losing more
data after sudden power-cut.

f2fs_balance_fs_bg()
...
	if (!is_idle(sbi, REQ_TIME) &&
		(!excess_dirty_nats(sbi) && !excess_dirty_nodes(sbi)))
		return;

E.g:
cp_interval = 5 second
idle_interval = 2 second
foreground operation interval = 1 second (append 1 byte per second into file)

In such case, no matter when it calls f2fs_balance_fs_bg(), is_idle(, REQ_TIME)
returns false, result in skipping background checkpoint.

This patch changes as below to make trigger condition being more reasonable:
- trigger sync_fs() if dirty_{nats,nodes} and prefree segs exceeds threshold;
- skip triggering sync_fs() if there is any background inflight IO or there is
foreground operation recently and meanwhile cp_rwsem is being held by someone;

Reported-by: Lei Li <noctis.akm@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h    | 19 +++++++++++++------
 fs/f2fs/segment.c | 47 +++++++++++++++++++++++++++--------------------
 2 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4f2766f3d2c1..b5054ffe3e1c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2416,24 +2416,31 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 	return entry;
 }
 
-static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
+static inline bool is_inflight_io(struct f2fs_sb_info *sbi, int type)
 {
-	if (sbi->gc_mode == GC_URGENT_HIGH)
-		return true;
-
 	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
 		get_pages(sbi, F2FS_RD_META) || get_pages(sbi, F2FS_WB_DATA) ||
 		get_pages(sbi, F2FS_WB_CP_DATA) ||
 		get_pages(sbi, F2FS_DIO_READ) ||
 		get_pages(sbi, F2FS_DIO_WRITE))
-		return false;
+		return true;
 
 	if (type != DISCARD_TIME && SM_I(sbi) && SM_I(sbi)->dcc_info &&
 			atomic_read(&SM_I(sbi)->dcc_info->queued_discard))
-		return false;
+		return true;
 
 	if (SM_I(sbi) && SM_I(sbi)->fcc_info &&
 			atomic_read(&SM_I(sbi)->fcc_info->queued_flush))
+		return true;
+	return false;
+}
+
+static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
+{
+	if (sbi->gc_mode == GC_URGENT_HIGH)
+		return true;
+
+	if (is_inflight_io(sbi, type))
 		return false;
 
 	if (sbi->gc_mode == GC_URGENT_LOW &&
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 39d6dce09fb7..bd066cff0bf9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -529,31 +529,38 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 	else
 		f2fs_build_free_nids(sbi, false, false);
 
-	if (!is_idle(sbi, REQ_TIME) &&
-		(!excess_dirty_nats(sbi) && !excess_dirty_nodes(sbi)))
+	if (excess_dirty_nats(sbi) || excess_dirty_nodes(sbi) ||
+		excess_prefree_segs(sbi))
+		goto do_sync;
+
+	/* there is background inflight IO or foreground operation recently */
+	if (is_inflight_io(sbi, REQ_TIME) ||
+		(!f2fs_time_over(sbi, REQ_TIME) && rwsem_is_locked(&sbi->cp_rwsem)))
 		return;
 
+	/* exceed periodical checkpoint timeout threshold */
+	if (f2fs_time_over(sbi, CP_TIME))
+		goto do_sync;
+
 	/* checkpoint is the only way to shrink partial cached entries */
-	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES) ||
-			!f2fs_available_free_memory(sbi, INO_ENTRIES) ||
-			excess_prefree_segs(sbi) ||
-			excess_dirty_nats(sbi) ||
-			excess_dirty_nodes(sbi) ||
-			f2fs_time_over(sbi, CP_TIME)) {
-		if (test_opt(sbi, DATA_FLUSH) && from_bg) {
-			struct blk_plug plug;
-
-			mutex_lock(&sbi->flush_lock);
-
-			blk_start_plug(&plug);
-			f2fs_sync_dirty_inodes(sbi, FILE_INODE);
-			blk_finish_plug(&plug);
+	if (f2fs_available_free_memory(sbi, NAT_ENTRIES) ||
+		f2fs_available_free_memory(sbi, INO_ENTRIES))
+		return;
 
-			mutex_unlock(&sbi->flush_lock);
-		}
-		f2fs_sync_fs(sbi->sb, true);
-		stat_inc_bg_cp_count(sbi->stat_info);
+do_sync:
+	if (test_opt(sbi, DATA_FLUSH) && from_bg) {
+		struct blk_plug plug;
+
+		mutex_lock(&sbi->flush_lock);
+
+		blk_start_plug(&plug);
+		f2fs_sync_dirty_inodes(sbi, FILE_INODE);
+		blk_finish_plug(&plug);
+
+		mutex_unlock(&sbi->flush_lock);
 	}
+	f2fs_sync_fs(sbi->sb, true);
+	stat_inc_bg_cp_count(sbi->stat_info);
 }
 
 static int __submit_flush_wait(struct f2fs_sb_info *sbi,
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
