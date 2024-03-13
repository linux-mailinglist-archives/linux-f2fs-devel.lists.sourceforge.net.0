Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2A87A234
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 05:12:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkFyC-0004vF-8i;
	Wed, 13 Mar 2024 04:12:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rkFy8-0004v9-JB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 04:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKU12Nk8QD7bKnv7kWZQEYqCCrLOvvWnT6qqQawgL6M=; b=Pm+lDxLHH1Bwdd2iHzVnH8ZPcG
 JME1f7hCwG/08i2GaVby83IgcRZB/yZvaoGwKinDStqvOao1cs5LthHM8pne8jEg8gwdZQ3A3Z+nW
 Yro8X+8bYY07aTuNnMRDOMx2YYiI/p7qG451T4UE6pjtni8N0VAbjN764kQYUmrJgX8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VKU12Nk8QD7bKnv7kWZQEYqCCrLOvvWnT6qqQawgL6M=; b=Q
 c8eMNU5HRCFFDregONIDDmuKHE1y6bJ34sY4P+jK70FMcOfNpReH+o0Hp5qP/DWyQGCAHO8CyZLf0
 Xg/DBjmCotiWELu54mia4z0MELiN+NBRl9m3HQg7infVgMUzvTgGITWEyOf/8f+SfE7K6uRqoZ+Jz
 3dDtQYYKbsDmUEvs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkFxu-0001xY-0v for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 04:11:56 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42D4BEfm081099;
 Wed, 13 Mar 2024 12:11:14 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TvcVG3CXdz2L0GYg;
 Wed, 13 Mar 2024 12:09:58 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 13 Mar 2024 12:11:11 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 13 Mar 2024 12:11:01 +0800
Message-ID: <1710303061-16822-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 42D4BEfm081099
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  some user behaviors requested filesystem operations, which
 will cause filesystem not idle. Meanwhile adjust f2fs_update_time(REQ_TIME)
 of f2fs_ioc_defragment to successful case. Signed-off-by: Zhiguo Niu
 <zhiguo.niu@unisoc.com>
 --- fs/f2fs/file.c | 9 ++++++++- 1 file changed, 8 insertions(+), 1 deletion(-)
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkFxu-0001xY-0v
Subject: [f2fs-dev] [PATCH] f2fs: add REQ_TIME time update for some user
 behaviors
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

some user behaviors requested filesystem operations, which
will cause filesystem not idle.
Meanwhile adjust f2fs_update_time(REQ_TIME) of
f2fs_ioc_defragment to successful case.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4dfe38e..dac3836 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2784,7 +2784,6 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	err = f2fs_defragment_range(sbi, filp, &range);
 	mnt_drop_write_file(filp);
 
-	f2fs_update_time(sbi, REQ_TIME);
 	if (err < 0)
 		return err;
 
@@ -2792,6 +2791,7 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 							sizeof(range)))
 		return -EFAULT;
 
+	f2fs_update_time(sbi, REQ_TIME);
 	return 0;
 }
 
@@ -3331,6 +3331,7 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
 	if (copy_from_user(&block_count, (void __user *)arg,
 			   sizeof(block_count)))
 		return -EFAULT;
+	f2fs_update_time(sbi, REQ_TIME);
 
 	return f2fs_resize_fs(filp, block_count);
 }
@@ -3424,6 +3425,7 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
 	f2fs_up_write(&sbi->sb_lock);
 
 	mnt_drop_write_file(filp);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	kfree(vbuf);
 	return err;
@@ -3597,6 +3599,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 
@@ -3766,6 +3769,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
 		inode_set_ctime_current(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
+		f2fs_update_time(sbi, REQ_TIME);
 	}
 unlock_inode:
 	inode_unlock(inode);
@@ -3964,6 +3968,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	if (len)
 		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
 				prev_block, len, range.flags);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	filemap_invalidate_unlock(mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -4173,6 +4178,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (ret)
 		f2fs_warn(sbi, "%s: The file might be partially decompressed (errno=%d). Please delete the file.",
 			  __func__, ret);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 	file_end_write(filp);
@@ -4252,6 +4258,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	if (ret)
 		f2fs_warn(sbi, "%s: The file might be partially compressed (errno=%d). Please delete the file.",
 			  __func__, ret);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 	file_end_write(filp);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
