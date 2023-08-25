Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F08197889D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:02:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXO7-0004nF-WA;
	Fri, 25 Aug 2023 14:02:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXO6-0004n2-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d4c4JLcaw2hXejiOrGnFBQPVU2RM5hO/J+/aXcCYNEw=; b=IqWD20UnqRNkqp3Z+0RS9Jf0ZX
 t6MfO+ebk1G9jAa4qB/7fwTcHfhTNbWyW0+mS5LMre87Issctt4cywJHsQJi7sQTUFKc/XtuyZxVO
 /6LDknc3/KfvLHjZY7ndqAhOL4o/I15x/85wNuWsI1RyzisWGaVQ9mOHkXQ/r+J/i0GQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d4c4JLcaw2hXejiOrGnFBQPVU2RM5hO/J+/aXcCYNEw=; b=ZvonbIJQSolrYYgfDAOX8hNktC
 FP/JaFSFyRgBd2C9tOPJUlW5L++ZltEAG7Qab+JlWpFizgMuOm0EFoYr94X6l/r4UmpNDpyMfbFuI
 FBXfMWcRlE8tPWATw3vBGjF5Ad3zvcljFiSUHJi3haM3h7FZ1x1IMs3D2nyXVpA5YpNM=;
Received: from out-243.mta1.migadu.com ([95.215.58.243])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXO3-0007bR-5J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:02:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4c4JLcaw2hXejiOrGnFBQPVU2RM5hO/J+/aXcCYNEw=;
 b=khe71NuAofqjJQcQBQh8qaSLQW5l+ABTZSFJ8Vvkem+VJ7Uz3lPnhsRbG1QiQpVIB0WzKu
 TWSkBSbRJUjuC3LbOfeO0WhIFxiibQKBlsbXK8GLa0a537NlmAJDnBgPGmvzDTS140+5t+
 gKh3+G5l/F0DpREKKRmtO+kz90FC86s=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:17 +0800
Message-Id: <20230825135431.1317785-16-hao.xu@linux.dev>
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
 Content preview: From: Hao Xu <howeyxu@tencent.com> Don't sleep and wait for
 more space for a log ticket in xlog_grant_head_check() when it is in nowait
 case. Signed-off-by: Hao Xu <howeyxu@tencent.com> --- fs/xfs/xfs_log.c |
 15 +++++++++------ 1 file changed, 9 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1qZXO3-0007bR-5J
Subject: [f2fs-dev] [PATCH 15/29] xfs: don't wait for free space in
 xlog_grant_head_check() in nowait case
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

Don't sleep and wait for more space for a log ticket in
xlog_grant_head_check() when it is in nowait case.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 90fbb1c0eca2..a2aabdd42a29 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -341,7 +341,8 @@ xlog_grant_head_check(
 	struct xlog		*log,
 	struct xlog_grant_head	*head,
 	struct xlog_ticket	*tic,
-	int			*need_bytes)
+	int			*need_bytes,
+	bool			nowait)
 {
 	int			free_bytes;
 	int			error = 0;
@@ -360,13 +361,15 @@ xlog_grant_head_check(
 		spin_lock(&head->lock);
 		if (!xlog_grant_head_wake(log, head, &free_bytes) ||
 		    free_bytes < *need_bytes) {
-			error = xlog_grant_head_wait(log, head, tic,
-						     *need_bytes);
+			error = nowait ?
+				-EAGAIN : xlog_grant_head_wait(log, head, tic,
+							       *need_bytes);
 		}
 		spin_unlock(&head->lock);
 	} else if (free_bytes < *need_bytes) {
 		spin_lock(&head->lock);
-		error = xlog_grant_head_wait(log, head, tic, *need_bytes);
+		error = nowait ? -EAGAIN : xlog_grant_head_wait(log, head, tic,
+								*need_bytes);
 		spin_unlock(&head->lock);
 	}
 
@@ -428,7 +431,7 @@ xfs_log_regrant(
 	trace_xfs_log_regrant(log, tic);
 
 	error = xlog_grant_head_check(log, &log->l_write_head, tic,
-				      &need_bytes);
+				      &need_bytes, false);
 	if (error)
 		goto out_error;
 
@@ -487,7 +490,7 @@ xfs_log_reserve(
 	trace_xfs_log_reserve(log, tic);
 
 	error = xlog_grant_head_check(log, &log->l_reserve_head, tic,
-				      &need_bytes);
+				      &need_bytes, nowait);
 	if (error)
 		goto out_error;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
