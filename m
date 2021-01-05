Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F782EA1BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadd-0006RY-39; Tue, 05 Jan 2021 00:55:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwada-0006Qx-U3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q4KR+kVSz7wDZQpt6pXXRdD43uMQ6Zd3Oot5Dexx9rI=; b=P9pHJh8dpMftawjX2PGKctnm1p
 NlFYufdzDdZ3PSSH34tUYe/4EUxitgyggDUHyYrkHR5dAltSJNu5RzLH8H0JGb1Q8yBzYsA1PnIXe
 kpwZ5cnTrd9BfidfG6Cd4N8V3Vn/rMc6CkvnLGEW/1eD1/dvqwJ+WwOLWEvCGRjLgCy0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q4KR+kVSz7wDZQpt6pXXRdD43uMQ6Zd3Oot5Dexx9rI=; b=NQkZd+5Agaire+KVHEYJ7VCLcJ
 RqaE8bMFFDp99KtK7ylykFBqee22V7IPo8oy1Yu5D6dPyOfyCoMTRtC+/znr+Tnp2sSbr6xYa7U5U
 a43VFx/MZy35zXq13/uTZI0pLCWigMHMIhGjLhTccuDZfw89Ans/p1fI7BbbiVQlrsk0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadR-008Hmb-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE7C122955;
 Tue,  5 Jan 2021 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808110;
 bh=SwwC2tQmuzx2ECIC/aYAUe8sOHWx78XkiAxTAUcoLvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Srdu4HxF1Bb9lEnR7JzmGw/pdJjgAOcpxaS4Evh8wreQR3/eN7eUek7cPFXHkcOaX
 lP184SXS2dHBX1l/m6Xd4qXPeYU4JGmMqZHXpHz/62wMMlOf0dL21hMP0mh4xZFYrV
 9JXvXG7cNpFUn1xaxZHWtAbrVZdWzyWRe2/n4Mz0NBqC0ZpRVkCsF4zucS4Bgq4luo
 SMClFaef9S/mS8BcRvOz3HVeAsvDIYQWYC6Gbxjt2fQ65CbGPeOopGXTTzKkT9UQTb
 l9n/P27mrwnTgHDHwtEkxO2GafO5eYYSKRVI3erirNDRVNH1/EGucH2wSlAOpnUTan
 rUAdXIJZ1qfcw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:52 -0800
Message-Id: <20210105005452.92521-14-ebiggers@kernel.org>
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
X-Headers-End: 1kwadR-008Hmb-Rm
Subject: [f2fs-dev] [PATCH 13/13] xfs: implement lazytime_expired
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

Implement the new ->lazytime_expired method to get notified of lazytime
timestamp expirations, instead of relying on ->dirty_inode(inode,
I_DIRTY_SYNC) which is potentially ambiguous.

This fixes a bug where XFS didn't write lazytime timestamps to disk upon
a sync(), or after 24 hours (dirtytime_expire_interval * 2).  This is
because it only wrote the timestamps if I_DIRTY_TIME was set in i_state.
But actually when an inode's timestamps expire without the inode being
marked I_DIRTY_SYNC first, then ->dirty_inode isn't called until
__writeback_single_inode() has already cleared I_DIRTY_TIME in i_state.

The new ->lazytime_expired method is unambiguous, so it removes any need
to check for I_DIRTY_TIME, which avoids this bug.

I've written an xfstest which reproduces this bug.

Fixes: c3b1b13190ae ("xfs: implement the lazytime mount option")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/xfs/xfs_super.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 813be879a5e51..0b7623907b264 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -666,19 +666,13 @@ xfs_fs_destroy_inode(
 }
 
 static void
-xfs_fs_dirty_inode(
-	struct inode			*inode,
-	int				flag)
+xfs_fs_lazytime_expired(
+	struct inode			*inode)
 {
 	struct xfs_inode		*ip = XFS_I(inode);
 	struct xfs_mount		*mp = ip->i_mount;
 	struct xfs_trans		*tp;
 
-	if (!(inode->i_sb->s_flags & SB_LAZYTIME))
-		return;
-	if (flag != I_DIRTY_SYNC || !(inode->i_state & I_DIRTY_TIME))
-		return;
-
 	if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
 		return;
 	xfs_ilock(ip, XFS_ILOCK_EXCL);
@@ -1108,7 +1102,7 @@ xfs_fs_free_cached_objects(
 static const struct super_operations xfs_super_operations = {
 	.alloc_inode		= xfs_fs_alloc_inode,
 	.destroy_inode		= xfs_fs_destroy_inode,
-	.dirty_inode		= xfs_fs_dirty_inode,
+	.lazytime_expired	= xfs_fs_lazytime_expired,
 	.drop_inode		= xfs_fs_drop_inode,
 	.put_super		= xfs_fs_put_super,
 	.sync_fs		= xfs_fs_sync_fs,
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
