Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF96D8C27
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2019 11:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKfI3-0000BN-BJ; Wed, 16 Oct 2019 09:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1iKfI2-0000BE-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o65RS9lkW79pw0LYO393gL5qN5qTP4dgFTQiEotR80k=; b=lGqOU93ZUGAETQU020B3Fj5d/8
 Pk7wkleGemLUVFeaR0XqzSndrQhhQsvPsaA3TBeT+hKRAOOwnDaxkzDPIfzOdyNy14uept6HRHeL8
 UOpCV5DFYYuZIjD7SmedXJNa6HB+ssazbPV2vu1qAHztMQiERCkTEhmLs/x0oykuArto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o65RS9lkW79pw0LYO393gL5qN5qTP4dgFTQiEotR80k=; b=P0MAWTKL+GH7VboOTk2Rw0Fmgm
 D8YXivcOFC4y9qldkq2Cqa02WG6hUED5yU7VqrPf1JMuMmz8WaeDYTVeVfHYRDEA5I7lcSbk3SPJj
 3SQ87V9rIKHwm+3L7vJWoDr9djcDKm0O7v9di7VO1ibjUtMAa4BvuDxZ8yuaKOtcr5lI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKfHy-00BG0n-7z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:08:18 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6BAFED6CAA86CB67C453;
 Wed, 16 Oct 2019 17:08:06 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 17:07:59 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Wed, 16 Oct 2019 17:15:09 +0800
Message-ID: <1571217309-63636-3-git-send-email-koulihong@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571217309-63636-1-git-send-email-koulihong@huawei.com>
References: <1571217309-63636-1-git-send-email-koulihong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKfHy-00BG0n-7z
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce a new fio cache for IPU.
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
Cc: zengguangyue@hisilicon.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: k00417925 <k00417925@notesmail.huawei.com>

Description: introduce a new fio cache for IPU sequential
writes. After commit 8648de2c581(f2fs: add bio cache for IPU)
in the mainline, we still have the problem in SQLite. After
discuss the issue with chao, we know there are still some bugs
in global bio cache for IPU. This patch introdce a new fio cache
to fix this bug.

Test case:
fio -filename=/data/1.txt -direct=0 -ioengine=psync -fdatasync=1 -rw=write -bs=256K -size=256M -numjobs=1 -group_reporting -name=test1

Before:
             fio-2635  [015] ....  2017.735514: block_rq_issue: 7,0 WS 4096 () 548888 + 8 [fio]
             fio-2635  [015] ....  2017.735515: block_rq_issue: 7,0 WS 4096 () 548896 + 8 [fio]
             fio-2635  [015] ....  2017.735516: block_rq_issue: 7,0 WS 4096 () 548904 + 8 [fio]
             fio-2635  [015] ....  2017.735516: block_rq_issue: 7,0 WS 4096 () 548912 + 8 [fio]
             fio-2635  [015] ....  2017.735517: block_rq_issue: 7,0 WS 4096 () 548920 + 8 [fio]
             fio-2635  [015] ....  2017.735517: block_rq_issue: 7,0 WS 4096 () 548928 + 8 [fio]
             fio-2635  [015] ....  2017.735518: block_rq_issue: 7,0 WS 4096 () 548936 + 8 [fio]
             fio-2635  [015] ....  2017.735518: block_rq_issue: 7,0 WS 4096 () 548944 + 8 [fio]
             fio-2635  [015] ....  2017.735519: block_rq_issue: 7,0 WS 4096 () 548952 + 8 [fio]
             fio-2635  [015] ....  2017.735519: block_rq_issue: 7,0 WS 4096 () 548960 + 8 [fio]
             fio-2635  [015] ....  2017.735520: block_rq_issue: 7,0 WS 4096 () 548968 + 8 [fio]
             fio-2635  [015] ....  2017.735520: block_rq_issue: 7,0 WS 4096 () 548976 + 8 [fio]
             fio-2635  [015] ....  2017.735521: block_rq_issue: 7,0 WS 4096 () 548984 + 8 [fio]
After:
             fio-14692 [003] ....  1473.946721: block_rq_issue: 7,0 WS 262144 () 195072 + 512 [fio]
             fio-14692 [003] ....  1473.947722: block_rq_issue: 7,0 WS 262144 () 195584 + 512 [fio]
             fio-14692 [003] ....  1473.948716: block_rq_issue: 7,0 WS 262144 () 196096 + 512 [fio]
             fio-14692 [003] ....  1473.949711: block_rq_issue: 7,0 WS 262144 () 196608 + 512 [fio]
             fio-14692 [003] ....  1473.950704: block_rq_issue: 7,0 WS 262144 () 197120 + 512 [fio]
             fio-14692 [003] ....  1473.951700: block_rq_issue: 7,0 WS 262144 () 197632 + 512 [fio]
             fio-14692 [003] ....  1473.952687: block_rq_issue: 7,0 WS 262144 () 198144 + 512 [fio]
             fio-14692 [003] ....  1473.953684: block_rq_issue: 7,0 WS 262144 () 198656 + 512 [fio]
             fio-14692 [003] ....  1473.954683: block_rq_issue: 7,0 WS 262144 () 199168 + 512 [fio]
             fio-14692 [003] ....  1473.955686: block_rq_issue: 7,0 WS 262144 () 199680 + 512 [fio]
             fio-14692 [003] ....  1473.956732: block_rq_issue: 7,0 WS 262144 () 200192 + 512 [fio]
             fio-14692 [003] ....  1473.957749: block_rq_issue: 7,0 WS 262144 () 200704 + 512 [fio]
             fio-14692 [003] ....  1473.958741: block_rq_issue: 7,0 WS 262144 () 201216 + 512 [fio]

