Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0EF3F5403
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 02:11:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIK2g-0004Uv-Lz; Tue, 24 Aug 2021 00:11:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mIK2g-0004Tp-9x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 00:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mCd8MesI1TT6o43xgNjneahrUHgkMDmleAm3s/x8d3M=; b=lNHMU5/InJAxnhbCJLlPkXD5Gr
 +pUcZdQsYqSq7jmFbE/96GcSL49bMC1oVJDUBtoP12uI9kwIZYheGQix3iZkITH54AOt8o0jMN3BM
 p2gOiseIbzp80saT2vVDt7qtnIR3tg+UmUCrd8Y6LeJm6Iqllp0esPUq5lRVeQB1+y9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mCd8MesI1TT6o43xgNjneahrUHgkMDmleAm3s/x8d3M=; b=I
 seTKloRFWQ+TX+oLKofoWgDxHWcdVhx/PnQ7Tebf8zRnEnIjLuC+GPfxBOs5s18drSOW93trYUoIe
 0TVqtba/x3FH06cOdXGAMxGyqduBFJ2/QBA8Yav+qlwn32D0tFwSgGOPHtVW+xJ0eQLgXSBsM/kww
 hD/oPWzMt4yfEcNQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIK2f-00034n-8X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 00:11:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1C4C6124D;
 Tue, 24 Aug 2021 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629763903;
 bh=y+M+d16+SOhNga0ZjfIRxu+T5lwMUYmIY0JS7MhlAu4=;
 h=From:To:Cc:Subject:Date:From;
 b=TP961ZmZ2fBtCxsAUnfXGqBKR3CcAL9+OOFFnS2Df8nzxQsNJzar0Ig/tT6dRtaGf
 jktrXSiBjjFYAdXyFljfIEK37xCKM6epuHyyIuIvkcvcT/uFGBjp0G2mjZmUtDCDB2
 E7lahhXVOj1yYBNphBZxuEGHDFDAhPEQ1abGRcdlAtBN/vtmJuiVPhzcTy/MokAtYY
 C7+YyAHCJRzaPlvYJDhH1gQg28YoUi90lTsPXYcI6u0jPQlVIpUfLo9JvrDiCqDcF2
 nf1PwxzGwYzPuXCctAoZ0EGL8ZFxCG7ShGSETFfQexqyvl+zaBE6qYN7mBfr5KuPxG
 2CFCLO33gL/ug==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 24 Aug 2021 08:11:38 +0800
Message-Id: <20210824001138.12863-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mIK2f-00034n-8X
Subject: [f2fs-dev] [PATCH] f2fs: adjust unlock order for cleanup
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adjusts unlock order of .i_mmap_sem and .i_gc_rwsem for
cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1323cd0f445a..3330efb41f22 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3496,8 +3496,8 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 		released_blocks += ret;
 	}
 
-	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 out:
 	inode_unlock(inode);
 
@@ -3649,8 +3649,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		reserved_blocks += ret;
 	}
 
-	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 	if (ret >= 0) {
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
