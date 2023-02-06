Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED868BC26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 12:56:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pP06h-0007jw-Jc;
	Mon, 06 Feb 2023 11:56:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <j-young.choi@samsung.com>) id 1pP06f-0007jG-GI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 11:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DaNoKx85s1XMgGyOKRqu4B4f9oIW5scdWTiV0LJmAWU=; b=jpzpmJt/n+PBqJdY9mNBA7XC9T
 7xNgLDK6NkaSZT6AuWZjLQ7kESoC4fFie6TQdRw3VMpMoj+ELG17Tx39jbezZV6C+yDmHzwUcD/kR
 SOsGSdvT6eDMDIjHmqe9jTQKqggUtOGES08Dd2L02N+J6dpqEcORGrC0TPbCNmj1N8WE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DaNoKx85s1XMgGyOKRqu4B4f9oIW5scdWTiV0LJmAWU=; b=M
 fYQf1t9u0RaVSrztLNjMtZ5W8/2KFHibzq2AKWgzocbVBmwXojUo6iisahvFeuA18NSCIWbUBuwXT
 tgaZHIhZ66rlf19npJIVfyb4I5CEwnVNhKCVDm4PlexiBDKDj7Jsvj7VTA9nSgAsFGXwo9ipCkd5D
 JUKJXbHEgfiUOfws=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pP06Y-00CX6v-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 11:56:19 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230206115601epoutp03c712688c7e4df708806784f522735d6d~BOjr27v8k2896128961epoutp03c
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Feb 2023 11:56:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230206115601epoutp03c712688c7e4df708806784f522735d6d~BOjr27v8k2896128961epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1675684561;
 bh=DaNoKx85s1XMgGyOKRqu4B4f9oIW5scdWTiV0LJmAWU=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=V4qVablqNjZ8dzuyZeRnUvvffWkrn9o1XBvYLL4GC1J6E6FEFkrvFUrUnSnJngEwA
 UCGuU2AUK3GdGuczoPM2C+UWPFxBbRwXxh1xKJmr5W/xeP7YFqTdjjWDzdMyLUbpIe
 Mdp4PhfXNgmLAaqUHK+g8ZX8pQW3r05oFmbkNEL4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20230206115600epcas2p375b5479445f9b87732dec33b8131bfbe~BOjrf4BlT1045210452epcas2p3F;
 Mon,  6 Feb 2023 11:56:00 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4P9Pq42mSqz4x9Pv; Mon,  6 Feb
 2023 11:56:00 +0000 (GMT)
