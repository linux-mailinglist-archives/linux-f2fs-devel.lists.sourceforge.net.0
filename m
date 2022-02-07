Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE54AC902
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Feb 2022 20:01:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nH9Gk-0006Eb-JU; Mon, 07 Feb 2022 19:01:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nH9Gj-0006EV-Fg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 19:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0QDlBNq6JQ+ApOXihvv8W/xDrzq8cfY0i3lwoMCkKU=; b=ZEtJnuJDaxoULuGojEYv5Umn4c
 yTqRZIqBb6VcUUr9taZahImaD95KGrqRxufKNEQW+aCfqK60ePs4B56jPEYmvYphLAfbIPZauKxQA
 LvhlZCoeU6hXoAyiOLyxrMaiinDm2bQo/hY5UUW2e3aBRrdV3rhavgr7vKZcvObt9K7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A0QDlBNq6JQ+ApOXihvv8W/xDrzq8cfY0i3lwoMCkKU=; b=VqgvMTSesZxDsilPaEqcFP4jF8
 0bcCzVSaSjbLTMjY4WbbVYRG1wrNpsLMxWgyD4HxAuMbM20RvNNmAzq0s3VzKk1pO5KHegrw/f1mk
 5UqnqMe9NPlIVNDfcLsAowINDlsxFA7Joos0BWjR9ZrGy1jjdbCljzWwMMuU9vxkp10E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nH9Gf-0003W0-Mj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 19:01:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AB4AB8164B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Feb 2022 19:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C53C004E1;
 Mon,  7 Feb 2022 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644260493;
 bh=1z4+8gpqxj72CPk/HjiSfJW7EPGIvmZN1bDrBSpbKN0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=NQHYuftBOc5t8Oo06uZvStrpkRmBAyJpWSeVPylj/To+PITo/vir27kNPSO5jTeqO
 smwDF8X8HzWU/foESicd/Ka+33hJqPlTMHlQv/NlOs16hPLPuNRO8fpS+aXS1gDoH8
 yZDJCWBcWie7gj3Pfa1lrsavwMCQAWRU5MmpdyzCulJ+0o1C2bdjlmYikxUVA5G36y
 d1nrC/VHjo5GcNpZhXZtAv1zD5JPVQw8wHHpYi/bh3qp/GYxTuUUjtDncw50R1eK12
 5YWr/9NYcbHLFDP4we46NI9yRL0xQAUuHv7EP2wRLltfRKNQw3efGuxnsAoo/TCuCT
 MG55Xn2H4Fd+w==
Date: Mon, 7 Feb 2022 11:01:31 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YgFsi7cvYOs6oB3e@google.com>
References: <20220127214102.2040254-1-jaegeuk@kernel.org>
 <YfsjEb2ii3eyPzng@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfsjEb2ii3eyPzng@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This adds a sysfs entry to call checkpoint during fsync()
 in order to avoid long elapsed time to run roll-forward recovery when booting
 the device. Default value doesn't enforce the limitation which i [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nH9Gf-0003W0-Mj
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add a way to limit roll forward
 recovery time
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

This adds a sysfs entry to call checkpoint during fsync() in order to avoid
long elapsed time to run roll-forward recovery when booting the device.
Default value doesn't enforce the limitation which is same as before.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 v3 from v2:
  - add missing percpu init
  - percpu_sum only when it's used

 v2 from v1:
  - make the default w/o enforcement

 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/checkpoint.c                    |  1 +
 fs/f2fs/debug.c                         |  3 +++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/node.c                          |  2 ++
 fs/f2fs/node.h                          |  3 +++
 fs/f2fs/recovery.c                      |  4 ++++
 fs/f2fs/super.c                         | 14 ++++++++++++--
 fs/f2fs/sysfs.c                         |  2 ++
 9 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 87d3884c90ea..ce8103f522cb 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -567,3 +567,9 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	You can set the trial count limit for GC urgent high mode with this value.
 		If GC thread gets to the limit, the mode will turn back to GC normal mode.
 		By default, the value is zero, which means there is no limit like before.
+
+What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
+Date:		January 2022
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Controls max # of node block writes to be used for roll forward
+		recovery. This can limit the roll forward recovery time.
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a13b6b4af220..203a1577942d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1547,6 +1547,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	/* update user_block_counts */
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	percpu_counter_set(&sbi->alloc_valid_block_count, 0);
+	percpu_counter_set(&sbi->rf_node_block_count, 0);
 
 	/* Here, we have one bio having CP pack except cp pack 2 page */
 	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8c50518475a9..9a13902c7702 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -532,6 +532,9 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->ndirty_meta, si->meta_pages);
 		seq_printf(s, "  - imeta: %4d\n",
 			   si->ndirty_imeta);
