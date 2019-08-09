Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23187DCA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 17:13:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw6Zj-0007s8-VL; Fri, 09 Aug 2019 15:13:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hw6Zi-0007s1-AC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9DbzHs9Ny/T7IUjrl96SfxT3Tu0GX6ZdeFE3KJ90gn8=; b=T2jsjJt7fB+YUZ/DeI83jWQOlI
 9pFqX7TzM34ButQqT+4Za3cIhH8mTaVEprfZYQYld52uF8mZzljtJdFVIGB6ekKeS+l/ZEHd5QB/t
 UB+3iwabK3V6wB/TH94GrrW4u+sIxqS424kda9kqN27Ub3nw6lqeXAwFPFWxJ3dRltCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9DbzHs9Ny/T7IUjrl96SfxT3Tu0GX6ZdeFE3KJ90gn8=; b=gFN5PQdn3DEg7P/RgNkWx8lB/N
 tc3uxLVvQYDYru42jhbNSdbsIcTmVjIOwgnTMLUb/4w5F7jPp2WWDIZ9gTP6NXWdzOlqDNlxgL0iA
 Ocaz13tm0H7SVepJ+azNgaQb9HiZjPJ6LBIPjCPCitgJ28GfCu6uVS6CyXkP53Kp83Zg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw6Zf-00HSzj-GA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:13:02 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1AA52171F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  9 Aug 2019 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565363573;
 bh=E/hs3Xh8pCfN74N8ZrCl1G/4ANk//iUiaqFOIoSLOog=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=BvnXWqCAVmZlon/yBS6BNpXOf7mzJKD/x/yN2V1+9/DRmeUbSSehXc9DKjoRGU8J9
 YGhNc9ijjtsHTWjxGR28zui5jlOl/z1tmZC2FEWVeIdKHNThzVDcTHG5R62mlhXY7P
 KpDsJ+jDShA47QOrHIPDVKkpbYXRywvF2+kR2p3U=
Date: Fri, 9 Aug 2019 08:12:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190808231108.75599-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808231108.75599-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hw6Zf-00HSzj-GA
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: check zeros in first 16MB for
 Android
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

We actually don't need to issue trim on entire disk by checking first
blocks having zeros.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2 from v1:
 - clean up

 mkfs/f2fs_format_utils.c | 53 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index 8bf128c..f2d55ad 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -25,6 +25,7 @@
 #include <stdio.h>
 #include <unistd.h>
 #include <stdlib.h>
+#include <stdbool.h>
 #ifndef ANDROID_WINDOWS_HOST
 #include <sys/ioctl.h>
 #endif
@@ -110,13 +111,61 @@ static int trim_device(int i)
 	return 0;
 }
 
+static bool is_wiped_device(int i)
+{
+#ifdef WITH_ANDROID
+	struct device_info *dev = c.devices + i;
+	int fd = dev->fd;
+	char *buf, *zero_buf;
+	bool wiped = true;
+	int nblocks = 4096;	/* 16MB size */
+	int j;
+
+	buf = malloc(F2FS_BLKSIZE);
+	if (buf == NULL) {
+		MSG(1, "\tError: Malloc Failed for buf!!!\n");
+		return false;
+	}
+	zero_buf = calloc(1, F2FS_BLKSIZE);
+	if (zero_buf == NULL) {
+		MSG(1, "\tError: Calloc Failed for zero buf!!!\n");
+		free(buf);
+		return false;
+	}
+
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		free(zero_buf);
+		free(buf);
+		return false;
+	}
+
+	/* check first n blocks */
+	for (j = 0; j < nblocks; j++) {
+		if (read(fd, buf, F2FS_BLKSIZE) != F2FS_BLKSIZE ||
+				memcmp(buf, zero_buf, F2FS_BLKSIZE)) {
+			wiped = false;
+			break;
+		}
+	}
+	free(zero_buf);
+	free(buf);
+
+	if (wiped)
+		MSG(0, "Info: Found all zeros in first %d blocks\n", nblocks);
+	return wiped;
+#else
+	return false;
+#endif
+}
+
 int f2fs_trim_devices(void)
 {
 	int i;
 
-	for (i = 0; i < c.ndevs; i++)
-		if (trim_device(i))
+	for (i = 0; i < c.ndevs; i++) {
+		if (!is_wiped_device(i) && trim_device(i))
 			return -1;
+	}
 	c.trimmed = 1;
 	return 0;
 }
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
