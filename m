Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5A57F472
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 11:34:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFXzu-0002KL-RG; Sun, 24 Jul 2022 09:34:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFXzt-0002Jq-BT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 09:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0TmEuZ/n/7P0CPLh+APe0vH+OKXa+Cu1MOd9Lx+CB00=; b=Gm+gSxMD1oDJuUV+tjoy5qgmzw
 xiH7WC1MgO/kGy+SV/u5yskpCTh57cBlWBWt8OsVf+wufUsP782Ix/HPjxaPofgSb6LtJW7o5j42t
 /EuZh2QFF/8n3iMz7pnteR79cPD8+4Duk+s3Ks5+LHGM89euM/r9tzlGKYkRN5cOmFGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0TmEuZ/n/7P0CPLh+APe0vH+OKXa+Cu1MOd9Lx+CB00=; b=Ik8iFKBHQ93nF1ImuUIK8Pcb06
 sYsDysJS/s0g4n2Y0ggraeBfatqyFmRRUVoLs5844nL1JUBOU+v7PWCixWY9ckI7RupGbNCh7aFoI
 fkDEU0iIZVFQoKRzfE8G/zQYBUaoEHBOVYkSx2Lg0ls4mXjbApyk7OeldF55ucwZXiho=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFXzr-0004QR-LS
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 09:34:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEF37B80D31;
 Sun, 24 Jul 2022 09:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1D7C3411E;
 Sun, 24 Jul 2022 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658655229;
 bh=UpXybAT3n92vj8FKi33xVN7dhqkNvhe1Y1aOQvwcQ0A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ssae/4jeRPqDmRYLmkYXDWthiMYQKpiOlHDoo8lzAanzduBcTITi/DtSUZicm6DCy
 LjxtZpAenlF8jOc713LQ2/XZWf+QN0FbhFEhXFKKc3hXWib48/0UVly+vRdYIo5X+f
 RpHx4klLxCkziiI2i08fuuKwpaoqHIZme14Bx1GRoCuu62txKyW/IpW8xrHX38fits
 8vQB9sU4FuFtPFpEwo90tV5V8jkA54fxrKguM007OKdRd0VqFmaKWmiUlW+osvUUze
 sS1HVS9MeJJ9l5fKtmFoMg9Nkq3XaJj24WwwNAHnT+DKCpfkLmRnp5I0zrGph2Rdaw
 B0yAXchagjmSg==
Message-ID: <6be3acca-578b-9b8c-f85d-c9ed0091c0d6@kernel.org>
Date: Sun, 24 Jul 2022 17:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fengnan Chang <fengnanchang@gmail.com>, jaegeuk@kernel.org
References: <20220717053207.192372-1-fengnanchang@gmail.com>
 <20220717053207.192372-2-fengnanchang@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220717053207.192372-2-fengnanchang@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/17 13:32,
 Fengnan Chang wrote: > From: Fengnan Chang
 <changfengnan@vivo.com> > > When write total cluster, all pages is uptodate,
 there is no need to call > f2fs_prepare_compress_overwrite, [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFXzr-0004QR-LS
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs: intorduce
 f2fs_all_cluster_page_ready
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/17 13:32, Fengnan Chang wrote:
> From: Fengnan Chang <changfengnan@vivo.com>
> 
> When write total cluster, all pages is uptodate, there is no need to call
> f2fs_prepare_compress_overwrite, intorduce f2fs_all_cluster_page_ready
> to avoid this.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 17 +++++++++++++----
>   fs/f2fs/data.c     |  8 ++++++--
>   fs/f2fs/f2fs.h     |  4 ++--
>   3 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 24824cd96f36..28619d45b5c9 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -871,20 +871,29 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
>   	return is_page_in_cluster(cc, index);
>   }
>   
> -bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
> -				int index, int nr_pages)
> +bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
> +				int index, int nr_pages, bool uptodate)
>   {
>   	unsigned long pgidx;
> -	int i;
> +	int i = uptodate ? 0 : 1;
> +
> +	/*
> +	 * when uptodate set to true, try to check all pages in cluster is
> +	 * uptodate or not.
> +	 */
> +	if (uptodate && (pgidx % cc->cluster_size))

pgidx is uninitialized...

Thanks,

> +		return false;
>   
>   	if (nr_pages - index < cc->cluster_size)
>   		return false;
>   
>   	pgidx = pvec->pages[index]->index;
>   
> -	for (i = 1; i < cc->cluster_size; i++) {
> +	for (; i < cc->cluster_size; i++) {
>   		if (pvec->pages[index + i]->index != pgidx + i)
>   			return false;
> +		if (uptodate && !PageUptodate(pvec->pages[index + i]))
> +			return false;
>   	}
>   
>   	return true;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7fcbcf979737..022d0a8715c5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2996,6 +2996,10 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   				if (!f2fs_cluster_is_empty(&cc))
>   					goto lock_page;
>   
> +				if (f2fs_all_cluster_page_ready(&cc,
> +					&pvec, i, nr_pages, true))
> +					goto lock_page;
> +
>   				ret2 = f2fs_prepare_compress_overwrite(
>   							inode, &pagep,
>   							page->index, &fsdata);
> @@ -3006,8 +3010,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   				} else if (ret2 &&
>   					(!f2fs_compress_write_end(inode,
>   						fsdata, page->index, 1) ||
> -					 !f2fs_all_cluster_page_loaded(&cc,
> -						&pvec, i, nr_pages))) {
> +					 !f2fs_all_cluster_page_ready(&cc,
> +						&pvec, i, nr_pages, false))) {
>   					retry = 1;
>   					break;
>   				}
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d9bbecd008d2..df07c15a5202 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4163,8 +4163,8 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
>   							block_t blkaddr);
>   bool f2fs_cluster_is_empty(struct compress_ctx *cc);
>   bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
> -bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
> -				int index, int nr_pages);
> +bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
> +				int index, int nr_pages, bool uptodate);
>   bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
>   void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
>   int f2fs_write_multi_pages(struct compress_ctx *cc,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
