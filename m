Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7AA3170F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 22:01:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thxO3-0006Ig-ES;
	Tue, 11 Feb 2025 21:01:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1thxO2-0006IX-7E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 21:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSO/NxqClVs5ZsqI5FUpfrS6V2mkA+AOMOEifDnTcYo=; b=GRmLNfPFOwzKkmzGsvD5+CTQA2
 VrgZPb39CBg+xIsYQe1AQrMtJBqD6MJL9Ltm7X+MRf/vHwL7/tq+Cocwl+/6GAwzPDguqd/LW5w6f
 8pngY1Zq3IsGqGIsgi+J0FgORfrZ0euOGmCiKQZB2lE4h2K7tcbdghRFlZMZZwmy4TUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LSO/NxqClVs5ZsqI5FUpfrS6V2mkA+AOMOEifDnTcYo=; b=CrOhDVKrdsE7kgAa/3fDSX5zXs
 hDWNjjKL9wwQ5Xa16ve2Xd5wLt+qjCYkLpoQaeUqUdnIgZeMFEpErBkDDsZQ3NAE24nRSEE+tamfQ
 daAMedLS8eO8l1YGyBWG1DKhH53q7DyC9qSX3Ysy9gWM+7pdS3ig1o5zKCaPWouDidZ0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thxO0-0007s2-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 21:01:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D28465C568C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Feb 2025 21:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21517C4CEE2;
 Tue, 11 Feb 2025 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739307690;
 bh=7ENrsxZCb1v/nR1J+z542z4RtAWTmp/RpcQGnsS6tmw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=oe1zODavpuNX9trvjHkWuqrqnrKA9JeckKnVHt5ZuVsgyl/qmIDTM9Ld0f7kcC/6x
 +nf3sYBLbu7nG8S8iPwyT3LMU7BaX2Fbmtzopl2nRvrxOh6Qg8GA6yIrytpnVkEyCo
 ++eZcRD1mZQArOlxmcziL8W5MTdC2fTMHKzr0l3DMbrWxAjfKV9KkdLiK3VOqdR0DM
 gRZkMwYvRkUiPNFxo0KY+Th2lsF8gGRv8ZyzYtFNUzAF3n4Ef3FLFiR2iDubtVBRL2
 QON4aKUcOtDQk7Vpp6nXyl+am9uNyMOG2YDG/qfITJnWPR9dCmyKJEVosouc3oniB5
 M32cRHims25zw==
Date: Tue, 11 Feb 2025 21:01:28 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Z6u6qN2ATQKlfmRQ@google.com>
References: <20250205214014.3270585-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205214014.3270585-1-jaegeuk@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds an ioctl to give a per-file priority hint
 to attach REQ_PRIO. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/data.c
 | 6 ++++++ fs/f2fs/f2fs.h | 1 + fs/f2fs/file.c | 20 ++++++++++++++++++++
 include/uapi/linux/f2fs.h | 7 +++++++ 4 files changed, 34 in [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thxO0-0007s2-PK
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add ioctl to get IO priority hint
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds an ioctl to give a per-file priority hint to attach
REQ_PRIO.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c            |  6 ++++++
 fs/f2fs/f2fs.h            |  1 +
 fs/f2fs/file.c            | 20 ++++++++++++++++++++
 include/uapi/linux/f2fs.h |  7 +++++++
 4 files changed, 34 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 07b46b444d31..24c5cb1f5ada 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -413,6 +413,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
 	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
+	struct folio *fio_folio = page_folio(fio->page);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -438,6 +439,11 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 		op_flags |= REQ_META;
 	if (BIT(fio->temp) & fua_flag)
 		op_flags |= REQ_FUA;
+
+	if (fio->type == DATA &&
+	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
+		op_flags |= REQ_PRIO;
+
 	return op_flags;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 493dda2d4b66..395f9d37449c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -830,6 +830,7 @@ struct f2fs_inode_info {
 
 	/* Use below internally in f2fs*/
 	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
+	unsigned int ioprio_hint;	/* hint for IO priority */
 	struct f2fs_rwsem i_sem;	/* protect fi info */
 	atomic_t dirty_pages;		/* # of dirty pages */
 	f2fs_hash_t chash;		/* hash value of given file name */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f92a9fba9991..a92c347841e6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3446,6 +3446,23 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
 			(u32 __user *)arg);
 }
 
+static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	__u32 level;
+
+	if (get_user(level, (__u32 __user *)arg))
+		return -EFAULT;
+
+	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
+		return -EINVAL;
+
+	inode_lock(inode);
+	F2FS_I(inode)->ioprio_hint = level;
+	inode_unlock(inode);
+	return 0;
+}
+
 int f2fs_precache_extents(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -4547,6 +4564,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_compress_file(filp);
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
 		return f2fs_ioc_get_dev_alias_file(filp, arg);
+	case F2FS_IOC_IO_PRIO:
+		return f2fs_ioc_io_prio(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -5261,6 +5280,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_DECOMPRESS_FILE:
 	case F2FS_IOC_COMPRESS_FILE:
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
+	case F2FS_IOC_IO_PRIO:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index f7aaf8d23e20..795e26258355 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -44,6 +44,7 @@
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
+#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -63,6 +64,12 @@
 #define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
 #define F2FS_TRIM_FILE_MASK		0x3
 
+/* for F2FS_IOC_IO_PRIO */
+enum {
+	F2FS_IOPRIO_WRITE = 1,	/* high write priority */
+	F2FS_IOPRIO_MAX,
+};
+
 struct f2fs_gc_range {
 	__u32 sync;
 	__u64 start;
-- 
2.48.1.601.g30ceb7b040-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
