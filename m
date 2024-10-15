Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E799DAA6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 02:23:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0VLo-00005E-Bf;
	Tue, 15 Oct 2024 00:23:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t0VLn-000055-5J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 00:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=La0FbfaSsUe5f/URD5cSG8H/NZnbROBH69XqDFL+prM=; b=j8btcXKCdLuPFl01rnCeh9B0jB
 WPTh+NgGpzzL8gPQDnLPpDNEbeh38ambh3JlQPnF3VubQ3ADRADKQGlVrtcwerKwatlUp76QgoqIN
 3wsgnHRET9mybKdbRRLvAQ3Aj4Djj+RNA7j7D3/PToNxkKUBXfcVNwZBNXyYPmhhXtOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=La0FbfaSsUe5f/URD5cSG8H/NZnbROBH69XqDFL+prM=; b=T
 MJPGGAK/l3ucJRysEls6f2kKRxlYULN7rCBS21Whoijb1YcLSPrm5odzF298q41Q6bYof32PfVrMg
 rhWM1U7AswsShfABK0jdVjn0f/0hF3RUH5R/44Wx7UERjDIFE2hTkhLADCu1b4bQ0dJX1p+FQ0vl/
 EtaLOkk6ld3lZFWM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0VLm-00081k-5D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 00:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65AB75C5C20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Oct 2024 00:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC2FC4CEC6;
 Tue, 15 Oct 2024 00:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728951815;
 bh=HlqarReOghWkv7c5Sbqoy22zYM/VAvXmwpyI+qtURks=;
 h=From:To:Cc:Subject:Date:From;
 b=Nu5+PFy216il4QH6/f4VuuubHNOchJGMfGy03M4wDalR3YVOHdtavJt6ewK31WL5A
 S97DFVcIZV+nhYO9atITF2AB9I85Kc+kwbLIlG+qehTeKFscOFRBzPI3SkJnUpoVI7
 RLzE3NNCzwmw65OCWCpB2BvpLZWGqRZyOH/pxB/FL3BddNsvQcpDdvXjxKBkZVCEdg
 5pWpoWOO1ZGLK3NXu/1CH4qHxMJtu3l0LFzMnxvom+5rFHwHjxTeZlQYmcOqpn7y/w
 DNW+IPF9aTb5HYVnqB5D5B4wueqcrudsbVIt8dsqlrOCv6G0ha/vJk5Wn1PRI+mA/V
 n11U0tQ7/Wjmg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 15 Oct 2024 00:23:31 +0000
Message-ID: <20241015002331.2724827-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It's complicated to address libc and kernel headers.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- lib/libf2fs_io.c | 10 +++++----- 1 file
 changed, 5 insertions(+),
 5 deletions(-) diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
 index 1923c0b87dfc..520ae0362fd4 100644 --- a/lib/libf2fs_io.c +++
 b/lib/libf2fs_io.c
 @@ -34,16 +34,16 @@ #include <linux/hdreg.h> #endif 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0VLm-00081k-5D
Subject: [f2fs-dev] [PATCH] f2fs-tools: remove linux/fcntl.h but define the
 hint directly
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

It's complicated to address libc and kernel headers.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs_io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 1923c0b87dfc..520ae0362fd4 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -34,16 +34,16 @@
 #include <linux/hdreg.h>
 #endif
 
+#ifndef F_SET_RW_HINT
+#define F_LINUX_SPECIFIC_BASE 	1024
+#define F_SET_RW_HINT		(F_LINUX_SPECIFIC_BASE + 12)
+#endif
+
 #include <stdbool.h>
 #include <assert.h>
 #include <inttypes.h>
 #include "f2fs_fs.h"
 
-#ifdef HAVE_LINUX_FCNTL_H
-#define HAVE_ARCH_STRUCT_FLOCK
-#include <linux/fcntl.h>
-#endif
-
 struct f2fs_configuration c;
 
 #ifdef HAVE_SPARSE_SPARSE_H
-- 
2.47.0.rc1.288.g06298d1525-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
