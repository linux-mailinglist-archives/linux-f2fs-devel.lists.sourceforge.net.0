Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A00133204BC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Feb 2021 10:36:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDOgR-0005iL-Tx; Sat, 20 Feb 2021 09:36:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lDOgK-0005gg-MM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XFukPtKoX6RtIxgGu3KgLylSTkJoEXf5+cojx8bFr0M=; b=UxToxIyJq8eSX7OdjfJPWrVbDe
 F/uQeIXX8lytI5Xv3B2BhPopwK6IN8R1BtyegNKHCPFYvevcBSJR3XQny9cqUro/Dpnd3hieixnak
 G5J7Lqvi0H3kBubuzl5AG62EfrPJppiiaP2o9JSSDxIKCH9D6rhgxHX6kqlUOCUhwTCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XFukPtKoX6RtIxgGu3KgLylSTkJoEXf5+cojx8bFr0M=; b=R
 8Mkd2g38JnNuchBwJzWOEhijMotHdbh9BcPyQc3uXJ1iMJ+prhfin3uyKyn26GqZEbhMKcQYSozDf
 TFCG4tU1rVIFrWZcgz7+q7FvNPppRgBRXuooU/X4UsY/3z7WH29MXosTlZdGE/CI1B0laI2hmeGYn
 XI5OPpvJRuHLF6zE=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lDOgF-00GNst-4E
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:36:08 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DjNZR2FL5zjPMl;
 Sat, 20 Feb 2021 17:34:39 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 20 Feb 2021 17:35:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 20 Feb 2021 17:35:40 +0800
Message-ID: <20210220093541.63899-1-yuchao0@huawei.com>
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
X-Headers-End: 1lDOgF-00GNst-4E
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to allow migrating fully valid
 segment
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

F2FS_IOC_FLUSH_DEVICE/F2FS_IOC_RESIZE_FS needs to migrate all blocks of
target segment to other place, no matter the segment has partially or fully
valid blocks.

However, after commit 803e74be04b3 ("f2fs: stop GC when the victim becomes
fully valid"), we may skip migration due to target segment is fully valid,
result in failing the ioctl interface, fix this.

Fixes: 803e74be04b3 ("f2fs: stop GC when the victim becomes fully valid")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/file.c    |  9 +++++----
 fs/f2fs/gc.c      | 21 ++++++++++++---------
 fs/f2fs/segment.c |  2 +-
 fs/f2fs/super.c   |  2 +-
 5 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2860003a09ed..ed7807103c8e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3548,7 +3548,7 @@ void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 int f2fs_start_gc_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
 block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
-int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background,
+int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background, bool force,
 			unsigned int segno);
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
 int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8e53f8898688..e1e6b2ad5c54 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1656,7 +1656,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		if (has_not_enough_free_secs(sbi, 0,
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			down_write(&sbi->gc_lock);
-			err = f2fs_gc(sbi, true, false, NULL_SEGNO);
+			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
 			if (err && err != -ENODATA && err != -EAGAIN)
 				goto out_err;
 		}
@@ -2487,7 +2487,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 		down_write(&sbi->gc_lock);
 	}
 
-	ret = f2fs_gc(sbi, sync, true, NULL_SEGNO);
+	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO);
 out:
 	mnt_drop_write_file(filp);
 	return ret;
@@ -2523,7 +2523,8 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 		down_write(&sbi->gc_lock);
 	}
 
-	ret = f2fs_gc(sbi, range->sync, true, GET_SEGNO(sbi, range->start));
+	ret = f2fs_gc(sbi, range->sync, true, false,
+				GET_SEGNO(sbi, range->start));
 	if (ret) {
 		if (ret == -EBUSY)
 			ret = -EAGAIN;
@@ -2976,7 +2977,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 		sm->last_victim[GC_CB] = end_segno + 1;
 		sm->last_victim[GC_GREEDY] = end_segno + 1;
 		sm->last_victim[ALLOC_NEXT] = end_segno + 1;
-		ret = f2fs_gc(sbi, true, true, start_segno);
+		ret = f2fs_gc(sbi, true, true, true, start_segno);
 		if (ret == -EAGAIN)
 			ret = 0;
 		else if (ret < 0)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 39330ad3c44e..b3af76340026 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -112,7 +112,7 @@ static int gc_thread_func(void *data)
 		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
 
 		/* if return value is not zero, no victim was selected */
-		if (f2fs_gc(sbi, sync_mode, true, NULL_SEGNO))
+		if (f2fs_gc(sbi, sync_mode, true, false, NULL_SEGNO))
 			wait_ms = gc_th->no_gc_sleep_time;
 
 		trace_f2fs_background_gc(sbi->sb, wait_ms,
@@ -1354,7 +1354,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
  * the victim data block is ignored.
  */
 static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
-		struct gc_inode_list *gc_list, unsigned int segno, int gc_type)
+		struct gc_inode_list *gc_list, unsigned int segno, int gc_type,
+		bool force_migrate)
 {
 	struct super_block *sb = sbi->sb;
 	struct f2fs_summary *entry;
@@ -1383,8 +1384,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		 * race condition along with SSR block allocation.
 		 */
 		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
-				get_valid_blocks(sbi, segno, true) ==
-							BLKS_PER_SEC(sbi))
+			(!force_migrate && get_valid_blocks(sbi, segno, true) ==
+							BLKS_PER_SEC(sbi)))
 			return submitted;
 
 		if (check_valid_map(sbi, segno, off) == 0)
@@ -1519,7 +1520,8 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
 
 static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				unsigned int start_segno,
-				struct gc_inode_list *gc_list, int gc_type)
+				struct gc_inode_list *gc_list, int gc_type,
+				bool force_migrate)
 {
 	struct page *sum_page;
 	struct f2fs_summary_block *sum;
@@ -1606,7 +1608,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 								gc_type);
 		else
 			submitted += gc_data_segment(sbi, sum->entries, gc_list,
-							segno, gc_type);
+							segno, gc_type,
+							force_migrate);
 
 		stat_inc_seg_count(sbi, type, gc_type);
 		migrated++;
@@ -1634,7 +1637,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 }
 
 int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
-			bool background, unsigned int segno)
+			bool background, bool force, unsigned int segno)
 {
 	int gc_type = sync ? FG_GC : BG_GC;
 	int sec_freed = 0, seg_freed = 0, total_freed = 0;
@@ -1696,7 +1699,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	if (ret)
 		goto stop;
 
-	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type);
+	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
 	if (gc_type == FG_GC &&
 		seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
 		sec_freed++;
@@ -1835,7 +1838,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
-		do_garbage_collect(sbi, segno, &gc_list, FG_GC);
+		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);
 		put_gc_inode(&gc_list);
 
 		if (!gc_only && get_valid_blocks(sbi, segno, true)) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 440634dfaa56..2190910c68b0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -504,7 +504,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	 */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		down_write(&sbi->gc_lock);
-		f2fs_gc(sbi, false, false, NULL_SEGNO);
+		f2fs_gc(sbi, false, false, false, NULL_SEGNO);
 	}
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30d5abef4361..78d9e54bc4f7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1869,7 +1869,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
 		down_write(&sbi->gc_lock);
-		err = f2fs_gc(sbi, true, false, NULL_SEGNO);
+		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
 		if (err == -ENODATA) {
 			err = 0;
 			break;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
