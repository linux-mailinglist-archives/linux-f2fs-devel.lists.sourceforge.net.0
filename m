Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A22788991
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:00:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXM0-0003mP-Tv;
	Fri, 25 Aug 2023 14:00:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXLz-0003m8-Aw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 13:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WRD02daxOp9FNChzaFYS1lXdVleuK5a0no8X9tPyoYM=; b=M2f3KKECGhzUNzTwxWD6DFAXxH
 hregV6W6Ly/tYtWLEoOa0vxuywe001fLEqK4+KkGkNgf2bRyh9B47RAdRWEErQ9GQ8yfoRsteN/bd
 syqA+j9mb03OdJ982d5sDE07YV3SA3qtgemdDNhvrAk6DkXelc4RMIWWGlCmuZblIbXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WRD02daxOp9FNChzaFYS1lXdVleuK5a0no8X9tPyoYM=; b=DmxLAkP2qVK7Z6+NXIbVhDtch1
 2GgW/XHwzFOOQwW8mSw/UplDlAZDzC1sHrPVF7zVd36KQX4tpiJnZp/AZ3hSEDlfPdrPBeYhSd6eh
 6Lskose3ZlLPiQjFvfN+6O0R2xrDCScwU6RJaG4NRt26koYRQ4EHS+mZYkNlIwcPsz+g=;
Received: from out-246.mta1.migadu.com ([95.215.58.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXLy-00FHnf-Dj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 13:59:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692971991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRD02daxOp9FNChzaFYS1lXdVleuK5a0no8X9tPyoYM=;
 b=KOUX30U5aMel7ZOrU6vyW+bfFawd12zc010HOkye0FIA5XwWQ8KuInrnnmEFvcM8/s51Q/
 AaOybn5P1rP9UUeek73yc4I2uwInaXUHDAuF9iPRuAYZ+C8EXUIDSwZm4Bf0ZiLG750HKq
 BEWS22oRahJI/f4a4TxHtu+cFMHMdVg=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:12 +0800
Message-Id: <20230825135431.1317785-11-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hao Xu <howeyxu@tencent.com> Add a new time flag
 S_NOWAIT
 to support nowait time update. Deliver it to specific filesystem and error
 out -EAGAIN when it would block. Signed-off-by: Hao Xu <howeyxu@tencent.com>
 --- fs/inode.c | 9 +++++---- fs/xfs/xfs_iops.c | 8 +++++++- include/linux/fs.h
 | 1 + 3 files changed, 13 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qZXLy-00FHnf-Dj
Subject: [f2fs-dev] [PATCH 10/29] vfs: add S_NOWAIT for nowait time update
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hao Xu <howeyxu@tencent.com>

Add a new time flag S_NOWAIT to support nowait time update. Deliver it
to specific filesystem and error out -EAGAIN when it would block.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/inode.c         | 9 +++++----
 fs/xfs/xfs_iops.c  | 8 +++++++-
 include/linux/fs.h | 1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index e83b836f2d09..eb3db34a3e6e 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1966,12 +1966,13 @@ int touch_atime(const struct path *path, bool nowait)
 	struct vfsmount *mnt = path->mnt;
 	struct inode *inode = d_inode(path->dentry);
 	struct timespec64 now;
+	int ret = 0;
 
 	if (!atime_needs_update(path, inode))
-		return 0;
+		return ret;
 
 	if (!sb_start_write_trylock(inode->i_sb))
-		return 0;
+		return ret;
 
 	if (__mnt_want_write(mnt) != 0)
 		goto skip_update;
@@ -1985,11 +1986,11 @@ int touch_atime(const struct path *path, bool nowait)
 	 * of the fs read only, e.g. subvolumes in Btrfs.
 	 */
 	now = current_time(inode);
-	inode_update_time(inode, &now, S_ATIME);
+	ret = inode_update_time(inode, &now, S_ATIME | (nowait ? S_NOWAIT : 0));
 	__mnt_drop_write(mnt);
 skip_update:
 	sb_end_write(inode->i_sb);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(touch_atime);
 
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 24718adb3c16..bf1d4c31f009 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1053,7 +1053,13 @@ xfs_vn_update_time(
 	if (error)
 		return error;
 
-	xfs_ilock(ip, XFS_ILOCK_EXCL);
+	if (flags & S_NOWAIT) {
+		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
+			return -EAGAIN;
+	} else {
+		xfs_ilock(ip, XFS_ILOCK_EXCL);
+	}
+
 	if (flags & S_CTIME)
 		inode->i_ctime = *now;
 	if (flags & S_MTIME)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ed60b3d70d1e..f8c267ee5cb7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2198,6 +2198,7 @@ enum file_time_flags {
 	S_MTIME = 2,
 	S_CTIME = 4,
 	S_VERSION = 8,
+	S_NOWAIT = 16,
 };
 
 extern bool atime_needs_update(const struct path *, struct inode *);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
