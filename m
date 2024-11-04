Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 668069BAA8F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 02:50:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7mEm-0004Xm-Hp;
	Mon, 04 Nov 2024 01:50:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t7mEj-0004Xb-J0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 01:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xoy8r5DCqpiJwhK/bgUU6K9omGekIPPgmS+G0xIZdPY=; b=MsZhXGudyjZ75uSedYme+WCjqI
 Mhe/nIPVA21xJelo6RHsAmmM0hoWcXsQsxosH4450m54co3lsriGHgWUbUA6+hqUB7svm+l6Kpq+b
 j8rLaoWr0p5NzrTfxHRnyK7SARnPqxKVwvNilKRCe7pkCo6VgUKtFC03aTjLLNKWWS0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xoy8r5DCqpiJwhK/bgUU6K9omGekIPPgmS+G0xIZdPY=; b=e
 E3f9tSD9neLCpukMDsOur/NbpkR52fE67szd1JXNN/vE5pOObE/K7sIN8hieVTTb8hLkpB3WTPiLY
 v4RgZvIYNIih8yCVKEFIKrXs8BYQLnEDabjSzXyJRO4qx9NoB330r1f6Ml5ESb5gvp8QbEaak3v9F
 Y1t/dN+GyeN1AMA4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7mEj-0007us-KM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 01:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18D3F5C4D23;
 Mon,  4 Nov 2024 01:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ADBC4CECD;
 Mon,  4 Nov 2024 01:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730685021;
 bh=aCDNknjyJPTTxvZz05v36HJhR5zaHHfhMWUotDphryc=;
 h=From:To:Cc:Subject:Date:From;
 b=c/tgXmR6T7sY67fw9a23TGe6EgJ5sQRswFUwGwmLbgPATVjWtcEDRUKb/1lffQ7KW
 4bMm23COrmROoDrqOxMV1vOH573pvScsy29hjc0uCSPHZxI4D91Qwt1tFxU9/L454H
 jYf8ncOFd5ly+jIK4eBWhPRfTohjqLbyMCfV9DSt52AZKXDfn5Og4huy0Rj/I7evL+
 IwePHdOiCIlnYXqMDG9c7ATZpjFGTbtXiTWT2wojGcBOn3aVcGzc0Bw8loeH6MmI5p
 ImkYKtQWaDhzCJtl3J3/JDmiQ0SQ+BurnKfV+vJxKNPPtGic/AXOrVoJ3cEZM9UKpg
 7O9Z24XtOa8Ig==
To: jaegeuk@kernel.org
Date: Mon,  4 Nov 2024 09:50:16 +0800
Message-Id: <20241104015016.228963-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jinsu Lee reported a performance regression issue,
 after commit
 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data inode"), we
 forced direct write to use buffered IO on inline_data inode, it [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7mEj-0007us-KM
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid forcing direct write to use
 buffered IO on inline_data inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jinsu Lee reported a performance regression issue, after commit
5c8764f8679e ("f2fs: fix to force buffered IO on inline_data
inode"), we forced direct write to use buffered IO on inline_data
inode, it will cause performace regression due to memory copy
and data flush.

It's fine to not force direct write to use buffered IO, as it
can convert inline inode before committing direct write IO.

Fixes: 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data inode")
Reported-by: Jinsu Lee <jinsu1.lee@samsung.com>
Closes: https://lore.kernel.org/linux-f2fs-devel/af03dd2c-e361-4f80-b2fd-39440766cf6e@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0e7a0195eca8..377a10b81bf3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -883,7 +883,11 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 		return true;
 	if (f2fs_compressed_file(inode))
 		return true;
-	if (f2fs_has_inline_data(inode))
+	/*
+	 * only force direct read to use buffered IO, for direct write,
+	 * it expects inline data conversion before committing IO.
+	 */
+	if (f2fs_has_inline_data(inode) && rw == READ)
 		return true;
 
 	/* disallow direct IO if any of devices has unaligned blksize */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
