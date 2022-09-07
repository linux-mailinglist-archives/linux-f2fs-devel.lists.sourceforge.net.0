Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470D5B0000
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Sep 2022 11:10:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVr4u-0000xL-Q2;
	Wed, 07 Sep 2022 09:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1oVr4Z-0000x3-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 09:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xpj2U7r7NjexOSS9xVf5PrWGymrSCyPJQhceOLJbhrs=; b=YtGF8uq/1oCEDbBY8D1EmiWpxF
 bs3nqc7WvtnVE/X2SeZG/416zEjUr2psnCIUAz9aa9S3UZ3UqUJ1wlc0OM+p+0JIcYHQ1Ypg8zC/n
 bSKBDiG6Ru8KpHJHfvErNtxTXbIU2QJjpFfrD/7IHEL2JJicOHSXx+2JsPu3EBdMk9UY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xpj2U7r7NjexOSS9xVf5PrWGymrSCyPJQhceOLJbhrs=; b=Nx+pdTIs11VudRCVQQG3UgIR8u
 lbbJYEszHaCSE1hrXCHtGNkQe7LEAel8bNuurSf1HI0adIyXlxt+jW2JYa1EQHAcM/nzf82MlLLAY
 /h6U3j059uGyZzGo8xQ63csp4x6554Z2+EiPPXiiUPJdV7eaN2/SYXQQZ+N+YEZB34tE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVr4Y-00012j-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 09:10:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D1E4617FE;
 Wed,  7 Sep 2022 09:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFE0C433C1;
 Wed,  7 Sep 2022 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662541808;
 bh=a6rxNDyNfNYsftFOTgasxTViBPk+jSbvU4105tQOkhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbUGnYmnyFUJoHmUJJNdkTfTbKlPdXgHPr6kq8a5AS52w8H4F2fLqyyuPqnpfXV8k
 37Zvs4OH5t6Hisr1Kr1ar+Srb4OFC2sceheTmucJeYWHEk0UabmunmqGt+Rmk/BZA+
 MIBjoqwWGIc1EU3fa/Pn7cfW3nZvtyCJNLWYMQY+jxycJNzGnHvEuiUs0DKarv6FSg
 XcNIBcxLDyRBP1Qbu0guN/v1Kfnb3RRqgCT2UJ3oHI7Yc1I2V8NTb8eTLSB5xrknjZ
 ATDIZfsT+DqdOdZMjCbb2DP99VSiZ1Mj/Xnsu3jHmWSU81XAYsNmH/NaXvzC45Ug5c
 w/N7bwzH1xjJw==
Date: Wed, 7 Sep 2022 11:10:02 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220907091002.6ay72r4tgk5g6rma@wittgenstein>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <20220827065851.135710-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827065851.135710-2-ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 26, 2022 at 11:58:44PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Traditionally, the conditions
 for when DIO (direct I/O) is supported > were fairly simple. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVr4Y-00012j-Lp
Subject: Re: [f2fs-dev] [PATCH v5 1/8] statx: add direct I/O alignment
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
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 26, 2022 at 11:58:44PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Traditionally, the conditions for when DIO (direct I/O) is supported
> were fairly simple.  For both block devices and regular files, DIO had
> to be aligned to the logical block size of the block device.
> 
> However, due to filesystem features that have been added over time (e.g.
> multi-device support, data journalling, inline data, encryption, verity,
> compression, checkpoint disabling, log-structured mode), the conditions
> for when DIO is allowed on a regular file have gotten increasingly
> complex.  Whether a particular regular file supports DIO, and with what
> alignment, can depend on various file attributes and filesystem mount
> options, as well as which block device(s) the file's data is located on.
> 
> Moreover, the general rule of DIO needing to be aligned to the block
> device's logical block size was recently relaxed to allow user buffers
> (but not file offsets) aligned to the DMA alignment instead.  See
> commit bf8d08532bc1 ("iomap: add support for dma aligned direct-io").
> 
> XFS has an ioctl XFS_IOC_DIOINFO that exposes DIO alignment information.
> Uplifting this to the VFS is one possibility.  However, as discussed
> (https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
> this ioctl is rarely used and not known to be used outside of
> XFS-specific code.  It was also never intended to indicate when a file
> doesn't support DIO at all, nor was it intended for block devices.
> 
> Therefore, let's expose this information via statx().  Add the
> STATX_DIOALIGN flag and two new statx fields associated with it:
> 
> * stx_dio_mem_align: the alignment (in bytes) required for user memory
>   buffers for DIO, or 0 if DIO is not supported on the file.
> 
> * stx_dio_offset_align: the alignment (in bytes) required for file
>   offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
>   on the file.  This will only be nonzero if stx_dio_mem_align is
>   nonzero, and vice versa.
> 
> Note that as with other statx() extensions, if STATX_DIOALIGN isn't set
> in the returned statx struct, then these new fields won't be filled in.
> This will happen if the file is neither a regular file nor a block
> device, or if the file is a regular file and the filesystem doesn't
> support STATX_DIOALIGN.  It might also happen if the caller didn't
> include STATX_DIOALIGN in the request mask, since statx() isn't required
> to return unrequested information.
> 
> This commit only adds the VFS-level plumbing for STATX_DIOALIGN.  For
> regular files, individual filesystems will still need to add code to
> support it.  For block devices, a separate commit will wire it up too.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Looks good to me,
Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
