Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32261129144
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2019 05:01:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ijEtv-0003C5-Dr; Mon, 23 Dec 2019 04:00:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ijEtr-0003Bq-55
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Dec 2019 04:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xMOGSKEMk2RByCFMjjHJ5ollxIpfueTYlkz/PxDJbO8=; b=iZ/AZGyyAHb4OWrlzCAKovqQbH
 8LNdJL9WVa5Qq5n5DVNfKa9FiIik8WKJThZCTtGl0h8lPm1L0IO7X4ZanydIMkl9noWsk2K2E9dZ9
 aEgxM3ehBMWO5n/IyNKSIBGqeMZHR1eR0teXUWGa0x+nRYTeGBYVKnTAamEgWDUpiTYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xMOGSKEMk2RByCFMjjHJ5ollxIpfueTYlkz/PxDJbO8=; b=l
 Q/bnGPktMgk+5vfesyuG5YWGFVRu8cFGxcl4tykBQbpa+eRqm9RvsCExoKz6nybCqICf0G2AkwqZ1
 2cnkxjiXQXeNEVGJR/bliY6AeIz6r3LmwCiVPE2oxy4imYP5FdKFgJgKzyjft4LdUWp9/SDbQrzC0
 xCs95kW+yTgQ0lHc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ijEti-00Ctsk-O6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Dec 2019 04:00:52 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 136DC6E380EB7F9F8274;
 Mon, 23 Dec 2019 12:00:39 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 23 Dec 2019 12:00:31 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 23 Dec 2019 12:00:20 +0800
Message-ID: <20191223040020.109570-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ijEti-00Ctsk-O6
Subject: [f2fs-dev] [PATCH] f2fs: introduce DEFAULT_IO_TIMEOUT_JIFFIES
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

As Geert Uytterhoeven reported:

for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);

On some platforms, HZ can be less than 50, then unexpected 0 timeout
jiffies will be set in congestion_wait().

This patch introduces a macro DEFAULT_IO_TIMEOUT_JIFFIES to limit
mininum value of timeout jiffies.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c |  3 ++-
 fs/f2fs/data.c     |  5 +++--
 fs/f2fs/f2fs.h     |  2 ++
 fs/f2fs/gc.c       |  3 ++-
 fs/f2fs/inode.c    |  3 ++-
 fs/f2fs/node.c     |  3 ++-
 fs/f2fs/recovery.c |  6 ++++--
 fs/f2fs/segment.c  | 12 ++++++++----
 fs/f2fs/super.c    |  6 ++++--
 9 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1bc86a54ad71..ee4fe8e644aa 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -945,7 +945,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 			} else if (ret == -EAGAIN) {
 				ret = 0;
 				cond_resched();
-				congestion_wait(BLK_RW_ASYNC, HZ/50);
+				congestion_wait(BLK_RW_ASYNC,
+					DEFAULT_IO_TIMEOUT_JIFFIES);
 				lock_page(cc->rpages[i]);
 				clear_page_dirty_for_io(cc->rpages[i]);
 				goto retry_write;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f1f5c701228d..78b5c0b0287e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2320,7 +2320,8 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 		/* flush pending IOs and wait for a while in the ENOMEM case */
 		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
 			f2fs_flush_merged_writes(fio->sbi);
-			congestion_wait(BLK_RW_ASYNC, HZ/50);
+			congestion_wait(BLK_RW_ASYNC,
+					DEFAULT_IO_TIMEOUT_JIFFIES);
 			gfp_flags |= __GFP_NOFAIL;
 			goto retry_encrypt;
 		}
