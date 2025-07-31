Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC9B16B92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 07:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBeWPl3N4jmxCsgzlaGn8lc6Mj8t4te0kB972T8F7Ao=; b=OJl9eMK8mBdWMHMxTN6Rc7WkGP
	DCxUgqCnV1WVIDgoP9G3gjvixcy5rbhHL4y7oImn+iXg49mfd6Hps6URPyWjaxE3aSyQddL9bhOeu
	GiFieXg2moki3v2sC2A3CeXJ8XXgZ3ZNVooj18xJTp5GRsWZqqXlt/F/1jOu/8xhzSas=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhLvv-0000rf-Al;
	Thu, 31 Jul 2025 05:34:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uhLvt-0000rZ-DS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 05:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NupQuXxHKaFeKYEMMmDkSRUkqg1xAUdk/3zp4DbeIMQ=; b=E+VbxXwe7vfBnZl5Hx0dWlCb3T
 vTUBJiDKHbX/ZvufWfRlcDJW7UnHSJ24TEuCqskZWEXVP0R5B33gybE6NgfLtah1IugyYOo28uH5G
 rE/hSkNI5knvyN5SSK3KqpY3OmUT/+he8eHWOAV4+5tOj0ns1FHO7HfKJvDLS3RQBD7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NupQuXxHKaFeKYEMMmDkSRUkqg1xAUdk/3zp4DbeIMQ=; b=VKWrHqZ+Lg4NsHfSVIcUHL1gfO
 oVvDp+2+aDjW6Kj6MNGrMLjd5jrknb4NWab+Tlsp1VXGl8uFwZGjcaOIRJAWyCOG7y7VvLfU5xQ+P
 FnEyFHuPEKIYYu5lgm+nCRv5HPvui7wqrXTxy7bAdbeljecTzHTqBJdCFgKt+wzEfjps=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhLvs-0007Yg-RD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 05:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8ACB045F34;
 Thu, 31 Jul 2025 05:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B6FC4CEF6;
 Thu, 31 Jul 2025 05:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753940054;
 bh=70nlEbBpf/kwmKcOZVIITRr5X3u+Y97vLaywevfKKTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rV64E5tlXseB7DEcdMXGkg5+3uZ29ChDiKGj3zXkwN7RmVQoyNFN+QWFT50XbuQXl
 /ayM8s+z8xFnZc0sGGRjWJehB+d8Xy1w4KVf63jHVk6uaBcdaX287RM0/J5RvZZgIO
 DNbCyFrtT94QkHKEtPb4oumTW3k/n6Af8yFmC+h8wSmbLSoqqO4h3BupNO5yAOi2Sb
 PwfyWmxUu6KSkFb3xFp0rkTj0CNkC/T0u4v9cp6hF6vWV+Nv0cRvQ+fXVioSDCZVF4
 NV/9Dzai8CdzSrFqf0fq59+tz2NZ3aApDOU3xCvAOp2IEVp7jBI0mWGKK4e5XONahe
 xndcaOPB4YDlw==
To: jaegeuk@kernel.org
Date: Thu, 31 Jul 2025 13:34:05 +0800
Message-ID: <20250731053405.1127197-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
In-Reply-To: <20250731053405.1127197-1-chao@kernel.org>
References: <20250731053405.1127197-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: checkpoint was blocked for 18643 ms Step 0: 0 ms Step 1: 38
 ms Step 2: 63 ms Step 3: 4 ms Step 4: 0 ms Step 5: 0 ms Step 6: 9 ms Step
 7: 0 ms Step 8: 18277 ms Step 9: 249 ms Cc: Jan Prusakowski
 <jprusakowski@google.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/checkpoint.c | 46
 ++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h | 22 ++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uhLvs-0007Yg-RD
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add time stats of checkpoint for debug
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

checkpoint was blocked for 18643 ms
Step 0: 0 ms
Step 1: 38 ms
Step 2: 63 ms
Step 3: 4 ms
Step 4: 0 ms
Step 5: 0 ms
Step 6: 9 ms
Step 7: 0 ms
Step 8: 18277 ms
Step 9: 249 ms

Cc: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h       | 22 +++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 02806e2edce4..bbe07e3a6c75 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1442,6 +1442,34 @@ u64 f2fs_get_sectors_written(struct f2fs_sb_info *sbi)
 	return get_sectors_written(sbi->sb->s_bdev);
 }
 
+static inline void stat_cp_time(struct cp_control *cpc, enum cp_time type)
+{
+	cpc->stats.times[type] = ktime_get();
+}
+
+static inline void check_cp_time(struct f2fs_sb_info *sbi, struct cp_control *cpc)
+{
+	unsigned long long sb_diff, cur_diff;
+	enum cp_time ct;
+
+	sb_diff = (u64)ktime_ms_delta(sbi->cp_stats.times[CP_TIME_END],
+					sbi->cp_stats.times[CP_TIME_START]);
+	cur_diff = (u64)ktime_ms_delta(cpc->stats.times[CP_TIME_END],
+					cpc->stats.times[CP_TIME_START]);
+
+	if (cur_diff > sb_diff) {
+		sbi->cp_stats = cpc->stats;
+		if (cur_diff < CP_LONG_LATENCY_THRESHOLD)
+			return;
+
+		f2fs_warn(sbi, "checkpoint was blocked for %llu ms", cur_diff);
+		for (ct = CP_TIME_START; ct < CP_TIME_MAX - 1; ct++)
+			f2fs_warn(sbi, "Step#%d: %llu ms", ct,
+				(u64)ktime_ms_delta(cpc->stats.times[ct + 1],
+						cpc->stats.times[ct]));
+	}
+}
+
 static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
