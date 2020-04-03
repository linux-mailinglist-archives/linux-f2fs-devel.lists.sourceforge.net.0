Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD919DAFB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Apr 2020 18:13:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jKOwN-0005KU-LM; Fri, 03 Apr 2020 16:13:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jKOwL-0005KG-V7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Apr 2020 16:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q9vRJCf1NUuqDHroaFWx6fK5OIt8p3pdY0QOoVEG2NI=; b=jy84altlRolHHZt4uEm3mZ5Ykx
 Q2lu+4YnuXWV6VvokHg3oCkSYCoS2RTwFbOXkzvfaPKutQIJGoGnqL9EPsOx28uSCL5dw+WhVCKfJ
 5Ybbcsyi7m3LRtluJ6T6v5uFWAvkDnhecubI/oq+jGYXxuJiY2v0NgXiUlkKup6kgPXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q9vRJCf1NUuqDHroaFWx6fK5OIt8p3pdY0QOoVEG2NI=; b=O
 TczP0boADgDBi4E/NqcYI40fOelyztaJuTGWpvQ1wls/U5i8wGyzt4lkfaQGYiT9L1E+inFJ6brQf
 7NISBFL3poUnGe7aM+PB/8lOtn55IIeLMqRpHBB3zJugQ5AQ8UTwn2iZ/SyHQQrsvPX5VnGoXrnEj
 5rFxjjVDmgr0JplE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jKOwH-006AqX-C3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Apr 2020 16:13:05 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D393F206E9;
 Fri,  3 Apr 2020 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585930370;
 bh=0k2MhVAl7BfiHRcLT496jYlNBJ3HTTEz9j9hPiMYFu4=;
 h=From:To:Cc:Subject:Date:From;
 b=v5W9SOGUTZRjhj1LvnBeuvc7Je6tfQDhZnT8Lag2PH7J16OJGPh2vofcMXqdr9gfw
 JTg67RLcDGRWoWivsuCX3pjKSHDGp6Vp9pSjAqnSMIASWu5e2A8ivF70H3oPVJAESe
 11V11fRWdFwrPIpuLioi8/n0AFjuddbdB8ACSHaQ=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  3 Apr 2020 09:12:49 -0700
Message-Id: <20200403161249.68385-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
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
X-Headers-End: 1jKOwH-006AqX-C3
Subject: [f2fs-dev] [PATCH] f2fs: introduce sysfs/data_io_flag to attach
 REQ_META/FUA
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

This patch introduces a way to attach REQ_META/FUA explicitly
to all the data writes given temperature.

-> attach REQ_FUA to Hot Data writes

-> attach REQ_FUA to Hot|Warm Data writes

-> attach REQ_FUA to Hot|Warm|Cold Data writes

-> attach REQ_FUA to Hot|Warm|Cold Data writes as well as
          REQ_META to Hot Data writes

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
 fs/f2fs/data.c                          | 23 +++++++++++++++++++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/sysfs.c                         |  3 ++-
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bd8a0d19abe67..c8620ea7022a7 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -323,3 +323,12 @@ What:		/sys/fs/f2fs/<disk>/mounted_time_sec
 Date:		February 2020
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Show the mounted time in secs of this partition.
+
+What:		/sys/fs/f2fs/<disk>/data_io_flag
+Date:		April 2020
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Give a way to attach REQ_META|FUA to data writes
+		given temperature-based bits. Now the bits indicate:
+		*      REQ_META     |      REQ_FUA      |
+		*    5 |    4 |   3 |    2 |    1 |   0 |
+		* Cold | Warm | Hot | Cold | Warm | Hot |
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0a829a89f596f..358c5f0bd6346 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -513,6 +513,28 @@ void f2fs_submit_bio(struct f2fs_sb_info *sbi,
 	__submit_bio(sbi, bio, type);
 }
 
+static void __attach_data_io_flag(struct f2fs_io_info *fio)
+{
+	struct f2fs_sb_info *sbi = fio->sbi;
+	unsigned int temp_mask = (1 << NR_TEMP_TYPE) - 1;
+	unsigned int fua_flag = sbi->data_io_flag & temp_mask;
+	unsigned int meta_flag = (sbi->data_io_flag >> NR_TEMP_TYPE) &
+								temp_mask;
+	/*
+	 * data io flag bits per temp:
+	 *      REQ_META     |      REQ_FUA      |
+	 *    5 |    4 |   3 |    2 |    1 |   0 |
+	 * Cold | Warm | Hot | Cold | Warm | Hot |
+	 */
+	if (fio->type != DATA)
+		return;
+
+	if ((1 << fio->temp) & meta_flag)
+		fio->op_flags |= REQ_META;
+	if ((1 << fio->temp) & fua_flag)
+		fio->op_flags |= REQ_FUA;
+}
+
 static void __submit_merged_bio(struct f2fs_bio_info *io)
 {
 	struct f2fs_io_info *fio = &io->fio;
@@ -520,6 +542,7 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 	if (!io->bio)
 		return;
 
+	__attach_data_io_flag(fio);
 	bio_set_op_attrs(io->bio, fio->op, fio->op_flags);
 
 	if (is_read_io(fio->op))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index da069d051982f..be02a5cadd944 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1510,6 +1510,9 @@ struct f2fs_sb_info {
 	unsigned long long write_iostat[NR_IO_TYPE];
 	bool iostat_enable;
 
+	/* to attach REQ_META|REQ_FUA flags */
+	unsigned int data_io_flag;
+
 	/* For sysfs suppport */
 	struct kobject s_kobj;
 	struct completion s_kobj_unregister;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index cb81680d18f7e..d58935eed2cf7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -373,7 +373,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
 		if (!sbi->iostat_enable)
@@ -544,6 +543,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
 F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
@@ -623,6 +623,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(inject_rate),
 	ATTR_LIST(inject_type),
 #endif
+	ATTR_LIST(data_io_flag),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
 	ATTR_LIST(unusable),
-- 
2.26.0.292.g33ef6b2f38-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
