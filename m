Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADDC788A87
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:05:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXRc-00047q-SE;
	Fri, 25 Aug 2023 14:05:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXRZ-00047e-Jm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjhC+caj2gJRQH+sSsUlDYCC/6KksdCJUKl454sdMkA=; b=T+ucojVbIDl+zOL/CnZ2hX4Mqq
 SlB8ioqr7Y10sHOM/D6N/OetkjW4IPMbGMjZ8r5dm7O9gWi++/ZJibBNzulr/OZTTqUUU6w3skKAX
 OW/pvRGK4nS2NFVEbyy6egzHWK4Yw8KtVSa4Yi6YUPVqyFz9u6bEwoJ0dfxusZ1YQ7wg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mjhC+caj2gJRQH+sSsUlDYCC/6KksdCJUKl454sdMkA=; b=JuXQ5zEgQSmFmXtnYZwjc5dG3x
 vnsN1MjYEjWI2+KYs6qX9Xg330yFmD3ePNWvK7mMmEDynxwctAj4wzvGApAaL0L1jfQhjvP7itpxT
 VWjaWu567TNC0HCUqBBxBhgHp51wLwsmDBKLKEtGovuc+IeRlyugz6OOhVNjH2xerAR0=;
Received: from out-247.mta1.migadu.com ([95.215.58.247])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXRY-0007mS-Nb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:05:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692972337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjhC+caj2gJRQH+sSsUlDYCC/6KksdCJUKl454sdMkA=;
 b=O2I4LuIVYgSn+nmzJUq/UHofHubEntakWSPFjqloiwwujETAFgWOGN3xteSPe9gSVMqAFq
 d8hRn0Wa7uhhjg2GTvasuKf8CHjMi2bI9Lkmg+s4bspXsO5Xaxy412PPH/FB0SLGDG9CfT
 9ayHr7HUCratE15Bg5Ihc+obof/8RuQ=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:28 +0800
Message-Id: <20230825135431.1317785-27-hao.xu@linux.dev>
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
 Content preview:  From: Hao Xu <howeyxu@tencent.com> if the log transaction
 is a sync one, let's fail the nowait try and return -EAGAIN directly since
 sync transaction means blocked by IO. Signed-off-by: Hao Xu
 <howeyxu@tencent.com>
 --- fs/xfs/xfs_trans.c | 14 +++++++++++++- 1 file changed, 13 insertions(+),
 1 deletion(-) 
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
X-Headers-End: 1qZXRY-0007mS-Nb
Subject: [f2fs-dev] [PATCH 26/29] xfs: return -EAGAIN when nowait meets sync
 in transaction commit
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

if the log transaction is a sync one, let's fail the nowait try and
return -EAGAIN directly since sync transaction means blocked by IO.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_trans.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 7988b4c7f36e..f1f84a3dd456 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -968,12 +968,24 @@ __xfs_trans_commit(
 	xfs_csn_t		commit_seq = 0;
 	int			error = 0;
 	int			sync = tp->t_flags & XFS_TRANS_SYNC;
+	bool			nowait = tp->t_flags & XFS_TRANS_NOWAIT;
+	bool			perm_log = tp->t_flags & XFS_TRANS_PERM_LOG_RES;
 
 	trace_xfs_trans_commit(tp, _RET_IP_);
 
+	if (nowait && sync) {
+		/*
+		 * Currently nowait is only from xfs_vn_update_time()
+		 * so perm_log is always false here, but let's make
+		 * code general.
+		 */
+		if (perm_log)
+			xfs_defer_cancel(tp);
+		goto out_unreserve;
+	}
 	error = xfs_trans_run_precommits(tp);
 	if (error) {
-		if (tp->t_flags & XFS_TRANS_PERM_LOG_RES)
+		if (perm_log)
 			xfs_defer_cancel(tp);
 		goto out_unreserve;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
