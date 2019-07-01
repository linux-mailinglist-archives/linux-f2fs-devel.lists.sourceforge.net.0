Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F005C453
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 22:27:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi2tF-0006Xi-20; Mon, 01 Jul 2019 20:27:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi2t9-0006Wm-OL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vztb2LnauJi+dYyVQVqkWAfTVewmA3geSisYW/kKKac=; b=leER7KSFiiSCu35si+Ux382iJB
 jRXHnJPhrybPnADR5dTBpNOlD4BLLwaL0el/NICwPmayI6YSIawPNK19cJ5rENQT8PJUQaJNeyh+X
 hnFQkBVYZme3iisBy96iYuAj3g2jEG0MYHLzmlHV5K0msCCYZFPT3BqXjvjmr5U5HIdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vztb2LnauJi+dYyVQVqkWAfTVewmA3geSisYW/kKKac=; b=Rb+wsSLSlEepdL6RPmyfd+ZU87
 wMYyfh87gya+jyDgG/IcHSuTWdkF3pIZRiHjgPbduEB5uTmPcF4kHMvnh+22F+ldpEV7rHR5h7cYV
 29Og+2wi2R7RDwm9OivGmDnzgPvmQt7nzr4HgDRz5CIzYujmXSqo+seovS95Au2fiW74=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi2tE-003mbH-2f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:27:05 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 419022173E;
 Mon,  1 Jul 2019 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562012808;
 bh=TJXiGDpQyPo3Am55DXSOjkswMDHlO5HT8Li7G7X071Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CT/tkyuNgPvVOMOdhW295OKt46He+y0hcknm37HcP5rN0BhSxu3YBUwtHuMOKFNaL
 dw7MDFt2hEv11NkKp/LPABGZ94TCwNuTIWqWhMhZaXDwo7olGZzJE//iGVzDgByv8h
 OGXDy201TyCOpTCEivxHFJ9BDhmFBQ/DgZmujDGA=
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Mon,  1 Jul 2019 13:26:28 -0700
Message-Id: <20190701202630.43776-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701202630.43776-1-ebiggers@kernel.org>
References: <20190701202630.43776-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hi2tE-003mbH-2f
Subject: [f2fs-dev] [PATCH 1/3] f2fs: use generic checking and prep function
 for FS_IOC_SETFLAGS
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make the f2fs implementation of FS_IOC_SETFLAGS use the new VFS helper
function vfs_ioc_setflags_prepare().

This is based on a patch from Darrick Wong, but reworked to apply after
commit 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4
i_flags").

Originally-from: Darrick J. Wong <darrick.wong@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e7c368db81851f..b5b941e6448657 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1765,7 +1765,8 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
 static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
-	u32 fsflags;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	u32 fsflags, old_fsflags;
 	u32 iflags;
 	int ret;
 
@@ -1789,8 +1790,14 @@ static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
+	old_fsflags = f2fs_iflags_to_fsflags(fi->i_flags);
+	ret = vfs_ioc_setflags_prepare(inode, old_fsflags, fsflags);
+	if (ret)
+		goto out;
+
 	ret = f2fs_setflags_common(inode, iflags,
 			f2fs_fsflags_to_iflags(F2FS_SETTABLE_FS_FL));
+out:
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 	return ret;
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
