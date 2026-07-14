Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y4N5MM+lVmqU/gAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 23:10:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF3758E27
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 23:10:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=c8R+XPTy;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=WRCyz22N;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=dM4ZnRAk;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ZtihMZIc;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqlx7+qSSDerjE/9rtyf008ElsP5NJsFoFT6RWZdL5g=; b=c8R+XPTy9Wn9fYeXXCWqsxRDF6
	z9sqqXlPuFJJQDgrpEE6CdH6CspOp1GNDimvPcPP4OAe4/vNT2rnK0tpJPjnl/7UD7ATxtnODsXju
	fndtqD0skz/70ojCvG8o2EiLYFYFjfRt3a2zwMNeeIyYN/YBjNNnRyV7cqEuRrEp4GbQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjkOb-0007oz-Hw;
	Tue, 14 Jul 2026 21:10:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1wjkOG-0007of-Bp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 21:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=be6DrEWvPa6kK/0Bi2TniGp6w6cr2kXmMjxcnQdvtQI=; b=WRCyz22NhDkTZUcZqsFZyVgnUZ
 uC8Bmg1nKoSqarcE31xZHqUrto39kX3IKmWxNZBM6t2XlPk96Ku53fxUwV/wqWC2RN1rQMw5M1QEs
 /+9m4h/kmSTEqC2AeQbgkcSz3Y4ycLdB63qDX8ON/3AU9zNL3aP6OPgj4L5iQ8scKOW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=be6DrEWvPa6kK/0Bi2TniGp6w6cr2kXmMjxcnQdvtQI=; b=dM4ZnRAkoShHQnVKBIMRMGX+Vm
 rfeDpQu5t7IuHubHi5r3+nkWZJmQS8PHAAg3o5BjwIPaHO6vVi8GnlpFijJHwDU4qxmAG/Jm5QFEa
 EyEnJTj2nhXOHYswv+FqKZJu+FbMR8F6opP8Sl6Gn2TSd5AxajndXK4uwhg3i3Bngsr0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjkOD-0007xd-94 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 21:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B910B43741;
 Tue, 14 Jul 2026 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A3A1F000E9;
 Tue, 14 Jul 2026 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784063399;
 bh=be6DrEWvPa6kK/0Bi2TniGp6w6cr2kXmMjxcnQdvtQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZtihMZIcpfKz1Lwu6hNVxt52R9gEJsvFCje+8P9ba1jEfmxJJBG2sxKQF2oEA7fsG
 pGc/Wf3v9z2avwKy0DQ+TFwIIJQBEEh6mvxu6m+wEk+76ngw2bCcKbCBR1cS94rA2h
 YLO8QIEzBi7rl6m0Chu7VUtiAjf+dtFgcUSGyCVyhZAK7H+zO2uOCRKBIHV1Q9jwbM
 +L6Hctr12fMFVSS0pDSL04cPVqWIetfdwYgar8qD1FsUgo2WUhgvNHF4uUCU62K8xQ
 2fXsnPpP1HdkROUKHyoFD+ed2FbGrbjeMdAx3hzoo2RDo8l9oJvAZSxB3n+Lhc2GnS
 VzkzzylqNBuxg==
