Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54905788A04
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:02:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXOj-0003zm-7d;
	Fri, 25 Aug 2023 14:02:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXOh-0003zf-UO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3IHqyAGVDJ58osMbe/1AdWvJDmRup4/lFC37whRevKc=; b=C7yXHhXyBCEKuvpc7a9sWSfVIh
 nghToDwH0vBTf02pquYEVeRJ1/eZzJE5eztZ6CmuuLN4+v+A1juCuWWl59uTGwkjFvymWLkVtmecq
 r1N9QwBktngTenchsApA4NiVdL4scOSlj0+GnGJl0BzfRt7mY28ADSN7Q9V0+S0FjYGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3IHqyAGVDJ58osMbe/1AdWvJDmRup4/lFC37whRevKc=; b=Xda3LNrHEMqHrmIf76ndXhtkNo
 tWEfVCH/H8sok0C6wqATUPRhr4WN7RPJAntTzKnl8wktLwln30tlYYGM3M/1udZlD8cn+Rukil4yR
 5KBnpo57pRa6/LWufgWzAFrMaIiwzOGagG6dejge8/9AR2v/WqorXfj3wxD6t9zib+Pk=;
Received: from out-250.mta1.migadu.com ([95.215.58.250])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXOh-00FHx1-0T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:02:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IHqyAGVDJ58osMbe/1AdWvJDmRup4/lFC37whRevKc=;
 b=Eb4iAdgTR0TpdbPqUzDwHbHxPEh5V68LsiBX5YVrmluxRTdzMTEqMqKrZvLhm9MDpgg3K/
 D2eTyYZZZ+bfvHLihjIIZJ2OKJ2cQ07lnUU3TLxQlV7ixmfK6NG3WLuhhK+cGvea8pFBoo
 CGGtOLVSVaB7g8RjjJfuG0O31ub2h9Y=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:19 +0800
Message-Id: <20230825135431.1317785-18-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hao Xu <howeyxu@tencent.com> Change return value of
 xfs_trans_ijoin() to error out -EAGAIN. Signed-off-by: Hao Xu
 <howeyxu@tencent.com>
 --- fs/xfs/libxfs/xfs_trans_inode.c | 13 +++++++++---- fs/xfs/xfs_iops.c
 | 4 +++- fs/xfs/xfs_trans.h | 2 +- 3 files changed, 13 insertions(+),
 6 deletions(- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qZXOh-00FHx1-0T
Subject: [f2fs-dev] [PATCH 17/29] xfs: make xfs_trans_ijoin() error out
 -EAGAIN
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

Change return value of xfs_trans_ijoin() to error out -EAGAIN.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_trans_inode.c | 13 +++++++++----
 fs/xfs/xfs_iops.c               |  4 +++-
 fs/xfs/xfs_trans.h              |  2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index e7a8f63c8975..7bda62bad90a 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -23,7 +23,7 @@
  * The inode must be locked, and it cannot be associated with any transaction.
  * If lock_flags is non-zero the inode will be unlocked on transaction commit.
  */
-void
+int
 xfs_trans_ijoin(
 	struct xfs_trans	*tp,
 	struct xfs_inode	*ip,
@@ -32,9 +32,12 @@ xfs_trans_ijoin(
 	struct xfs_inode_log_item *iip;
 
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
-	if (ip->i_itemp == NULL)
-		xfs_inode_item_init(ip, ip->i_mount,
-				    tp->t_flags & XFS_TRANS_NOWAIT);
+	if (ip->i_itemp == NULL) {
+		int ret = xfs_inode_item_init(ip, ip->i_mount,
+					      tp->t_flags & XFS_TRANS_NOWAIT);
+		if (ret == -EAGAIN)
+			return ret;
+	}
 	iip = ip->i_itemp;
 
 	ASSERT(iip->ili_lock_flags == 0);
@@ -44,6 +47,8 @@ xfs_trans_ijoin(
 	/* Reset the per-tx dirty context and add the item to the tx. */
 	iip->ili_dirty_flags = 0;
 	xfs_trans_add_item(tp, &iip->ili_item);
+
+	return 0;
 }
 
 /*
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 47b4fd5f8f5c..034a8fea1f8e 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1075,7 +1075,9 @@ xfs_vn_update_time(
 	if (flags & S_ATIME)
 		inode->i_atime = *now;
 
-	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+	error = xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+	if (error)
+		goto out;
 	xfs_trans_log_inode(tp, ip, log_flags);
 	error = xfs_trans_commit(tp);
 
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 6e3646d524ce..f2c05884c4b6 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -226,7 +226,7 @@ bool		xfs_trans_ordered_buf(xfs_trans_t *, struct xfs_buf *);
 void		xfs_trans_dquot_buf(xfs_trans_t *, struct xfs_buf *, uint);
 void		xfs_trans_inode_alloc_buf(xfs_trans_t *, struct xfs_buf *);
 void		xfs_trans_ichgtime(struct xfs_trans *, struct xfs_inode *, int);
-void		xfs_trans_ijoin(struct xfs_trans *, struct xfs_inode *, uint);
+int		xfs_trans_ijoin(struct xfs_trans *, struct xfs_inode *, uint);
 void		xfs_trans_log_buf(struct xfs_trans *, struct xfs_buf *, uint,
 				  uint);
 void		xfs_trans_dirty_buf(struct xfs_trans *, struct xfs_buf *);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
