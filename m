Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A68AE87CC5E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Mar 2024 12:33:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rl5oQ-0001ZT-EK;
	Fri, 15 Mar 2024 11:33:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rl5oP-0001ZM-Cc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Mar 2024 11:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7LSkZJiG/QWL0vsT9vvHpHphZ2Q/BjKIxc7jdNLH1eA=; b=F4UNBKHSlJ2wxgWwgdsgOQanV6
 VvpsXTqMbPYTolM8XvXWJT6MEa5YoFUWYsA9p9Yv88wQVA1nr/cQiR2RGI2q+2Vy7jbZrps2OnwCi
 vqT/YMgpT0dGscXWO4/pEiaD+CAvkRFs6SzywgCb/TGg3A8GatjBymEAzrPrtCQ7VANk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7LSkZJiG/QWL0vsT9vvHpHphZ2Q/BjKIxc7jdNLH1eA=; b=O
 /Ji8t+/lae3EOYsGd2TpN33YFOPi6/aTMqwptZ7h/Zv+g9owY+K67gUVSRe4TXv2qleK5AKdzb6dq
 BeeXtzqpog+xsM4C2uad9rCu9TNONWszWvSuOLpxZXNXa3Up1pVH9BTOxvPu3SN2HCG6ZgPsGElTa
 D8JeNhPR2AK6Ckrk=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rl5oD-00048u-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Mar 2024 11:33:22 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42FBWfBd056967;
 Fri, 15 Mar 2024 19:32:41 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Tx2Bf0RM4z2L6tFy;
 Fri, 15 Mar 2024 19:31:22 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 15 Mar 2024 19:32:39 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 15 Mar 2024 19:32:36 +0800
Message-ID: <1710502356-11469-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 42FBWfBd056967
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  some user behaviors requested filesystem operations, which
 will cause filesystem not idle. Meanwhile adjust some
 f2fs_update_time(REQ_TIME)
 positions. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> --- v2: update
 patch according to Chao's suggestions --- --- fs/f2fs/file.c | 13
 ++++++++++--- 1 file changed, 10 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rl5oD-00048u-M3
Subject: [f2fs-dev] [PATCH V2] f2fs: add REQ_TIME time update for some user
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
Meanwhile adjust some f2fs_update_time(REQ_TIME) positions.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
v2: update patch according to Chao's suggestions
---
---
 fs/f2fs/file.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1761ad1..8c9d6ea 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2354,13 +2354,14 @@ static bool uuid_is_nonzero(__u8 u[16])
 static int f2fs_ioc_set_encryption_policy(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
+	int ret;
 
 	if (!f2fs_sb_has_encrypt(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
 
+	ret = fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
-
-	return fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
+	return ret;
 }
 
 static int f2fs_ioc_get_encryption_policy(struct file *filp, unsigned long arg)
@@ -2786,7 +2787,8 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	err = f2fs_defragment_range(sbi, filp, &range);
 	mnt_drop_write_file(filp);
 
-	f2fs_update_time(sbi, REQ_TIME);
+	if (range.len)
+		f2fs_update_time(sbi, REQ_TIME);
 	if (err < 0)
 		return err;
 
@@ -3599,6 +3601,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 
@@ -3768,6 +3771,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
 		inode_set_ctime_current(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
+		f2fs_update_time(sbi, REQ_TIME);
 	}
 unlock_inode:
 	inode_unlock(inode);
@@ -3966,6 +3970,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	if (len)
 		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
 				prev_block, len, range.flags);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	filemap_invalidate_unlock(mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -4175,6 +4180,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (ret)
 		f2fs_warn(sbi, "%s: The file might be partially decompressed (errno=%d). Please delete the file.",
 			  __func__, ret);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 	file_end_write(filp);
@@ -4254,6 +4260,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
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