@@ -2900,7 +2901,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					if (wbc->sync_mode == WB_SYNC_ALL) {
 						cond_resched();
 						congestion_wait(BLK_RW_ASYNC,
-								HZ/50);
+							DEFAULT_IO_TIMEOUT_JIFFIES);
 						goto retry_write;
 					}
 					goto next;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16edbf4e05e8..4bdc20a94185 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -559,6 +559,8 @@ enum {
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO count */
 
+#define	DEFAULT_IO_TIMEOUT_JIFFIES	(max_t(long, HZ/50, 1))
+
 /* maximum retry quota flush count */
 #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b3d399623290..c9523c4e4001 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -970,7 +970,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		if (err) {
 			clear_cold_data(page);
 			if (err == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC, HZ/50);
+				congestion_wait(BLK_RW_ASYNC,
+						DEFAULT_IO_TIMEOUT_JIFFIES);
 				goto retry;
 			}
 			if (is_dirty)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 3fa728f40c2a..1646b4e7a79f 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -519,7 +519,8 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 	inode = f2fs_iget(sb, ino);
 	if (IS_ERR(inode)) {
 		if (PTR_ERR(inode) == -ENOMEM) {
-			congestion_wait(BLK_RW_ASYNC, HZ/50);
+			congestion_wait(BLK_RW_ASYNC,
+					DEFAULT_IO_TIMEOUT_JIFFIES);
 			goto retry;
 		}
 	}
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3314a0f3405e..94c2fa5811df 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2602,7 +2602,8 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 retry:
 	ipage = f2fs_grab_cache_page(NODE_MAPPING(sbi), ino, false);
 	if (!ipage) {
-		congestion_wait(BLK_RW_ASYNC, HZ/50);
+		congestion_wait(BLK_RW_ASYNC,
+				DEFAULT_IO_TIMEOUT_JIFFIES);
 		goto retry;
 	}
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 763d5c0951d1..72e0f30b7d99 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -535,7 +535,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	err = f2fs_get_dnode_of_data(&dn, start, ALLOC_NODE);
 	if (err) {
 		if (err == -ENOMEM) {
-			congestion_wait(BLK_RW_ASYNC, HZ/50);
+			congestion_wait(BLK_RW_ASYNC,
+					DEFAULT_IO_TIMEOUT_JIFFIES);
 			goto retry_dn;
 		}
 		goto out;
@@ -618,7 +619,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 			err = check_index_in_prev_nodes(sbi, dest, &dn);
 			if (err) {
 				if (err == -ENOMEM) {
-					congestion_wait(BLK_RW_ASYNC, HZ/50);
+					congestion_wait(BLK_RW_ASYNC,
+						DEFAULT_IO_TIMEOUT_JIFFIES);
 					goto retry_prev;
 				}
 				goto err;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a9519532c029..7cf2817bd83e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -245,7 +245,8 @@ static int __revoke_inmem_pages(struct inode *inode,
 								LOOKUP_NODE);
 			if (err) {
 				if (err == -ENOMEM) {
-					congestion_wait(BLK_RW_ASYNC, HZ/50);
+					congestion_wait(BLK_RW_ASYNC,
+						DEFAULT_IO_TIMEOUT_JIFFIES);
 					cond_resched();
 					goto retry;
 				}
@@ -312,7 +313,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
 skip:
 		iput(inode);
 	}
-	congestion_wait(BLK_RW_ASYNC, HZ/50);
+	congestion_wait(BLK_RW_ASYNC,
+			DEFAULT_IO_TIMEOUT_JIFFIES);
 	cond_resched();
 	if (gc_failure) {
 		if (++looped >= count)
@@ -415,7 +417,8 @@ static int __f2fs_commit_inmem_pages(struct inode *inode)
 			err = f2fs_do_write_data_page(&fio);
 			if (err) {
 				if (err == -ENOMEM) {
-					congestion_wait(BLK_RW_ASYNC, HZ/50);
+					congestion_wait(BLK_RW_ASYNC,
+						DEFAULT_IO_TIMEOUT_JIFFIES);
 					cond_resched();
 					goto retry;
 				}
@@ -2801,7 +2804,8 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			congestion_wait(BLK_RW_ASYNC, HZ/50);
+			congestion_wait(BLK_RW_ASYNC,
+					DEFAULT_IO_TIMEOUT_JIFFIES);
 			goto next;
 		}
 skip:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9d491f8fad4f..eff95e6d5641 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1891,7 +1891,8 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 		page = read_cache_page_gfp(mapping, blkidx, GFP_NOFS);
 		if (IS_ERR(page)) {
 			if (PTR_ERR(page) == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC, HZ/50);
+				congestion_wait(BLK_RW_ASYNC,
+						DEFAULT_IO_TIMEOUT_JIFFIES);
 				goto repeat;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
@@ -1945,7 +1946,8 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 							&page, NULL);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC, HZ/50);
+				congestion_wait(BLK_RW_ASYNC,
+					DEFAULT_IO_TIMEOUT_JIFFIES);
 				goto retry;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
