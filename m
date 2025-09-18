Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D99BB82E8F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 06:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2SHTC32rIKTvnqp6g4/UM7g3V2a7hXVsrq/sVHTb8s=; b=CRUoake7YctjJJhBlDZS2oHNao
	u00mrvstuAKKn3F4oAtQb75nBrmg/yspO84UiTXFU2D8NB0VtV8TrbTiPQGyaFECtAGSGmVLOeFsj
	z0HgtKlXWyORw3TKofFhOh240K85Ao9w8CQuEebnonE4jHVMORCWbco59X+3+cMv/7bo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz6eD-0002WM-Nt;
	Thu, 18 Sep 2025 04:53:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uz6eC-0002WB-8U
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=meWO/FGLn+0/EUWmSbS4PtsM+S5TFEi9MhkNzdsFkro=; b=QHJQTUZYUbl478JHOw1U7SUEdh
 OsDsZl+Ar+jP7aI+VpW8DDtUY2ADP0nsPsn3MBnPzuW2UOvZXyS93XWDFtNaEpeG9H58xTrMrOPBn
 tjP4LW5NH2a+1aGvzf1VRHrI4HBPOlTVu+4GFGqZJtwIwUk9bdR7QxUDyEbOrCOMQtJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=meWO/FGLn+0/EUWmSbS4PtsM+S5TFEi9MhkNzdsFkro=; b=dwWyd/VJXkefK9mD+aEkCjpE/c
 /dgURZGX95j0FDFydRBUhAd9CsabjesqaNY+k339x59f7w9NSBg7aiczoXByCSIaz72hvFgmoSLMB
 01TncA7wG0NoIpKqieYVjL37qrHsvYNebUAvCfcqkxTr77nFcu+4sFYaSh02CPFqh0Bo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz6eB-0006b9-Qa for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 69C5344259
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Sep 2025 04:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC8FC4CEE7;
 Thu, 18 Sep 2025 04:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758171201;
 bh=lSGrSPJh2oyD+sblAvF2Wond0ISezw1K3umioUdaYi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EtjUVpY4mZM4Sx+0QuGQwEmls5ljihItn7aSYxhXO18qzx1sAm3Rm7xIBf1PeszA+
 1rM6C1c6nraXUR2UGgGz/560ZPQ9lyogWmzi7IvzPX5TMxWoeEXM+6JF/7CZO8WVVC
 V2Ayu7fFk+CxfH+X+if/hF+DSbSpKEH+wBK1UPPwKajsRHaxX7MRWxPiMdR7/2LA5L
 rhL5DyqCLesk+jh7iOoBgceo/omCeasPft4Gj5NvgbgPvGZKbcCJgxdlkDAcTfWBxM
 Ub3ukNS+ZVYSnRWghh3+XQYJYRNWeKlK+YG/y/fm2RpyLj+iW/LWfI3Dmd2hs855I4
 KRfiaLPzt47+w==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 18 Sep 2025 04:53:15 +0000
Message-ID: <20250918045316.714102-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
In-Reply-To: <20250918045316.714102-1-jaegeuk@kernel.org>
References: <20250918045316.714102-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It only measures the read performance. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c | 13 ++++++++++++- 1
 file changed, 12 insertions(+),
 1 deletion(-) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 2d64eda81706..2ed9cb4184b8 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -24,6 +24,8 @@ #include <linux/fs. [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz6eB-0006b9-Qa
Subject: [f2fs-dev] [PATCH 2/3] f2fs_io: add dontcache to measure
 RWF_DONTCACHE speed
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It only measures the read performance.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 2d64eda81706..2ed9cb4184b8 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -24,6 +24,8 @@
 #include <linux/fs.h>
 #include <signal.h>
 #include <stdarg.h>
+#include <sys/uio.h>
+#include <stdarg.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -929,6 +931,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "Read data in file_path and print nbytes\n"		\
 "IO can be\n"						\
 "  buffered : buffered IO\n"				\
+"  dontcache: buffered IO + dontcache\n"		\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
 "  mlock    : mmap + mlock\n"				\
@@ -948,6 +951,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	int flags = 0;
 	int do_mmap = 0;
 	int do_mlock = 0;
+	int do_dontcache = 0;
 	int fd, advice;
 
 	if (argc != 8) {
@@ -972,6 +976,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		do_mmap = 1;
 	else if (!strcmp(argv[4], "mlock"))
 		do_mlock = 1;
+	else if (!strcmp(argv[4], "dontcache"))
+		do_dontcache = 1;
 	else if (strcmp(argv[4], "buffered"))
 		die("Wrong IO type");
 
@@ -1016,7 +1022,12 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		read_cnt = count * buf_size;
 	} else {
 		for (i = 0; i < count; i++) {
-			ret = pread(fd, buf, buf_size, offset + buf_size * i);
+			if (!do_dontcache) {
+				ret = pread(fd, buf, buf_size, offset + buf_size * i);
+			} else {
+				struct iovec iov = { .iov_base = buf, .iov_len = buf_size };
+				ret = preadv2(fd, &iov, 1, offset + buf_size * i, RWF_DONTCACHE);
+			}
 			if (ret != buf_size) {
 				printf("pread expected: %"PRIu64", readed: %"PRIu64"\n",
 						buf_size, ret);
-- 
2.51.0.470.ga7dc726c21-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
