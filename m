Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E31C2146
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 May 2020 01:36:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUfCa-00020i-Fx; Fri, 01 May 2020 23:36:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jUfCY-00020R-SF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 23:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=njhHLNCGzkiXymC315NSFdN5l09A/M87pUemY7MYQRI=; b=SFRGXMf71Zk7yfb4mTamANqP4V
 C8zoyQE4zldYZK3o7w7YPXO78BCthAKZANSZgIEUUgtXtNIEfiazcah75aiQDrhfZiXzuMQXA7F4H
 M1BPKCLRWIWaYxs0g4LKF9G316Eg6zFV82GlVRDaq47iZW9OGbENXJ7JHIbg1vnaVA0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=njhHLNCGzkiXymC315NSFdN5l09A/M87pUemY7MYQRI=; b=E
 l9f6zveFFM5nBfVjQQ804zY1ot+k7LNPep3oKOHZaqKARDF5c348mWEMHxxcUIzYuhMhodmrqKxgo
 rzdpidQ60iO6EKbjJq0uHyVDeNufjHEhpcznDYhgRVRQKjkZQKxIJKwvv75mMxAtOPOuOaFsKPMFO
 lAakXojcz67EpLpA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jUfCQ-004yPw-8h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 23:36:14 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A445C216FD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  1 May 2020 23:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588376160;
 bh=RcUO2MTNP8EhaK9oYYTLH1rzp5QnEb/vhMwlNijucnY=;
 h=From:To:Subject:Date:From;
 b=Ew15C4Cx5nwyxgUAMo16IO2RsLqKClQL9Q7qJ+dr5esFuWS91lnEvAUgX6tLz3oyx
 /g9iR692Jc5VgZeUCFPwxIvLnMihQ3NhWfFPPEoKYGyYSH8sLugDmNzAd8EdRXNmvf
 i6iIyB36Li7wcwLZvO7oLKMElnm68RDnQSozshro=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 May 2020 16:35:23 -0700
Message-Id: <20200501233523.50037-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUfCQ-004yPw-8h
Subject: [f2fs-dev] [PATCH] f2fs: use strcmp() in parse_options()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Remove the pointless string length checks.  Just use strcmp().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/super.c | 44 ++++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 438296e17183d1..d0a705e4933205 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -427,11 +427,11 @@ static int parse_options(struct super_block *sb, char *options)
 
 			if (!name)
 				return -ENOMEM;
-			if (strlen(name) == 2 && !strncmp(name, "on", 2)) {
+			if (!strcmp(name, "on")) {
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
-			} else if (strlen(name) == 3 && !strncmp(name, "off", 3)) {
+			} else if (!strcmp(name, "off")) {
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_OFF;
-			} else if (strlen(name) == 4 && !strncmp(name, "sync", 4)) {
+			} else if (!strcmp(name, "sync")) {
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_SYNC;
 			} else {
 				kvfree(name);
@@ -591,16 +591,14 @@ static int parse_options(struct super_block *sb, char *options)
 
 			if (!name)
 				return -ENOMEM;
-			if (strlen(name) == 8 &&
-					!strncmp(name, "adaptive", 8)) {
+			if (!strcmp(name, "adaptive")) {
 				if (f2fs_sb_has_blkzoned(sbi)) {
 					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
 					kvfree(name);
 					return -EINVAL;
 				}
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
-			} else if (strlen(name) == 3 &&
-					!strncmp(name, "lfs", 3)) {
+			} else if (!strcmp(name, "lfs")) {
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
 			} else {
 				kvfree(name);
@@ -725,14 +723,11 @@ static int parse_options(struct super_block *sb, char *options)
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
-			if (strlen(name) == 10 &&
-					!strncmp(name, "user-based", 10)) {
+			if (!strcmp(name, "user-based")) {
 				F2FS_OPTION(sbi).whint_mode = WHINT_MODE_USER;
-			} else if (strlen(name) == 3 &&
-					!strncmp(name, "off", 3)) {
+			} else if (!strcmp(name, "off")) {
 				F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
-			} else if (strlen(name) == 8 &&
-					!strncmp(name, "fs-based", 8)) {
+			} else if (!strcmp(name, "fs-based")) {
 				F2FS_OPTION(sbi).whint_mode = WHINT_MODE_FS;
 			} else {
 				kvfree(name);
@@ -745,11 +740,9 @@ static int parse_options(struct super_block *sb, char *options)
 			if (!name)
 				return -ENOMEM;
 
-			if (strlen(name) == 7 &&
-					!strncmp(name, "default", 7)) {
+			if (!strcmp(name, "default")) {
 				F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
-			} else if (strlen(name) == 5 &&
-					!strncmp(name, "reuse", 5)) {
+			} else if (!strcmp(name, "reuse")) {
 				F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
 			} else {
 				kvfree(name);
@@ -761,14 +754,11 @@ static int parse_options(struct super_block *sb, char *options)
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
-			if (strlen(name) == 5 &&
-					!strncmp(name, "posix", 5)) {
+			if (!strcmp(name, "posix")) {
 				F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
-			} else if (strlen(name) == 6 &&
-					!strncmp(name, "strict", 6)) {
+			} else if (!strcmp(name, "strict")) {
 				F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_STRICT;
-			} else if (strlen(name) == 9 &&
-					!strncmp(name, "nobarrier", 9)) {
+			} else if (!strcmp(name, "nobarrier")) {
 				F2FS_OPTION(sbi).fsync_mode =
 							FSYNC_MODE_NOBARRIER;
 			} else {
@@ -823,15 +813,13 @@ static int parse_options(struct super_block *sb, char *options)
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
-			if (strlen(name) == 3 && !strcmp(name, "lzo")) {
+			if (!strcmp(name, "lzo")) {
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZO;
-			} else if (strlen(name) == 3 &&
-					!strcmp(name, "lz4")) {
+			} else if (!strcmp(name, "lz4")) {
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZ4;
-			} else if (strlen(name) == 4 &&
-					!strcmp(name, "zstd")) {
+			} else if (!strcmp(name, "zstd")) {
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_ZSTD;
 			} else {
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
