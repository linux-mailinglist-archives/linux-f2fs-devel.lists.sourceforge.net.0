Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488653348A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 May 2022 03:05:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntfSb-0003fb-0L; Wed, 25 May 2022 01:05:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ntfSZ-0003fU-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 01:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5BVeasgUXthHTJnNGN8mmanEBqEP3zjuFfmra+TjVeA=; b=gcH9fsLDhgxO2cO63g0/knhIQF
 JNARk1diAUcAwNsO/ZsPIedyF+x7zBkJ3kul4sLPiBipqI6Nm60fLNlzIdyssmz/z6KsslfF9ZPZl
 O94zd2zEckbBDg6RlYQTMGciw/UumPSG0nyHT30nsLcW//H0mlbPb6SvjYWG5mjqx38A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5BVeasgUXthHTJnNGN8mmanEBqEP3zjuFfmra+TjVeA=; b=d
 bK7KAfLTpTq72wL8kBHb/sbjoXU+6wLMJKICy8r4DILqmS4gnxdsnLD5uMQMArG1EGhxONEw9H/Vz
 p/V2TUOl9Zcr3h7JQUZAUauMKDYsO027DEQ6OkiptA4fqGDpkVeZOMmA/V38Sj0Bfh046NocYQ8Y7
 4xOZyJtpiddsiXNY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntfSV-007Syt-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 01:05:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CC3B60B2E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 May 2022 01:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0361C34100;
 Wed, 25 May 2022 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653440696;
 bh=mBnspLFnsIVA8nrDePeG0RYuWyfZHv/PGwO+apyKj9M=;
 h=From:To:Cc:Subject:Date:From;
 b=O6OXTePQbfrUNkxhAUByOKhE8PY/CbgadLpSfMx285OwCk8Y97A7X5w2zuUAG2KGV
 MMuGb0K1b0IhmfRvmVXXmJ9ARlUtW31zqurNv2iUt5ZPNRAi59f/RbjBCX92ZgKHTH
 N8QlCOtqGY/ySj1X6skAGbYZKyCFj3PHZhATtTviCky7MyYgAnfuLbacAW1n9HhUkS
 6cr9oR5qjDRI1I8NWCkUwnwWh23AumC1QCNFvRVvQHUtRyizeV122Up2gVJRt+3kta
 N9CvAIw22xdhObzJdN4JqwyAWhSJbUm768v8wUDObpDOHoBsKMMbt4ql6FYjVgVUU7
 R7NVpWxM8Oj8Q==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 24 May 2022 18:04:54 -0700
Message-Id: <20220525010454.2661808-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  external/f2fs-tools/mkfs/f2fs_format_utils.c:51:28: error:
 unused parameter 'i' [-Werror,-Wunused-parameter] Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- mkfs/f2fs_format_utils.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntfSV-007Syt-HJ
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: split unused parameter
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

external/f2fs-tools/mkfs/f2fs_format_utils.c:51:28: error: unused parameter 'i' [-Werror,-Wunused-parameter]

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format_utils.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index e3c58936e968..fdd0235d81aa 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -48,10 +48,10 @@
 #endif
 #endif
 
-static int trim_device(int i)
-{
 #if defined(FALLOC_FL_PUNCH_HOLE) || defined(BLKDISCARD) || \
 	defined(BLKSECDISCARD)
+static int trim_device(int i)
+{
 	unsigned long long range[2];
 	struct stat *stat_buf;
 	struct device_info *dev = c.devices + i;
@@ -110,13 +110,18 @@ static int trim_device(int i)
 	}
 #endif
 	free(stat_buf);
-#endif
 	return 0;
 }
+#else
+static int trim_device(int UNUSED(i))
+{
+	return 0;
+}
+#endif
 
+#ifdef WITH_ANDROID
 static bool is_wiped_device(int i)
 {
-#ifdef WITH_ANDROID
 	struct device_info *dev = c.devices + i;
 	int fd = dev->fd;
 	char *buf, *zero_buf;
@@ -157,9 +162,11 @@ static bool is_wiped_device(int i)
 		MSG(0, "Info: Found all zeros in first %d blocks\n", nblocks);
 	return wiped;
 #else
+static bool is_wiped_device(int UNUSED(i))
+{
 	return false;
-#endif
 }
+#endif
 
 int f2fs_trim_devices(void)
 {
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
