Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILdEEf/zcmmhrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 05:07:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D532703D8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 05:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PSqxEjQumdxsR06CJIiyZE9Flh3dCA0PHNJCAF0XkI=; b=GXPB14J5cmqD6iz2gsHgmRBXnn
	6EcHWQKf1km/GWLQyOx4GIZ/uZVYKao3Vr4eZ6YDm/1aRbz8l6vl30M1d+gHixJlypPAvX9qRSUNK
	PhfGclOzaIwKNPTUn853sIxt1auMyqnCdz2REw4wYcefvNd+h1EeHoSwx+871TDnYUpE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj8S6-0007gD-Sc;
	Fri, 23 Jan 2026 04:07:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vj8S5-0007g6-M9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 04:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7E9SAO0qpCDu6JiO1aIh2P4GAetuFpYD5fMQdMmqT8=; b=KXn7YhB7Z8i09ORH6WbWUFFT/b
 IoOLeAojOAoVx4Jxumw/UQq41ewrQbeeVym/cWencpHrqenePCjztC9cUQguq4ZqV5eauVb/bGJMl
 eKZgp3H7UizjCQDM0w1k1YeUBGS3zxLbant3jDN7iZUepI0fPw1Neulg9JaBzJD+dhWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J7E9SAO0qpCDu6JiO1aIh2P4GAetuFpYD5fMQdMmqT8=; b=VzV0BJ522p9vTxB7fKAjO/R/id
 6nxv3uESOAjG6hRIViTbnRE5wBVaOAXGjimlfr4RDhctvV9wnPs7wozyG9vBL2rVj/UWJWaVq1U7J
 GQF8n9IuPIkhGAHrWt5gzJGDV84WW9FL35avEJwOligumhcFCEyVFN4AvaaNe3XN5CyU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj8S5-0003rm-6Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 04:07:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C141940377;
 Fri, 23 Jan 2026 04:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15EFC4CEF1;
 Fri, 23 Jan 2026 04:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769141226;
 bh=oPemzsRDwcvtv2dxilZkGkwwsxrceXLp8Vv86KtzWi0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=NFJrBqnk1pv+aOwszIgLU12EDlgiQZmCMH4K7zUsm3WuhuO2adeKgpT2pXj7K4RR1
 CIYdwQWzsBHesr+cp2W5RyAf+qrOXhmXIw8T6lmjmhE2hGM5IaoopXEpTSMWyrhcs+
 jIYEwW8FyjxS2/EFVXmB6OFcB852LPuxl+PX6FwM5furxdtyGYk52ufgAU0KYXz9U2
 9AJJY2v+E347ZeaTtpak7r9GuQAEKLWD/FEMkG3MKeBi7L6RStLQUBduxI7kYbgT4r
 64RPQDdck9VaSutLS6mhCy0MKVgY5hTnnXOVA6dnMhoJtWa1TnVDZ+KfxqtAyx69ie
 OsWEZsTpPW3Ww==
Message-ID: <02ef4102-f143-4939-b3db-71dbaf74b5b7@kernel.org>
Date: Fri, 23 Jan 2026 12:07:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yeongjin Gil <youngjin.gil@samsung.com>, jaegeuk@kernel.org,
 jyh429@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <CGME20260122104529epcas1p4ea35d60de87ef7ed53c5a02b0ce921b2@epcas1p4.samsung.com>
 <20260122104527.416871-1-youngjin.gil@samsung.com>
Content-Language: en-US
In-Reply-To: <20260122104527.416871-1-youngjin.gil@samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/22/2026 6:45 PM, Yeongjin Gil wrote: > When overwriting
 already allocated blocks, f2fs_iomap_begin() calls > f2fs_overwrite_io()
 to check block mappings. However, > f2fs_overwrite_io() iterates t [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj8S5-0003rm-6Z
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: optimize f2fs_overwrite_io() for
 f2fs_iomap_begin
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Sungjong Seo <sj1557.seo@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:youngjin.gil@samsung.com,m:jaegeuk@kernel.org,m:jyh429@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:sj1557.seo@samsung.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[samsung.com,kernel.org,gmail.com,lists.sourceforge.net,vger.kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,samsung.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 8D532703D8
X-Rspamd-Action: no action

On 1/22/2026 6:45 PM, Yeongjin Gil wrote:
> When overwriting already allocated blocks, f2fs_iomap_begin() calls
> f2fs_overwrite_io() to check block mappings. However,
> f2fs_overwrite_io() iterates through all mapped blocks in the range,
> which can be inefficient for fragmented files with large I/O requests.
> 
> This patch optimizes f2fs_overwrite_io() by adding a 'check_first'
> parameter and introducing __f2fs_overwrite_io() helper. When called from
> f2fs_iomap_begin(), we only check the first mapping to determine if the
> range is already allocated, which is sufficient for setting
> map.m_may_create.
> 
> This optimization significantly reduces the number of f2fs_map_blocks()
> calls in f2fs_overwrite_io() when called from f2fs_iomap_begin(),
> especially for fragmented files with large I/O requests.
> 

Cc: stable@kernel.org

> Fixes: 351bc761338d ("f2fs: optimize f2fs DIO overwrites")
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/data.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2e133a723b99..11c262afad65 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1851,7 +1851,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>   	return err;
>   }
>   
> -bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
> +static bool __f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len,
> +				bool check_first)
>   {
>   	struct f2fs_map_blocks map;
>   	block_t last_lblk;
> @@ -1873,10 +1874,17 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
>   		if (err || map.m_len == 0)
>   			return false;
>   		map.m_lblk += map.m_len;
> +		if (check_first)
> +			break;
>   	}
>   	return true;
>   }
>   
> +bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
> +{
> +	return __f2fs_overwrite_io(inode, pos, len, false);
> +}
> +
>   static int f2fs_xattr_fiemap(struct inode *inode,
>   				struct fiemap_extent_info *fieinfo)
>   {
> @@ -4443,7 +4451,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   	 * f2fs_map_lock and f2fs_balance_fs are not necessary.
>   	 */
>   	if ((flags & IOMAP_WRITE) &&
> -		!f2fs_overwrite_io(inode, offset, length))
> +		!__f2fs_overwrite_io(inode, offset, length, true))
>   		map.m_may_create = true;
>   
>   	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
