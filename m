Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E17021EEE82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 01:50:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgzdO-0002Ik-Mn; Thu, 04 Jun 2020 23:50:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jgzdE-0002HS-Nf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 23:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yKFaCzrhkiL4pCRf1P3Y8zoiGOsXqNhQ//2yKnWwrvU=; b=GN3XuIObPMp9KB8txQs5SckXiG
 Up960e25ZGpCb4IK3dAHHI9+XnmsWXqVUURw0n2KLuZHh0+UnJVJBR4G6+KCOn1qrT2jT9WeH13xf
 MO4pRTPz3Q672CBxs044fzhJHsAdS0S5AQ2q8YYNArDP7UX/AYB6i2VlYaan9iDzvO4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yKFaCzrhkiL4pCRf1P3Y8zoiGOsXqNhQ//2yKnWwrvU=; b=C
 f93mPJ5GZ1/hd2VY1rZ3RuHxy/Q2FI49PAYJcu1FvwDaeCJgtq5bu1x57pK9npzSRMK/UrLZmbt3D
 0EZ7i5nmCi8qXqpkN8+zcUau76I33x0ayQFvK2yST3yMfMaWWeweHOS95UCcIYcGIbzhY+eQZUIqq
 CZhHthT5e3AJo20U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgzd7-00CEfg-K7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 23:50:44 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D72D0206DC;
 Thu,  4 Jun 2020 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591314624;
 bh=ND4kZKs0ckKJG227yGmyY5tVeZis8uDKb/AjmQgSe5E=;
 h=From:To:Cc:Subject:Date:From;
 b=Z82FfCo8VpvMzN+Q5BfD+99zxNEKMEMVSMOucvDn3D7LsKheLfDHM06gKuJgjHBwg
 XdS8gjilKZzAHaOu5oZ5jKNANulbg7C0iUpF16jsULH/JwmO1SIhnfGaxxQCKO9AYA
 JXF0U6CXPd+dnnkGBh3RnFch02RNUqUlURDwr0t0=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  4 Jun 2020 16:50:22 -0700
Message-Id: <20200604235023.1954-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgzd7-00CEfg-K7
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add node_io_flag for bio flags
 likewise data_io_flag
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

This patch adds another way to attach bio flags to node writes.

Description:   Give a way to attach REQ_META|FUA to node writes
               given temperature-based bits. Now the bits indicate:
               *      REQ_META     |      REQ_FUA      |
               *    5 |    4 |   3 |    2 |    1 |   0 |
               * Cold | Warm | Hot | Cold | Warm | Hot |

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  9 ++++++
 fs/f2fs/data.c                          | 39 ++++++++++++++++++-------
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/sysfs.c                         |  2 ++
 4 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 427f5b45c67f1..4bb93a06d8abc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -333,6 +333,15 @@ Description:	Give a way to attach REQ_META|FUA to data writes
 		*    5 |    4 |   3 |    2 |    1 |   0 |
 		* Cold | Warm | Hot | Cold | Warm | Hot |
 
+What:		/sys/fs/f2fs/<disk>/node_io_flag
+Date:		June 2020
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Give a way to attach REQ_META|FUA to node writes
+		given temperature-based bits. Now the bits indicate:
+		*      REQ_META     |      REQ_FUA      |
+		*    5 |    4 |   3 |    2 |    1 |   0 |
+		* Cold | Warm | Hot | Cold | Warm | Hot |
+
 What:		/sys/fs/f2fs/<disk>/iostat_period_ms
 Date:		April 2020
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a65bfc07ddb97..2f5293eb5e52a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -514,26 +514,43 @@ void f2fs_submit_bio(struct f2fs_sb_info *sbi,
 	__submit_bio(sbi, bio, type);
 }
 
-static void __attach_data_io_flag(struct f2fs_io_info *fio)
+static void __attach_io_flag(struct f2fs_io_info *fio)
 {
 	struct f2fs_sb_info *sbi = fio->sbi;
 	unsigned int temp_mask = (1 << NR_TEMP_TYPE) - 1;
-	unsigned int fua_flag = sbi->data_io_flag & temp_mask;
-	unsigned int meta_flag = (sbi->data_io_flag >> NR_TEMP_TYPE) &
-								temp_mask;
+
 	/*
 	 * data io flag bits per temp:
 	 *      REQ_META     |      REQ_FUA      |
 	 *    5 |    4 |   3 |    2 |    1 |   0 |
 	 * Cold | Warm | Hot | Cold | Warm | Hot |
 	 */
-	if (fio->type != DATA)
-		return;
+	if (fio->type == DATA) {
+		unsigned int fua_flag = sbi->data_io_flag & temp_mask;
+		unsigned int meta_flag = (sbi->data_io_flag >> NR_TEMP_TYPE) &
+								temp_mask;
 
-	if ((1 << fio->temp) & meta_flag)
-		fio->op_flags |= REQ_META;
-	if ((1 << fio->temp) & fua_flag)
-		fio->op_flags |= REQ_FUA;
+		if ((1 << fio->temp) & meta_flag)
+			fio->op_flags |= REQ_META;
+		if ((1 << fio->temp) & fua_flag)
+			fio->op_flags |= REQ_FUA;
+	}
+	/*
+	 * node io flag bits per temp:
+	 *      REQ_META     |      REQ_FUA      |
+	 *    5 |    4 |   3 |    2 |    1 |   0 |
+	 * Cold | Warm | Hot | Cold | Warm | Hot |
+	 */
+	if (fio->type == NODE) {
+		unsigned int fua_flag = sbi->node_io_flag & temp_mask;
+		unsigned int meta_flag = (sbi->node_io_flag >> NR_TEMP_TYPE) &
+								temp_mask;
+
+		if ((1 << fio->temp) & meta_flag)
+			fio->op_flags |= REQ_META;
+		if ((1 << fio->temp) & fua_flag)
+			fio->op_flags |= REQ_FUA;
+	}
 }
 
 static void __submit_merged_bio(struct f2fs_bio_info *io)
@@ -543,7 +560,7 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 	if (!io->bio)
 		return;
 
-	__attach_data_io_flag(fio);
+	__attach_io_flag(fio);
 	bio_set_op_attrs(io->bio, fio->op, fio->op_flags);
 
 	if (is_read_io(fio->op))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fb180020e175c..50e6cdf20b733 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1568,6 +1568,7 @@ struct f2fs_sb_info {
 
 	/* to attach REQ_META|REQ_FUA flags */
 	unsigned int data_io_flag;
+	unsigned int node_io_flag;
 
 	/* For sysfs suppport */
 	struct kobject s_kobj;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a117ae1f9d5f1..fc4a46b689040 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -554,6 +554,7 @@ F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
@@ -635,6 +636,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(inject_type),
 #endif
 	ATTR_LIST(data_io_flag),
+	ATTR_LIST(node_io_flag),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
 	ATTR_LIST(unusable),
-- 
2.27.0.278.ge193c7cf3a9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
