Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353D7889E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:02:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXOI-0003ga-3t;
	Fri, 25 Aug 2023 14:02:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXOG-0003gT-O3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWqxpxLv+BWdZ1zPLCWWiPjW3gW3QR8GdaNCgbqB+rA=; b=C4kXcrnmCOClQ7hfnPfjdQbxrL
 Yuo9UoQ7pr0rfbeBgbBy5kHJ3EnmG0yi9qm8JMy1vuC3LIP+knsXh1YqJNYQkfRQ26N/Xn1m0Coy5
 DpHhizEC9j9yvaiW6j/uuCRMTaMZ4rqdYaLcGZPZSg1ejvQbB+xtGsAPp6VcE/N/D8SE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KWqxpxLv+BWdZ1zPLCWWiPjW3gW3QR8GdaNCgbqB+rA=; b=HLsT2o387wZfWl7o9K1SIvOzp+
 dnldLMmdYmUIy0yuK8fjVY3k3O777AYN7l6/9+jClGoVQHiSDvHDSeDzwngRlEjSk/yVclUgD0yIm
 II0WLnDdE90d3wfRatSCU6B62lTFwKvT0iYp2AalaYLvlKO3JZsE3Y63oKYzCWKSz4Qc=;
Received: from out-246.mta1.migadu.com ([95.215.58.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXOG-00FHvj-Vt for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:02:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWqxpxLv+BWdZ1zPLCWWiPjW3gW3QR8GdaNCgbqB+rA=;
 b=W3mJ9hHH5VKigloC5U9bTjeZXL1WzXE+if57PbkgslJR/vwxXv7urAz03rnLzn8z8erL5h
 VCpx6iOsBDC23kpw8k8XGE0qr0cLxvBRgKj1NfrV6YtEtntJMub0qfyQ1aHr3mZsH0O0dL
 P836PFFsTuNux9i0jwQOVu5ehTDOpZM=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:18 +0800
Message-Id: <20230825135431.1317785-17-hao.xu@linux.dev>
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
 Content preview: From: Hao Xu <howeyxu@tencent.com> Add nowait parameter for
 xfs_inode_item_init() to support nowait semantics. Signed-off-by: Hao Xu
 <howeyxu@tencent.com> --- fs/xfs/libxfs/xfs_trans_inode.c | 3 ++-
 fs/xfs/xfs_inode_item.c
 | 12 ++++++++---- fs/xfs/xfs_inode_item.h | 3 ++- 3 files changed,
 12 insertions(+), 6 d [...] 
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
X-Headers-End: 1qZXOG-00FHvj-Vt
Subject: [f2fs-dev] [PATCH 16/29] xfs: add nowait parameter for
 xfs_inode_item_init()
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

Add nowait parameter for xfs_inode_item_init() to support nowait
semantics.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_trans_inode.c |  3 ++-
 fs/xfs/xfs_inode_item.c         | 12 ++++++++----
 fs/xfs/xfs_inode_item.h         |  3 ++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index cb4796b6e693..e7a8f63c8975 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -33,7 +33,8 @@ xfs_trans_ijoin(
 
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
 	if (ip->i_itemp == NULL)
-		xfs_inode_item_init(ip, ip->i_mount);
+		xfs_inode_item_init(ip, ip->i_mount,
+				    tp->t_flags & XFS_TRANS_NOWAIT);
 	iip = ip->i_itemp;
 
 	ASSERT(iip->ili_lock_flags == 0);
diff --git a/fs/xfs/xfs_inode_item.c b/fs/xfs/xfs_inode_item.c
index 91c847a84e10..1742920bb4ce 100644
--- a/fs/xfs/xfs_inode_item.c
+++ b/fs/xfs/xfs_inode_item.c
@@ -825,21 +825,25 @@ static const struct xfs_item_ops xfs_inode_item_ops = {
 /*
  * Initialize the inode log item for a newly allocated (in-core) inode.
  */
-void
+int
 xfs_inode_item_init(
 	struct xfs_inode	*ip,
-	struct xfs_mount	*mp)
+	struct xfs_mount	*mp,
+	bool			nowait)
 {
 	struct xfs_inode_log_item *iip;
+	gfp_t gfp_flags = GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL);
 
 	ASSERT(ip->i_itemp == NULL);
-	iip = ip->i_itemp = kmem_cache_zalloc(xfs_ili_cache,
-					      GFP_KERNEL | __GFP_NOFAIL);
+	iip = ip->i_itemp = kmem_cache_zalloc(xfs_ili_cache, gfp_flags);
+	if (!iip)
+		return -EAGAIN;
 
 	iip->ili_inode = ip;
 	spin_lock_init(&iip->ili_lock);
 	xfs_log_item_init(mp, &iip->ili_item, XFS_LI_INODE,
 						&xfs_inode_item_ops);
+	return 0;
 }
 
 /*
diff --git a/fs/xfs/xfs_inode_item.h b/fs/xfs/xfs_inode_item.h
index 377e06007804..7ba6f8a6b243 100644
--- a/fs/xfs/xfs_inode_item.h
+++ b/fs/xfs/xfs_inode_item.h
@@ -42,7 +42,8 @@ static inline int xfs_inode_clean(struct xfs_inode *ip)
 	return !ip->i_itemp || !(ip->i_itemp->ili_fields & XFS_ILOG_ALL);
 }
 
-extern void xfs_inode_item_init(struct xfs_inode *, struct xfs_mount *);
+extern int xfs_inode_item_init(struct xfs_inode *ip, struct xfs_mount *mp,
+			       bool nowait);
 extern void xfs_inode_item_destroy(struct xfs_inode *);
 extern void xfs_iflush_abort(struct xfs_inode *);
 extern void xfs_iflush_shutdown_abort(struct xfs_inode *);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
