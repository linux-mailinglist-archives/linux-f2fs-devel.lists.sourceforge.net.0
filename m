Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CAC49ED9F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 22:41:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDCWF-0008Qq-Jr; Thu, 27 Jan 2022 21:41:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nDCWE-0008IN-2L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 21:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vl+uLl0PeMPBGFZnJngKbSwnhWDITLLI0fj8HelfKoA=; b=IeeAaX7/Is6a13GqxZmEkBlxmR
 9LTgpxBUnb1zmRIWl6HtkPvF8l1mUHCMnzDxmXTVadkQZv7TUC/gffL8te1liZ1pv7K0O/CILuML4
 F+DuntifI32hKOxX2cPkfyfwLsMZ33uC2SuwrPmD7OHBtiQCYMhk3fGZbTisGlsaRDoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Vl+uLl0PeMPBGFZnJngKbSwnhWDITLLI0fj8HelfKoA=; b=n
 Dvoy72r3Ag+7fAY1b6WB5dQqTRPzmlCr3khoDSOpnXYm/dkNowFszEqBVmvCUmEwGgybULJl+wtCA
 FqVZ8TtleDfRoibQICvOfbfKG9TyTV6iRRz+UQArHfT4Qd8UnQQREcMAyJEJ4KK/29u7SGKTdlrB6
 4ldQ4KhnuFR0QkzA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDCWA-00H87Q-DU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 21:41:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4F81B821D8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jan 2022 21:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70601C340E4;
 Thu, 27 Jan 2022 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643319671;
 bh=9tNEDeNvtmDeOHF5CW/f5ER1Tod3iB6ro2vSYaeRu7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=q/d3a0awOOVnUwcyMvJCMGHoDXA8tZ8gJ5mZ51nzFUM9T5CljP0c/G0fQ+0knTw6g
 oG/TGDRNZuJ2HOMFrU5sG3Z8KILBQiL66geKf6bBiZu+s4FtfAlJxW53VwEfXkpvdD
 szZ/z9C+1euEq0ol/XPuZKWsQlLAuXxeAsTDTmN/ilZVtja5ksRF1B8gRRPXIZy1LD
 qONUX37egBhw+teistyMjDalGPpm2vSlsaehtWzBtL0X3LQWuv5e/eJhuxSpGm2p5Y
 K8WmyAvypR/cBoNnhbKoueKkTN/WONtN03Obb2aKXUaTlNlC6bVIiAFK5kOfzAmlnE
 KgWXgTBPhXsZQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 27 Jan 2022 13:41:02 -0800
Message-Id: <20220127214102.2040254-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This adds a sysfs entry to call checkpoint during fsync()
 in order to avoid long elapsed time to run roll-forward recovery when booting
 the device. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 6 ++++++ fs/f2fs/checkpoint.c | 1 + fs/f2fs/f2fs.h | 3 +++ fs/f2fs/node.c
 | 2 ++ fs/f2fs/node.h | 3 +++ fs [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDCWA-00H87Q-DU
Subject: [f2fs-dev] [PATCH] f2fs: add a way to limit roll forward recovery
 time
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a sysfs entry to call checkpoint during fsync() in order to avoid
long elapsed time to run roll-forward recovery when booting the device.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/checkpoint.c                    | 1 +
 fs/f2fs/f2fs.h                          | 3 +++
 fs/f2fs/node.c                          | 2 ++
 fs/f2fs/node.h                          | 3 +++
 fs/f2fs/recovery.c                      | 3 +++
 fs/f2fs/sysfs.c                         | 2 ++
 7 files changed, 20 insertions(+)

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
index deeda95688f0..57a2d9164bee 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1543,6 +1543,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	/* update user_block_counts */
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	percpu_counter_set(&sbi->alloc_valid_block_count, 0);
+	percpu_counter_set(&sbi->rf_node_block_count, 0);
 
 	/* Here, we have one bio having CP pack except cp pack 2 page */
 	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 63c90416364b..6ddb98ff0b7c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -913,6 +913,7 @@ struct f2fs_nm_info {
 	nid_t max_nid;			/* maximum possible node ids */
 	nid_t available_nids;		/* # of available node ids */
 	nid_t next_scan_nid;		/* the next nid to be scanned */
+	nid_t max_rf_node_blocks;	/* max # of nodes for recovery */
 	unsigned int ram_thresh;	/* control the memory footprint */
 	unsigned int ra_nid_pages;	/* # of nid pages to be readaheaded */
 	unsigned int dirty_nats_ratio;	/* control dirty nats ratio threshold */
@@ -1684,6 +1685,8 @@ struct f2fs_sb_info {
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
index 18b98cf0465b..fe56fd29c0d3 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -31,6 +31,9 @@
 /* control total # of nats */
 #define DEF_NAT_CACHE_THRESHOLD			100000
 
+/* control total # of node writes used for roll-fowrad recovery */
+#define DEF_RF_NODE_BLOCKS			100
+
 /* vector size for gang look-up from nat cache that consists of radix tree */
 #define NATVEC_SIZE	64
 #define SETVEC_SIZE	32
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 10d152cfa58d..f69b685fb2b2 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -53,9 +53,12 @@ extern struct kmem_cache *f2fs_cf_name_slab;
 bool f2fs_space_for_roll_forward(struct f2fs_sb_info *sbi)
 {
 	s64 nalloc = percpu_counter_sum_positive(&sbi->alloc_valid_block_count);
+	u32 rf_node = percpu_counter_sum_positive(&sbi->rf_node_block_count);
 
 	if (sbi->last_valid_block_count + nalloc > sbi->user_block_count)
 		return false;
+	if (rf_node >= NM_I(sbi)->max_rf_node_blocks)
+		return false;
 	return true;
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
2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
