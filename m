Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 388AA1CA234
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 06:25:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWuZg-0007iV-E0; Fri, 08 May 2020 04:25:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jWuZe-0007iL-Qh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 04:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3aPnXPt7XxoOAHSRq3riNhrJBZ4cY0JvXvcscvwLua8=; b=DzpkQCexylt3PooNXKPufSHYYg
 FzFGGcepxFNkNvyNQCHWvf6gwHPOgs28nyuTZ2UaM+RjxHRUqWUYHaBQYW1QJHmAo5GR7V21wSGOo
 kwzA9FCBJ/C+7ysqTMrG64CbE1etng7ILq+HuDDHveZ8c2J9sGA7MEEbGkrMj9QxzX6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3aPnXPt7XxoOAHSRq3riNhrJBZ4cY0JvXvcscvwLua8=; b=h
 WEz0IQC1+Emn92RLGpqbrl+HfDWSgdzeLulMlQGWJPcdde6XG01Nba+lgFzouPQf76XDXWua1DwLT
 Wd1NddCv19FEAvcC9ts2/pXPVgBkR2oKFnPi9/iVfSNhkrSed5cUTiiI4mx9ba18JIfyXsfEftqn5
 yvcos5B+mp1FBwZU=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWuZZ-00F4vd-Us
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 04:25:21 +0000
Received: by mail-pf1-f193.google.com with SMTP id x2so287199pfx.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 May 2020 21:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3aPnXPt7XxoOAHSRq3riNhrJBZ4cY0JvXvcscvwLua8=;
 b=nT9AD4rnnixH0pJCyI1upyTuO3RTv/BWEt+OtPQw30nektDuqQ1H8zs8QNGUXzr+T6
 1irv0mLDdiNQqwPQPDepfsedknij6dLNPxTUFvk2sFkD6fQKS0XCA9oKSJF4TtPEolfX
 lhF/7CwgnKGcMyoe94rzkaCW2ED00oBxcWyKp9AQLOoy9Hin3mxd6OaFBraTAA1smQF+
 +wDNd9ii3FzlZXat1mDn3z7YBb8n1K0c9FSDdeILwIRDx0se8Oy7DvgUhOVtQQYa8XI0
 fykTjH9q7e5kY+oZ/dJqC2YVniUiVHuauEnjfmKDVMy6CMBZHSWP6ath2dRTuSBzaXz9
 9QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3aPnXPt7XxoOAHSRq3riNhrJBZ4cY0JvXvcscvwLua8=;
 b=T4W7LpOK8e0OI827qh8FvQ0Hj8nf9tORlbKXxjU5X74oHgE4V7hiMGf0XudR61QIj+
 Dp9dE4QEAXC6Briet1JTFnh2r1tNS3lD7QMn1opL+hd3e7EdQB9L2DsHZX42PbIRHK9X
 m9rAznqSOQB5f4v+o6MnmnB2w/QCDfVqyvZCtC0B4e+Zg/YO4B9FTsGmqaNm16U27RCq
 vpzYQSjkaCZS1rbrNpD2aTNZRCm6zHF0cDx64hlpR9ExUsyr5gbq4NSW8Fs+NI+SakQm
 HOStJtOAS6YkmYL3dlqqQOVrLR33mQqFySnTiUmCQ9X6wiyQ08Z4o0rl+kgJplEOfLkh
 FO3A==
X-Gm-Message-State: AGi0PuaSFp+kZ7Pie1OAyR8ZxKFUOZugyrqbxkdQ/dsFwwj0ZD1/8eUV
 ++NLrR0Y5tjiwybDVM3/1qw=
X-Google-Smtp-Source: APiQypLiVh2QiACIvK/iHw1HS29FOo73ZluYIhU0mxCSLQWlmpE4+h+bOhtKuKQF/zjKcZvO5mzyNg==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr561018pgh.6.1588911912044;
 Thu, 07 May 2020 21:25:12 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id j5sm348964pfh.58.2020.05.07.21.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:25:11 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  8 May 2020 13:25:06 +0900
Message-Id: <20200508042506.143395-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jWuZZ-00F4vd-Us
Subject: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing cblocks
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

Now, if writing pages and releasing compress blocks occur
simultaneously, and releasing cblocks is executed more than one time
to a file, then total block count of filesystem and block count of the
file could be incorrect and damaged.

We have to execute releasing compress blocks only one time for a file
without being interfered by writepages path.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4aab4b42d8ba..a92bc51b9b28 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3488,6 +3488,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int released_blocks = 0;
 	int ret;
+	int writecount;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3509,13 +3510,29 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
-	if (!IS_IMMUTABLE(inode)) {
-		F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
-		f2fs_set_inode_flags(inode);
-		inode->i_ctime = current_time(inode);
-		f2fs_mark_inode_dirty_sync(inode, true);
+	writecount = atomic_read(&inode->i_writecount);
+	if ((filp->f_mode & FMODE_WRITE && writecount != 1) || writecount) {
+		ret = -EBUSY;
+		goto out;
 	}
 
+	if (IS_IMMUTABLE(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
+	if (ret)
+		goto out;
+
+	if (!F2FS_I(inode)->i_compr_blocks)
+		goto out;
+
+	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
+	f2fs_set_inode_flags(inode);
+	inode->i_ctime = current_time(inode);
+	f2fs_mark_inode_dirty_sync(inode, true);
+
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	down_write(&F2FS_I(inode)->i_mmap_sem);
 
@@ -3554,9 +3571,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	up_write(&F2FS_I(inode)->i_mmap_sem);
-
-	inode_unlock(inode);
 out:
+	inode_unlock(inode);
+
 	mnt_drop_write_file(filp);
 
 	if (ret >= 0) {
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
