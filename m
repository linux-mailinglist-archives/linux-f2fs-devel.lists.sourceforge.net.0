Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 068001A9C69
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:35:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgK6-0003Bg-7Y; Wed, 15 Apr 2020 11:35:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgK1-0003Aj-6F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNgyQ3/WvzLWLlI9WBgJYRcEyNcwXuiKmmBaV8mFUuE=; b=bVsPrqwkwCGi5nQ/KmrXaoLy/Y
 mj7WdYhf518RIuvmk3RlHwmHqc1cOHtAG7GkTJzI1CG2dhaxpwpmaRz65TdfWAymKVKSfj9e8A9MI
 Q769zc56ZakiSVt/bmu0YbFoGNdWPxL6IOc+CDc9PJ9VeO91iNhYca6OE/0euBbnWm7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fNgyQ3/WvzLWLlI9WBgJYRcEyNcwXuiKmmBaV8mFUuE=; b=m0qCYKLFWzFSohu9lf+ndpGvkE
 Ize8/IUaiDuSSPPbk8s9vMMaUB05bNyJzyyCYt910iE5OLDGcnpVn7mIcQLxXXqEQktIttDpoauTE
 iP64SeDFhlmFUMpPHbfhVKON14fR+HqkKTXx+I7idY1em6dNEblUszBLJqIb2cJ3u/rc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgJx-000F0S-Ij
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF0AC2076D;
 Wed, 15 Apr 2020 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950501;
 bh=BcOsfOkxn0Z2bJhhSJhfv3P9uJjbhL86MgsL5pVv5F8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RG4DVKgu5x3F5gwNOpN5hd5r2JAXV85qnIRtQZIqw6FpSF/HhBKLvcn0kGW2icWko
 wYXsppxNLImgtLZmXnlNK+D2WIoGoQe3G8jC2zO+2RezHSCWa+n59khT6ZuwD97JrH
 DsNINEtYqzJGjojD97tTNFjL7yEhWfCwQKtL7Xbo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:32:48 -0400
Message-Id: <20200415113445.11881-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: android.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgJx-000F0S-Ij
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 013/129] f2fs: fix wrong check on
 F2FS_IOC_FSSETXATTR
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 99eabb914e0f870445d065e83e857507f9728a33 ]

This fixes the incorrect failure when enabling project quota on casefold-enabled
file.

Cc: Daniel Rosenberg <drosen@google.com>
Cc: kernel-team@android.com
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/file.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0d4da644df3bc..a41c633ac6cfe 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1787,12 +1787,15 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	u32 masked_flags = fi->i_flags & mask;
+
+	f2fs_bug_on(F2FS_I_SB(inode), (iflags & ~mask));
 
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
-	if ((iflags ^ fi->i_flags) & F2FS_CASEFOLD_FL) {
+	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
 		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
 			return -EOPNOTSUPP;
 		if (!f2fs_empty_dir(inode))
@@ -1806,9 +1809,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			return -EINVAL;
 	}
 
-	if ((iflags ^ fi->i_flags) & F2FS_COMPR_FL) {
+	if ((iflags ^ masked_flags) & F2FS_COMPR_FL) {
 		if (S_ISREG(inode->i_mode) &&
-			(fi->i_flags & F2FS_COMPR_FL || i_size_read(inode) ||
+			(masked_flags & F2FS_COMPR_FL || i_size_read(inode) ||
 						F2FS_HAS_BLOCKS(inode)))
 			return -EINVAL;
 		if (iflags & F2FS_NOCOMP_FL)
@@ -1825,8 +1828,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			set_compress_context(inode);
 		}
 	}
-	if ((iflags ^ fi->i_flags) & F2FS_NOCOMP_FL) {
-		if (fi->i_flags & F2FS_COMPR_FL)
+	if ((iflags ^ masked_flags) & F2FS_NOCOMP_FL) {
+		if (masked_flags & F2FS_COMPR_FL)
 			return -EINVAL;
 	}
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
