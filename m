Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68716536852
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 May 2022 23:00:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nuh4D-0003qK-LV; Fri, 27 May 2022 21:00:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nuh4B-0003qE-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 21:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CRtsOhUzK+QPvz8tD7DDQWOiRL0GGjLeyermSKfv5dA=; b=d/J1RMg7TmNw6YfhXk5xW2viJP
 r0d9B6L0631AuUEmGAyLXZXdg3LA/LUvOp3G3tmHXhuYp0bRGmZO0azumRBLiAuINlz2GpcmQ7YVz
 EOCWs7uvq1VMfvK3I/+IE/kQZSVX+KWCO/LWVRaqP/frLYq2fp2RFUhWYStiTVOETTp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CRtsOhUzK+QPvz8tD7DDQWOiRL0GGjLeyermSKfv5dA=; b=U
 mPMNtde4C/1t8IqoFYCqJm0t7/UnXSP5yvZP8gU0j1BaWjn5GWLZQTPVuRERRLbZrAQhw8gAPQvIM
 JssNcxGE6/cRL2rqepOP/TddiTrCLu8tvelvAtoYrO25Q8rLtcL8A6rzowHu4eHeMzfKEJySFhUtV
 AjR6DTLbVCxUauXs=;
Received: from [139.178.84.217] (helo=dfw.source.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nuh42-0007Fr-S9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 21:00:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF1F261EC7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 May 2022 20:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DD9C385A9;
 Fri, 27 May 2022 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653685197;
 bh=MDqqGVbDkvLFjWALykBKBuv+PMCdMSdg2DK72WK9VJU=;
 h=From:To:Cc:Subject:Date:From;
 b=KqdOYSY2TbWmubOijgv+Em8VTLv8NDYtL0NxcaC2BZNJzW7AaH4QtFBKfS6H+cQpA
 UKyB7lyedKOc+n1pZ/Bk8sJMYIwCk0PrvJ02HSkZlDHO1Dmr5H9F5fsMBriq5uT950
 Hvx+O3vRkcPY2EDi7FPwQngizZU0xN8fB5y7UWgbXd8Xu1v2JV0CqifC4v1gD7zfAf
 T5VFuXwz1y0xTWlHBAQpDP5GRdt1zIFHgCjXRdToOa6vG48SDXSJ/1uLJ0VDSSrJRj
 FJglCYHIOo0g0FE1eHWMgXVh4BFa8yo7SgU8walhm8V0T24QyaSVWKUv6DNn5Cmm7B
 0ThTJDNT/OgAQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 27 May 2022 13:59:55 -0700
Message-Id: <20220527205955.3251982-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -4.7 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Some UFS storage gives slower performance on FUA than
 write+cache_flush.
 Let's give a way to manage it. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++ fs/f2fs/data.c |
 2 ++ fs/f2fs/f2fs.h | 1 + fs/f2fs/sysfs.c | 2 ++ 4 files changed, 12 insertions
 [...] Content analysis details:   (-4.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nuh42-0007Fr-S9
Subject: [f2fs-dev] [PATCH] f2fs: add sysfs entry to avoid FUA
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

Some UFS storage gives slower performance on FUA than write+cache_flush.
Let's give a way to manage it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++
 fs/f2fs/data.c                          | 2 ++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9b583dd0298b..cd96b09d7182 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -434,6 +434,7 @@ Date:		April 2020
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Give a way to change iostat_period time. 3secs by default.
 		The new iostat trace gives stats gap given the period.
+
 What:		/sys/fs/f2fs/<disk>/max_io_bytes
 Date:		December 2020
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
@@ -442,6 +443,12 @@ Description:	This gives a control to limit the bio size in f2fs.
 		whereas, if it has a certain bytes value, f2fs won't submit a
 		bio larger than that size.
 
+What:		/sys/fs/f2fs/<disk>/no_fua_dio
+Date:		May 2022
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	This gives a signal to iomap, which should not use FUA for
+		direct IOs. Default: 0.
+
 What:		/sys/fs/f2fs/<disk>/stat/sb_status
 Date:		December 2020
 Contact:	"Chao Yu" <yuchao0@huawei.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f5f2b7233982..23486486eab2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4153,6 +4153,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if ((inode->i_state & I_DIRTY_DATASYNC) ||
 	    offset + length > i_size_read(inode))
 		iomap->flags |= IOMAP_F_DIRTY;
+	if (F2FS_I_SB(inode)->no_fua_dio)
+		iomap->flags |= IOMAP_F_DIRTY;
 
 	return 0;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e10838879538..c2400ea0080b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1671,6 +1671,7 @@ struct f2fs_sb_info {
 	int dir_level;				/* directory level */
 	int readdir_ra;				/* readahead inode in readdir */
 	u64 max_io_bytes;			/* max io bytes to merge IOs */
+	int no_fua_dio;				/* avoid FUA in DIO */
 
 	block_t user_block_count;		/* # of user blocks */
 	block_t total_valid_block_count;	/* # of valid blocks */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 4c50aedd5144..24d628ca92cc 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -771,6 +771,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
 #endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, no_fua_dio, no_fua_dio);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
@@ -890,6 +891,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 	ATTR_LIST(readdir_ra),
 	ATTR_LIST(max_io_bytes),
+	ATTR_LIST(no_fua_dio),
 	ATTR_LIST(gc_pin_file_thresh),
 	ATTR_LIST(extension_list),
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
