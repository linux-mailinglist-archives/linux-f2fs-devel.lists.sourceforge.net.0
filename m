Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z5qcIUB5MGrFTQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 00:14:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A079168A4EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 00:14:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Qd+9po64;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=NOfaFejY;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QMzSSgq7;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=chJZr1+b;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QISalx/uojhsrEfVX4kS0V2ZVjc0r6zg9ZqlmYn2dqw=; b=Qd+9po64FiGXqo2c0bVeX/wSwP
	x0xpvywSEyYNE5kGA/d6+mcoSX6CMbPfXaLMoGt20utSHKLVOFq8u0vo2ojnqAauY/FbTCcDcZKze
	TnYeblxdQLQKYtyoYq2xsE28BcW5hQycXGKbbm9q4XArdSVdUUrGxR/E3WVpP8PA0X70=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZFZN-0002Rw-3q;
	Mon, 15 Jun 2026 22:14:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZFZL-0002Rp-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 22:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RLxFJdLIql7MbBrnK3QRzh9DIYIv+a6fxnlEY07UEvU=; b=NOfaFejYXaIfh0q26jrlA7E2+7
 s1h6dpwBKYjbp7N5PtZZRkPYLrxLLONBfOnne1wU9QeSL9SNErfAhJsNW3c9bKZ5BrrDsG8ZGP56W
 hkMoEeu48Pz6vU225VnKIMVyFv5L0IKkaqd27EHG9+yRN52o7A1/GxL2ZgHZMU/vRMWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RLxFJdLIql7MbBrnK3QRzh9DIYIv+a6fxnlEY07UEvU=; b=QMzSSgq74az82dV25DQV689iiu
 Co1xyhGZMwODT6sTqbq6l1C1OjK0/+TPPSt+CpYNVhV4QPYiueBbYVm+2kGBvYgLPU7wk4ws12hFW
 mWzAecfF7GQc24vuIooLrC/n8wDlNb0+avKKWWdqDYWsun9o2LPhZ7CenhUQaJbNSZWw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZFZK-0006yb-Ci for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 22:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 443436008A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 22:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D252F1F000E9;
 Mon, 15 Jun 2026 22:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781561645;
 bh=RLxFJdLIql7MbBrnK3QRzh9DIYIv+a6fxnlEY07UEvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=chJZr1+b9hEfSzbGrwa4Fal0zaO1PH2oEnOVg4PUWqCpYhnXaCfOz/GBVoesaK8vA
 rVCISAp1P5pg3NfgqHKcOCv5zWnYjbA3+zLAScJwK3PtEy9WEG9efALWC18lwQUfxG
 JgE+lZRtHDeAnKdyb6eVfnUY7EPWykXhbKfOv8LSUvZZxdwombQPj1UCdSjJadE1+R
 lOEpLiT1exgAA+mLzWNb3NR21/4m2v4d2KgELwU3p2cnBgehD+iAL6rgaSjim0HM/y
 MNeodVEAUSnrCO8N/HrIyxWkaG3UvANy5jib52yZ7Ss7+7UcWhgj4khc2kNQdqX6/D
 jh911HJS9EzEA==
Date: Mon, 15 Jun 2026 22:14:03 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ajB5K8SPT3Jq9480@google.com>
References: <20260615130822.2576088-1-chao@kernel.org>
 <20260615130822.2576088-4-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260615130822.2576088-4-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/15,
 Chao Yu via Linux-f2fs-devel wrote: > fscrypt_finalize_bounce_page()
 should be called only if we use fs layer > crypto, let's avoid unnecessary
 fscrypt_finalize_bounce_page() in error > path [...] 
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
X-Headers-End: 1wZFZK-0006yb-Ci
Subject: Re: [f2fs-dev] [PATCH 4/6] f2fs: avoid unnecessary
 fscrypt_finalize_bounce_page()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A079168A4EA

On 06/15, Chao Yu via Linux-f2fs-devel wrote:
> fscrypt_finalize_bounce_page() should be called only if we use fs layer
> crypto, let's avoid unnecessary fscrypt_finalize_bounce_page() in error
> path of f2fs_write_compressed_pages().
> 
> BTW, fscrypt_finalize_bounce_page() will check mapping of bounced page
> before retrieving original page, so, previously it won't cause any issue
> w/ fscrypt_finalize_bounce_page(), but still we'd better avoid coupling
> w/ any logic inside fscrypt_finalize_bounce_page().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/compress.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index caf522d667d6..aaa0813eabcd 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1455,10 +1455,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  out_destroy_crypt:
>  	page_array_free(sbi, cic->rpages, cc->cluster_size);
>  
> -	for (--i; i >= 0; i--) {
> -		if (!cc->cpages[i])
> -			continue;
> -		fscrypt_finalize_bounce_page(&cc->cpages[i]);
> +	if (fio.encrypted) {
> +		for (--i; i >= 0; i--) {
> +			if (!cc->cpages[i])
> +				continue;
> +			fscrypt_finalize_bounce_page(&cc->cpages[i]);
> +		}

Applied as:

--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1455,6 +1455,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 out_destroy_crypt:
        page_array_free(sbi, cic->rpages, cc->cluster_size);

+       if (!fio.encrypted)
+               goto out_put_cic;
+
        for (--i; i >= 0; i--) {
                if (!cc->cpages[i])
                        continue;


>  	}
>  out_put_cic:
>  	kmem_cache_free(cic_entry_slab, cic);
> -- 
> 2.49.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
