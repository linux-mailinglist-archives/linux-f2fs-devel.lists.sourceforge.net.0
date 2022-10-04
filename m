Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED505F48D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 19:44:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofly3-0003nQ-Pm;
	Tue, 04 Oct 2022 17:44:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ofly2-0003nJ-DN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 17:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXSSmWhr2vuWQ8lslm0JKi0ke5ZXMNjO+0EviZpN2is=; b=Bni8K90UqkdhQvDAfy+aMQrkx1
 6020blGGItGpw8X7Buu2oZ3P3fuylo9eXDaWEAxNOYKFK9dPJOHPSUmoah565BqGi8ZfQh+4oGE1f
 edsQSO0IV6OYgqzQx7V72Ses0NpprqZhWUXjjD5wkQkwGBLSLtDNYv/Krx0JQCdkVJmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JXSSmWhr2vuWQ8lslm0JKi0ke5ZXMNjO+0EviZpN2is=; b=C
 U8SR2DmBDqk1jlzJ2+0Yk/NyUhezrP68dQPTFrrjTOuNtC+GdPZikvUieOBKuo0G9BqNf71hDPTlC
 sq5oe+yiFD2yizJLtEJ9kU9uy8vdfLUO37PpZ45IJ9994S7iGhRdlVN4wVbFQovVO3I4ajn5ibXrN
 eo33Y+HUSAML+SJU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oflxx-00CdZE-Av for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 17:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2543D614F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Oct 2022 17:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39833C433C1;
 Tue,  4 Oct 2022 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664905454;
 bh=Rte1HvtfgvFRVjI9vmQSmn8KC1YqoQCVVzKzmhIF2f8=;
 h=From:To:Cc:Subject:Date:From;
 b=TXoomx0Fwgy3RlDGeKpNyJvQKJXILM0zhFXPxPg0RxBKHgGPZLtzxY9O8ROE7lIo1
 S6oXgY/E1bP+73sU9RMOO0BCkm+WUGpaXZgeoozXSkMqPJVBG2G+cfL1lXx4rP1MWx
 iDklhkM0ofevngD3ygTIu3fQDaNt1wk95jKbntv8AoBAE3T78h0Ye0GbXizhIFwM/c
 l4NZ6B/vRH++0uutSiyEWPZLYnLcvPOziMdVgQ5RNsqV4NsP8XGw0Qxv+Zdl/2m8ht
 TJ/m1byfhSfKmoWqIj1g6HydyWV31REWXwDD8zCXYmZh48HljZ7H7C9IRiw1kZGixU
 h+1fTlkD57ACA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-man@vger.kernel.org
