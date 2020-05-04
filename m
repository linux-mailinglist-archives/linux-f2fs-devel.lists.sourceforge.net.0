Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5291C3E38
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 May 2020 17:13:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jVcmq-0002jW-LH; Mon, 04 May 2020 15:13:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jVcmp-0002jP-IJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 May 2020 15:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qBhciQ+DWYPmIgygmnCBz8TW3fPRGRcCubF3D54qtA=; b=iLbym+tx9mr+gnZIjyiA2ekw2x
 RBAnF9eIp9SqMHxeaBR7w3R2EZ8KJ0i84VdesO9WRcWTGqUugwTI/1oVr2Sz5HtQwZTBiXpoZyvcV
 IKgYw5zgRs0qqZtYNAlZX3+aZ4IoXcYVi8TMR1I/xI6P5vWZMIVsNTchNdilE8Q+fW5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6qBhciQ+DWYPmIgygmnCBz8TW3fPRGRcCubF3D54qtA=; b=X
 2MmvhOf0VROTQPT1Vv0A+9QsFun3AgdZwo6BzPxvzcuLsW0pUyvfHoneI19zXwBQjrX0NRla5abIr
 w74jTcar0DGqXxz6uiX/bSh7Pq4aY+J44cebfvC8qGNbD8Wc/JApVcb/FB6yHlAyhfS3X4t4Zn9t8
 9XNqreM4EF9Alqdw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jVcmo-006zFV-GT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 May 2020 15:13:39 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37AD120757;
 Mon,  4 May 2020 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588602940;
 bh=/ng91w5ahKiTgqOAq3EhJa/UEnoAexrnPLSisjkQuAo=;
 h=From:To:Cc:Subject:Date:From;
 b=2NcGhs1lltWrZgLGFr9nyV1si7PFTUah17Dv93Gy3acgY/eVNgCK175zt9ULoQb/V
 m7zmQId2X1c5b8NAC3lqZzGj/vy8Hw1j6pcFD5S5ZRoB9VZaS995y7lW1cNSbLcYq8
 E4dBOHOZcFo9eV6uZzbtp7zHTiF73MzO/LoHhj1A=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  4 May 2020 07:35:38 -0700
Message-Id: <20200504143538.159967-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
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
X-Headers-End: 1jVcmo-006zFV-GT
Subject: [f2fs-dev] [PATCH] f2fs: remove redundant check in
 f2fs_force_buffered_io
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

From: Daeho Jeong <daehojeong@google.com>

We already checked whether the file is compressed or not in
f2fs_post_read_required(). So removed f2fs_compressed_file()
in f2fs_force_buffered_io().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6b7b963641696..01a00fc808361 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4064,8 +4064,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-	if (f2fs_compressed_file(inode))
-		return true;
 	/*
 	 * for blkzoned device, fallback direct IO to buffered IO, so
 	 * all IOs can be serialized by log-structured write.
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
