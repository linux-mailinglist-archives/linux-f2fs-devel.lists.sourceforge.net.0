Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D845601E6F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 02:10:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okaBh-0003UO-Mf;
	Tue, 18 Oct 2022 00:10:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1okaBg-0003UG-A8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rqDbqGG2gkXtZ7z2HApttnlupuvSZKAANM5OQBT5DOE=; b=LLc8NARcrUug4Dxu681yAAT1ZH
 PpjkDROhSmc9bOaUEqmBeLZK+jL/HZw+FIt+S1Y3jSE299mjkbk4onGqetLtk7b35u5aRIaApX9Br
 4FhYijchT7AHK3b7b681rFX467ssgrNXnP1bEND50V9/p3Ox5LI02monwySTVvzGqPOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rqDbqGG2gkXtZ7z2HApttnlupuvSZKAANM5OQBT5DOE=; b=mslDPoP54ouk315RqU3icRUcEa
 p9VOQX+4ocDOtIbK85zQqLap052pm4VpzRJ6VwLRVAfvCmQJno6LeZticY6o8nFaRzE+jWczRB2Sg
 esDku0qd81IZs0HC5M3gLmUoFl6F4OUG+nEm95+nSXv2oSpANmm8K9oSsNGWBqXJj0cU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okaBf-007dxM-OU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EEAB61325
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Oct 2022 00:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15856C43143;
 Tue, 18 Oct 2022 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666051821;
 bh=1ZYxHUyU9NpGZtKaFDyP0j06ZoEkHo2aD97zSqyG0gU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fmojT7R+ukzv97BLMmoabXJoDXShQvOclPgBAnEZZuvQYRGj8yNtncj4tTSWzVj8c
 AFhGrfdzVhbyTZgCb3mFhCz2/65h4tbU2yhDMGBYRoBV9sNrDS3rpLnlgkt6jRFJvJ
 N2nAIiiQtw/LgUmWAzjG0I1mZIrPZcXSLZHA6Ho6xm35SCZjhXLnVgKX21cuV41w3n
 yxsVZ/K6NFMe060qr/PtsM+0k0ZgNXNBRxth/BX78GoH4QKD2TC0BunV0Z6o4nNxy8
 HslKmdg86ksTJh4JZO++heDk59Z2LjNsP8xq2MLGq1027eDZ0uovlSZy6ZUaUuJJcH
 fgOS2K8bH2pNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 17 Oct 2022 20:09:36 -0400
Message-Id: <20221018000940.2731329-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000940.2731329-1-sashal@kernel.org>
References: <20221018000940.2731329-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 fcc2d8cc96b2f6141bbbe5b1e8953db990794b44
 ] It is possible that ino of dirent or orphan inode is corrupted in a fuzzed
 image, occasionally, if corrupted ino is equal to meta ino: meta_ino, node_ino
 or compress_ino, caller of f2fs_iget() from be [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1okaBf-007dxM-OU
Subject: [f2fs-dev] [PATCH AUTOSEL 5.15 17/21] f2fs: fix to detect corrupted
 meta ino
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

[ Upstream commit fcc2d8cc96b2f6141bbbe5b1e8953db990794b44 ]

It is possible that ino of dirent or orphan inode is corrupted in a
fuzzed image, occasionally, if corrupted ino is equal to meta ino:
meta_ino, node_ino or compress_ino, caller of f2fs_iget() from below
call paths will get meta inode directly, it's not allowed, let's
add sanity check to detect such cases.

case #1
- recover_dentry
 - __f2fs_find_entry
 - f2fs_iget_retry

case #2
- recover_orphan_inode
 - f2fs_iget_retry

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inode.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bd8960f4966b..cc91bcebd2ca 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -480,6 +480,12 @@ static int do_read_inode(struct inode *inode)
 	return 0;
 }
 
+static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
+{
+	return ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi) ||
+		ino == F2FS_COMPRESS_INO(sbi);
+}
+
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
@@ -491,16 +497,21 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		return ERR_PTR(-ENOMEM);
 
 	if (!(inode->i_state & I_NEW)) {
+		if (is_meta_ino(sbi, ino)) {
+			f2fs_err(sbi, "inaccessible inode: %lu, run fsck to repair", ino);
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			ret = -EFSCORRUPTED;
+			trace_f2fs_iget_exit(inode, ret);
+			iput(inode);
+			return ERR_PTR(ret);
+		}
+
 		trace_f2fs_iget(inode);
 		return inode;
 	}
-	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi))
-		goto make_now;
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (ino == F2FS_COMPRESS_INO(sbi))
+	if (is_meta_ino(sbi, ino))
 		goto make_now;
-#endif
 
 	ret = do_read_inode(inode);
 	if (ret)
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
