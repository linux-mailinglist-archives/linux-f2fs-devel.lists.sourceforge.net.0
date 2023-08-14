Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3C77C1E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 22:58:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVede-0002No-J2;
	Mon, 14 Aug 2023 20:58:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qVedd-0002Ni-4d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ts42IGvPEw7wOKe/0FPh7PJQp+fY03EEJctoG8jxa0A=; b=akSk+VWUC3ylus/CimQ5Q/XOFf
 IuM3t4FHx54OW2mW6cSAFXs+4iKgOsbvlPJYPHL2E+vgRGX3fLiOtIa7+ds70T4AcQT0AVwKE58kY
 +Fh3h4iMg9vgynVZq7EpgtPqyPxok9AgAnRZrfc18hsS/I9S1pZL+g9hTYaC5cNNVbcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ts42IGvPEw7wOKe/0FPh7PJQp+fY03EEJctoG8jxa0A=; b=B
 Aj9ForPKAclyFFVw1wOfJTrNd8Q3RzDpbCrvGD6Tq1e9Ae1EuIhSCjNyajXSVtwvZn660yFWROAKz
 dZeyscjGAIlSqDRpdAktiYSXQh2RL1DBxvxZGhoOM69OHtPudpYmAcvdtzG3hNp0pCaT5B+BQ7642
 M1At3H03QWOQcG6E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVedc-005o72-8y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:58:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AA3561085
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Aug 2023 20:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10C7C433C8;
 Mon, 14 Aug 2023 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692046682;
 bh=CHpL0bgZHsiC9nPGHHwnzfW0EFge2wCHNew9Q1TBAzw=;
 h=From:To:Cc:Subject:Date:From;
 b=rdipyjT3iJHZEM9J3QOgmJs7wchnI990qX5lgRNXbLLAqkig9CjhA3SdJzhEqfJNa
 zQ+JAXRNu4ps/Q7zuCKso0OPSs3VYta17abxiqs86F4r6D1xA21Q08gyJTZxFvSQCm
 MthzGkbd7CxE5Eno4ZeQdxSnnEilAqUdljLIAwhv3JeCFSulqiYLxfx2BJm5rmVpmT
 YOyXx3nqozaxLlFhuA/V5c7wumKiLvvCFqHbXguJPf4XtZBne7f9o4hgZXvAPsP7we
 UuNjLfeFCq1XyCK12QEfFnld5h8rfdmhuYdXanoQilrpMHKJyn85f//iRuQqsmaWOy
 8fyFBv2VNSzvw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 14 Aug 2023 13:58:00 -0700
Message-ID: <20230814205800.2244461-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This replaces the mmmap read flow to get the maximum
 performance.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c
 | 30 ++++++++++++++++ 1 file changed, 16 insertions(+), 14 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVedc-005o72-8y
Subject: [f2fs-dev] [PATCH] f2fs-tools: f2fs_io: no memcpy for mmap read
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

This replaces the mmmap read flow to get the maximum performance.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 73ac700f8209..51baded4cb4b 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -684,6 +684,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	char *data;
 	char *print_buf = NULL;
 	unsigned bs, count, i, print_bytes;
+	u64 total_time = 0;
 	int flags = 0;
 	int do_mmap = 0;
 	int fd;
@@ -719,28 +720,29 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 
 	fd = xopen(argv[6], O_RDONLY | flags, 0);
 
+	total_time = get_current_us();
 	if (do_mmap) {
 		data = mmap(NULL, count * buf_size, PROT_READ,
-						MAP_SHARED, fd, offset);
+						MAP_SHARED | MAP_POPULATE, fd, offset);
 		if (data == MAP_FAILED)
 			die("Mmap failed");
 	}
-
-	for (i = 0; i < count; i++) {
-		if (do_mmap) {
-			memcpy(buf, data + offset + buf_size * i, buf_size);
-			ret = buf_size;
-		} else {
+	if (!do_mmap) {
+		for (i = 0; i < count; i++) {
 			ret = pread(fd, buf, buf_size, offset + buf_size * i);
-		}
-		if (ret != buf_size)
-			break;
+			if (ret != buf_size)
+				break;
 
-		read_cnt += ret;
-		if (i == 0)
-			memcpy(print_buf, buf, print_bytes);
+			read_cnt += ret;
+			if (i == 0)
+				memcpy(print_buf, buf, print_bytes);
+		}
+	} else {
+		read_cnt = count * buf_size;
+		memcpy(print_buf, data, print_bytes);
 	}
-	printf("Read %"PRIu64" bytes and print %u bytes:\n", read_cnt, print_bytes);
+	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, print %u bytes:\n",
+		read_cnt, get_current_us() - total_time, print_bytes);
 	printf("%08"PRIx64" : ", offset);
 	for (i = 1; i <= print_bytes; i++) {
 		printf("%02x", print_buf[i - 1]);
-- 
2.41.0.694.ge786442a9b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
