Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GojN4Jsr2m6YQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:57:38 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D23243394
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t+H4gTgX0xDr/tCvgudMY2h3wYsuY8PIxa0U+D57jQ=; b=arcpotS3tFPCg1/Bpr+Xfm1p2r
	IcxIFyVGHgmPmN7PGFa6CVetPIwqQDmVRF8REdazLDy2tV0Qk2/qj/xk0YioMQiAb717PXaMcoUGG
	LIG1i1q2/gvbjtOyWEYnjqD9H6xTHHfmr1aEmaD65QX9zAoKS/ccroxng1TGF0dwR/wo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlPi-0006H5-IK;
	Tue, 10 Mar 2026 00:57:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlPh-0006Gx-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RTz5DvMnE/qd237F3FtsP+q9KQqyw9dU8IQq3NH9a/s=; b=FgSBTMwA8+pyUyjoCEgTD51Uq2
 FMpnFvlIY0LN+ETfdqC/ekf3LxlEdNtJhIq12ilOtGNtR6UTLSdVjthTA9z1vxDazqArYM5X7lHiS
 +bTXbB/knzfppw0WDiELOSTej+7OBfOv/CrIcpb/jDF3uFfk6n4l/XVJu3prYOMCHDuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RTz5DvMnE/qd237F3FtsP+q9KQqyw9dU8IQq3NH9a/s=; b=m2UiIQgLzS9h6u+a3XXDh/Ishc
 p8o71IyVaFg3cbu2sLYE6CMPUIOIHGAhIvbMJZxDq0U1vRb4cSnXnzfrjZrjeK38BgAcAW4G0cP91
 U6QlMAyih+AAmvt/jJ3o0XDl0OJfsLcf/gwhv10JJBVtr+h0NsKGlpf/UofwsMjirlGA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlPh-0006t7-Nb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 070CC600AE;
 Tue, 10 Mar 2026 00:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A999FC4CEF7;
 Tue, 10 Mar 2026 00:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773104242;
 bh=iFfH4GoxlpMzD7FlVr3QH3NNuwbWxg7Oyz+8cddwelk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dUUIEuXPW5xAglItpVBzDlJT93IBW/dPL/CjgwRq2n7Ugd+Yj1avtGSJZV9w24l7k
 6bvv/BoqhohXNRHcIKeOTRr0s9ncsK/CA0ZK2s1/jCkl4KUjx/PCT+wP/O4epQIYvq
 pu6O79M4ChdcxpmWjiZmd4fGloOsUwrYSonE50pKySY1h+sSeEFKTxfwu3IF0043iL
 nMKwy1+eiXnj3WFwrGnM6G0XC/xpMq6gBySMEjl1ynitlwNTIN7A2FE5XWR3b7l6ha
 Vzzc3DRZv5vZ1fw7j/Bfmf8pF2vqGdfPKV5dWcPUmXEbiIfi1xUGPzsLSFmpiESWqJ
 QhRYqNSUdCK7g==
Date: Mon, 9 Mar 2026 17:57:22 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310005722.GB6033@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-9-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-9-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:23PM +0100, Andrey Albershteyn
 wrote: > Obtain fsverity info for folios with file data. Filesystem can pass
 vi > down to ioend and then to fsverity for verification. XFS [...] 
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
X-Headers-End: 1vzlPh-0006t7-Nb
Subject: Re: [f2fs-dev] [PATCH v4 08/25] iomap: obtain fsverity info for
 read path
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
X-Rspamd-Queue-Id: 62D23243394
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:23PM +0100, Andrey Albershteyn wrote:
> Obtain fsverity info for folios with file data. Filesystem can pass vi
> down to ioend and then to fsverity for verification. XFS will use it in
> further patch for fsverity integration.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

Looks good to me,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 7 +++++++
>  include/linux/iomap.h  | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 530794dcdd91..a335a18c307f 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -9,6 +9,7 @@
>  #include <linux/swap.h>
>  #include <linux/migrate.h>
>  #include <linux/fserror.h>
> +#include <linux/fsverity.h>
>  #include "internal.h"
>  #include "trace.h"
>  
> @@ -590,6 +591,9 @@ void iomap_read_folio(const struct iomap_ops *ops,
>  
>  	trace_iomap_readpage(iter.inode, 1);
>  
> +	if (iter.pos < i_size_read(iter.inode))
> +		ctx->vi = fsverity_get_info(iter.inode);
> +
>  	while ((ret = iomap_iter(&iter, ops)) > 0)
>  		iter.status = iomap_read_folio_iter(&iter, ctx,
>  				&bytes_submitted);
> @@ -656,6 +660,9 @@ void iomap_readahead(const struct iomap_ops *ops,
>  
>  	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
>  
> +	if (iter.pos < i_size_read(iter.inode))
> +		ctx->vi = fsverity_get_info(iter.inode);
> +
>  	while (iomap_iter(&iter, ops) > 0)
>  		iter.status = iomap_readahead_iter(&iter, ctx,
>  					&cur_bytes_submitted);
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index dc39837b0d45..89e5a7abc012 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -432,6 +432,7 @@ struct iomap_ioend {
>  	loff_t			io_offset;	/* offset in the file */
>  	sector_t		io_sector;	/* start sector of ioend */
>  	void			*io_private;	/* file system private data */
> +	struct fsverity_info	*io_vi;		/* fsverity info */
>  	struct bio		io_bio;		/* MUST BE LAST! */
>  };
>  
> @@ -506,6 +507,7 @@ struct iomap_read_folio_ctx {
>  	struct readahead_control *rac;
>  	void			*read_ctx;
>  	loff_t			read_ctx_file_offset;
> +	struct fsverity_info	*vi;
>  };
>  
>  struct iomap_read_ops {
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
