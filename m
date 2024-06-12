Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0881904C8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 09:18:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHIFd-0002XI-FC;
	Wed, 12 Jun 2024 07:18:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Xiuhong.Wang@unisoc.com>) id 1sHIFb-0002XA-4a
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 07:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vKJMoHWpQC2UYWQYztC5rLOVgDzSM4YC+TJpec0VqC4=; b=RoBJtvF+rH2yqB5RHLglq1Cbho
 YGZleaBj9onaC0Bycx7TFg0HkJqOzWA9Sy8HrkisBf5YVJmc1mf2GWI8NtUSHuSOrCcAa4zI/2A+B
 1ZuOjTk8Lo1NqtdDbjCdimr5tv4vB8ZhrlvolFWOyDSkZ6sRshbJX7EnMd1OM72SmYfo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vKJMoHWpQC2UYWQYztC5rLOVgDzSM4YC+TJpec0VqC4=; b=T
 P2jiolqdSsQ326kE1WEUFBP2C4WbH3v05uHPItFQ9rhpM9CgBGiGB1u7mZsAEwS+Jr0YXjE2XTCEZ
 koiO2sRQ9am03trjDxns5xK+yKQG2sTGbiTt4ds8+Yy4GYqQwBRbB8jkVcCByJC2EIkMLi2V22OPb
 h8uTqg8JKrLnueqM=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHIFb-00072K-BE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 07:18:32 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 45C7HtJC015511;
 Wed, 12 Jun 2024 15:17:55 +0800 (+08)
 (envelope-from Xiuhong.Wang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4VzcGF48Lcz2QkWK3;
 Wed, 12 Jun 2024 15:13:41 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 12 Jun 2024 15:17:53 +0800
From: Xiuhong Wang <xiuhong.wang@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Wed, 12 Jun 2024 15:17:49 +0800
Message-ID: <20240612071749.348843-1-xiuhong.wang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 45C7HtJC015511
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If input exceeds int range, data will be truncated, such as
 lseek: unisoc:/data # ./f2fs_io lseek set 3221225000 file returned
 offset=2147483647
 The offset is truncated. After patch: unisoc:/data # ./f2fs_io lseek set
 3221225000 file returned offset=3221225000 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [222.66.158.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sHIFb-00072K-BE
Subject: [f2fs-dev] [PATCH 1/1] f2fs-tools: use atoll replace atoi to avoid
 data truncate
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If input exceeds int range, data will be truncated, such as lseek:
unisoc:/data # ./f2fs_io lseek set 3221225000 file
returned offset=2147483647
The offset is truncated.

After patch:
unisoc:/data # ./f2fs_io lseek set 3221225000 file
returned offset=3221225000

Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 tools/f2fs_io/f2fs_io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index a7b593a..8c9d433 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -539,7 +539,7 @@ static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
 	if (!strcmp(argv[0], "1"))
 		mode |= FALLOC_FL_KEEP_SIZE;
 
-	offset = atoi(argv[1]);
+	offset = atoll(argv[1]);
 	length = atoll(argv[2]);
 
 	fd = xopen(argv[3], O_RDWR, 0);
@@ -957,7 +957,7 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define fiemap_desc "get block address in file"
 #define fiemap_help					\
-"f2fs_io fiemap [offset in 4kb] [count] [file_path]\n\n"\
+"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
 
 #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
@@ -1546,9 +1546,9 @@ static void do_move_range(int argc, char **argv, const struct cmd_desc *cmd)
 
 	fd = xopen(argv[1], O_RDWR, 0);
 	range.dst_fd = xopen(argv[2], O_RDWR | O_CREAT, 0644);
-	range.pos_in = atoi(argv[3]);
-	range.pos_out = atoi(argv[4]);
-	range.len = atoi(argv[5]);
+	range.pos_in = atoll(argv[3]);
+	range.pos_out = atoll(argv[4]);
+	range.len = atoll(argv[5]);
 
 	ret = ioctl(fd, F2FS_IOC_MOVE_RANGE, &range);
 	if (ret < 0)
@@ -1726,7 +1726,7 @@ static void do_lseek(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
-	offset = atoi(argv[2]);
+	offset = atoll(argv[2]);
 
 	if (!strcmp(argv[1], "set"))
 		whence = SEEK_SET;
@@ -1746,7 +1746,7 @@ static void do_lseek(int argc, char **argv, const struct cmd_desc *cmd)
 	ret = lseek(fd, offset, whence);
 	if (ret < 0)
 		die_errno("lseek failed");
-	printf("returned offset=%ld\n", ret);
+	printf("returned offset=%lld\n", (long long)ret);
 	exit(0);
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