Signed-off-by: koulihong <koulihong@huawei.com>
---
 fs/f2fs/checkpoint.c |  1 +
 fs/f2fs/data.c       |  5 +++++
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/segment.c    | 19 +++++++++++--------
 fs/f2fs/super.c      |  2 ++
 5 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a0eef95..78d5db0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1081,6 +1081,7 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 		 * wribacking dentry pages in the freeing inode.
 		 */
 		f2fs_submit_merged_write(sbi, DATA);
+		f2fs_submit_merged_write(sbi, DATA_IPU);
 		cond_resched();
 	}
 	goto retry;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5af9810..16fdab2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -440,6 +440,7 @@ void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
 	f2fs_submit_merged_write(sbi, DATA);
 	f2fs_submit_merged_write(sbi, NODE);
 	f2fs_submit_merged_write(sbi, META);
+	f2fs_submit_merged_write(sbi, DATA_IPU);
 }
 
 /*
@@ -2065,6 +2066,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 
 	if (wbc->for_reclaim) {
 		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, DATA);
+		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, DATA_IPU);
 		clear_inode_flag(inode, FI_HOT_DATA);
 		f2fs_remove_dirty_inode(inode);
 		submitted = NULL;
@@ -2077,6 +2079,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		f2fs_submit_merged_write(sbi, DATA);
+		f2fs_submit_merged_write(sbi, DATA_IPU);
 		submitted = NULL;
 	}
 
@@ -2253,6 +2256,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (nwritten)
 		f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping->host,
 								NULL, 0, DATA);
+		f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping->host,
+								NULL, 0, DATA_IPU);
 
 	return ret;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1cf2843..79bf996 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -983,6 +983,7 @@ enum count_type {
 enum page_type {
 	DATA,
 	NODE,
+	DATA_IPU,
 	META,
 	NR_PAGE_TYPE,
 	META_FLUSH,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 380e0ab..9c67b55 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -430,8 +430,10 @@ static int __f2fs_commit_inmem_pages(struct inode *inode)
 		list_move_tail(&cur->list, &revoke_list);
 	}
 
-	if (submit_bio)
+	if (submit_bio) {
 		f2fs_submit_merged_write_cond(sbi, inode, NULL, 0, DATA);
+		f2fs_submit_merged_write_cond(sbi, inode, NULL, 0, DATA_IPU);
+	}
 
 	if (err) {
 		/*
@@ -3234,7 +3236,6 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
 
 int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 {
-	int err;
 	struct f2fs_sb_info *sbi = fio->sbi;
 	unsigned int segno;
 
@@ -3253,13 +3254,12 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 
 	stat_inc_inplace_blocks(fio->sbi);
 
-	err = f2fs_submit_page_bio(fio);
-	if (!err) {
-		update_device_state(fio);
-		f2fs_update_iostat(fio->sbi, fio->io_type, F2FS_BLKSIZE);
-	}
+	fio->type = DATA_IPU;
+	f2fs_submit_page_write(fio);
+	update_device_state(fio);
+	f2fs_update_iostat(fio->sbi, fio->io_type, F2FS_BLKSIZE);
 
-	return err;
+	return 0;
 }
 
 static inline int __f2fs_get_curseg(struct f2fs_sb_info *sbi,
@@ -3375,6 +3375,9 @@ void f2fs_wait_on_page_writeback(struct page *page,
 		struct f2fs_sb_info *sbi = F2FS_P_SB(page);
 
 		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, type);
+		if (type == DATA)
+			f2fs_submit_merged_write_cond(sbi, NULL, page, 0, DATA_IPU);
+
 		if (ordered) {
 			wait_on_page_writeback(page);
 			f2fs_bug_on(sbi, locked && PageWriteback(page));
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d95a681..62e1799 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -899,6 +899,8 @@ static int f2fs_drop_inode(struct inode *inode)
 
 			f2fs_submit_merged_write_cond(F2FS_I_SB(inode),
 					inode, NULL, 0, DATA);
+			f2fs_submit_merged_write_cond(F2FS_I_SB(inode),
+					inode, NULL, 0, DATA_IPU);
 			truncate_inode_pages_final(inode->i_mapping);
 
 			if (F2FS_HAS_BLOCKS(inode))
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
