Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D28B4903
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Apr 2024 03:13:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0t6D-00084y-VW;
	Sun, 28 Apr 2024 01:13:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s0t6C-00084k-Oy
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 01:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S1NdVWZG3SLZc60S91TAmq3ZIn8xVEIvw7LoL5nNPxU=; b=T/gtxZsAqmCAWl3hODavYs9r6b
 5eoyKk1XMoMZOf9/oST6Rx77skLVzpGUTa6uvXW2Qhge8C+NJ7v4j2C814b/lVNE4sYFo61VpWThv
 GIdFHBq2ksOBWYVDd76gg2gzw4R70I1Da3RvEjJyPCROL4PndX4PYYQMUuZENW1yZVw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S1NdVWZG3SLZc60S91TAmq3ZIn8xVEIvw7LoL5nNPxU=; b=R
 mENKXtZ8pzyWKwKljkpVyKk1qKdeUd9JdV5St3ZltvbMRw8uxfT6N4WFCEfFbfKm1UpK2wIYQPlzb
 pEOxnTGB86SJvsE6we8AIZbywv0tEw1b3YJ+DLEToMdqclJum6RlLfSn/wRJmTLR6oFnVm613Jy7L
 jwTZtlPaSDZIXH+k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s0t6B-0001MM-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 01:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 942DBCE0174;
 Sun, 28 Apr 2024 01:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A105C113CE;
 Sun, 28 Apr 2024 01:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714266767;
 bh=xjeZ5fQxU+mJQrQpiO4Ugsfp3+1alUdFzcKpzBYO5Dg=;
 h=From:To:Cc:Subject:Date:From;
 b=PG+ypf0oJGq4ZZsBiMn8nrZ4uzXKnlxuK8Y7A7mHk2Hspw3OSPaETCMs4uaokKWJq
 w7BYdvUzhktGl9JuZ4qlXXNamPPwnWDLGwwiJwLZoa+5imsltMhc3jDiNb6IlEZwzc
 DFKv5tTjfqvxxshjgxNMJRb7oeIdfGh519IV/Pvg5BbEXZUI52AyWVeDNxnnttWnn0
 0iEsbP2nVO8TLakkB9/AomDcGiJszM89n3P+iCVm4gr6qyjfPJSPix+2jbJt5oI9XR
 5oTJJu7dRI28s0K1R3U5MjJVIIc+/svLAMToZELoPmcT0xldfIEBxx3TpNHeEYOAuj
 wCJDj9N2HJksQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 28 Apr 2024 09:12:36 +0800
Message-Id: <20240428011236.1008917-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 it breaks pinfile's sematics. Cc: Daeho Jeong <daeho43@gmail.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - fix to disallow OPU on
 pinfile no matter what device type f2fs uses. fs/f2fs/data.c | 5 +++-- 1
 file changed, 3 i [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s0t6B-0001MM-Ub
Subject: [f2fs-dev] [PATCH v2] f2fs: zone: fix to don't trigger OPU on
 pinfile for direct IO
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

Otherwise, it breaks pinfile's sematics.

Cc: Daeho Jeong <daeho43@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix to disallow OPU on pinfile no matter what device type f2fs uses.
 fs/f2fs/data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d8e4434e8801..56600dd43834 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1595,8 +1595,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	}
 
 	/* use out-place-update for direct IO under LFS mode */
-	if (map->m_may_create &&
-	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO))) {
+	if (map->m_may_create && (is_hole ||
+		(flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
+		!f2fs_is_pinned_file(inode)))) {
 		if (unlikely(f2fs_cp_error(sbi))) {
 			err = -EIO;
 			goto sync_out;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