X-AuditID: b6c32a45-671ff7000001f1e7-3c-63e0ead0489b
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 E4.23.61927.0DAE0E36; Mon,  6 Feb 2023 20:56:00 +0900 (KST)
Mime-Version: 1.0
From: Jinyoung CHOI <j-young.choi@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230206115600epcms2p736f05524a361d5926dbb401bdd218f85@epcms2p7>
Date: Mon, 06 Feb 2023 20:56:00 +0900
X-CMS-MailID: 20230206115600epcms2p736f05524a361d5926dbb401bdd218f85
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7bCmqe6FVw+SDc58ErI4PfUsk8XLQ5oW
 vf1b2SyerJ/FbHFpkbvF5V1z2BzYPDat6mTz2L3gM5NH35ZVjB6fN8kFsERl22SkJqakFimk
 5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYArVZSKEvMKQUKBSQWFyvp
 29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGdcWNjIWNBsXvHj
 7F22BsaFOl2MnBwSAiYSG3/8Yu1i5OIQEtjBKNG/7A1TFyMHB6+AoMTfHcIgNcICOhIN1+4z
 gthCAkoS59bMYgQpERYwkLjVaw4SZhPQk/i5ZAYbiC0i8IpR4sxqUYjxvBIz2p+yQNjSEtuX
 b2WEsDUkfizrZYawRSVurn7LDmO/PzYfqkZEovXeWagaQYkHP3dDxSUlDh36ygZygoRAvsSG
 A4EQ4RqJt8sPQJXoS1zr2Ai2llfAV+LKmQZWEJtFQFWi+/s6qHNcJF4t/wtmMwvIS2x/O4cZ
 ZCSzgKbE+l36ENOVJY7cYoF5pGHjb3Z0NrMAn0TH4b9w8R3znjBBtKpJLGoyggjLSHw9PB+q
 xEPi2v29jBMYFWchAnkWkhNmIZywgJF5FaNYakFxbnpqsVGBITxek/NzNzGCE6CW6w7GyW8/
 6B1iZOJgPMQowcGsJMJreuBBshBvSmJlVWpRfnxRaU5q8SFGU6DnJzJLiSbnA1NwXkm8oYml
 gYmZmaG5kamBuZI4r7TtyWQhgfTEktTs1NSC1CKYPiYOTqkGJnu16cV8ns82vUpmu9AuE5aX
 69rd+Is33tJq/+IVuR9rG6cEy4ucEC65PmnL92+Tgy2sXh36cVxUMCZ6omKpiOavyTM/hKQ1
 h4Q7WEy0UCt45vXuw6sZTwNNJ+Q4lOrsflq57tyaj79rt7KK5L1v+/jsocLzG+1TNu5ibTnY
 qSe3Zf7Dy9oCnP++JYZOehl7p3hRjdDCYkWLzfJ1Gb4T59lf81SriD7wcYvjocehVbYtj4z4
 uGJaP53SiLxjGLiaJ9U0W/PsFwlWx5xtDPm8PB/+r7v73X4u5+rLDxtXWX15JOFxm+FS41X1
 9Eez+U6dmVv/tnZmu+ekF1Yr337PnLplxkHTsxxpP37/1FcMYVNiKc5INNRiLipOBACc99YI
 CQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230206115600epcms2p736f05524a361d5926dbb401bdd218f85
