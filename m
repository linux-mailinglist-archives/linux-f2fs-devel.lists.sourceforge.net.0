Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL5aFwoJqGn2nQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 11:27:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C40401FE52C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 11:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJqTFDQ4IQ61xgQMC28eWeGXm1sLrqGQq+x8lFKoOwE=; b=d3Tht3VI6knLj6kzUrfSA2s1fD
	/jes15kj9EuBndDLcGtWDNMOhQ/9nYsVcuvabBJYggdXzKjjysoqW5C5PkqHBJ4T2bLU1aedl1SDq
	ShENQKyJbgus5rJ+my/SJiXH7BxLEbqDW0WMjxmpbA6wiTav2w/5fEWgZ4UkRyMJc7ik=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxjRg-0003CB-Do;
	Wed, 04 Mar 2026 10:27:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxjRf-0003C5-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 10:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0P0uTPWMOSdi03M7nHmuOvZiubamLfsHWdojvow+PE=; b=JI+CB3Kw3N7cJeiBIeBouZQXqZ
 yggMoyWP4i1FmkXyHcTkZNhOxfY73dl/i3MFeLP8ESEfv7lNVW74BeOOX2PPGrJAOXMRdvRBt3Eg1
 z3QCsYF/A+ZTyOAlH1XmNM5y+AZT3NH2ctWhfvrLqVBnRxs9mDTF6nQ0jvWyHkIcrKyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W0P0uTPWMOSdi03M7nHmuOvZiubamLfsHWdojvow+PE=; b=U6WoL1BqhVAQmcffckF3eqSfvs
 PneNgauzPUOPfl7d+2hx9SES6NprvxNnXFxuthGHPIdLMmlcK/1ZT7RmoABMZK34vQaTutxnFAGfi
 st0FXgwnI/dtP0VrHwBq8gaaxZIpMcQT3UmK8S3mu7ErxYLG+w8W1W2kKVBxvhGDFkvs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxjRf-0001nG-Az for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 10:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0169C43DB1;
 Wed,  4 Mar 2026 10:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BE1C19423;
 Wed,  4 Mar 2026 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772620025;
 bh=ZUgu2KGkXST7/34zgv0DJbbpFvMFueiQ0WsCuyANfSM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tJ/wOkfKQF7otHVOHZbJnq+eRvXHlqdXPFne4Qao3pVostMkD71ZO9Ux88rvhZGez
 tJVIVPHzFy+M501gI7XKTn1B3yv9YEL9vCY7f2rny9FOj1G4Jgx0DA/OpGRnUCmrj6
 tEF5Vda38OAZgh9hkSqMKZq7zw5mZ66iz30+GjHDKEf8eDGOsrx77gf6WEp/1qRM/B
 BDadX85I5hINw4w5AqtTPtzrcMmNwtTCdgHppW4ZiTWbYQnPWCdoJDHGcOtm4LDSSd
 p4d9Pahf+2ttf3I8J8XaZgQdaajAECadedFkZJQZ34blru/zf7RsE+k7m2C8z+BpKb
 FQUVda5P9/DGg==
Message-ID: <e78f79ed-97ce-45fd-9e16-7495626453eb@kernel.org>
Date: Wed, 4 Mar 2026 18:26:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Antipov <dmantipov@yandex.ru>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260206092958.578191-1-dmantipov@yandex.ru>
Content-Language: en-US
In-Reply-To: <20260206092958.578191-1-dmantipov@yandex.ru>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/6 17:29, Dmitry Antipov wrote: > Shouldn't it be
 in this way instead? Note the whole thing looks > somewhat confusing - the
 comment says "always truncate page 0" > but the code explicitly sa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxjRf-0001nG-Az
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: on truncating first page in error
 path of f2fs_truncate()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: C40401FE52C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmantipov@yandex.ru,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yandex.ru,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url]
X-Rspamd-Action: no action

On 2026/2/6 17:29, Dmitry Antipov wrote:
> Shouldn't it be in this way instead? Note the whole thing looks
> somewhat confusing - the comment says "always truncate page 0"
> but the code explicitly says "in case of error, truncate page 0".
> 
> This seems fixes https://syzkaller.appspot.com/bug?extid=fc026e87558558f75c00.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>   fs/f2fs/file.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d7047ca6b98d..bfc9ff97e4a5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -910,16 +910,15 @@ int f2fs_truncate(struct inode *inode)
>   	/* we should check inline_data size */
>   	if (!f2fs_may_inline_data(inode)) {
>   		err = f2fs_convert_inline_inode(inode);
> -		if (err) {
> -			/*
> -			 * Always truncate page #0 to avoid page cache
> -			 * leak in evict() path.
> -			 */
> -			truncate_inode_pages_range(inode->i_mapping,
> -					F2FS_BLK_TO_BYTES(0),
> -					F2FS_BLK_END_BYTES(0));
> +		/*
> +		 * Always truncate page #0 to avoid page cache
> +		 * leak in evict() path.
> +		 */
> +		truncate_inode_pages_range(inode->i_mapping,
> +					   F2FS_BLK_TO_BYTES(0),
> +					   F2FS_BLK_END_BYTES(0));

Seems it can fix this issue, but my question is can we explain the details
why it can cause to leave page #0 after f2fs_convert_inline_inode() w/o any
failure.

Thanks,

> +		if (err)
>   			return err;
> -		}
>   	}
>   
>   	err = f2fs_truncate_blocks(inode, i_size_read(inode), true);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
