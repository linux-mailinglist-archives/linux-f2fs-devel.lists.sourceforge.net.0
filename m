Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDO7A9NeA2qE5QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 19:09:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6852579B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 19:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+pfxSHdBUYwWumHUcs8J2bC8b1/talhE17UOoWs9NY=; b=mdmeuFsOkMpvZlHfDMK3/5r3yD
	Dg7lgj+cT2eh2WvWg9nVkuLQNwjrUIFim7Op/i6nEOOZb3Bk79/qlr/PlH9YV90In6JBoSQDhAQld
	dSKiWGl+7lP0QL/7gaDGYKNPJRaFiYzarUvAIeLBxo99wNv4Cu2msB1kzEpbXmv1IoeM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMqby-0001RZ-NE;
	Tue, 12 May 2026 17:09:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wMqbx-0001RS-H6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 17:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QtFTnWMWJzFGeaKLLmcb0EqyVQvprDE94/pwqwGkskw=; b=ZrBw4aK45wIaJm4jz6vKKZ6bd8
 6+bKLHRoePpUZCRY6pDKq/UQZvUi93gv3DunyLfltqdiSbyCS+OIhoExfBDpzrlP2XIaXvAM7duOI
 8PT7b0QIPLXYUNe8CzlQqtjJRd6Bx4agF6rwuW8ft1qZ/KHkgnuC2xxzDGurjdeb4ybk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QtFTnWMWJzFGeaKLLmcb0EqyVQvprDE94/pwqwGkskw=; b=jxG8MM6J5axaWZE4RGFQrEar7t
 aGxaQ9Pu4fPVUnFHydLAJ0wec4LuWaXySE9neLc41sZnSWqE+NHSj4lxybjkAqjzRtTOsxmU2r3Yy
 blXgcgJahnrN6urRMuYeGoLZj9G3sNbzAO8KFWG+O/Mfo+yXvxVmJfXk+dSmHJ3d1OA8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMqbs-0000av-EX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 17:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9233D40740;
 Tue, 12 May 2026 17:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66493C2BCB0;
 Tue, 12 May 2026 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778605767;
 bh=Adu4k9PdOIdLwtwgwkK9s/zvDBkfua5WJ/GmI2xgu9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NOIMsY8RFaGmBa1B0NfQZRKTTC2Opt5G0UGNWkG2xX+oKei2g/2sY1sAEGHPUfcfE
 bCnaHbLx2Behy/Q86tImeSUpr4suA18Ov4lpRDztKh8E1mdkpboOF+xdQN+859Ke+k
 YHA9pQoNGul4pjzyGV+AcILGaOLieox338qli/gOFjxsVI3VZUdR9VCQ/hWphy05U9
 dBvIgkYEiq6XWk478ZrgLGvSBsP97O+F642Ovkd5vN1N1txh6n6sjbOBn/tivsY95b
 w8EPdawuqPfAI8KY93US4598VyP4RHdazNd8TO2VApANA5L6CfFSVNFZTlOMQzXONy
 BQNmYWhO7KwKg==
Date: Tue, 12 May 2026 10:09:27 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260512170927.GK9555@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512053625.2950900-11-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 12, 2026 at 07:35:26AM +0200, Christoph Hellwig
 wrote: > Add a helper abstracting away the low-level details of enabling
 > fs_ops-based swapping. This prepares for taking swap_info_struct [...] 
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
X-Headers-End: 1wMqbs-0000av-EX
Subject: Re: [f2fs-dev] [PATCH 10/12] swap: add a swap_activate_fs_ops helper
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
X-Rspamd-Queue-Id: 5EE6852579B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 07:35:26AM +0200, Christoph Hellwig wrote:
> Add a helper abstracting away the low-level details of enabling
> fs_ops-based swapping.  This prepares for taking swap_info_struct
> private.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/nfs/file.c        | 4 +---
>  fs/smb/client/file.c | 3 +--
>  include/linux/swap.h | 5 +++++
>  mm/swapfile.c        | 7 +++++++
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 10ab2a923835..ce4d860c4e7a 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -588,7 +588,7 @@ int nfs_swap_activate(struct file *file, struct swap_info_struct *sis)
>  	ret = rpc_clnt_swap_activate(clnt);
>  	if (ret)
>  		return ret;
> -	ret = add_swap_extent(sis, sis->max, NULL, 0);
> +	ret = swap_activate_fs_ops(sis);
>  	if (ret < 0) {
>  		rpc_clnt_swap_deactivate(clnt);
>  		return ret;
> @@ -596,8 +596,6 @@ int nfs_swap_activate(struct file *file, struct swap_info_struct *sis)
>  
>  	if (cl->rpc_ops->enable_swap)
>  		cl->rpc_ops->enable_swap(inode);
> -
> -	sis->flags |= SWP_FS_OPS;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(nfs_swap_activate);
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index e1bbc65ce7f3..e11065be1e64 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -3326,8 +3326,7 @@ int cifs_swap_activate(struct file *swap_file, struct swap_info_struct *sis)
>  	 * from reading or writing the file
>  	 */
>  
> -	sis->flags |= SWP_FS_OPS;
> -	return add_swap_extent(sis, sis->max, NULL, 0);
> +	return swap_activate_fs_ops(sis);
>  }
>  
>  void cifs_swap_deactivate(struct file *file)
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index b1cbb67ddd8e..916889738f08 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -406,6 +406,7 @@ extern void __meminit kswapd_stop(int nid);
>  int add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
>  		struct block_device *bdev, sector_t start_block);
>  int generic_swap_activate(struct file *swap_file, struct swap_info_struct *sis);
> +int swap_activate_fs_ops(struct swap_info_struct *sis);
>  
>  static inline unsigned long total_swapcache_pages(void)
>  {
> @@ -532,6 +533,10 @@ static inline int add_swap_extent(struct swap_info_struct *sis,
>  {
>  	return -EINVAL;
>  }
> +static inline int swap_activate_fs_ops(struct swap_info_struct *sis)
> +{
> +	return -EINVAL;
> +}
>  #endif /* CONFIG_SWAP */
>  #ifdef CONFIG_MEMCG
>  static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 2c9d2af736c4..26852c2ad36e 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2757,6 +2757,13 @@ add_swap_extent(struct swap_info_struct *sis, unsigned long nr_pages,
>  }
>  EXPORT_SYMBOL_GPL(add_swap_extent);
>  
> +int swap_activate_fs_ops(struct swap_info_struct *sis)
> +{
> +	sis->flags |= SWP_FS_OPS;
> +	return add_swap_extent(sis, sis->max, NULL, 0);
> +}
> +EXPORT_SYMBOL_GPL(swap_activate_fs_ops);
> +
>  /*
>   * A `swap extent' is a simple thing which maps a contiguous range of pages
>   * onto a contiguous range of disk blocks.  A rbtree of swap extents is
> -- 
> 2.53.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
