Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27402871862
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Mar 2024 09:41:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhQMQ-00067o-03;
	Tue, 05 Mar 2024 08:41:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Xiuhong.Wang@unisoc.com>) id 1rhQMO-00067Z-3E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 08:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcmSrTYYfNP6QQkD9u8mH7YDFTUCgIuscysKzdMnatc=; b=b0dusPseICVMF/m9RPO7cSN5U1
 zWp+eRIt3U0ASlA9mNxG8IYzmB9c+MtNYTHu65Htd3MWfK88JbYFY3GzsDiRrNwgNiZvO0rUOBBpW
 eNmQZ8qA3bSDvACoP5udRl6/1FkUDWMUrexzzZxRedTvze14r7ey4gIOpwX/s+vnngV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EcmSrTYYfNP6QQkD9u8mH7YDFTUCgIuscysKzdMnatc=; b=g
 nFzXr+OaRMv6xXCxqiL6wtIvKL0Rs64acMri5OfkY+NU5CVvVBQCB+xNgxCy2ti1VDugnMSKCqBNJ
 J3x3pJC+PeqcfqXsUebLaHmflHHPY2ZwMTf0qnHrp3rmBbhY7nTenTpQRkdtLsJctdWmBJ4c/LTtx
 pMbYWTGR1x5e3Yzw=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhQMC-00020t-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 08:41:16 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4258eUNs002849;
 Tue, 5 Mar 2024 16:40:30 +0800 (+08)
 (envelope-from Xiuhong.Wang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Tppry0wJnz2KnhJL;
 Tue,  5 Mar 2024 16:39:30 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 5 Mar 2024 16:40:28 +0800
From: Xiuhong Wang <xiuhong.wang@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Tue, 5 Mar 2024 16:40:22 +0800
Message-ID: <20240305084023.3686070-1-xiuhong.wang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 4258eUNs002849
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following f2fs_io test will get a "0" result instead of
 -EINVAL, unisoc # ./f2fs_io compress file unisoc # ./f2fs_io reserve_cblocks
 file 0 it's not reasonable, so the judgement of atomic_read(&F2 [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rhQMC-00020t-Fw
Subject: [f2fs-dev] [PATCH 1/2] f2fs: compress: relocate some judgments in
 f2fs_reserve_compress_blocks
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hongyu.jin.cn@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following f2fs_io test will get a "0" result instead of -EINVAL,
unisoc # ./f2fs_io compress file
unisoc # ./f2fs_io reserve_cblocks file
 0
it's not reasonable, so the judgement of
atomic_read(&F2FS_I(inode)->i_compr_blocks) should be placed after
the judgement of is_inode_flag_set(inode, FI_COMPRESS_RELEASED).

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4ca6c693b33a..572d7bd4d161 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3720,18 +3720,18 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
-		goto out;
-
 	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
 
 	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		ret = -EINVAL;
-		goto unlock_inode;
+		goto out;
 	}
 
+	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
+		goto out;
+
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
@@ -3776,9 +3776,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		inode_set_ctime_current(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
-unlock_inode:
-	inode_unlock(inode);
 out:
+	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 
 	if (ret >= 0) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
