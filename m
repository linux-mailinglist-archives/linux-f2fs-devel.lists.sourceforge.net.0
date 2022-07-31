Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF9585D14
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Jul 2022 05:34:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oHzij-0005A9-J9; Sun, 31 Jul 2022 03:34:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1oHzii-00059p-AT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jul 2022 03:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=guG0oBRavb6xbHov94qCa4u+vc0FBgyCh+0qYgGNQ5A=; b=Ea9hgMVvnXwArVZNwt1cJp6HbM
 54KrVcJ+hOG2FMi5/rnEg9c12K8b5dMA+z5byc8pKnsQD4kD+02OGPTBjht9bANWzPfTlKy4jtYtl
 ITBWFdVVGLI9hETgM9bMBN3u3BF2+d+cp18OWx3cSSuDKAXjPtLnA4ALg203OKu9UL4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=guG0oBRavb6xbHov94qCa4u+vc0FBgyCh+0qYgGNQ5A=; b=KOUaeKwTEYVJqaIAf6SilwKJjB
 PYm2iLejW8/Ck+wD7MiHRNTaa6ZJh77IIs+8SMO8b/pbSWSirIqpFu1O2u4wLRktu4wJfyAU/+5Jo
 4cTXDw3S6bX5TkAF3CgExdnrCBAdJ5RP8wKJDVacJGolZtxSWQV35SpkJgIZXZopWhzI=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oHzii-00FdID-72
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jul 2022 03:34:24 +0000
Received: by mail-pf1-f182.google.com with SMTP id y141so7779586pfb.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Jul 2022 20:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guG0oBRavb6xbHov94qCa4u+vc0FBgyCh+0qYgGNQ5A=;
 b=AkMi4FE24nkiG1d3lQ3bDb/qWVKVQhAD+jk3Zz5M9Hlc7YtAMOfWu5nPBnOg0VbEVI
 QPKylt3WFMySR9uUSN2at48CZs0OakmGVZa4bjJiFuBnC1l5vAQLwxNgchv5B27nbd9I
 gkBasmkrg9AwheMlqSKS3v2sYT52fmzDTqxkbUwysL6kLuvJvZ9zu4B5+Gk5gj+02aHN
 cPAaDMpbFHnhMftlHLwx1kIMfoKkxPutgVMzCNySD2JE0I9XqqBTQ6jg67oisfAwP5i6
 VcRND1VuLkkHCAuOMVGbW0pghVgmFunA+HhrqQJU7+hYLgP483Q4VdlCqgLYgZHMZJ16
 DXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guG0oBRavb6xbHov94qCa4u+vc0FBgyCh+0qYgGNQ5A=;
 b=omaQo7HUiEDsOJ3faOdzFmr6EFVfkgMs9Gdqi6oq579/Ip2MmnM6MH/2XrpQygQuam
 PS49AIDjXRsft5HFnIDUiK7N/WKmDpIvh641n2HVTISJUtIQeBkrSHScLBhbNZqaLNeK
 To3cXaYhezmsnua4mYKGhyWgY8OCDeSpG0bfuq1hKBk4V91Pc48CsctgZJbzA5LdxSLs
 dEPY7fBdBYo8zqxzVKQVCEMNbOyIBuR/cMkgfnYkSCJ9P5/CokZ3tQnIVvFNOA/pKz01
 R7lNSJQKMPr0odbExV9oMPhnfSQoRUcHiSO6UTfU50E3POoWqkb0wfc67sXZke+cH8/f
 1Q/w==
X-Gm-Message-State: AJIora/EkMGWng22EwRyz73LoI6F5WiaG4C0Fs32F3918Rk0WcOW5KW1
 DWrzj2c+JywsUT6w+T8ekQ/9uUx/gx0=
X-Google-Smtp-Source: AGRyM1t+9hnjagxxo08v5+5Z52tvEj6lgEv5tVjTGawrFzv1t/aErBDfskjPBhYIpvQ8IvesMG1ntw==
X-Received: by 2002:a05:6a00:181c:b0:52a:bc83:d767 with SMTP id
 y28-20020a056a00181c00b0052abc83d767mr10244582pfa.76.1659238458605; 
 Sat, 30 Jul 2022 20:34:18 -0700 (PDT)
Received: from localhost.localdomain ([103.215.126.52])
 by smtp.googlemail.com with ESMTPSA id
 e10-20020a63500a000000b0040dd052ab11sm5026631pgb.58.2022.07.30.20.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 20:34:17 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 31 Jul 2022 11:33:47 +0800
Message-Id: <20220731033347.455209-4-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731033347.455209-1-fengnanchang@gmail.com>
References: <20220731033347.455209-1-fengnanchang@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Try to support compressed file write and amplifiction
 accounting.
 Signed-off-by: Fengnan Chang --- fs/f2fs/compress.c | 7 +++++-- fs/f2fs/data.c
 | 44 ++++++++++++++++++++++++++++++++++++-------- fs/f2fs/debug.c | 7 +++++--
 fs/f2fs/f2fs.h | 36 +++++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fengnanchang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oHzii-00FdID-72
