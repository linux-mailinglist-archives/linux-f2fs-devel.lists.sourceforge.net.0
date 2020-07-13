Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B121CD8C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2020 05:13:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1juotw-0004wV-2d; Mon, 13 Jul 2020 03:13:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1juotv-0004wO-9j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 03:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=psxzbrOp99J5mngwlPoMiQAT+alHBEBXUBDoOJ1/0T0=; b=gFUmCk4NZLKqCR9vE+JoRiDFGX
 Cm6SH0E0q6I7r7kGDAhZnWSilFVxLZoYNjfGZ4xUv/FRNOTdJWr+1UdrZB49H6wjRia8nj0SkKbrG
 HAtdrrVnBHdwLo59HawXZ9jrmhUETMa2yx2GlJIPMuFdJ77OOZq5FhOG1U34PliEaV+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=psxzbrOp99J5mngwlPoMiQAT+alHBEBXUBDoOJ1/0T0=; b=U
 K189Bunvgxj3ukbtzod7DCcDzST+//0MYrHiEmAIYbOgZLFqks39IUv2ydJr40BdS5PnA1axAQ5jj
 mR+UxYEPwz5Y86k/BJS4Yj1zFxo2tSjLNeOLIM5j6swgGozZNM+Y2XebRAHyOAiso0vGTc2khX5Tz
 PUrUg4c5VcL03AEc=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1juotu-00Fav4-3o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 03:13:07 +0000
Received: by mail-pl1-f196.google.com with SMTP id t6so1732914plo.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Jul 2020 20:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=psxzbrOp99J5mngwlPoMiQAT+alHBEBXUBDoOJ1/0T0=;
 b=bMkxg68pIh+RvX2AC4XXKe6pe1QOex4aB1n7ujCqFRZd69+OnuEEgrE4tbSiQHzr2w
 HUONe3Rz9kqrSbjvW1EW7ygCDQ/aWO1wdWhs3MyPk8wX/x/ejLAIA2GGvf5BPpEdxpUK
 xboFHzonjwMPK3n9xEddAHBnE6DMrvun0X5PBgA59sAi87sum89ri+yl19ri98UFYIrz
 RhmOZAmNgecT2cwN+1+yJWn5QLeyeeBvAe85s+moYqIXda9vTBgiueAIHIYf70nqgLGB
 ABFcbyIbOa6l2P83EU6Ak68QAD2KGHrHF/zaKiPrPHqgGBnSirLubl0ZLyJMl4w+YAVF
 4oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=psxzbrOp99J5mngwlPoMiQAT+alHBEBXUBDoOJ1/0T0=;
 b=Uaxp6dkjTfx8ARe45Y5DQjVR2yA8ZJ1Ngwakp2KzhO66GXET8I0ZKCG/GAJrkxwbsy
 lWcrujBPf6EtT2lATtuqbwRiCeDYqJdInRXxSkboFvAxNuZL9ahoxAsExZ58kBp592nN
 Ld+MbZhb5Aj3oA20u7tczXLBGHBH945OJE3jVfwZyHtt0IbiTbMXuXYMkjT86Mri5CBf
 QZazOmHL/lVIBbhL1dSIYA2drhoncD2jGxi4OnX//fZgTTQgn8wQSidaPV0iZC7M4M9j
 bEfxcqmFfudk0F6QTOjEPmV5psn2zI6AQXfFW7pDaGu8Qg3j8IwZR6cDwRZuQj5ygHRt
 3mHA==
X-Gm-Message-State: AOAM531+Rcl9AAZ5xrtkL6/ZVbEaWGAKpE821tK25TCuY8HS2/MpPMh8
 Y++92lPKy57A7NSA8R5LRto=
X-Google-Smtp-Source: ABdhPJwWlxM5jkFHf6rPbXsTiEijCyx0KGUV3hHGgDVb+KR9EnkUi27lPfgLbJA7ICFZ7bgXL6pYMQ==
X-Received: by 2002:a17:902:b905:: with SMTP id
 bf5mr37221828plb.250.1594609980408; 
 Sun, 12 Jul 2020 20:13:00 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com ([172.30.115.29])
 by smtp.gmail.com with ESMTPSA id cl17sm12635508pjb.50.2020.07.12.20.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 20:12:59 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 13 Jul 2020 12:12:52 +0900
Message-Id: <20200713031252.3873546-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1juotu-00Fav4-3o
Subject: [f2fs-dev] [PATCH v2] f2fs: change the way of handling range.len in
 F2FS_IOC_SEC_TRIM_FILE
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

Changed the way of handling range.len of F2FS_IOC_SEC_TRIM_FILE.
 1. Added -1 value support for range.len to secure trim the whole blocks
    starting from range.start regardless of i_size.
 2. If the end of the range passes over the end of file, it means until
    the end of file (i_size).
 3. ignored the case of that range.len is zero to prevent the function
    from making end_addr zero and triggering different behaviour of
    the function.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
Changes in v2:
 - Changed -1 range.len option to mean the whole blocks starting from
   range.start regardless of i_size
---
 fs/f2fs/file.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 368c80f8e2a1..2485841e3b2d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3792,7 +3792,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	pgoff_t index, pg_end;
 	block_t prev_block = 0, len = 0;
 	loff_t end_addr;
-	bool to_end;
+	bool to_end = false;
 	int ret = 0;
 
 	if (!(filp->f_mode & FMODE_WRITE))
@@ -3813,23 +3813,23 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	file_start_write(filp);
 	inode_lock(inode);
 
-	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
+			range.start >= inode->i_size) {
 		ret = -EINVAL;
 		goto err;
 	}
 
-	if (range.start >= inode->i_size) {
-		ret = -EINVAL;
+	if (range.len == 0)
 		goto err;
-	}
 
-	if (inode->i_size - range.start < range.len) {
-		ret = -E2BIG;
-		goto err;
+	if (inode->i_size - range.start > range.len) {
+		end_addr = range.start + range.len;
+	} else {
+		end_addr = range.len == (u64)-1 ?
+			sbi->sb->s_maxbytes : inode->i_size;
+		to_end = true;
 	}
-	end_addr = range.start + range.len;
 
-	to_end = (end_addr == inode->i_size);
 	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
 			(!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE))) {
 		ret = -EINVAL;
@@ -3846,7 +3846,8 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	down_write(&F2FS_I(inode)->i_mmap_sem);
 
-	ret = filemap_write_and_wait_range(mapping, range.start, end_addr - 1);
+	ret = filemap_write_and_wait_range(mapping, range.start,
+			to_end ? LLONG_MAX : end_addr - 1);
 	if (ret)
 		goto out;
 
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
