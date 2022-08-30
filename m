Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B968C5A5859
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Aug 2022 02:17:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSow8-0001M2-Tj;
	Tue, 30 Aug 2022 00:17:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1oSow7-0001Lw-Ig
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 00:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uB06Ba4ir37eYYIXA8LNXmFhhZKW2AAG2YU7aAiunZk=; b=EE9Rm8j189ZxrcNBybjafnqaBp
 fLSyHzbMaOVLtrzX7bV6XIm5Gkx9qQM9GCKz47TmAObDluYsGyOes7Gz6YNNX3dsUQW6VbHrx/v+H
 Uo22TyJkm6NLtW60WHAOQKH8oX7S/Sk4Aq4t6+SqQ1p67rOhq4niy+Cav3BeEL/HNZKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uB06Ba4ir37eYYIXA8LNXmFhhZKW2AAG2YU7aAiunZk=; b=YxxItN1TzPDpq9KBTu1hatBgUn
 m6XEpfIQV+ILSmFsE5XuRqaxh3VSv12l/wpN3VCIgfQZxJ9j7fVhVDXmh2oByj99JYyT/eo6MxTNW
 zCBuK32P1zQuQPhGehiB6PIWSPt1PWxBWEV+WR24pbmfH+MMvzKRSurOsBEyBbWcK9dM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSow6-006vrT-0k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 00:16:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AE5A6142F;
 Tue, 30 Aug 2022 00:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81E4C433C1;
 Tue, 30 Aug 2022 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661818607;
 bh=yy6KIezErRIjKdUUAlbWGalHPm1psb+E4AocWqNRNWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KcjB8R8ZGaO0KslmIN9nu7n78kzQp7fa09VbZG5MV95MeIfSqbnlpexEKcT038NQP
 2D30ccYT01jL+jc6LAX8WxxO3yQm9kC3KPyGJ6uwrvMgNfkP9pc7a+YwLbdWfHqtGL
 XZq0XKNYl2z4EKL+KNLv7dIT9hE2af2tCdVVKjuhdu4FETEX/bFuHAiYSMP/iiDsH0
 lXWCb54OIKzxrYiOQdX29rqaOt9Eg4Ef38xnZmQqeg1/VcK2HVecTIxs7pDk1MAdKL
 Cwg9gVkiqepXfZalXf7FXDPciTmLgjaEjq6B+oMEmhngXRfEeCY3blcec1lxAMWUe7
 fE86EP8Gqhs/A==
Date: Mon, 29 Aug 2022 17:16:46 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <Yw1W7oLpMoVynPRd@magnolia>
References: <20220829235429.17902-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829235429.17902-1-rdunlap@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 29, 2022 at 04:54:29PM -0700, Randy Dunlap wrote:
 > Change occurrences of "it's" that are possessive to "its" > so that they
 don't read as "it is". > > Signed-off-by: Randy Dunlap <rdunlap [...] 
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
X-Headers-End: 1oSow6-006vrT-0k
Subject: Re: [f2fs-dev] [PATCH] Documentation: filesystems: correct
 possessive "its"
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
Cc: Christian Brauner <brauner@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Seth Forshee <sforshee@kernel.org>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 29, 2022 at 04:54:29PM -0700, Randy Dunlap wrote:
> Change occurrences of "it's" that are possessive to "its"
> so that they don't read as "it is".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-xfs@vger.kernel.org
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Seth Forshee <sforshee@kernel.org>

Looks correct to me,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  Documentation/filesystems/f2fs.rst                       |    2 +-
>  Documentation/filesystems/idmappings.rst                 |    2 +-
>  Documentation/filesystems/qnx6.rst                       |    2 +-
>  Documentation/filesystems/xfs-delayed-logging-design.rst |    6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -287,7 +287,7 @@ compress_algorithm=%s:%d Control compres
>  			 lz4		3 - 16
>  			 zstd		1 - 22
>  compress_log_size=%u	 Support configuring compress cluster size, the size will
> -			 be 4KB * (1 << %u), 16KB is minimum size, also it's
> +			 be 4KB * (1 << %u), 16KB is minimum size, also its
>  			 default size.
>  compress_extension=%s	 Support adding specified extension, so that f2fs can enable
>  			 compression on those corresponding files, e.g. if all files
> --- a/Documentation/filesystems/idmappings.rst
> +++ b/Documentation/filesystems/idmappings.rst
> @@ -661,7 +661,7 @@ idmappings::
>   mount idmapping:      u0:k10000:r10000
>  
>  Assume a file owned by ``u1000`` is read from disk. The filesystem maps this id
> -to ``k21000`` according to it's idmapping. This is what is stored in the
> +to ``k21000`` according to its idmapping. This is what is stored in the
>  inode's ``i_uid`` and ``i_gid`` fields.
>  
>  When the caller queries the ownership of this file via ``stat()`` the kernel
> --- a/Documentation/filesystems/qnx6.rst
> +++ b/Documentation/filesystems/qnx6.rst
> @@ -176,7 +176,7 @@ Then userspace.
>  The requirement for a static, fixed preallocated system area comes from how
>  qnx6fs deals with writes.
>  
> -Each superblock got it's own half of the system area. So superblock #1
> +Each superblock got its own half of the system area. So superblock #1
>  always uses blocks from the lower half while superblock #2 just writes to
>  blocks represented by the upper half bitmap system area bits.
>  
> --- a/Documentation/filesystems/xfs-delayed-logging-design.rst
> +++ b/Documentation/filesystems/xfs-delayed-logging-design.rst
> @@ -551,14 +551,14 @@ Essentially, this shows that an item tha
>  and relogged, so any tracking must be separate to the AIL infrastructure. As
>  such, we cannot reuse the AIL list pointers for tracking committed items, nor
>  can we store state in any field that is protected by the AIL lock. Hence the
> -committed item tracking needs it's own locks, lists and state fields in the log
> +committed item tracking needs its own locks, lists and state fields in the log
>  item.
>  
>  Similar to the AIL, tracking of committed items is done through a new list
>  called the Committed Item List (CIL).  The list tracks log items that have been
>  committed and have formatted memory buffers attached to them. It tracks objects
>  in transaction commit order, so when an object is relogged it is removed from
> -it's place in the list and re-inserted at the tail. This is entirely arbitrary
> +its place in the list and re-inserted at the tail. This is entirely arbitrary
>  and done to make it easy for debugging - the last items in the list are the
>  ones that are most recently modified. Ordering of the CIL is not necessary for
>  transactional integrity (as discussed in the next section) so the ordering is
> @@ -884,7 +884,7 @@ pin the object the first time it is inse
>  the CIL during a transaction commit, then we do not pin it again. Because there
>  can be multiple outstanding checkpoint contexts, we can still see elevated pin
>  counts, but as each checkpoint completes the pin count will retain the correct
> -value according to it's context.
> +value according to its context.
>  
>  Just to make matters more slightly more complex, this checkpoint level context
>  for the pin count means that the pinning of an item must take place under the


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