Subject: [f2fs-dev] [PATCH v4 3/3] f2fs: support compressed file write/read
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Try to support compressed file write and amplifiction accounting.

Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
---
 fs/f2fs/compress.c |  7 +++++--
 fs/f2fs/data.c     | 44 ++++++++++++++++++++++++++++++++++++--------
 fs/f2fs/debug.c    |  7 +++++--
 fs/f2fs/f2fs.h     | 36 +++++++++++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 0eca4e060deb..374d4a73ab2c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1125,7 +1125,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	sector_t last_block_in_bio;
 	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
-	int i, ret;
+	int i, ret, once_read = 0;
 
 retry:
 	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
@@ -1155,13 +1155,16 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		struct bio *bio = NULL;
 
 		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
-					&last_block_in_bio, false, true);
+					&last_block_in_bio, false, true, &once_read);
 		f2fs_put_rpages(cc);
 		f2fs_destroy_compress_ctx(cc, true);
 		if (ret)
 			goto out;
 		if (bio)
 			f2fs_submit_bio(sbi, bio, DATA);
+		/* All need read page in here is read amplification */
+		if (once_read)
+			f2fs_i_compr_ra_blocks_update(cc->inode, once_read, true);
 
 		ret = f2fs_init_compress_ctx(cc);
 		if (ret)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0b159c555069..9bedcea189eb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2133,7 +2133,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				unsigned nr_pages, sector_t *last_block_in_bio,
-				bool is_readahead, bool for_write)
+				bool is_readahead, bool for_write, int *nr_need_read)
 {
 	struct dnode_of_data dn;
 	struct inode *inode = cc->inode;
@@ -2146,7 +2146,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	struct extent_info ei = {0, };
 	bool from_dnode = true;
 	int i;
-	int ret = 0;
+	int ret = 0, nr_cache_hit = 0;
+
+	if (nr_need_read)
+		*nr_need_read = 0;
 
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
@@ -2237,6 +2240,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
 			if (atomic_dec_and_test(&dic->remaining_pages))
 				f2fs_decompress_cluster(dic, true);
+			nr_cache_hit++;
 			continue;
 		}
 
@@ -2275,6 +2279,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		*last_block_in_bio = blkaddr;
 	}
 
+	/* we need read whole cluster when nr_cache_hit less than nr_cpages */
+	if (nr_need_read && nr_cache_hit < cc->nr_cpages)
+		*nr_need_read = cc->nr_cpages;
+
 	if (from_dnode)
 		f2fs_put_dnode(&dn);
 
@@ -2322,7 +2330,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
-	int ret = 0;
+	int ret = 0, once_read = 0, total_read = 0, single_read = 0;
 
 	map.m_pblk = 0;
 	map.m_lblk = 0;
@@ -2346,10 +2354,11 @@ static int f2fs_mpage_readpages(struct inode *inode,
 				ret = f2fs_read_multi_pages(&cc, &bio,
 							max_nr_pages,
 							&last_block_in_bio,
-							rac != NULL, false);
+							rac != NULL, false, &once_read);
 				f2fs_destroy_compress_ctx(&cc, false);
 				if (ret)
 					goto set_error_page;
+				total_read += once_read;
 			}
 			if (cc.cluster_idx == NULL_CLUSTER) {
 				if (nc_cluster_idx ==
@@ -2389,6 +2398,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 			zero_user_segment(page, 0, PAGE_SIZE);
 			unlock_page(page);
 		}
+		single_read++;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 next_page:
 #endif
@@ -2402,12 +2412,23 @@ static int f2fs_mpage_readpages(struct inode *inode,
 				ret = f2fs_read_multi_pages(&cc, &bio,
 							max_nr_pages,
 							&last_block_in_bio,
-							rac != NULL, false);
+							rac != NULL, false, &once_read);
 				f2fs_destroy_compress_ctx(&cc, false);
+				if (!ret)
+					total_read += once_read;
 			}
 		}
 #endif
 	}
+	max_nr_pages -= single_read;
+	if (total_read > max_nr_pages)
+		f2fs_i_compr_ra_blocks_update(inode,
+						total_read - max_nr_pages,
+						true);
+	else
+		f2fs_i_compr_ra_blocks_update(inode,
+						max_nr_pages - total_read,
+						false);
 	if (bio)
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
@@ -2944,11 +2965,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
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
@@ -3148,6 +3169,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
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
 
@@ -3498,6 +3525,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 			err = ret;
 			goto fail;
 		} else if (ret) {
+			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
 			return 0;
 		}
 	}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c01471573977..e6b943edba91 100644
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
index 955dbf4f83ad..c549be2e75af 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1761,6 +1761,8 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
+	atomic64_t compr_ra_blocks;		/* # of compressed RA blocks */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
@@ -3859,6 +3861,8 @@ struct f2fs_stat_info {
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
+	long long compr_wa_blocks;
+	long long compr_ra_blocks;
 	int aw_cnt, max_aw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
 	unsigned int bimodal, avg_vblocks;
@@ -3946,6 +3950,14 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
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
@@ -4030,6 +4042,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
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
@@ -4209,7 +4225,7 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 				unsigned int c_len);
 int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				unsigned nr_pages, sector_t *last_block_in_bio,
-				bool is_readahead, bool for_write);
+				bool is_readahead, bool for_write, int *nr_need_read);
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
 void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 				bool in_task);
@@ -4465,6 +4481,24 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
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
