Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CF697231
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 00:57:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pS5Au-0004XO-U9;
	Tue, 14 Feb 2023 23:57:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pS5Au-0004XG-2i
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 23:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Su7/GfDnm8hxppew8dTBjh9emSvA0iAgK/bg010jV54=; b=dHUpnq5wpvVf+2wXvF8yJRFkLV
 GLpQgx/AeAvW3TBEmBxJhq100UCFBrUorP29BFqW5BF66zZURoXkixY91TGhXCDjm+yH/lhnit+OK
 0t9xU2uaX1uHsWlo76HWwDrx9o9WboX0ShAaaTwCJP3X3JmYRYT0hzNKh02YZd6u3evU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Su7/GfDnm8hxppew8dTBjh9emSvA0iAgK/bg010jV54=; b=k
 egJabYbmcSRc8sePGd85Qkliwk//9VME4kTWp/wFFSt2W7KCzWHRltYdlR4uSxu9HyEb5HiI1Eh4A
 jhEgwc2MqnyvqdKZnkrJSRfmD4FSXTVgSGTs70EZxHsQx3VTvXjZPbSVUc0i+X1Z+VWKErSAI2SsA
 iZ5HZlb5un+HJ90k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pS5At-004frs-In for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 23:57:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31C9360DCB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Feb 2023 23:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A906C433D2;
 Tue, 14 Feb 2023 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676419041;
 bh=DCMDDkt6Ar0ODmaEfXdp73d5AsSIPtAfQxa/qcVDYqA=;
 h=From:To:Cc:Subject:Date:From;
 b=Saa/mwlbfMI6YFJ7bkmJBNpeAEwuRbIbLRKUDPmKoc8joVcz/bhPldyDxLcxYmfPE
 +geEldLRALrNwGILqPpBtr7khBh5tIVPbiZUAwk2OcV8Kvn7zj+5oCqPH5ffXz887D
 tyLdoJu7e4vKCeuMfCxxsEQMHGESwQAPDvYQxmm2QYsshDDWrVKMQ/gpHS4m2yvEvB
 NwCPNbBbuiInMbXNkan0B0jjti3ROJ7klOsllOiuQXiQf4DW5SyYM/nqgRbt6c5ahC
 sP296fruob///JdD9REI3wt5GY+mt2wS0WBzLL0T9pahwynVHVNz8jcT1BxQ8vEVSY
 vdhjJJ3PGqTuw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 14 Feb 2023 15:57:19 -0800
Message-Id: <20230214235719.799831-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We should not truncate replaced blocks, and were supposed
 to truncate the first part as well. This reverts commit
 78a99fe6254cad4be310cd84af39f6c46b668c72.
 Cc: stable@vger.kernel.org Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- fs/f2fs/segment.c | 9 +++++++-- 1 file changed, 7 insertions(+),
 2 deletions(-)
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pS5At-004frs-In
Subject: [f2fs-dev] [PATCH] f2fs: Revert "f2fs: truncate blocks in batch in
 __complete_revoke_list()"
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should not truncate replaced blocks, and were supposed to truncate the first
part as well.

This reverts commit 78a99fe6254cad4be310cd84af39f6c46b668c72.

Cc: stable@vger.kernel.org
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 719329c1808c..227e25836173 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -265,19 +265,24 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 					bool revoke)
 {
 	struct revoke_entry *cur, *tmp;
+	pgoff_t start_index = 0;
 	bool truncate = is_inode_flag_set(inode, FI_ATOMIC_REPLACE);
 
 	list_for_each_entry_safe(cur, tmp, head, list) {
-		if (revoke)
+		if (revoke) {
 			__replace_atomic_write_block(inode, cur->index,
 						cur->old_addr, NULL, true);
+		} else if (truncate) {
+			f2fs_truncate_hole(inode, start_index, cur->index);
+			start_index = cur->index + 1;
+		}
 
 		list_del(&cur->list);
 		kmem_cache_free(revoke_entry_slab, cur);
 	}
 
 	if (!revoke && truncate)
-		f2fs_do_truncate_blocks(inode, 0, false);
+		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
 }
 
 static int __f2fs_commit_atomic_write(struct inode *inode)
-- 
2.39.1.581.gbfd45094c4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
