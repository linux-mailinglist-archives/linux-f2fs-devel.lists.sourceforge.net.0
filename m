Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486986DBE5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 08:14:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfx68-0007DW-N9;
	Fri, 01 Mar 2024 07:14:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1rfx66-0007DC-OP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 07:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7y/tsy1fHT4zllA2aWNC8WIFjKwFsLksay/8gS/wv94=; b=H3k2qj/8Q+T9bU3H+HylNHQzUj
 XDKdlBTBrzmiNSVtDabiXp3VS01mo9jaYevdfr/7Mc5809Hc3SA564ETQR/ti62cyjyGhlj0IFpQI
 sjI6ewaBt+NNIo6n6l+mKLYsE9BYPwU7JOHjyIVsn/KXbBkKMoU0nDAlanDU1sBGefoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7y/tsy1fHT4zllA2aWNC8WIFjKwFsLksay/8gS/wv94=; b=hzA/m1q4FEK8+ijB4uaI+07M3J
 QIqIA3B71rlzhlaassKB0ccvoNDXFkkzIDqaUU9Z4hYSch7eGmXcZUV/6KcOJRUuWL0YnBY+Ge7fp
 GqUfSP7+3rjU1S5q0jQbjwtC9fehpIjjt4m9olzvjD1i2AnuAiuDjkHg1L1j11qXRsSI=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.122])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1rfx62-0001HR-KI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 07:14:23 +0000
X-IronPort-AV: E=Sophos;i="6.06,195,1705334400"; d="scan'208";a="104994432"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Fri, 1 Mar 2024 15:14:02 +0800
Message-ID: <20240301071402.159309-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229074141.66395-1-huangjianan@xiaomi.com>
References: <20240229074141.66395-1-huangjianan@xiaomi.com>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.18]
X-ClientProxiedBy: bj-mbx11.mioffice.cn (10.237.8.131) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently mkfs/fsck gets the following error when executed
 by non-root users: Info: open /dev/loop0 failed errno:13 Error: Not available
 on mounted device! Let's fix it by reading the backing file from sysfs. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.226.244.122 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rfx62-0001HR-KI
Subject: [f2fs-dev] [PATCH v3] f2fs-tools: fix to check loop device for
 non-root users
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
From: Huang Jianan via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Jianan <huangjianan@xiaomi.com>
Cc: jnhuang95@gmail.com, wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently mkfs/fsck gets the following error when executed by
non-root users:

Info: open /dev/loop0 failed errno:13
        Error: Not available on mounted device!

Let's fix it by reading the backing file from sysfs.

Fixes: 14197d546b93 ("f2fs-tools: fix to check loop device")
Signed-off-by: Huang Jianan <huangjianan@xiaomi.com>
---
v3:
- Skip deleted backing file.
 lib/libf2fs.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d51e485..fad3fd4 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -832,7 +832,7 @@ int f2fs_dev_is_umounted(char *path)
 		}
 	} else if (S_ISREG(st_buf.st_mode)) {
 		/* check whether regular is backfile of loop device */
-#if defined(HAVE_LINUX_LOOP_H) && defined(HAVE_LINUX_MAJOR_H)
+#if defined(HAVE_LINUX_MAJOR_H)
 		struct mntent *mnt;
 		struct stat st_loop;
 		FILE *f;
@@ -840,8 +840,9 @@ int f2fs_dev_is_umounted(char *path)
 		f = setmntent("/proc/mounts", "r");
 
 		while ((mnt = getmntent(f)) != NULL) {
-			struct loop_info64 loopinfo = {0, };
-			int loop_fd, err;
+			struct stat st_back;
+			int sysfs_fd, rc;
+			char buf[PATH_MAX + 1];
 
 			if (mnt->mnt_fsname[0] != '/')
 				continue;
@@ -852,23 +853,36 @@ int f2fs_dev_is_umounted(char *path)
 			if (major(st_loop.st_rdev) != LOOP_MAJOR)
 				continue;
 
-			loop_fd = open(mnt->mnt_fsname, O_RDONLY);
-			if (loop_fd < 0) {
+			snprintf(buf, PATH_MAX,
+				 "/sys/dev/block/%d:%d/loop/backing_file",
+				 major(st_loop.st_rdev), minor(st_loop.st_rdev));
+
+			sysfs_fd = open(buf, O_RDONLY);
+			if (sysfs_fd < 0) {
 				MSG(0, "Info: open %s failed errno:%d\n",
-					mnt->mnt_fsname, errno);
+					buf, errno);
 				return -1;
 			}
 
-			err = ioctl(loop_fd, LOOP_GET_STATUS64, &loopinfo);
-			close(loop_fd);
-			if (err < 0) {
-				MSG(0, "\tError: ioctl LOOP_GET_STATUS64 failed errno:%d!\n",
-					errno);
+			memset(buf, 0, PATH_MAX + 1);
+			rc = read(sysfs_fd, buf, PATH_MAX);
+			if (rc < 0) {
+				MSG(0, "Info: read %s failed errno:%d\n",
+					buf, errno);
 				return -1;
 			}
 
-			if (st_buf.st_dev == loopinfo.lo_device &&
-				st_buf.st_ino == loopinfo.lo_inode) {
+			/* Remove trailing newline */
+			if (rc > 0 && *(buf + rc - 1) == '\n')
+				--rc;
+			buf[rc] = '\0';
+
+			/* Skip deleted files like "xxx (deleted)" */
+			if (stat(buf, &st_back) != 0)
+				continue;
+
+			if (st_buf.st_dev == st_back.st_dev &&
+				st_buf.st_ino == st_back.st_ino) {
 				MSG(0, "\tError: In use by loop device!\n");
 				return -EBUSY;
 			}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
