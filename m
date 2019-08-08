Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18E86DBB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 01:11:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvrZ3-0007z4-GX; Thu, 08 Aug 2019 23:11:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hvrZ1-0007yw-SV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 23:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l7pZF4KItZlgiop/DygvOn77BrbYuMRUyd9DhBx5nlk=; b=hwkcjetYGdWltCvu4dWLLNuw6u
 m94XwsASYx0l+K9NhVNah2joDHY1OxeqZJoy/u5rs28KCYx3+rmRqk6p6ozr4aQ9eDqlydTWMM5AZ
 yNBYHe3RZZ0LCzBN44E47FqzS4UtM7whs0tElL60S4Mvtaj5hDIhflaBOmbFnZOYlBv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l7pZF4KItZlgiop/DygvOn77BrbYuMRUyd9DhBx5nlk=; b=d
 Q0gh3UbJuYTdQS5ixYh8+1uDSMDBGwjMQxO4ulji5tyw/dUj8AEIrMCB6kLJ+g0HD1GDsmu8Dpvfy
 JE+vLzHX7OCd06xCwMliTj5lnBXFbRyfMb7E04kH9eCtpgP7F7EjoIWMYWtUaHJNW8F8ixKHn8D4S
 BQuE9nbA4lMyRgx4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvrZ1-00FMbW-8X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 23:11:19 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 402FD216C8;
 Thu,  8 Aug 2019 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565305870;
 bh=93hfEofAgmGtsgRPAUP6PpymvjwCErJFZ9dSQ90jggI=;
 h=From:To:Cc:Subject:Date:From;
 b=IoxStklHiqCt5besTN9PxA12zCH5FNW4LYTvwh3wnWH6rvCn8nODZNx5yc8Zf68Pa
 QK5hCu9tERK0I4Ken0R+bLT4z23PTiaj96bTstNTv5CigIU4BYh/1FCrOJMuTUKWhe
 e759bcpaxaORMCk4atcTh0iwK+fvhYxfTUiIKDrE=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  8 Aug 2019 16:11:08 -0700
Message-Id: <20190808231108.75599-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
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
X-Headers-End: 1hvrZ1-00FMbW-8X
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: check zeros in first 16MB for Android
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We actually don't need to issue trim on entire disk by checking first
blocks having zeros.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format_utils.c | 47 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index 8bf128c..52fedc7 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -110,13 +110,56 @@ static int trim_device(int i)
 	return 0;
 }
 
+static int f2fs_zero_blocks(int i)
+{
+#ifdef WITH_ANDROID
+	struct device_info *dev = c.devices + i;
+	int fd = dev->fd;
+	char buf[F2FS_BLKSIZE];
+	char *zero_buf;
+	int j, ret;
+	int ret2 = 0;
+
+	zero_buf = calloc(1, F2FS_BLKSIZE);
+	if (zero_buf == NULL) {
+		MSG(1, "\tError: Malloc Failed for zero buf!!!\n");
+		return -1;
+	}
+
+	/* check first 16MB blocks */
+	for (j = 0; j < 4096; j++) {
+		ret = lseek(fd, j * F2FS_BLKSIZE, SEEK_SET);
+		if (ret < 0) {
+			ret2 = -1;
+			break;
+		}
+		ret = read(fd, buf, F2FS_BLKSIZE);
+		if (ret != F2FS_BLKSIZE) {
+			ret2 = -1;
+			break;
+		}
+		if (memcmp(buf, zero_buf, F2FS_BLKSIZE)) {
+			ret2 = -1;
+			break;
+		}
+	}
+	free(zero_buf);
+	if (!ret2)
+		MSG(0, "Info: Skip discarding blocks (found all zeros\n");
+	return ret2;
+#else
+	return -1;
+#endif
+}
+
 int f2fs_trim_devices(void)
 {
 	int i;
 
-	for (i = 0; i < c.ndevs; i++)
-		if (trim_device(i))
+	for (i = 0; i < c.ndevs; i++) {
+		if (f2fs_zero_blocks(i) && trim_device(i))
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
