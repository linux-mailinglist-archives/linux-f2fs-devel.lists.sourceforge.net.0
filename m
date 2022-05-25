Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A26534238
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 May 2022 19:33:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntutB-0004xh-QT; Wed, 25 May 2022 17:33:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ntutA-0004xb-M6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 17:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xuA1f5IsqFsKGwIqr1G79tX0BaZ5+bcE0fLm4r6i7Nc=; b=JvY9eaX7RnR1JZc5bC4s935lHO
 wzKKcl20OffCYhQ7vE5wUvb1NRVXUBbMXc+9+6uTz7l5exdZ8KIU59GuSu2NYuqyOSx/vX8KlhZOi
 g3paIv6K981PuE863BS0NB/dsLIymB7D9kXsrLDUl8VQH8FEVq4iD+KWpLBhpx4Y26Xs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xuA1f5IsqFsKGwIqr1G79tX0BaZ5+bcE0fLm4r6i7Nc=; b=h
 Fdi6fO0fy+6vD1t4MVUA4ttJLcQUNrcK5IKfPS5gviEotZlc8/4nUq2aOeazL2w/wup8NA+1YzbOg
 djPZE/szzFkYrIfj/kaHDRWHB4iKQN1kd4nky27O8fEZbLykkrDf9LlAtp7ME/D0qvm6m2u8uwoL9
 R3aFui+12MC6D1LA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntut4-009vuE-S4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 17:33:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E6D86178F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 May 2022 17:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3442C385B8;
 Wed, 25 May 2022 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653500008;
 bh=DwMLcn0/K10UtAT1sEl/sBLtW5FlOXYahgdo/NZI7Qw=;
 h=From:To:Cc:Subject:Date:From;
 b=TDQzBbgHqIJXVA6lwwv3K9FFs6Eb6u5IMBnM2F0+M+JUizu5VSo6LJOHFiD/94naJ
 oGbPc5axI81iX0IfK+o5kSrFSsg0p0u/WUJsriypBmQPMca6eI678rzBqHYZFhhmWu
 BKgcKJ2sIbVSoy5y9fXuUxYGMYf97gWqVE8Pe6qLeHrqyiXwHhLpi5zrPQtcILtW6q
 BEruEKZgvSu+LRvF3kbf/dXpILfvMJ6joCfIb+CreGwTG87B7fsDBEZy8BlasKDvIr
 ytt9WCn0V7tykRMNa+XuJcIlynKdDuzKI7CF0KYtBpwioW5eUKB1PQm/uqdhQHr/Hd
 OPbVJyRe84RSg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 25 May 2022 10:33:27 -0700
Message-Id: <20220525173327.851320-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 include/android_config.h
 | 8 ++++++-- 1 file changed, 6 insertions(+),
 2 deletions(-) diff --git a/include/android_config.h
 b/include/android_config.h index 5f5c693cbbb3..07440874188c 100644 ---
 a/include/android_config.h
 +++ b/include/android_config.h @@ -4,8 +4,6 @@ #define HAVE_FCNT [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntut4-009vuE-S4
Subject: [f2fs-dev] [PATCH] Support zoned device if libc exists
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/android_config.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/android_config.h b/include/android_config.h
index 5f5c693cbbb3..07440874188c 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -4,8 +4,6 @@
 #define HAVE_FCNTL_H 1
 #define HAVE_FALLOC_H 1
 #define HAVE_FSYNC 1
-#define HAVE_KERNEL_UAPI_LINUX_BLKZONED_H 1
-#define HAVE_LINUX_BLKZONED_H 1
 #define HAVE_LINUX_HDREG_H 1
 #define HAVE_LINUX_LIMITS_H 1
 #define HAVE_POSIX_ACL_H 1
@@ -42,6 +40,12 @@
 #ifdef WITH_SLOAD
 #define HAVE_LIBSELINUX 1
 #endif
+
+#ifdef WITH_LIBC
+#define HAVE_KERNEL_UAPI_LINUX_BLKZONED_H 1
+#define HAVE_LINUX_BLKZONED_H 1
+#endif
+
 #endif
 
 #if defined(__APPLE__)
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
