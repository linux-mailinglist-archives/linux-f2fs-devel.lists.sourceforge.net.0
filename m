Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078D5774B3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 07:32:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCwta-0005IU-1D; Sun, 17 Jul 2022 05:32:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1oCwtY-0005IO-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 05:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=enHIx/apWdDQ2KKgQELh/5cx8o3or1W/1IlIPmxKREE=; b=c+G1MKZUODk1fZNw17NbjeR9ns
 LY5Zpus71kj/yxXKa/t3uOCfrH1mKkGlPoCnnU+rOws4OWGgjAO+bRfvOjl30Ys3e7WIQiLm4fBLU
 XDZpBjZF/KRP7x+emUd0G7u7s74FzsFfNCSzhG2XuxxrPynfjU/rMe0FsW6anns+0Ek8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=enHIx/apWdDQ2KKgQELh/5cx8o3or1W/1IlIPmxKREE=; b=PICgYrFTMn4RZ2yZPnuxQxDhhJ
 0+DsKK/+HuiNo21LBhhQbsqcHbT1ujr+w9AeA5pwFXF3dRTE0Co/lbFXM81oE0mffkJ2nLGSbHMn5
 Z68ndPlD57hNS6QGkDHcKLavE+H6KUHtViVxpJtz76d6tU04GvFWrteuODmfDk/L4NKQ=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oCwtV-0000ML-KY
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 05:32:43 +0000
Received: by mail-pf1-f179.google.com with SMTP id c3so7128417pfb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Jul 2022 22:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enHIx/apWdDQ2KKgQELh/5cx8o3or1W/1IlIPmxKREE=;
 b=gJ71It/x47tHTcZmWbjqVQgV11QgiL3ZSluwCLO7x9Sk/zDQQGW4sMzllCyKF5gP1g
 qddOqRFFBus1J/dvYmAvbyPW/f+agwfJh63M/t76ynUPw9+8ZyHe0XloOf+gAlU/kbqv
 eDzS9J9AHe64DnvXB8O7o539OadMhCg1KQAtgVgdiS1PobfGEJ+tT5QPj+p1S3oZtj4F
 9UjWTI0u9cGbJpuIA5LzGwS7L5KkZTI0nPFMVdJ+oSvsMlzW0MQzthwI3CZwn+xW3GUI
 9syG8S1Sh+WEyveDRwtlHumTejckZI1ekEMqpzifQADMogbDt/Z6b214wZ9mmd/I30XA
 9CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enHIx/apWdDQ2KKgQELh/5cx8o3or1W/1IlIPmxKREE=;
 b=C4nZxXdqbfANP4aRWqpuYKRvflGr8gnTUPZdxscj0XOkP5GdlI8gOZgptHXK9e8UYz
 0sZOaBdvwh9dExBMQtin9/OLxZOO9/IzdoArnp3sN5uEK1PMgmjOSe9HlaATrI5bju/+
 YXSd5yjFWeGvqbopn0nMi+ZivbfFSku651XeeQ4dLV0bMydJb8mnraBdYez4ZG7rW7Ry
 7jpHMU0v5bci3EZ3h/rph2l9EB2wq2NvqZsmiRP4akFBEXTm1255WfdUyENDkCt9FZY+
 VPLQKptuf9/ofgGSN5nCXlSCZmCKq3j0KVybft7aVOaNwiQU6mC2Yg2fxRtcw4WkZ+zQ
 lNaA==
X-Gm-Message-State: AJIora+jCL3xmcrRgA91FMziehMA72HL/KVKDEatDzcBLn6MFiQ/y2qS
 ewIKS2XyvfbeDEji/wc7DDE=
X-Google-Smtp-Source: AGRyM1sdH9ynxpP28P66RBnzsLkxNJXWQhgPyOpQd2C+7kOOj6DZbjlqjbzTKLCHZjd/cu+/9T2BOA==
X-Received: by 2002:a05:6a00:14c4:b0:52a:c36c:1854 with SMTP id
 w4-20020a056a0014c400b0052ac36c1854mr21752320pfu.27.1658035956086; 
 Sat, 16 Jul 2022 22:32:36 -0700 (PDT)
Received: from localhost.localdomain ([205.198.104.202])
 by smtp.googlemail.com with ESMTPSA id
 n8-20020a170902968800b0015e8d4eb1d3sm6488814plp.29.2022.07.16.22.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 22:32:35 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 17 Jul 2022 13:32:07 +0800
Message-Id: <20220717053207.192372-4-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717053207.192372-1-fengnanchang@gmail.com>
References: <20220717053207.192372-1-fengnanchang@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Fengnan Chang Try to support compressed file write and
 amplifiction accounting. Signed-off-by: Fengnan Chang --- fs/f2fs/data.c
 | 26 +++++++++++++++++++++----- fs/f2fs/debug.c | 7 +++++-- fs/f2fs/f2fs.h
 | 34 ++++++++++++++++++++++++++++++++++ 3 files changed, 60 insertions(+),
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fengnanchang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oCwtV-0000ML-KY
Subject: [f2fs-dev] [PATCH v3 3/3] f2fs: support compressed file write/read
 amplifiction
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Fengnan Chang <changfengnan@vivo.com>

Try to support compressed file write and amplifiction accounting.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c  | 26 +++++++++++++++++++++-----
 fs/f2fs/debug.c |  7 +++++--
 fs/f2fs/f2fs.h  | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2d2cfd54210..d0532958835b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2132,7 +2132,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	struct extent_info ei = {0, };
 	bool from_dnode = true;
 	int i;
