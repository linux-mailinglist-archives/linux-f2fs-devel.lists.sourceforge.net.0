Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8euFEGnoL2pwIwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 13:56:25 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5395E685E30
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 13:56:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=BABvYxkC;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=SCHANYeM;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NuzX26ni;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Z0t6pr6Z;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jweqOANqgEdBA2ys9p8ODDbmHRtzs3D7x02qsjn4bXY=; b=BABvYxkChhEgQr5/e2C3WLDBw7
	UE0+jQeFagNbZelahdUaQ+KHCLXVXYEqVXYt2qxzf9KCm3OS3RRjl3ksXQzOXIrWZM7ekDkmaEcao
	mbMd8eoAZKonocXhdexrzUoKnehVC8vh9NeWHFjPKcd2p7/MNopVWBIDzOELWkJYRiho=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ5vG-0007Gw-VA;
	Mon, 15 Jun 2026 11:56:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ5vF-0007Gg-AU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 11:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lHE12hWg1VCuFKpHq9M5SnHiQq3LVPF6YJTacpmSnRM=; b=SCHANYeMSuo2TvVGg7Q5v2mGKW
 PC6G0u+SLBasuJIIDVDompaGW2DA9Rnq0VWDOAOBEiFbIzq57UmbZmnAKsH9hwISGMZUoteENQgPW
 jMxJMOHjFFhFO5LM5IMSueSpPhsekxfyQaSxy/3ndfP1H3e6E2wEMoi5XUEsyZh9Ij0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lHE12hWg1VCuFKpHq9M5SnHiQq3LVPF6YJTacpmSnRM=; b=NuzX26ni1oJELrYZqBqI9V3dOk
 Mt9iNPzA1Reu1BFytT0ZYQTe/ifoMkWswPFtXoUArzWkCepFZ/UkTDP/G3zZgfp0xEYuGZJ/YsUJq
 EHmZbBfZau4QYgMZLb+bUwHJDuOapaBwl7L35HcpVjUUrN7Uk01lrLn/VUb6rgEu3Dsc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ5vE-0000yG-6r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 11:56:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2278543BAD;
 Mon, 15 Jun 2026 11:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5291F000E9;
 Mon, 15 Jun 2026 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781524558;
 bh=lHE12hWg1VCuFKpHq9M5SnHiQq3LVPF6YJTacpmSnRM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=Z0t6pr6ZBpxlJK8ebT8HNU827b0nN+Cm5Vhv1iXlnsaEeVzK+k9hhfTadHmmRxD4H
 YldXaoPaNHlbbu8p9sBbCOwsO9kpVryTgeIj5MHyPmKBoiIQq+9zMXe0dUnQc3TwYH
 edAIVG2CtVHyux7OojOgVx71y1+36aEbOPZiEsz0tkYQ25Pfv17jHyHqvIuHOlWbPB
 2B+H99fOGQwjyO006Rto80+3QmvbyZ+0BFOTsYHhdO3mdMWMbI0JZYofjqilT6rws0
 3FU/D9/8KOn9pFKr9Ktq9ZL9XVxs5/F/13YbI7OkVdFf5kxYT7QMNlubC3fft1OUg0
 uArtM/wpYJ/XA==
Message-ID: <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
Date: Mon, 15 Jun 2026 19:55:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/26 19:58, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > The largest extent takes effect during both
 read mapping and write > mapping lookups, while read mapping does [...] 
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
X-Headers-End: 1wZ5vE-0000yG-6r
Subject: Re: [f2fs-dev] [PATCH RESEND 2/5] f2fs: only initialize largest
 extent without extent_node at inode init
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@gmail.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 5395E685E30

On 6/12/26 19:58, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The largest extent takes effect during both read mapping and write
> mapping lookups, while read mapping does not need to access the
> extent_node. For write mapping, the case where the largest extent is
> not in the extent tree can already be handled by the merge logic, and
> cases that cannot be merged do not require the largest extent to
> participate either.
> 
> Therefore, the largest extent does not need to initialize a
> corresponding extent_node, reducing memory footprint.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/extent_cache.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index aa368a01b035..f8d94db60dc6 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -410,10 +410,8 @@ static void __drop_largest_extent(struct extent_tree *et,
>  void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
>  	struct f2fs_extent *i_ext = &F2FS_INODE(ifolio)->i_ext;
>  	struct extent_tree *et;
> -	struct extent_node *en;
>  	struct extent_info ei = {0};
>  
>  	if (!__may_extent_tree(inode, EX_READ)) {
> @@ -435,21 +433,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>  	if (atomic_read(&et->node_cnt) || !ei.len)
>  		goto skip;
>  
> -	if (IS_DEVICE_ALIASING(inode)) {
> -		et->largest = ei;
> -		goto skip;
> -	}
> -
> -	en = __attach_extent_node(sbi, et, &ei, NULL,
> -				&et->root.rb_root.rb_node, true);
> -	if (en) {
> -		et->largest = en->ei;
> -		et->cached_en = en;
> -
> -		spin_lock(&eti->extent_lock);
> -		list_add_tail(&en->list, &eti->extent_list);
> -		spin_unlock(&eti->extent_lock);
> -	}
> +	et->largest = ei;

Previously, we can split largest extent node to two if we punched it, now
we can not? IIUC.

Thanks,

>  skip:
>  	/* Let's drop, if checkpoint got corrupted. */
>  	if (f2fs_cp_error(sbi)) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
