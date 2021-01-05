Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA92EA1AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadD-0006LT-7A; Tue, 05 Jan 2021 00:55:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadC-0006L7-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FWe+5FS4Qo4SrmCId/BqNjqaAIZ85jwflOdqAHuNDlE=; b=Bigp21DokIRDKPjqNNjgZBW4UH
 XuipiHXy4wpdI93PKXSAtRfV7r1Ox+KGsdgElUzSvBKGfcNz7XwqqKg4JtaGyvvG18K30A41cp3rC
 3TFdKJsnXqK7K/kZSK/vBj7+1AE4Sxi9E2Bdz+eleilFGwMX5LGvbgrbIH861wJ27l/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FWe+5FS4Qo4SrmCId/BqNjqaAIZ85jwflOdqAHuNDlE=; b=ipvKSx5ouQJNTfTJUuk8zoh4/A
 hqHqvMR/0vVPt4fzWidjyDHJCP9q1g4AZCiiAx4oqbDSEEdIpHVN/RTjZX6yI4PHFORRyXpH1biE5
 D0gx7EkR7Mxs7eNlZxZQ1S16Yrr2fGHJ5mS1G3QnFv1GJzpvjtPeOckeIk45kojSjABg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwad3-00E0Oy-0K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 879B722582;
 Tue,  5 Jan 2021 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808107;
 bh=moPvKfHUYW5Xbk7fp9PqSrbSDfWUFwePDygO+DUtRFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=odLOb9jW7zdbgQ19pnxfQeV0LZCahNWh2pJHvvskuGhaoTAJINjva3sXgUpuQUx4C
 9Q4jVEGDvC4JAbMDOb0ntyBgGZGYCD7D5RQ+uTFsyV3drMND3coDDlh3n+eJeaDR4P
 hil5l822YPp+3ttvEctfsdcoutR9fY1zMzcy5DOf6/m5irfC1tIlgTw7cCQNZnYr2n
 osSXWG3OuD+6/7zLbzpZ0kcTNtAhXkxI9E8LYaVMNzhVDRqwBsPc/DbKgZ8L/a763U
 fTbNyD1NhYvp7LInib3/VaOfA36sk0VY6JASj7UsjCeOh2iBGsxYCeMQqSIOQuqYJT
 QcZ5iZypbSAwA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:42 -0800
Message-Id: <20210105005452.92521-4-ebiggers@kernel.org>
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
X-Headers-End: 1kwad3-00E0Oy-0K
Subject: [f2fs-dev] [PATCH 03/13] fs: only specify I_DIRTY_TIME when needed
 in generic_update_time()
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

generic_update_time() always passes I_DIRTY_TIME to
__mark_inode_dirty(), which doesn't really make sense because (a)
generic_update_time() might be asked to do only an i_version update, not
also a timestamps update; and (b) I_DIRTY_TIME is only supposed to be
set in i_state if the filesystem has lazytime enabled, so using it
unconditionally in generic_update_time() is inconsistent.

As a result there is a weird edge case where if only an i_version update
was requested (not also a timestamps update) but it is no longer needed
(i.e. inode_maybe_inc_iversion() returns false), then I_DIRTY_TIME will
be set in i_state even if the filesystem isn't mounted with lazytime.

Fix this by only passing I_DIRTY_TIME to __mark_inode_dirty() if the
timestamps were updated and the filesystem has lazytime enabled.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/inode.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 6442d97d9a4ab..d0fa43d8e9d5c 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1743,24 +1743,26 @@ static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
 
 int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
 {
-	int iflags = I_DIRTY_TIME;
-	bool dirty = false;
-
-	if (flags & S_ATIME)
-		inode->i_atime = *time;
-	if (flags & S_VERSION)
-		dirty = inode_maybe_inc_iversion(inode, false);
-	if (flags & S_CTIME)
-		inode->i_ctime = *time;
-	if (flags & S_MTIME)
-		inode->i_mtime = *time;
-	if ((flags & (S_ATIME | S_CTIME | S_MTIME)) &&
-	    !(inode->i_sb->s_flags & SB_LAZYTIME))
-		dirty = true;
-
-	if (dirty)
-		iflags |= I_DIRTY_SYNC;
-	__mark_inode_dirty(inode, iflags);
+	int dirty_flags = 0;
+
+	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
+		if (flags & S_ATIME)
+			inode->i_atime = *time;
+		if (flags & S_CTIME)
+			inode->i_ctime = *time;
+		if (flags & S_MTIME)
+			inode->i_mtime = *time;
+
+		if (inode->i_sb->s_flags & SB_LAZYTIME)
+			dirty_flags |= I_DIRTY_TIME;
+		else
+			dirty_flags |= I_DIRTY_SYNC;
+	}
+
+	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+		dirty_flags |= I_DIRTY_SYNC;
+
+	__mark_inode_dirty(inode, dirty_flags);
 	return 0;
 }
 EXPORT_SYMBOL(generic_update_time);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
