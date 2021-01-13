Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E322F4F6D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jan 2021 17:05:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzidp-0006j0-TS; Wed, 13 Jan 2021 16:05:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kzidp-0006ih-5f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 16:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZiyW2KnAzBVjk8reHZF2zmJ3+cCn/DQhY7Q9nbixzNE=; b=QdVG+e2a7CTtXGCRV+FnCIhVWY
 YqyCvudYJBJMTvQ7rFTw/RKnah7El2oOkMIZopAkNZptanQhyGW6zvCx7uMJpdJc8L9RVdcJWPxbk
 CuccGrAl02JCwkTn/BgCanqw5gg+e/WgIXIFepYkgjJoPawJU8Qym+oay4O9uKRajqWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZiyW2KnAzBVjk8reHZF2zmJ3+cCn/DQhY7Q9nbixzNE=; b=a9akmSZnUZ9Z1HaPuuydjCOE5K
 3ajUD1Rvdlo3V/sBJzZPHKPc8WqGjiJJs8ouTAPEQYXtoWCIXWu04BbQgm2NGmF6xLYcBF+BX5vRI
 Pm28MPOvLnCvqwtzflBe/pCNFKgHzLJF/iGQs0q0dODZREpkEp0Gy7ly5qHzhAei+3fQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzidm-009rgo-0L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 16:05:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0200123434;
 Wed, 13 Jan 2021 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610553892;
 bh=/s5GLa59Wm2saeKMwIZ9CnR8DgfTswMn/suBiLQsApE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7ykmZfkXXo7bf+b+WBI2S/NhwNGm3/eu/9Hms5wXua6PaNvNl7NXYEtztqENlGHI
 7aO2WXUJhLANW+sbE5fwXhmmB8ur6D+xlo8R/I/S45SJumaCnT8U5IeexSgK1R2pLL
 87YBJNubmLhdLfl/GogIIEamTOp2uYfxUx1fc7tVMI4gudqXBy15EX03LDh6GZouD+
 PZMjigZod0WYd6ybCLrm1k6W5mrEgpNu/WXDAzPhCq5dpVxODyEbkRxHkd2fFYVWD6
 tQRGQUIWyJPiMCsDfLIIVIhXGB8Lbb/9+z97T39Xm+P19WmH4UO+G5Nt19TxCdZrDv
 eF1e4SLknzZgQ==
Date: Wed, 13 Jan 2021 08:04:50 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <X/8aIodMExFPHwzx@google.com>
References: <20210113095853.30646-1-jack.qiu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113095853.30646-1-jack.qiu@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzidm-009rgo-0L
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unused stat_{inc,
 dec}_atomic_write
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

On 01/13, Jack Qiu wrote:
> Just clean code, no logical change.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>  fs/f2fs/f2fs.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bb11759191dc..331e222371a3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3715,8 +3715,6 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>  #define stat_dec_compr_inode(inode)			do { } while (0)
>  #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
>  #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
> -#define stat_inc_atomic_write(inode)			do { } while (0)
> -#define stat_dec_atomic_write(inode)			do { } while (0)
>  #define stat_update_max_atomic_write(inode)		do { } while (0)
>  #define stat_inc_volatile_write(inode)			do { } while (0)
>  #define stat_dec_volatile_write(inode)			do { } while (0)
> --
> 2.17.1


Ah, it seems we need to revert the below patch.

Sahitya, have you seen any issue with that counter? I had to be careful before
merging that patch tho, that counter indicted # of active IOs, not # of files.

From 4b3245a1dceb550ad643a3ecd831a3147d1a6f9f Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 13 Jan 2021 07:49:11 -0800
Subject: [PATCH] Revert "f2fs: cleanup duplicate stats for atomic files"

This reverts commit 0e6d01643c207fdcd77b9b40c29cbe1c63f03c15.

The counter meant # of atomic writes on the fly.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c   | 3 ++-
 fs/f2fs/f2fs.h    | 7 ++++++-
 fs/f2fs/file.c    | 1 +
 fs/f2fs/segment.c | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 197c914119da..f55d64ce61d6 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -92,7 +92,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->nquota_files = sbi->nquota_files;
 	si->ndirty_all = sbi->ndirty_inode[DIRTY_META];
 	si->inmem_pages = get_pages(sbi, F2FS_INMEM_PAGES);
-	si->aw_cnt = sbi->atomic_files;
+	si->aw_cnt = atomic_read(&sbi->aw_cnt);
 	si->vw_cnt = atomic_read(&sbi->vw_cnt);
 	si->max_aw_cnt = atomic_read(&sbi->max_aw_cnt);
 	si->max_vw_cnt = atomic_read(&sbi->max_vw_cnt);
@@ -556,6 +556,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
 
+	atomic_set(&sbi->aw_cnt, 0);
 	atomic_set(&sbi->vw_cnt, 0);
 	atomic_set(&sbi->max_aw_cnt, 0);
 	atomic_set(&sbi->max_vw_cnt, 0);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 63852404151e..88356dbe7540 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1549,6 +1549,7 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic_t aw_cnt;			/* # of atomic writes */
 	atomic_t vw_cnt;			/* # of volatile writes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	atomic_t max_vw_cnt;			/* max # of volatile writes */
@@ -3670,9 +3671,13 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		((sbi)->block_count[(curseg)->alloc_type]++)
 #define stat_inc_inplace_blocks(sbi)					\
 		(atomic_inc(&(sbi)->inplace_count))
+#define stat_inc_atomic_write(inode)					\
+		(atomic_inc(&F2FS_I_SB(inode)->aw_cnt))
+#define stat_dec_atomic_write(inode)					\
+		(atomic_dec(&F2FS_I_SB(inode)->aw_cnt))
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
-		int cur = F2FS_I_SB(inode)->atomic_files;	\
+		int cur = atomic_read(&F2FS_I_SB(inode)->aw_cnt);	\
 		int max = atomic_read(&F2FS_I_SB(inode)->max_aw_cnt);	\
 		if (cur > max)						\
 			atomic_set(&F2FS_I_SB(inode)->max_aw_cnt, cur);	\
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e3a5b620b50a..c6e96c094b29 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2077,6 +2077,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 	F2FS_I(inode)->inmem_task = current;
+	stat_inc_atomic_write(inode);
 	stat_update_max_atomic_write(inode);
 out:
 	inode_unlock(inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index deca74cb17df..7fbb2a31bd01 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -335,6 +335,7 @@ void f2fs_drop_inmem_pages(struct inode *inode)
 	}
 
 	fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
+	stat_dec_atomic_write(inode);
 
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	if (!list_empty(&fi->inmem_ilist))
-- 
2.30.0.284.gd98b1dd5eaa7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
