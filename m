Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F7275F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 08:15:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTh0m-0002u2-CV; Thu, 23 May 2019 06:15:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunqiuyang@huawei.com>) id 1hTh0l-0002ts-E4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 06:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xid2ym1hPwcT6/6O1rRjMlTjQe11hlZ5p9RVYaYBwLk=; b=DbqYnMyA1N4KF1H1vZju/Wrwjs
 RSUUE2Xm7quo7kaIohblKo8Jfi67XcFxZ0byr+ZB+TRxPFcTB+0X/5aMH5zH66P6n7sWDfLEDHIzr
 IK5IQqBElTAi+04cKXesooxcEMwrITPFvIH1g58bcNTWK0e6B4ADA/aTSJGW+KxW5AO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xid2ym1hPwcT6/6O1rRjMlTjQe11hlZ5p9RVYaYBwLk=; b=O
 DANHGr65GbKEl4xYIoPnX8cbUVzYennpKYaUlYY3vHdDDLEbntdxSlfgnwJZ1ctasJ98J1eUJzEd/
 Md7bGA9vZQHl5bKGypWMQN3f0mfHlQeMWdtyOP18VF3pzbkvgMFItNY61lbBytJ1j1wMr3HNNhvwj
 WdZDmyket+EeGjCc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTh0i-008Ka0-S9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 06:15:31 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C74FF5650B221EEF6976;
 Thu, 23 May 2019 14:15:19 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 May 2019
 14:15:12 +0800
From: sunqiuyang <sunqiuyang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 23 May 2019 14:32:54 +0800
Message-ID: <20190523063254.46160-1-sunqiuyang@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
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
X-Headers-End: 1hTh0i-008Ka0-S9
Subject: [f2fs-dev] [PATCH v5 1/1] f2fs: ioctl for removing a range from F2FS
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
Cc: sunqiuyang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qiuyang Sun <sunqiuyang@huawei.com>

This ioctl shrinks a given length (aligned to sections) from end of the
main area. Any cursegs and valid blocks will be moved out before
invalidating the range.

This feature can be used for adjusting partition sizes online.
--
Changlog v1 ==> v2:

Sahitya Tummala:
 - Add this ioctl for f2fs_compat_ioctl() as well.
 - Fix debugfs status to reflect the online resize changes.
 - Fix potential race between online resize path and allocate new data
   block path or gc path.

Others:
 - Rename some identifiers.
 - Add some error handling branches.
 - Clear sbi->next_victim_seg[BG_GC/FG_GC] in shrinking range.
--
Changelog v2 ==> v3:
Implement this interface as ext4's, and change the parameter from shrunk
bytes to new block count of F2FS.
--
Changelog v3 ==> v4:
 - During resizing, force to empty sit_journal and forbid adding new
   entries to it, in order to avoid invalid segno in journal after resize.
 - Reduce sbi->user_block_count before resize starts.
 - Commit the updated superblock first, and then update in-memory metadata
   only when the former succeeds.
 - Target block count must align to sections.
--
Changelog v4 ==> v5:
Write checkpoint before and after committing the new superblock, w/o 
CP_FSCK_FLAG respectively, so that the FS can be fixed by fsck even if
resize fails after the new superblock is committed.

Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/checkpoint.c |   5 +-
 fs/f2fs/debug.c      |   7 +++
 fs/f2fs/f2fs.h       |   6 +++
 fs/f2fs/file.c       |  28 ++++++++++
 fs/f2fs/gc.c         | 141 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/segment.c    |  43 ++++++++++++----
 fs/f2fs/segment.h    |   1 +
 fs/f2fs/super.c      |   4 ++
 8 files changed, 223 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index ed70b68..4706d0a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1313,8 +1313,11 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	else
 		__clear_ckpt_flags(ckpt, CP_ORPHAN_PRESENT_FLAG);
 
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
+		is_sbi_flag_set(sbi, SBI_IS_RESIZEFS))
 		__set_ckpt_flags(ckpt, CP_FSCK_FLAG);
+	else
+		__clear_ckpt_flags(ckpt, CP_FSCK_FLAG);
 
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		__set_ckpt_flags(ckpt, CP_DISABLED_FLAG);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 99e9a5c..7706049 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -27,8 +27,15 @@
 static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	int i;
 
+	/* these will be changed if online resize is done */
+	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
+	si->main_area_sections = le32_to_cpu(raw_super->section_count);
+	si->main_area_zones = si->main_area_sections /
+				le32_to_cpu(raw_super->secs_per_zone);
+
 	/* validation check of the segment numbers */
 	si->hit_largest = atomic64_read(&sbi->read_hit_largest);
 	si->hit_cached = atomic64_read(&sbi->read_hit_cached);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a205d4d..759d523 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -423,6 +423,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_IOC_SET_PIN_FILE		_IOW(F2FS_IOCTL_MAGIC, 13, __u32)
 #define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
 #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