Date: Tue,  4 Oct 2022 10:43:07 -0700
Message-Id: <20221004174307.6022-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Document the
 STATX_DIOALIGN
 support for statx() (https://git.kernel.org/linus/725737e7c21d2d25).
 Reviewed-by:
 Darrick J. Wong <djwong@kernel.org> Signed-off-by: Eric Biggers
 <ebiggers@google.com> --- 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oflxx-00CdZE-Av
Subject: [f2fs-dev] [man-pages PATCH v3] statx.2,
 open.2: document STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Document the STATX_DIOALIGN support for statx()
(https://git.kernel.org/linus/725737e7c21d2d25).

Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

I'm resending this now that support for STATX_DIOALIGN has been merged
upstream.

v3: updated mentions of Linux version, fixed some punctuation, and added
    a Reviewed-by

v2: rebased onto man-pages master branch, mentioned xfs, and updated
    link to patchset

 man2/open.2  | 43 ++++++++++++++++++++++++++++++++-----------
 man2/statx.2 | 29 +++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/man2/open.2 b/man2/open.2
index deba7e4ea..b8617e0d2 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1732,21 +1732,42 @@ of user-space buffers and the file offset of I/Os.
 In Linux alignment
 restrictions vary by filesystem and kernel version and might be
 absent entirely.
-However there is currently no filesystem\-independent
-interface for an application to discover these restrictions for a given
-file or filesystem.
-Some filesystems provide their own interfaces
-for doing so, for example the
+The handling of misaligned
+.B O_DIRECT
+I/Os also varies; they can either fail with
+.B EINVAL
+or fall back to buffered I/O.
+.PP
+Since Linux 6.1,
+.B O_DIRECT
+support and alignment restrictions for a file can be queried using
+.BR statx (2),
+using the
+.B STATX_DIOALIGN
+flag.
+Support for
+.B STATX_DIOALIGN
+varies by filesystem; see
+.BR statx (2).
+.PP
+Some filesystems provide their own interfaces for querying
+.B O_DIRECT
+alignment restrictions, for example the
 .B XFS_IOC_DIOINFO
 operation in
 .BR xfsctl (3).
+.B STATX_DIOALIGN
+should be used instead when it is available.
 .PP
-Under Linux 2.4, transfer sizes, the alignment of the user buffer,
-and the file offset must all be multiples of the logical block size
-of the filesystem.
-Since Linux 2.6.0, alignment to the logical block size of the
-underlying storage (typically 512 bytes) suffices.
-The logical block size can be determined using the
+If none of the above is available, then direct I/O support and alignment
+restrictions can only be assumed from known characteristics of the filesystem,
+the individual file, the underlying storage device(s), and the kernel version.
+In Linux 2.4, most block device based filesystems require that the file offset
+and the length and memory address of all I/O segments be multiples of the
+filesystem block size (typically 4096 bytes).
+In Linux 2.6.0, this was relaxed to the logical block size of the block device
+(typically 512 bytes).
+A block device's logical block size can be determined using the
 .BR ioctl (2)
 .B BLKSSZGET
 operation or from the shell using the command:
diff --git a/man2/statx.2 b/man2/statx.2
index 0d1b4591f..50397057d 100644
--- a/man2/statx.2
+++ b/man2/statx.2
@@ -61,7 +61,12 @@ struct statx {
        containing the filesystem where the file resides */
     __u32 stx_dev_major;   /* Major ID */
     __u32 stx_dev_minor;   /* Minor ID */
+
     __u64 stx_mnt_id;      /* Mount ID */
+
+    /* Direct I/O alignment restrictions */
+    __u32 stx_dio_mem_align;
+    __u32 stx_dio_offset_align;
 };
 .EE
 .in
@@ -247,6 +252,8 @@ STATX_BTIME	Want stx_btime
 STATX_ALL	The same as STATX_BASIC_STATS | STATX_BTIME.
 	It is deprecated and should not be used.
 STATX_MNT_ID	Want stx_mnt_id (since Linux 5.8)
+STATX_DIOALIGN	Want stx_dio_mem_align and stx_dio_offset_align
+	(since Linux 6.1; support varies by filesystem)
 .TE
 .in
 .PP
@@ -407,6 +414,28 @@ This is the same number reported by
 .BR name_to_handle_at (2)
 and corresponds to the number in the first field in one of the records in
 .IR /proc/self/mountinfo .
+.TP
+.I stx_dio_mem_align
+The alignment (in bytes) required for user memory buffers for direct I/O
+.BR "" ( O_DIRECT )
+on this file, or 0 if direct I/O is not supported on this file.
+.IP
+.B STATX_DIOALIGN
+.IR "" ( stx_dio_mem_align
+and
+.IR stx_dio_offset_align )
+is supported on block devices since Linux 6.1.
+The support on regular files varies by filesystem; it is supported by ext4,
+f2fs, and xfs since Linux 6.1.
+.TP
+.I stx_dio_offset_align
+The alignment (in bytes) required for file offsets and I/O segment lengths for
+direct I/O
+.BR "" ( O_DIRECT )
+on this file, or 0 if direct I/O is not supported on this file.
+This will only be nonzero if
+.I stx_dio_mem_align
+is nonzero, and vice versa.
 .PP
 For further information on the above fields, see
 .BR inode (7).

base-commit: bc28d289e5066fc626df260bafc249846a0f6ae6
-- 
2.37.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
