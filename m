Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4D2EA1B0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadE-0008MQ-6g; Tue, 05 Jan 2021 00:55:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadC-0008MJ-Bz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxKsEjU/k1rAOMYFiicyp2jl0lXAM4AN2gxxyEBSJu4=; b=OZBsmJAR00Dz0CRwNdiUiD+osP
 KwJ8dM2BiRVNEQCM/dVE7KL/xY+3RqDWCw8u2bsRiy6OcISHdUPfh1mqXSkmgthBpeXKnxT1nfDPX
 Fldl+FxHfGWrtPZoXW4GhIIVFaRzEOlMylJdzCMldkVZlFjaOyCRtXYUCBbUL3euOcDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mxKsEjU/k1rAOMYFiicyp2jl0lXAM4AN2gxxyEBSJu4=; b=HjY9bKiGtuXmk87Pa9Oi3wrmVf
 uNjNygoBIyPeNbnHLt/1uCgwEJjKQbhU6wTg6tfr1pFQj2oY1nQMIRgmb6GkaFP/2rtTmJ9HtTovM
 s8lHrpfrh0blqNSaDtNdEKQnSHAXrIZ0c3IhouEM4qiAyKB9uN7x18+pJAK4UI6gNsEg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwad3-00E0P0-0J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D625F2256F;
 Tue,  5 Jan 2021 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808108;
 bh=gBV7rjbDvtj1IoteKM7jbO9E67+Za0GVgMCAesn4G6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ASJXzrsaVLLasAKCmNGQSKOsMzoHtyRTKBaHFlVXFQWcoZqc+MWcqkJo30DvIHloH
 AQT6fY5xNbAtk+zgP7jYSZLRrOAJ4ve0S6wO5OlKd7JqhskWjzWVlZfkpD3Cf4WlE+
 0N+puDoBQbAkS3G1vkyoVmd86/9RkrxKI5CoTed7Wx289cf491pErIMcw4G67tPHA8
 a5J36fPKHrZkxGBc4tFW4r89vKZSAxjDy5WWIk1Ep3l1oUo0Kqtv4R55KrHvZRsO78
 7NTU8xToN3ZsCH91q93mkbVXgUg7Yt4K6c7WBIk64cBmgCNGKKaSrWQCiH9ZKxWTSC
 EM9WBiVZRtw2w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:43 -0800
Message-Id: <20210105005452.92521-5-ebiggers@kernel.org>
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
X-Headers-End: 1kwad3-00E0P0-0J
Subject: [f2fs-dev] [PATCH 04/13] fat: only specify I_DIRTY_TIME when needed
 in fat_update_time()
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

As was done for generic_update_time(), only pass I_DIRTY_TIME to
__mark_inode_dirty() when the inode's timestamps were actually updated
and lazytime is enabled.  This avoids a weird edge case where
I_DIRTY_TIME could be set in i_state when lazytime isn't enabled.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fat/misc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index f1b2a1fc2a6a4..33e1e0c9fd634 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -329,21 +329,22 @@ EXPORT_SYMBOL_GPL(fat_truncate_time);
 
 int fat_update_time(struct inode *inode, struct timespec64 *now, int flags)
 {
-	int iflags = I_DIRTY_TIME;
-	bool dirty = false;
+	int dirty_flags = 0;
 
 	if (inode->i_ino == MSDOS_ROOT_INO)
 		return 0;
 
-	fat_truncate_time(inode, now, flags);
-	if (flags & S_VERSION)
-		dirty = inode_maybe_inc_iversion(inode, false);
-	if ((flags & (S_ATIME | S_CTIME | S_MTIME)) &&
-	    !(inode->i_sb->s_flags & SB_LAZYTIME))
-		dirty = true;
+	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
+		fat_truncate_time(inode, now, flags);
+		if (inode->i_sb->s_flags & SB_LAZYTIME)
+			dirty_flags |= I_DIRTY_TIME;
+		else
+			dirty_flags |= I_DIRTY_SYNC;
+	}
+
+	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+		dirty_flags |= I_DIRTY_SYNC;
 
-	if (dirty)
-		iflags |= I_DIRTY_SYNC;
 	__mark_inode_dirty(inode, iflags);
 	return 0;
 }
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
