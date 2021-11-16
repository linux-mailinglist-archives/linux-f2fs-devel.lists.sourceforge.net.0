Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E00453BDD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Nov 2021 22:45:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mn6Gi-0002DQ-7u; Tue, 16 Nov 2021 21:45:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mn6Gh-0002DJ-22
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Nov 2021 21:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFnBZHC4ZMR4lijKkzE8F1y2QxKC3ZthlTZX8wE3o60=; b=CK0TD1JzSnU5WGGvujhh/mDWZu
 HIyO3I2V9h3o5bVbg0yR4u9MybPb+bEvsxIZC3ZgaNdi1H/vbAgflvZBeOLz3QCEtrjHA+uqEq2Wx
 6R6A3DgkMrJgY+I9O3LwEVDQ3xhRyHnu24owtFBsffQjoFVZwXdgjSLWz27GWuQYmZQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FFnBZHC4ZMR4lijKkzE8F1y2QxKC3ZthlTZX8wE3o60=; b=mU36XUTp1BcY7jTQMnivwlBP2J
 PDyuio7wJSPceSzoUv7bIyX0sjoWf15G1vGfLt0Gq6I9Iw83i7ULst/LptD+ahVU4zjXoLamjpN+E
 3cwerSenq8/siX8i5lTqfuo7frj3nFsYuYuG/JcM6LxTXLKuqCJtQG9ks69Znj87MnRY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mn6Gd-00FLny-60
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Nov 2021 21:45:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCE5263223;
 Tue, 16 Nov 2021 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637099119;
 bh=G0xhnbWO+0WlA4XzuUY22qQyT/4Oct37q6Qk4qrlL3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L+++ZzzgIqughHSH8UG6yEyqdHMnwr7hJ59i1RwAl+Vf1/7nmO8+2j1edEo/hpfEg
 F16fYtsXMHyQUgTRx4Jv1AukrfLIxEk0A6XbjjnZy8kuPYqXEd6M5duYO5TlOK2o2x
 flfURNCC8is7aB6T4AvQAqcpKIVNSf7Np9FwCfJZ/V954Zw8LznUszcV+YlK+SWfen
 amE22SXvnVYw9/MFL4+thegvQnR/pXYYWkWyEhq8cQgumNbV8KKWGmbzfEJ/bv/LUH
 Y/6aBHdQn0fqCHpcBWyC/rc7hoios1Tw2sKwvuUMfWMvEHT2T0S+CbhnheCDr3cjYk
 cFyaOAjjA3i1Q==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 16 Nov 2021 13:45:07 -0800
Message-Id: <20211116214510.2934905-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211116214510.2934905-1-jaegeuk@kernel.org>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Replace 'if (ret
 > 0)' with 'if (ret <= 0) goto out_unlock;
 '. No change in behavior. Signed-off-by:
 Eric Biggers <ebiggers@google.com> Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/file.c | 69 ++++++++++++++++++++++++++ 1 file changed, 36 insertio
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mn6Gd-00FLny-60
Subject: [f2fs-dev] [PATCH 3/6] f2fs: reduce indentation in
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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 69 ++++++++++++++++++++++++++------------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ec8de0662437..fdc440d212c3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4355,48 +4355,51 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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
-			if (!f2fs_truncate(inode))
-				file_dont_truncate(inode);
-			filemap_invalidate_unlock(inode->i_mapping);
-			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		} else {
+	ret = __generic_file_write_iter(iocb, from);
+
+	/* Don't leave any preallocated blocks around past i_size. */
+	if (preallocated > 0 && i_size_read(inode) < target_size) {
+		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		filemap_invalidate_lock(inode->i_mapping);
+		if (!f2fs_truncate(inode))
 			file_dont_truncate(inode);
-		}
+		filemap_invalidate_unlock(inode->i_mapping);
+		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	} else {
+		file_dont_truncate(inode);
+	}
 
-		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
 
-		if (ret > 0)
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
-	}
 out_unlock:
 	inode_unlock(inode);
 out:
-- 
2.34.0.rc1.387.gb447b232ab-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
