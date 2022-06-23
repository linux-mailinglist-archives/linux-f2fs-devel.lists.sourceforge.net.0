Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17636557F38
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 18:02:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4PI5-0000AO-KG; Thu, 23 Jun 2022 16:02:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1o4PI4-0000AE-9j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 16:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=feAfs8Q/2OZPSnfSY5SlWW1u7YnQ3gpNVLehFngPC5M=; b=dcjaVC8AgZZuHd7CZtCTOBn+20
 9rTgrrK85G2IJ1TOomKLK0jJNJn2DQdvIvOphqFZHbaZzRSMkHjabFH3O4gMrTz7SQMY0jAGNhd06
 GOqO/TDuJNOFgWmRyEjAVzlXKdlaHBRSA2TpJmg6OCGovMcOAugGIMPJIVrei/kIfInw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=feAfs8Q/2OZPSnfSY5SlWW1u7YnQ3gpNVLehFngPC5M=; b=fRdQViGLXQHspUdC/n3VZKx4lm
 EmtjMri9FAjSkpc/Mgt8ey3dyPKXs3uLtta1iVMwPgVQowx/snKk8m0heofoUZvnw84Ebx0PXtL38
 HDbrXop2ObjSxdu4VXKsks6voECDg/pmRewEV6i64840jaaLewZ2yayDeemq9ohqBP+Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4PI2-0008KP-9d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 16:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF9CD61EF2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 16:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B909C3411B;
 Thu, 23 Jun 2022 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656000156;
 bh=KDZro067hOs54V5FFK7xSXNOUbG2XQbnl6krjTY23Ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aFKuyHxI8O+khgn74cZXUbdL6rLFZn2OzWcLNJ4jb5lz+ls5l93I8W279wmcNAWUc
 /oVyf141lxp/6Jb1TUiAkAHyMnnEMWCbiv7An9MDsHG+5fY830R3mcnDWxeLNdS0Wz
 A2SJc9YiOWxYeV9667xlg4B5EdPahTWnJY9tmk5Q2Sfg094lTbv2XpJUhJqaOCMAhw
 kGHGl1ZHDgNFmb0GXHDUt7S38X37aLh9l3Kut5/3WXv346eraEciXK5bb0Y9FPU55z
 i1HMd9dcdEjUnB23t0tf2NDJ0AfTIOWEbhjNCnRB4H8+YgU1uweiDYVlQGpvfOl2u+
 zrRmIFUgR6VEA==
