Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1F37889AD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:01:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXNB-0003rA-18;
	Fri, 25 Aug 2023 14:01:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXN9-0003r4-W9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gDZUIYfeApELVxpIbTdhBYkuCUYVAI89qfTIaKdMRE=; b=XoTc0pPMkzUEJ70iXSgF7//scz
 rmiIy2t2bjrO3XBrbU1wijH/gkp7HCAAav0QiYI4qjNl5VIPVcHH2Ba2mcOlowpwn3Cj7/FMSXVpR
 z8+zMj3WpS9AZuvXTy3sKBqc1rzu13TVSKzL81TYdytHPpFeuClUGQ/w9MhzDdRXwtSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gDZUIYfeApELVxpIbTdhBYkuCUYVAI89qfTIaKdMRE=; b=lbETgWBqVOBafxX3pYxci4VkOG
 R0f3BUBfkFhEwgTU7CZ+T4/K4jsXvjX2ZpjQKdKTnYOyrYSjqarTFkNXAxysZxD5BXrSudO9eU1xp
 02BtnA4vzWmW/wyDSO1eIqbHd5j0ySzHfkq4JymyWmS6rnER7+wAj395AXEjgBQ75I8Q=;
Received: from out-244.mta1.migadu.com ([95.215.58.244])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXN9-0007Yj-8k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:01:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gDZUIYfeApELVxpIbTdhBYkuCUYVAI89qfTIaKdMRE=;
 b=T5TsYuTvtADJBxiHqsewoSqqKK2UBuXMKNSoxaDNp/NJgc7Q8+g8JEetIByTzkVFCGvNzG
 tWnxRnfXklKMFPsrmWvd4eLQKArJQqjl9a4PVTfDC36l8fZblJzTpI0+nRJbIbwH5cYBhh
 1gSrwgjCBl1L9hu8cUoTezmUDMAfEak=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:15 +0800
Message-Id: <20230825135431.1317785-14-hao.xu@linux.dev>
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
 Content preview: From: Hao Xu <howeyxu@tencent.com> There are locks in
 xfs_trans_alloc(), 
 spot them and apply trylock logic. Make them return -EAGAIN when it would
 block. To achieve this, add nowait parameter for those functions in the path.
 Besides, a [...] 
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
X-Headers-End: 1qZXN9-0007Yj-8k
Subject: [f2fs-dev] [PATCH 13/29] xfs: make xfs_trans_alloc() support nowait
 semantics
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

There are locks in xfs_trans_alloc(), spot them and apply trylock logic.
Make them return -EAGAIN when it would block. To achieve this, add
nowait parameter for those functions in the path. Besides, add a generic
transaction flag XFS_TRANS_NOWAIT to deliver nowait info.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_shared.h |  2 ++
 fs/xfs/xfs_iops.c          |  3 ++-
 fs/xfs/xfs_trans.c         | 21 ++++++++++++++++++---
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_shared.h b/fs/xfs/libxfs/xfs_shared.h
index c4381388c0c1..0ba3d6f53405 100644
--- a/fs/xfs/libxfs/xfs_shared.h
+++ b/fs/xfs/libxfs/xfs_shared.h
@@ -83,6 +83,8 @@ void	xfs_log_get_max_trans_res(struct xfs_mount *mp,
  * made then this algorithm will eventually find all the space it needs.
  */
 #define XFS_TRANS_LOWMODE	0x100	/* allocate in low space mode */
+/* Transaction should follow nowait semantics */
+#define XFS_TRANS_NOWAIT		(1u << 9)
 
 /*
  * Field values for xfs_trans_mod_sb.
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 5fa391083de9..47b4fd5f8f5c 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1054,7 +1054,8 @@ xfs_vn_update_time(
 	if (nowait)
 		old_pflags = memalloc_noio_save();
 
-	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);
+	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0,
+				nowait ? XFS_TRANS_NOWAIT : 0, &tp);
 	if (error)
 		goto out;
 
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 8c0bfc9a33b1..dbec685f4f4a 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -251,6 +251,9 @@ xfs_trans_alloc(
 	struct xfs_trans	*tp;
 	bool			want_retry = true;
 	int			error;
+	bool			nowait = flags & XFS_TRANS_NOWAIT;
+	gfp_t			gfp_flags = GFP_KERNEL |
+					    (nowait ? 0 : __GFP_NOFAIL);
 
 	/*
 	 * Allocate the handle before we do our freeze accounting and setting up
@@ -258,9 +261,21 @@ xfs_trans_alloc(
 	 * by doing GFP_KERNEL allocations inside sb_start_intwrite().
 	 */
 retry:
-	tp = kmem_cache_zalloc(xfs_trans_cache, GFP_KERNEL | __GFP_NOFAIL);
-	if (!(flags & XFS_TRANS_NO_WRITECOUNT))
-		sb_start_intwrite(mp->m_super);
+	tp = kmem_cache_zalloc(xfs_trans_cache, gfp_flags);
+	if (!tp)
+		return -EAGAIN;
+	if (!(flags & XFS_TRANS_NO_WRITECOUNT)) {
+		if (nowait) {
+			bool locked = sb_start_intwrite_trylock(mp->m_super);
+
+			if (!locked) {
+				xfs_trans_cancel(tp);
+				return -EAGAIN;
+			}
+		} else {
+			sb_start_intwrite(mp->m_super);
+		}
+	}
 	xfs_trans_set_context(tp);
 
 	/*
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
