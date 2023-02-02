Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9E0687626
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 08:05:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNTeu-0004AR-GX;
	Thu, 02 Feb 2023 07:05:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNTeo-0004AG-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PlWT0BRVXGKVf4mn3FY7NPB4XWi7tzSgkPAzbFtdEKU=; b=fEf1KE3ljK9ISK5ODmYdQnHJmS
 g/mjejBPe2DeL3ypvWmQvMpo5ldzzQE/rK50DTmojXf/onDvN0J6eD+sXsIFpfAK2/B4imqUPIc4b
 To+dVBm0+TeICnAJQnFnAE+RQY28N2ixc21pEqcg/A62h4CBjSORdmQEZvh8sik27ZGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PlWT0BRVXGKVf4mn3FY7NPB4XWi7tzSgkPAzbFtdEKU=; b=F
 qU5sUTQHaduiaFbiuWqJvDSUwWLgfBp+uSNNwQ66e9We/ul/qng+NQB5wEvDtdLbl+j3NxrEct8qH
 gjuoPhJB8c+VGmCpGbzDenaGoM5FKAQQNVDFQDZhjjSZHCc6+KHVXZv6v4SNQaoSXAb8tZLFY4XXX
 oXQlp3DeiVK+RLqg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNTej-008Cae-JB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:05:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C498616B5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Feb 2023 07:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409DAC433EF;
 Thu,  2 Feb 2023 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675321504;
 bh=spz4N6sCw9hhmUb6uOiJtIQS8QBXV5UoUx7b0eE9mcM=;
 h=From:To:Cc:Subject:Date:From;
 b=c1uqad9XUYW8PkyFj2NlyPYqIpM5+WO9cRBCO8kkpoZjAsHTN4YPAAiqLV7Y5C739
 EphFYhPyyAqePF9k19m29poxZ8Stv+BktEtoQWmI85MRiBVHUvY/YIEc9OZ9nfWt0m
 xjsAa9A8ffBWNxfxyvzdPWjsRVNi8cJ6YBWc9V4sQ71uE7INssbj7fDKnYi/XAntIA
 9jtFqsedfi7q3X/wiKma/6DCWoi6vEVaFyivfJIYXYEHDSEdUtWhcSIF8x4H4sF0I5
 iMnKotqnY8AKVfvekNoPqmPIMH8dgAcguD0ZA3HMpw8+CXTUGRtPTXF2wAH3TkwGF1
 IMfJDLtEtg6+w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  2 Feb 2023 15:04:56 +0800
Message-Id: <20230202070456.3497513-1-chao@kernel.org>
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
 improve memory usage. struct f2fs_io_info { ... unsigned int need_lock:8;
 /* indicate we need to lock cp_rwsem */ unsigned int version:8; /* version
 of the node */ unsigned int submitted:1; /* indicate IO submission */ uns
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNTej-008Cae-JB
Subject: [f2fs-dev] [PATCH v3] f2fs: reduce stack memory cost by using
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
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch tries to use bitfield in struct f2fs_io_info to improve
memory usage.

struct f2fs_io_info {
...
	unsigned int need_lock:8;	/* indicate we need to lock cp_rwsem */
	unsigned int version:8;		/* version of the node */
	unsigned int submitted:1;	/* indicate IO submission */
	unsigned int in_list:1;		/* indicate fio is in io_list */
	unsigned int is_por:1;		/* indicate IO is from recovery or not */
	unsigned int retry:1;		/* need to reallocate block address */
	unsigned int encrypted:1;	/* indicate file is encrypted */
	unsigned int post_read:1;	/* require post read */
...
};

After this patch, size of struct f2fs_io_info reduces from 136 to 120.

[Nathan: fix a compile warning (single-bit-bitfield-constant-conversion)]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- merge Nathan's patch which fixes a compile warning (single-bit-bitfield-
constant-conversion).
 fs/f2fs/checkpoint.c |  6 +++---
 fs/f2fs/compress.c   |  5 +++--
 fs/f2fs/data.c       | 10 +++++-----
 fs/f2fs/f2fs.h       | 18 +++++++++---------
 fs/f2fs/gc.c         |  8 ++++----
 fs/f2fs/node.c       |  2 +-
 fs/f2fs/segment.c    |  6 +++---
 7 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 641165c82992..5c481824a4c6 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -70,7 +70,7 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 		.old_blkaddr = index,
 		.new_blkaddr = index,
 		.encrypted_page = NULL,
-		.is_por = !is_meta,
+		.is_por = !is_meta ? 1 : 0,
 	};
 	int err;
 
@@ -237,8 +237,8 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
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
index b196b881f3bb..a469cdde6bac 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1213,10 +1213,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
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
index c940da1c540f..754841bce389 100644
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
@@ -2776,10 +2776,10 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
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
@@ -2900,7 +2900,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	}
 
 	if (submitted)
-		*submitted = fio.submitted ? 1 : 0;
+		*submitted = fio.submitted;
 
 	return 0;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f3c5f7740c1a..5449c8277339 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1210,19 +1210,19 @@ struct f2fs_io_info {
 	struct page *encrypted_page;	/* encrypted page */
 	struct page *compressed_page;	/* compressed page */
 	struct list_head list;		/* serialize IOs */
-	bool submitted;		/* indicate IO submission */
-	int need_lock;		/* indicate we need to lock cp_rwsem */
-	bool in_list;		/* indicate fio is in io_list */
-	bool is_por;		/* indicate IO is from recovery or not */
-	bool retry;		/* need to reallocate block address */
-	int compr_blocks;	/* # of compressed block addresses */
-	bool encrypted;		/* indicate file is encrypted */
-	bool post_read;		/* require post read */
+	unsigned int compr_blocks;	/* # of compressed block addresses */
+	unsigned int need_lock:8;	/* indicate we need to lock cp_rwsem */
+	unsigned int version:8;		/* version of the node */
+	unsigned int submitted:1;	/* indicate IO submission */
+	unsigned int in_list:1;		/* indicate fio is in io_list */
+	unsigned int is_por:1;		/* indicate IO is from recovery or not */
+	unsigned int retry:1;		/* need to reallocate block address */
+	unsigned int encrypted:1;	/* indicate file is encrypted */
+	unsigned int post_read:1;	/* require post read */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */
 	sector_t *last_block;		/* last block number in bio */
-	unsigned char version;		/* version of the node */
 };
 
 struct bio_entry {
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 97e846263c7c..0a9dfa459860 100644
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
index f46a8c0daeb3..69b01b5c0ce0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3314,10 +3314,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
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
@@ -3398,7 +3398,7 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
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
