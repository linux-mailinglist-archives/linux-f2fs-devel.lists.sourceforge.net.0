Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pK5JCm/hL2qTIQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 13:26:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C1C685B95
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 13:26:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fkToAzgb;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="R/SRWNY8";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Fwo28Y2o;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Gp7JQASC;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P48WdPMf3DM7t2mq8NqzJJHCDqQixiUrx8YHx2ROc9Q=; b=fkToAzgb/R6Um+fStOrhteHH2D
	i9cwhzg0mu4B4d2Y0Rtf4spvlMrR6xe3bwva/BFdSKnIj8U2fp57CT8YVQC2qGdcGgpTNinwHp98e
	XaJ4LYCPKDR7mTTNyf4JlvuDzw4lBe16ZFfJWxy9F5nD5EcGFPSvy5tYZdz/R/IItRLI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ5SX-00055X-43;
	Mon, 15 Jun 2026 11:26:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ5SV-00055K-TQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 11:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XMHt+h9xddYe6YjaRa0acSTBMGsZCUh8gtOPIlm+yg=; b=R/SRWNY8BV+/+c88wRut0xoogb
 3E/gR0ww3UVyVo3EzhdWgLkrqed/cWs8R0x5scB1Xe+EG9wbh+nLW7oriMgmyLEqU/dv8tv0tWSvk
 np5MhHZYZGf+HCx+ecmCSGlBsAU56+EmYcft9271UdQQdWzgg05PZX2+GHMsJuxm5WLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7XMHt+h9xddYe6YjaRa0acSTBMGsZCUh8gtOPIlm+yg=; b=Fwo28Y2obWQ0RNZhsecct3CBTR
 dF6+hT/+3jX3DSpfaBs9a0mtpGPy6UMNXoHALI/CsAkUS+bo+9ga/M9zNDHTPpD0oqBd7+OIhD1P8
 NhG3QXR+oAS7A1sxwYHsFt39r3cYtXvxbvl1vRLAgdgLi3pNBe0v9xahuPckbeYsSqqM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ5SU-0003x5-Mq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 11:26:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AAF62406ED;
 Mon, 15 Jun 2026 11:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F2F1F000E9;
 Mon, 15 Jun 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781522781;
 bh=7XMHt+h9xddYe6YjaRa0acSTBMGsZCUh8gtOPIlm+yg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=Gp7JQASCUqlO3zRO3BKjVyAttD3zUS4QoBVDB53zL3mqJI70whYMDbUxkByAnz7Rk
 zcf48FDfKYbhpgYbKNMM+pXT5lDafIQv24+VaN7nMU2PAjuVXy4Tctu/gTPDw0vNHy
 m8FJFkchuwbqEIWpGvQMSe8V5ehFUyroeYnq0ukJUyqLPJtqK0YggGjZ+MuyysxVfk
 X1SDmhjHIAezWqo/tzVtvngBKUGmqFTD6nCFnqgdHnfm0BWC9tHjoyPF5nCSw5HX4u
 KDKiCqea8rOa3TwW6aRg5KK3WQBuOpHMNn1Da7WSWB6PiPrl12nIQReCnerEki8J0c
 +tpEJa/vtpa5A==
Message-ID: <77c78bad-dc2c-4681-b6db-b1ad1c115b0d@kernel.org>
Date: Mon, 15 Jun 2026 19:26:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/26 19:58, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > The following scenario can cause fiemap to
 report incorrect extents: > > $ mkfs.f2fs /dev/vdb -f > $ mount -o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ5SU-0003x5-Mq
Subject: Re: [f2fs-dev] [PATCH RESEND 1/5] f2fs: fix extent merge failure
 when largest extent is not in rb-tree
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@gmail.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53C1C685B95

On 6/12/26 19:58, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The following scenario can cause fiemap to report incorrect extents:
> 
> $ mkfs.f2fs /dev/vdb -f
> $ mount -o mode=lfs /dev/vdb /mnt/f2fs/
> $ dd if=/dev/urandom of=data bs=4K count=874 conv=notrunc
> $ f2fs_io fiemap 0 1000000 data 1
> $ shrink all extent
> $ dd if=/dev/urandom of=data bs=4K count=150 seek=874 conv=notrunc
> $ f2fs_io fiemap 0 1000000 data 1
> Fiemap: offset = 0 len = 1000000
>         logical addr.    physical addr.   length           flags
> 0       0000000000000000 00000002868d4000 000000000036a000 00001000
> 1       000000000036a000 0000000286c3e000 0000000000096000 00001001
> 
> The root cause is that when the largest extent is not in the extent
> tree, mergeable extents are not merged, causing f2fs_map_blocks to
> misjudge and output an incorrect extent list.
> 
> Fix this by allowing the extent being inserted to merge with the largest
> extent. When updating the extent tree range, if the new extent can be
> front-merged or back-merged with the largest extent and the largest
> extent is not in the rb-tree, merge them before the normal lookup.
> 
> Fixes: 429511cdf8b3 ("f2fs: add core functions for rb-tree extent cache")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/extent_cache.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 61f6b9714366..aa368a01b035 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -702,6 +702,27 @@ static void __update_extent_tree_range(struct inode *inode,
>  		__drop_largest_extent(et, fofs, len);
>  	}
>  

This can only be used for EX_READ?

> +	if (et->largest.len != 0 &&
> +			(__is_front_mergeable(tei, &et->largest, type) ||
> +			 __is_back_mergeable(tei, &et->largest, type))) {
> +		/* 0. try to merge with largest extent. */
> +		en = __lookup_extent_node_ret(&et->root,
> +				et->cached_en, et->largest.fofs,
> +				&prev_en, &next_en,
> +				&insert_p, &insert_parent,
> +				&leftmost);
> +		if (!en) {
> +			if (__is_back_mergeable(tei, &et->largest, type)) {

Can we reuse result of previous __is_back_mergeable()?

Thanks,

> +				tei->fofs = et->largest.fofs;
> +				tei->blk = et->largest.blk;
> +				fofs = tei->fofs;
> +			}
> +			tei->len += et->largest.len;
> +			len = tei->len;
> +			end = fofs + len;
> +		}
> +	}
> +
>  	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
>  	en = __lookup_extent_node_ret(&et->root,
>  					et->cached_en, fofs,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
