Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ADfD/Zzr2lPZgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:29:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8870D243999
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:29:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57945Y3oTCdWuI86lc6nz1UeXXVA/FdgjA3f/mNE3kc=; b=HD0kNvOU86a0mxImsyZ0Uo6cvo
	VUTmNuPzLwmAapbali8ykmjNGPK4W8nCHGIfrfsSSSoCd+D5lvd5OTBeZ0SErq3hGuasSG3bTrDfK
	BBnhdq87t35QTFu2Kqu0kUKhbAReET9tcHifqphMDdXIJoMmTtDMq2Cp/CznOvk+1wzU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzluT-0000k5-E0;
	Tue, 10 Mar 2026 01:29:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzluS-0000js-8x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gL1R4U9c1HPl3NsbkUlGRA1d3Ac9173hDWwi+QS24lU=; b=lzxG/qQtNwQyGKeGSkjVbCXhgh
 9v5Nr8SkJpOBx00PHIJAOdukRRf3nSOgMmJf2unPhGahG4v31wDbz9O+xxPpwCsAdUN/f4nD4AiOU
 HAlb4E5HytIwdr381OxyZa5ihiHegmYO4zxXvx1Ynr+JbFmbi5vOAJC9i01B7fv5ZRP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gL1R4U9c1HPl3NsbkUlGRA1d3Ac9173hDWwi+QS24lU=; b=RziNIswMYTn587083uGz8L7AoF
 6y2di1xunxECs6lMPw7F/I7uc+PEwkyyGI4VjfSzxAA3s6Nb+KftMjkHNNXqXIUiV3LVqWnUDc78h
 BIxDBDJn4oF57RALiBZEzKMtfuX2o3LKUmEt+wGlIrsRq1foemj8Taq2ptzMQGF4eP4o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzluS-0008AB-GK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B85443E7F;
 Tue, 10 Mar 2026 01:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0813BC4CEF7;
 Tue, 10 Mar 2026 01:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773106155;
 bh=psMJeJ5QeW8IxZJ0xELWgUGIx/A1kFF6591jRgDLsAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8tuMvN5dh7ZFOphg99/sztaSQz9CBx7xX8N75nGlVabNVY+vSoB1YPK2+lII0+Ar
 IkRvCN+E59+pb7dwInJl8GZ16zgR4OpeUS5bK1J/OZfE7c3k0AZchZ50ghQWCunAOS
 iOJyZvBYopjaa32T4Gwd8Owvb0bXRi41BcrLtl+tnuVilrI0HzM15cNWtwwDXx8UJ2
 SKBOOVmTuhK1K0ZD+H7S8jFXhh6paWncBM3Tsr+ZhEDI75OdECJpiS6W5Z851KkSGG
 8J/FZJrrLW0tlsHRdTN40MA7bGIqipN6EDFFUSJFJv6ga7plNVTFWrEVlVR86OjKlN
 b0j8sDZBFhtuw==
Date: Mon, 9 Mar 2026 18:29:14 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310012914.GG1105363@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-20-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:34PM +0100, Andrey Albershteyn
 wrote: > XFS preallocates spaces during writes. In normal I/O this space,
 if > unused, is removed by truncate. For files with fsverity, XFS [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzluS-0008AB-GK
Subject: Re: [f2fs-dev] [PATCH v4 19/25] xfs: remove unwritten extents after
 preallocations in fsverity metadata
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 8870D243999
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:34PM +0100, Andrey Albershteyn wrote:
> XFS preallocates spaces during writes. In normal I/O this space, if
> unused, is removed by truncate. For files with fsverity, XFS does not
> use truncate as fsverity metadata is stored past EOF.
> 
> After we're done with writing fsverity metadata iterate over extents in
> that region and remove any unwritten ones. These would be preallocation
> leftovers in the merkle tree holes and past fsverity descriptor.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/xfs/xfs_fsverity.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index e5cd17ec15b6..f78e5f0c2fd0 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
> @@ -21,6 +21,8 @@
>  #include "xfs_iomap.h"
>  #include "xfs_error.h"
>  #include "xfs_health.h"
> +#include "xfs_bmap.h"
> +#include "xfs_bmap_util.h"
>  #include <linux/fsverity.h>
>  #include <linux/iomap.h>
>  #include <linux/pagemap.h>
> @@ -189,6 +191,58 @@ xfs_fsverity_delete_metadata(
>  	return error;
>  }
>  
> +static int
> +xfs_fsverity_cancel_unwritten(
> +	struct xfs_inode	*ip,
> +	xfs_fileoff_t		start,
> +	xfs_fileoff_t		end)
> +{
> +	struct xfs_mount	*mp = ip->i_mount;
> +	struct xfs_trans	*tp;
> +	xfs_fileoff_t		offset_fsb = XFS_B_TO_FSB(mp, start);
> +	xfs_fileoff_t		end_fsb = XFS_B_TO_FSB(mp, end);
> +	struct xfs_bmbt_irec	imap;
> +	int			nimaps;
> +	int			error = 0;
> +	int			done;
> +
> +	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, 0, 0, 0, &tp);
> +	if (error)
> +		return error;
> +
> +	xfs_ilock(ip, XFS_ILOCK_EXCL);
> +	xfs_trans_ijoin(tp, ip, 0);
> +
> +	while (offset_fsb < end_fsb) {
> +		nimaps = 1;
> +
> +		error = xfs_bmapi_read(ip, offset_fsb, end_fsb - offset_fsb,
> +							  &imap, &nimaps, 0);

Indent two tabs, plz. :)

> +		if (error)
> +			goto out_cancel;
> +
> +		if (nimaps == 0)
> +			break;
> +
> +		if (imap.br_state == XFS_EXT_UNWRITTEN) {
> +			error = xfs_bunmapi(tp, ip, imap.br_startoff,
> +					    imap.br_blockcount, 0, 1, &done);
> +			if (error)
> +				goto out_cancel;
> +		}
> +
> +		offset_fsb = imap.br_startoff + imap.br_blockcount;

There's an upper limit on the number of blocks you can unmap/free in a
single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
loop body?

Oh wait, you skip the written extents.  Ok, so maybe just roll it after
you've done a bunmapi.

Do you need to purge the cow fork too?

--D

> +	}
> +
> +	error = xfs_trans_commit(tp);
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	return error;
> +out_cancel:
> +	xfs_trans_cancel(tp);
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	return error;
> +}
> +
>  
>  /*
>   * Prepare to enable fsverity by clearing old metadata.
> @@ -264,6 +318,14 @@ xfs_fsverity_end_enable(
>  	if (error)
>  		goto out;
>  
> +	/*
> +	 * Remove unwritten extents left by preallocations in the merkle tree
> +	 * holes and past descriptor
> +	 */
> +	error = xfs_fsverity_cancel_unwritten(ip, range_start, LLONG_MAX);
> +	if (error)
> +		goto out;
> +
>  	/*
>  	 * Set fsverity inode flag
>  	 */
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