Date: Thu, 23 Jun 2022 09:02:35 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YrSOm2murB4Bc1RQ@magnolia>
References: <20220616202141.125079-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616202141.125079-1-ebiggers@kernel.org>
X-Spam-Score: -3.3 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 16, 2022 at 01:21:41PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Document the proposed
 STATX_DIOALIGN
 support for statx() > (https://lore.kernel.org/linux-f [...] 
 Content analysis details:   (-3.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o4PI2-0008KP-9d
Subject: Re: [f2fs-dev] [man-pages RFC PATCH] statx.2,
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
Cc: linux-man@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 16, 2022 at 01:21:41PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document the proposed STATX_DIOALIGN support for statx()
> (https://lore.kernel.org/linux-fsdevel/20220616201506.124209-1-ebiggers@kernel.org).
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  man2/open.2  | 43 ++++++++++++++++++++++++++++++++-----------
>  man2/statx.2 | 32 +++++++++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 12 deletions(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index d1485999f..ef29847c3 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -1732,21 +1732,42 @@ of user-space buffers and the file offset of I/Os.
>  In Linux alignment
>  restrictions vary by filesystem and kernel version and might be
>  absent entirely.
> -However there is currently no filesystem\-independent
> -interface for an application to discover these restrictions for a given
> -file or filesystem.
> -Some filesystems provide their own interfaces
> -for doing so, for example the
> +The handling of misaligned
> +.B O_DIRECT
> +I/Os also varies; they can either fail with
> +.B EINVAL
> +or fall back to buffered I/O.
> +.PP
> +Since Linux 5.20,
> +.B O_DIRECT
> +support and alignment restrictions for a file can be queried using
> +.BR statx (2),
> +using the
> +.B STATX_DIOALIGN
> +flag.
> +Support for
> +.B STATX_DIOALIGN
> +varies by filesystem; see
> +.BR statx (2).
> +.PP
> +Some filesystems provide their own interfaces for querying
> +.B O_DIRECT
> +alignment restrictions, for example the
>  .B XFS_IOC_DIOINFO
>  operation in
>  .BR xfsctl (3).
> +.B STATX_DIOALIGN
> +should be used instead when it is available.
>  .PP
> -Under Linux 2.4, transfer sizes, the alignment of the user buffer,
> -and the file offset must all be multiples of the logical block size
> -of the filesystem.
> -Since Linux 2.6.0, alignment to the logical block size of the
> -underlying storage (typically 512 bytes) suffices.
> -The logical block size can be determined using the
> +If none of the above is available, then direct I/O support and alignment
> +restrictions can only be assumed from known characteristics of the filesystem,
> +the individual file, the underlying storage device(s), and the kernel version.
> +In Linux 2.4, most block device based filesystems require that the file offset
> +and the length and memory address of all I/O segments be multiples of the
> +filesystem block size (typically 4096 bytes).
> +In Linux 2.6.0, this was relaxed to the logical block size of the block device
> +(typically 512 bytes).
> +A block device's logical block size can be determined using the
>  .BR ioctl (2)
>  .B BLKSSZGET
>  operation or from the shell using the command:
> diff --git a/man2/statx.2 b/man2/statx.2
> index a8620be6f..fff0a63ec 100644
> --- a/man2/statx.2
> +++ b/man2/statx.2
> @@ -61,7 +61,12 @@ struct statx {
>         containing the filesystem where the file resides */
>      __u32 stx_dev_major;   /* Major ID */
>      __u32 stx_dev_minor;   /* Minor ID */
> +
>      __u64 stx_mnt_id;      /* Mount ID */
> +
> +    /* Direct I/O alignment restrictions */
> +    __u32 stx_dio_mem_align;
> +    __u32 stx_dio_offset_align;
>  };
>  .EE
>  .in
> @@ -244,8 +249,11 @@ STATX_SIZE	Want stx_size
>  STATX_BLOCKS	Want stx_blocks
>  STATX_BASIC_STATS	[All of the above]
>  STATX_BTIME	Want stx_btime
> +STATX_ALL	The same as STATX_BASIC_STATS | STATX_BTIME.
> +         	This is deprecated and should not be used.

STATX_ALL is deprecated??  I was under the impression that _ALL meant
all the known bits for that kernel release, but...

>  STATX_MNT_ID	Want stx_mnt_id (since Linux 5.8)

...I guess that is not correct.

> -STATX_ALL	[All currently available fields]
> +STATX_DIOALIGN	Want stx_dio_mem_align and stx_dio_offset_align
> +              	(since Linux 5.20; support varies by filesystem)
>  .TE
>  .in
>  .PP
> @@ -406,6 +414,28 @@ This is the same number reported by
>  .BR name_to_handle_at (2)
>  and corresponds to the number in the first field in one of the records in
>  .IR /proc/self/mountinfo .
> +.TP
> +.I stx_dio_mem_align
> +The alignment (in bytes) required for user memory buffers for direct I/O
> +.BR "" ( O_DIRECT )
> +on this file. or 0 if direct I/O is not supported on this file.

"...on this file, or 0 if..."

> +.IP
> +.B STATX_DIOALIGN
> +.IR "" ( stx_dio_mem_align
> +and
> +.IR stx_dio_offset_align )
> +is supported on block devices since Linux 5.20.
> +The support on regular files varies by filesystem; it is supported by ext4 and
> +f2fs since Linux 5.20.

If the VFS changes don't provoke further bikeshedding, I'll contribute
an XFS patch to go with your series.

--D

> +.TP
> +.I stx_dio_offset_align
> +The alignment (in bytes) required for file offsets and I/O segment lengths for
> +direct I/O
> +.BR "" ( O_DIRECT )
> +on this file, or 0 if direct I/O is not supported on this file.
> +This will only be nonzero if
> +.I stx_dio_mem_align
> +is nonzero, and vice versa.
>  .PP
>  For further information on the above fields, see
>  .BR inode (7).
> -- 
> 2.36.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
