Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBsHNE/T3GmcWQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:28:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A843EB4B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9juYCvkTTVRsnpn39CWvuRBAMF8lDnZnNgDLVD7hag=; b=XiIlvhC0lfNbbZoLuZjmFIk4LW
	Okayzqj7Ipjx8vwd/mB9OV6YJD9XxYemNY3y6ovw7mEbGeWrIVwCf1MD/VV7kdswxzM/2mxTI70eJ
	1ON/CyPdSLNb7rWIenk8wRn3SU0k4GhGyT5lgGiBTZkGzCDOjckkzpyze2mJXMsjk7dg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCFSc-00056Y-G9;
	Mon, 13 Apr 2026 11:28:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCFSb-00056R-3f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W+fpzzp1Fo01x3e7YFbwCT0TRXxcyqxWZCUkF78jlBA=; b=hoW6t0xMJjX1rpWCeDANjn1h6Q
 0CIP5/klsfzH2PGDC32D8Co4VqGeWNvjkgdixVuBPpSjlwG7bgAmKS6cEnbvg0Z7rM4MP5egE2SIL
 GxRPMf6tZU5uH3BIt2lA4JOHZ6VGkcDTH5OmdEukAeUthYQaCctigQETFhuTaAGgHRo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W+fpzzp1Fo01x3e7YFbwCT0TRXxcyqxWZCUkF78jlBA=; b=CKT1eK9PjZBd9nTn3QQxAaVZrR
 XMc+hw7W64iQZ/vbS/Wgso8BiUwDTwWO4KnoWDvqex4QYL4YBxQROgd3ssL78YIv9UT4glMNRjU8C
 3OGo1/g6NN0Y3Kxm/D3ryZ1z6rftfoRTJhAjnI0hkpdAFEtioizse+I2Zg32TcKO7vu4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCFSa-0003TF-K3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E52D060172
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 11:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BD2C116C6;
 Mon, 13 Apr 2026 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776079677;
 bh=1V66m994SQyVyDOYYQ2DerYF/StQSxPSJ4YO7HRuc1U=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sDtT38vbnXwBsWN+TnuqbGL2eZKAJ6nr35PsVglPzZ7KVMV8yWHmmfLu65N+4rW6V
 SFIgTO4quSF9g6x1ENMJiDwf3l2GwEoRidHyRLwUmWYemRWA5aUmXOs0AvJgPL92Ny
 Qhn/YHnLigw4Erxs71dk5YhbiKXALM8XggZMVniKbJ79sjqj5dWv0ROrKs5ozsVylJ
 raY4H8+bL7vaQQ4XCvKvdPDTIYDtOr4odod7Bd7/PDP8r4Q4ppLtPjbB8H47YfI/Lc
 1cqWTbJXgoqyTsSMY00mIfl91tG6Enp17jFYSinJJS7VP5PHTZ9MNA+XVg/37A1UdL
 4LClhKAX9d8Sw==
Message-ID: <116344cd-c591-42c9-9593-2e999c2029d8@kernel.org>
Date: Mon, 13 Apr 2026 19:27:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260406154940.2407853-1-jaegeuk@kernel.org>
 <adaasm42rLxRY2GN@google.com>
Content-Language: en-US
In-Reply-To: <adaasm42rLxRY2GN@google.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/9/2026 2:13 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Let's check mmap writes onto the large folio, since we don't support writing
 > large folios. > > Reviewed-by: Daeho Jeong <daehojeong@goo [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCFSa-0003TF-K3
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: do not support mmap write for large
 folio
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCPT_COUNT_THREE(0.00)[3];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 78A843EB4B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/2026 2:13 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Let's check mmap writes onto the large folio, since we don't support writing
> large folios.
> 
> Reviewed-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   - log v2:
>    : add comments
> 
>   fs/f2fs/file.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 2c4880f24b54..c0220cd7b332 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -82,7 +82,12 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   	int err = 0;
>   	vm_fault_t ret;
>   
> -	if (unlikely(IS_IMMUTABLE(inode)))
> +	/*
> +	 * We only support large folio on the read case.
> +	 * Don't make any dirty pages.
> +	 */
> +	if (unlikely(IS_IMMUTABLE(inode)) ||
> +	    mapping_large_folio_support(inode->i_mapping))
>   		return VM_FAULT_SIGBUS;

The code itself looks good, since it's an impossible case, should we
use f2fs_bug_on(, mapping_large_folio_support()) to catch any bug case
rather than just returning error here w/o log?

Thanks,

>   
>   	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
