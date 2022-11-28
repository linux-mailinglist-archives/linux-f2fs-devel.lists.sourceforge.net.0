Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25063A48C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFI-0005Sg-GV;
	Mon, 28 Nov 2022 09:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFE-0005QM-Eb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4jqHYuOx5OofNR1eP3uZLzZ/MRdlyrAD0Shaqhu8z4Y=; b=jgKX/332tFSUSJJeSmvgecQY2d
 8iPaSu16lF1n7u8wGblqB2RSlSYaUJaxVtZySlTAvtXMXKp30WASoDJvlElKu1QIrZzhKonG+OKS4
 NP3YAKyCQVfvZc70JNmDkoXEvc6vqzCfwNPTJhAnr86RW/YfWbzMvSIqGt3PbBaeEBVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4jqHYuOx5OofNR1eP3uZLzZ/MRdlyrAD0Shaqhu8z4Y=; b=lELNyr9keNZABLaWqH5tSxhcMm
 qcK/nAvPefsnFiSsRfAh++/vx2b5+qAp8OyeWROoclYIGixwgs75AM16QenyE9cd6YrqhD8V7rLMO
 3VVykT2QAORSy5dyHjl1ORXgFFoQgJebO9x2Pm6AavJGrfhrxe0hil52GpagYNHFJR1A=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaF4-00GRRk-01 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4jqHYuOx5OofNR1eP3uZLzZ/MRdlyrAD0Shaqhu8z4Y=; b=Xwdhw0zt4XCoyWqeeoG90FG8Gz
 MBR/H3EL35LX2Z1vpwdRe/mzNjthBRw7WY5FMrbcZonUW3+CueLpAmGilXUXyZw2WsD9pQPumOcfP
 mXt331wNWXTHDXu6jCgHlknlMbckqcszUNbNdwrjDJFA2nZ41Ps6Rcyz+qsUrNs7tDFUqHMILx1MK
 uEPPbtqPXDgtPBa1/Bqc3cyr+Sk4d/vAs3P+FmGby7/576ZZcc0r04MnpPg8p6/ecB2EYE4TokLFi
 dOJxFIPMmxtrXhYWfeDM+uvnSAZA6OLAt12iMz2eo8CDnvZWCVfw7Jx0ymaV4XqjQme7yqOs52DXz
 c+NFkTUw==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEy-000YwJ-3S; Mon, 28 Nov 2022 09:15:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:17 +0100
Message-Id: <20221128091523.1242584-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Reflow prepare_write_begin so that it reads more straight
 forward,
 and so that there is one place that does an extent cache lookup instead
 of three, two of which are hidden in f2fs_get_block calls. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/f2fs/data.c | 57
 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+), 29 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozaF4-00GRRk-01
Subject: [f2fs-dev] [PATCH 09/15] f2fs: reflow prepare_write_begin
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

Reflow prepare_write_begin so that it reads more straight forward,
and so that there is one place that does an extent cache lookup
instead of three, two of which are hidden in f2fs_get_block calls.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 57 +++++++++++++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b7c8e3e0113aff..fc5207859912ce 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3313,8 +3313,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	struct dnode_of_data dn;
 	struct page *ipage;
 	bool locked = false;
+	int flag = F2FS_GET_BLOCK_PRE_AIO;
 	int err = 0;
-	int flag;
 
 	/*
 	 * If a whole page is being written and we already preallocated all the
@@ -3324,13 +3324,12 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		return 0;
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
-	if (f2fs_has_inline_data(inode) && pos + len > MAX_INLINE_DATA(inode))
-		flag = F2FS_GET_BLOCK_DEFAULT;
-	else
-		flag = F2FS_GET_BLOCK_PRE_AIO;
-
-	if (f2fs_has_inline_data(inode) ||
-			(pos & PAGE_MASK) >= i_size_read(inode)) {
+	if (f2fs_has_inline_data(inode)) {
+		if (pos + len > MAX_INLINE_DATA(inode))
+			flag = F2FS_GET_BLOCK_DEFAULT;
+		f2fs_map_lock(sbi, flag);
+		locked = true;
+	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
@@ -3351,34 +3350,34 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
-		} else {
-			err = f2fs_convert_inline_page(&dn, page);
-			if (err)
-				goto out;
-			if (dn.data_blkaddr == NULL_ADDR)
-				err = f2fs_get_block(&dn, index);
+			goto out;
 		}
-	} else if (locked) {
-		err = f2fs_get_block(&dn, index);
-	} else {
-		if (!f2fs_lookup_extent_cache_block(inode, index,
-				&dn.data_blkaddr)) {
+		err = f2fs_convert_inline_page(&dn, page);
+		if (err || dn.data_blkaddr != NULL_ADDR)
+			goto out;
+	}
+
+	if (!f2fs_lookup_extent_cache_block(inode, index, &dn.data_blkaddr)) {
+		if (!locked) {
 			/* hole case */
 			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
-			if (err || dn.data_blkaddr == NULL_ADDR) {
-				f2fs_put_dnode(&dn);
-				f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
-				WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
-				locked = true;
-				goto restart;
-			}
+			if (!err && dn.data_blkaddr != NULL_ADDR)
+				goto out;
+			f2fs_put_dnode(&dn);
+			f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
+			WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
+			locked = true;
+			goto restart;
 		}
+		err = f2fs_reserve_block(&dn, index);
 	}
 
-	/* convert_inline_page can make node_changed */
-	*blk_addr = dn.data_blkaddr;
-	*node_changed = dn.node_changed;
 out:
+	if (!err) {
+		/* convert_inline_page can make node_changed */
+		*blk_addr = dn.data_blkaddr;
+		*node_changed = dn.node_changed;
+	}
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (locked)
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
