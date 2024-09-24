Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FCE983B3A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 04:30:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ssvK9-0001MK-Fi;
	Tue, 24 Sep 2024 02:30:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ssvJz-0001M6-Br
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 02:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V+neI8SpntXNpSLi2XT2m/3/iyysYpY4dkmUCc11dZE=; b=Gx/nGNkfSCV1SHQ01f7rR1AgaW
 nfL2HWiqH+PUIBpuQTyOO1xEC0o3xpuHAfb5KnO7PAXcDeITKoT/rfxcpddXOVSyP9klerNXnPwwT
 nmfFBLXWvJZe5kcw1iZmvoIJO3ZtbG/EvfcYLZ7eV5uLisVnUv9uxdtbxxZfuuIuVabo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V+neI8SpntXNpSLi2XT2m/3/iyysYpY4dkmUCc11dZE=; b=i
 K7XR9xU2lkPbzeyA98T1c8gUbN4FRMp01FIxzLSTq3e2qig/AMODOIdx7pH5U6pNOeoHGF0eWunvc
 KBo/NF1sd+41UPvQgPBLD66HpNDBOOSev/rmGPVimk8ANkWC0DFI+jKYS8mqtvlg6poQ+bA886SyQ
 YLWWtgqXaGtIV1Kk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ssvJy-0004zD-2w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 02:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A4DCA43196;
 Tue, 24 Sep 2024 02:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BE7C4CEC4;
 Tue, 24 Sep 2024 02:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727145023;
 bh=POOjzR/GH7RIhN+TXA7+6FxROIv97eheQZRVGR8Nwds=;
 h=From:To:Cc:Subject:Date:From;
 b=ihbJo+xWikBzYJHM79iaJyfx8i9PEVWxFSwekgs9/9e4w47CueoIe1ynjnpHKmTG9
 dfUC9zFL2l8YL/wbrrYMClt9lrhABnKLJx5QX0K+nlBNjJ4bN4PZ3GZ+izk9rHPifV
 2kvenovbI+rQy/8P/QqBFRqAZdoLRdQ3KFKkZ77eG6atTPEaoxI07/0dShnj+7BaUz
 jfaq8j6kmlmE0GSJWRLQc+vz6TBvfj2xIPMC+th7k2xiQcCI2eepNts/5BBMVYvLdv
 mQV1w6JGZivWm5WKetq466nh+Dxm9h0R0kZZGFeGv5QKekAFoxlCK0si+WOzO0wp/o
 xADev03UJEMgw==
To: jaegeuk@kernel.org
Date: Tue, 24 Sep 2024 10:30:07 +0800
Message-Id: <20240924023007.2471817-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Do sanity check for extent info of device alias inode, in
 order to avoid unexpected error caused by fuzz test. Cc: Daeho Jeong
 <daehojeong@google.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- To Daeho and Jaegeuk, 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ssvJy-0004zD-2w
Subject: [f2fs-dev] [PATCH] f2fs: device alias: add sanity check for device
 alias inode
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Do sanity check for extent info of device alias inode, in order to
avoid unexpected error caused by fuzz test.

Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---

To Daeho and Jaegeuk,

Merge this into initial patch or merge it separately is both fine
to me.

 fs/f2fs/extent_cache.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 0c8a705faa8b..5bf9e4c2b49c 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -24,6 +24,7 @@ bool sanity_check_extent_cache(struct inode *inode, struct page *ipage)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_extent *i_ext = &F2FS_INODE(ipage)->i_ext;
 	struct extent_info ei;
+	int devi;
 
 	get_read_extent_info(&ei, i_ext);
 
@@ -38,7 +39,36 @@ bool sanity_check_extent_cache(struct inode *inode, struct page *ipage)
 			  ei.blk, ei.fofs, ei.len);
 		return false;
 	}
-	return true;
+
+	if (!IS_DEVICE_ALIASING(inode))
+		return true;
+
+	for (devi = 0; devi < sbi->s_ndevs; devi++) {
+		if (FDEV(devi).start_blk != ei.blk ||
+			FDEV(devi).end_blk != ei.blk + ei.len)
+			continue;
+
+		if (devi == 0) {
+			f2fs_warn(sbi,
+				"%s: inode (ino=%lx) is an alias of meta device",
+				__func__, inode->i_ino);
+			return false;
+		}
+
+		if (bdev_is_zoned(FDEV(devi).bdev)) {
+			f2fs_warn(sbi,
+				"%s: device alias inode (ino=%lx)'s extent info "
+				"[%u, %u, %u] maps to zoned block device",
+				__func__, inode->i_ino, ei.blk, ei.fofs, ei.len);
+			return false;
+		}
+		return true;
+	}
+
+	f2fs_warn(sbi, "%s: device alias inode (ino=%lx)'s extent info "
+			"[%u, %u, %u] is inconsistent w/ any devices",
+			__func__, inode->i_ino, ei.blk, ei.fofs, ei.len);
+	return false;
 }
 
 static void __set_extent_info(struct extent_info *ei,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
