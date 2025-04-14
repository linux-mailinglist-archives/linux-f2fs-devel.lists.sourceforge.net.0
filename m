Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A39A875E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 04:39:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u49it-0001ZJ-O7;
	Mon, 14 Apr 2025 02:39:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u49is-0001Z6-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 02:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5jD/gT41sSPVkYHuBzQGi19vjv1BKzwhfMewJhvTyxk=; b=di+rcHJuZbXPESzjlepOomG3aG
 2dXwauJx19w1A49YreSfxKhxVpnfRNwBVSYBM7eUbqqHdpvv6ClwtgiE0LIiFTljKcwUvxACKPPUm
 /Y/dBGwRni6slWnB2+f/kyP073YQhIAJ4uxsEckYCtoh26wTbOcbsv+Sg5NC1ZO0Q1CA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5jD/gT41sSPVkYHuBzQGi19vjv1BKzwhfMewJhvTyxk=; b=OhFd+SXQsZsVoM9hiGEm2vxH/4
 JT9zIp7EEi17JDjrN/9LMhAxi0vFC6ANe8wVheaW+Dgm/KL98VxnBaVNAs8tLJ2BmsH0WNe5U50C4
 tdnffYzFTzGnoejo8WiKSwGNDMibXdApNz9S2S1yDzTV2s5myFKOriBKOOL+mdpgOZ2w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u49ia-0000Qe-8s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 02:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E8006114C;
 Mon, 14 Apr 2025 02:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38908C4CEE5;
 Mon, 14 Apr 2025 02:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744598309;
 bh=Mqhn5Ie+YUzaI9O0kmrkpSsHrJW09Ik6Q1sAa26c6rU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fyy3cLVrbqc7bvqTjN1tC7xJbNu73GsdvPwsKI2VyAJ+pwW7kmI6J/NOrvcGCNCIy
 M3RJbmAwcO0CeRMrTou6I6jAHRD79BaezdkLmmzLMM0EQIksCinZEIRIRJ9FHU0t6o
 WoAArl3jvUpHhFL4S6XQJclNE4h20piOQzFe2N1UHCD5yymleBNu9F/roKxHdY1/+j
 vJMEahBXPf39xUL1Ay276zW0FCMunHX355IaHJ6oR6DNjVirLpaRomFKJMoGZj8uFY
 Wy7subEYAMCuNaG/BfpNT1fzX6bQ9t9ld4GJKWqM5EPnushy/Yh6dJu/WCIX3qYM95
 NviBp17qV94vw==
To: jaegeuk@kernel.org
Date: Mon, 14 Apr 2025 10:38:19 +0800
Message-ID: <20250414023819.581303-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250414023819.581303-1-chao@kernel.org>
References: <20250414023819.581303-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: resize.f2fs doesn't guarantee atomically resizing f2fs image,
 so that potential suddent power cut, IO error, out of memory, SIGKILL received
 or program exits due to other reasons may cause data corrup [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u49ia-0000Qe-8s
Subject: [f2fs-dev] [PATCH v4 2/2] resize.f2fs: add caution message for
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

"Resize operation is currently experimental, please backup your data.
Do you want to continue? [y/n]y
Proceeding to resize"

If we want to force to use resize.f2fs, we can use -F option, let's
enable -F option in Android by default to avoid breaking any usage.

Cc: Juhyung Park <qkrwngud825@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v4:
Fix issues pointed out by Juhyung:
- fix typos
- fix wrong fallthrough
- clean up caution message w/ unaggressive words
 fsck/main.c       | 25 ++++++++++++++++++++++++-
 fsck/resize.c     |  2 +-
 include/f2fs_fs.h |  1 +
 man/resize.f2fs.8 | 12 ++++++++++++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index af40613..3a116e1 100644
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
@@ -618,6 +620,10 @@ void f2fs_parse_options(int argc, char *argv[])
 							c.dbg_lv);
 				break;
 			case 'f':
+				c.ignore_error = 1;
+				MSG(0, "Info: Ignore errors during resize\n");
+				break;
+			case 'F':
 				c.force = 1;
 				MSG(0, "Info: Force to resize\n");
 				break;
@@ -1104,6 +1110,23 @@ out_range:
 #ifdef WITH_RESIZE
 static int do_resize(struct f2fs_sb_info *sbi)
 {
+	char answer[255] = {0};
+	int ret;
+
+	if (!c.force) {
+retry:
+		printf("\nResize operation is currently experimental, please "
+			"backup your data.\nDo you want to continue? [y/n]");
+		ret = scanf("%s", answer);
+		ASSERT(ret >= 0);
+		if (!strcasecmp(answer, "y"))
+			printf("Proceeding to resize\n");
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
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
