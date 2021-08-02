Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F10093DDECE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Aug 2021 19:57:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAcBq-0007Ef-9j; Mon, 02 Aug 2021 17:57:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mAcBo-0007EJ-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 17:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M9G8JzICaKhOIQKYB1stO7E6NOffIRapfvpTskd0JmQ=; b=EBuO6AKzCojHe3FOiRJpnjApDO
 Jb28wXpAt3q5VSCANT8CoQTaPiqe2qBTUNgv9x6dFp/0RPFon8hMRm9lkMLs7vHkht8poDitNs0kt
 z9siFOf/t4ZXhgtM3BYBxg1XnhhIf8+ChLpXvgc4axRetxrK9nexML6u8A6xRMzsK3/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M9G8JzICaKhOIQKYB1stO7E6NOffIRapfvpTskd0JmQ=; b=J
 6FcEhCEKeQB9ygL31sE06cDwLMxwU35hAEIWyHpR1AYGh5VZjTBZwyn52H+LZZR4Nddx0BjvMdZd1
 vvNRJ+k4a4h9+hZvqILG7uqHRPNdOzoNi3cRCmLEQv5GeM09OAWkGKkxSFkiFGoRSy4gFh9Kkv+86
 lb4qvUVcoxU5llls=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mAcBe-000386-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 17:57:24 +0000
Received: by mail-pl1-f176.google.com with SMTP id e5so20532214pld.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Aug 2021 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M9G8JzICaKhOIQKYB1stO7E6NOffIRapfvpTskd0JmQ=;
 b=Wvg9ciHFnot43pvkGsJcAK7YeD5LZX1/8lUaTFW3lOyAzlZci0ZA7ZmOHS+7jRnTeD
 /tKVAP/uX1k0BSPrLuYE4LTtNzagJ5nDiwAeDAqSqA6YM0AYeNSiY+McV55AQ9vn9sKO
 FpCEK4AaXDhEXoRjiUUgTEIC80T9SJ3pzeYadbHzc8OaLoYhAfEihHqnLW4QnT+BhdjA
 1pxR4roNV3sUFieuYryat5F/7bn/ny8CcCqsPN7xjDxgeKyhQCUDi1JA4iFUmlvb6Xng
 PGrUMcQj7fy99zsIf2+CRxFkndnI49HytsoIHR3aNqlql1RyZkzXEWfe63ptyqhFhZp6
 mVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M9G8JzICaKhOIQKYB1stO7E6NOffIRapfvpTskd0JmQ=;
 b=VbY+xCWNPvfwFRpflYdD2SYpmceG0Fvp4HBuIWyueAUdDjtxsIvSJ2U6PzE0DNeTkC
 4sBjbSfrvVRE3K+S2PGDJrARQdJfyM2mj9/b4uf+HPfWkjT5qvTyQUiClaG7p8zUO7Tc
 DOCVIz4M970JBx1M5s+EO21ajKRAEfBpaZGl1Bz0TsJPlp7fxoi8IIS7bEAU/CGT2Hje
 bamfWyuogCOFiYPoc48LpAPswKPuNlM5d4YDDB79TLhkTQSZwrSS0OYfjhnIV19SMpBR
 BlrNHKc+Xt12I8StEU93TqfJPWzjN6MkL/ut5d/+/jBaF7WjDy3UIPxgUqpnVtCChJ65
 rUXQ==
X-Gm-Message-State: AOAM5302svmt9Fal25GbudjNXHtVo9b+zJ4+JRxmuyX69RGgPR4I2pFx
 a3iMaJRIjYnhGrMl+hOTcZs=
X-Google-Smtp-Source: ABdhPJyxqTC+kcrrT8YujMAySxnrfR7VbyRM/wx+GWtOvcNRRyZ847ofGQUr+B5vudYLuQCPf2yyyg==
X-Received: by 2002:a17:90a:a389:: with SMTP id x9mr74285pjp.167.1627927028808; 
 Mon, 02 Aug 2021 10:57:08 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:415b:68b1:20fb:3589])
 by smtp.gmail.com with ESMTPSA id ci23sm11223283pjb.47.2021.08.02.10.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 10:57:08 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  2 Aug 2021 10:57:03 -0700
