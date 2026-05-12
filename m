Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGjWKBZZA2r75AEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 18:45:10 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BA524F76
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 18:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMDjZiftjiUOQaVkB0ISoTH6mw3s9se1r75jodMihNk=; b=krH/yldAxtHXZUh1HN7vCsQJgZ
	CMdHbmeY8qHMs6k4Vke8yUdDtEmpE9Q8jnEPveHdhHTSuu1xnwaPIWaNSIyR9AA1l7q5bk19yJc6C
	quothFdT3D1PynRiifBLIJFzFjqM8Mzm7FmSDwLF+uQJVG6EilEr5R8zBTlsn/kqAlV4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMqE7-0006MG-W6;
	Tue, 12 May 2026 16:45:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wMqDp-0006Lw-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 16:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mpgMLCPFNMFUtUG6lufxvu6QdkqjEgXpQgf9/sqIq0Y=; b=DovP5jEnZyle3yVHSYJyUdNo+d
 pnpiC3wwSSUoZ0am9lgLTvGT0MB9cRm45+JRhUX2lpQcoN9VhKvMq2K/DFBEM2re3F4Go8X6h8kra
 Aj6I+dk3z/CB7HvcCxZkTVs1I9gu/RrdriGBXIhA7PhAFGOYlNp4OUvuT2bA9Scbaws4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mpgMLCPFNMFUtUG6lufxvu6QdkqjEgXpQgf9/sqIq0Y=; b=E1yG4cZ53TO8A4rNXIDo2PzbUb
 EqVQDE7vD32kvYIio4smTc2LvLj720IPJ96hlqUkGwjGU1JeLf1wQd1cyXlFgbkapeVBmjcqgEypl
 oPX4ATb3Mz0tsHBg1ej+04drw6pnmKj56+jy0iwdZSBIbIbpwoBdQrqK0lv5hMoyPxxs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMqDn-0007FT-IO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 16:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C049443D6F;
 Tue, 12 May 2026 16:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94604C2BCB0;
 Tue, 12 May 2026 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778604274;
 bh=gGFNGe/d0M89UTLDXMOv6nsS+erKCcqBt2dE1dcvtY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAWk2Dt7RsZrCFS9unG1nWDOKsnka8WTNpKpmGBNL8x/ti9XtrG3TdXrs6WH4e5BU
 ltC3sh8hegMiIJhKNXwPCyaCjCxXKcN7sln8gAHEl7XoYVCpVbVRN6wW1HP9LBKZsk
 1YYQzisER40xRJI3oK6vUJJiQ3ONyUGUkWtGpG/aUgSSGPIlwoW4VgU6aZVdtHWQjH
 ScW0d/Qv5EaSpNSN/yMThsRhOcOKiM7uyAHAnhvQpMYABWHMOAwl+sD0eFkON4mfxa
 nSiVFll9RpwAK0OC8floHetUAzO/VHuZgWvupp/df9NPOhn9OB5hFCFRHSN8xqiz/w
 MMDfyMlGmVcVw==
Date: Tue, 12 May 2026 09:44:34 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260512164434.GG9555@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512053625.2950900-7-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 12, 2026 at 07:35:22AM +0200, Christoph Hellwig
 wrote: > Make use of the abstractions we have. This is a preparation for
 > moving more special casing down into block/. > > Signed-off-by: C [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wMqDn-0007FT-IO
Subject: Re: [f2fs-dev] [PATCH 06/12] swap,
 block: move the block device swapon code into block/fops.c
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-mm@kvack.org, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Chris Li <chrisl@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-cifs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: F22BA524F76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 07:35:22AM +0200, Christoph Hellwig wrote:
> Make use of the abstractions we have.  This is a preparation for
> moving more special casing down into block/.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice straightforward hoist.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  block/fops.c  | 6 ++++++
>  mm/swapfile.c | 5 -----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index bb6642b45937..453141801684 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -949,6 +949,11 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
>  	return generic_file_mmap_prepare(desc);
>  }
>  
> +static int blkdev_swap_activate(struct file *file, struct swap_info_struct *sis)
> +{
> +	return add_swap_extent(sis, sis->max, 0);
> +}
> +
>  const struct file_operations def_blk_fops = {
>  	.open		= blkdev_open,
>  	.release	= blkdev_release,
> @@ -965,6 +970,7 @@ const struct file_operations def_blk_fops = {
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fallocate	= blkdev_fallocate,
> +	.swap_activate	= blkdev_swap_activate,
>  	.uring_cmd	= blkdev_uring_cmd,
>  	.fop_flags	= FOP_BUFFER_RASYNC,
>  };
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 1b7fc03612f4..fbf11c8c5c69 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2781,13 +2781,8 @@ EXPORT_SYMBOL_GPL(add_swap_extent);
>  static int setup_swap_extents(struct swap_info_struct *sis,
>  			      struct file *swap_file)
>  {
> -	struct address_space *mapping = swap_file->f_mapping;
> -	struct inode *inode = mapping->host;
>  	int ret, error = 0;
>  
> -	if (S_ISBLK(inode->i_mode))
> -		return add_swap_extent(sis, sis->max, 0);
> -
>  	if (swap_file->f_op->swap_activate)
>  		ret = swap_file->f_op->swap_activate(swap_file, sis);
>  	else
> -- 
> 2.53.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
