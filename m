Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 710AF880B27
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Mar 2024 07:22:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmpLb-0005nZ-Hq;
	Wed, 20 Mar 2024 06:22:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rmpLZ-0005nS-6t
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 06:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrQSeWaQAFlDqQGunZX+D+EYyiBwLV30CTYdj6V+3Ig=; b=KA2r4lYUaBdInX8nOjvuDnhra9
 u4X+dKkvd3MX/XKKnlpAUDkm0gQX7R6lU6s0ekd0RMZpsZuDxRFVRBpxLdfz61wR9QV21BVps31YT
 lI7OYuUUHoIzleAqz0zjK9br2Fz1no0P+av+DPUznLjETXytjon/KZX/GQvv++XqbaVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YrQSeWaQAFlDqQGunZX+D+EYyiBwLV30CTYdj6V+3Ig=; b=R
 +Nbw4H1cpKYfkAmdOG2Uv8V4sfHu7x/h3b/1/u+5SCluBbIszb102k2GBTek8698Ftt0P+f7QW67O
 NOZR1LfLBQ3pk8Q1AEOsLmygZVaT5wQcTn0QmUx7pnF5XAFz3Wt+duzMxeh4dvJ+GlM3XJZXr0bpG
 mYJXUUN/e2iqmPTA=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmpLQ-0007u4-7d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 06:22:45 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42K6MKnq064146;
 Wed, 20 Mar 2024 14:22:20 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Tzz426PS0z2LRfxd;
 Wed, 20 Mar 2024 14:20:50 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 20 Mar 2024 14:22:17 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 20 Mar 2024 14:22:16 +0800
Message-ID: <1710915736-31823-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 42K6MKnq064146
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
 positions. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> --- v3: modify
 some update conditions according to Chao's suggeestions v2: update patch
 according to Chao's suggestions --- --- fs/f2fs/file.c | 15 ++ [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmpLQ-0007u4-7d
Subject: [f2fs-dev] [PATCH V3] f2fs: add REQ_TIME time update for some user
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
v3: modify some update conditions according to Chao's suggeestions
v2: update patch according to Chao's suggestions
---
---
 fs/f2fs/file.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1761ad1..128e53d 100644
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
 
@@ -3600,6 +3602,8 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 out:
+	if (released_blocks)
+		f2fs_update_time(sbi, REQ_TIME);
 	inode_unlock(inode);
 
 	mnt_drop_write_file(filp);
@@ -3770,6 +3774,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 unlock_inode:
+	if (reserved_blocks)
+		f2fs_update_time(sbi, REQ_TIME);
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 
@@ -3966,6 +3972,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	if (len)
 		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
 				prev_block, len, range.flags);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	filemap_invalidate_unlock(mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -4175,6 +4182,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (ret)
 		f2fs_warn(sbi, "%s: The file might be partially decompressed (errno=%d). Please delete the file.",
 			  __func__, ret);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 	file_end_write(filp);
@@ -4254,6 +4262,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
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
