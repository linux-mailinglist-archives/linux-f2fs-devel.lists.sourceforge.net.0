Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEumKDAhqGlQoQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 13:10:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2F1FF829
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 13:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1TvxiCgC8UjQJB8s+0AaM2cZh9wZ/d15EFzOqpFDMU=; b=ee023M5NiAO3R9G+D6NMV/NaPL
	pmzHnuQwKUASg/dSXBQMsmucBQBnu8IKPTBepznCDOIlr7ceuB9Dpv1czlnIl4Tm3nPkmADg+I7Gc
	oOjO0jF8ERGhF2rLd8zw7rIFQXr8PZgXyTP5BpdWOqQqWYXJ0d+BTE0lVC9nG6npSig0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxl3L-0003ur-Dx;
	Wed, 04 Mar 2026 12:10:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxl3J-0003uj-Ts
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 12:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VhWANrC3JMCCNzRs5ZYbqYTMhJ4vWUo0Bouo6HZYfic=; b=HTU5arlvk1u3GKQ8+wkLHidvSI
 umCaVcXobbvsDWAmUg6lpN+4mj7f2j9EYXFiGWtiT47RaCzuZ/okvdaUQhqb87reJKpuYg8JGQQOX
 TdjfIWC5YWMF30iCaBhUKx0czbbsM/6vr8EtO5O13o02dQ2yKRFF2bQ1RGSfc2BrUvlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VhWANrC3JMCCNzRs5ZYbqYTMhJ4vWUo0Bouo6HZYfic=; b=YCmY6SQme8CNVj+3NpjSvu2wpl
 Bgz5ih4YzdqvvTXrh1BsU+/n0i189uOHgzaVfnyDOwqG+YVDQpe8MmJeVwRckx8/JmksdgdRy6he1
 D0Z5Q50H2nUXJ+HlT8QPHoTuZVVGnoveNodVFfQ/A0XssKYbXSfELRCUw8LionfDTLn8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxl3H-0007ii-Cs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 12:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF9AA600AD;
 Wed,  4 Mar 2026 12:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB46BC2BCAF;
 Wed,  4 Mar 2026 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772626196;
 bh=EQ35PvaRx03UzYS9X1Bzs1qb1ocHzp0vdwuVUpuNBfE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uLl+8+NtnsbWfboyTgH5efkt923GNSSCiAmj6EQWIT4ufjbVw7kmqGX2xJC4l1RoM
 yy0WRk0tboWeu4yOx+ltbfmfldUAh7GZ21zHlnXPQEuuSkVkc/f2gsGpN8Nlt/4kEx
 jaBUSIqnhITM0Ux5TjFAVbZiwVo06TIDLbuSI9gsiyWb/PbxjQhRDlDS+M9vEJhuUt
 LVy4Z7AyA56rrURbc7leoNe0pSL03NL2xYtuxFz3szTRTYltocBaPtmDTmPO52iNwr
 GxcC0oXCscQ4iEWXETlA39MdG6qW+SOw35h41+j4kemqHQJczLHMxXgW1KJj61QURM
 JNjhY+j7Iyw4g==
Message-ID: <36d15a4f-d2ca-4294-aa87-4f52dbf84574@kernel.org>
Date: Wed, 4 Mar 2026 20:09:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20260209063121.117451-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260209063121.117451-1-huangjianan@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/9 14:31,
 Jianan Huang wrote: > We found the following
 issue during fuzz testing: > > page: refcount:3 mapcount:0
 mapping:00000000b6e89c65
 index:0x18b2dc pfn:0x161ba9 > memcg:f8ffff800e269c00 [...] 
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
X-Headers-End: 1vxl3H-0007ii-Cs
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid reading already updated pages
 during GC
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, wanghui33@xiaomi.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: F3A2F1FF829
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:huangjianan@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:wanghui33@xiaomi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url]
X-Rspamd-Action: no action

On 2026/2/9 14:31, Jianan Huang wrote:
> We found the following issue during fuzz testing:
> 
> page: refcount:3 mapcount:0 mapping:00000000b6e89c65 index:0x18b2dc pfn:0x161ba9
> memcg:f8ffff800e269c00
> aops:f2fs_meta_aops ino:2
> flags: 0x52880000000080a9(locked|waiters|uptodate|lru|private|zone=1|kasantag=0x4a)
> raw: 52880000000080a9 fffffffec6e17588 fffffffec0ccc088 a7ffff8067063618
> raw: 000000000018b2dc 0000000000000009 00000003ffffffff f8ffff800e269c00
> page dumped because: VM_BUG_ON_FOLIO(folio_test_uptodate(folio))
> page_owner tracks the page as allocated
>   post_alloc_hook+0x58c/0x5ec
>   prep_new_page+0x34/0x284
>   get_page_from_freelist+0x2dcc/0x2e8c
>   __alloc_pages_noprof+0x280/0x76c
>   __folio_alloc_noprof+0x18/0xac
>   __filemap_get_folio+0x6bc/0xdc4
>   pagecache_get_page+0x3c/0x104
>   do_garbage_collect+0x5c78/0x77a4
>   f2fs_gc+0xd74/0x25f0
>   gc_thread_func+0xb28/0x2930
>   kthread+0x464/0x5d8
>   ret_from_fork+0x10/0x20
> ------------[ cut here ]------------
> kernel BUG at mm/filemap.c:1563!
>   folio_end_read+0x140/0x168
>   f2fs_finish_read_bio+0x5c4/0xb80
>   f2fs_read_end_io+0x64c/0x708
>   bio_endio+0x85c/0x8c0
>   blk_update_request+0x690/0x127c
>   scsi_end_request+0x9c/0xb8c
>   scsi_io_completion+0xf0/0x250
>   scsi_finish_command+0x430/0x45c
>   scsi_complete+0x178/0x6d4
>   blk_mq_complete_request+0xcc/0x104
>   scsi_done_internal+0x214/0x454
>   scsi_done+0x24/0x34
> 
> which is similar to the problem reported by syzbot:
> https://syzkaller.appspot.com/bug?extid=3686758660f980b402dc
> 
> This case is consistent with the description in commit 9bf1a3f
> ("f2fs: avoid GC causing encrypted file corrupted"):
> Page 1 is moved from blkaddr A to blkaddr B by move_data_block, and after
> being written it is marked as uptodate. Then, Page 1 is moved from blkaddr
> B to blkaddr C, VM_BUG_ON_FOLIO was triggered in the endio initiated by
> ra_data_block.
> 
> There is no need to read Page 1 again from blkaddr B, since it has already
> been updated. Therefore, avoid initiating I/O in this case.
> 
> Fixes: 6aa58d8ad20a ("f2fs: readahead encrypted block during GC")
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>   fs/f2fs/gc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 60378614bc54..c184ae6a616e 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1228,7 +1228,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>   		.encrypted_page = NULL,
>   		.in_list = 0,
>   	};
> -	int err;
> +	int err = 0;
>   
>   	folio = f2fs_grab_cache_folio(mapping, index, true);
>   	if (IS_ERR(folio))
> @@ -1279,6 +1279,9 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>   		goto put_folio;
>   	}
>   
> +	if (folio_test_uptodate(efolio))
> +		goto put_encrypted_page;
> +
>   	fio.encrypted_page = &efolio->page;

Should relocate changes here, otherwise, fio.encrypted_page will be used before
initialization.

1299         return 0;
1300 put_encrypted_page:
1301         f2fs_put_page(fio.encrypted_page, true);
1302 put_folio:
1303         f2fs_folio_put(folio, true);
1304         return err;

Thanks,

>   
>   	err = f2fs_submit_page_bio(&fio);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
