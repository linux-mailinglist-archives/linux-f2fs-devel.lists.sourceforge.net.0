Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4632AAFC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 21:05:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHBGv-0006q4-66; Tue, 02 Mar 2021 20:05:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lHBGi-0006ox-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/7E2Ynz3RwXOxU0zaLTinAWcLRgNY1bBsWy9+VcIHM=; b=F2EENl8OqsJ+dvR7GCnwSOGL9Z
 2nz2Nsnpbz1dHMXRfoakanbYE1imsOiXY1wI6m0kyOk14ZVUcCBjMkNjuL5iEerAUaUA5s2rYk1C2
 BkzK9ykprqMhxs/HaAloCXmnhtyV1ZsZcO812S8ZPnvdi11M+hsmUOgFJLQEi7Bw4kB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N/7E2Ynz3RwXOxU0zaLTinAWcLRgNY1bBsWy9+VcIHM=; b=dvVt0ePdfJdpltmV91K54mzccY
 XL1hg64SxNQuGvnaVu0NcLdDUtRvnvr5U8VxZdl/ThFuIWvKQrlwes56Ionta/vqA1AunLk5MdfD0
 YAr72Z4a1iHq05JVxRo1WxCrYHS3Z55svVPviHk5fWCQTgr9HMPSVRBvidLAdUcNGCVA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lHBGX-00Be2D-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:05:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CF6164F21;
 Tue,  2 Mar 2021 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614715504;
 bh=PsxMo4HzObRVzmAihudWFkfU25b1OePLRuCHAZt3lws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gFYkSokSkZIrOsAhufSj4OgDGiZzR1QFqw6ap7Q8lsdWmzsGRrm8FoKp4gA60lJcp
 mPW8rZYuJQlmL7QpSElzGmJ5ikWWo6rNVZvfm0eFqML5xylkOrq4XWgt0/zxFZM2/M
 v1GR4H0YUyQb7pBds78dOcYpSyi9ffAnm2Wjv75UUIpTN74QHFX06e34cvRhC+JJEo
 q8v/BnsoP+QZdjN9ZZiNAxnc1a5LIaaWYyEwtCsGBju9Bnlx/s/5MY6nzMrtpfqqrR
 bV7j415NAb9Jq/xdjU/nSBcAxBT0enq51G2Hv3tb68MnP4TxLAX8IVg86vMwT9Rs5M
 4B/dWwkV/klVw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  2 Mar 2021 12:04:19 -0800
Message-Id: <20210302200420.137977-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302200420.137977-1-ebiggers@kernel.org>
References: <20210302200420.137977-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHBGX-00Be2D-Tc
Subject: [f2fs-dev] [PATCH 1/2] ext4: fix error handling in
 ext4_end_enable_verity()
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
Cc: linux-fscrypt@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

ext4 didn't properly clean up if verity failed to be enabled on a file:

- It left verity metadata (pages past EOF) in the page cache, which
  would be exposed to userspace if the file was later extended.

- It didn't truncate the verity metadata at all (either from cache or
  from disk) if an error occurred while setting the verity bit.

Fix these bugs by adding a call to truncate_inode_pages() and ensuring
that we truncate the verity metadata (both from cache and from disk) in
all error paths.  Also rework the code to cleanly separate the success
path from the error paths, which makes it much easier to understand.

