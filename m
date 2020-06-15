Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD31F9F16
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 20:09:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jktXa-0001JH-6S; Mon, 15 Jun 2020 18:09:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jktXY-0001Ig-0f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 18:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tBOWzwJddxFP2InylbNhKa3ZJrgivtwXkfbauK8czNs=; b=DKpeP4GbTjUlC9GhEbpxPz4AHY
 /v39AfLsBladObM3R8O9d1dq76UuldbkwTYQUuCzxTpPWcGi9N7DL23hzRXuWShsfgyIE6cczk36M
 Drc3NjbS1gSzD9QeUXpskfZzuxra1l80CsU7yJC49819mgitdXxrxsOaYiD0Qr6UPux8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tBOWzwJddxFP2InylbNhKa3ZJrgivtwXkfbauK8czNs=; b=gjfNtmBhb479//iyOq9UTatLpx
 C2RwyvX4ByYBnwP3W0ylf93kYteYCLm/0ge58GFuugUVcMSIeWpo5Mg4B++SrqGKRPo95N0IpmhdK
 IJLF11JLd5weGMTNskwnDmGKqYN5dqK7Qq4Ee5QJQsnr3JCSpceixE+gFDGNXp/2eOnA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jktXP-003ubw-LV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 18:08:59 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C15420899;
 Mon, 15 Jun 2020 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592244526;
 bh=53/mS93qz+uqTTW0gkeAB7ZgTbnH+pcGNiM6D9Ijms0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=emsisBqRfdiabmDoLvyHjv++h/fSlQQz8w1uVchy9v54XoPi3NGjdC3K/37faXcvv
 rNRpFrZUafrqq4KC+TNIRV+bDvp6rrVSd4Oh+vCu295AbTFDIJcl+Vq91xyn/W+uVZ
 j7D+Y81KeOYXL7Y+D8ODO8Dje8zsfO+2fJpSW0zQ=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Jun 2020 11:08:43 -0700
Message-Id: <20200615180843.153299-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200615180843.153299-1-jaegeuk@kernel.org>
References: <20200615180843.153299-1-jaegeuk@kernel.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jktXP-003ubw-LV
Subject: [f2fs-dev] [PATCH 4/4] lib: pass all needed include paths to libf2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Rolf Eike Beer <eb@emlix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Rolf Eike Beer <eb@emlix.com>

Otherwise the paths to uuid and blkid headers extracted from pkg-config are not
respected.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/Makefile.am | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index 42c8d31..af5b1c7 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -11,7 +11,6 @@ mkfs_f2fs_LDADD = ${libuuid_LIBS} ${libblkid_LIBS} $(top_builddir)/lib/libf2fs.l
 lib_LTLIBRARIES = libf2fs_format.la
 libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
 libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
-libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
 libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} ${libuuid_LIBS} -L$(top_builddir)/lib -lf2fs \
 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
 
-- 
2.27.0.290.gba653c62da-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
