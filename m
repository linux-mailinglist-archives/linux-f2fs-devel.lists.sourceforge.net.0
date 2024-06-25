Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2C915D30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLwdO-0008MS-CE;
	Tue, 25 Jun 2024 03:14:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLwdM-0008MF-L7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NmHJXYGisQ1RRwa4ETkJsHZbDJngqxhu7cjxBCLxnGU=; b=bHOCYpcAe3OUmfLIRSaoxDDC6R
 llUCG/cW4XuBGD7jZKwR8kfHjVCcgH2kdCcd/aCE7t8sLr9g5P6hcIeaScKy34dV2qyEC1khZCTsn
 6xp9G8o2Ajb4vfUIcMhICfEaGTpQqzMWZNH3ZfASMOqY7jcGEeBJAYQArL0vtibsqpKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NmHJXYGisQ1RRwa4ETkJsHZbDJngqxhu7cjxBCLxnGU=; b=S3L617wsPK7AbVhdrb4A+xuBCN
 DqN95UX7NLc9YvLiMRWlyA1xMCXQuM/edkWE3sgdtPRO75UR9RS5Flxf6QCK0lEtnNPYkfsPAja5D
 mvsPw7RKfystaKynYn9L5rqorPotmwQE6EpmL+M0x74VBcTkdlejihl63GM4GrqhhGws=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLwdN-0001VR-0s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCC96611CC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 03:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912ECC4AF07;
 Tue, 25 Jun 2024 03:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719285245;
 bh=7i9ANIkcb5e+IjTGnXP1+fnS3hh1UJ930GMPGvqfu9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oMOyQR//ysFjBcydfxv3gFlf1Xl1zVfYea9wWSmsmP7PuAKdH2XRqxpQeBvN5fA6q
 YzzQsRaPy8yrJSo+a0BFSoZGbpseVHwr5mlpjK3l9xj8fbRlmzVxaKpQuT9Sslchtt
 hubqkx+BApzr9szwqKRcMXJAav2kTc4TCbD94LiG3lJP1DpEOgF8/fYdDPLEelq6qU
 l33HIsHL2lIdUZTr79zgDPr0cqe/s1YY+YXQIkwkSiFbG+Lwpb//PWreEFEAxlV7Ba
 +WM6BMUOWrzs+tu2YA+IzWwLaN7KZmimrX/Z3MnOcbxCRJASdsij4aDkXp/XOiKIiB
 SOpaIjO7/PJmA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 11:13:50 +0800
Message-Id: <20240625031351.3586955-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625031351.3586955-1-chao@kernel.org>
References: <20240625031351.3586955-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We should always truncate pagecache while truncating on-disk
 data. Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/file.c | 1 + 1 file changed,
 1 insertion(+)
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLwdN-0001VR-0s
Subject: [f2fs-dev] [PATCH 3/4] f2fs: atomic: fix to truncate pagecache
 before on-disk metadata truncation
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should always truncate pagecache while truncating on-disk data.

Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2203904383a6..0355cb054521 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2185,6 +2185,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 	} else {
 		/* Reuse the already created COW inode */
+		truncate_setsize(inode, 0);
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
 		if (ret) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
