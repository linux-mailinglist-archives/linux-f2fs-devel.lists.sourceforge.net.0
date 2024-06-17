Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD190A68D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jun 2024 09:12:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJ6X5-00037m-2U;
	Mon, 17 Jun 2024 07:12:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Xiuhong.Wang@unisoc.com>) id 1sJ6X4-00037c-6a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jun 2024 07:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u7D9S33tH1AHEPA6mZuJk1j9rynryvJ8tNZwIu3IyTk=; b=k4Yjmr7cLEy176OnLXeZpF/7XN
 RyjSArim9b10DXcF/VUVFE6vr1Z3ebC6Su/JLAN7xk2zYcT4z7VLj7nfQ+IqdktO7VJDqrspIND4d
 tol2Cs5cy2C4r1nv+/zo9dJPEImmh1qNoRK/pz1QoaNJKoiNdCFAiOFXMkIyEYfz71dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u7D9S33tH1AHEPA6mZuJk1j9rynryvJ8tNZwIu3IyTk=; b=C
 R3b53zht+C1xI2XLgG2CWhBz6V4RjcZlbcQuvvDhLHDaBwIUtb1Sldni9FyT56lycXW0d7PuEhdCn
 4xnBH+gHRlWBx0Q1Yf406FAsNUoWpbZUSOnfgl31SOeGU+CXSX5o9AjAsBAhRgDrkOFG58PHCGDbz
 tMHZ8a0q/Z+tEatg=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJ6X4-0000Sq-4N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jun 2024 07:12:03 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 45H7BJWB088492;
 Mon, 17 Jun 2024 15:11:19 +0800 (+08)
 (envelope-from Xiuhong.Wang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4W2gt66fsrz2Rm6ZP;
 Mon, 17 Jun 2024 15:06:54 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 17 Jun 2024 15:11:17 +0800
From: Xiuhong Wang <xiuhong.wang@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Mon, 17 Jun 2024 15:11:14 +0800
Message-ID: <20240617071114.150721-1-xiuhong.wang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 45H7BJWB088492
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When using the f2fs_io tool to set_verity, it will fail as
 follows: unisc:/data # ./f2fs_io set_verity file FS_IOC_ENABLE_VERITY:
 Inappropriate
 ioctl for device this is because commit: 95ae251fe828 (" [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [222.66.158.135 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJ6X4-0000Sq-4N
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix do_set_verity ioctl fail issue
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When using the f2fs_io tool to set_verity, it will fail as follows:
unisc:/data # ./f2fs_io set_verity file
FS_IOC_ENABLE_VERITY: Inappropriate ioctl for device
this is because commit: 95ae251fe828 ("f2fs: add fs-verity support"),
the passed parameters do not match the latest kernel version.

After patch:
unisoc:/data # ./f2fs_io set_verity file
Set fsverity bit to file
unisoc:/data # ./f2fs_io getflags file
get a flag on file ret=0, flags=verity

Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 include/android_config.h |  1 +
 tools/f2fs_io/f2fs_io.c  |  9 ++++++---
 tools/f2fs_io/f2fs_io.h  | 20 ++++++++++++++++++--
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/android_config.h b/include/android_config.h
index 05b686e..9c8b163 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -13,6 +13,7 @@
 #define HAVE_LINUX_XATTR_H 1
 #define HAVE_LINUX_FS_H 1
 #define HAVE_LINUX_FIEMAP_H 1
+#define HAVE_LINUX_VERITY_H 1
 #define HAVE_MNTENT_H 1
 #define HAVE_STDLIB_H 1
 #define HAVE_STRING_H 1
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index a7b593a..2447490 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -182,16 +182,19 @@ static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
 static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 {
 	int ret, fd;
+	struct fsverity_enable_arg args = {.version = 1};
+
+	args.hash_algorithm = FS_VERITY_HASH_ALG_SHA256;
+	args.block_size = 4096;
 
 	if (argc != 2) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
 	}
+	fd = open(argv[1], O_RDONLY);
 
-	fd = open(argv[1], O_RDWR);
-
-	ret = ioctl(fd, FS_IOC_ENABLE_VERITY);
+	ret = ioctl(fd, FS_IOC_ENABLE_VERITY, &args);
 	if (ret < 0) {
 		perror("FS_IOC_ENABLE_VERITY");
 		exit(1);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index b5c82f5..e55db5f 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -16,6 +16,9 @@
 #ifdef HAVE_LINUX_FS_H
 #include <linux/fs.h>
 #endif
+#ifdef HAVE_LINUX_VERITY_H
+#include <linux/fsverity.h>
+#endif
 
 #include <sys/types.h>
 
@@ -136,8 +139,21 @@ struct fscrypt_get_policy_ex_arg {
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_PWSALT	FS_IOC_GET_ENCRYPTION_PWSALT
 
-#define FS_IOC_ENABLE_VERITY		_IO('f', 133)
-
+#ifndef FS_IOC_ENABLE_VERITY
+#define FS_IOC_ENABLE_VERITY    _IOW('f', 133, struct fsverity_enable_arg)
+#define FS_VERITY_HASH_ALG_SHA256       1
+struct fsverity_enable_arg {
+	__u32 version;
+	__u32 hash_algorithm;
+	__u32 block_size;
+	__u32 salt_size;
+	__u64 salt_ptr;
+	__u32 sig_size;
+	__u32 __reserved1;
+	__u64 sig_ptr;
+	__u64 __reserved2[11];
+};
+#endif
 /*
  * Inode flags
  */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
