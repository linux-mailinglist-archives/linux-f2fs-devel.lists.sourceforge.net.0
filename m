Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C98EF125255
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 20:53:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihfOK-0006Ma-7z; Wed, 18 Dec 2019 19:53:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ihfOH-0006M5-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jI8btoFFJ3pPFPWHWwY+/sKyEffvdGsllCksbsiMB4k=; b=W3fKMmkyEgMbySgtVO9U8AccHD
 5Tw0gs/DRnFApQpmaoPI4hRZ65qEScSOT3rDKRtjeQylxQ+KqrxcowJP8cB4v797WrgTEp+9kbAc7
 XjiUH7imQsQPgNXHeO9UtVkBMEeZZBLEcjSpFOF8eZkfhYbShKJ4cdmngeH0eAmYCgOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jI8btoFFJ3pPFPWHWwY+/sKyEffvdGsllCksbsiMB4k=; b=Y
 5yq/dy2k7Is01ocLRL8zrtIagaiV3iB4IuBtFLVIewvuy924YK6Tr9U4QjoTVuY3IxP7XPs3Yiobc
 R4o/ApttL5sErx/p9ekROU4gBV+mPGzejUnG1hOwuXJnKH8/DKeKVmix4DcMBlrWhILANadztkny4
 nIGplWYX8XB0HneM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihfOC-0065px-6H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:53:49 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6780D2082E;
 Wed, 18 Dec 2019 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576698806;
 bh=oS+AG2W5xIw5h2v3qbAX39cjDnuHu/f0/3ob1+ENrWI=;
 h=From:To:Cc:Subject:Date:From;
 b=MubHMAQ9WWOqoArz7Fi8Yibz7XyLUuFeg1Dql3rgMkyEFN8Qt6AGUjdBFxwZIm+db
 lEYrt8R3IboTPPHE5IEjdky2VpeFrbtZz/4qU9UmZU1G7KrVMvGj/4CN9/aXvuFAxp
 TfT/KdHFyy37YI23DyaPN+DuHuC7yGDhJdmDHAg0=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 Dec 2019 11:53:24 -0800
Message-Id: <20191218195324.17360-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
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
X-Headers-End: 1ihfOC-0065px-6H
Subject: [f2fs-dev] [PATCH] f2fs: cover f2fs_lock_op in expand_inode_data
 case
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

We were missing to cover f2fs_lock_op in this case.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4ea9bf9e8701..0b74f94ac8ee 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1646,12 +1646,13 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 			if (err && err != -ENODATA && err != -EAGAIN)
 				goto out_err;
 		}
-
+		f2fs_lock_op(sbi);
 		down_write(&sbi->pin_sem);
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
 		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
 		up_write(&sbi->pin_sem);
+		f2fs_unlock_op(sbi);
 
 		done += map.m_len;
 		len -= map.m_len;
@@ -1661,7 +1662,9 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_len = done;
 	} else {
+		f2fs_lock_op(sbi);
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
+		f2fs_unlock_op(sbi);
 	}
 out_err:
 	if (err) {
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
