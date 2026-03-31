Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G0BInBazGk9SgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Apr 2026 01:36:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2B372DCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Apr 2026 01:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjDAh91G2774tXLKfnVGqp9TFQx3gK9z2TuwuLc6iwc=; b=XpTzUCyLp0mTqycSNSm4Y4kLTu
	Jw2Qt4CCdX7+fMzMjS0zaUBaYSNxmIW3EHylBUojPzpUylE6bA01qwx6IwHm/Qt8va11rxGmBlHFR
	nqNa/MSC16fudZRbopIC9+mVeEtI7i+y3k24icHISW81S48/LNqlTvQCA33ViPD7Lf9M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w7id3-000733-Pz;
	Tue, 31 Mar 2026 23:36:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1w7id1-00072x-TC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 23:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1S3T6YT+xAfQHbIh7Axqn/G1po+3XiLSj1xCP5OXbI=; b=lJ50K59WkFq4Ab10Ufpj38E27C
 SNP1AaeRul5abrvefez5JsJiotOyyUksA1Fh7ff/aFQPNdiGNKvrUXsjWSbfsxUTbZrbaRrZ1q6nW
 CIRYn3YIZPyfI1ATUUNzgP3NncFWHxCQ7lOFr8vPGT3GERypO3jy/0DDWzdGiBHdmnYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l1S3T6YT+xAfQHbIh7Axqn/G1po+3XiLSj1xCP5OXbI=; b=bcTF+DaJY4EdAYlgRQ8jvLNJ6o
 xUG1DIlJgnEAYBvDaNVr0Bu/B6o2ZU2PuTA9tPMu7IcUFfYiaNTqHq5Ao4NL5A9jjMelh8sLlqoZf
 zJE8nV3qsrHv2r3WrKqXmfsFAW0GrjJzIvu/43R858nGhd35E+PskMohLRfH7U/D3Vew=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w7id1-0003TM-UG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 23:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 45FA260120;
 Tue, 31 Mar 2026 23:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC047C19423;
 Tue, 31 Mar 2026 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775000166;
 bh=4Vz30RKNLIzqXDG7pq5QA290tQq9TizJ9InK1yco/uA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9dgTx3/YTk4EZfXYiy47DlMfi1i5hE1tl6fX/zYaaznOfIgfK676dXTcAyPuKDa+
 cuu2nZ9dDNHTrRD2w0if1Tiad7exj2CeNztLs9LhFw5ZGrleCh0zFmA9beCgiuFoDz
 tFczHH1SRx4sGNr9Z1H+B/61Nc0cj/v5L+7tMyRxxa8sej5n4LqtcynCUxefzfBJVR
 kdq8UycgfEvcmBHnVx33MD2S3T2AR/khpGZaoCKwvfyktsAAswMsUmw1SY6vIPkjUf
 CfSgz2d5dln5bx/TZRKdz9Yv09OVmzhzMKUb1pxATYt3KNVQrwGhfqQBXClEVbH6Zf
 c4Tizxc8eUISw==
Date: Tue, 31 Mar 2026 16:36:05 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260331233605.GJ6223@frogsfrogsfrogs>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-17-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331212827.2631020-17-aalbersh@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 31, 2026 at 11:28:17PM +0200, Andrey Albershteyn
 wrote: > XFS preallocates spaces during writes. In normal I/O this space,
 if > unused, is removed by truncate. For files with fsverity XFS [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w7id1-0003TM-UG
Subject: Re: [f2fs-dev] [PATCH v6 16/22] xfs: remove unwritten extents after
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
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 0DA2B372DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:28:17PM +0200, Andrey Albershteyn wrote:
> XFS preallocates spaces during writes. In normal I/O this space, if
> unused, is removed by truncate. For files with fsverity XFS does not use
> truncate as fsverity metadata is stored past EOF.
> 
> After we're done with writing fsverity metadata iterate over extents in
> that region and remove any unwritten ones. These would be left overs in
> the holes in the merkle tree and past fsverity descriptor.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

/me is ok with this
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_fsverity.c | 67 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index 5a6a48fcf843..b193009a1bdb 100644
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
> @@ -173,6 +175,63 @@ xfs_fsverity_delete_metadata(
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
> +
> +	while (offset_fsb < end_fsb) {
> +		nimaps = 1;
> +
> +		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, 0, 0,
> +				0, &tp);
> +		if (error)
> +			return error;
> +
> +		xfs_ilock(ip, XFS_ILOCK_EXCL);
> +		error = xfs_bmapi_read(ip, offset_fsb, end_fsb - offset_fsb,
> +				&imap, &nimaps, 0);
> +		if (error)
> +			goto out_cancel;
> +
> +		if (nimaps == 0)
> +			goto out_cancel;
> +
> +		if (imap.br_state == XFS_EXT_UNWRITTEN) {
> +			xfs_trans_ijoin(tp, ip, 0);
> +
> +			error = xfs_bunmapi(tp, ip, imap.br_startoff,
> +					imap.br_blockcount, 0, 1, &done);
> +			if (error)
> +				goto out_cancel;
> +
> +			error = xfs_trans_commit(tp);
> +		} else {
> +			xfs_trans_cancel(tp);
> +		}
> +		xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +
> +		offset_fsb = imap.br_startoff + imap.br_blockcount;
> +	}
> +
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
> @@ -248,6 +307,14 @@ xfs_fsverity_end_enable(
>  	if (error)
>  		goto out;
>  
> +	/*
> +	 * Remove unwritten extents left by COW preallocations and write
> +	 * preallocation in the merkle tree holes and past descriptor
> +	 */
> +	error = xfs_fsverity_cancel_unwritten(ip, range_start, LLONG_MAX);
> +	if (error)
> +		goto out;
> +
>  	/*
>  	 * Proactively drop any delayed allocations in COW fork, the fsverity
>  	 * files are read-only
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
