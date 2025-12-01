Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D245C992AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE/vEmtkXQPGcaUSBrHeBp6BaIspvIoPJfRJebta0Ww=; b=b4E3CxbfLnck920USscI9wE+Oc
	IdYmVhza1Qexd9EsXeEF43RgYArsO5xLEdr/nIgemlgU155yLPPJWP78STZqCE7ENN0ts5rnaVAHC
	3jz4whuhtpQT8/3AF16eLtj+1rR/ft20kGEEfgAd4MfbguU8uavU2LwE8IfSf6159Rjo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBOC-00088r-DQ;
	Mon, 01 Dec 2025 21:24:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQBO9-00088h-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3j0DhqmJeGYXSrLt4N7eKumGmioLd7IjoZqfyxZBFA=; b=elvbzjYxcnL+yPvNnFUC2Z1cks
 mFf362S1eLAmpgujmTh7BK8NkOfVwQa22Md+SbWJFZ1ue4lj0pxWPxPOABuH5wUBDuS8qvXKbf4h+
 kloIG0WCF72fVRa39/SR7vvUJ+G/mi3njJ0zIrsyYIElrrhllLqxh96Cc02EskbPWL3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3j0DhqmJeGYXSrLt4N7eKumGmioLd7IjoZqfyxZBFA=; b=d5WVtcW82zUnyUzbnUSxnghJQV
 mFvOwqkFkG1EOQkhVXRTyitd9KfDt53zQdG6Y+Ym3+PUUo+QrkUqLnk6y0vAPTDffGIz3G2UFHbr4
 QAi0tdDYTmv5j4X5dgLXOtMxZpBT4Y1Zi/P12nYTMHyU1Is2JxlIDnc4MSex8iakDB1o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBO8-000378-IX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 029C860152;
 Mon,  1 Dec 2025 21:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E66C4CEF1;
 Mon,  1 Dec 2025 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764624286;
 bh=6UGD/fGgHCQcObtOB1ey7uX6RIdFCH249Z9koV5esqo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qE9nK5rREhJIhcSRHka2jxPDQ9BNarNv+z77cnRpPOI02NwB8c7W+/kdY0IGO0fn0
 XKWEuV1b7oZqmFkGmAS6N/AMwGDR6AtkEnfjTlrA8UQ6Hwy5GZGdGzxy9p7g9EWSL3
 KuJjPB8joNKWUbw+5NBGRS63gzF+Y8JIZSyjQgTi/F2vWLL4qs4MsCMc413zC30Wyo
 hOEpiUPx6wVp6GfntPhLVJFrp3DVKUo1owE4zlRsRB48e1U3C56UQeaKi7w3u72ImV
 RRUD6FoHIItFeiYw2ipSQe8cfOffuBTcZrJuYBmblJKwpXOhIi6qb+I8ZsfbIqtH/1
 p2RaIwsPbXfMg==
Message-ID: <381c2557-a714-41f6-8dd2-e0df1ca65919@kernel.org>
Date: Mon, 1 Dec 2025 13:24:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
 <20251201210152.909339-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251201210152.909339-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 05:01, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch fixes the broken readahead flow for POSIX_FADV_WILLNEED, where
 > the problem is, in force_page_cache_ra(nr_to_read), nr_to_read [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQBO8-000378-IX
Subject: Re: [f2fs-dev] [PATCH 1/4] mm/readahead: fix the broken readahead
 for POSIX_FADV_WILLNEED
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

On 2025/12/2 05:01, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch fixes the broken readahead flow for POSIX_FADV_WILLNEED, where
> the problem is, in force_page_cache_ra(nr_to_read), nr_to_read is cut by
> the below code.
> 
>       max_pages = max_t(unsigned long, bdi->io_pages, ra->ra_pages);
>       nr_to_read = min_t(unsigned long, nr_to_read, max_pages);
> 
> IOWs, we are not able to read ahead larger than the above max_pages which
> is most likely the range of 2MB and 16MB. Note, it doesn't make sense
> to set ra->ra_pages to the entire file size. Instead, let's fix this logic.
> 
> Before:
> f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
> page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=512 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=512 nr_to_read=512 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1024 nr_to_read=512 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1536 nr_to_read=512 lookahead_size=0
> 
> After:
> f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
> page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=2048 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=4096 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=6144 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=8192 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=10240 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=12288 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=14336 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=16384 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=18432 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=20480 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=22528 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=24576 nr_to_read=2048 lookahead_size=0
> ...
> page_cache_ra_unbounded: dev=252:16 ino=e index=1042432 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1044480 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1046528 nr_to_read=2048 lookahead_size=0
> 
> Cc: linux-mm@kvack.org
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   mm/readahead.c | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 3a4b5d58eeb6..c0db049a5b7b 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -311,7 +311,7 @@ EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
>    * behaviour which would occur if page allocations are causing VM writeback.
>    * We really don't want to intermingle reads and writes like that.
>    */
> -static void do_page_cache_ra(struct readahead_control *ractl,
> +static int do_page_cache_ra(struct readahead_control *ractl,
>   		unsigned long nr_to_read, unsigned long lookahead_size)
>   {
>   	struct inode *inode = ractl->mapping->host;
> @@ -320,45 +320,42 @@ static void do_page_cache_ra(struct readahead_control *ractl,
>   	pgoff_t end_index;	/* The last page we want to read */
>   
>   	if (isize == 0)
> -		return;
> +		return -EINVAL;
>   
>   	end_index = (isize - 1) >> PAGE_SHIFT;
>   	if (index > end_index)
> -		return;
> +		return -EINVAL;
>   	/* Don't read past the page containing the last byte of the file */
>   	if (nr_to_read > end_index - index)
>   		nr_to_read = end_index - index + 1;
>   
>   	page_cache_ra_unbounded(ractl, nr_to_read, lookahead_size);
> +	return 0;
>   }
>   
>   /*
> - * Chunk the readahead into 2 megabyte units, so that we don't pin too much
> - * memory at once.
> + * Chunk the readahead per the block device capacity, and read all nr_to_read.
>    */
>   void force_page_cache_ra(struct readahead_control *ractl,
>   		unsigned long nr_to_read)
>   {
>   	struct address_space *mapping = ractl->mapping;
> -	struct file_ra_state *ra = ractl->ra;
>   	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
> -	unsigned long max_pages;
> +	unsigned long this_chunk;
>   
>   	if (unlikely(!mapping->a_ops->read_folio && !mapping->a_ops->readahead))
>   		return;
>   
>   	/*
> -	 * If the request exceeds the readahead window, allow the read to
> -	 * be up to the optimal hardware IO size
> +	 * Consier the optimal hardware IO size for readahead chunk.

s/Consier/Consider

Thanks,

>   	 */
> -	max_pages = max_t(unsigned long, bdi->io_pages, ra->ra_pages);
> -	nr_to_read = min_t(unsigned long, nr_to_read, max_pages);
> +	this_chunk = max_t(unsigned long, bdi->io_pages, ractl->ra->ra_pages);
> +
>   	while (nr_to_read) {
> -		unsigned long this_chunk = (2 * 1024 * 1024) / PAGE_SIZE;
> +		this_chunk = min_t(unsigned long, this_chunk, nr_to_read);
>   
> -		if (this_chunk > nr_to_read)
> -			this_chunk = nr_to_read;
> -		do_page_cache_ra(ractl, this_chunk, 0);
> +		if (do_page_cache_ra(ractl, this_chunk, 0))
> +			break;
>   
>   		nr_to_read -= this_chunk;
>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
