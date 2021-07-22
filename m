Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F73D24E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 15:54:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6Z9G-0001st-Mu; Thu, 22 Jul 2021 13:54:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m6Z9F-0001sb-2x
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 13:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oyr6UW0Fwx/ZEHbGoOBRIqwRu0gZvbXp8JQihBmGiX8=; b=bZY6Ju48linFWCwoDp5jz7dKRx
 xI0wr3ZLuBa+0jCertED8Rbx0TgDhqWv8nHK0rvdGGMGOz4/i8DeoFYrdgQoTmX51CP5/zGJWvF2a
 NQHY+qmzScQJLfZJwyr55A1vLgfT0rJ3rXVuwn2ygr0/zI7vYXdCC7pgbeWujFn+W3AA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oyr6UW0Fwx/ZEHbGoOBRIqwRu0gZvbXp8JQihBmGiX8=; b=iTm8rHAzLsa1xgI/pycN4p1r/s
 tp2iVPJjLt6zkT227rvqatEkjsYc+N07mrk8lDNo1U0+64nA3hxoUKBbWg+i0h6i0s/iBEdFzdHrI
 PQPcUd6QOSu9gYBELMZmOkvh0lMrymm/q9uGTi6EPX0vKxUUtpBm+v9TRC8jF6O9ygeE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6Z98-0001s6-8n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 13:54:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36E1D6109D;
 Thu, 22 Jul 2021 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626962028;
 bh=eEkkSbgG5i36YjEhxxDYgn/sR/d9YtFjn6qr00qfHu0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Tm0MYAkhwefjt/8dk+ecc8lSOux+b7PbX/6zUneRyL4KSKQVxT3w4LaC6+tPKG2te
 ExeNMmM9UbrXoUbu52PPW+P71C6b3ag0lDogtdkiBSH5+CV+tA6s25tppnZZkUrZ9R
 WLfKBK6WqyujIGiKdl0fRIj0fYOkQN8kZmI1E4HGbPZS5skClp86waAfPmyXWw9cDA
 KRBly8unUN+G7Mr+owVlW/BWUb/sq5gnPXl0AMHSVYmD7ur7iGzbErZBfvP4bzGHT4
 iF17IQi0tOV/ER+W26KkbnEFmlHUqPdSQL5ZsSwEV29Q8rUQ+QS+BCK7WONW9CKrSm
 cReBI0j7U6QbQ==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722034729.231855-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <58f5c3c2-ef99-1592-8dbd-1a56ce2eeda3@kernel.org>
Date: Thu, 22 Jul 2021 21:53:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722034729.231855-1-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6Z98-0001s6-8n
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: reduce one page array
 alloc and free when write compressed page
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/22 11:47, Fengnan Chang wrote:
> Don't alloc new page array to replace old, just use old page array, try
> to reduce one page array alloc and free when write compress page.

Nope, see whole story in below link:

https://lore.kernel.org/patchwork/patch/1305096/

Thanks,

> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 14 ++------------
>   fs/f2fs/f2fs.h     |  1 +
>   2 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 455561826c7d..43daafe382e7 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -618,7 +618,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   	const struct f2fs_compress_ops *cops =
>   				f2fs_cops[fi->i_compress_algorithm];
>   	unsigned int max_len, new_nr_cpages;
> -	struct page **new_cpages;
>   	u32 chksum = 0;
>   	int i, ret;
>   
> @@ -633,6 +632,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   
>   	max_len = COMPRESS_HEADER_SIZE + cc->clen;
>   	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
> +	cc->raw_nr_cpages = cc->nr_cpages;
>   
>   	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
>   	if (!cc->cpages) {
> @@ -683,13 +683,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   
>   	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
>   
> -	/* Now we're going to cut unnecessary tail pages */
> -	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
> -	if (!new_cpages) {
> -		ret = -ENOMEM;
> -		goto out_vunmap_cbuf;
> -	}
> -
>   	/* zero out any unused part of the last page */
>   	memset(&cc->cbuf->cdata[cc->clen], 0,
>   			(new_nr_cpages * PAGE_SIZE) -
> @@ -700,7 +693,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   
>   	for (i = 0; i < cc->nr_cpages; i++) {
>   		if (i < new_nr_cpages) {
> -			new_cpages[i] = cc->cpages[i];
>   			continue;
>   		}
>   		f2fs_compress_free_page(cc->cpages[i]);
> @@ -710,8 +702,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   	if (cops->destroy_compress_ctx)
>   		cops->destroy_compress_ctx(cc);
>   
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> -	cc->cpages = new_cpages;
>   	cc->nr_cpages = new_nr_cpages;
>   
>   	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
> @@ -1330,7 +1320,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   	spin_unlock(&fi->i_size_lock);
>   
>   	f2fs_put_rpages(cc);
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>   	cc->cpages = NULL;
>   	f2fs_destroy_compress_ctx(cc, false);
>   	return 0;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 867f2c5d9559..8b1f84d88a65 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1454,6 +1454,7 @@ struct compress_ctx {
>   	unsigned int nr_rpages;		/* total page number in rpages */
>   	struct page **cpages;		/* pages store compressed data in cluster */
>   	unsigned int nr_cpages;		/* total page number in cpages */
> +	unsigned int raw_nr_cpages;	/* max total page number in cpages */
>   	void *rbuf;			/* virtual mapped address on rpages */
>   	struct compress_data *cbuf;	/* virtual mapped address on cpages */
>   	size_t rlen;			/* valid data length in rbuf */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