Date: Tue, 14 Jul 2026 15:09:57 -0600
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <alalpRYxjqtdJhVR@kbusch-mbp>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710210646.3576365-4-kbusch@meta.com>
 <alTTRoOEglwuf4vg@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alTTRoOEglwuf4vg@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 13, 2026 at 05:00:06AM -0700, Christoph Hellwig
 wrote: > Or maybe using the file attr for this isn't actually a good idea,
 > and we should do an ioctl instead which automatically gets rout [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wjkOD-0007xd-94
Subject: Re: [f2fs-dev] [PATCHv2 3/5] xfs: report direct io attributes
 through file_getattr
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@kernel.org>
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 aalbersh@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[kbusch@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kbusch-mbp:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1FF3758E27

On Mon, Jul 13, 2026 at 05:00:06AM -0700, Christoph Hellwig wrote:
> Or maybe using the file attr for this isn't actually a good idea,
> and we should do an ioctl instead which automatically gets routed to
> the block device fops?

Something like this instead?

---
diff --git a/block/ioctl.c b/block/ioctl.c
index 3d4ea1537457d..6de2f87bcb8bd 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -642,6 +642,21 @@ static int blkdev_bszset(struct file *file, blk_mode_t mode,
 	return ret;
 }
 
+void bdev_dio_align(struct block_device *bdev, struct fs_dio_align *align)
+{
+	align->dio_mem_align = bdev_dma_alignment(bdev) + 1;
+	align->dio_offset_align = bdev_logical_block_size(bdev);
+	align->dio_read_offset_align = bdev_logical_block_size(bdev);
+	align->dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
+	align->dio_offset_align_max_vecs = bdev_max_segments(bdev);
+}
+EXPORT_SYMBOL_GPL(bdev_dio_align);
+
 /*
  * Common commands that are handled the same way on native and compat
  * user space. Note the separate arg/argp parameters that are needed
@@ -690,6 +705,12 @@ static int blkdev_common_ioctl(struct block_device *bdev, blk_mode_t mode,
 		return put_uint(argp, bdev_io_opt(bdev));
 	case BLKALIGNOFF:
 		return put_int(argp, bdev_alignment_offset(bdev));
+	case FS_IOC_GETDIOALIGN: {
+		struct fs_dio_align align = {};
+
+		bdev_dio_align(bdev, &align);
+		return copy_to_user(argp, &align, sizeof(align)) ? -EFAULT : 0;
+	}
 	case BLKDISCARDZEROES:
 		return put_uint(argp, 0);
 	case BLKSECTGET:
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 1b53701bebea1..e980522fa7539 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -49,6 +49,7 @@
 
 #include <linux/mount.h>
 #include <linux/fileattr.h>
+#include <linux/blkdev.h>
 
 /* Return 0 on success or positive error */
 int
@@ -1244,6 +1245,23 @@ xfs_file_ioctl(
 	"%s should use fallocate; XFS_IOC_{ALLOC,FREE}SP ioctl unsupported",
 				current->comm);
 		return -ENOTTY;
+	case FS_IOC_GETDIOALIGN: {
+		struct fs_dio_align	align = {};
+
+		if (!S_ISREG(inode->i_mode))
+			return -ENOTTY;
+		bdev_dio_align(xfs_inode_buftarg(ip)->bt_bdev, &align);
+		if (xfs_is_cow_inode(ip))
+			align.dio_offset_align = xfs_inode_alloc_unitsize(ip);
+		if (copy_to_user(arg, &align, sizeof(align)))
+			return -EFAULT;
+		return 0;
+	}
 	case XFS_IOC_DIOINFO: {
 		struct kstat		st;
 		struct dioattr		da;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 9213a5716f95a..dc32acf696e40 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1607,6 +1607,17 @@ static inline unsigned int bdev_dma_alignment(struct block_device *bdev)
 	return queue_dma_alignment(bdev_get_queue(bdev));
 }
 
+static inline unsigned long bdev_virt_boundary_mask(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.virt_boundary_mask;
+}
+
+static inline unsigned int
+bdev_virt_boundary_alignment(struct block_device *bdev)
+{
+	return bdev_virt_boundary_mask(bdev) + 1;
+}
+
 static inline unsigned int
 blk_lim_dma_alignment_and_pad(struct queue_limits *lim)
 {
@@ -1805,6 +1816,8 @@ int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
 int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
 void bdev_statx(const struct path *path, struct kstat *stat, u32 request_mask);
+struct fs_dio_align;
+void bdev_dio_align(struct block_device *bdev, struct fs_dio_align *align);
 void printk_all_partitions(void);
 int __init early_lookup_bdev(const char *pathname, dev_t *dev);
 #else
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index bd87262f2e349..81b0c81e17282 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -234,6 +234,21 @@ struct file_attr {
 #define FILE_ATTR_SIZE_VER0 24
 #define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
 
+struct fs_dio_align {
+	__u32 dio_mem_align;		/* buffer alignment */
+	__u32 dio_offset_align;		/* write offset alignment */
+	__u32 dio_read_offset_align;	/* read offset alignment */
+	__u32 dio_virt_boundary_align;	/* segment boundary */
+	__u32 dio_offset_align_max_vecs;	/* max vecs per unit */
+	__u32 dio_reserved[3];		/* must be zero */
+};
+
 /*
  * Flags for the fsx_xflags field
  */
@@ -344,6 +359,8 @@ struct file_attr {
 #define FS_IOC_GETFSSYSFSPATH		_IOR(0x15, 1, struct fs_sysfs_path)
 /* Get logical block metadata capability details */
 #define FS_IOC_GETLBMD_CAP		_IOWR(0x15, 2, struct logical_block_metadata_cap)
+/* Get direct I/O alignment and layout constraints */
+#define FS_IOC_GETDIOALIGN		_IOR(0x15, 3, struct fs_dio_align)
 
 /*
  * Inode flags (FS_IOC_GETFLAGS / FS_IOC_SETFLAGS)
--


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
