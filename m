Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7A32EA1B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadY-0006Pt-OM; Tue, 05 Jan 2021 00:55:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadV-0006P8-24
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y36fuTeDQsKZp2GvgvyOnabI8DTgAIh35Ef7y7ERmoA=; b=Aq3YTnKalnLUASa4ntr5uuhAah
 nM/1nzEFHjB1Gvp2AVg8fq0QLxU//zKl6TmUUsSzjdaWNKmXxyAJgD2KKuryedg0VBM78wiA+0NvJ
 wZrE8teD8GW6UMACA5ChEwIknz1gl43OQsXhkDKIN6jC5lmSjkfihgjxejDBe5sfOauA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y36fuTeDQsKZp2GvgvyOnabI8DTgAIh35Ef7y7ERmoA=; b=N4IiXS6gM3ri09Lcn1VSL9/ZJ7
 f1CmpeDjisf4IOkHAVyBmD0t2sJWk1uYw/fEJzr2vZ9R2ccIWLOk5f0nkc7FcPl/n3xWbmzNAGDiR
 xewnANipNm51/Jf4iFHzuSedE+HqfnasrtMGBYgQ7mWbMKK/omW9l+QC+k/vY0OALP7c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadH-00E0Qy-Mr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD664225AA;
 Tue,  5 Jan 2021 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808109;
 bh=H1ms59/bip1WURh53Z2hT3TghGoA+Y1uZAJZTjqPVbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jT5YHwMUgMCR7wlwaRdowKZM9R6gvPc5q8QsYcKqluLVv9qzVzb5ZLYpj+8BJinTA
 1tYt5wwFZVp0RDAxpBlc63HhVpNF5Rk3zgXbvdiFBSWfIpLrDX8Mmfq1MVoz9YClb1
 9Gr2aATxyaLdxZqNOHjdmFblPWbRTyzC/RA158eyh4sD8Aa3guZw/r8EudMGbINKUJ
 w+1wvYWfRCLiPz4E7Qnid8lt7OG7jDwfbEzObQJGnso821wgCnsJYkDVJxNx555AOD
 74UKgJtYKhCO2Xw93w+7ZABhUKMlAxqRerT5DGy3IKUeXa5hwHmJYWfpjPMb/kOHAy
 7Gqk1iDUurBeg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:46 -0800
Message-Id: <20210105005452.92521-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105005452.92521-1-ebiggers@kernel.org>
References: <20210105005452.92521-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwadH-00E0Qy-Mr
Subject: [f2fs-dev] [PATCH 07/13] fs: correctly document the inode dirty
 flags
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The documentation for I_DIRTY_SYNC and I_DIRTY_DATASYNC is a bit
misleading, and I_DIRTY_TIME isn't documented at all.  Fix this.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fs.h | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index fd47deea7c176..45a0303b2aeb6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2084,8 +2084,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 /*
  * Inode state bits.  Protected by inode->i_lock
  *
- * Three bits determine the dirty state of the inode, I_DIRTY_SYNC,
- * I_DIRTY_DATASYNC and I_DIRTY_PAGES.
+ * Four bits determine the dirty state of the inode: I_DIRTY_SYNC,
+ * I_DIRTY_DATASYNC, I_DIRTY_PAGES, and I_DIRTY_TIME.
  *
  * Four bits define the lifetime of an inode.  Initially, inodes are I_NEW,
  * until that flag is cleared.  I_WILL_FREE, I_FREEING and I_CLEAR are set at
@@ -2094,12 +2094,20 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
  * Two bits are used for locking and completion notification, I_NEW and I_SYNC.
  *
  * I_DIRTY_SYNC		Inode is dirty, but doesn't have to be written on
- *			fdatasync().  i_atime is the usual cause.
- * I_DIRTY_DATASYNC	Data-related inode changes pending. We keep track of
+ *			fdatasync() (unless I_DIRTY_DATASYNC is also set).
+ *			Timestamp updates are the usual cause.
+ * I_DIRTY_DATASYNC	Data-related inode changes pending.  We keep track of
  *			these changes separately from I_DIRTY_SYNC so that we
  *			don't have to write inode on fdatasync() when only
- *			mtime has changed in it.
+ *			e.g. the timestamps have changed.
  * I_DIRTY_PAGES	Inode has dirty pages.  Inode itself may be clean.
+ * I_DIRTY_TIME		The inode itself only has dirty timestamps, and the
+ *			lazytime mount option is enabled.  We keep track of this
+ *			separately from I_DIRTY_SYNC in order to implement
+ *			lazytime.  This gets cleared if I_DIRTY_INODE
+ *			(I_DIRTY_SYNC and/or I_DIRTY_DATASYNC) gets set.  I.e.
+ *			either I_DIRTY_TIME *or* I_DIRTY_INODE can be set in
+ *			i_state, but not both.  I_DIRTY_PAGES may still be set.
  * I_NEW		Serves as both a mutex and completion notification.
  *			New inodes set I_NEW.  If two processes both create
  *			the same inode, one of them will release its inode and
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
