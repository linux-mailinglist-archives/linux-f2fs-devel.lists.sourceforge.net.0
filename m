Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E368F94122A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 14:45:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYmEN-0002bp-2t;
	Tue, 30 Jul 2024 12:45:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1sYmEM-0002bg-5d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jqgHWGCwFOLNv0woodpQknZyOaH57U8mvPv+I6AocrE=; b=GdFgsiLmEdy9gdyUmKvYllgN8H
 HU9HA3IsFbOrwDU2Gr/qFUiqesX5F6aB6olqvipR+CK55mBdrtEneDY+G/euXwod/5E1FFwgADPyu
 cPeSSgxvucu+5IhOZW6Lk/487b3rZAfYkK4mduZSpGZ878MVSMM8MAdzQ5YSY4NdZGU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jqgHWGCwFOLNv0woodpQknZyOaH57U8mvPv+I6AocrE=; b=RUfuk/M6F766Z5nuFpmMbBxySQ
 oD8/hiVCU2kh3KtXBsPfwpcQGSIQlpFPhr0rRtoPUDjCQMc0wLsvt3e0X8kdN/Er5DrFPo/6+erdf
 3Cv8qSYeB4Mg8AApojQrzIFgXnwKgp53tH3KFJJ1oH1hKGEWkyDo2xXzGgN+Zs4Ks2gY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYmEL-00079u-ER for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:45:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BE3861E46
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jul 2024 12:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18AAC4AF09;
 Tue, 30 Jul 2024 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722343523;
 bh=a06fT59JYSEYGZu3uqZ7J/4JW8k25L+XSMr8vDSImjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdziFkDxmn2RyXHWN/E5BZBLOU+FLjHLYf3uy0yDZC+zGYX4pgszNh04JC386fBxF
 RNdAwsKrNI/BVkfpPhaDiI7IjGDIPy+kjJg7cUukGGRmbCTykXIAxyY1CaKeIzoWZn
 ZZ1npzkjIqK4eVx8Yvjkg1FafKtNYcvaX5juD2RhFJjUc3UZaajoUBUIXfLLaawkQc
 PO/iJ2G9r9yB3RQ6Eju5Ppr7mM08zSewcWppyNcQtoDJG/Y2YCLnWLRMm03mxHuCjQ
 NznBA8gFsNcGz3ZgEodpotGu0orkyxRlEwgRN7TLuPz3Th5mHORXgEMu1bhPlm/Bl7
 zjF06p8BesLEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 30 Jul 2024 08:45:08 -0400
Message-ID: <20240730124519.3093607-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730124519.3093607-1-sashal@kernel.org>
References: <20240730124519.3093607-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 c240c87bcd44a1a2375fc8ef8c645d1f1fe76466 ] inode can be fuzzed,
 so it can has F2FS_INLINE_DATA flag and valid i_blocks/i_nid
 value, this patch supports to do extra sanity check to detect such corrupted
 state. Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYmEL-00079u-ER
Subject: [f2fs-dev] [PATCH AUTOSEL 6.10 2/7] f2fs: fix to do sanity check on
 blocks for inline_data inode
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

[ Upstream commit c240c87bcd44a1a2375fc8ef8c645d1f1fe76466 ]

inode can be fuzzed, so it can has F2FS_INLINE_DATA flag and valid
i_blocks/i_nid value, this patch supports to do extra sanity check
to detect such corrupted state.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c | 20 +++++++++++++++++++-
 fs/f2fs/inode.c  |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1974b6aff397c..f463961b497c4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4149,7 +4149,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
  * inline.c
  */
 bool f2fs_may_inline_data(struct inode *inode);
-bool f2fs_sanity_check_inline_data(struct inode *inode);
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 7638d0d7b7eed..0203c3baabb66 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -33,11 +33,29 @@ bool f2fs_may_inline_data(struct inode *inode)
 	return !f2fs_post_read_required(inode);
 }
 
-bool f2fs_sanity_check_inline_data(struct inode *inode)
+static bool inode_has_blocks(struct inode *inode, struct page *ipage)
+{
+	struct f2fs_inode *ri = F2FS_INODE(ipage);
+	int i;
+
+	if (F2FS_HAS_BLOCKS(inode))
+		return true;
+
+	for (i = 0; i < DEF_NIDS_PER_INODE; i++) {
+		if (ri->i_nid[i])
+			return true;
+	}
+	return false;
+}
+
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage)
 {
 	if (!f2fs_has_inline_data(inode))
 		return false;
 
+	if (inode_has_blocks(inode, ipage))
+		return false;
+
 	if (!support_inline_data(inode))
 		return true;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 005dde72aff3d..33b2778d54525 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -344,7 +344,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_sanity_check_inline_data(inode)) {
+	if (f2fs_sanity_check_inline_data(inode, node_page)) {
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