Message-Id: <20210802175703.895964-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAcBe-000386-Cq
Subject: [f2fs-dev] [PATCH v2] f2fs: add sysfs node to control ra_pages for
 fadvise seq file
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

fadvise() allows the user to expand the readahead window to double with
POSIX_FADV_SEQUENTIAL, now. But, in some use cases, it is not that
sufficient and we need to meet the need in a restricted way. We can
control the multiplier value of bdi device readahead between 2 (default)
and 256 for POSIX_FADV_SEQUENTIAL advise option.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

---
v2: fix minor style issues
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++++
 fs/f2fs/f2fs.h                          |  2 ++
 fs/f2fs/file.c                          | 30 +++++++++++++++++++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 13 +++++++++++
 5 files changed, 52 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 845c4be535b0..73211f77d11e 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -507,3 +507,9 @@ Date:		July 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	You can control for which gc mode the "gc_reclaimed_segments" node shows.
 		Refer to the description of the modes in "gc_reclaimed_segments".
+
+What:		/sys/fs/f2fs/<disk>/seq_file_ra_mul
+Date:		July 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	You can	control the multiplier value of	bdi device readahead window size
+		between 2 (default) and 256 for POSIX_FADV_SEQUENTIAL advise option.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8459b6d5a2f8..5d16486feb8f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1738,6 +1738,8 @@ struct f2fs_sb_info {
 	unsigned int gc_segment_mode;		/* GC state for reclaimed segments */
 	unsigned int gc_reclaimed_segs[MAX_GC_MODE];	/* Reclaimed segs for each mode */
 
+	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b1cb5b50faac..1a631e6d3e9b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -23,6 +23,7 @@
 #include <linux/nls.h>
 #include <linux/sched/signal.h>
 #include <linux/fileattr.h>
+#include <linux/fadvise.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -4332,6 +4333,34 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	return ret;
 }
 
+static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
+		int advice)
+{
+	struct inode *inode;
+	struct address_space *mapping;
+	struct backing_dev_info *bdi;
+
+	if (advice == POSIX_FADV_SEQUENTIAL) {
+		inode = file_inode(filp);
+		if (S_ISFIFO(inode->i_mode))
+			return -ESPIPE;
+
+		mapping = filp->f_mapping;
+		if (!mapping || len < 0)
+			return -EINVAL;
+
+		bdi = inode_to_bdi(mapping->host);
+		filp->f_ra.ra_pages = bdi->ra_pages *
+			F2FS_I_SB(inode)->seq_file_ra_mul;
+		spin_lock(&filp->f_lock);
+		filp->f_mode &= ~FMODE_RANDOM;
+		spin_unlock(&filp->f_lock);
+		return 0;
+	}
+
+	return generic_fadvise(filp, offset, len, advice);
+}
+
 #ifdef CONFIG_COMPAT
 struct compat_f2fs_gc_range {
 	u32 sync;
@@ -4460,4 +4489,5 @@ const struct file_operations f2fs_file_operations = {
 #endif
 	.splice_read	= generic_file_splice_read,
 	.splice_write	= iter_file_splice_write,
+	.fadvise	= f2fs_file_fadvise,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 72eb9d70969f..41765e90caa2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3422,6 +3422,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
 	sbi->migration_granularity = sbi->segs_per_sec;
+	sbi->seq_file_ra_mul = 2;
 
 	sbi->dir_level = DEF_DIR_LEVEL;
 	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b1725620c07d..44b086e5b607 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -50,6 +50,9 @@ struct f2fs_attr {
 	int id;
 };
 
+#define MIN_RA_MUL	2
+#define MAX_RA_MUL	256
+
 static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			     struct f2fs_sb_info *sbi, char *buf);
 
@@ -538,6 +541,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "seq_file_ra_mul")) {
+		if (t >= MIN_RA_MUL && t <= MAX_RA_MUL)
+			sbi->seq_file_ra_mul = t;
+		else
+			return -EINVAL;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -763,6 +774,7 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
 
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
 
@@ -838,6 +850,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(atgc_candidate_count),
 	ATTR_LIST(atgc_age_weight),
 	ATTR_LIST(atgc_age_threshold),
+	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
 	NULL,
-- 
2.32.0.554.ge1b32706d8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