References: <CGME20230206115600epcms2p736f05524a361d5926dbb401bdd218f85@epcms2p7>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch is to fix typos in f2fs files. Signed-off-by:
 Jinyoung
 Choi <j-young.choi@samsung.com> --- fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/compress.c
 | 2 +- fs/f2fs/data.c | 8 ++++---- fs/f2fs/extent_cache.c | 4 ++--
 fs/f2fs/file.c | 6 +++-- [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pP06Y-00CX6v-Ic
Subject: [f2fs-dev] [PATCH] f2fs: fix typos in comments
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
Reply-To: j-young.choi@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch is to fix typos in f2fs files.

Signed-off-by: Jinyoung Choi <j-young.choi@samsung.com>
---
 fs/f2fs/checkpoint.c   | 4 ++--
 fs/f2fs/compress.c     | 2 +-
 fs/f2fs/data.c         | 8 ++++----
 fs/f2fs/extent_cache.c | 4 ++--
 fs/f2fs/file.c         | 6 +++---
 fs/f2fs/namei.c        | 2 +-
 fs/f2fs/segment.c      | 2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 89ce08b0ff7c..1369ec892a2c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -792,7 +792,7 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 	 */
 	head = &im->ino_list;
 
-	/* loop for each orphan inode entry and write them in Jornal block */
+	/* loop for each orphan inode entry and write them in journal block */
 	list_for_each_entry(orphan, head, list) {
 		if (!page) {
 			page = f2fs_grab_meta_page(sbi, start_blk++);
@@ -1122,7 +1122,7 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
 	} else {
 		/*
 		 * We should submit bio, since it exists several
-		 * wribacking dentry pages in the freeing inode.
+		 * writebacking dentry pages in the freeing inode.
 		 */
 		f2fs_submit_merged_write(sbi, DATA);
 		cond_resched();
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e4851f7a43d8..b40dec3d7f79 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1225,7 +1225,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	loff_t psize;
 	int i, err;
 
-	/* we should bypass data pages to proceed the kworkder jobs */
+	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
 		mapping_set_error(cc->rpages[0]->mapping, -EIO);
 		goto out_free;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8a636500db0e..c00b9ad98ac4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2382,7 +2382,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_compressed_file(inode)) {
-			/* there are remained comressed pages, submit them */
+			/* there are remained compressed pages, submit them */
 			if (!f2fs_cluster_can_merge_page(&cc, page->index)) {
 				ret = f2fs_read_multi_pages(&cc, &bio,
 							max_nr_pages,
@@ -2788,7 +2788,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 
 	trace_f2fs_writepage(page, DATA);
 
-	/* we should bypass data pages to proceed the kworkder jobs */
+	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
 		mapping_set_error(page->mapping, -EIO);
 		/*
@@ -2907,7 +2907,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 redirty_out:
 	redirty_page_for_writepage(wbc, page);
 	/*
-	 * pageout() in MM traslates EAGAIN, so calls handle_write_error()
+	 * pageout() in MM translates EAGAIN, so calls handle_write_error()
 	 * -> mapping_set_error() -> set_bit(AS_EIO, ...).
 	 * file_write_and_wait_range() will see EIO error, which is critical
 	 * to return value of fsync() followed by atomic_write failure to user.
@@ -2941,7 +2941,7 @@ static int f2fs_write_data_page(struct page *page,
 }
 
 /*
- * This function was copied from write_cche_pages from mm/page-writeback.c.
+ * This function was copied from write_cache_pages from mm/page-writeback.c.
  * The major change is making write step of cold data page separately from
  * warm/hot data page.
  */
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index c8efc957c230..636aa8694363 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -233,7 +233,7 @@ struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
  * @prev_ex: extent before ofs
  * @next_ex: extent after ofs
  * @insert_p: insert point for new extent at ofs
- * in order to simpfy the insertion after.
+ * in order to simplify the insertion after.
  * tree must stay unchanged between lookup and insertion.
  */
 struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
@@ -718,7 +718,7 @@ static void __update_extent_tree_range(struct inode *inode,
 	if (!en)
 		en = next_en;
 
-	/* 2. invlidate all extent nodes in range [fofs, fofs + len - 1] */
+	/* 2. invalidate all extent nodes in range [fofs, fofs + len - 1] */
 	while (en && en->ei.fofs < end) {
 		unsigned int org_end;
 		int parts = 0;	/* # of parts current extent split into */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a17aca50c18c..300eae8b5415 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -303,7 +303,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 		 * for OPU case, during fsync(), node can be persisted before
 		 * data when lower device doesn't support write barrier, result
 		 * in data corruption after SPO.
-		 * So for strict fsync mode, force to use atomic write sematics
+		 * So for strict fsync mode, force to use atomic write semantics
 		 * to keep write order in between data/node and last node to
 		 * avoid potential data corruption.
 		 */
@@ -1806,7 +1806,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 		return -EOPNOTSUPP;
 
 	/*
-	 * Pinned file should not support partial trucation since the block
+	 * Pinned file should not support partial truncation since the block
 	 * can be used by applications.
 	 */
 	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
@@ -1856,7 +1856,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 static int f2fs_release_file(struct inode *inode, struct file *filp)
 {
 	/*
-	 * f2fs_relase_file is called at every close calls. So we should
+	 * f2fs_release_file is called at every close calls. So we should
 	 * not drop any inmemory pages by close called by other process.
 	 */
 	if (!(filp->f_mode & FMODE_WRITE) ||
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 82923273f4bb..f9aafb7ac44d 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -963,7 +963,7 @@ static int f2fs_rename(struct user_namespace *mnt_userns, struct inode *old_dir,
 
 	/*
 	 * If new_inode is null, the below renaming flow will
-	 * add a link in old_dir which can conver inline_dir.
+	 * add a link in old_dir which can convert inline_dir.
 	 * After then, if we failed to get the entry due to other
 	 * reasons like ENOMEM, we had to remove the new entry.
 	 * Instead of adding such the error handling routine, let's
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 69b01b5c0ce0..ead3f35f501d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3616,7 +3616,7 @@ void f2fs_wait_on_page_writeback(struct page *page,
 
 		/* submit cached LFS IO */
 		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, type);
-		/* sbumit cached IPU IO */
+		/* submit cached IPU IO */
 		f2fs_submit_merged_ipu_write(sbi, NULL, page);
 		if (ordered) {
 			wait_on_page_writeback(page);
-- 
2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