-	int ret = 0;
+	int ret = 0, nr_cache_hit = 0;
 
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
@@ -2223,6 +2223,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
 			if (atomic_dec_and_test(&dic->remaining_pages))
 				f2fs_decompress_cluster(dic);
+			nr_cache_hit++;
 			continue;
 		}
 
@@ -2261,6 +2262,15 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		*last_block_in_bio = blkaddr;
 	}
 
+	if (cc->nr_cpages - nr_cache_hit > cc->nr_rpages)
+		f2fs_i_compr_ra_blocks_update(inode,
+				cc->nr_cpages - nr_cache_hit - cc->nr_rpages,
+				true);
+	else
+		f2fs_i_compr_ra_blocks_update(inode,
+				cc->nr_rpages - cc->nr_cpages + nr_cache_hit,
+				false);
+
 	if (from_dnode)
 		f2fs_put_dnode(&dn);
 
@@ -2929,11 +2939,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int range_whole = 0;
 	xa_mark_t tag;
 	int nwritten = 0;
-	int submitted = 0;
+	int submitted = 0, raw_dirty_pages = 0;
 	int i;
 
-	if (get_dirty_pages(mapping->host) <=
-				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
+	raw_dirty_pages = get_dirty_pages(mapping->host);
+	if (raw_dirty_pages <= SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
 	else
 		clear_inode_flag(mapping->host, FI_HOT_DATA);
@@ -3067,7 +3077,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 #endif
 			nwritten += submitted;
 			wbc->nr_to_write -= submitted;
-
 			if (unlikely(ret)) {
 				/*
 				 * keep nr_to_write, since vfs uses this to
@@ -3133,6 +3142,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (bio)
 		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
 
+	if (f2fs_compressed_file(inode)) {
+		if (nwritten > raw_dirty_pages)
+			f2fs_i_compr_wa_blocks_update(inode, nwritten - raw_dirty_pages, true);
+		else
+			f2fs_i_compr_wa_blocks_update(inode, raw_dirty_pages - nwritten, false);
+	}
 	return ret;
 }
 
@@ -3482,6 +3497,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 			err = ret;
 			goto fail;
 		} else if (ret) {
+			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
 			return 0;
 		}
 	}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c92625ef16d0..2bbf7fa49097 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -136,6 +136,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->inline_dir = atomic_read(&sbi->inline_dir);
 	si->compr_inode = atomic_read(&sbi->compr_inode);
 	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
+	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
+	si->compr_ra_blocks = atomic64_read(&sbi->compr_ra_blocks);
 	si->append = sbi->im[APPEND_INO].ino_num;
 	si->update = sbi->im[UPDATE_INO].ino_num;
 	si->orphans = sbi->im[ORPHAN_INO].ino_num;
@@ -383,8 +385,9 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->inline_inode);
 		seq_printf(s, "  - Inline_dentry Inode: %u\n",
 			   si->inline_dir);
-		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
-			   si->compr_inode, si->compr_blocks);
+		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld, RA Blocks %lld\n",
+			   si->compr_inode, si->compr_blocks,
+			   si->compr_wa_blocks, si->compr_ra_blocks);
 		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
 			   si->orphans, si->append, si->update);
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 06d0370fd760..9d0429e91718 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1749,6 +1749,8 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
+	atomic64_t compr_ra_blocks;		/* # of compressed RA blocks */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
@@ -3829,6 +3831,8 @@ struct f2fs_stat_info {
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
+	long long compr_wa_blocks;
+	long long compr_ra_blocks;
 	int aw_cnt, max_aw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
 	unsigned int bimodal, avg_vblocks;
@@ -3916,6 +3920,14 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
 #define stat_sub_compr_blocks(inode, blocks)				\
 		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
+#define stat_add_compr_wa_blocks(inode, blocks)				\
+	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
+#define stat_sub_compr_wa_blocks(inode, blocks)				\
+	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
+#define stat_add_compr_ra_blocks(inode, blocks)				\
+	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
+#define stat_sub_compr_ra_blocks(inode, blocks)				\
+	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
 #define stat_inc_meta_count(sbi, blkaddr)				\
 	do {								\
 		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
@@ -4000,6 +4012,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_dec_compr_inode(inode)			do { } while (0)
 #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
+#define stat_add_compr_wa_blocks(inode, blocks)		do { } while (0)
+#define stat_sub_compr_wa_blocks(inode, blocks)		do { } while (0)
+#define stat_add_compr_ra_blocks(inode, blocks)		do { } while (0)
+#define stat_sub_compr_ra_blocks(inode, blocks)		do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
@@ -4428,6 +4444,24 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
+static inline void f2fs_i_compr_wa_blocks_update(struct inode *inode,
+						u64 blocks, bool add)
+{
+	if (add)
+		stat_add_compr_wa_blocks(inode, blocks);
+	else
+		stat_sub_compr_wa_blocks(inode, blocks);
+}
+
+static inline void f2fs_i_compr_ra_blocks_update(struct inode *inode,
+						u64 blocks, bool add)
+{
+	if (add)
+		stat_add_compr_ra_blocks(inode, blocks);
+	else
+		stat_sub_compr_ra_blocks(inode, blocks);
+}
+
 static inline int block_unaligned_IO(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
