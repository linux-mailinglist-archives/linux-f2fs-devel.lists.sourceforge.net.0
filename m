Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFB906905
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2024 11:37:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHgt0-0005m9-4Y;
	Thu, 13 Jun 2024 09:36:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1sHgsw-0005lj-UW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jun 2024 09:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T771Cm3gG+LO2ulH7lePHD6pyylm5bilZZmIslk4xUg=; b=eMnF5hPQCmYXUzdokHyX12n0J5
 XrTnX/sprImbMXWvBHdCWWeaukC8l09VbcaJTphYgouzvJMedRH02ULBGgTgTVHIvbckMI6NQuFNj
 j7Jgg66m8RhUqablmc2e36LH8Q5GRSIw44F7U+9AZzhlLQnjOyDbiq5oPWi3XvbxGpss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T771Cm3gG+LO2ulH7lePHD6pyylm5bilZZmIslk4xUg=; b=H
 qt+y0rV9xFQNMQHj+NYdx42T/sS4aMC8O9Mbzv17HY0R91XjcP9wzJrRHSB89MhwFba7EoCKZfEhw
 t4qsL4DZSGyrM549T5dZ1IUeQIoQjyGUtlIrGbKAWUXhNDnIFaC5ka0ntESSNuCQNYbK9MxCKd6tD
 fZsAEftbBXiPQSx0=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHgsw-0006XM-7v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jun 2024 09:36:47 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 45D9ZqpC082721;
 Thu, 13 Jun 2024 17:35:52 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4W0HGw1xS0z2S2vmG;
 Thu, 13 Jun 2024 17:31:36 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 13 Jun 2024 17:35:50 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 13 Jun 2024 17:35:33 +0800
Message-ID: <1718271333-32179-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 45D9ZqpC082721
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  mnt_{want, drop}_write_file is more suitable than file_{start,
 end}_wrtie
 and also is consistent with other ioctl operations. Signed-off-by: Zhiguo
 Niu <zhiguo.niu@unisoc.com> --- fs/f2fs/file.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sHgsw-0006XM-7v
Subject: [f2fs-dev] [PATCH] f2fs: fix to use mnt_{want,
 drop}_write_file replace file_{start, end}_wrtie
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
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

mnt_{want,drop}_write_file is more suitable than
file_{start,end}_wrtie and also is consistent with
other ioctl operations.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c50213d..e4a7cff 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3935,7 +3935,9 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 			 IS_ENCRYPTED(inode) && f2fs_is_multi_device(sbi)))
 		return -EOPNOTSUPP;
 
-	file_start_write(filp);
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
 	inode_lock(inode);
 
 	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
@@ -4061,7 +4063,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 err:
 	inode_unlock(inode);
-	file_end_write(filp);
+	mnt_drop_write_file(filp);
 
 	return ret;
 }
@@ -4115,7 +4117,9 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		option.algorithm >= COMPRESS_MAX)
 		return -EINVAL;
 
-	file_start_write(filp);
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
 	inode_lock(inode);
 
 	f2fs_down_write(&F2FS_I(inode)->i_sem);
@@ -4154,7 +4158,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 out:
 	f2fs_up_write(&F2FS_I(inode)->i_sem);
 	inode_unlock(inode);
-	file_end_write(filp);
+	mnt_drop_write_file(filp);
 
 	return ret;
 }
@@ -4211,7 +4215,9 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 
 	f2fs_balance_fs(sbi, true);
 
-	file_start_write(filp);
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
 	inode_lock(inode);
 
 	if (!f2fs_is_compress_backend_ready(inode)) {
@@ -4266,7 +4272,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
-	file_end_write(filp);
+	mnt_drop_write_file(filp);
 
 	return ret;
 }
@@ -4288,7 +4294,9 @@ static int f2fs_ioc_compress_file(struct file *filp)
 
 	f2fs_balance_fs(sbi, true);
 
-	file_start_write(filp);
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
 	inode_lock(inode);
 
 	if (!f2fs_is_compress_backend_ready(inode)) {
@@ -4344,7 +4352,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
-	file_end_write(filp);
+	mnt_drop_write_file(filp);
 
 	return ret;
 }
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
