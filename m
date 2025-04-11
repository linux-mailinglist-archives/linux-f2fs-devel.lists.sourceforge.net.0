Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2900A858D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:06:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3BH1-0000hd-Pd;
	Fri, 11 Apr 2025 10:06:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3BGx-0000hT-KU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UZT2WMM3+XC186zPVtIpXNgDDQ44dosvK0xYgwmlpgQ=; b=ZW0xBDQNnYUHoc1i97T/NNAjgR
 vEPDk054v2CTHAgnrJ0trjfcKNJuKCMOMtwaPCuonKv6hQopeiFizWtt7IMi82l+oqB2TnwnfMrhU
 iCCfEPyWgDnVWf2x9l2cGnX0wFviJoDM3neh2AgzpIwQfy/lG1Qv0AwA928U74Wu179s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UZT2WMM3+XC186zPVtIpXNgDDQ44dosvK0xYgwmlpgQ=; b=knzsWX5RPd0bz+GTwgbhuuBRtB
 aDui5R0+hWjvKF6TPui87vCOs+Ao5+nHztgNjHW99ps3yf8Jfp8bzI/j/+oytomxmmVPrgMmJRE1F
 vDnkoYNdjAx+Ls9znQ5i+22PI8mLWYCGxm23bR0p3r2aDHTL0o2WiHKQGN/le7hX6ErM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3BGe-0001ZU-SO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A356EA4AA1B;
 Fri, 11 Apr 2025 10:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CB3C4CEE7;
 Fri, 11 Apr 2025 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744365937;
 bh=xbk65NPFGf4rNxDEgiltPxJhu62ZocKp5X6vqSsX/04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WMI1RgI/sYZsCAXHDGaQWHCTvHWI+clyGBfgbbf2KpY3ligkWobZ9kEgi+L152oRP
 KFBD6su5i5b0L95yk7UqwPLU3f7yH+Lhix2qtcsI6V+s4KO+15cFoEBK0k+1OyMqTc
 uC56AuMu2muR1lh6cTgQ7hzFW6gE+icz958XQLkNkZdvC/bYNVQ1LuXmWvueJOFrhj
 LMalk+9T/mJoq0kKgVtXSwfA1Ki+VkHsaWFevA61xql/r6fsW6m9b6iASkbvrZ873O
 Z5kcle/7Ec9Af8y7MHJnRou5PJuggy+1U2iIHScnIN6JlTmYQl/yOsXS+B8KdbTh3Q
 DwKOI0/8r2Llg==
To: jaegeuk@kernel.org
Date: Fri, 11 Apr 2025 18:05:26 +0800
Message-Id: <20250411100526.7939-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250411100526.7939-1-chao@kernel.org>
References: <20250411100526.7939-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: resize.f2fs doesn't guarantee atomically resizing f2fs image,
 so that potential suddent power cut, IO error, out of memory, SIGKILL received
 or program exits due to other reasons may cause data corrup [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3BGe-0001ZU-SO
Subject: [f2fs-dev] [PATCH v2 2/2] resize.f2fs: add caution message for
 resize
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

resize.f2fs doesn't guarantee atomically resizing f2fs image,
so that potential suddent power cut, IO error, out of memory,
SIGKILL received or program exits due to other reasons may cause
data corruption.

This patch adds caution message for resize users to notice
potential risk of using resizing tool, and remind them to backup
data before resize.

resize.f2fs <partition>

"Please notice there is high risk of data lost during resize, please backup your data before resize.
Do you want to resize this partition? [y/n] y
process resize"

If we want to force to use resize.f2fs, we can use -F option,
let's enable -F option in Android by default to not break any
usage.

Cc: Ju Hyung Park <qkrwngud825@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/main.c       | 27 +++++++++++++++++++++++++--
 fsck/resize.c     |  2 +-
 include/f2fs_fs.h |  1 +
 man/resize.f2fs.8 | 12 ++++++++++++
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index af40613..ef6b17d 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -222,6 +222,8 @@ static void add_default_options(void)
 		if (c.func == FSCK) {
 			/* -a */
 			c.auto_fix = 1;
+		} else if (c.func == RESIZE) {
+			c.force = 1;
 		}
 
 		/*
@@ -601,7 +603,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:fHst:o:V";
+		const char *option_string = "d:fFHst:o:V";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -618,9 +620,12 @@ void f2fs_parse_options(int argc, char *argv[])
 							c.dbg_lv);
 				break;
 			case 'f':
+				c.ignore_error = 1;
+				MSG(0, "Info: Ingore error during resize\n");
+				break;
+			case 'F':
 				c.force = 1;
 				MSG(0, "Info: Force to resize\n");
-				break;
 			case 'H':
 				c.need_whint = true;
 				c.whint = WRITE_LIFE_NOT_SET;
@@ -1104,6 +1109,24 @@ out_range:
 #ifdef WITH_RESIZE
 static int do_resize(struct f2fs_sb_info *sbi)
 {
+	char answer[255] = {0};
+	int ret;
+
+	if (!c.force) {
+retry:
+		printf("\nPlease notice there is high risk of data lost during resize, "
+			"please backup your data before resize.\n"
+			"Do you want to resize this partition? [y/n] ");
+		ret = scanf("%s", answer);
+		ASSERT(ret >= 0);
+		if (!strcasecmp(answer, "y"))
+			printf("process resize\n");
+		else if (!strcasecmp(answer, "n"))
+			return 0;
+		else
+			goto retry;
+	}
+
 	if (!c.target_sectors)
 		c.target_sectors = c.total_sectors;
 
diff --git a/fsck/resize.c b/fsck/resize.c
index 2681b9f..1ab7d75 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -765,7 +765,7 @@ int f2fs_resize(struct f2fs_sb_info *sbi)
 		}
 	else if (((c.target_sectors * c.sector_size >>
 			get_sb(log_blocksize)) > get_sb(block_count)) ||
-			c.force)
+			c.ignore_error)
 		return f2fs_resize_grow(sbi);
 	else {
 		MSG(0, "Nothing to resize.\n");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 7e3f25b..928f963 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1528,6 +1528,7 @@ struct f2fs_configuration {
 	int no_kernel_check;
 	int fix_on;
 	int force;
+	int ignore_error;
 	int defset;
 	int bug_on;
 	unsigned int invalid_sb;
diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
index 02ff245..bdda4fd 100644
--- a/man/resize.f2fs.8
+++ b/man/resize.f2fs.8
@@ -18,6 +18,12 @@ resize.f2fs \- resize filesystem size
 .I overprovision-ratio-percentage
 ]
 [
+.B \-f
+]
+[
+.B \-F
+]
+[
 .B \-H
 ]
 [
@@ -53,6 +59,12 @@ Specify the percentage of the volume that will be used as overprovision area.
 This area is hidden to users, and utilized by F2FS cleaner. If not specified, the
 best number will be assigned automatically according to the partition size.
 .TP
+.BI \-f
+Force to fix any inconsistent data during resize.
+.TP
+.BI \-F
+Skip caution dialogue and resize partition directly.
+.TP
 .BI \-H
 Specify support write hint.
 .TP
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
