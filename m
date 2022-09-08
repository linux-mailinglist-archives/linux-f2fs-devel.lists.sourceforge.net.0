Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34A5B123D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 03:58:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oW6nq-0001bL-TZ;
	Thu, 08 Sep 2022 01:58:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oW6np-0001bF-OF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 01:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttGH24hmduTPEkb01euyVfwIbwo1wmeX9DYLkAyBW1w=; b=My0soLjmjOAeLhNFnJk4I/j106
 0543uo6fDkpWftgVGaESqUOvGj89nG57EQEi9hvJw2rzQ3ebTckLIwpPRBxmvjyQLiXReffYRutCp
 sXB44ZDSzjUYERXPxBB5X65ZAJmHmXbGUcf+6BNAX4bWeIdcuOdMWIZnQ+iRHBaBro34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ttGH24hmduTPEkb01euyVfwIbwo1wmeX9DYLkAyBW1w=; b=OifU6sUoRYmY4QX9RJrEBm/svj
 8awTFAlet9H0Q6Ekwh29HcM9Qvb96N1awAi7mvEuO17pXHGgEo97uzcG83yWg94N1tibFH27+VG1v
 Rt7sqxCIpYONOgBC6ii628PpYddYjRcP01x/P4xgF23hBRwqx7aP4+p3zbGnb1LtbMt8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oW6no-0006Po-Rz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 01:58:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7073461B1D;
 Thu,  8 Sep 2022 01:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E32DC433D7;
 Thu,  8 Sep 2022 01:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662602274;
 bh=7ooBitzRYUJELUWbfYkVWsRQPk0BuVGZdsj0IAR+jZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZAPvIm6VTZt0+YRfvi4eVryi7yTE19bTcuiHu9yDc04BslUaZzQ/USd83npthd1ig
 X3EpGOHOD4P2XZ44dhHqEB1Q+JdBIbvu5x4mEMieI+4W4y0blLVqpq/pI7GPQ8Io+5
 /1fYyaQlgVuOL++KvGkNpJ7fk+Wcqvo0cF+pjwtqv4RIAX2Mh6BxPxhwddHqeNkdPx
 NYYxZmiwg7arRj0P1jdyNdrfXZjmBZ0Wjs0TKFjIzcTHx6w3gePPUwKQ4Ftre+qoc4
 ur/5IxyTkTnu3JsEDTaBuh2AU2Zn0u2/InRS35XgRPCHeiGLCg48EYJj/HSEoX5QxK
 hpq3GqfFJI+tA==
Date: Wed, 7 Sep 2022 18:57:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YxlMIJ+BgjTbGHNI@google.com>
References: <20220901002828.25102-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901002828.25102-1-rdunlap@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/31, Randy Dunlap wrote: > Change occurrences of "it's"
 that are possessive to "its" > so that they don't read as "it is". > > For
 f2fs.rst, reword one description for better clarity. > > Signed- [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oW6no-0006Po-Rz
Subject: Re: [f2fs-dev] [PATCH v2] Documentation: filesystems: correct
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
Cc: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J . Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Seth Forshee <sforshee@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/31, Randy Dunlap wrote:
> Change occurrences of "it's" that are possessive to "its"
> so that they don't read as "it is".
> 
> For f2fs.rst, reword one description for better clarity.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-xfs@vger.kernel.org
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Seth Forshee <sforshee@kernel.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Reviewed-by: "Christian Brauner (Microsoft)" <brauner@kernel.org>

Thanks, for f2fs part.

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
> v2: Reword the compress_log_size description.
>     Rebase (the xfs file changed).
>     Add Reviewed-by: tags.
> 
> Thanks for Al and Ted for suggesting rewording the f2fs.rst description.
> 
>  Documentation/filesystems/f2fs.rst                       |    5 ++---
>  Documentation/filesystems/idmappings.rst                 |    2 +-
>  Documentation/filesystems/qnx6.rst                       |    2 +-
>  Documentation/filesystems/xfs-delayed-logging-design.rst |    6 +++---
>  4 files changed, 7 insertions(+), 8 deletions(-)
> 
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -286,9 +286,8 @@ compress_algorithm=%s:%d Control compres
>  			 algorithm	level range
>  			 lz4		3 - 16
>  			 zstd		1 - 22
> -compress_log_size=%u	 Support configuring compress cluster size, the size will
> -			 be 4KB * (1 << %u), 16KB is minimum size, also it's
> -			 default size.
> +compress_log_size=%u	 Support configuring compress cluster size. The size will
> +			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
>  compress_extension=%s	 Support adding specified extension, so that f2fs can enable
>  			 compression on those corresponding files, e.g. if all files
>  			 with '.ext' has high compression rate, we can set the '.ext'
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
>  Just to make matters slightly more complex, this checkpoint level context
>  for the pin count means that the pinning of an item must take place under the


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