+#define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
 
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
@@ -1130,6 +1131,7 @@ enum {
 	SBI_QUOTA_NEED_FLUSH,			/* need to flush quota info in CP */
 	SBI_QUOTA_SKIP_FLUSH,			/* skip flushing quota in current CP */
 	SBI_QUOTA_NEED_REPAIR,			/* quota file may be corrupted */
+	SBI_IS_RESIZEFS,			/* resizefs is in process */
 };
 
 enum {
@@ -1309,6 +1311,8 @@ struct f2fs_sb_info {
 	unsigned int segs_per_sec;		/* segments per section */
 	unsigned int secs_per_zone;		/* sections per zone */
 	unsigned int total_sections;		/* total section count */
+	unsigned int current_total_sections;	/* for shrink resize */
+	struct mutex resize_mutex;		/* for resize exclusion */
 	unsigned int total_node_count;		/* total node block count */
 	unsigned int total_valid_node_count;	/* valid node block count */
 	loff_t max_file_blocks;			/* max block index of file */
@@ -3175,6 +3179,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
 void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
+void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
@@ -3318,6 +3323,7 @@ int f2fs_migrate_page(struct address_space *mapping, struct page *newpage,
 int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background,
 			unsigned int segno);
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
+int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
 
 /*
  * recovery.c
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d05ac21..6d00def 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3013,6 +3013,31 @@ static int f2fs_ioc_precache_extents(struct file *filp, unsigned long arg)
 	return f2fs_precache_extents(file_inode(filp));
 }
 
+static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
+	__u64 block_count;
+	int ret;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (f2fs_readonly(sbi->sb))
+		return -EROFS;
+
+	if (get_user(block_count, (__u64 __user *)arg))
+		return -EFAULT;
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	ret = f2fs_resize_fs(sbi, block_count);
+	mnt_drop_write_file(filp);
+
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3069,6 +3094,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_set_pin_file(filp, arg);
 	case F2FS_IOC_PRECACHE_EXTENTS:
 		return f2fs_ioc_precache_extents(filp, arg);
+	case F2FS_IOC_RESIZE_FS:
+		return f2fs_ioc_resize_fs(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -3182,6 +3209,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GET_PIN_FILE:
 	case F2FS_IOC_SET_PIN_FILE:
 	case F2FS_IOC_PRECACHE_EXTENTS:
+	case F2FS_IOC_RESIZE_FS:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 963fb45..cd8910a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -311,10 +311,11 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	struct sit_info *sm = SIT_I(sbi);
 	struct victim_sel_policy p;
 	unsigned int secno, last_victim;
-	unsigned int last_segment = MAIN_SEGS(sbi);
+	unsigned int last_segment;
 	unsigned int nsearched = 0;
 
 	mutex_lock(&dirty_i->seglist_lock);
+	last_segment = CUR_MAIN_SECS(sbi) * sbi->segs_per_sec;
 
 	p.alloc_mode = alloc_mode;
 	select_policy(sbi, gc_type, type, &p);
@@ -404,7 +405,8 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 				sm->last_victim[p.gc_mode] = last_victim + 1;
 			else
 				sm->last_victim[p.gc_mode] = segno + 1;
-			sm->last_victim[p.gc_mode] %= MAIN_SEGS(sbi);
+			sm->last_victim[p.gc_mode] %=
+				(CUR_MAIN_SECS(sbi) * sbi->segs_per_sec);
 			break;
 		}
 	}
@@ -1360,3 +1362,138 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
 		SIT_I(sbi)->last_victim[ALLOC_NEXT] =
 				GET_SEGNO(sbi, FDEV(0).end_blk) + 1;
 }
+
+static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
+							unsigned int end)
+{
+	int type;
+	unsigned int segno, next_inuse;
+	struct gc_inode_list gc_list = {
+		.ilist = LIST_HEAD_INIT(gc_list.ilist),
+		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
+	};
+	int err = 0;
+
+	/* Move out cursegs from the target range */
+	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++) {
+		segno = CURSEG_I(sbi, type)->segno;
+		if (segno >= start && segno <= end)
+			allocate_segment_for_resize(sbi, type);
+	}
+
+	/* do GC to move out valid blocks in the range */
+	mutex_lock(&sbi->gc_mutex);
+	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
+		do_garbage_collect(sbi, segno, &gc_list, FG_GC);
+		if (get_valid_blocks(sbi, segno, true)) {
+			err = -EAGAIN;
+			break;
+		}
+	}
+
+	mutex_unlock(&sbi->gc_mutex);
+	put_gc_inode(&gc_list);
+
+	if (err)
+		return err;
+
+	err = f2fs_sync_fs(sbi->sb, 1);
+	if (err)
+		return err;
+
+	next_inuse = find_next_inuse(FREE_I(sbi), end + 1, start);
+	if (next_inuse <= end) {
+		f2fs_msg(sbi->sb, KERN_ERR,
+			"segno %u should be free but still inuse!", next_inuse);
+		f2fs_bug_on(sbi, 1);
+	}
+	return err;
+}
+
+int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
+{
+	__u64 old_block_count, shrunk_blocks;
+	unsigned int secs;
+	int gc_mode, gc_type;
+	int err = 0;
+
+	old_block_count = le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);
+	if (block_count > old_block_count)
+		return -EINVAL;
+
+	/* new fs size should align to section size */
+	if (block_count % BLKS_PER_SEC(sbi))
+		return -EINVAL;
+
+	if (block_count == old_block_count)
+		return 0;
+
+	shrunk_blocks = old_block_count - block_count;
+	secs = shrunk_blocks / BLKS_PER_SEC(sbi);
+	spin_lock(&sbi->stat_lock);
+	if (shrunk_blocks + valid_user_blocks(sbi) +
+		sbi->current_reserved_blocks + sbi->unusable_block_count +
+		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
+		err = -ENOSPC;
+	else
+		sbi->user_block_count -= shrunk_blocks;
+	spin_unlock(&sbi->stat_lock);
+	if (err)
+		return err;
+
+	mutex_lock(&sbi->resize_mutex);
+	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
+	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
+	CUR_MAIN_SECS(sbi) = MAIN_SECS(sbi) - secs;
+	for (gc_mode = 0; gc_mode < MAX_GC_POLICY; gc_mode++)
+		if (SIT_I(sbi)->last_victim[gc_mode] >=
+					CUR_MAIN_SECS(sbi) * sbi->segs_per_sec)
+			SIT_I(sbi)->last_victim[gc_mode] = 0;
+	for (gc_type = BG_GC; gc_type <= FG_GC; gc_type++)
+		if (sbi->next_victim_seg[gc_type] >=
+					CUR_MAIN_SECS(sbi) * sbi->segs_per_sec)
+			sbi->next_victim_seg[gc_type] = NULL_SEGNO;
+	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
+
+	err = free_segment_range(sbi, CUR_MAIN_SECS(sbi) * sbi->segs_per_sec,
+			MAIN_SEGS(sbi) - 1);
+	if (err)
+		goto out;
+
+	/* Update superblock */
+	F2FS_RAW_SUPER(sbi)->section_count = cpu_to_le32(CUR_MAIN_SECS(sbi));
+	F2FS_RAW_SUPER(sbi)->segment_count = cpu_to_le32(le32_to_cpu(
+		F2FS_RAW_SUPER(sbi)->segment_count) - secs * sbi->segs_per_sec);
+	F2FS_RAW_SUPER(sbi)->segment_count_main = cpu_to_le32(
+					CUR_MAIN_SECS(sbi) * sbi->segs_per_sec);
+	F2FS_RAW_SUPER(sbi)->block_count = cpu_to_le64(block_count);
+
+	err = f2fs_commit_super(sbi, false);
+	if (err)
+		goto out;
+
+	/* Update FS metadata */
+	SM_I(sbi)->segment_count -= secs * sbi->segs_per_sec;
+	MAIN_SECS(sbi) = CUR_MAIN_SECS(sbi);
+	MAIN_SEGS(sbi) = MAIN_SECS(sbi) * sbi->segs_per_sec;
+	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(sbi->user_block_count);
+	FREE_I(sbi)->free_sections -= secs;
+	FREE_I(sbi)->free_segments -= secs * sbi->segs_per_sec;
+
+	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
+	err = f2fs_sync_fs(sbi->sb, 1);
+out:
+	if (err) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_msg(sbi->sb, KERN_ERR,
+				"resize_fs failed, should run fsck to repair!");
+
+		CUR_MAIN_SECS(sbi) = MAIN_SECS(sbi);
+		spin_lock(&sbi->stat_lock);
+		sbi->user_block_count += shrunk_blocks;
+		spin_unlock(&sbi->stat_lock);
+	}
+	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
+	mutex_unlock(&sbi->resize_mutex);
+	return err;
+}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 07e9235..aa078ff 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2360,7 +2360,7 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 {
 	struct free_segmap_info *free_i = FREE_I(sbi);
 	unsigned int segno, secno, zoneno;
-	unsigned int total_zones = MAIN_SECS(sbi) / sbi->secs_per_zone;
+	unsigned int total_zones = CUR_MAIN_SECS(sbi) / sbi->secs_per_zone;
 	unsigned int hint = GET_SEC_FROM_SEG(sbi, *newseg);
 	unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
 	unsigned int left_start = hint;
@@ -2377,12 +2377,13 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 			goto got_it;
 	}
 find_other_zone:
