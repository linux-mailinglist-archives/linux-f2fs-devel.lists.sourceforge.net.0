Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2B31C69
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3x5-0003cn-7X; Sat, 01 Jun 2019 13:21:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3x3-0003c5-Q6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FssXPld6atEd6aqXNFwVuSCqgxih33Kl4LCdH7C3S18=; b=IQ4doy9K7tuQ47xt+ldEkUy4XG
 2W6fg/RPiPWVsgy4JsSvcSQl5VUZF6gweojzHFFpDKW8FaZkIidQOZm3u0DOVUB0V+zX36n2juC95
 fD2StnBtHjkUNfbqR0eKBymggWumgT66z+waZgsfseo8prlSMqvRqR5vS+H5aP68Wq9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FssXPld6atEd6aqXNFwVuSCqgxih33Kl4LCdH7C3S18=; b=e2ok51zkNYn2fa5wKSbSuO/N+X
 yYV3PXUk/duk/0fN7jAeCYlRuqmMX3wtjY/WDx34n3VmCdgDt5Mck4s4DaJFSoT+5BaBQ2JRoHcwH
 ehdF6N4I/aKxnPHja1cm23JuTd5eXWcvfd95m8CpS2FFVkOVSm3bZ1NofLC9++lMyle8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3wz-0058JH-OU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:34 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89D2A2730A;
 Sat,  1 Jun 2019 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395288;
 bh=JSSfZj/akRgGV2osQ4QGkulYa61lv7tk4SA7Mrkrpog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCDg/26Py9gc5gJmHM/miv3ZgjnHuBpt9OP2FZ0/4xUQ5sTkG1TEcI7Tzjv+1YGsU
 kEkcyZqm2L5qKfsQqRJEsXMDwW5ifByVVdehTAVcbhowObg38BwMi40cQze+0HEBff
 6XH7t+0hT6Tt1aVZTitGjygIm/xiNW8RVWavGA6c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:17:23 -0400
Message-Id: <20190601131934.25053-51-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3wz-0058JH-OU
Subject: [f2fs-dev] [PATCH AUTOSEL 5.0 051/173] f2fs: fix to retrieve inline
 xattr space
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

[ Upstream commit 45a746881576977f85504c21a75547f10c5c0a8e ]

With below mkfs and mount option, generic/339 of fstest will report that
scratch image becomes corrupted.

MKFS_OPTIONS  -- -O extra_attr -O project_quota -O inode_checksum -O flexible_inline_xattr -O inode_crtime -f /dev/zram1
MOUNT_OPTIONS -- -o acl,user_xattr -o discard,noinline_xattr /dev/zram1 /mnt/scratch_f2fs

[ASSERT] (f2fs_check_dirent_position:1315)  --> Wrong position of dirent pino:1970, name: (...)
level:8, dir_level:0, pgofs:951, correct range:[900, 901]

In old kernel, inline data and directory always reserved 200 bytes in
inode layout, even if inline_xattr is disabled, then new kernel tries
to retrieve that space for non-inline xattr inode, but for inline dentry,
its layout size should be fixed, so we just keep that reserved space.

But the problem here is that, after inline dentry conversion, inline
dentry layout no longer exists, if we still reserve inline xattr space,
after dents updates, there will be a hole in inline xattr space, which
can break hierarchy hash directory structure.

This patch fixes this issue by retrieving inline xattr space after
inline dentry conversion.

Fixes: 6afc662e68b5 ("f2fs: support flexible inline xattr size")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inline.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index aacbb864ec1ed..0c2251d595ec8 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -420,6 +420,14 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 	stat_dec_inline_dir(dir);
 	clear_inode_flag(dir, FI_INLINE_DENTRY);
 
+	/*
+	 * should retrieve reserved space which was used to keep
+	 * inline_dentry's structure for backward compatibility.
+	 */
+	if (!f2fs_sb_has_flexible_inline_xattr(F2FS_I_SB(dir)) &&
+			!f2fs_has_inline_xattr(dir))
+		F2FS_I(dir)->i_inline_xattr_size = 0;
+
 	f2fs_i_depth_write(dir, 1);
 	if (i_size_read(dir) < PAGE_SIZE)
 		f2fs_i_size_write(dir, PAGE_SIZE);
@@ -501,6 +509,15 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
 
 	stat_dec_inline_dir(dir);
 	clear_inode_flag(dir, FI_INLINE_DENTRY);
+
+	/*
+	 * should retrieve reserved space which was used to keep
+	 * inline_dentry's structure for backward compatibility.
+	 */
+	if (!f2fs_sb_has_flexible_inline_xattr(F2FS_I_SB(dir)) &&
+			!f2fs_has_inline_xattr(dir))
+		F2FS_I(dir)->i_inline_xattr_size = 0;
+
 	kvfree(backup_dentry);
 	return 0;
 recover:
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
