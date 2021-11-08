Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7251449800
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Nov 2021 16:18:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mk6Pa-00061C-8L; Mon, 08 Nov 2021 15:18:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mk6PY-00060u-Nx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 15:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qG3MDjcSJb9YOl16z/MziqVp0/H6r3OgfRqsA1FLJWk=; b=KF9JivL4h7W+is6j9eKCIvXcw8
 zwv4WRPmo0naiXih9woMUtFvTP0afHB/VfXJpsx9qz7/4iiMKJhQekcxHvZBSDM1DxMKw8lqrvqNM
 uJQKdtpadzahvmlEZAgQTmAI/XqAPjfzllIKWAuajwL7m+bkscvpfe66FjPtqygnJCQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qG3MDjcSJb9YOl16z/MziqVp0/H6r3OgfRqsA1FLJWk=; b=VeAJ3braQ8A5QDpx17ZFYvFv2j
 DAlj1Erdux4NEiDHRIJm8Yde9H3ADcnJ1BrgnzC8PXs2iEYUMr07pfQ+NPPNQARgip9pl9s3qujcH
 lc9gDfozHtJjfLbbYWCjExkJKV4KmNO0H0TxaDfrWdEiFK7k6Whr+XJYZg5mjLOSaa3k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mk6PX-006CLJ-Fc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 15:18:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2DB56120D;
 Mon,  8 Nov 2021 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636384690;
 bh=R+wYiCERXjYNrpHC1c+bYtsL51nQ0c1O9Fjs/nlAi9M=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=lV49R2lfPcEKMMibuHumgCau3sdL7xNZg6N3dukmMbghPGFUYQWd/QpG/ft4rmiLA
 zrNArJW2hh9NLvs+xq9OqvQfz+7h75hJJN9EbC/i9/Z7sTwa/x0VapBCCvN7kz+Nkt
 ki8zNvxirurTBQ51WF14fh54W6i+N6zZ1qtJsnUuEvRUzflpH4LAWf04u0pe0a+Dqc
 f6ITEWBEmpBcXxCTGC9U7zPE5krrb2Pq1zFMaATu0yW/xqHCPZUKCKfJFQCTTJNTm2
 62hMQ5x0y4JJeZsaUBgHs5l004y6kr9vBaTWHYGafbO6oaDJrFJtr2t5xP/jFCwhog
 yncTMnZZ7VLUw==
Message-ID: <98786147-6377-063b-900f-4c15636a9f6e@kernel.org>
Date: Mon, 8 Nov 2021 23:18:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210723083745.172016-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20210723083745.172016-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/7/23 16:37, Fengnan Chang wrote: > Don't alloc new
 page array to replace old, just use old page array, try > to reduce one page
 array alloc and free when write compress page. > > Signed-off-by [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mk6PX-006CLJ-Fc
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: compress: reduce one page array
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

On 2021/7/23 16:37, Fengnan Chang wrote:
> Don't alloc new page array to replace old, just use old page array, try
> to reduce one page array alloc and free when write compress page.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 18 ++++--------------
>   fs/f2fs/f2fs.h     |  1 +
>   2 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 455561826c7d..1395b9cec7f4 100644
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
> @@ -727,7 +717,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   		if (cc->cpages[i])
>   			f2fs_compress_free_page(cc->cpages[i]);
>   	}
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>   	cc->cpages = NULL;
>   destroy_compress_ctx:
>   	if (cops->destroy_compress_ctx)
> @@ -1330,7 +1320,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   	spin_unlock(&fi->i_size_lock);
>   
>   	f2fs_put_rpages(cc);
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>   	cc->cpages = NULL;
>   	f2fs_destroy_compress_ctx(cc, false);
>   	return 0;
> @@ -1356,7 +1346,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   	else
>   		f2fs_unlock_op(sbi);
>   out_free:
> -	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
>   	cc->cpages = NULL;
>   	return -EAGAIN;
>   }
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 867f2c5d9559..8b1f84d88a65 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1454,6 +1454,7 @@ struct compress_ctx {
>   	unsigned int nr_rpages;		/* total page number in rpages */
>   	struct page **cpages;		/* pages store compressed data in cluster */
>   	unsigned int nr_cpages;		/* total page number in cpages */
> +	unsigned int raw_nr_cpages;	/* max total page number in cpages */

Sorry for the long delay, I guess it's worth to take this patch to simply compress
flow...

One more concern about code readability:

How about keeping nr_{cpages,rpages} to indicate max number of page pointers in array,
and introduce valid_nr_cpages to indicate valid number of page pointers in array.

Thoughts?

Thanks,

>   	void *rbuf;			/* virtual mapped address on rpages */
>   	struct compress_data *cbuf;	/* virtual mapped address on cpages */
>   	size_t rlen;			/* valid data length in rbuf */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
