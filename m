Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QElqAr1UnGmSEAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Feb 2026 14:23:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB48176BC4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Feb 2026 14:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqQuRrOBigtETy9fZqxWkW46xWauYfYX68vnn0AzYG0=; b=Ae8lD5mlOwTUBm5Vzjf+7Dxx0x
	MrprO1s8S8gCeica095IKBam/CRS/feiObWjfbKXdgGPRvr3GfMjlUTSt1zZn4ztY4yKf7DEH4MAH
	FH/f0Z4EFBwfKPhwEa5NfitsdAZCYql+6oC3vz+roG3ZlqOvZmjfFDZ7TJm4Er4mKWNI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vuVtv-0002PZ-LA;
	Mon, 23 Feb 2026 13:23:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vbabka@kernel.org>) id 1vuVtu-0002PR-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Feb 2026 13:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uqfgYAyh+XG9ux+c4FS13ldU7qHivMuvrfiW+kKnPHQ=; b=KkCHu0fb/Z3n5UgvJNvDrlwxSD
 46KqcX0QKq/R81u/nQJUKEKa4e9Ce/kYnl49aZMv0vG/roanC9ewneWJRKVRpmuhVrSxz5zjKwGi2
 96vPGmf4EbGWRrg0LAfexs3ESsJYaYdgRMqb7urcsc4DLLjV/T2VrzvH6oaAArlQ16BQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uqfgYAyh+XG9ux+c4FS13ldU7qHivMuvrfiW+kKnPHQ=; b=Vj63O/vb6NW/Xk3JO1Du2fqYVJ
 4X3XZUZJdeQdkVMLV/wDBXlIGd6OexfzYND+hMFLb7r5Etx8tmN02c7oSObg1jDVEFIaG5k6ucO4T
 w1g2X9KnXfZOyd7z758Dhlu/v5p+5x1+w7NJ3R3Nl9UYKnLjFl67hzOinHNTr2wZ612I=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vuVtt-0004QD-P0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Feb 2026 13:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E722760103;
 Mon, 23 Feb 2026 13:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3558AC116C6;
 Mon, 23 Feb 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771852970;
 bh=0s+1xYOmLxGL/YAJHo9cKB+lTpl0y7L08ahwhMvrkEQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jeCma4x8Y9qhEKAJkO3pP2yMUhuMGqI7YjXszcxTOjJf1nMuxj4aNKw9In7B+VBl4
 3EKYO1OdKtOskNPJKkqBKsWXedHwkQibA2TicHRB2WuRhycmH4EvakC/Z78U4mhdkP
 cDwyZhPqZjcMkRu05a2+HXN47jusCH5GNgvQorQ06FSE71saAbhEZSYjvzMdoQsksu
 AnG7CiMdGFK0ZFPdwJEt4/xIJGLBYkWkHlzfRykg8Ec8DteOaOd//shp6EyoAzFJ58
 B8xeg2vaLDa9vgKY14LVP6e3MWyPNZk1f6MKlSiluqjXvO8KsRn3vSEg+v++u89jjb
 mPd4JqPIUYXzg==
Message-ID: <94f41e2a-53c1-4b7c-8f6c-4553ae729608@kernel.org>
Date: Mon, 23 Feb 2026 14:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260221201316.22025-1-ebiggers@kernel.org>
Content-Language: en-US
In-Reply-To: <20260221201316.22025-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/21/26 21:13,
 Eric Biggers wrote: > Since commit 52e7e0d88933
 ("fscrypt: Switch to sync_skcipher and > on-stack requests") eliminated the
 dynamic allocation of crypto > requests, the only remainin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vuVtt-0004QD-P0
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unreachable code in
 f2fs_encrypt_one_page()
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
From: "Vlastimil Babka \(SUSE\) via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-fscrypt@vger.kernel.org,m:vbabka@suse.cz,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[vbabka@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 1FB48176BC4
X-Rspamd-Action: no action

On 2/21/26 21:13, Eric Biggers wrote:
> Since commit 52e7e0d88933 ("fscrypt: Switch to sync_skcipher and
> on-stack requests") eliminated the dynamic allocation of crypto
> requests, the only remaining dynamic memory allocation done by
> fscrypt_encrypt_pagecache_blocks() is the bounce page allocation.
> 
> The bounce page is allocated from a mempool.  Mempool allocations with
> GFP_NOFS never fail.  Therefore, fscrypt_encrypt_pagecache_blocks() can
> no longer return -ENOMEM when passed GFP_NOFS.
> 
> Remove the now-unreachable code from f2fs_encrypt_one_page().
> 
> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> Link: https://lore.kernel.org/all/d9dc2ee1-283d-4467-ad36-a6a4aa557589@suse.cz/
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks!

> ---
>  fs/f2fs/data.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 338df7a2aea6..400f0400e13d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2785,33 +2785,23 @@ static void f2fs_readahead(struct readahead_control *rac)
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  {
>  	struct inode *inode = fio_inode(fio);
>  	struct folio *mfolio;
>  	struct page *page;
> -	gfp_t gfp_flags = GFP_NOFS;
>  
>  	if (!f2fs_encrypted_file(inode))
>  		return 0;
>  
>  	page = fio->compressed_page ? fio->compressed_page : fio->page;
>  
>  	if (fscrypt_inode_uses_inline_crypto(inode))
>  		return 0;
>  
> -retry_encrypt:
>  	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page_folio(page),
> -					PAGE_SIZE, 0, gfp_flags);
> -	if (IS_ERR(fio->encrypted_page)) {
> -		/* flush pending IOs and wait for a while in the ENOMEM case */
> -		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
> -			f2fs_flush_merged_writes(fio->sbi);
> -			memalloc_retry_wait(GFP_NOFS);
> -			gfp_flags |= __GFP_NOFAIL;
> -			goto retry_encrypt;
> -		}
> +					PAGE_SIZE, 0, GFP_NOFS);
> +	if (IS_ERR(fio->encrypted_page))
>  		return PTR_ERR(fio->encrypted_page);
> -	}
>  
>  	mfolio = filemap_lock_folio(META_MAPPING(fio->sbi), fio->old_blkaddr);
>  	if (!IS_ERR(mfolio)) {
>  		if (folio_test_uptodate(mfolio))
>  			memcpy(folio_address(mfolio),
> 
> base-commit: 8934827db5403eae57d4537114a9ff88b0a8460f



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
