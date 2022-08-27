Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F55A3541
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 09:01:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRppD-0002No-Ay;
	Sat, 27 Aug 2022 07:01:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oRppC-0002Nd-R7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czweDp6K79bezM2jycOPV4q8sczNbn8bLryeJVZIjGE=; b=EAK3Tu+RGizh84YJvIfcVee5ZL
 0EOsEe3vSpNoDpK1kHQ6CsXrMPAd7atuWJybaQu0laZiGBjY+eFemOxbkDANLhXPsyn5ctOG2uGzF
 gOUjN1jZnYixrp14MHRfuzLEtT5ud6yIlUA+Jn/x4Z1S+I7vZrBpjUUtJhORv3chGcnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=czweDp6K79bezM2jycOPV4q8sczNbn8bLryeJVZIjGE=; b=Fl0hB9211QOHG0rpsUJZSQPd8f
 Y5AoMa4E/OzIlFE3GwdNbUBQWGl6YiNJ/vhVorx6rJdCEphaCgOD0AlnATKPEUBEhplw02NvCsUTo
 XvUp0hWPh/JLyaxIWSKindSYaqwJPlnO9amY5umjCypGNmAR1KNNmmJQBukFdybjAyj8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRppA-002PRX-B0 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E0D06104E;
 Sat, 27 Aug 2022 07:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E483C433B5;
 Sat, 27 Aug 2022 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661583690;
 bh=999EIC9kZJkekVqVLTcGQG6rSacP6CreHwcuNLapaP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KCIJwHUkmXU6bi1foHzgtpkUzvAeD+VbDPALoi9gBeVxcfN3V16yK8oD1oBm5Q+jt
 JdTMTpXplEBoRDihN7zdti14JfShTbJilcE0cfZk2eEFGdIbyMzTogc3DkY2j+WnE2
 f2B1DRSlsPLcw2qB5BBjgKR8r/D127waNhkPbWfBMMUjGEo9SKODe6SHZDT+KgKbLp
 mWNf68s93CENq//sWiF3ZLaIUmyPDJK8AjjnWfCaQ8wzjxiC7OKXScCFqo5GltwXGI
 ifXdBP8Qx4obXZ0TFX52ez8Tr0MqsMwBsyDQp31fSbcgZNwdt9Qq2xPBXn/yEFguZ3
 yu5uMrn+aC9Rw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 26 Aug 2022 23:58:44 -0700
Message-Id: <20220827065851.135710-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827065851.135710-1-ebiggers@kernel.org>
References: <20220827065851.135710-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Traditionally, the
 conditions for when DIO (direct I/O) is supported were fairly simple. For
 both block devices and regular files, DIO had to be aligned to the logical
 block size of the block device. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRppA-002PRX-B0
Subject: [f2fs-dev] [PATCH v5 1/8] statx: add direct I/O alignment
 information
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
Cc: linux-block@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Traditionally, the conditions for when DIO (direct I/O) is supported
were fairly simple.  For both block devices and regular files, DIO had
to be aligned to the logical block size of the block device.

However, due to filesystem features that have been added over time (e.g.
multi-device support, data journalling, inline data, encryption, verity,
compression, checkpoint disabling, log-structured mode), the conditions
for when DIO is allowed on a regular file have gotten increasingly
complex.  Whether a particular regular file supports DIO, and with what
alignment, can depend on various file attributes and filesystem mount
options, as well as which block device(s) the file's data is located on.

Moreover, the general rule of DIO needing to be aligned to the block
device's logical block size was recently relaxed to allow user buffers
(but not file offsets) aligned to the DMA alignment instead.  See
commit bf8d08532bc1 ("iomap: add support for dma aligned direct-io").

XFS has an ioctl XFS_IOC_DIOINFO that exposes DIO alignment information.
Uplifting this to the VFS is one possibility.  However, as discussed
(https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
this ioctl is rarely used and not known to be used outside of
XFS-specific code.  It was also never intended to indicate when a file
doesn't support DIO at all, nor was it intended for block devices.

Therefore, let's expose this information via statx().  Add the
STATX_DIOALIGN flag and two new statx fields associated with it:

* stx_dio_mem_align: the alignment (in bytes) required for user memory
  buffers for DIO, or 0 if DIO is not supported on the file.

* stx_dio_offset_align: the alignment (in bytes) required for file
  offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
  on the file.  This will only be nonzero if stx_dio_mem_align is
  nonzero, and vice versa.

Note that as with other statx() extensions, if STATX_DIOALIGN isn't set
in the returned statx struct, then these new fields won't be filled in.
This will happen if the file is neither a regular file nor a block
device, or if the file is a regular file and the filesystem doesn't
support STATX_DIOALIGN.  It might also happen if the caller didn't
include STATX_DIOALIGN in the request mask, since statx() isn't required
to return unrequested information.

This commit only adds the VFS-level plumbing for STATX_DIOALIGN.  For
regular files, individual filesystems will still need to add code to
support it.  For block devices, a separate commit will wire it up too.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/stat.c                 | 2 ++
 include/linux/stat.h      | 2 ++
 include/uapi/linux/stat.h | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/stat.c b/fs/stat.c
index 9ced8860e0f35d..a7930d74448304 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -611,6 +611,8 @@ cp_statx(const struct kstat *stat, struct statx __user *buffer)
 	tmp.stx_dev_major = MAJOR(stat->dev);
 	tmp.stx_dev_minor = MINOR(stat->dev);
 	tmp.stx_mnt_id = stat->mnt_id;
+	tmp.stx_dio_mem_align = stat->dio_mem_align;
+	tmp.stx_dio_offset_align = stat->dio_offset_align;
 
 	return copy_to_user(buffer, &tmp, sizeof(tmp)) ? -EFAULT : 0;
 }
diff --git a/include/linux/stat.h b/include/linux/stat.h
index 7df06931f25d85..ff277ced50e9fd 100644
--- a/include/linux/stat.h
+++ b/include/linux/stat.h
@@ -50,6 +50,8 @@ struct kstat {
 	struct timespec64 btime;			/* File creation time */
 	u64		blocks;
 	u64		mnt_id;
+	u32		dio_mem_align;
+	u32		dio_offset_align;
 };
 
 #endif
diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
index 1500a0f58041ae..7cab2c65d3d7fc 100644
--- a/include/uapi/linux/stat.h
+++ b/include/uapi/linux/stat.h
@@ -124,7 +124,8 @@ struct statx {
 	__u32	stx_dev_minor;
 	/* 0x90 */
 	__u64	stx_mnt_id;
-	__u64	__spare2;
+	__u32	stx_dio_mem_align;	/* Memory buffer alignment for direct I/O */
+	__u32	stx_dio_offset_align;	/* File offset alignment for direct I/O */
 	/* 0xa0 */
 	__u64	__spare3[12];	/* Spare space for future expansion */
 	/* 0x100 */
@@ -152,6 +153,7 @@ struct statx {
 #define STATX_BASIC_STATS	0x000007ffU	/* The stuff in the normal stat struct */
 #define STATX_BTIME		0x00000800U	/* Want/got stx_btime */
 #define STATX_MNT_ID		0x00001000U	/* Got stx_mnt_id */
+#define STATX_DIOALIGN		0x00002000U	/* Want/got direct I/O alignment info */
 
 #define STATX__RESERVED		0x80000000U	/* Reserved for future struct statx expansion */
 
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
