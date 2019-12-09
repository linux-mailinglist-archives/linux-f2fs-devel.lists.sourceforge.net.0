Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3B11792E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:24:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRRh-0005DC-Pi; Mon, 09 Dec 2019 22:24:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieRRf-0005Cu-Bz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYCFUjYwM16rzvxl0oMDkPWW1FW7U1gDaazhGoaNQKM=; b=W4B3BFO3E2l5UA97EG1wThxsZl
 Q/CgmAABrzKTBvAg3WbqRC5JSDHljtYRUpLYrhQ/mC+Y2UPa/4c1+CsN0+hz/G7ZF8pyxQTs1qzFJ
 qDFk1t2tIyGtAOmqjci5HF4CWUQ1cZ5Mc43FxoUggUJVHcZi/gYecx5IKCePdlb49meg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qYCFUjYwM16rzvxl0oMDkPWW1FW7U1gDaazhGoaNQKM=; b=V6x4SIsNw4yeNKtuRLrnLHCcRE
 ZFKw0a/TlVmbPbPNY15I39XPTdfmCS//kkHjx3yN01jtk20PaRdFDzG5ZR8O2m2leWB/Qhf+Ii8Xd
 L9LWwjLIfH8SGkaqKe26uAnOxibUKVvn1227xp6YoXaj3DkQJHQDChvcmMiwrw1nkPtI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRRd-00GkrQ-8g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:23:59 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC6B220726;
 Mon,  9 Dec 2019 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930228;
 bh=8cR/ULUscr3UPWmG/10SoHiMq7WuYzVCxKz9deW1Qxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jZwDje6T2zUqfXoR++5dwDY3Jy/iemEyl8zsXLQjRSzKeepB83oLKKujI/9UhJCJw
 jhHY6bviwuR8s9KOqKersNfKXiNps9uC0ffFJG4zYLw++izJY5sER/+PvwEVgeGdvP
 OEp2dTo264cXQ6tGFc5wlkU4WaRDEYfVnkq/QhOs=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Dec 2019 14:23:43 -0800
Message-Id: <20191209222345.1078-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20191209222345.1078-1-jaegeuk@kernel.org>
References: <20191209222345.1078-1-jaegeuk@kernel.org>
MIME-Version: 1.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ieRRd-00GkrQ-8g
Subject: [f2fs-dev] [PATCH 4/6] f2fs: should avoid recursive filesystem ops
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We need to use GFP_NOFS, since we did f2fs_lock_op().

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6cebc6681487..eb653f700ade 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1191,13 +1191,13 @@ static int __exchange_data_block(struct inode *src_inode,
 
 		src_blkaddr = f2fs_kvzalloc(F2FS_I_SB(src_inode),
 					array_size(olen, sizeof(block_t)),
-					GFP_KERNEL);
+					GFP_NOFS);
 		if (!src_blkaddr)
 			return -ENOMEM;
 
 		do_replace = f2fs_kvzalloc(F2FS_I_SB(src_inode),
 					array_size(olen, sizeof(int)),
-					GFP_KERNEL);
+					GFP_NOFS);
 		if (!do_replace) {
 			kvfree(src_blkaddr);
 			return -ENOMEM;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
