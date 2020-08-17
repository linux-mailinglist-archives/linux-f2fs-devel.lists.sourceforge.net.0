Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F80245BC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Aug 2020 07:01:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7XHI-0000Tk-AN; Mon, 17 Aug 2020 05:01:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k7XHH-0000Td-8G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Aug 2020 05:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cU/0kMT2iONxSrCBUFp2V6hP8+bSnUM691Eh6A9KOhI=; b=KOz7FKex3mSrEiWah83d8lsf+M
 Y5WGZXliLOQunVwYqlcL2fCLH6xrO2Ydg/mVvHtedbtrxOD64dF/FwlZjaaFfCDcnY9KrCZ/JFooi
 NuGJ7jo3JW3mLysOsOWe0M491u67UD+usB0fkaT2CX/TKvCqAgGBs7XZiFPtkWRKxYQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cU/0kMT2iONxSrCBUFp2V6hP8+bSnUM691Eh6A9KOhI=; b=L
 Kg++zvExYaYNCc75a1+waMqUXppMgewjYhjPJCcaw0PnwfsEYQV9xE3u4eLuYw+LlZhJS3gthxRUr
 VTRJ5589L2Upeju2ILoyxhkEpMBVrdkHc6WBjve6KedNKBjnNNCyOSXASV0C6Rvmef7cJX+JXWiQr
 /C186GbKOv76OfZk=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7XHC-00GnKk-QY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Aug 2020 05:01:47 +0000
Received: by mail-pg1-f194.google.com with SMTP id j21so7537880pgi.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 16 Aug 2020 22:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cU/0kMT2iONxSrCBUFp2V6hP8+bSnUM691Eh6A9KOhI=;
 b=KbyWbUhmgWcZFip/GW23yIieyXfLT4vrhNWaq4jbkcw8rYmVolIn9tJaap7nLUz9Ak
 hnNeyd+yHz/HSX1i1G3bAROpK8SzgW5+ahVwyH946LlQ4j+ihveid8FMh0GWf/QrUFSb
 swJAziw86uk8z76p/+SIIXGnbrQxlFV6ra+3+qXmAhKxGPopZgilhVBmPtGUoJXtwH8k
 NRcinTuDXRKG4dpFPrrZVxlRF43zPrr8GaMsMr1qzxZj8h/rVzN1FWfhWBjEzNm4GGSQ
 SZcGJ9z1/fQjPq5cDRgJA73oyzEMFHI+DLg63XcMZS0YPVR1/CBm0H31ZTC3X0pJUqzM
 vPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cU/0kMT2iONxSrCBUFp2V6hP8+bSnUM691Eh6A9KOhI=;
 b=TpTv9liBcgnEvXuDww2rtJOp6Y5hJ6jVt4gq3Y/mU9fM3+nmxeb055rtSBXhXR1ruJ
 mdSqbpQhsXWhoZy/HWniq+sJDogw2V+L7rA+BSOeEnTZHHurkMV5qqvGMkr2DVlEDpP2
 c+dx5S0iEhnuWrUDXaQBSNDlzs9jWe8+ob7ofSbCLsayLhbPmcihKg3oBWHIsLRcbzMG
 ZE2knCZah/u7oEZo53K1DqtaDqb2sqjYfOVtBHm68B4878BKpSNL/nheErWM0EfrntzG
 GWHMCqcQtSs08LuXFNzoC1+Mp49m66wThfzMpsgQECX05azygqsf7ffd4Az3/wbh7NxP
 z8SQ==
X-Gm-Message-State: AOAM532VbeHfc4sTztJu23qD96uADPswLOniftPAQDRpIkeDBZYf9cml
 YoqEuMtcTTr/AK6B/HzKkC500f24FUCfYg==
X-Google-Smtp-Source: ABdhPJx2aHWxHrYRtR6sYns3RHiZXkDMCsKUZztHQMQqh4BrCc6LKKKasRPnBWBfxl4n5wGxk1Tw7w==
X-Received: by 2002:a65:4cca:: with SMTP id n10mr8855131pgt.323.1597640496682; 
 Sun, 16 Aug 2020 22:01:36 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id e23sm15312124pgb.79.2020.08.16.22.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 22:01:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 17 Aug 2020 14:01:30 +0900
Message-Id: <20200817050130.3504967-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7XHC-00GnKk-QY
Subject: [f2fs-dev] [PATCH] sload.f2fs: handle root mount point properly
 when setting file attribute
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Need to remove "/" of mount point name from the file path name
when mount point is "/". Otherwise, we will transfer file path
name whose first two characters are like "//" to fs_config function.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/sload.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fsck/sload.c b/fsck/sload.c
index 59ba4a6..14012fb 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -104,10 +104,18 @@ static int set_perms_and_caps(struct dentry *de)
 	uint64_t capabilities = 0;
 	unsigned int uid = 0, gid = 0, imode = 0;
 	char *mnt_path = NULL;
+	char *mount_path = c.mount_point;
 
-	if (asprintf(&mnt_path, "%s%s", c.mount_point, de->path) <= 0) {
+	/*
+	 * de->path already has "/" in the beginning of it.
+	 * Need to remove "/" when c.mount_point is "/", not to add it twice.
+	 */
+	if (strlen(c.mount_point) == 1 && c.mount_point[0] == '/')
+		mount_path = "";
+
+	if (asprintf(&mnt_path, "%s%s", mount_path, de->path) <= 0) {
 		ERR_MSG("cannot allocate mount path for %s%s\n",
-				c.mount_point, de->path);
+				mount_path, de->path);
 		return -ENOMEM;
 	}
 
-- 
2.28.0.220.ged08abb693-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
