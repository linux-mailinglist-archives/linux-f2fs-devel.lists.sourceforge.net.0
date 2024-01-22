Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C583661D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 15:58:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRvl9-00024o-Rq;
	Mon, 22 Jan 2024 14:58:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1rRvl7-00024e-5X
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 14:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qt1B59bmyrTQkueeHlBshTwky50Q1Bqin8x+f9aIiY4=; b=HirgOZg+FsbEejjKKeIY1Q6Opn
 eQPqC0rV2jEHxdCpDFzNA+byFdgAWlN0v5u0yjllzrJNVDL8KBvB/5Fo3z0e24F8dpnfEvAZl9wGE
 +6aOeFNewys+SLsSokhyKGGMcFcURVYqMxijXEC4CTI48vr9dzHyw+khDqbvAizAugAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qt1B59bmyrTQkueeHlBshTwky50Q1Bqin8x+f9aIiY4=; b=SBqO0L9KX5BIeCK1CYAS1FvtLl
 QiiN4Sw1sjuTHeSoWIS60NDcyLm7+NMQnngFq9FUqJLAvsobdaj72CNkjH99Dm5z1qkgMRt8NrJ3O
 8ZswtQJGrcNJWE6OcHnP73gkN5t5zbZGuw43tAmd4swX7E767VM4ODDLp8LVxzXFq+lU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRvl6-0002pd-Th for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 14:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 343FA6152D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jan 2024 14:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC11C433C7;
 Mon, 22 Jan 2024 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935515;
 bh=7O66GhQEXBkQw7/K94pdY7cKtMA32+rR7WP5iEBOhD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hjP1HCSHqQ8sRdAgbIpXa23nqac88+nQSeW33qMjjFgd57HPdSmnIILb8LxBq1utu
 vKrcyLKP50U+5bqKWFWsgFgdiQ/c6g5+nUZj8peFl5zkEdHyo/5B5jmLYDLfR9aY0B
 zTtckF1TNplBCZTG1Q4T9BtSZgZZ7dhAV2SNdmM3n2+Sj6xlp9SoncRG2pYe94Jbmq
 h/LxWWjB/C9NT0c5Sh1Yy1N8d8QQyg4SysGfYra7zzmnbK38UmTmCSGzNfpMQo4ghV
 4xDRThVlve7ikiB/0DBx8xDe/A2Y1x0kkg36ZI3Iq0NTVTIO2ImOH9XwRvBe+F2roC
 xEulxzfxrsDfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 22 Jan 2024 09:51:16 -0500
Message-ID: <20240122145608.990137-43-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 4961acdd65c956e97c1a000c82d91a8c1cdbe44b
 ] It needs to add missing gcing flag on page during block migration, in order
 to garantee migrated data be persisted during checkpoint,
 otherwise out-of-order
 persistency between data and node may cause [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRvl6-0002pd-Th
Subject: [f2fs-dev] [PATCH AUTOSEL 6.7 43/88] f2fs: fix to tag gcing flag on
 page during block migration
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 4961acdd65c956e97c1a000c82d91a8c1cdbe44b ]

It needs to add missing gcing flag on page during block migration,
in order to garantee migrated data be persisted during checkpoint,
otherwise out-of-order persistency between data and node may cause
data corruption after SPOR.

Similar issue was fixed by commit 2d1fe8a86bf5 ("f2fs: fix to tag
gcing flag on page during file defragment").

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 4 +++-
 fs/f2fs/file.c     | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 36e5dab6baae..62119f3f7206 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1036,8 +1036,10 @@ static void set_cluster_dirty(struct compress_ctx *cc)
 	int i;
 
 	for (i = 0; i < cc->cluster_size; i++)
-		if (cc->rpages[i])
+		if (cc->rpages[i]) {
 			set_page_dirty(cc->rpages[i]);
+			set_page_private_gcing(cc->rpages[i]);
+		}
 }
 
 static int prepare_compress_overwrite(struct compress_ctx *cc,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e50363583f01..9d2cdae18877 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1317,6 +1317,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			}
 			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
 			set_page_dirty(pdst);
+			set_page_private_gcing(pdst);
 			f2fs_put_page(pdst, 1);
 			f2fs_put_page(psrc, 1);
 
@@ -4054,6 +4055,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 		f2fs_bug_on(F2FS_I_SB(inode), !page);
 
 		set_page_dirty(page);
+		set_page_private_gcing(page);
 		f2fs_put_page(page, 1);
 		f2fs_put_page(page, 0);
 	}
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
