Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E5299B1E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 00:49:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXCFG-00082d-E1; Mon, 26 Oct 2020 23:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kXCFC-0007z2-6F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uI4wULsniPutUBABK0ksQrbHccNLZXe1/I4x5+CpGos=; b=lmK1Myxkgj1SuPEWXX8SS7aCu5
 J6PVS3rY3pTPx1BlZGU1pzlcwBnPSOXIn/x78cYKQV7Emfac8/ZTQFS/Hame+SHgNeRBXcnm54hLv
 Cm3iVCegesbR/w0YJsW8Eq+FgLuLEvetQpno03lYvJRW5aM4oN90W+JYk8SzuPvrEWsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uI4wULsniPutUBABK0ksQrbHccNLZXe1/I4x5+CpGos=; b=VQpRg0RYWNphE08vO9AlsS4rTM
 6XhdftSRlk1O0l5BNr7odaMBYhHLm1vDdmG46qLVX7UXyOtHf+3+Ze022u30Hp0xkGEs5ro6/4Fi2
 Zx9z5t7o2g1Wkm2Nt5J1+RLuTEim/trbqBUIMjCyWsy8upwplAuERfjOsvzpjswl5iVU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXCF8-00EtzO-1J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:49:42 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94F6320878;
 Mon, 26 Oct 2020 23:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756163;
 bh=ivWsN51rt14cst42vEb517DzO4wnF4nTMwrlAuml0GA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZD69OcQdMtXSGKdaJw5HbVAYayyX+wXej0yvHDbBZqOVxqVq0ndac2PsAgXFX+3Sg
 uL5Ux+WSSmciyU6TeBl059XuiJJTgK62dO6yNSvOs018vIEZqaH0jflELwFhpLdZg9
 eLrt5p3GEfdyyOUfQqN0tAj2I3BiA8MwkNmVk0+E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 26 Oct 2020 19:46:52 -0400
Message-Id: <20201026234905.1022767-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kXCF8-00EtzO-1J
Subject: [f2fs-dev] [PATCH AUTOSEL 5.9 014/147] f2fs: compress: fix to
 disallow enabling compress on non-empty file
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

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 519a5a2f37b850f4eb86674a10d143088670a390 ]

Compressed inode and normal inode has different layout, so we should
disallow enabling compress on non-empty file to avoid race condition
during inode .i_addr array parsing and updating.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
[Jaegeuk Kim: Fix missing condition]
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8a422400e824d..4ec10256dc67f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1836,6 +1836,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		if (iflags & F2FS_COMPR_FL) {
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
+			if (S_ISREG(inode->i_mode) && inode->i_size)
+				return -EINVAL;
 
 			set_compress_context(inode);
 		}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
