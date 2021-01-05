Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CCC2EA1B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadM-0006NM-J7; Tue, 05 Jan 2021 00:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadL-0006N8-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1plf4JAYz0m6Qenfvc2ix/cxLq69ET/16cOmLl9y0Q=; b=OnoUWbW/wgGDQ7VxSgdl9opLmt
 cky9jNpVUARqMvMa2LLgN+ytoUCO8tlURMw5FBDvwsdj00WNAu0ne2v495tcsuqXqCSKxoHBJXogj
 igLJm0IP31S1NPw6tX8P1sActzXOO0wruhLjayoQuThtaEKYcRyCi5reBbYCwVh8Yoqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L1plf4JAYz0m6Qenfvc2ix/cxLq69ET/16cOmLl9y0Q=; b=c00toTJxf6Su483gX0/K+iLFLO
 XpL96IXrVQJrgL12KLizk5lGtEFWDiYbtbMM0D0hE59/XiR4yqur2AEjMyjpEW1eMHsDBX2p0aYnr
 Weo9QQTVaCBQmKjFAg4vdXHc0w8OwV3yDBWXu1n9CBHEa7rtplNUwr0m/Yv81efcUriI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadH-008Hlk-KW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EF6622597;
 Tue,  5 Jan 2021 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808108;
 bh=B3Emt5qB2uZqLRLG8UPggA6U0YAB7if9iFbujwsgEtM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kcKIh2C2h0ZA6sQb9/5a4jo57dRI1gFr+nnAqwgx0WF8ercDa72h65pmp3xBQqNBt
 PHdc/BfTzNbg7N5rZeIB9wH3sIQt4rojBNfOipI5vFrpqNzSfwmMPCzOZiynTibMWT
 qPKTGX4EoB+fcFap1ApNiflAALtI5jlR1T1xYXF641p4Y4LgIfGrKHNzxIosVL4Qea
 qClPYIhNsF1iP4jslUeXVTHZRs9fr/WxbvUUQFFk9SgDxNUY8DTlclSx1yF8hb6Xv0
 0Mw3amjUyNtTKRKf4WKFbEb42i4la9OwlyYXq9Nb72cJ8HkRCxiVbw/yEKwtW9g8NZ
 6n45MNQyj4grg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:45 -0800
Message-Id: <20210105005452.92521-7-ebiggers@kernel.org>
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
X-Headers-End: 1kwadH-008Hlk-KW
Subject: [f2fs-dev] [PATCH 06/13] fs: pass only I_DIRTY_INODE flags to
 ->dirty_inode
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

->dirty_inode is now only called when I_DIRTY_INODE (I_DIRTY_SYNC and/or
I_DIRTY_DATASYNC) is set.  However it may still be passed other dirty
flags at the same time, provided that these other flags happened to be
passed to __mark_inode_dirty() at the same time as I_DIRTY_INODE.

This doesn't make sense because there is no reason for filesystems to
care about these extra flags.  Nor are filesystems notified about all
updates to these other flags.

Therefore, mask the flags before passing them to ->dirty_inode.

Also properly document ->dirty_inode in vfs.rst.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/vfs.rst | 5 ++++-
 fs/fs-writeback.c                 | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index ca52c82e5bb54..287b80948a40b 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -270,7 +270,10 @@ or bottom half).
 	->alloc_inode.
 
 ``dirty_inode``
-	this method is called by the VFS to mark an inode dirty.
+	this method is called by the VFS when an inode is marked dirty.
+	This is specifically for the inode itself being marked dirty,
+	not its data.  If the update needs to be persisted by fdatasync(),
+	then I_DIRTY_DATASYNC will be set in the flags argument.
 
 ``write_inode``
 	this method is called when the VFS needs to write an inode to
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index e3347fd6eb13a..f20daf4f5e19b 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2268,7 +2268,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 		trace_writeback_dirty_inode_start(inode, flags);
 
 		if (sb->s_op->dirty_inode)
-			sb->s_op->dirty_inode(inode, flags);
+			sb->s_op->dirty_inode(inode, flags & I_DIRTY_INODE);
 
 		trace_writeback_dirty_inode(inode, flags);
 
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
