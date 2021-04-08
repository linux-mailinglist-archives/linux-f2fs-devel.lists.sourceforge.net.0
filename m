Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5256357D7C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Apr 2021 09:41:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lUPHZ-0003dS-Vv; Thu, 08 Apr 2021 07:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jiayang5@huawei.com>) id 1lUPHQ-0003d7-BR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Apr 2021 07:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/MgkrEvdBgnCBeNJM9dYAoPaSe8GngLHzksGsMlh88=; b=ZhXs9cyaR4BZVVJMASwIGBR+uC
 4zjFXS5Bc101084/4fLoXywc61NrBC5/t0ddi1ONUvUHH62+hYpPC/lbJQ0EAKC8gaAV8JHj8Bglv
 Fb6/fNSs6q0Kxr/INCXEsiv7TkwzsIZj9UY35EiKRNnnJq4FgfUmeLijdc5D4mElhdaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G/MgkrEvdBgnCBeNJM9dYAoPaSe8GngLHzksGsMlh88=; b=C
 IP4mQauf0mNRCw7g99ydFiz5hXQJyetGUJLTS897U2bxEIXEMEKfO//o3aYRL0aMB22i1vfws11QM
 0D8bNQRbvUoUBN3YVifhUDu6CMPPIDiL/5VMHo5L3ISHYU9V5P6b+TztcBGcUUy+O36zgWTLWxp0k
 oTzTB0pG8lnJzKq4=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lUPHE-003GcS-L9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Apr 2021 07:40:44 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGClf57t6zpVYL;
 Thu,  8 Apr 2021 15:37:34 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 15:40:18 +0800
From: Jia Yang <jiayang5@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Thu, 8 Apr 2021 15:50:14 +0800
Message-ID: <20210408075014.2362887-1-jiayang5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lUPHE-003GcS-L9
Subject: [f2fs-dev] [PATCH -next] f2fs: Fix inappropriate spaces
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

Fix checkpatch.pl check:

ERROR: spaces required around that ':'
ERROR: spaces required before the open parenthesis '('
ERROR: spaces prohibited before that ','

Signed-off-by: Jia Yang <jiayang5@huawei.com>
---
 fs/f2fs/file.c     | 2 +-
 fs/f2fs/gc.c       | 2 +-
 fs/f2fs/node.c     | 4 ++--
 fs/f2fs/recovery.c | 2 +-
 fs/f2fs/segment.c  | 2 +-
 fs/f2fs/super.c    | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f3ca63b55843..d697c8900fa7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2582,7 +2582,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_map_blocks map = { .m_next_extent = NULL,
-					.m_seg_type = NO_CHECK_TYPE ,
+					.m_seg_type = NO_CHECK_TYPE,
 					.m_may_create = false };
 	struct extent_info ei = {0, 0, 0};
 	pgoff_t pg_start, pg_end, next_pgofs;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5c48825fd12d..9e6090217bd6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -160,7 +160,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
 	gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
 
-	gc_th->gc_wake= 0;
+	gc_th->gc_wake = 0;
 
 	sbi->gc_thread = gc_th;
 	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3eb724bb6594..fa57aee4dca7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1391,7 +1391,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 		goto out_err;
 	}
 page_hit:
-	if(unlikely(nid != nid_of_node(page))) {
+	if (unlikely(nid != nid_of_node(page))) {
 		f2fs_warn(sbi, "inconsistent node block, nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  nid, nid_of_node(page), ino_of_node(page),
 			  ofs_of_node(page), cpver_of_node(page),
@@ -1783,7 +1783,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 out:
 	if (nwritten)
 		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
-	return ret ? -EIO: 0;
+	return ret ? -EIO : 0;
 }
 
 static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index da75d5d52f0a..58f06c167e56 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -875,5 +875,5 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 #endif
 	sbi->sb->s_flags = s_flags; /* Restore SB_RDONLY status */
 
-	return ret ? ret: err;
+	return ret ? ret : err;
 }
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 01d4beb5d14f..c2cea533dfbe 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1787,7 +1787,7 @@ static int issue_discard_thread(void *data)
 		if (issued > 0) {
 			__wait_all_discard_cmd(sbi, &dpolicy);
 			wait_ms = dpolicy.min_interval;
-		} else if (issued == -1){
+		} else if (issued == -1) {
 			wait_ms = f2fs_time_to_wait(sbi, DISCARD_TIME);
 			if (!wait_ms)
 				wait_ms = dpolicy.mid_interval;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e673a064f006..2d948cc05997 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1892,7 +1892,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 	ret = sync_filesystem(sbi->sb);
 	if (ret || err) {
-		err = ret ? ret: err;
+		err = ret ? ret : err;
 		goto restore_flag;
 	}
 
@@ -3757,7 +3757,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
 
 	for (i = 0; i < NR_PAGE_TYPE; i++) {
-		int n = (i == META) ? 1: NR_TEMP_TYPE;
+		int n = (i == META) ? 1 : NR_TEMP_TYPE;
 		int j;
 
 		sbi->write_io[i] =
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
