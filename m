Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D1CB77DE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Dec 2025 01:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i/NtszemMXB7aRQHvgELWH8zwa29R/pFm7G0S5AVCtA=; b=gQZsrjRjeDVJIgMRPOWnSlbqJV
	QD+qFm8pQcGv9oHM2TfLXO8uOccAJGu4colk8hKBAWax/vickMGjL2hGfestMf1iPoyNf1WyJKxWF
	eN1tlDfrGD0ra4KYkaEQZIeiFab3clBjp14nh7hNz+TRw00UbgRoqsZVB+THkjL0bYUQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vTrRv-0005Jt-RI;
	Fri, 12 Dec 2025 00:55:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vTrRu-0005Jn-Al
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 00:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bgx5kp/NKVK6I836JsTQhorZ+u+O9t10sWUDr+qZzDw=; b=iA3QDxwOHbdyAsg1pZCYGy3h68
 3SJR9XI3dYvlaotRkG8TM32iVUn10Kmu9XaXw0uD+BoOxN110VdNlrYXL2Xeq8yBBmjEGbJg63x2P
 9hjYfo5X5JAlAwyImXFdtYFdWuCKzscIdpslDuZtD2yh6XpS2KdWa14J82/E6brohFz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Bgx5kp/NKVK6I836JsTQhorZ+u+O9t10sWUDr+qZzDw=; b=c
 +wqJKPC2Ca/vUR/nunA9cK0bUPGJW8Qj0VnTRMOxLgSMPA2RAQEDpPpq+RlC9n8DDzVLCPlFJS5tl
 wlfZJMieLuw903OuFxDejTtk0I/klfWGY4OpFAz30N+Y1o4JgS6TOx7kfb+OCEgccBuncXxWQG/QJ
 gZ/qmpvy7oV2w4WI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vTrRt-0006j6-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 00:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 83CD940B8D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Dec 2025 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52957C4CEF7;
 Fri, 12 Dec 2025 00:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765500947;
 bh=5pHecM0cJVMEMo3qWBvT5e0n+/2fDbPOvKdfFkbu0ww=;
 h=From:To:Cc:Subject:Date:From;
 b=hy8qaVoyfK5iC/bUifGFSFFVhrve0ynaSRHvcwqcONvDlfKQeyu2g5K4dFVrGz1Fa
 l971IdPaKf6s7QGauonwyjX/OqLDDSV3c8gRaZXu5LAqixgp8YyX0YfN698bhiChZ7
 xw0yyKsFdzmqT950XLkMc6UiekMPJaEP3q6fT2cjSxl26qA4Wgb6CAjcjC+DCM57Um
 gj9tkaOitNZMCVPEva/3P6C3YKg9ZuUWeSBZUeWvhZ3dQ5TzxoV1HZzCz8PC5B6ibD
 sRMe4zygG4ayZrWSmD895M5/TNA53GrmoRQBdDKGhQQ5eFUMQWw8TsZECphlYd5J4S
 ayA+wU0idYmxw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Dec 2025 00:55:44 +0000
Message-ID: <20251212005545.3912333-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++ 1 file changed,
 16 insertions(+) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 4429e0b0459c..08f3c9b79cdf 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -938,6 +938,7 @@ static void do_wr [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vTrRt-0006j6-S4
Subject: [f2fs-dev] [PATCH 1/2] f2fs_io: add mlock() option in the read test
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 4429e0b0459c..08f3c9b79cdf 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "  dontcache: buffered IO + dontcache\n"		\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
+"  mlock    : mmap + mlock\n"				\
 "  madvise  : mmap + mlock2 + madvise\n"		\
 "  fadvise  : mmap + fadvise + mlock\n"			\
 "advice can be\n"					\
@@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	u64 mlock_time_start = 0, mlock_time_end = 0;
 	int flags = 0;
 	int do_mmap = 0;
+	int do_mlock = 0;
 	int do_fadvise = 0;
 	int do_madvise = 0;
 	int do_dontcache = 0;
@@ -981,6 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		flags |= O_DIRECT;
 	else if (!strcmp(argv[4], "mmap"))
 		do_mmap = 1;
+	else if (!strcmp(argv[4], "mlock"))
+		do_mlock = 1;
 	else if (!strcmp(argv[4], "madvise"))
 		do_madvise = 1;
 	else if (!strcmp(argv[4], "fadvise"))
@@ -1027,6 +1031,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		mlock_time_end = get_current_us();
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
+	} else if (do_mlock) {
+		data = mmap(NULL, count * buf_size, PROT_READ,
+				MAP_SHARED, fd, offset);
+		if (data == MAP_FAILED)
+			die("Mmap failed");
+
+		io_time_start = get_current_us();
+		if (mlock(data, count * buf_size))
+			die_errno("mlock failed");
+		io_time_end = get_current_us();
+		read_cnt = count * buf_size;
+		memcpy(print_buf, data, print_bytes);
 	} else if (do_madvise) {
 		data = mmap(NULL, count * buf_size, PROT_READ,
 				MAP_SHARED, fd, offset);
-- 
2.52.0.305.g3fc767764a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
