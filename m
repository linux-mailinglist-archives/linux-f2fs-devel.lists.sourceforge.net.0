Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87489681FA7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:30:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMdbd-0004PQ-06;
	Mon, 30 Jan 2023 23:30:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMdbb-0004PK-Be
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+AuVVL+58wnxa5epYqC7O5CGsMUgy50vGT+Ntssih4=; b=R8brjEUsBZ/ukAje9FljGuxgnz
 GKbOBwdeSaOiHlnlbk/RY78z8qnJ+6e0kswaFyCIoTdJCHiR4iIiUWJZVW9ORCNlIjZo6UqfVLVeD
 pSpBuJ4gi8blk9RshDUVl8ImQJSHDk0Aqos46VURPr0Rx7ng+FRezSp6gMGqK3ZKKOis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X+AuVVL+58wnxa5epYqC7O5CGsMUgy50vGT+Ntssih4=; b=R4qvpBCAwImlYszXOrNiwO751S
 jfFLb97U8zHNBQg8a4yJJ5j5zEVJ2+PpGFSuI4RK+pemCxk0As2nQpVpSPXdh/1v252IjBX4af2DF
 ep+HpdZT9qtdaqZpO9ABPhmfpiAF9omWA32j9nupJLNcFVwSCiSzXbybynarvCZUjKcM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMdbZ-004PgX-C0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:30:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0C42612E4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 23:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13131C433D2;
 Mon, 30 Jan 2023 23:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675121420;
 bh=FMTcL6olniPtNNtz/BQFcjIBXn318WG674lmTqi1i/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WUL0FPguAEci4o3rmKuwbIuHfrpCDE4PCzCMDKo0uS947RQVAez3GvuuCKhWLoJsa
 Ml+fAKNw5mwwvBwpgdGQMT9ETdqLxoIWjYyOHgcWauFgFJC1jB1NRNIDprWnESV4GQ
 4vfRkS1ZzT1mDSrIfOrEwA87GJfZ5nGMzageALzYn5hE+8RUGCkF3HOR+FUXP2rvL9
 0mRmBIV8ZQEj18sXFWq42Ya21KGSIENzcI7UpV88pAQNpiyDWiSW22OdvdDrEVcbJz
 hwLdkW2lSTxZX3zgmO72bZjuui374zNvc+5YSJ6H8Y0XWB2vB6GEqfo9E5W4E2W7/R
 CJJQ9B40manDw==
Date: Mon, 30 Jan 2023 15:30:18 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y9hTCtWLo9/PQnnN@google.com>
References: <20230105233908.1030651-1-jaegeuk@kernel.org>
 <Y74O+5SklijYqMU1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y74O+5SklijYqMU1@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If the storage gives a corrupted node block due to short
 power
 failure and reset, f2fs stops the entire operations by setting the checkpoint
 failure flag. Let's give more chances to live by re-issuing IOs for a while
 in such critical path. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMdbZ-004PgX-C0
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: retry to update the inode page
 given EIO
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the storage gives a corrupted node block due to short power failure and
reset, f2fs stops the entire operations by setting the checkpoint failure flag.

Let's give more chances to live by re-issuing IOs for a while in such critical
path.

Cc: stable@vger.kernel.org
Suggested-by: Randall Huang <huangrandall@google.com>
Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v2:
  - adopting the retry logic

 fs/f2fs/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index e1d6e021e82b..7bf660d4cad9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -724,18 +724,19 @@ void f2fs_update_inode_page(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *node_page;
+	int count = 0;
 retry:
 	node_page = f2fs_get_node_page(sbi, inode->i_ino);
 	if (IS_ERR(node_page)) {
 		int err = PTR_ERR(node_page);
 
-		if (err == -ENOMEM) {
-			cond_resched();
+		/* The node block was truncated. */
+		if (err == -ENOENT)
+			return;
+
+		if (err == -ENOMEM || ++count <= DEFAULT_RETRY_IO_COUNT)
 			goto retry;
-		} else if (err != -ENOENT) {
-			f2fs_stop_checkpoint(sbi, false,
-					STOP_CP_REASON_UPDATE_INODE);
-		}
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_UPDATE_INODE);
 		return;
 	}
 	f2fs_update_inode(inode, node_page);
-- 
2.39.1.456.gfc5497dd1b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
