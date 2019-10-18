Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C1DD1F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Oct 2019 00:08:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLaPj-0005n2-Jr; Fri, 18 Oct 2019 22:08:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iLaPh-0005mv-TN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 22:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uVDl4bkeh6bHzqaisqdzgp+jIaJAcgU5keP5ZmVJR5g=; b=R1G4SxPO4IESDntHyimoFwC5ga
 6mLNsqqi2X2P5FWYyWiZsl8hzxuWRyXAwQAiP8kRth4weVSCr08MO/fRHTALnrOCT+H4FqH9XYK4J
 LRP1GIsYfrxofD0NNKfNZA2yjt/3OLuyECR4pqTYN4CXFMqFXj7Lg0uEhNi30TWeeIbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uVDl4bkeh6bHzqaisqdzgp+jIaJAcgU5keP5ZmVJR5g=; b=P
 o7mP+Bpa9trPLp2+HgeIuRjhUeXXj7tIqv2cI2R/NwYfPCf8afojiAlaOglHkVEjEZ5C8rPEGfFoY
 5j8J2UxaVIYoD87jEMeEre60b0P4CsoogEioGzyAdxGM8gPUqYBg4vSg6fuA9M9gF7Uk2m5KwjO/v
 jPXdIyHCh3qK/56Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLaPg-007CrQ-Os
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 22:08:01 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AE12205F4;
 Fri, 18 Oct 2019 22:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571436475;
 bh=WHX65/AoIFRyii84i/q6+u2Bw9cdOY7501KBf1Lu+rQ=;
 h=From:To:Cc:Subject:Date:From;
 b=aRVyiRteedN3fziJZ/CIECe9t3VOs3k8b9v0TxGLG4Q5cDI0MC8+0z9AFNFZMAF2N
 owZGaTkf+pG97RnBVJNh4Crzzf21LVGD58imoMF9Gpvguv6Xbkae+Y5MrF0/NcBZmH
 2HsRF9cxCN9F0m8s5rOJNdPTOlaO8uWyT2p3moi0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 18 Oct 2019 18:06:58 -0400
Message-Id: <20191018220753.10002-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iLaPg-007CrQ-Os
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 01/56] f2fs: flush quota blocks
 after turnning it off
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

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 0e0667b625cf64243df83171bff61f9d350b9ca5 ]

After quota_off, we'll get some dirty blocks. If put_super don't have a chance
to flush them by checkpoint, it causes NULL pointer exception in end_io after
iput(node_inode). (e.g., by checkpoint=disable)

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 344aa861774bd..1ff0659d53d01 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1523,6 +1523,12 @@ void f2fs_quota_off_umount(struct super_block *sb)
 			set_sbi_flag(F2FS_SB(sb), SBI_NEED_FSCK);
 		}
 	}
+	/*
+	 * In case of checkpoint=disable, we must flush quota blocks.
+	 * This can cause NULL exception for node_inode in end_io, since
+	 * put_super already dropped it.
+	 */
+	sync_filesystem(sb);
 }
 
 int f2fs_get_projid(struct inode *inode, kprojid_t *projid)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