-	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
-	if (secno >= MAIN_SECS(sbi)) {
+	secno = find_next_zero_bit(free_i->free_secmap, CUR_MAIN_SECS(sbi),
+									hint);
+	if (secno >= CUR_MAIN_SECS(sbi)) {
 		if (dir == ALLOC_RIGHT) {
 			secno = find_next_zero_bit(free_i->free_secmap,
-							MAIN_SECS(sbi), 0);
-			f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
+							CUR_MAIN_SECS(sbi), 0);
+			f2fs_bug_on(sbi, secno >= CUR_MAIN_SECS(sbi));
 		} else {
 			go_left = 1;
 			left_start = hint - 1;
@@ -2397,8 +2398,8 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 			continue;
 		}
 		left_start = find_next_zero_bit(free_i->free_secmap,
-							MAIN_SECS(sbi), 0);
-		f2fs_bug_on(sbi, left_start >= MAIN_SECS(sbi));
+							CUR_MAIN_SECS(sbi), 0);
+		f2fs_bug_on(sbi, left_start >= CUR_MAIN_SECS(sbi));
 		break;
 	}
 	secno = left_start;
@@ -2651,6 +2652,29 @@ static void allocate_segment_by_default(struct f2fs_sb_info *sbi,
 	stat_inc_seg_type(sbi, curseg);
 }
 
