Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E1C2A34C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 07:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T1MP9qu2b4ynJAw/g4T7cAbtf+PSXNj5niX87iN9nI0=; b=aU72ltDt7QzRA/gaSAo5UsMovH
	t0G7zklGbZ1DmmvNq7tVzNn3ZvMJXFkbuaIbqp6feTHrlL8r9UsEbh4WZE+YEVuNsquQ06l4z2TnX
	hdtJZxaew+63mKfr4UQfRDxhVdYRwtxBwqXkxpyQcuatrw8RyFi++/hbmyVyL9eCHRWk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFoEF-00067n-Hd;
	Mon, 03 Nov 2025 06:39:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFoEE-00067h-Hu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 06:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PGaKq3eJu9ULEQrpBnyzOY3OHUm/rIQb6aEdASqd8n0=; b=IqvLvfqdH23578OEE0wiDF24in
 qQcpRT1re1zAaTOoBp7WmB9ELrKIb1bCwG1AuR8jPQaYrEicEPUaPW8XJmD3KM6SlsueqRn6aSod8
 BTt6Wk+tMWQcoyMXyjHGDhoHju6xRyBR8AIj3FRE8K3+W+Xi+CWDWPFnZF+ZYI32uOvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PGaKq3eJu9ULEQrpBnyzOY3OHUm/rIQb6aEdASqd8n0=; b=K
 qton/C/nw8JxbkA6ouYEhDFpa3OaflBqZ1p7SzjBP9kHjV/Zpb8KsK9ug1OwmkyOj6ywZeFYRffeK
 frGNGY+UJjYKB5gtbFOAlzmJ6969Cw9QsflFtwBPOV/cTr3LNALLtGAYlwIs4gZzJxTosN6wdfQIM
 hzcRunEZdTM6gpgg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFoEE-0000VB-5o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 06:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BEAF64485D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Nov 2025 06:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704E1C4CEE7;
 Mon,  3 Nov 2025 06:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762151980;
 bh=VBij2mITexCO1TcPruw5+kHPYC8QobFazbd9hyFugx8=;
 h=From:To:Cc:Subject:Date:From;
 b=IQfMPIxsWV3tv9AA88RIlz8NpXd/kdLLqy9gjUbqit3z55kKoM8oFksAgcdQOGuWm
 RL2RnHH22yaKvIWy0CXDvFrgBAC8D3GeLBk5hJu/JG9rMMFQHAECDKgoBhe9gDQzXY
 0xqSG6DatkPz+7RrW91UO9S4nItYhCbk7a/rn81/W+2uTdwqrr/dlT5lyfDyxp3fSP
 Z0swz5eBgoG6Rx4IY1iz6o6CFgkynj2iX89FAxp0K5y/KREu1VQez6sVAopiqM/3w9
 +0kLOBkdgaQ+QbYpvjWZDBb3IzCYNegK7UzTy8j2dgj+wI2c1brPrEcCwSRB8ZeQ6s
 Q6xGbAyuzzofQ==
To: jaegeuk@kernel.org
Date: Mon,  3 Nov 2025 14:39:31 +0800
Message-ID: <20251103063931.2663358-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise, f2fs_io randread will fail due to i_size of block
 device inode is zero. - f2fs_io randread 1 1000 buffered 1 /dev/vdc fadvise
 RANDOM|WILLNEED to a file: /dev/vdc File is too small to random read 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFoEE-0000VB-5o
Subject: [f2fs-dev] [PATCH] f2fs_io: ranndread: support block device
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, f2fs_io randread will fail due to i_size of block device
inode is zero.

- f2fs_io randread 1 1000 buffered 1 /dev/vdc
fadvise RANDOM|WILLNEED to a file: /dev/vdc
File is too small to random read

Signed-off-by: Chao Yu <chao@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 1f26c7c..231da47 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1225,6 +1225,7 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	int fd, advice;
 	time_t t;
 	struct stat stbuf;
+	u64 size;
 
 	if (argc != 6) {
 		fputs("Excess arguments\n\n", stderr);
@@ -1261,7 +1262,17 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	if (fstat(fd, &stbuf) != 0)
 		die_errno("fstat of source file failed");
 
-	aligned_size = (u64)stbuf.st_size & ~((u64)(F2FS_DEFAULT_BLKSIZE - 1));
+	if (S_ISBLK(stbuf.st_mode)) {
+		u64 devsize;
+
+		if (ioctl(fd, BLKGETSIZE64, &devsize) < 0)
+			die_errno("BLKGETSIZE64 failed");
+		size = devsize;
+	} else {
+		size = (u64)stbuf.st_size;
+	}
+
+	aligned_size = (u64)size & ~((u64)(F2FS_DEFAULT_BLKSIZE - 1));
 	if (aligned_size < buf_size)
 		die("File is too small to random read");
 	end_idx = (u64)(aligned_size - buf_size) / (u64)F2FS_DEFAULT_BLKSIZE + 1;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
