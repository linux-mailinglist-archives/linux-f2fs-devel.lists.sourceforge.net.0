Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DEC4849D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jan 2022 22:24:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n4rIa-0005sj-S1; Tue, 04 Jan 2022 21:24:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n4rIY-0005sF-WE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 21:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4mgWYZjcNNnLGIvHQ1aFtdw0FSWPCjBYZVV6cmkzN78=; b=k/hgPoEj0Jb+IFm9m5YvAcCydx
 ByoCJfm03dYmTQyoAhvh6DMtHKbJaT4dgFtcFRyq29fhKJEKKM0YSNUQP8NmB4xyk3dTr1qt84GeT
 RVfkFjqpo/HWrc560/BPLBRO6w28ycQ00qeE1wqn/4NHOuxJHGPoELWIrzocNEgfolx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4mgWYZjcNNnLGIvHQ1aFtdw0FSWPCjBYZVV6cmkzN78=; b=VQ9l4YqsIzS5SuolJ5NdkI+xzh
 8lxPOZgfxZyWf9j8os/CM1UaAM2mBrriDvNOPfTXFQVbmaRLEDh9rrYCV1WWUu0tdFmt5I8bg9m1+
 BkZo8xoxXCLOA4B8uKIv96RGrYoOfO5vRPx+KPUcse6b1VPZ2QlG/hr9p8NjUr+kD7+w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n4rIV-0007hA-IX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 21:24:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CABEB817F6;
 Tue,  4 Jan 2022 21:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB919C36AF2;
 Tue,  4 Jan 2022 21:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641331472;
 bh=YiWOX5NHugXaDJT6Ol1nD26li2vyW4k8fkEADYyvcpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S/XeR0ge7IecEcEoypLgMUedgfPysRkHsJRD3+yW2ljdA8Q2wPGq71noN3eDTlbc6
 2/SAMRrXCjndlnTeiGs+bFaroRXJjwqWY64h9LQDmejyaR8NOdEQJubQTAiJVqCRzE
 ZoF0f6h1DUEAScti5ZLYnfuVFmHnOHD20GcTCgMlW0xQES0vF7pJVcjB6eRwACRImo
 EdBBH/cohz5xgJm70PGj4ofxBeyVXqzR6aBk3MM/xBexAfPacmjIdbZy3F7T1EYirf
 NIVEgZOstRMqeuz+Kp0W1HFGhBsQ6OuLq8F/GxxvawQbeqrB2gXXM3Az/KpJTzjFOo
 If7JG/hGy+wdA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Jan 2022 13:24:15 -0800
Message-Id: <20220104212419.1879225-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220104212419.1879225-1-jaegeuk@kernel.org>
References: <20220104212419.1879225-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Replace 'if (ret
 > 0)' with 'if (ret <= 0) goto out_unlock;
 '. No change in behavior. Signed-off-by:
 Eric Biggers <ebiggers@google.com> Reviewed-by: Chao Yu <chao@kernel.org>
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c | 64
 +++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n4rIV-0007hA-IX
Subject: [f2fs-dev] [PATCH 2/6] f2fs: reduce indentation in
 f2fs_file_write_iter()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Replace 'if (ret > 0)' with 'if (ret <= 0) goto out_unlock;'.
No change in behavior.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 64 +++++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index fc87d0f5b82b..808a7c24d993 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4338,44 +4338,48 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	ret = generic_write_checks(iocb, from);
-	if (ret > 0) {
-		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (!f2fs_overwrite_io(inode, iocb->ki_pos,
-						iov_iter_count(from)) ||
+	if (ret <= 0)
+		goto out_unlock;
+
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		if (!f2fs_overwrite_io(inode, iocb->ki_pos,
+					iov_iter_count(from)) ||
 				f2fs_has_inline_data(inode) ||
 				f2fs_force_buffered_io(inode, iocb, from)) {
-				ret = -EAGAIN;
-				goto out_unlock;
-			}
-		}
-		if (iocb->ki_flags & IOCB_DIRECT) {
-			ret = f2fs_convert_inline_inode(inode);
-			if (ret)
-				goto out_unlock;
-		}
-		/* Possibly preallocate the blocks for the write. */
-		target_size = iocb->ki_pos + iov_iter_count(from);
-		preallocated = f2fs_preallocate_blocks(iocb, from);
-		if (preallocated < 0) {
-			ret = preallocated;
+			ret = -EAGAIN;
 			goto out_unlock;
 		}
+	}
 
-		ret = __generic_file_write_iter(iocb, from);
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		ret = f2fs_convert_inline_inode(inode);
+		if (ret)
+			goto out_unlock;
+	}
+	/* Possibly preallocate the blocks for the write. */
+	target_size = iocb->ki_pos + iov_iter_count(from);
+	preallocated = f2fs_preallocate_blocks(iocb, from);
+	if (preallocated < 0) {
+		ret = preallocated;
+		goto out_unlock;
+	}
 
-		/* Don't leave any preallocated blocks around past i_size. */
-		if (preallocated > 0 && i_size_read(inode) < target_size) {
-			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			filemap_invalidate_lock(inode->i_mapping);
-			f2fs_truncate(inode);
-			filemap_invalidate_unlock(inode->i_mapping);
-			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		}
-		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+	ret = __generic_file_write_iter(iocb, from);
 
-		if (ret > 0)
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
+	/* Don't leave any preallocated blocks around past i_size. */
+	if (preallocated > 0 && i_size_read(inode) < target_size) {
+		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		filemap_invalidate_lock(inode->i_mapping);
+		f2fs_truncate(inode);
+		filemap_invalidate_unlock(inode->i_mapping);
+		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	}
+
+	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
+
 out_unlock:
 	inode_unlock(inode);
 out:
-- 
2.34.1.448.ga2b2bfdf31-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
