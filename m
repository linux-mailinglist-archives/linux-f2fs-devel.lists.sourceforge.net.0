Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E92B24E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 May 2019 12:38:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVD1D-0000jI-Px; Mon, 27 May 2019 10:38:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hVD1C-0000j0-Nn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 10:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NR7QRkwXPuAzlDFmJy8jjxbsixiuu78bt6eOcDevCvk=; b=PT6TWLDw3gtMx/1CNyrrEjZ5qW
 5BM/etqYIaGEVmVT6mvzDqgUccA0xUne/wOIRrRC/zfaIxFpV5aSXuG0+c6uvGxp4RQix8CuAQ0vc
 7UQ8UCJhZHzcKLwMkGmcjtGlRcplMDYgyy2Kwe3E030lEjX5CiUF1IGg0F/tKiMA70BA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NR7QRkwXPuAzlDFmJy8jjxbsixiuu78bt6eOcDevCvk=; b=ErlHz8lMOjx+cmD90mQyzLhUWS
 Z96yG/PRrD6fITC3xhjPJtZXVeloG+Aiumj7dx+kjx5xnrNy/kcas11dKKpN0ZdwuFI7sEcOq9mmw
 ynTgxE7YSS1MriTfrdah8s86WAYbQFET7lP1MnMgAI7yj3+tmWH3GGr3fiAbOTGNgVNQ=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVD19-00F64m-TJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 10:38:14 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 5AD0D6086B; Mon, 27 May 2019 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558953486;
 bh=/Ncx2dTU4iPDuDOHevb/0Hm7K1eR/1l1da6675acaXo=;
 h=From:To:Cc:Subject:Date:From;
 b=JDbo4KS1r8G/D9AeKWP8FfHlfUDrrNKz3xHRtoc8QIVJDVMZNuDX5TVwboIH7yUyL
 ze6dnH31GSd29UhMpWHzyL2O8T0Mj3Jpoaxm5WedXpA/QHI4Z0c2Sdt5tNaaQxLYWH
 nYtLp4NbdK3AlTg7v6x6o6LlANIcthLg6ZThrjgI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE,T_FILL_THIS_FORM_SHORT autolearn=no
 autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D88E60252;
 Mon, 27 May 2019 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558953485;
 bh=/Ncx2dTU4iPDuDOHevb/0Hm7K1eR/1l1da6675acaXo=;
 h=From:To:Cc:Subject:Date:From;
 b=HB/Yz2cN+KAbZF5y4AQf72vH5b4R5zj+IUKAvJzgHL2zVBuu5r1ADagr4wyXFnX65
 lD5R+YwaWsR1HobeDAcR6jGh5Ce45HRpWYFwEdT4IF6McdXo6Nkok4YBUhjWy0PJ/Y
 5g76QMN3d0gX2u3MyQQm1S35nUAbdpvvaYTLs/F0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D88E60252
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 27 May 2019 16:07:55 +0530
Message-Id: <1558953475-5258-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hVD19-00F64m-TJ
Subject: [f2fs-dev] [PATCH] f2fs: ratelimit recovery messages
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ratelimit the recovery logs, which are expected in case
of sudden power down and which could result into too
many prints.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/recovery.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index e04f82b..38b3b24a 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -188,8 +188,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 		name = "<encrypted>";
 	else
 		name = raw_inode->i_name;
-	f2fs_msg(inode->i_sb, KERN_NOTICE,
-			"%s: ino = %x, name = %s, dir = %lx, err = %d",
+	printk_ratelimited(KERN_NOTICE "%s: ino = %x, name = %s, dir = %lx, err = %d",
 			__func__, ino_of_node(ipage), name,
 			IS_ERR(dir) ? 0 : dir->i_ino, err);
 	return err;
@@ -292,8 +291,7 @@ static int recover_inode(struct inode *inode, struct page *page)
 	else
 		name = F2FS_INODE(page)->i_name;
 
-	f2fs_msg(inode->i_sb, KERN_NOTICE,
-		"recover_inode: ino = %x, name = %s, inline = %x",
+	printk_ratelimited(KERN_NOTICE "recover_inode: ino = %x, name = %s, inline = %x",
 			ino_of_node(page), name, raw->i_inline);
 	return 0;
 }
@@ -642,10 +640,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 err:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_msg(sbi->sb, KERN_NOTICE,
-		"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
-		inode->i_ino,
-		file_keep_isize(inode) ? "keep" : "recover",
+	printk_ratelimited(KERN_NOTICE "recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
+		inode->i_ino, file_keep_isize(inode) ? "keep" : "recover",
 		recovered, err);
 	return err;
 }
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
