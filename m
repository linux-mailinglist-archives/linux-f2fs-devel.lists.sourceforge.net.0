Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422786C1C9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 08:19:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfah7-0002A6-JF;
	Thu, 29 Feb 2024 07:19:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1rfah6-0002A0-FV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 07:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vJwMbzWzqZZecTvO2lEO80X6J/8axeV7KSvmdBq1RAw=; b=mytC9z8KTnHLavvl9W5lvtBx+M
 FgFhmiImV0oIfR9DBnbAr3Rh6ijLA90o0fyZ1gRDnumNyxtd02vsA7oS0/xSzryuTqh/oAgJdq0EN
 H4SwQPjxwgDrleCrGT+sD+AEsq93g+RYoyOq3LzVcEIoU0dltHwwPQZAqOgsRkIDuMwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vJwMbzWzqZZecTvO2lEO80X6J/8axeV7KSvmdBq1RAw=; b=H
 oiQoWXq9m1ZE3ESJfx2JGnr1Pl5pp84X2ftab8JCAdY3o82saF2mh+waw8BD/YCL4op+mOzyHTbXF
 WPhrO0cmR5hymbh8F7XCRtFbtMdkRLnWxGBjTLmdy8AIhyQ6+2O4uHFXhkpZcVJP2rrGM/NuIGq+4
 mtXvlwHzd3CO3BjQ=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1rfah5-0005KY-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 07:19:04 +0000
X-IronPort-AV: E=Sophos;i="6.06,192,1705334400"; d="scan'208";a="79294954"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Thu, 29 Feb 2024 15:18:53 +0800
Message-ID: <20240229071853.62884-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.237.8.19]
X-ClientProxiedBy: BJ-MBX15.mioffice.cn (10.237.8.135) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently mkfs/fsck gets the following error when executed
 by non-root users: Info: open /dev/loop0 failed errno:13 Error: Not available
 on mounted device! Let's fix it by reading the backing file from sysfs. 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [118.143.206.90 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rfah5-0005KY-Fj
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to check loop device for
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
 lib/libf2fs.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d51e485..fa9ea9a 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -834,14 +834,20 @@ int f2fs_dev_is_umounted(char *path)
 		/* check whether regular is backfile of loop device */
 #if defined(HAVE_LINUX_LOOP_H) && defined(HAVE_LINUX_MAJOR_H)
 		struct mntent *mnt;
-		struct stat st_loop;
+		struct stat st_loop, st_sysfs;
 		FILE *f;
+		bool has_sysfs = true;
+
+		if (stat("/sys/dev/block/", &st_sysfs) || !S_ISDIR(st_sysfs.st_mode))
+			has_sysfs = false;
 
 		f = setmntent("/proc/mounts", "r");
 
 		while ((mnt = getmntent(f)) != NULL) {
 			struct loop_info64 loopinfo = {0, };
-			int loop_fd, err;
+			struct stat st_back;
+			int loop_fd, sysfs_fd, rc, err;
+			char buf[PATH_MAX + 1];
 
 			if (mnt->mnt_fsname[0] != '/')
 				continue;
@@ -852,6 +858,44 @@ int f2fs_dev_is_umounted(char *path)
 			if (major(st_loop.st_rdev) != LOOP_MAJOR)
 				continue;
 
+			if (has_sysfs) {
+				snprintf(buf, PATH_MAX,
+					 "/sys/dev/block/%d:%d/loop/backing_file",
+					 major(st_loop.st_rdev), minor(st_loop.st_rdev));
+
+				sysfs_fd = open(buf, O_RDONLY);
+				if (sysfs_fd < 0) {
+					MSG(0, "Info: open %s failed errno:%d\n",
+						buf, errno);
+					return -1;
+				}
+
+				memset(buf, 0, PATH_MAX + 1);
+				rc = read(sysfs_fd, buf, 1024);
+				if (rc < 0) {
+					MSG(0, "Info: read %s failed errno:%d\n",
+						buf, errno);
+					return -1;
+				}
+
+				/* Remove trailing newline (usual in sysfs) */
+				if (rc > 0 && *(buf + rc - 1) == '\n')
+					--rc;
+				buf[rc] = '\0';
+
+				if (stat(buf, &st_back) != 0) {
+					MSG(0, "Info: stat %s failed errno:%d\n",
+						buf, errno);
+					return -1;
+				}
+
+				if (st_buf.st_dev == st_back.st_dev &&
+					st_buf.st_ino == st_back.st_ino) {
+					MSG(0, "\tError: In use by loop device!\n");
+					return -EBUSY;
+				}
+			}
+
 			loop_fd = open(mnt->mnt_fsname, O_RDONLY);
 			if (loop_fd < 0) {
 				MSG(0, "Info: open %s failed errno:%d\n",
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
