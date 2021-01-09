Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 613D22EFE62
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9Aa-0007D1-3u; Sat, 09 Jan 2021 08:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9AV-0007CM-0M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fk6FxD28S68MhUZyWTp8nnChtWjxzM4RXD7eTPGRX7c=; b=PY4ac7N/Hq30KJkKlG6hu5jthj
 wC3ZrOE1+TjUITxYvTqqO85JW9TukFpAqBpsHsMVIizyOxD+GQE7m07eo9B5dwhoT/hyFINDH4bzD
 QOzXgI39b1xAW00U6ymg7OP/fsz0FmGux4UC1q/91oGfT6VsNUpLAsYx+KVhhlcpahOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fk6FxD28S68MhUZyWTp8nnChtWjxzM4RXD7eTPGRX7c=; b=ZgIL6EpcvMtom+oSZQkT/6+WPe
 UW6lcFPQDnurQd3HVGBJ6SdN/Ks3zC13XZ4urxOM4psaczbc6yv8aOJhSwLglGFm3BcQMXxv508kk
 xxbfbZtzBAjMCLfCg2nVqh8BSmu5hLGzW44L5gGL4iKkKJ9Yo/iA9QroEKmq3BOfIG0s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AQ-00DnEj-8j
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0A6F23A69;
 Sat,  9 Jan 2021 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179185;
 bh=X2D2mMHSYMvciNt0NX060b8SxOuVP637kMoRfSYm4hI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AFPYCSfxi6jt7dh452fvYOjRNnSMUXbz8Ldbrx5SGN7CEn0FfKd6trsAFH6tQSifw
 d4qlNTLmPT8GouFL9FJAYI88pWWf957LV4l3E7E/hWtduFI7b0oTBCWRLrW2IK8Q/Q
 FCYrgwqc99DymUEG7oKhjTY57v7R2vM5tY1REgj3cw1WSXDCdzFbBYrH25abQC2FwA
 7Mj8WPo7PUw+i9I5wWi8QgDUN4e8vo+4PfdL9xmT961l8/fnOWLqQe4ByRF8EhrvtX
 Ky/Db8yaRBXa3dDYRcex1xKhkKHxqEKY8OZ2hYIq64kX+WMXc00H9D9r6FOOuQHccH
 SvjeFv8022L2A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:58:57 -0800
Message-Id: <20210109075903.208222-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AQ-00DnEj-8j
Subject: [f2fs-dev] [PATCH v2 06/12] fs: pass only I_DIRTY_INODE flags to
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
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
index b7616bbd55336..2e6064012f7d3 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2259,7 +2259,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
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
