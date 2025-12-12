Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F552CB76F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Dec 2025 01:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nSV92CEkA/3msPIsxM6+qIQmD23/wxoP3i2E3AEDwPE=; b=gux7ZHDWdAkf81eAf561O0dy55
	7zc10IGkUmYJlPZGlW/HyTsy37vWcjCVROLK50MNBbw+VCuuOptRJII7QtHXjCp2yeG31JnHFyuQ0
	1JxJgikOkKcjOUcG7NLEOiNNhzYq+TzKI5JuDtAkfFJBXzBUz9WFm2NiZh9YvM8JlQv8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vTqnh-000374-Hi;
	Fri, 12 Dec 2025 00:14:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vTqng-00036y-9G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 00:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tgdL5QlBYwrAFSzcFQKWD0h48HydBdLAxcLszJItmzs=; b=lBH32lo/58OGhAGQagr2ae8dEl
 JhBIRb8iWOJ0+uqvoGi3sljtCUoqGKsJQvtH0GRcs7y2h5YE4lQkxy5hgwT7XgoQ2UmiVUXXeJraQ
 ZmMck9BBAiofUpejguSfRZGoiLF5QXo7GxWUo1Y0VIbqT66InG0vDW1H4SGXZRWErH6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tgdL5QlBYwrAFSzcFQKWD0h48HydBdLAxcLszJItmzs=; b=P
 EAE8XVUNfZAr4QywA7e0R3ykoW/oKqJpg23ZOsaM5eHtKCioG73ZKwwUYQVmO7O2M8UN2zcO7Cqqt
 HsCGxuQFDYzruuLZgeNHUTSdwdRWsF7fm7yu1Vbvj811uMHNzfnK77mwWJhz+Q6Pv58ApWnXbLCo9
 K2KHuRSMCMmstqr0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vTqnf-0004Ze-UK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 00:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0A3C41968
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Dec 2025 00:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB91C4CEF7;
 Fri, 12 Dec 2025 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765498453;
 bh=zWfwlH8F6GWly4N2Yujse7et3xXJQIwsT6Ep6XyH5XY=;
 h=From:To:Cc:Subject:Date:From;
 b=o/c9Nr1j4xbWDXmY4xFbRnh+g2zc67NIB6rgXbOLDVBjjdOyau3UGRv3xuGNmkadb
 85JKJxP8pTU5A82KeFgQt0sNEYDJO//hauYAiwB/gfUctkIDM+dxCVAhEwltJKxLSv
 5k/UGAYJ3CTdQSnouexJMQNE4LwV2lpH1kzjF/il0wiK9XxQEn+Q1YAj6Tgu+F+zQC
 zEFHpTHC9QYA7VZdC4+NfJ8jvV0vgl4s0MPlzpUdR7uog6Kui75bDDIBXMACaeAR2Z
 YyROwwHT1bi/Y/6AZepfymAt6jD52aqeN5WNFXL3tVocEJSQutfcU8oKcSpaEBKmR/
 cYWpcYpRNCmuw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Dec 2025 00:14:11 +0000
Message-ID: <20251212001411.3901279-1-jaegeuk@kernel.org>
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
 tools/f2fs_io/f2fs_io.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 35c367bd67e7..4429e0b0459c 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -1093,7 +1093,7 @@ static void do_ [...]
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
X-Headers-End: 1vTqnf-0004Ze-UK
Subject: [f2fs-dev] [PATCH] Fix to get the right IO bandwidth
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
 tools/f2fs_io/f2fs_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 35c367bd67e7..4429e0b0459c 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1093,7 +1093,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	printf("Read %"PRIu64" bytes total_time = %"PRIu64" us, BW = %.Lf MB/s, "
 		"IO time = %"PRIu64" us, mlock time = %"PRIu64" us, print %u bytes:\n",
 		read_cnt, get_current_us() - io_time_start,
-		((long double)read_cnt / (get_current_us() - io_time_start)),
+		((long double)read_cnt / (io_time_end - io_time_start)),
 		io_time_end - io_time_start,
 		mlock_time_end - mlock_time_start,
 		print_bytes);
-- 
2.52.0.305.g3fc767764a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
