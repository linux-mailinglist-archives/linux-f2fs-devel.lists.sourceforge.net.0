Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39326788A1D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:03:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXPa-0004wh-Dj;
	Fri, 25 Aug 2023 14:03:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXPY-0004wb-Qv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T6ViUZBPx7ad0ZahN3iXc6h6e/WwSaru8OskP5bAugQ=; b=XDpXzr5v8+yc8ZGQp5Im4B6W91
 f0nGvHB4Wdl/mJhAd35lu9t/ARRP6wP8qNLECGy+SfTBeNHSn0pROynuDt21hgm6zk7ahCMvGGTHx
 ccMwxjTrQIum0we+SrrhNy8Q7w8Papf3JfVeQSUXxZJJbv3NJEU8n+/jWiwXoGCgQKR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T6ViUZBPx7ad0ZahN3iXc6h6e/WwSaru8OskP5bAugQ=; b=GvYbfQ6dsrbuvY4WrQq0c2QfXU
 xNVbq3GFGi88NzquVlADKMoq8wGLhr35zCtQl44hDK3Bi2Z/a5wCHVdW8YUm5ODmcgneZ1DXDLWRs
 B+9bEz16sBH4EWGKsCpap+zQx8wEdt15a/0GKxFhFgbskHX1Yfj3vHNsHwLMpTenvIpU=;
Received: from out-243.mta1.migadu.com ([95.215.58.243])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXPY-0007gI-GW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:03:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6ViUZBPx7ad0ZahN3iXc6h6e/WwSaru8OskP5bAugQ=;
 b=ES2TiCn948OXPBoEBgWTcBO0RS4z23ivDrdXlTdAtaw6PThdxWDWOdUDMqwN5Zn7WD+dyR
 mB9Bpqj2y+SXbSPXBOj6qNtlf9PRruM/6AA9li5Lcnl6yPomOz6TlD4q7SN/nyqOvAgxMU
 ufKXd8FiPwyCFvbnzPL8RetLQf6iEEM=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:22 +0800
Message-Id: <20230825135431.1317785-21-hao.xu@linux.dev>
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
 Content preview:  From: Hao Xu <howeyxu@tencent.com> Previously, if we fail
 to get the memory we need, -ENOMEM is returned. It can be -EAGAIN now since
 we support nowait now. Return the latter when it is the case. Involved
 functions are: _xfs_buf_map_pa [...] 
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
X-Headers-End: 1qZXPY-0007gI-GW
Subject: [f2fs-dev] [PATCH 20/29] xfs: distinguish error type of memory
 allocation failure for nowait case
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

Previously, if we fail to get the memory we need, -ENOMEM is returned.
It can be -EAGAIN now since we support nowait now. Return the latter
when it is the case. Involved functions are:  _xfs_buf_map_pages(),
xfs_buf_get_maps(), xfs_buf_alloc_kmem() and xfs_buf_alloc_pages().

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_buf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 8b800ce28996..a6e6e64ff940 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -192,7 +192,7 @@ xfs_buf_get_maps(
 	bp->b_maps = kmem_zalloc(map_count * sizeof(struct xfs_buf_map),
 				KM_NOFS);
 	if (!bp->b_maps)
-		return -ENOMEM;
+		return bp->b_flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 	return 0;
 }
 
@@ -339,7 +339,7 @@ xfs_buf_alloc_kmem(
 
 	bp->b_addr = kmem_alloc(size, kmflag_mask);
 	if (!bp->b_addr)
-		return -ENOMEM;
+		return flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 
 	if (((unsigned long)(bp->b_addr + size - 1) & PAGE_MASK) !=
 	    ((unsigned long)bp->b_addr & PAGE_MASK)) {
@@ -363,6 +363,7 @@ xfs_buf_alloc_pages(
 {
 	gfp_t		gfp_mask = __GFP_NOWARN;
 	long		filled = 0;
+	bool		nowait = flags & XBF_NOWAIT;
 
 	if (flags & XBF_READ_AHEAD)
 		gfp_mask |= __GFP_NORETRY;
@@ -377,7 +378,7 @@ xfs_buf_alloc_pages(
 		bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
 					gfp_mask);
 		if (!bp->b_pages)
-			return -ENOMEM;
+			return nowait ? -EAGAIN : -ENOMEM;
 	}
 	bp->b_flags |= _XBF_PAGES;
 
@@ -451,7 +452,7 @@ _xfs_buf_map_pages(
 		memalloc_nofs_restore(nofs_flag);
 
 		if (!bp->b_addr)
-			return -ENOMEM;
+			return flags & XBF_NOWAIT ? -EAGAIN : -ENOMEM;
 	}
 
 	return 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
