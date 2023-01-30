Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0E68037B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 02:20:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMIqa-0004KS-DD;
	Mon, 30 Jan 2023 01:20:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pMIqZ-0004KM-Ku
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 01:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+YRa0ZSeBgJJDkd+3PQFGOaocJENQUSSMmbVDtONowE=; b=fshhEC4XJD+33b09a3q8LoSecY
 VXdwyij6ssYpfqX8XBRfumWOko/+bhEz2PzW56bPc13milSXjYPqPVwl1mx8I6+J/2UiyYjYzPeIk
 ngCZDEDs2DyTFBmB4Ex6nZImTvqy37h9UR3mb1BMW1v8dd4559Oy57QzlX9ixj8fR/Rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+YRa0ZSeBgJJDkd+3PQFGOaocJENQUSSMmbVDtONowE=; b=H
 0HD1ra1QAFL9x3D0ost5C8iNmUTdWeEL6r+niaER0smDE86ExUPOALEvAzGm5LswlUSjBkYQtoEnD
 ypLNESjEoLi0eR6DSLdoSjB5YltqV0oIk6Mr7kCA/EDR5NQskFfVENZvEC70KMWqGAqIolZBCWSP4
 CrbKbHe9Oijkn21E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMIqX-0031nP-Nc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 01:20:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91547B80D52
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 01:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2E7C433EF;
 Mon, 30 Jan 2023 01:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675041625;
 bh=/LdlnZLafbb8r9iszLz7XEPV/RToyYsM0QbXk0IBXL4=;
 h=From:To:Cc:Subject:Date:From;
 b=Irjh3ataYAzB8xrhAKN9BVrXmZAtrOU+PnAcb7SCd6akfMuXlzh1xbU5zPrCqPm2q
 4x1w9HM0tB/zhXZGrY1G57TYar4P7eqvGS3AXQel3QfICmZMGaHuUQ9CemgoHfb2CX
 T9TQ6ty02gYhMs6j79mWhgKJxLR/0AQLyOE8hWxBCWEPhKv++qgnAmT3jNTNrfV1f5
 XCMGIWQycfzweDgmzjrrJUDxEQc1NJT4FJ7bBen2PsqQ6o+ussCm2x9dUz532Upckf
 zbJRe5rKcYitfhMM4YyKbTIgMRv8dItlW6lxxZJJ41ELYWM/sZaSICMcmkpftk3TYn
 UDZsn3CsLyEjg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 30 Jan 2023 09:20:12 +0800
Message-Id: <20230130012012.2078978-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch tries to use bitfield in struct f2fs_io_info to
 improve memory usage. struct f2fs_io_info { ... int need_lock:8; /* indicate
 we need to lock cp_rwsem */ int version:8; /* version of the node */ int
 submitted:1; /* indicate IO submission */ int in_list:1; /* indicate fio [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMIqX-0031nP-Nc
Subject: [f2fs-dev] [PATCH v2] f2fs: reduce stack memory cost by using
 bitfield in struct f2fs_io_info
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

This patch tries to use bitfield in struct f2fs_io_info to improve
memory usage.

struct f2fs_io_info {
...
	int need_lock:8;	/* indicate we need to lock cp_rwsem */
	int version:8;		/* version of the node */
	int submitted:1;	/* indicate IO submission */
	int in_list:1;		/* indicate fio is in io_list */
	int is_por:1;		/* indicate IO is from recovery or not */
	int retry:1;		/* need to reallocate block address */
	int encrypted:1;	/* indicate file is encrypted */
	int post_read:1;	/* require post read */
...
};

After this patch, size of struct f2fs_io_info reduces from 136 to 120.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix compile warning caused by assigning bool type value to bitfield variable.
 fs/f2fs/checkpoint.c |  6 +++---
 fs/f2fs/compress.c   |  5 +++--
 fs/f2fs/data.c       | 10 +++++-----
 fs/f2fs/f2fs.h       | 16 ++++++++--------
 fs/f2fs/gc.c         |  8 ++++----
 fs/f2fs/node.c       |  2 +-
 fs/f2fs/segment.c    |  6 +++---
 7 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b442e72fcefd..359b245920e1 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -67,7 +67,7 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 		.old_blkaddr = index,
 		.new_blkaddr = index,
 		.encrypted_page = NULL,
-		.is_por = !is_meta,
+		.is_por = !is_meta ? 1 : 0,
 	};
 	int err;
 
@@ -234,8 +234,8 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 		.op = REQ_OP_READ,
 		.op_flags = sync ? (REQ_META | REQ_PRIO) : REQ_RAHEAD,
 		.encrypted_page = NULL,