@@ -1459,6 +1487,8 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	/* Flush all the NAT/SIT pages */
 	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
 
+	stat_cp_time(cpc, CP_TIME_SYNC_META);
+
 	/* start to update checkpoint, cp ver is already updated previously */
 	ckpt->elapsed_time = cpu_to_le64(get_mtime(sbi, true));
 	ckpt->free_segment_count = cpu_to_le32(free_segments(sbi));
@@ -1555,20 +1585,26 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/* Here, we have one bio having CP pack except cp pack 2 page */
 	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
+	stat_cp_time(cpc, CP_TIME_SYNC_CP_META);
+
 	/* Wait for all dirty meta pages to be submitted for IO */
 	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
+	stat_cp_time(cpc, CP_TIME_WAIT_DIRTY_META);
 
 	/* wait for previous submitted meta pages writeback */
 	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
+	stat_cp_time(cpc, CP_TIME_WAIT_CP_DATA);
 
 	/* flush all device cache */
 	err = f2fs_flush_device_cache(sbi);
 	if (err)
 		return err;
+	stat_cp_time(cpc, CP_TIME_FLUSH_DEVICE);
 
 	/* barrier and flush checkpoint cp pack 2 page if it can */
 	commit_checkpoint(sbi, ckpt, start_blk);
 	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
+	stat_cp_time(cpc, CP_TIME_WAIT_LAST_CP);
 
 	/*
 	 * invalidate intermediate page cache borrowed from meta inode which are
@@ -1613,6 +1649,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	unsigned long long ckpt_ver;
 	int err = 0;
 
+	stat_cp_time(cpc, CP_TIME_START);
+
 	if (f2fs_readonly(sbi->sb) || f2fs_hw_is_readonly(sbi))
 		return -EROFS;
 
@@ -1624,6 +1662,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	if (cpc->reason != CP_RESIZE)
 		f2fs_down_write(&sbi->cp_global_sem);
 
+	stat_cp_time(cpc, CP_TIME_LOCK);
+
 	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
 		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
 		((cpc->reason & CP_DISCARD) && !sbi->discard_blks)))
@@ -1639,6 +1679,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	if (err)
 		goto out;
 
+	stat_cp_time(cpc, CP_TIME_OP_LOCK);
+
 	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish block_ops");
 
 	f2fs_flush_merged_writes(sbi);
@@ -1678,6 +1720,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	f2fs_flush_sit_entries(sbi, cpc);
 
+	stat_cp_time(cpc, CP_TIME_FLUSH_META);
+
 	/* save inmem log status */
 	f2fs_save_inmem_curseg(sbi);
 
@@ -1695,6 +1739,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	stat_inc_cp_count(sbi);
 stop:
 	unblock_operations(sbi);
+	stat_cp_time(cpc, CP_TIME_END);
+	check_cp_time(sbi, cpc);
 
 	if (cpc->reason & CP_RECOVERY)
 		f2fs_notice(sbi, "checkpoint: version = %llx", ckpt_ver);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c036af1a885a..691af2a6c159 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -269,11 +269,32 @@ enum {
 #define DEF_DISABLE_QUICK_INTERVAL	1	/* 1 secs */
 #define DEF_UMOUNT_DISCARD_TIMEOUT	5	/* 5 secs */
 
+enum cp_time {
+	CP_TIME_START,		/* begin */
+	CP_TIME_LOCK,		/* after cp_global_sem */
+	CP_TIME_OP_LOCK,	/* after block_operation */
+	CP_TIME_FLUSH_META,	/* after flush sit/nat */
+	CP_TIME_SYNC_META,	/* after sync_meta_pages */
+	CP_TIME_SYNC_CP_META,	/* after sync cp meta pages */
+	CP_TIME_WAIT_DIRTY_META,/* after wait on dirty meta */
+	CP_TIME_WAIT_CP_DATA,	/* after wait on cp data */
+	CP_TIME_FLUSH_DEVICE,	/* after flush device cache */
+	CP_TIME_WAIT_LAST_CP,	/* after wait on last cp pack */
+	CP_TIME_END,		/* after unblock_operation */
+	CP_TIME_MAX,
+};
+
+/* time cost stats of checkpoint */
+struct cp_stats {
+	ktime_t times[CP_TIME_MAX];
+};
+
 struct cp_control {
 	int reason;
 	__u64 trim_start;
 	__u64 trim_end;
 	__u64 trim_minlen;
+	struct cp_stats stats;
 };
 
 /*
@@ -1650,6 +1671,7 @@ struct f2fs_sb_info {
 	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
 	long interval_time[MAX_TIME];		/* to store thresholds */
 	struct ckpt_req_control cprc_info;	/* for checkpoint request control */
+	struct cp_stats cp_stats;		/* for time stat of checkpoint */
 
 	struct inode_management im[MAX_INO_ENTRY];	/* manage inode cache */
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