+void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	unsigned int old_segno = curseg->segno;
+
+	down_read(&SM_I(sbi)->curseg_lock);
+	mutex_lock(&curseg->curseg_mutex);
+	if (f2fs_need_SSR(sbi) && get_ssr_segment(sbi, type))
+		change_curseg(sbi, type);
+	else
+		new_curseg(sbi, type, true);
+
+	stat_inc_seg_type(sbi, curseg);
+	mutex_unlock(&curseg->curseg_mutex);
+	up_read(&SM_I(sbi)->curseg_lock);
+
+	if (get_valid_blocks(sbi, old_segno, false) == 0)
+		__set_test_and_free(sbi, old_segno);
+	f2fs_msg(sbi->sb, KERN_NOTICE,
+		"For resize: curseg of type %d: %u ==> %u",
+		type, old_segno, curseg->segno);
+}
+
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg;
@@ -3774,7 +3798,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	struct f2fs_journal *journal = curseg->journal;
 	struct sit_entry_set *ses, *tmp;
 	struct list_head *head = &SM_I(sbi)->sit_entry_set;
-	bool to_journal = true;
+	bool to_journal = !is_sbi_flag_set(sbi, SBI_IS_RESIZEFS);
 	struct seg_entry *se;
 
 	down_write(&sit_i->sentry_lock);
@@ -3793,7 +3817,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * entries, remove all entries from journal and add and account
 	 * them in sit entry set.
 	 */
-	if (!__has_cursum_space(journal, sit_i->dirty_sentries, SIT_JOURNAL))
+	if (!__has_cursum_space(journal, sit_i->dirty_sentries, SIT_JOURNAL) ||
+								!to_journal)
 		remove_sits_in_journal(sbi);
 
 	/*
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 429007b..eaa9782 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -59,6 +59,7 @@
 
 #define MAIN_SEGS(sbi)	(SM_I(sbi)->main_segments)
 #define MAIN_SECS(sbi)	((sbi)->total_sections)
+#define CUR_MAIN_SECS(sbi)	((sbi)->current_total_sections)
 
 #define TOTAL_SEGS(sbi)							\
 	(SM_I(sbi) ? SM_I(sbi)->segment_count : 				\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f581f0..166a97e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2843,6 +2843,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
 	sbi->secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	sbi->total_sections = le32_to_cpu(raw_super->section_count);
+	sbi->current_total_sections = sbi->total_sections;
 	sbi->total_node_count =
 		(le32_to_cpu(raw_super->segment_count_nat) / 2)
 			* sbi->blocks_per_seg * NAT_ENTRY_PER_BLOCK;
@@ -3296,6 +3297,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	mutex_init(&sbi->gc_mutex);
 	mutex_init(&sbi->writepages);
 	mutex_init(&sbi->cp_mutex);
+	mutex_init(&sbi->resize_mutex);
 	init_rwsem(&sbi->node_write);
 	init_rwsem(&sbi->node_change);
 
@@ -3367,6 +3369,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		set_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
 		sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_QUICK_INTERVAL;
 	}
+	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_FSCK_FLAG))
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
 
 	/* Initialize device list */
 	err = f2fs_scan_devices(sbi);
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
