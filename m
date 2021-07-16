Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8AD3CB8E5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1R-0004uT-8n; Fri, 16 Jul 2021 14:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1P-0004tw-45
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vs4dUwjknwFyqeaCZx29OBG0rw754ukrpRj8qi3Yurc=; b=iffxDllAqvz3kQC70cIQDRgsKE
 fJcZUqxnL8QTRWLxoHET0ALHcflY5Qfo2f6/z2/WZ7ZUq9R3ekq8KQcxDnKt/uCRl5ivIfWJfg/8M
 MWNiUeMvLRZLzFJf+cXCPy8zUP3np/WNCw+ktUFATAZJbIbLllD6TopoSTAvyUnyXSgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vs4dUwjknwFyqeaCZx29OBG0rw754ukrpRj8qi3Yurc=; b=CI447ulBB6/XKEjUAov/L0tdvO
 hGjpqlt98ngkQkY8gN5BnrnDt6dhDibQeuEiSYf2EVFApfW/TlcTcQpCl93rrPPHo6UFGLtM3qPnv
 yN+3/l6bc6b8ZWPDcsET0JzqhYW2sh7U/bLSlfhiSUcEThw/m0s9OxGyqD0cUQS78EdE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1I-0004e2-Tz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A126C613FC;
 Fri, 16 Jul 2021 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446444;
 bh=hCHntWrZmULEajsGnxh4y43wXlCSz6CxDtKDb0Kydp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XT6yq9RX9AO2TALWFY7xtOHA7gvRHNaqMtQSptevzwfZZ+SoATRNotr62tyNxSFPO
 wE24hrpMqJngEMs6huxGVqnHe4cHREt34MRbAlUuT/8Lf975adG2YOfeVk2ADkClKz
 GTHGGYHM9QHqYLmyG/p/AcvuAd8jUyjAfN+FAAhUEww/KlwzJ9Q4f2242Z/Fjy7mFZ
 lk5psGsFSNq96V5nRhafZIuj2R/zMoDfiZKqkJrD9koK/nKT/mnawcyDVhv2vUe+Co
 bd+xngXcXlHrsq3CN5EOKwTLMUBlPSShwlKd8i0CRrNr14IUkAHQ0gSSA+gh5lg/3X
 ttIkzd+qRCL3A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:12 -0500
Message-Id: <20210716143919.44373-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716143919.44373-1-ebiggers@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4P1I-0004e2-Tz
Subject: [f2fs-dev] [PATCH 2/9] f2fs: remove allow_outplace_dio()
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

We can just check f2fs_lfs_mode() directly.  The block_unaligned_IO()
check is redundant because in LFS mode, f2fs doesn't do direct I/O
writes that aren't block-aligned (due to f2fs_force_buffered_io()
returning true in this case, triggering the fallback to buffered I/O).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/data.c |  2 +-
 fs/f2fs/f2fs.h | 10 ----------
 fs/f2fs/file.c |  2 +-
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c478964a5695..18cb28a514e6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3551,7 +3551,7 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	if (f2fs_force_buffered_io(inode, iocb, iter))
 		return 0;
 
-	do_opu = allow_outplace_dio(inode, iocb, iter);
+	do_opu = (rw == WRITE && f2fs_lfs_mode(sbi));
 
 	trace_f2fs_direct_IO_enter(inode, offset, count, rw);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ee8eb33e2c25..ad7c1b94e23a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4305,16 +4305,6 @@ static inline int block_unaligned_IO(struct inode *inode,
 	return align & blocksize_mask;
 }
 
-static inline int allow_outplace_dio(struct inode *inode,
-				struct kiocb *iocb, struct iov_iter *iter)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int rw = iov_iter_rw(iter);
-
-	return (f2fs_lfs_mode(sbi) && (rw == WRITE) &&
-				!block_unaligned_IO(inode, iocb, iter));
-}
-
 static inline bool f2fs_force_buffered_io(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6afd4562335f..b1cb5b50faac 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4292,7 +4292,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			 * back to buffered IO.
 			 */
 			if (!f2fs_force_buffered_io(inode, iocb, from) &&
-					allow_outplace_dio(inode, iocb, from))
+					f2fs_lfs_mode(F2FS_I_SB(inode)))
 				goto write;
 		}
 		preallocated = true;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
