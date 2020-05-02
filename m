Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE561C21F2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 May 2020 02:29:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUg2B-0004sW-QA; Sat, 02 May 2020 00:29:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jUg29-0004s2-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 May 2020 00:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4SoUT0EOljGv6LXB0xahdtBQA/v5ofn8vkTTp+FxvFI=; b=OKiZTqRfnGgrGsjrng8Ol2Lsrm
 I0iaj9G/AOVje9JjkeyOBYwFBKMxCR51qU/y2/upFxlcUm7jMvUM0z3gg1IPyUMbtAsQCryeLYybs
 LaClqgY5kkjb6rSn4YJQvbcKJ/LmSMYgKOYwlAATQHBFgatEDxd9xKrY9X10IzrhU6L0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4SoUT0EOljGv6LXB0xahdtBQA/v5ofn8vkTTp+FxvFI=; b=MaEzqmFoZI1pboeF0kMckErnBl
 QxwklfkGNcumtVjIwpAeYCZKSuGVexx27QD5G79GLZd+LyMPPVLWIP2DStBKkaka/5m5Te3Y+RQPc
 2Z2rflEYeNRW/n6XVV11R+/IzjtfQi7SJX65A/e+WZGPX4ruAsNdQfH3LXvuAyRdzCtY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jUg24-0050K7-88
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 May 2020 00:29:33 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9AFD5216FD;
 Sat,  2 May 2020 00:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588379362;
 bh=Q5aH8h0Esjw2t301AgWq52XJnwBLZlC9EWl4Rdil0ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u8QZWFyHtQT+Pl3es3qpezocsQhxgdSPqsNDMeN/Zxoh7zBelt/36ZZz0geKHNcig
 Jh+s/s+3kHP/No6pqsA5Tc/FXgAUAndsDDGeBrSZAPk26V4VpwjKK3lpXzMs7ZVfRe
 Mzd6AsNjdpfj3WXgiMTzhhzISiWDpwCTNxSA2DEg=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 May 2020 17:29:20 -0700
Message-Id: <20200502002920.76569-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200502002920.76569-1-jaegeuk@kernel.org>
References: <20200502002920.76569-1-jaegeuk@kernel.org>
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
X-Headers-End: 1jUg24-0050K7-88
Subject: [f2fs-dev] [PATCH 3/3] f2fs_io: show more flags
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 28 ++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 12 ++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 9be99f0..d1889ff 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -186,6 +186,10 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 "f2fs_io getflags [file]\n\n"					\
 "get a flag given the file\n"					\
 "flag can show \n"						\
+"  encryption\n"						\
+"  nocow(pinned)\n"						\
+"  inline_data\n"						\
+"  verity\n"							\
 "  casefold\n"							\
 "  compression\n"						\
 "  nocompression\n"
@@ -222,6 +226,30 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("nocompression");
 		exist = 1;
 	}
+	if (flag & FS_ENCRYPT_FL) {
+		if (exist)
+			printf(",");
+		printf("encrypt");
+		exist = 1;
+	}
+	if (flag & FS_VERITY_FL) {
+		if (exist)
+			printf(",");
+		printf("verity");
+		exist = 1;
+	}
+	if (flag & FS_INLINE_DATA_FL) {
+		if (exist)
+			printf(",");
+		printf("inline_data");
+		exist = 1;
+	}
+	if (flag & FS_NOCOW_FL) {
+		if (exist)
+			printf(",");
+		printf("nocow(pinned)");
+		exist = 1;
+	}
 	if (!exist)
 		printf("none");
 	printf("\n");
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index c6ea7ff..2c828bc 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -110,6 +110,18 @@ typedef u32	__be32;
 #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
 #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
 
+#ifndef FS_ENCRYPT_FL
+#define FS_ENCRYPT_FL			0x00000800 /* Encrypted file */
+#endif
+#ifndef FS_VERITY_FL
+#define FS_VERITY_FL			0x00100000 /* Verity protected inode */
+#endif
+#ifndef FS_INLINE_DATA_FL
+#define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */
+#endif
+#ifndef FS_NOCOW_FL
+#define FS_NOCOW_FL			0x00800000 /* Do not cow file */
+#endif
 #ifndef FS_NOCOMP_FL
 #define FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #endif
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
