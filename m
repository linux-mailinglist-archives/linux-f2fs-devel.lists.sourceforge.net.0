Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC839AE0C1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 11:30:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3uAR-0004jV-8g;
	Thu, 24 Oct 2024 09:30:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1t3uAQ-0004jP-3e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oEvdcgdsS1Uz97v9p/S+lpuMw0Sqee5rf3lE1Qh4Y3c=; b=eKUz1UvPfbK3oiqBi7KFxb7r1t
 2bpg4qGf6KKewSAc6+i42IeeyOgsbg3P/oui3fHNtRIy+eiwrCTVxEblzuBJ759PnDCI4QytHfVw0
 Bw52spyFaqknYsZCDRYEa3Q++aTKOOR9tqV0mGGHY71eloKiuFqYuyrhkwnkxcbWeZns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oEvdcgdsS1Uz97v9p/S+lpuMw0Sqee5rf3lE1Qh4Y3c=; b=j
 T9KWmnw+mib0LPIBMSwxnSe1JwEBF5Qjh9bz2BQ+rBTdIg+pv7dDkGS0bAwGAKAqTj/pDLcFpaTRR
 O9AaDaX8uuFXnbohEVWXxfJ9bRuDXm+nKG14YbY5zEXjcUMYwOisiFV/8Rvja7vaOrSB8zhQ8dqRq
 pDAHYw/TRhy6Gk2I=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3uAO-0002K5-9T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 09:30:05 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49O9T9bL001342;
 Thu, 24 Oct 2024 17:29:09 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4XZ0wD1k5Mz2K25Nw;
 Thu, 24 Oct 2024 17:28:44 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 24 Oct 2024 17:29:07 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 24 Oct 2024 17:28:54 +0800
Message-ID: <1729762134-380-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49O9T9bL001342
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS_BLKSIZE may be 4KB, 16KB, so use F2FS_BLKSIZE to replace
 some hardcode desc about unit in some f2fs_io cmd, also adjust "-c" parameters
 in mkfs man, to be consistent with commit c35fa8cd75ac ("mk [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t3uAO-0002K5-9T
Subject: [f2fs-dev] [PATCH] f2fs-tools: correct some confused desc about unit
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS_BLKSIZE may be 4KB, 16KB, so use F2FS_BLKSIZE to replace
some hardcode desc about unit in some f2fs_io cmd, also
adjust "-c" parameters in mkfs man, to be consistent with
commit c35fa8cd75ac ("mkfs.f2fs: change -c option description").

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 man/mkfs.f2fs.8         | 2 +-
 tools/f2fs_io/f2fs_io.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index de885be..8b3b0cc 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -122,7 +122,7 @@ block size matches the page size.
 The default value is 4096.
 .TP
 .BI \-c " device-list"
-Build f2fs with these additional comma separated devices, so that the user can
+Build f2fs with these additional devices, so that the user can
 see all the devices as one big volume.
 Supports up to 7 devices except meta device.
 .TP
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 95f575f..ee4ed0e 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1013,7 +1013,7 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define fiemap_desc "get block address in file"
 #define fiemap_help					\
-"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
+"f2fs_io fiemap [offset in F2FS_BLKSIZE] [count in F2FS_BLKSIZE] [file_path]\n\n"\
 
 #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
@@ -1617,8 +1617,8 @@ static void do_move_range(int argc, char **argv, const struct cmd_desc *cmd)
 #define gc_range_desc "trigger filesystem gc_range"
 #define gc_range_help "f2fs_io gc_range [sync_mode] [start] [length] [file_path]\n\n"\
 "  sync_mode : 0: asynchronous, 1: synchronous\n"			\
-"  start     : start offset of defragment region, unit: 4kb\n"	\
-"  length    : bytes number of defragment region, unit: 4kb\n"	\
+"  start     : start offset of defragment region, unit: F2FS_BLKSIZE\n"	\
+"  length    : bytes number of defragment region, unit: F2FS_BLKSIZE\n"	\
 
 static void do_gc_range(int argc, char **argv, const struct cmd_desc *cmd)
 {
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
