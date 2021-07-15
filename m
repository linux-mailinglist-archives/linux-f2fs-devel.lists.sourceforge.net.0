Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73A3C9FFA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jul 2021 15:46:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m41h3-0006up-U6; Thu, 15 Jul 2021 13:46:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m41bt-0005pe-Om
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3UrWJRrmmZoeFsiXlatgXAwopNmimQ93wkzrLwvaNN0=; b=gsiXxoQKnRujKXFZpCvTxD1L9r
 XjKLR9jlfDc+HhGOnQkfY9ZDLza05u8PAbUJgb0IaSk5mma9Ftd/vk9D4Ga1q3Q4iiWB7/g1ZLrsz
 fRsdbU0JYazfWU4kQrNUw2Fl+2uv59+WFEoL+tnLtjuneapxAwhbCOQsyoUjzkWkDRpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3UrWJRrmmZoeFsiXlatgXAwopNmimQ93wkzrLwvaNN0=; b=GlbwSyq9TYzWlROOT7Zf69/KW2
 J/D4Fc6ez6JnMFuR1dVXbatWOrja00JCfhQJ8BTzx6Aqov1ZKWZT4BinrvYaWHv0RLO+yeVNX4Egg
 lYQF5s7MtchtMeOfqTY1wV9BZbqRqTKT1ykdlvjS/5TruItfSEK8R0k3w6/yZH/F9AOk=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m41bn-009HVb-Au
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:41:05 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7C7E422A7C;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626356433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UrWJRrmmZoeFsiXlatgXAwopNmimQ93wkzrLwvaNN0=;
 b=Vq6zyVi+TmKxjG4E2bDVHqilU05s3T3gkdYPFN9QWrpWbR+GxR6RlxitkuKJ3wa9JjXBuW
 B4Yb9uaFht7dlYpcJNWLyjXhvkw+6KOQKSuP6DeYLOKvo1MNYISBdsLoRQdzI81/UdPhqM
 I2TTzsRXYlE9ba20mfbsmM5cP1F37sQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626356433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UrWJRrmmZoeFsiXlatgXAwopNmimQ93wkzrLwvaNN0=;
 b=vPvQaBLdn4nF8xM+5K5KEGC/ouomYZFRiTn6m+gZfuSx9Er+5mBus+S5jB9AEbFudY6Ula
 sWwkbcKSe2BV1QBQ==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 680CEA3B9D;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1B42A1E0C05; Thu, 15 Jul 2021 15:40:33 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Thu, 15 Jul 2021 15:40:17 +0200
Message-Id: <20210715134032.24868-7-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715133202.5975-1-jack@suse.cz>
References: <20210715133202.5975-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663; i=jack@suse.cz;
 h=from:subject; bh=YmQSkQse9NO9b0qrNLfWFR/SLfIwnVnRgr/nYQ5R0lY=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg8DrBhJIq6dexPtRN0mRaJPDIgpTC8p8HxaHKF5yv
 BEL61CyJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYPA6wQAKCRCcnaoHP2RA2UAQB/
 9rg5NL72FfnXClKh6c0yAIPqCwy+FeNY+kyI9sfxL6MLpfwdAKEG051FlsOzEbC57n9xult0L9NK+a
 SKIpZNIXKtzDo1mJnXVzFit3q9KrWSykWOR2A6XKyL5yrPuZOQbSj9//39Vukg1Xi9tKW0rln8dsKl
 DlCCZLnN/Tqou0F0alPiI5z8Ydvx8yvtmYqYg4v+IwtaPWIClc9Cye80/06rUdQ6x12dW0niqMs6zh
 BJy9iasKMKa4aQ57hQGrUMn05CUfnZVD9qSJnCAMDnJ2aj/BtR1MSwl+UelmZE8EN0xnhbB9RfyV41
 3mXYwJHybMymKmoj5OERJOjQ2/asDD
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1m41bn-009HVb-Au
Subject: [f2fs-dev] [PATCH 07/14] xfs: Refactor xfs_isilocked()
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 Eric Sandeen <sandeen@redhat.com>, linux-cifs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Dave Chinner <dchinner@redhat.com>,
 Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Pavel Reichl <preichl@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Pavel Reichl <preichl@redhat.com>

Introduce a new __xfs_rwsem_islocked predicate to encapsulate checking
the state of a rw_semaphore, then refactor xfs_isilocked to use it.

Signed-off-by: Pavel Reichl <preichl@redhat.com>
Suggested-by: Dave Chinner <dchinner@redhat.com>
Suggested-by: Eric Sandeen <sandeen@redhat.com>
Suggested-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/xfs/xfs_inode.c | 34 ++++++++++++++++++++++++++--------
 fs/xfs/xfs_inode.h |  2 +-
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index a835ceb79ba5..359e2cd44ad7 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -343,9 +343,29 @@ xfs_ilock_demote(
 }
 
 #if defined(DEBUG) || defined(XFS_WARN)
-int
+static inline bool
+__xfs_rwsem_islocked(
+	struct rw_semaphore	*rwsem,
+	bool			shared)
+{
+	if (!debug_locks)
+		return rwsem_is_locked(rwsem);
+
+	if (!shared)
+		return lockdep_is_held_type(rwsem, 0);
+
+	/*
+	 * We are checking that the lock is held at least in shared
+	 * mode but don't care that it might be held exclusively
+	 * (i.e. shared | excl). Hence we check if the lock is held
+	 * in any mode rather than an explicit shared mode.
+	 */
+	return lockdep_is_held_type(rwsem, -1);
+}
+
+bool
 xfs_isilocked(
-	xfs_inode_t		*ip,
+	struct xfs_inode	*ip,
 	uint			lock_flags)
 {
 	if (lock_flags & (XFS_ILOCK_EXCL|XFS_ILOCK_SHARED)) {
@@ -360,15 +380,13 @@ xfs_isilocked(
 		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
 	}
 
-	if (lock_flags & (XFS_IOLOCK_EXCL|XFS_IOLOCK_SHARED)) {
-		if (!(lock_flags & XFS_IOLOCK_SHARED))
-			return !debug_locks ||
-				lockdep_is_held_type(&VFS_I(ip)->i_rwsem, 0);
-		return rwsem_is_locked(&VFS_I(ip)->i_rwsem);
+	if (lock_flags & (XFS_IOLOCK_EXCL | XFS_IOLOCK_SHARED)) {
+		return __xfs_rwsem_islocked(&VFS_I(ip)->i_rwsem,
+				(lock_flags & XFS_IOLOCK_SHARED));
 	}
 
 	ASSERT(0);
-	return 0;
+	return false;
 }
 #endif
 
diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index 4b6703dbffb8..4b5202ae8ebb 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -410,7 +410,7 @@ void		xfs_ilock(xfs_inode_t *, uint);
 int		xfs_ilock_nowait(xfs_inode_t *, uint);
 void		xfs_iunlock(xfs_inode_t *, uint);
 void		xfs_ilock_demote(xfs_inode_t *, uint);
-int		xfs_isilocked(xfs_inode_t *, uint);
+bool		xfs_isilocked(struct xfs_inode *, uint);
 uint		xfs_ilock_data_map_shared(struct xfs_inode *);
 uint		xfs_ilock_attr_map_shared(struct xfs_inode *);
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