+		seq_printf(s, "  - fsync mark: %4lld\n",
+			   percpu_counter_sum_positive(
+					&si->sbi->rf_node_block_count));
 		seq_printf(s, "  - NATs: %9d/%9d\n  - SITs: %9d/%9d\n",
 			   si->dirty_nats, si->nats, si->dirty_sits, si->sits);
 		seq_printf(s, "  - free_nids: %9d/%9d\n  - alloc_nids: %9d\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 51c1392708e6..d220ab613cf1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -916,6 +916,7 @@ struct f2fs_nm_info {
 	nid_t max_nid;			/* maximum possible node ids */
 	nid_t available_nids;		/* # of available node ids */
 	nid_t next_scan_nid;		/* the next nid to be scanned */
+	nid_t max_rf_node_blocks;	/* max # of nodes for recovery */
 	unsigned int ram_thresh;	/* control the memory footprint */
 	unsigned int ra_nid_pages;	/* # of nid pages to be readaheaded */
 	unsigned int dirty_nats_ratio;	/* control dirty nats ratio threshold */
@@ -1687,6 +1688,8 @@ struct f2fs_sb_info {
 	atomic_t nr_pages[NR_COUNT_TYPE];
 	/* # of allocated blocks */
 	struct percpu_counter alloc_valid_block_count;
+	/* # of node block writes as roll forward recovery */
+	struct percpu_counter rf_node_block_count;
 
 	/* writeback control */
 	atomic_t wb_sync_req[META];	/* count # of WB_SYNC threads */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 93512f8859d5..0d9883457579 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1782,6 +1782,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 
 			if (!atomic || page == last_page) {
 				set_fsync_mark(page, 1);
+				percpu_counter_inc(&sbi->rf_node_block_count);
 				if (IS_INODE(page)) {
 					if (is_inode_flag_set(inode,
 								FI_DIRTY_INODE))
@@ -3218,6 +3219,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 	nm_i->ram_thresh = DEF_RAM_THRESHOLD;
 	nm_i->ra_nid_pages = DEF_RA_NID_PAGES;
 	nm_i->dirty_nats_ratio = DEF_DIRTY_NAT_RATIO_THRESHOLD;
+	nm_i->max_rf_node_blocks = DEF_RF_NODE_BLOCKS;
 
 	INIT_RADIX_TREE(&nm_i->free_nid_root, GFP_ATOMIC);
 	INIT_LIST_HEAD(&nm_i->free_nid_list);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 18b98cf0465b..4c1d34bfea78 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -31,6 +31,9 @@
 /* control total # of nats */
 #define DEF_NAT_CACHE_THRESHOLD			100000
 
+/* control total # of node writes used for roll-fowrad recovery */
+#define DEF_RF_NODE_BLOCKS			0
+
 /* vector size for gang look-up from nat cache that consists of radix tree */
 #define NATVEC_SIZE	64
 #define SETVEC_SIZE	32
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 2af503f75b4f..ab33e474af07 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -56,6 +56,10 @@ bool f2fs_space_for_roll_forward(struct f2fs_sb_info *sbi)
 
 	if (sbi->last_valid_block_count + nalloc > sbi->user_block_count)
 		return false;
+	if (NM_I(sbi)->max_rf_node_blocks &&
+		percpu_counter_sum_positive(&sbi->rf_node_block_count) >=
+						NM_I(sbi)->max_rf_node_blocks)
+		return false;
 	return true;
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9af6c20532ec..f9d627dbed58 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1501,8 +1501,9 @@ static void f2fs_free_inode(struct inode *inode)
 
 static void destroy_percpu_info(struct f2fs_sb_info *sbi)
 {
-	percpu_counter_destroy(&sbi->alloc_valid_block_count);
 	percpu_counter_destroy(&sbi->total_valid_inode_count);
+	percpu_counter_destroy(&sbi->rf_node_block_count);
+	percpu_counter_destroy(&sbi->alloc_valid_block_count);
 }
 
 static void destroy_device_list(struct f2fs_sb_info *sbi)
@@ -3619,11 +3620,20 @@ static int init_percpu_info(struct f2fs_sb_info *sbi)
 	if (err)
 		return err;
 
+	err = percpu_counter_init(&sbi->rf_node_block_count, 0, GFP_KERNEL);
+	if (err)
+		goto err_valid_block;
+
 	err = percpu_counter_init(&sbi->total_valid_inode_count, 0,
 								GFP_KERNEL);
 	if (err)
-		percpu_counter_destroy(&sbi->alloc_valid_block_count);
+		goto err_node_block;
+	return 0;
 
+err_node_block:
+	percpu_counter_destroy(&sbi->rf_node_block_count);
+err_valid_block:
+	percpu_counter_destroy(&sbi->alloc_valid_block_count);
 	return err;
 }
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 281bc0133ee6..47efcf233afd 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -732,6 +732,7 @@ F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ssr_sections, min_ssr_sections);
 F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
 F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
 F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
+F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_victim_search, max_victim_search);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, migration_granularity, migration_granularity);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, dir_level, dir_level);
@@ -855,6 +856,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
 	ATTR_LIST(dirty_nats_ratio),
+	ATTR_LIST(max_roll_forward_node_blocks),
 	ATTR_LIST(cp_interval),
 	ATTR_LIST(idle_interval),
 	ATTR_LIST(discard_idle_interval),
-- 
2.35.0.263.gb82422642f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
