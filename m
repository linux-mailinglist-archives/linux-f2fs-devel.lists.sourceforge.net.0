Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKoULcs+umlqTQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 06:57:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C662B6117
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 06:57:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ToQygVD2aRar3azEF/af6SwRIo2nMLg5iMDRZE0YjA=; b=O71Mm1HymH7vijuJgw3AAj3qJb
	6a5kpgLal4wvVJ4cI67Y7Z+wLpDfMJ7p+jjKDYImPfbjiVCIA290NEImxT7zu9I3tdh3fLLVVE1mQ
	YhEdJ3b+zGxlY8ynYfXI6RxRbfbQfply0hFuRFgDKX43TJXID78L5Rr2rJgqvFPiqBJM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2ju8-0001Ki-8l;
	Wed, 18 Mar 2026 05:57:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2jtr-0001J0-RZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 05:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NxlKDox5d5JeTQv+nhgUzot1Q141Nw8WjddEhlt286M=; b=PNfc/NX4+0QcX7EkjBIF47aVvM
 24jPJyo2UsYqHRcYivUpwfsLOwq7jJZsuuhBjzot1GHAXqA6FrvSaAaDkSU+Ftt1s+1DFNUqZo6JE
 1OM8JctGouhsA8fq/rLi2XDmdij0DWgNZRkBhZyY8fye4NUFeAg1qqXaW2rFsi2dOwDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NxlKDox5d5JeTQv+nhgUzot1Q141Nw8WjddEhlt286M=; b=C5NTxBcaidlg6VK96F7S8lukQ/
 rxcSNTweLwPs+LXkSReGQgyK94nri1kwjbWOmx/xTjWw2lXvuEpX4Y6EScaPswmco/L9TQZBTgRyL
 3cgIF3WK2dDq30dlzIa5vuEyqxp+8p7zIklI8aKRkBpwjpeaRiDXFeV7fLpWokVm5P0I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2jts-0001xu-2o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 05:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 87C354331D;
 Wed, 18 Mar 2026 05:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA32C19421;
 Wed, 18 Mar 2026 05:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773813409;
 bh=rfnoONL4n34OjU2sHTyixSXVbI/HvWxE4shOwhh1/U4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hLA071ZclBL3RTTcwn/pOIftcsRdkRLlQ01MypwCaaWnEpWDP+9OHf7TWsWz6B1Og
 4Y/JQTzVhxygAasPS/tdwraK/zCHgOpskGJFXTXjK1NkLKlxZR6TVub1ozlWOOx8PM
 WEoZuDlah4w0rAwhw0WrmVh9p9x5lnVq4epGNeb9MbXzGAacNv4uAArXBj94NLbts1
 oDxhH+8Tr6CNiRipMdPAbsJ80G6IxavymzuiwD9JLKvY54pAeSUm7hQKO2a6R7TD66
 E/ZGJTFadHf6/b8nfweWHTrwS44a5Xp+LlVv0kFM0cHS1t4VuLJV8ZrgYAHeIOaYNS
 utARMWH6rdxaw==
Message-ID: <e4c34148-e667-4e36-a1cf-57aaada22dd9@kernel.org>
Date: Wed, 18 Mar 2026 13:56:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cen Zhang <zzzccc427@gmail.com>, jaegeuk@kernel.org
References: <20260317114225.3017089-1-zzzccc427@gmail.com>
Content-Language: en-US
In-Reply-To: <20260317114225.3017089-1-zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/17 19:42, Cen Zhang wrote: > f2fs_update_inode()
 reads inode->i_blocks without holding i_lock to > serialize it to the on-disk
 inode, while concurrent truncate or > allocation paths may modi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2jts-0001xu-2o
Subject: Re: [f2fs-dev] [PATCH] f2fs: add READ_ONCE() for i_blocks in
 f2fs_update_inode()
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
Cc: gality369@gmail.com, zhenghaoran154@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 ziyuzhang201@gmail.com, r33s3n6@gmail.com, hanguidong02@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:jaegeuk@kernel.org,m:gality369@gmail.com,m:zhenghaoran154@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:ziyuzhang201@gmail.com,m:r33s3n6@gmail.com,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 38C662B6117
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/17 19:42, Cen Zhang wrote:
> f2fs_update_inode() reads inode->i_blocks without holding i_lock to
> serialize it to the on-disk inode, while concurrent truncate or
> allocation paths may modify i_blocks under i_lock.  Since blkcnt_t is
> u64, this risks torn reads on 32-bit architectures.
> 
> Following the approach in ext4_inode_blocks_set(), add READ_ONCE() to prevent
> potential compiler-induced tearing.
> 

Need a Fixes line and Cc stable@kernel.org?

Otherwise, it looks good to me.

Thanks,

> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>   fs/f2fs/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 078874db918c..73b913dbe02a 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -694,7 +694,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
>   	ri->i_uid = cpu_to_le32(i_uid_read(inode));
>   	ri->i_gid = cpu_to_le32(i_gid_read(inode));
>   	ri->i_links = cpu_to_le32(inode->i_nlink);
> -	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
> +	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(READ_ONCE(inode->i_blocks)) + 1);
>   
>   	if (!f2fs_is_atomic_file(inode) ||
>   			is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
