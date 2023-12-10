Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F180BA61
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 12:36:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCI6h-0007AD-6h;
	Sun, 10 Dec 2023 11:36:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCI6d-00079q-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 11:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AHfFwKYujQQVoHs5zJPh6KRKf6rlctCcGvr++i9cGOI=; b=i5hI1m0oaXOOwZj2ebAQN73tHV
 bGwCDwCVl8baBIgwmYm31W184LnmRrzcWpgWSONxTfKQ+YcJUQQk9cdEx356zKBHlrllYCZSiUc/P
 Eya3DK6CzgVLJt2s6XZVXTg3f7FowearXcYX9U6m9vAEjl2/2LD1k1RTYzOK2Bv71mi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AHfFwKYujQQVoHs5zJPh6KRKf6rlctCcGvr++i9cGOI=; b=PdOpKKC6T3ugILvTSLJrY7KyU8
 hld6j/hwsZj52Kb7VdazCAEGQyn8RpRxOvp/F2Qz71XO9Zmf1M5i0LrGW63L4/OJFY1m4fZf178Tr
 iCc2euTdiOtPbfCpnCXocuBgtoNe9cpCL3vM82wsstJaklVR5MN+0SoEbDMm3DBcvTyE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCI6d-0000V5-KB for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 11:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 37DA360C5C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 11:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C726C433CB;
 Sun, 10 Dec 2023 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702208168;
 bh=17M2pG5LF+yTUT42vRyb2J9RQolF4UPApTsylmOgOqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VhKpZ6bMkrzIwnh96I+1vV0Y2OCIZV/ymzd7baK1mrWUah3lbAoHJjqI7MB/s3SRm
 Vl4hGgaRM7HzUXf8iw7IiZQTR7CQzPHnmb0NF2RrsVZY68DRUwdGsaX3fwKzgXd2zJ
 JKdR5UcjWAcNU3PFutjamQmTrdJ6ubvaKMJdHjtaw927MIKe9aFFER8GfR5+fqAqdJ
 s7YwuahFs/xFV/RUX/bvsLCDeKpZ+TG9cuTsIiDfGsdYKC8ihmdV605qwAcFRtmUXk
 FyPeza8fPKgHSCoeyAaBiwEjhicRI1nEZKg88Q61Hs5j/YhVbRf2K4ZkP0h16h6wGZ
 5KsDwZJHvABfQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 19:35:46 +0800
Message-Id: <20231210113547.3412782-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210113547.3412782-1-chao@kernel.org>
References: <20231210113547.3412782-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds i_size check during compress inode conversion
 in order to avoid .page_mkwrite races w/ conversion. Fixes: 4c8ff7095bef
 ("f2fs: support data compression") Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/f2fs.h | 8 +++++++- fs/f2fs/file.c | 5 ++--- 2 files changed,
 9 insertions(+), 4 deletions(- [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCI6d-0000V5-KB
Subject: [f2fs-dev] [PATCH 5/6] f2fs: fix to restrict condition of compress
 inode conversion
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

This patch adds i_size check during compress inode conversion in order
to avoid .page_mkwrite races w/ conversion.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 8 +++++++-
 fs/f2fs/file.c | 5 ++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65294e3b0bef..c9b8a1953913 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4397,13 +4397,19 @@ static inline int set_compress_context(struct inode *inode)
 #endif
 }
 
+static inline bool inode_has_data(struct inode *inode)
+{
+	return (S_ISREG(inode->i_mode) &&
+		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
+}
+
 static inline bool f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
 	if (!f2fs_compressed_file(inode))
 		return true;
-	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
+	if (inode_has_data(inode))
 		return false;
 
 	fi->i_flags &= ~F2FS_COMPR_FL;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1a3c29a9a6a0..8af4b29c3e1a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1922,8 +1922,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 
 			f2fs_down_write(&F2FS_I(inode)->i_sem);
 			if (!f2fs_may_compress(inode) ||
-					(S_ISREG(inode->i_mode) &&
-					F2FS_HAS_BLOCKS(inode))) {
+					inode_has_data(inode)) {
 				f2fs_up_write(&F2FS_I(inode)->i_sem);
 				return -EINVAL;
 			}
@@ -3996,7 +3995,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (F2FS_HAS_BLOCKS(inode)) {
+	if (inode_has_data(inode)) {
 		ret = -EFBIG;
 		goto out;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
