Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A294C99132
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 21:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PT6PcAKsOcJ5+9VDDjFslu7yCPrlZiHO9BBlgbbcpys=; b=dN0XKLvTB2ulJqTtzgzmHaWo7U
	qHwmErgxIZ7iwR5FkFHJ8PJjZXvKBzqT75iy1wMw3mVgiYz97l7aIEwowwsBvRTuhDcYhytVZYlz1
	cmAc+XJdzuCh+mTUc7RIvSkd095G2PZbbnGOypioKp/WSjON7/y8D1wsrf6/lNC682A8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQAn3-0007FI-Mc;
	Mon, 01 Dec 2025 20:46:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQAn2-0007FC-DW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kGjFXLFF7qsjj+/o4IRgk9MdGuHeBhaCcJx3DuowKvg=; b=PqOcT+/bqsoNr0YgkFXeAlxb4n
 c51jxpQ9ye9+w5jfqMFQZHXEiyB6aRa8UPZJSbES8LVW9aFDhTGk9MtdkAGo0GdinZLlXIEpGsIaq
 Ya+TGxSOvx9l3XH0RZPD2IM7QRQeqbsVu9kJutnRL5/uJQFGaAJCXUEACpBl+9kl8j/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kGjFXLFF7qsjj+/o4IRgk9MdGuHeBhaCcJx3DuowKvg=; b=B
 SUi5pvdFg6yj8WwlTuo1PhX9iMQ/CJl6sJZbssJ1lSJMStaSSnCdrRnS57uLQiQqdvSet0+oxuol7
 9zpvnotC8rU6L8+xXq6T7lCiJ4XMVsqXN9ZX8c0e3C8NNcjamhReHNNunxiqxBSD96hOB96DxhzI4
 jla3DdBRM1PpObXU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQAn2-0000to-0o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 978FD4198C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 20:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6830AC4CEF1;
 Mon,  1 Dec 2025 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764621986;
 bh=8SuTCQaVYU7lsbJLteS0RbKYrf+Dg3AwACzqWj88Xks=;
 h=From:To:Cc:Subject:Date:From;
 b=Z1EaEIP+0/IoQdQYe38xd/fhZuCz3ElmfZYQ5AhwfFzDVxPK/JkOfhizI9RSfpWsU
 f3iMCenCx1NcDv2JHdbuNtS0m8aaq+BPgA5SdRRtPKF5S/Ztv1vR2OJTETMwnJPhmo
 41+/oqTrir+XbUNFyZAIYyYyOxcyZSA9T+DentYvhV2uktAel4BJvwHSE4DXOxhLpM
 AoGBBvDmXODysL5+Jn/OixXcrRGTl4s4EioqUMvV/jTMqv4fvb+mWh1LU5qg+lFqsq
 qTCV5NX0OnSVdPt8Yv26P1/9Va3x5B+wJBkZUnQRGhCVMaoPij61C3r98KCvf3Qt3T
 FhfOMuuDTMHsA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  1 Dec 2025 20:46:18 +0000
Message-ID: <20251201204620.905318-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's measure the start time more precisely. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c | 5 ++++- 1
 file changed, 4 insertions(+),
 1 deletion(-) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 326b3bd033af..bc2e014d3911 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -1009,8 +1009,8 @@ static void do_ [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQAn2-0000to-0o
Subject: [f2fs-dev] [PATCH 1/3] f2fs_io: measure the start time explicitly
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

Let's measure the start time more precisely.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 326b3bd033af..bc2e014d3911 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1009,8 +1009,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[7]);
 	}
 
-	io_time_start = get_current_us();
 	if (do_mmap) {
+		io_time_start = get_current_us();
 		data = mmap(NULL, count * buf_size, PROT_READ,
 				MAP_SHARED | MAP_POPULATE, fd, offset);
 		if (data == MAP_FAILED)
@@ -1028,6 +1028,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 				MAP_SHARED, fd, offset);
 		if (data == MAP_FAILED)
 			die("Mmap failed");
+
+		io_time_start = get_current_us();
 		if (posix_fadvise(fd, offset, count * buf_size,
 					POSIX_FADV_WILLNEED) != 0)
 			die_errno("fadvise failed");
@@ -1040,6 +1042,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
 	} else {
+		io_time_start = get_current_us();
 		for (i = 0; i < count; i++) {
 			if (!do_dontcache) {
 				ret = pread(fd, buf, buf_size, offset + buf_size * i);
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
