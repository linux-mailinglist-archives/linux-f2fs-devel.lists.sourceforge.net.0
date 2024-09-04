Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F14EF96AF0C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 05:18:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slgX3-0002Zx-2d;
	Wed, 04 Sep 2024 03:18:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slgX1-0002Zp-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g5j/j8YNvrKpdABBXvmWtpfsKwmvOEe4TjorQx3CbeE=; b=HqnSknuYYEIiPaY/6ZNWytDdml
 zU5ZDjuyr1x36hAzMEk70wOPN4yG+PUL1FO6zlpWpFzZ/MjapLlnXdYdoAyHwU8buxPXOBu5XFwkr
 m6XLZsVEOzNMEDmsnRUW0/fSIwi5o18RSAjuFFnrh/38oJDgnUNMntNeVhnlYpGvIPrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g5j/j8YNvrKpdABBXvmWtpfsKwmvOEe4TjorQx3CbeE=; b=C8x0q6RHynM34EvM+pB0BVZ52A
 9J/LFlJNqh7f4+y/0rLYdAKattciQ6Iou2hCufZRg1AI+I+jofAc0lUUrWski438oLfZ0tJECdR4d
 SMIn6McqoA0hVIR2HYTNQDEaaqTxipew/nsnS2au9HS/KwsOns1B40RxkdrFdYPiZemY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slgX1-0005IC-2a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 320C7A404F3;
 Wed,  4 Sep 2024 03:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E967DC4CEC4;
 Wed,  4 Sep 2024 03:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725419881;
 bh=fVUdRNyBecMoXa7qS829IquD1OMT4h2mv+VObRRxrcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BXw10DjQV47EhinzzOrTxt9yjbAOo/o5J9RmEOJ3xYoCvX2JFw3LCbJ/WKB/IjuU8
 ILUwjNkMgwLK5cuatC38Pwkwty08VjdEMItnASla1fD7Nz/JECpZAK+WlhLrwXXmW5
 Ct48Lw4eU/uK6dYUqV4YlUgyea0CeFw2lCsdx/wHqq7eS+VXx3l692L3cYSVPv5rNC
 lQlxkjcompOpeLvbd58rjdQt5bJdFXc4HcpJZ9Z7NQoCswZtlF87o1Ti/tla9rU/FE
 k9wUa4Ki3Tg7Y1ldmfeSaAtVxX3+tbwyV5sjYnECdkYy4Ph4qTJxQPJ12PykdVzGF5
 4FjvRh9kbe36A==
To: jaegeuk@kernel.org
Date: Wed,  4 Sep 2024 11:17:46 +0800
Message-Id: <20240904031746.1262403-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240904031746.1262403-1-chao@kernel.org>
References: <20240904031746.1262403-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, once fsck.f2fs detects that directory missed '.'
 or '..' dirent, it tags inode w/ F2FS_INLINE_DOTS flag, and expects f2fs
 kernel module can repaire it online during it runs to lookup() on [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slgX1-0005IC-2a
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: support to add missing '.' or
 '..' dirent
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, once fsck.f2fs detects that directory missed '.' or
'..' dirent, it tags inode w/ F2FS_INLINE_DOTS flag, and expects
f2fs kernel module can repaire it online during it runs to lookup()
on target directory.

This patch abandons previous implementation, and do repaires directly.

Reviewed-by: Sheng Yong <shengyong@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 45 ++++++++++++++++++++++++++++++++++++++++-----
 fsck/main.c |  4 +++-
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 54ddc11..f8ea7f0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1307,17 +1307,52 @@ skip_blkcnt_fix:
 						nid, i_links, child.links);
 			}
 		}
-		if ((child.dot == 0 || child.dotdot == 0) &&
-				!(node_blk->i.i_inline & F2FS_INLINE_DOTS)) {
-			ASSERT_MSG("ino: 0x%x dot: %u, dotdot: %u",
+		if (child.dot == 0 || child.dotdot == 0) {
+			ASSERT_MSG("ino: 0x%x has no '.' and/or '..' dirents, dot: %u, dotdot: %u",
 					nid, child.dot, child.dotdot);
 			if (c.fix_on) {
-				node_blk->i.i_inline |= F2FS_INLINE_DOTS;
+				umode_t mode = le16_to_cpu(node_blk->i.i_mode);
+				block_t blkaddr;
+
+				ret = convert_inline_dentry(sbi, node_blk,
+								&ni->blk_addr);
+				FIX_MSG("convert inline dentry ino: %u, pino: %u, ret: %d",
+						nid, child_d->p_ino, ret);
+				if (ret)
+					goto skip_dot_fix;
+
+				if (child.dot == 0) {
+					char *name = ".";
+
+					ret = f2fs_add_link(sbi, node_blk,
+						(const unsigned char *)name,
+						1, nid, map_de_type(mode),
+						&blkaddr, 0);
+					FIX_MSG("add missing '%s' dirent in ino: %u, pino: %u, ret:%d",
+						name, nid, child_d->p_ino, ret);
+					if (ret)
+						goto skip_dot_fix;
+				}
+
+				if (child.dotdot == 0) {
+					char *name = "..";
+
+					ret = f2fs_add_link(sbi, node_blk,
+						(const unsigned char *)name,
+						2, child_d->p_ino,
+						map_de_type(mode),
+						&blkaddr, 0);
+					FIX_MSG("add missing '%s' dirent in ino: %u, pino: %u, ret:%d",
+						name, nid, child_d->p_ino, ret);
+					if (ret)
+						goto skip_dot_fix;
+				}
+
 				need_fix = 1;
-				FIX_MSG("Dir: 0x%x set inline_dots", nid);
 			}
 		}
 	}
+skip_dot_fix:
 
 	i_gc_failures = le16_to_cpu(node_blk->i.i_gc_failures);
 
diff --git a/fsck/main.c b/fsck/main.c
index 8881936..4e0254d 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -892,6 +892,7 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	u32 flag = le32_to_cpu(ckpt->ckpt_flags);
 	u32 blk_cnt;
 	struct f2fs_compr_blk_cnt cbc;
+	struct child_info child = { 0 };
 	errcode_t ret;
 
 	fsck_init(sbi);
@@ -957,8 +958,9 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	if (fsck_sanity_check_nat(sbi, sbi->root_ino_num))
 		fsck_chk_root_inode(sbi);
 
+	child.p_ino = sbi->root_ino_num;
 	fsck_chk_node_blk(sbi, NULL, sbi->root_ino_num,
-			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, &cbc, NULL);
+			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, &cbc, &child);
 	fsck_chk_quota_files(sbi);
 
 	ret = fsck_verify(sbi);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
