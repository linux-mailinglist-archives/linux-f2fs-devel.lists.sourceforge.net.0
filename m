Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F0788A7A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:05:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXRL-00053Y-G2;
	Fri, 25 Aug 2023 14:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXRK-00053R-0J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6/Nd9xxoGpB2Y5m9xwXDJRTcGKza/1aMnRr8dKaa6VQ=; b=gCpOngYqsezKziiBCQCiEX2fyh
 /5canXq7+v/EkpJN1F97kjksaybvsPoLWx/hA0WkAgm5+ah4DvtMlYZhytw0zgndlrn8Ssl+CpaIu
 tatmCS4Ho+YAvelbJxMv6d4XdSFUM/VvSYeaG4qE8jbx+eRhN5vYCGv0EeNol0NNwsUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6/Nd9xxoGpB2Y5m9xwXDJRTcGKza/1aMnRr8dKaa6VQ=; b=VaU/YXN8tCHF0WxVr6VS7GXhAR
 WBaDjNuR2eEM5gtqUsWhrfE/oFtzQ9Mp8r6DAZSs2RjOFu5drnh2OEw1nr0u5YSJJ07ecxSb8Kj4c
 s3UCuaPahceKN9WUQXQxyI9Pwa6gx3LXy2eoZcfRgA/AbyaVL9jMARW/CCSeTig9dJ5g=;
Received: from out-252.mta1.migadu.com ([95.215.58.252])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXRI-0007l9-Bn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:05:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/Nd9xxoGpB2Y5m9xwXDJRTcGKza/1aMnRr8dKaa6VQ=;
 b=KEbezTf0obDqS0d0+ZY03Au9A3+XAlHMaifao/gSyVuoHlKJlTUkwmI81DvHZmrTrUQaLF
 sGTDWP5rChj2LFxWYHnJBky5ZudbW2OzCc+00JgxX/lbJXlYqo7/5HQVTOk8DmfuG/wY54
 UCC6hfeA7Mu6K3Y30dgBdV885aCoMfc=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:27 +0800
Message-Id: <20230825135431.1317785-26-hao.xu@linux.dev>
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
 Content preview: From: Hao Xu <howeyxu@tencent.com> support nowait for
 xfs_buf_item_init()
 and error out -EAGAIN to _xfs_trans_bjoin() when it would block.
 Signed-off-by:
 Hao Xu <howeyxu@tencent.com> --- fs/xfs/xfs_buf_item.c | 9 +++++++--
 fs/xfs/xfs_buf_item.h
 | 2 +- fs/xfs/xfs_buf_item_recover.c | 2 +- fs/xfs/xfs_trans_buf.c | 16
 +++++++++++++--- 4 fil [...] 
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
X-Headers-End: 1qZXRI-0007l9-Bn
Subject: [f2fs-dev] [PATCH 25/29] xfs: support nowait for xfs_buf_item_init()
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

support nowait for xfs_buf_item_init() and error out -EAGAIN to
_xfs_trans_bjoin() when it would block.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf_item.c         |  9 +++++++--
 fs/xfs/xfs_buf_item.h         |  2 +-
 fs/xfs/xfs_buf_item_recover.c |  2 +-
 fs/xfs/xfs_trans_buf.c        | 16 +++++++++++++---
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
index 023d4e0385dd..b1e63137d65b 100644
--- a/fs/xfs/xfs_buf_item.c
+++ b/fs/xfs/xfs_buf_item.c
@@ -827,7 +827,8 @@ xfs_buf_item_free_format(
 int
 xfs_buf_item_init(
 	struct xfs_buf	*bp,
-	struct xfs_mount *mp)
+	struct xfs_mount *mp,
+	bool   nowait)
 {
 	struct xfs_buf_log_item	*bip = bp->b_log_item;
 	int			chunks;
@@ -847,7 +848,11 @@ xfs_buf_item_init(
 		return 0;
 	}
 
-	bip = kmem_cache_zalloc(xfs_buf_item_cache, GFP_KERNEL | __GFP_NOFAIL);
+	bip = kmem_cache_zalloc(xfs_buf_item_cache,
+				GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL));
+	if (!bip)
+		return -EAGAIN;
+
 	xfs_log_item_init(mp, &bip->bli_item, XFS_LI_BUF, &xfs_buf_item_ops);
 	bip->bli_buf = bp;
 
