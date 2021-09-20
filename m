Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB10412966
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Sep 2021 01:26:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSSgJ-0001t8-BL; Mon, 20 Sep 2021 23:26:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mSSgI-0001t1-0H
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Sep 2021 23:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=edSL1QlDDvyPhv7ZKe1uzVNfjbJm6/lcXBxbtJq/A0M=; b=GQ9yGkNpYGsLZbOIZW4ZoWnv0z
 5O8lWGZYcDWjkdMe5qcQbsLpvrpGP7+rwgTZodZwer4G2o6vUTYLzyIiIebSHcTpPGmCuSvpL4Xgd
 vGKvEEvNh3aL0Qy3siT0fWL/DrYLYYipap0zl8CuEwqX2QpFK0nG1dkqibXbJNaKBPgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=edSL1QlDDvyPhv7ZKe1uzVNfjbJm6/lcXBxbtJq/A0M=; b=j0S3QrTvk4lX+re+ZyHz8QL+iO
 zExpUqTCK27XbRgI4P1H4xBMhJWHTyuyzzXeMRdw22OFixiEWwtY2R7IccaUuT6m3SCLrs3aew20T
 1mZvyTeNgVH1H0AUd1iB+nHZ9iMy97K80E54r0BhhstSOUUt2WUyAoG7p+BNONP2InEM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSSgH-0000ul-9v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Sep 2021 23:26:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B3261221
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Sep 2021 23:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632180391;
 bh=5qzxaZb2NDUd6+Ncy26HFK0ExTboHGDTapNUYGmPUPs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=E6hawfHV4TYZFF+BLE7b4wJYtpK0u3yB+v9oDoQcNjRXeOwKr3nX/7zwZtagh5aPX
 uQK0jxTaV1i/ULQBRNkWacs62C/vHO2ZNKYF2YMdcOIuZMg7j0DoJ5D0S9Nywpjj1I
 gh5DuY3bFA4QqCHKAExcJEBwMymguzBTo3Ekn0qGY/dpfg6Fm5rckSCZlss6ZZ7w/L
 RDEGo++pspyEItpluUQyNbJsoLwXTzXP4Ro3Te083y44D39fDlCiI1LGN5nrA5M7o5
 5Qj3sDzoJEeNGGD6KQVqIF8ZelLsbwhrKPdoSlP65fpzTNs70Yx7yEm8liOk2SJ0Ae
 nTwB886kwk1oA==
Date: Mon, 20 Sep 2021 16:26:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YUkYpkKOvtBCgOCs@google.com>
References: <20210910225618.501839-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910225618.501839-1-jaegeuk@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch fixes the below stale magic info. $ mkfs.btrfs
 -f test.img btrfs-progs v5.10.1 See http://btrfs.wiki.kernel.org for more
 information. Label: (null) UUID: 941d2db7-3ece-4090-8b22-c4ea548b5dae Node
 size: 16384 Sector size: 4096 Filesystem size: 1.00GiB Block group profiles:
 Data: single 8.00MiB Metadata: DUP 51.19MiB System: DUP 8.00M [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mSSgH-0000ul-9v
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: wipe other FS magics given -f
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes the below stale magic info.

$ mkfs.btrfs -f test.img
btrfs-progs v5.10.1
See http://btrfs.wiki.kernel.org for more information.

Label:              (null)
UUID:               941d2db7-3ece-4090-8b22-c4ea548b5dae
Node size:          16384
Sector size:        4096
Filesystem size:    1.00GiB
Block group profiles:
  Data:             single            8.00MiB
  Metadata:         DUP              51.19MiB
  System:           DUP               8.00MiB
SSD detected:       no
Incompat features:  extref, skinny-metadata
Runtime features:
Checksum:           crc32c
Number of devices:  1
Devices:
   ID        SIZE  PATH
    1     1.00GiB  test.img

$ hexdump -s 0x10000 -n 128 -C test.img
00010000  81 29 94 0a 00 00 00 00  00 00 00 00 00 00 00 00  |.)..............|
00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00010020  94 1d 2d b7 3e ce 40 90  8b 22 c4 ea 54 8b 5d ae  |..-.>.@.."..T.].|
00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
00010080

