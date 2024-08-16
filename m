Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C4953ED0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 03:14:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1selXV-0003xq-Nn;
	Fri, 16 Aug 2024 01:14:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1selXT-0003xZ-Uw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 01:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=se+eyrtJ4eGR1KubETxYl+7i/nJX+PS8eTqZzqB+8Ms=; b=bvoSDLxvyhfC3vKEa4isAquZwE
 xz9EUxyBPiVlJsCkCz9zJ7GAZ1r5Hcdic631ozX77WNJaCE9li1vt8mI4bKbn11IvD1BRYau1x1B5
 SHPVp43rrDJ4bFJrZ2L+ANcIiirFtlGgpAB/CIlNeK435Q92unwgp0wTUepp5E8W5aWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=se+eyrtJ4eGR1KubETxYl+7i/nJX+PS8eTqZzqB+8Ms=; b=k
 EYyoQZqYq1+wVv+vobvwLXwgJpFSp59wnw19wnbAAc3qYYWaLngZYyAnhmv9ylDNFBoc2aW2uhjln
 tbRZM5jnty5BCmjJs82sF2PWfnEB64O2SCsfPaxEDPjvXc4EH99nP1dVPX+hcL5SI49KYjMSrcigS
 KOXGvdIck+d+CSHo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1selXT-0005KP-6d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 01:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCB2161479
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2024 01:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B2AC32786;
 Fri, 16 Aug 2024 01:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723770828;
 bh=dqNp+7QcCFd8ngmu/YJqLLqUCV4q4RdV9c4aq2gfp8o=;
 h=From:To:Cc:Subject:Date:From;
 b=jSK9fb93LNBqWP6KNKV29n5TCXTrEJC3QcIRkG0jPUp9xpf5LovWm3wybV4ca0YHL
 BBSRAXt/hphsyUhXcK5qA1Ak1WziNgtOa3BAVl8yyPLonJt3hxgJsVtVZKq5pfXnf5
 tDlhEnx50GtnwU9EE/kaKav2WlD/n02t9/4JskBPjguJD3VKSyWgGtxHVZLfJ81s09
 KDvWCeAynMp+OhQApqu849Arz1iUJ8YzMaT/jLAz9JmJ076l72vVrRjSO0FFG7ppTx
 8bKuDQ+w2OHnRNqYZL1tqL/dvDn42bU3EwiqWKlFRAghsP58mk6HMgN4/Sav7+8kAf
 XyuLzrbAgTnAA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 16 Aug 2024 09:13:42 +0800
Message-Id: <20240816011342.1668666-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  atomic write can only be used via buffered IO, let's fail
 direct IO on atomic_file and return -EOPNOTSUPP. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- v2: - fix error path handling. fs/f2fs/file.c | 36
 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+), 12 deletions(-) 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1selXT-0005KP-6d
Subject: [f2fs-dev] [PATCH v2 4/4] f2fs: atomic: fix to forbid dio in
 atomic_file
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

atomic write can only be used via buffered IO, let's fail direct IO on
atomic_file and return -EOPNOTSUPP.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix error path handling.
 fs/f2fs/file.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6b4f417f3474..b50ebebbbaab 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2162,6 +2162,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		goto out;
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
+	f2fs_down_write(&fi->i_gc_rwsem[READ]);
 
 	/*
 	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
@@ -2171,10 +2172,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=%lu, npages=%u",
 			  inode->i_ino, get_dirty_pages(inode));
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
-	if (ret) {
-		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-		goto out;
-	}
+	if (ret)
+		goto out_unlock;
 
 	/* Check if the inode already has a COW inode */
 	if (fi->cow_inode == NULL) {
@@ -2183,10 +2182,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		struct inode *dir = d_inode(dentry->d_parent);
 
 		ret = f2fs_get_tmpfile(idmap, dir, &fi->cow_inode);
-		if (ret) {
-			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-			goto out;
-		}
+		if (ret)
+			goto out_unlock;
 
 		set_inode_flag(fi->cow_inode, FI_COW_FILE);
 		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
@@ -2200,10 +2197,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		invalidate_mapping_pages(fi->cow_inode->i_mapping, 0, -1);
 
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
-		if (ret) {
-			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-			goto out;
-		}
+		if (ret)
+			goto out_unlock;
 	}
 
 	f2fs_write_inode(inode, NULL);
@@ -2222,7 +2217,11 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	}
 	f2fs_i_size_write(fi->cow_inode, isize);
 
+out_unlock:
+	f2fs_up_write(&fi->i_gc_rwsem[READ]);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+	if (ret)
+		goto out;
 
 	f2fs_update_time(sbi, REQ_TIME);
 	fi->atomic_write_task = current;
@@ -4567,6 +4566,13 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		f2fs_down_read(&fi->i_gc_rwsem[READ]);
 	}
 
+	/* dio is not compatible w/ atomic file */
+	if (f2fs_is_atomic_file(inode)) {
+		f2fs_up_read(&fi->i_gc_rwsem[READ]);
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * We have to use __iomap_dio_rw() and iomap_dio_complete() instead of
 	 * the higher-level function iomap_dio_rw() in order to ensure that the
@@ -4982,6 +4988,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	/* Determine whether we will do a direct write or a buffered write. */
 	dio = f2fs_should_use_dio(inode, iocb, from);
 
+	/* dio is not compatible w/ atomic write */
+	if (dio && f2fs_is_atomic_file(inode)) {
+		ret = -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
 	/* Possibly preallocate the blocks for the write. */
 	target_size = iocb->ki_pos + iov_iter_count(from);
 	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
