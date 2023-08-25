Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416B7889A9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:00:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXMl-0004jX-IA;
	Fri, 25 Aug 2023 14:00:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXMj-0004jR-Qk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A8n142m+ckTq2ok9t7Tm2FnSZDGwRTGaDgQRQd0QVrs=; b=EuNu6yccMTSo7/KyWqWQKOuZSq
 wRCE7usj5cKkSETU4qSJl44NzF2dZTqqNo3DsL1ueh2IoiuScNaDoOvdYtrfJSe60THV8RKj6gtg+
 AeLRDTgZq5Ytp2ALd/xYDM9LydPOTOsgvkQXyCLkOAhzFreDbqe7hMWEH51iuefV+4Ws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A8n142m+ckTq2ok9t7Tm2FnSZDGwRTGaDgQRQd0QVrs=; b=Zh3avMLpMRRMsi9BIAZNzf07q6
 nzx8Qbzy7aXu8RuHGmIEX89canEsnF84+7K0KGV5wsUr+RgrLA5NQvZUb5m+Oszn+AGHyKzGVkFWQ
 Go19IyQHocNOyZ2eKhXgexDVB0/8C+t6Wt3abJ2j1+jBETqm5Jfx3LvtSoXDNhKKj3dw=;
Received: from out-246.mta1.migadu.com ([95.215.58.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXMj-00FHqZ-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:00:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8n142m+ckTq2ok9t7Tm2FnSZDGwRTGaDgQRQd0QVrs=;
 b=pz2+RJXny/FRc9X5ZHvo0v2sP0AhNIbG6GqEDC3f4IgSNhM3HBNVDwOESMUSOR4IEMUxcQ
 QeB+zNMG6saCP+3Ee3iNvTaLm94PmwVrh29h0zPxcQxdxo6uNrunXvw2MGBXff+gKAxGGD
 nCmOsY1G1aaOlGneScmRPtSGG9/rCYg=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:14 +0800
Message-Id: <20230825135431.1317785-13-hao.xu@linux.dev>
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
 Content preview:  From: Hao Xu <howeyxu@tencent.com> Enforce GFP_NOIO logic
 implicitly by set pflags if we are in nowait time update process. Nowait
 semantics
 means no waiting for IO, therefore GFP_NOIO is needed. Signed-off-by: Hao
 Xu <howeyxu@tencent.com> --- fs/xfs/xfs_iops.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-) 
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
X-Headers-End: 1qZXMj-00FHqZ-EJ
Subject: [f2fs-dev] [PATCH 12/29] xfs: enforce GFP_NOIO implicitly during
 nowait time update
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

Enforce GFP_NOIO logic implicitly by set pflags if we are in nowait
time update process. Nowait semantics means no waiting for IO,
therefore GFP_NOIO is needed.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_iops.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index bf1d4c31f009..5fa391083de9 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1037,6 +1037,8 @@ xfs_vn_update_time(
 	int			log_flags = XFS_ILOG_TIMESTAMP;
 	struct xfs_trans	*tp;
 	int			error;
+	int			old_pflags;
+	bool			nowait = flags & S_NOWAIT;
 
 	trace_xfs_update_time(ip);
 
@@ -1049,13 +1051,18 @@ xfs_vn_update_time(
 		log_flags |= XFS_ILOG_CORE;
 	}
 
+	if (nowait)
+		old_pflags = memalloc_noio_save();
+
 	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);
 	if (error)
-		return error;
+		goto out;
 
-	if (flags & S_NOWAIT) {
-		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
-			return -EAGAIN;
+	if (nowait) {
+		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL)) {
+			error = -EAGAIN;
+			goto out;
+		}
 	} else {
 		xfs_ilock(ip, XFS_ILOCK_EXCL);
 	}
@@ -1069,7 +1076,12 @@ xfs_vn_update_time(
 
 	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
 	xfs_trans_log_inode(tp, ip, log_flags);
-	return xfs_trans_commit(tp);
+	error = xfs_trans_commit(tp);
+
+out:
+	if (nowait)
+		memalloc_noio_restore(old_pflags);
+	return error;
 }
 
 STATIC int
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