$ mkfs.f2fs -t 0 -f test.img

	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is disabled
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 2097152 (1024 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
Info: Overprovision ratio = 6.360%
Info: Overprovision segments = 68 (GC reserved = 39)
Info: format successful

$hexdump -s 0x10000 -n 128 -C test.img
00010000  c2 8a c8 26 00 00 00 00  00 00 00 00 00 00 00 00  |...&............|
00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00010020  92 ab 3f c6 b7 82 49 5e  93 23 e8 c9 e9 45 7d ac  |..?...I^.#...E}.|
00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
00010080

--- After this patch ---
$ mkfs.f2fs -t 0 -f test.img

	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is disabled
	test.img appears to contain an existing filesystem (btrfs).
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 2097152 (1024 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
Info: Overprovision ratio = 6.360%
Info: Overprovision segments = 68 (GC reserved = 39)
Info: format successful

$ hexdump -s 0x10000 -n 128 -C test.img
00010000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00010080

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v1:
 - add error handlers
 - call f2fs_devs_are_umounted() followed by f2fs_get_device_info() to fix
   open(O_EXCL)

 fsck/main.c             |  2 +-
 include/f2fs_fs.h       |  1 +
 lib/libf2fs.c           |  6 ++++++
 mkfs/f2fs_format_main.c | 36 ++++++++++++++++++++++++++++++------
 4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index eda399cf0679..e4cfdf443867 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -1120,7 +1120,7 @@ int main(int argc, char **argv)
 	}
 
 	/* Get device */
-	if (f2fs_get_device_info() < 0) {
+	if (f2fs_get_device_info() < 0 || f2fs_get_f2fs_info() < 0) {
 		ret = -1;
 		if (c.func == FSCK)
 			ret = FSCK_OPERATIONAL_ERROR;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 2a9c1169456c..69260a6fccd9 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1341,6 +1341,7 @@ extern int f2fs_devs_are_umounted(void);
 extern int f2fs_dev_is_writable(void);
 extern int f2fs_dev_is_umounted(char *);
 extern int f2fs_get_device_info(void);
+extern int f2fs_get_f2fs_info(void);
 extern unsigned int calc_extra_isize(void);
 extern int get_device_info(int);
 extern int f2fs_init_sparse_file(void);
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index b27785dec757..420dfdae56da 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1183,6 +1183,12 @@ int f2fs_get_device_info(void)
 	for (i = 0; i < c.ndevs; i++)
 		if (get_device_info(i))
 			return -1;
+	return 0;
+}
+
+int f2fs_get_f2fs_info(void)
+{
+	int i;
 
 	if (c.wanted_total_sectors < c.total_sectors) {
 		MSG(0, "Info: total device sectors = %"PRIu64" (in %u bytes)\n",
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 031244d5d67a..b89efe691a49 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -396,18 +396,42 @@ int main(int argc, char *argv[])
 
 	c.func = MKFS;
 
-	if (!force_overwrite && f2fs_check_overwrite()) {
-		MSG(0, "\tUse the -f option to force overwrite.\n");
-		return -1;
-	}
-
 	if (f2fs_devs_are_umounted() < 0) {
 		if (errno != EBUSY)
 			MSG(0, "\tError: Not available on mounted device!\n");
-		return -1;
+		goto err_format;
 	}
 
 	if (f2fs_get_device_info() < 0)
+		return -1;
+
+	if (f2fs_check_overwrite()) {
+		char *zero_buf = NULL;
+		int i;
+
+		if (!force_overwrite) {
+			MSG(0, "\tUse the -f option to force overwrite.\n");
+			goto err_format;
+		}
+		zero_buf = calloc(F2FS_BLKSIZE, 1);
+		if (!zero_buf) {
+			MSG(0, "\tError: Fail to allocate zero buffer.\n");
+			goto err_format;
+		}
+		/* wipe out other FS magics mostly first 4MB space */
+		for (i = 0; i < 1024; i++)
+			if (dev_fill_block(zero_buf, i))
+				break;
+		free(zero_buf);
+		if (i != 1024) {
+			MSG(0, "\tError: Fail to fill zeros till %d.\n", i);
+			goto err_format;
+		}
+		if (f2fs_fsync_device())
+			goto err_format;
+	}
+
+	if (f2fs_get_f2fs_info() < 0)
 		goto err_format;
 
 	/*
-- 
2.33.0.464.g1972c5931b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
