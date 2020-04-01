Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4E719B702
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Apr 2020 22:34:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJk44-00044H-UC; Wed, 01 Apr 2020 20:34:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jJk42-000449-TJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Apr 2020 20:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4siS1G9b/n2qqTjMg+AgviucCECqukTxdaB8Z3+ZHuI=; b=AbmQfgSRTJIjqLKkDGPk5rtNn2
 yrWejdVCClWhuWr4uhJOYGpceDBUJWCsejMxOBnBVGU5jYbD+RqTAou/ntsFwKF/ugNOdkmkQxkBD
 S+bixvRrBqoh6WdhZMm97wyR3zaBl8I3EMs9goBUHNvVlxSLpvwRjCw9WrYyp4AjHwIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4siS1G9b/n2qqTjMg+AgviucCECqukTxdaB8Z3+ZHuI=; b=Z
 M41k3ntXv7gIQws0I/DrZfPZDC/WrkluOynbvw7Sq0yNvgSLami+o6N0P07vLr66rXCAOpicPHyAf
 E9fzTZjMeD2YXIupAb3poH11JoQ069qbkjcGsZK5PdFDunSeaSaNjTun2uQWm0VkcD2hfmnQsW7OH
 rUX6nCrKWWQVF/x8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJk3y-000gqZ-1E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Apr 2020 20:34:18 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8281920719;
 Wed,  1 Apr 2020 20:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585773243;
 bh=XC+AtajwUC6IDsT4/XELWta5ALZ3ng8u+6vOSyVsBU8=;
 h=From:To:Cc:Subject:Date:From;
 b=X4XijlIrG3caLQgCuEMPHfDhb09jfEnRZz8dI1Iakzmh8RweIKcWckcxfwa3NglQO
 PThiAFbi6uQprrQ204SKwLxic8DVOPtO1knEbU27WPPDNLjiaXeJDcvk79R7s5aNS4
 QNVwgdqaCeaPbeo4Mb+ccTysPQyAuWfm+jPXM/Po=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  1 Apr 2020 13:33:23 -0700
Message-Id: <20200401203323.72092-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJk3y-000gqZ-1E
Subject: [f2fs-dev] [PATCH] fsck.f2fs: quick fix of CLOCK_BOOTTIME in mac
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

This fixes build error on mac.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 configure.ac |  1 +
 fsck/f2fs.h  |  3 +++
 fsck/main.c  | 14 +++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 9b0e872..9ac0c24 100644
--- a/configure.ac
+++ b/configure.ac
@@ -93,6 +93,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	linux/posix_acl.h
 	linux/types.h
 	linux/xattr.h
+	mach/mach_time.h
 	mntent.h
 	scsi/sg.h
 	stdlib.h
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 55d6b07..2a00d35 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -22,6 +22,9 @@
 #ifdef HAVE_MNTENT_H
 #include <mntent.h>
 #endif
+#ifdef HAVE_MACH_TIME_H
+#include <mach/mach_time.h>
+#endif
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <sys/mount.h>
diff --git a/fsck/main.c b/fsck/main.c
index c481ce4..9a1596f 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -801,12 +801,24 @@ static int do_sload(struct f2fs_sb_info *sbi)
 	return f2fs_sload(sbi);
 }
 
-static u64 get_boottime_ns() {
+#if defined(__APPLE__)
+static u64 get_boottime_ns()
+{
+#ifdef HAVE_MACH_TIME_H
+	return mach_absolute_time();
+#else
+	return 0;
+#endif
+}
+#else
+static u64 get_boottime_ns()
+{
 	struct timespec t;
 	t.tv_sec = t.tv_nsec = 0;
 	clock_gettime(CLOCK_BOOTTIME, &t);
 	return (u64)t.tv_sec * 1000000000LL + t.tv_nsec;
 }
+#endif
 
 int main(int argc, char **argv)
 {
-- 
2.26.0.rc2.310.g2932bb562d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
