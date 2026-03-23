Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKalCcsewWmTQwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:06:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697A2F0D45
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:06:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTR4AUv33p0dDRpIawdgavx6HgfjAfckuHDwrwlvABE=; b=IAhz1LpDhqj68RRpfeWlK+gPqH
	BwXw/woLSRN+qYxdHWuxzt/K/mvd45nfMzszEPw5Z5S8+e6BjQ3nmIuBpjxBdBeukMlLz1auB5Wla
	79LMrC0kI+lxLNhsid4MNJZZZIPFBEEvTSALqPyAjCXfbFY82LOXdCWxslUbbtV3HNJI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4d7I-0000oh-A1;
	Mon, 23 Mar 2026 11:06:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4d7G-0000oZ-WC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJBaTZf/06TRXxXaST7RBzJ222B4Xp9nomsF7IDpA5s=; b=i9wx3hCWCn21VesRF4xXobxXv0
 iA1Bzptgt2cIRKZIvPGr93oBkShiTmotz/ay6B5Y1g2PoI63ri32NxXCgaWaR4B5nEChMIRbhFB3z
 jaKHYl8EC49oRJ/BOhp0V9LFCJC3V6J6xJCnBcn1iQi/lWA/+rtjzDddiIR2ImXqg3uM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJBaTZf/06TRXxXaST7RBzJ222B4Xp9nomsF7IDpA5s=; b=gClvipwYrBymEyruxkgDE8q7sm
 aXnLo0R6AyWvlp4wazRSdowBlz7DiMAAeoG4230dH+rq//dDr+uRXs7hKW+gGC2ngcR+06oZjzbP+
 s4N4BKyhMOHZBklRcgknX/1YsNMNn9sZz1cobzFb+TeazzgpVnKVTeUohJdJQpPY1Gs0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4d7G-0007pI-5r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 87B62600AC;
 Mon, 23 Mar 2026 11:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB977C4CEF7;
 Mon, 23 Mar 2026 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774263992;
 bh=eZt29KyQXd3NrSDSkRLSRVVGIq5fT7OnarGlrAFYGrk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=opD1lgWSAnk2iyt7Wa7X+UVO5+t9ztJr23x5L4EMfopaIrTggB+WvfWdiwcetFnUi
 WWhsQbHF9LAMSfNFo4nuBuRIfiBzZNpboQf7qWuzjyXBvk9lngIagV587jDKgS73pe
 qZVYZ3vjANNAjl3YcWaX0Lx0ohnXyh0nzMpWQ5glyNWbtvlo54xDhnUJlwsndery1Y
 SArRf3sFwzFNtuBZuFTWsL+3iuqc82JMEfv/LtTxlMRSnG7zuryAruA07y7tatsTn6
 I/c8ZjCV9qHTGDJLHJ+4YrS76qC1txmRZyDge2vmSU0MlVScifniW8/SihZLF+N8kt
 HEMg0OGxnl7xg==
Message-ID: <ead2d70c-e7fc-479e-876f-3a28d5c03219@kernel.org>
Date: Mon, 23 Mar 2026 19:06:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Saad <geoo115@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <2026032354-country-saddlebag-5331@gregkh>
 <20260323104425.780693-1-geoo115@gmail.com>
Content-Language: en-US
In-Reply-To: <20260323104425.780693-1-geoo115@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/26 18:44,
 George Saad wrote: > In f2fs_compress_write_end_io(), 
 dec_page_count(sbi, type) at line 1492 > can bring the F2FS_WB_CP_DATA counter
 to zero, unblocking > f2fs_wait_on_all_pages() in [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4d7G-0007pI-5r
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:geoo115@gmail.com,m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 6697A2F0D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 18:44, George Saad wrote:
> In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
> can bring the F2FS_WB_CP_DATA counter to zero, unblocking
> f2fs_wait_on_all_pages() in f2fs_put_super() on a concurrent unmount
> CPU. The unmount path then proceeds to call
> f2fs_destroy_page_array_cache(sbi) and kfree(sbi). Meanwhile, the bio
> completion callback is still executing: when it reaches
> page_array_free(sbi, ...), it dereferences sbi->page_array_slab_size
> and sbi->page_array_slab within the now-freed f2fs_sb_info structure.
> 
> This is the same class of bug as CVE-2026-23234 (which fixed the
> equivalent race in f2fs_write_end_io() in data.c), but in the
> compressed writeback completion path that was not covered by that fix.
> 
> Fix this by caching sbi->page_array_slab and sbi->page_array_slab_size
> into local variables at function entry, before dec_page_count(). At
> function entry, sbi is guaranteed valid because the F2FS_WB_CP_DATA
> counter is still nonzero (this invocation has not yet decremented it),
> preventing the unmount path from proceeding past
> f2fs_wait_on_all_pages(). The cached values are then used in place of
> the post-decrement sbi dereference.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Cc: stable@vger.kernel.org
> Signed-off-by: George Saad <geoo115@gmail.com>
> ---
> Changes in v3:
> - Add Cc: stable@vger.kernel.org for backport to affected stable kernels
> 
> Changes in v2:
> - Fix Fixes: tag commit hash (4c8ff7095bef, verified in Linus's tree)
> 
>  fs/f2fs/compress.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7b68bf229..c3d837df3 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1479,11 +1479,20 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  {
>  	struct page *page = &folio->page;
>  	struct f2fs_sb_info *sbi = bio->bi_private;
> +	struct kmem_cache *pa_slab = sbi->page_array_slab;
> +	unsigned int pa_slab_size = sbi->page_array_slab_size;
>  	struct compress_io_ctx *cic = folio->private;
>  	enum count_type type = WB_DATA_TYPE(folio,
>  				f2fs_is_compressed_page(folio));
>  	int i;
>  
> +	/*
> +	 * Cache sbi fields before dec_page_count(), which may unblock
> +	 * f2fs_wait_on_all_pages() in the unmount path, allowing
> +	 * f2fs_put_super() to free sbi.  At this point sbi is still
> +	 * valid because the F2FS_WB_CP_DATA counter is nonzero.
> +	 */
> +
>  	if (unlikely(bio->bi_status != BLK_STS_OK))
>  		mapping_set_error(cic->inode->i_mapping, -EIO);
>  
> @@ -1500,7 +1509,10 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  		end_page_writeback(cic->rpages[i]);
>  	}
>  
> -	page_array_free(sbi, cic->rpages, cic->nr_rpages);
> +	if (likely(sizeof(struct page *) * cic->nr_rpages <= pa_slab_size))
> +		kmem_cache_free(pa_slab, cic->rpages);

After sbi is freed, sbi->page_array_slab should be destroyed as well, so
pa_slab points to a freed memory, right?

Thanks,

> +	else
> +		kfree(cic->rpages);
>  	kmem_cache_free(cic_entry_slab, cic);
>  }
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
