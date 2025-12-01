Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996BC99136
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 21:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0weefrKvnkHH3mE+02E5/U2cKIaSPwSaH53ne2onCN8=; b=lpF0/ZhY/JfqDC2qLqpmlDrIo6
	E6X4/6dTBgYZAtXAnxGSwdtdkY9RodVFVdugr+Y4fVrE3P5I5Lctd42pez6CoNTqtZ7oNn32DlgSA
	6I/UKF2060s+J5ZZgFbo0rrdpCbJ6k5b7PWWiAuxokRMUsT2q+sicpebKLyCyB2ngThU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQAn5-0003Xg-Q2;
	Mon, 01 Dec 2025 20:46:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQAn4-0003XZ-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/iQjueMN9qESTLcgOlGj1U+11kH+NiFUDveToGx3euY=; b=SuvYpZDuhxkTga4xXMo6GL955Z
 8Xo1MqjhtMMA5Ab8Rk3ljg+Y5/g5r8Y3xJsEIBKslaBgi9vTd92ohhvB1l2S5tQeoCS8kDWf5Z2Z1
 UbAMrHcKbtw3EfVw9X1suTNM920nXLqZMszJscxVX+4O35xfqLNPu9oFC4ys2RK0ioXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/iQjueMN9qESTLcgOlGj1U+11kH+NiFUDveToGx3euY=; b=VGkIIyLzigS3ZoV3Rarv+3fQvl
 FzcnH3BZ6Drl6rayznkAOjAPSNXlwV8ie9WeWQr0F7UIgEVQFwEsGxLvQmNOKr9s17Oz8xhUY5uEb
 gVIVpklhkDdWhP9KfuaW2s1oC7vkfY46WXDCtyPqq1ntePiVMqScPLS37JP2Alo5V29Q=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQAn3-0000ts-LS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61FA543882
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 20:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31305C4CEF1;
 Mon,  1 Dec 2025 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764621988;
 bh=NtPvCoJwQGI5U950i9CbyjzSBw9fbuw2y+IdCXXNcAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MHdg12EWPC+aUrRy4H/8sRqxQPBSvd3+HCuIqEmjxzOtrqGmOiGzIfR1VLjCYH7Wz
 h2OwqRlmIeMkPKgRN62dLCk/fwgtRRL6wfF+2d78t9oz+9Matjm9fpkT8MCCLSilFS
 g9BqFXGcuUEN9xPhQCW3OV6m5O6aFmNrx9/QFB5CtqPWY2QO/Reyhuc8sWt8SEYDxN
 GY3EA7yJFgnzT9dKKV8AJQVzOE9IcIkUXPKLNJqjbQRli0vlLlIOnmOD2TQsM8dZLM
 vgs38RDyg4aRiUPTYo3+s9JYmrnzT14xSZ4OoIePVfAoxFBzluKcdVUqUCckDpGgcn
 BKRyMj4e6y6BA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  1 Dec 2025 20:46:20 +0000
Message-ID: <20251201204620.905318-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201204620.905318-1-jaegeuk@kernel.org>
References: <20251201204620.905318-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fadvise is better to describe the read method. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c | 12 ++++++------
 1 file changed, 6 insertions(+),
 6 deletions(-) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index d5e103f7b833..35c367bd67e7 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -939,7 +939,7 @@ static void do_wr [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQAn3-0000ts-LS
Subject: [f2fs-dev] [PATCH 3/3] f2fs_io: rename mlock to fadvise
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

fadvise is better to describe the read method.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index d5e103f7b833..35c367bd67e7 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -939,7 +939,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
 "  madvise  : mmap + mlock2 + madvise\n"		\
-"  mlock    : mmap + mlock\n"				\
+"  fadvise  : mmap + fadvise + mlock\n"			\
 "advice can be\n"					\
 " 1 : set sequential|willneed\n"			\
 " 0 : none\n"						\
@@ -956,7 +956,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	u64 mlock_time_start = 0, mlock_time_end = 0;
 	int flags = 0;
 	int do_mmap = 0;
-	int do_mlock = 0;
+	int do_fadvise = 0;
 	int do_madvise = 0;
 	int do_dontcache = 0;
 	int fd, advice;
@@ -983,8 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		do_mmap = 1;
 	else if (!strcmp(argv[4], "madvise"))
 		do_madvise = 1;
-	else if (!strcmp(argv[4], "mlock"))
-		do_mlock = 1;
+	else if (!strcmp(argv[4], "fadvise"))
+		do_fadvise = 1;
 	else if (!strcmp(argv[4], "dontcache"))
 #ifdef HAVE_PREADV2
 		do_dontcache = 1;
@@ -1045,7 +1045,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
-	} else if (do_mlock) {
+	} else if (do_fadvise) {
 		data = mmap(NULL, count * buf_size, PROT_READ,
 				MAP_SHARED, fd, offset);
 		if (data == MAP_FAILED)
@@ -1107,7 +1107,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	}
 	if (do_mmap) {
 		munmap(data, count * buf_size);
-	} else if (do_mlock || do_madvise) {
+	} else if (do_fadvise || do_madvise) {
 		munlock(data, count * buf_size);
 		munmap(data, count * buf_size);
 	}
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