Reported-by: Yunlei He <heyunlei@hihonor.com>
Fixes: c93d8f885809 ("ext4: add basic fs-verity support")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/verity.c | 90 ++++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 34 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 5b7ba8f711538..acb12441c549b 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -201,55 +201,77 @@ static int ext4_end_enable_verity(struct file *filp, const void *desc,
 	struct inode *inode = file_inode(filp);
 	const int credits = 2; /* superblock and inode for ext4_orphan_del() */
 	handle_t *handle;
+	struct ext4_iloc iloc;
 	int err = 0;
-	int err2;
 
-	if (desc != NULL) {
-		/* Succeeded; write the verity descriptor. */
-		err = ext4_write_verity_descriptor(inode, desc, desc_size,
-						   merkle_tree_size);
-
-		/* Write all pages before clearing VERITY_IN_PROGRESS. */
-		if (!err)
-			err = filemap_write_and_wait(inode->i_mapping);
-	}
+	/*
+	 * If an error already occurred (which fs/verity/ signals by passing
+	 * desc == NULL), then only clean-up is needed.
+	 */
+	if (desc == NULL)
+		goto cleanup;
 
-	/* If we failed, truncate anything we wrote past i_size. */
-	if (desc == NULL || err)
-		ext4_truncate(inode);
+	/* Append the verity descriptor. */
+	err = ext4_write_verity_descriptor(inode, desc, desc_size,
+					   merkle_tree_size);
+	if (err)
+		goto cleanup;
 
 	/*
-	 * We must always clean up by clearing EXT4_STATE_VERITY_IN_PROGRESS and
-	 * deleting the inode from the orphan list, even if something failed.
-	 * If everything succeeded, we'll also set the verity bit in the same
-	 * transaction.
+	 * Write all pages (both data and verity metadata).  Note that this must
+	 * happen before clearing EXT4_STATE_VERITY_IN_PROGRESS; otherwise pages
+	 * beyond i_size won't be written properly.  For crash consistency, this
+	 * also must happen before the verity inode flag gets persisted.
 	 */
+	err = filemap_write_and_wait(inode->i_mapping);
+	if (err)
+		goto cleanup;
 
-	ext4_clear_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
+	/*
+	 * Finally, set the verity inode flag and remove the inode from the
+	 * orphan list (in a single transaction).
+	 */
 
 	handle = ext4_journal_start(inode, EXT4_HT_INODE, credits);
 	if (IS_ERR(handle)) {
-		ext4_orphan_del(NULL, inode);
-		return PTR_ERR(handle);
+		err = PTR_ERR(handle);
+		goto cleanup;
 	}
 
-	err2 = ext4_orphan_del(handle, inode);
-	if (err2)
-		goto out_stop;
+	err = ext4_orphan_del(handle, inode);
+	if (err)
+		goto stop_and_cleanup;
 
-	if (desc != NULL && !err) {
-		struct ext4_iloc iloc;
+	err = ext4_reserve_inode_write(handle, inode, &iloc);
+	if (err)
+		goto stop_and_cleanup;
+
+	ext4_set_inode_flag(inode, EXT4_INODE_VERITY);
+	ext4_set_inode_flags(inode, false);
+	err = ext4_mark_iloc_dirty(handle, inode, &iloc);
+	if (err)
+		goto stop_and_cleanup;
 
-		err = ext4_reserve_inode_write(handle, inode, &iloc);
-		if (err)
-			goto out_stop;
-		ext4_set_inode_flag(inode, EXT4_INODE_VERITY);
-		ext4_set_inode_flags(inode, false);
-		err = ext4_mark_iloc_dirty(handle, inode, &iloc);
-	}
-out_stop:
 	ext4_journal_stop(handle);
-	return err ?: err2;
+
+	ext4_clear_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
+	return 0;
+
+
+stop_and_cleanup:
+	ext4_journal_stop(handle);
+cleanup:
+	/*
+	 * Verity failed to be enabled, so clean up by truncating any verity
+	 * metadata that was written beyond i_size (both from cache and from
+	 * disk), removing the inode from the orphan list (if it wasn't done
+	 * already), and clearing EXT4_STATE_VERITY_IN_PROGRESS.
+	 */
+	truncate_inode_pages(inode->i_mapping, inode->i_size);
+	ext4_truncate(inode);
+	ext4_orphan_del(NULL, inode);
+	ext4_clear_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
+	return err;
 }
 
 static int ext4_get_verity_descriptor_location(struct inode *inode,
-- 
2.30.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
