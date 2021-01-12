Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACE92F396D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 20:04:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzOy2-0000uw-HW; Tue, 12 Jan 2021 19:04:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kzOy0-0000uK-DC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1d7yQJTUHPGRl1SpSvJf5KE2Awd1XcVAZZcvy3J9Vs=; b=IbgVe653j+9N1q4VNs17OEy+6d
 OlNaKO7EyBa0pvsgzLSliWRwLPSd25PtBgeVlpKK6KuAaDqeBDR9YzFpqz0RTKWISn+T0SmNJteeA
 Mo3EOweAQ7mOylHzxTWxVRaaE31ZDERagiPa2lb8633OlzhlYpXmgRKyUn+Q+u+TQLfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I1d7yQJTUHPGRl1SpSvJf5KE2Awd1XcVAZZcvy3J9Vs=; b=FErE37VTkmjxv6d6KUG3hqVNiX
 8yFLWStFvZlee2nhvvDOXLeqqC5bdq/VToGVyc53UcWvDaYngHm4y/taFu3bcyVadppM3l7V8t0pw
 c1uXJ4u4y2lh8LeeC0lHGudlVGTH4x4FbFOcThtTc5p12rxiwqjKieWUBbLhqcU+dpfg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzOxw-004zDF-9g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44D8F23134;
 Tue, 12 Jan 2021 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610478252;
 bh=6FqWuQrXV+HGHkzTR42Ape3on4H7NKo1rahsTeQDI4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RZNZ7JkkNHWRoE3L2XHIBFGDbwLmXQ+WYmrSQ2HH5mrAH3MtFyOQ0LJ3XzuG+BY4y
 Ji+rdyAJ/Veytz+4dA94ERGnUigqHy0UnTkMBHX3hMM1lpgpo62tkwB8hq57YCbBS2
 mSpxDL4QT3QnH5GgvYEHuAvdrKqC/sWHNDwlpy7hlUjEyBW/VUJPoonFZt7omR5ygJ
 u+3VdJWj6zeBFzD0LHf+ThYBySvpcxA7LHRs2EujZ9L/va74iZnRNhyVvauDdUf+To
 kefvDtvLXHBcCaVR/JzpiX8n8OVbP6jRDf4CZ8F0mW0jGMkcAqjwaEqOQF2vg/QhvM
 gWcEr3/JZZHjA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 12 Jan 2021 11:02:53 -0800
Message-Id: <20210112190253.64307-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112190253.64307-1-ebiggers@kernel.org>
References: <20210112190253.64307-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzOxw-004zDF-9g
Subject: [f2fs-dev] [PATCH v3 11/11] ext4: simplify i_state checks in
 __ext4_update_other_inode_time()
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

Since I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state,
there's no need to check for I_DIRTY_TIME && !I_DIRTY_INODE.  Just check
for I_DIRTY_TIME.

Also introduce a helper function in include/linux/fs.h to do this check.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c    |  8 ++------
 include/linux/fs.h | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 4cc6c7834312f..d809a06b6ef7f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4961,15 +4961,11 @@ static void __ext4_update_other_inode_time(struct super_block *sb,
 	if (!inode)
 		return;
 
-	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
-			       I_DIRTY_INODE)) ||
-	    ((inode->i_state & I_DIRTY_TIME) == 0))
+	if (!inode_is_dirtytime_only(inode))
 		return;
 
 	spin_lock(&inode->i_lock);
-	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
-				I_DIRTY_INODE)) == 0) &&
-	    (inode->i_state & I_DIRTY_TIME)) {
+	if (inode_is_dirtytime_only(inode)) {
 		struct ext4_inode_info	*ei = EXT4_I(inode);
 
 		inode->i_state &= ~I_DIRTY_TIME;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 45a0303b2aeb6..de0c789104c26 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2194,6 +2194,21 @@ static inline void mark_inode_dirty_sync(struct inode *inode)
 	__mark_inode_dirty(inode, I_DIRTY_SYNC);
 }
 
+/*
+ * Returns true if the given inode itself only has dirty timestamps (its pages
+ * may still be dirty) and isn't currently being allocated or freed.
+ * Filesystems should call this if when writing an inode when lazytime is
+ * enabled, they want to opportunistically write the timestamps of other inodes
+ * located very nearby on-disk, e.g. in the same inode block.  This returns true
+ * if the given inode is in need of such an opportunistic update.  Requires
+ * i_lock, or at least later re-checking under i_lock.
+ */
+static inline bool inode_is_dirtytime_only(struct inode *inode)
+{
+	return (inode->i_state & (I_DIRTY_TIME | I_NEW |
+				  I_FREEING | I_WILL_FREE)) == I_DIRTY_TIME;
+}
+
 extern void inc_nlink(struct inode *inode);
 extern void drop_nlink(struct inode *inode);
 extern void clear_nlink(struct inode *inode);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
