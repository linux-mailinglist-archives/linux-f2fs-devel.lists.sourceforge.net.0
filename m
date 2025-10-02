Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F851BB51EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Oct 2025 22:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=03u0W+/c07xpd36gNybzv7v1ToSAtMltOQdVJe8X2w4=; b=X1LJ1xM9Ww/CH5valZzhIpQna6
	4grKIw/NbrapKwM3pZzTQAFjtYN43HBGfT/xvF1I3Bvhzm4VMST0v+6THBd7Qwuo5xElHoXyXe+1E
	rU3ZaNQaFBlrFJOI40OWKGHhB3dERTFXFwb2CxFcw9gNZr25r85C45D6Qt7OnVylxv3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4PsS-0002oG-J5;
	Thu, 02 Oct 2025 20:26:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v4PsQ-0002o8-Pj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=40BkM8Hn1STZfYTemPYVRFii128pHJ7Gt8LrmsTi2VU=; b=VksbmpvlOhvjXSkhD+HVHPvwaQ
 MmfYETjgnIzQr7bb8vC7PZ3kir5wFgBToXTTW3H40WZDSJlWI3tKuS+h1X/VsLlXIXsD5C5N9Pck3
 0CiJRYch9wD6R5mF4JFDsgbJUtuOtD+TqLoKtgyUoJlZ0BozRbQQt6yLUq7EbuXBTxfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=40BkM8Hn1STZfYTemPYVRFii128pHJ7Gt8LrmsTi2VU=; b=C
 O4dzJlPSUoTwsVZg6LKOgNUcH+DCGTeCxaPuqdlG2u+lT+g4CHUrKvyvanXDQEnlKE70CRHqs3QEb
 ImXiEZVztQjgoFyLCF+ICXQxwLoOtFMYyvBvHnt3xIrj3YtGi24e9A7XRJCHZ0xhj1ykm2EhHEHIP
 xEe2HqziUVa2OZK0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4PsP-0004oZ-8D for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8C8840A94
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Oct 2025 20:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CB1C4CEF9;
 Thu,  2 Oct 2025 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759436763;
 bh=74Asu/M7qfRDtw9QKHDCrRxWLEqvY2SdkKTtjy2rK+U=;
 h=From:To:Cc:Subject:Date:From;
 b=rkbaCpIA3wE4ed4tEcmWZ1ZJ1k6cD3CNLpq0O3oLqCtCFE0cyzi/IaXqba4V2K4V9
 qiZW9/tGdytt3MDR5IOXFIEz9PDws2yAI/z8eLWVbCVgtWgrx9YefWL6FNa9zv3QDA
 0q1SFAsWDCCkkHPH+mn8FmP7MycDwExqwgPjnABY7UiwOuM2fg0dqXjIMLk3qEC6/F
 WzuX3YFm7RYoGMJGI0HLVLGHSWKAUwpt83Tvncx86v2KMH4egS5n2nq1DN/f4F6VPm
 7Lk6WNuf/73L1tDpddqf3IMgztlCQPygtB2ipGBXwIWrhNS4hyBmQzkFQn5grxfWts
 CVNsNUpSnDrBA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Oct 2025 20:26:02 +0000
Message-ID: <20251002202602.3797460-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c
 | 23 ++++++++++++++++++----- 1 file changed, 18 insertions(+), 5 deletions(-)
 diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c index
 d07e6c6b1bfe..9baea2b99b31
 100644 --- a/tools/f2fs_io/f2fs_io.c +++ b/tools/f2fs_io/f2fs_io.c @@ -951,7
 +951,8 @@ static void do_re [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4PsP-0004oZ-8D
Subject: [f2fs-dev] [PATCH] f2fs_io: calculate IO bandwidth vs. mlock latency
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
 tools/f2fs_io/f2fs_io.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index d07e6c6b1bfe..9baea2b99b31 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -951,7 +951,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	char *data = NULL;
 	char *print_buf = NULL;
 	unsigned bs, count, i, print_bytes;
-	u64 total_time = 0;
+	u64 io_time_start, io_time_end;
+	u64 mlock_time_start = 0, mlock_time_end = 0;
 	int flags = 0;
 	int do_mmap = 0;
 	int do_mlock = 0;
@@ -1008,13 +1009,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[7]);
 	}
 
-	total_time = get_current_us();
+	io_time_start = get_current_us();
 	if (do_mmap) {
 		data = mmap(NULL, count * buf_size, PROT_READ,
 				MAP_SHARED | MAP_POPULATE, fd, offset);
 		if (data == MAP_FAILED)
 			die("Mmap failed");
+		io_time_end = get_current_us();
 
+		mlock_time_start = get_current_us();
+		if (mlock(data, count * buf_size))
+			die_errno("mlock failed");
+		mlock_time_end = get_current_us();
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
 	} else if (do_mlock) {
@@ -1025,9 +1031,14 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		if (posix_fadvise(fd, offset, count * buf_size,
 					POSIX_FADV_WILLNEED) != 0)
 			die_errno("fadvise failed");
+		io_time_end = get_current_us();
+
+		mlock_time_start = get_current_us();
 		if (mlock(data, count * buf_size))
 			die_errno("mlock failed");
+		mlock_time_end = get_current_us();
 		read_cnt = count * buf_size;
+		memcpy(print_buf, data, print_bytes);
 	} else {
 		for (i = 0; i < count; i++) {
 			if (!do_dontcache) {
@@ -1052,10 +1063,12 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 			if (i == 0)
 				memcpy(print_buf, buf, print_bytes);
 		}
+		io_time_end = get_current_us();
 	}
-	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s print %u bytes:\n",
-		read_cnt, get_current_us() - total_time,
-		((long double)read_cnt / (get_current_us() - total_time)), print_bytes);
+	printf("Read %"PRIu64" bytes IO time = %"PRIu64" us mlock time = %"PRIu64" us, BW = %.Lf MB/s print %u bytes:\n",
+		read_cnt, io_time_end - io_time_start,
+		mlock_time_end - mlock_time_start,
+		((long double)read_cnt / (io_time_end - io_time_start)), print_bytes);
 	printf("%08"PRIx64" : ", offset);
 	for (i = 1; i <= print_bytes; i++) {
 		printf("%02x", print_buf[i - 1]);
-- 
2.51.0.710.ga91ca5db03-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
