Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qExZEXBCrmkjBQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 04:45:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C74233919
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 04:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOBlup2ZtgbDiZ+L1cQdyL43tiGXiqbyvT7AUe1I0wQ=; b=jyuOoXzVMLzue4CTC3WUxwkp63
	koEpOYI/FRg3AhCZXd5GEK/rvjQVjA/UraYb6LYPhGOSTGa/BmHLHjruLh3WN4DUL66hNtcdAF5AH
	voh1Ik7BqIE9jn0/EAKCRkb9n2Ix8GPTT322+B+4zb3tPVMb8QbQz/czohbbDPHY53cg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzRYv-0006K8-NW;
	Mon, 09 Mar 2026 03:45:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzRYu-0006K0-OO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 03:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k2AX4ZV0zxqQuwqZFsC90Lucrto73scN59boY5hARh4=; b=WeCQvVhPp2yrfWTZQ0KQmySO5l
 f0CfKFJJBXTqx+uA3VmmYCJ2xFDPxUzyIOPvRIkIDRhnnEdWp7AQjALZNRDDfGWND7hIiwWMxh0ZS
 FLLxzN2u+V66Boff3W75zFkF5jL3vnQ6mVbwCmniGod7LQRDTHWUaNvOBTEl7ehRNMZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k2AX4ZV0zxqQuwqZFsC90Lucrto73scN59boY5hARh4=; b=lpaqm3V/RmUUXi9AXlfDXZsBNE
 I5NNKw7N1BqgdkdtuByXZt1NEVvT5Lb0uV1PDlxRYZxP4OLPG8BMa1WFUspE4xYpbtTnYjLNdzTjf
 oWRA0ppwoT4EroK3WarSCTbNPPxDVfIu43QbiBC/v5giDdtzwTh5u4Sewquosls3BEmU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzRYu-00063i-5t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 03:45:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63851600AD;
 Mon,  9 Mar 2026 03:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E9FC4CEF7;
 Mon,  9 Mar 2026 03:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773027938;
 bh=tuEluzeG+e7yXqjlcAbPDyLuTTReB5NjisWL6xjG+30=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hiVkPWDUom3bqJBiC9ivaXd141HLxHpuUGDZ91V+Xue5Rck9zZEuwLjseBcHfi3SP
 rL+7aszTOX13cF83JMqlKO1UGuY0YFBFdT9Fzk7AORQeZZGN9H/8tBiQ7+kxf1kK08
 +HJ6SpnK1SLV7mrU3RtWKqCqRqGy4lQkydNeCE+DuL1rdUAK3O5soecTR6ohk5oNXX
 lJ1SC5tNflYb/65teDQ+o6KnTMblUN61JWrAbQqWG7J0U+ahl6rrf8y73XSti5qJrL
 cUqIv9utgdpSU9ObD65th0QtkHIEDCwDRK2P3X1L8ltuyO6budagPY0ZANBbWpCH96
 oeac4cc/UKEgg==
Message-ID: <a3b294ae-1012-4e87-a2a8-1ef91754c9b1@kernel.org>
Date: Mon, 9 Mar 2026 11:45:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260306121759.1935322-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260306121759.1935322-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/6/26 20:18, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > During fsync,
 the flow reaches f2fs_fsync_node_pages(), 
 which scans all > dirty node folios of the node mappin [...] 
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
X-Headers-End: 1vzRYu-00063i-5t
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix data loss caused by fsync not
 writing any node folio
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 77C74233919
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
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
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
	NEURAL_HAM(-0.00)[-0.984];
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
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Action: no action

On 3/6/26 20:18, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> During fsync, the flow reaches f2fs_fsync_node_pages(), which scans all
> dirty node folios of the node mapping. If there are no dirty node
> folios, fsync will not write any node folio. The scenario is as follows:
> 
> create & write & fsync 'file A'                 writeback node folio
> - f2fs_do_sync_file // inline inode
>  - f2fs_write_inode // inode folio is dirty
> 
>                                                 - f2fs_write_node_pages
>                                                  - f2fs_sync_node_pages
>  - f2fs_fsync_node_pages // no dirty node folios
>  sudden poweroff and lost 'file A'
> 
> The root cause of the data loss is that although the inode folio is
> written successfully, the corresponding node folio is not written with
> the FSYNC_BIT_SHIFT mark. As a result, the recovery procedure ignores
> this file.
> 
> This patch ensures that fsync writes at least one node folio with the
> FSYNC_BIT_SHIFT mark for the inode, so that the recovery procedure can
> properly detect and process it.

I'm not sure, but I suspect that the problem should has been resolved by
commit 88bd02c9472a ("f2fs: fix conditions to remain recovery information
in f2fs_sync_file") has fixed this problem?

Thanks,

> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
> v2:
> - Use f2fs_folio_put instead of folio_put to dec folio ref count.
> ---
>  fs/f2fs/node.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 2fbfecaf3f7b..e14e5db1e8e6 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1982,6 +1982,22 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  		folio_batch_release(&fbatch);
>  		cond_resched();
>  	}
> +	/*
> +	 * All dirty node folios may be written by other thread, but CP hasn't
> +	 * been written yet. So, we need to flush one of inode's dnode to
> +	 * recovery this inode when encounter sudden power off.
> +	 */
> +	if (!atomic && nwritten == 0) {
> +		struct folio *ifolio;
> +
> +		ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
> +		if (IS_ERR(ifolio))
> +			return PTR_ERR(ifolio);
> +		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
> +		folio_mark_dirty(ifolio);
> +		f2fs_folio_put(ifolio, true);
> +		goto retry;
> +	}
>  	if (atomic && !marked) {
>  		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
>  			   ino, last_folio->index);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