diff --git a/fs/xfs/xfs_buf_item.h b/fs/xfs/xfs_buf_item.h
index 4d8a6aece995..b1daf8988280 100644
--- a/fs/xfs/xfs_buf_item.h
+++ b/fs/xfs/xfs_buf_item.h
@@ -47,7 +47,7 @@ struct xfs_buf_log_item {
 	struct xfs_buf_log_format __bli_format;	/* embedded in-log header */
 };
 
-int	xfs_buf_item_init(struct xfs_buf *, struct xfs_mount *);
+int	xfs_buf_item_init(struct xfs_buf *bp, struct xfs_mount *mp, bool nowait);
 void	xfs_buf_item_done(struct xfs_buf *bp);
 void	xfs_buf_item_relse(struct xfs_buf *);
 bool	xfs_buf_item_put(struct xfs_buf_log_item *);
diff --git a/fs/xfs/xfs_buf_item_recover.c b/fs/xfs/xfs_buf_item_recover.c
index 43167f543afc..aa64d5a499d6 100644
--- a/fs/xfs/xfs_buf_item_recover.c
+++ b/fs/xfs/xfs_buf_item_recover.c
@@ -429,7 +429,7 @@ xlog_recover_validate_buf_type(
 		struct xfs_buf_log_item	*bip;
 
 		bp->b_flags |= _XBF_LOGRECOVERY;
-		xfs_buf_item_init(bp, mp);
+		xfs_buf_item_init(bp, mp, false);
 		bip = bp->b_log_item;
 		bip->bli_item.li_lsn = current_lsn;
 	}
diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
index 016371f58f26..a1e4f2e8629a 100644
--- a/fs/xfs/xfs_trans_buf.c
+++ b/fs/xfs/xfs_trans_buf.c
@@ -57,13 +57,14 @@ xfs_trans_buf_item_match(
  * If the buffer does not yet have a buf log item associated with it,
  * then allocate one for it.  Then add the buf item to the transaction.
  */
-STATIC void
+STATIC int
 _xfs_trans_bjoin(
 	struct xfs_trans	*tp,
 	struct xfs_buf		*bp,
 	int			reset_recur)
 {
 	struct xfs_buf_log_item	*bip;
+	int ret;
 
 	ASSERT(bp->b_transp == NULL);
 
@@ -72,7 +73,11 @@ _xfs_trans_bjoin(
 	 * it doesn't have one yet, then allocate one and initialize it.
 	 * The checks to see if one is there are in xfs_buf_item_init().
 	 */
-	xfs_buf_item_init(bp, tp->t_mountp);
+	ret = xfs_buf_item_init(bp, tp->t_mountp,
+				tp->t_flags & XFS_TRANS_NOWAIT);
+	if (ret < 0)
+		return ret;
+
 	bip = bp->b_log_item;
 	ASSERT(!(bip->bli_flags & XFS_BLI_STALE));
 	ASSERT(!(bip->__bli_format.blf_flags & XFS_BLF_CANCEL));
@@ -92,6 +97,7 @@ _xfs_trans_bjoin(
 	xfs_trans_add_item(tp, &bip->bli_item);
 	bp->b_transp = tp;
 
+	return 0;
 }
 
 void
@@ -309,7 +315,11 @@ xfs_trans_read_buf_map(
 	}
 
 	if (tp) {
-		_xfs_trans_bjoin(tp, bp, 1);
+		error = _xfs_trans_bjoin(tp, bp, 1);
+		if (error) {
+			xfs_buf_relse(bp);
+			return error;
+		}
 		trace_xfs_trans_read_buf(bp->b_log_item);
 	}
 	ASSERT(bp->b_ops != NULL || ops == NULL);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