-		.in_list = false,
-		.is_por = (type == META_POR),
+		.in_list = 0,
+		.is_por = (type == META_POR) ? 1 : 0,
 	};
 	struct blk_plug plug;
 	int err;
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 365ee074d3b3..89b344e28ca6 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1237,10 +1237,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.page = NULL,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
-		.submitted = false,
+		.submitted = 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
-		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode),
+		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode) ?
+									1 : 0,
 	};
 	struct dnode_of_data dn;
 	struct node_info ni;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 04a7bb4d4cdf..bcb88ae84fa8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -992,7 +992,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		bio_page = fio->page;
 
 	/* set submitted = true as a return value */
-	fio->submitted = true;
+	fio->submitted = 1;
 
 	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
 
@@ -1008,7 +1008,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 				(fio->type == DATA || fio->type == NODE) &&
 				fio->new_blkaddr & F2FS_IO_SIZE_MASK(sbi)) {
 			dec_page_count(sbi, WB_DATA_TYPE(bio_page));
-			fio->retry = true;
+			fio->retry = 1;
 			goto skip;
 		}
 		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
@@ -2792,10 +2792,10 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.old_blkaddr = NULL_ADDR,
 		.page = page,
 		.encrypted_page = NULL,
-		.submitted = false,
+		.submitted = 0,
 		.compr_blocks = compr_blocks,
 		.need_lock = LOCK_RETRY,
-		.post_read = f2fs_post_read_required(inode),
+		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.bio = bio,
@@ -2916,7 +2916,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	}
 
 	if (submitted)
-		*submitted = fio.submitted ? 1 : 0;
+		*submitted = fio.submitted;
 
 	return 0;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bd22f8fd09ef..71d864854802 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1212,19 +1212,19 @@ struct f2fs_io_info {
 	struct page *encrypted_page;	/* encrypted page */
 	struct page *compressed_page;	/* compressed page */
 	struct list_head list;		/* serialize IOs */
-	bool submitted;		/* indicate IO submission */
-	int need_lock;		/* indicate we need to lock cp_rwsem */
-	bool in_list;		/* indicate fio is in io_list */
-	bool is_por;		/* indicate IO is from recovery or not */
-	bool retry;		/* need to reallocate block address */
 	int compr_blocks;	/* # of compressed block addresses */
-	bool encrypted;		/* indicate file is encrypted */
-	bool post_read;		/* require post read */
+	int need_lock:8;	/* indicate we need to lock cp_rwsem */
+	int version:8;		/* version of the node */
+	int submitted:1;	/* indicate IO submission */
+	int in_list:1;		/* indicate fio is in io_list */
+	int is_por:1;		/* indicate IO is from recovery or not */
+	int retry:1;		/* need to reallocate block address */
+	int encrypted:1;	/* indicate file is encrypted */
+	int post_read:1;	/* require post read */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */
 	sector_t *last_block;		/* last block number in bio */
-	unsigned char version;		/* version of the node */
 };
 
 struct bio_entry {
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d2f27b15287d..8f2224e1dc61 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1156,8 +1156,8 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		.op = REQ_OP_READ,
 		.op_flags = 0,
 		.encrypted_page = NULL,
-		.in_list = false,
-		.retry = false,
+		.in_list = 0,
+		.retry = 0,
 	};
 	int err;
 
@@ -1245,8 +1245,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		.op = REQ_OP_READ,
 		.op_flags = 0,
 		.encrypted_page = NULL,
-		.in_list = false,
-		.retry = false,
+		.in_list = 0,
+		.retry = 0,
 	};
 	struct dnode_of_data dn;
 	struct f2fs_summary sum;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index fbd1d25fecc2..19a1fee88a36 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1586,7 +1586,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 		.op_flags = wbc_to_write_flags(wbc),
 		.page = page,
 		.encrypted_page = NULL,
-		.submitted = false,
+		.submitted = 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
 	};
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a007f5084e84..660196b52ae5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3344,10 +3344,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		struct f2fs_bio_info *io;
 
 		if (F2FS_IO_ALIGNED(sbi))
-			fio->retry = false;
+			fio->retry = 0;
 
 		INIT_LIST_HEAD(&fio->list);
-		fio->in_list = true;
+		fio->in_list = 1;
 		io = sbi->write_io[fio->type] + fio->temp;
 		spin_lock(&io->io_lock);
 		list_add_tail(&fio->list, &io->io_list);
@@ -3428,7 +3428,7 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
 		.new_blkaddr = page->index,
 		.page = page,
 		.encrypted_page = NULL,
-		.in_list = false,
+		.in_list = 0,
 	};
 
 	if (unlikely(page->index >= MAIN_BLKADDR(sbi)))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
