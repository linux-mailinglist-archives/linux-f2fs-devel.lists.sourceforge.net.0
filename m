Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D268244A47C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 03:13:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkGe2-0000Vr-Ve; Tue, 09 Nov 2021 02:13:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mkGe1-0000Vl-NP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 02:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oEpZZVdL34jzIIsvhO9nLqnMvgXU3JDBEesCaOsx60=; b=E9er8wgto46SMaoQ2Tb2Ft/wBf
 MRGoeWKZDl23cDg6ntk/ZVx/GETFXpjpdZRaFh9UhrsXzH+CVriBZZ434oFAJuj5kRJC+HzKD+3FV
 CwtexP5YF4fVWJ0S1InEa71yn7u6RuIU4W0fwOh15Cm/QyfQlvbhwvpGa3I7zMNEkB2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0oEpZZVdL34jzIIsvhO9nLqnMvgXU3JDBEesCaOsx60=; b=J
 OwIF9VLNJ4h9/9N40ORBk1aEXGysy/S6keYeTEql1FRddKtoa/nHNiyKTDYbW9jPGJkh+WdLzHTqI
 ur3aLseozkuzVFgSDVIxTsF3PtB8szxiuMrFP303Acbq5Mcrg7zYHsgKz6vyMKM5W09PVPSgdHAip
 HiTSPVB4lchnTjbQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkGdv-0003Nz-2T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 02:13:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89EE86117A;
 Tue,  9 Nov 2021 02:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636424017;
 bh=lSc7e7ZAt9bXIp1vfm0B7Qc/M2TOjO8dFI4+XqwsTPM=;
 h=From:To:Cc:Subject:Date:From;
 b=s4vtpJZ+Z6Tm5Xzhi6WmGr8zG/LVwvj7DoGnqzj1AnTzTsmvFWbiyVZIq0UCH9D+W
 AS4WYRTUgwGVXCI2fQSKDgKQcjGu6R0DgF/KNOXrueyvNzX132ew2wR3C3QBA+BqZy
 jRbzUuf/+PaLmTuNi/6IEIpSmWdfDLyexonxZoFO7CnBa56YmW2xWFu6t0L3Pd4kwv
 iBAhCwmdnCc4eN4HPXBuWFCHPTEWDr4QHVZkqFAMn+PWVVvxTtB3m6hn0x888dL/rI
 bKyVlnjUKGpEe6epBJT6PEsvAKFR5OGdaYAwLY/YFjUXUeDmFqNlmKXrSMw4SKWNhS
 mZM54DvuZRJqQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  8 Nov 2021 18:13:36 -0800
Message-Id: <20211109021336.3796538-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a way to attach HIPRI by expanding the
 existing
 sysfs's data_io_flag. User can measure IO performance by enabling it.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Documentation/ABI/testing/sysfs-fs-f2fs
 | 16 +++++++++------- fs/f2fs/data.c | 2 ++ fs/f2fs/f2fs.h | 3 +++ 3 files
 changed, 14 insertions(+), 7 dele [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mkGdv-0003Nz-2T
Subject: [f2fs-dev] [PATCH] f2fs: provide a way to attach HIPRI for Direct IO
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

This patch adds a way to attach HIPRI by expanding the existing sysfs's
data_io_flag. User can measure IO performance by enabling it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 16 +++++++++-------
 fs/f2fs/data.c                          |  2 ++
 fs/f2fs/f2fs.h                          |  3 +++
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index b268e3e18b4a..ac52e1c6bcbc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -369,13 +369,15 @@ Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Give a way to attach REQ_META|FUA to data writes
 		given temperature-based bits. Now the bits indicate:
 
-		+-------------------+-------------------+
-		|      REQ_META     |      REQ_FUA      |
-		+------+------+-----+------+------+-----+
-		|    5 |    4 |   3 |    2 |    1 |   0 |
-		+------+------+-----+------+------+-----+
-		| Cold | Warm | Hot | Cold | Warm | Hot |
-		+------+------+-----+------+------+-----+
+		+------------+-------------------+-------------------+
+		| HIPRI_DIO  |      REQ_META     |      REQ_FUA      |
+		+------------+------+------+-----+------+------+-----+
+		|          6 |    5 |    4 |   3 |    2 |    1 |   0 |
+		+------------+------+------+-----+------+------+-----+
+		|        All | Cold | Warm | Hot | Cold | Warm | Hot |
+		+------------+------+------+-----+------+------+-----+
+
+		Note that, HIPRI_DIO bit is only for direct IO path.
 
 What:		/sys/fs/f2fs/<disk>/node_io_flag
 Date:		June 2020
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9f754aaef558..faa40aca2848 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3707,6 +3707,8 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 		if (do_opu)
 			down_read(&fi->i_gc_rwsem[READ]);
 	}
+	if (sbi->data_io_flag & HIPRI_DIO)
+		iocb->ki_flags |= IOCB_HIPRI;
 
 	err = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
 			iter, rw == WRITE ? get_data_block_dio_write :
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ce9fc9f13000..094f1e8ff82b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1557,6 +1557,9 @@ struct decompress_io_ctx {
 #define MAX_COMPRESS_LOG_SIZE		8
 #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
 
+/* HIPRI for direct IO used in sysfs/data_io_flag */
+#define HIPRI_DIO			(1 << 6)
+
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
 	struct proc_dir_entry *s_proc;		/* proc entry */
-- 
2.34.0.rc0.344.g81b53c2807-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
