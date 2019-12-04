Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E81124BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 09:25:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icPyj-0008Gb-Pn; Wed, 04 Dec 2019 08:25:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <slava@dubeyko.com>) id 1icPyi-0008GQ-H1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 08:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Mime-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7BdwW/nndIBcsxZWW8vbo3uXBPbU7tTjh33V04X4ek=; b=GNfCdrpOz3o1kBz/pX4A+730aj
 MPKfLPFaJm/ewuaA7FcpICe18mPRqXlwfcmZKSoM4fm6KpHccaqfyd3DMTsBCqnFwOgVDXZhhZ195
 ZlvuEVp4LhNuoChRIKhdLi6L/mqFfJYpB1+Io7u2+SUgPbVW7dsCuUJ56atqqh/rNB8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o7BdwW/nndIBcsxZWW8vbo3uXBPbU7tTjh33V04X4ek=; b=DmKHsnfFJhDtDXsKYwaqAsmWIJ
 DsvI3RGAb19XpDadPfnBMTAk577onylmik6qtGEI6R4BDlu718wlREgqAtYMnwEiBHJEEpsCbFDE+
 ZzOebTzs8UOsxijUawooxgbSeEiMxjCIXkb9wJiBiERRtnS+94g9ZAxAV+OH5RLITpN4=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1icPyh-007LFo-1v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 08:25:44 +0000
Received: by mail-lj1-f194.google.com with SMTP id m6so7053518ljc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Dec 2019 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7BdwW/nndIBcsxZWW8vbo3uXBPbU7tTjh33V04X4ek=;
 b=R15GZEj9KTLTNO0VqqzBo4GIYJtcpTb2kJpdaZtblji+D+RrmcI9rTjDxe+QmhairT
 Dbdver0Sq7o39O5yoG4UDoGmJmo9vH5HMuLXGO7h9I6dmFkSgcGzoSd18zm/LtsqK2mF
 lUVjO8y7iCVF2gvIFJREkER6zjHAaENjaCcLtLpziuR4Pq2w3Z8Wlhe3XDpq/lUxhE9O
 T4/3msAlwIt0YUvQb44lViYxzbj8rFEkqw+r1HWH3ILYKZPpWy2mnzcedUuXScZGEePd
 QqT5lFUQEHQIvzSg5F3M5PVgRTSf84jSg366orX8ATHSyfkMZ7VBL4bHLLLgCBkyqZGQ
 zDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7BdwW/nndIBcsxZWW8vbo3uXBPbU7tTjh33V04X4ek=;
 b=SI6/KL9fz4ypb5AjPmtsZLzrDhlizZV+GYl2FhJsOiQTN0gpS7wITP2wMchkcJQR3P
 F8XA7oVJsEyYrrmX9iRYrQCLQGzNKTbOprx/z5iUgiBNu2dt9da/fQIMOQaw8IMZz1hf
 ENy1t+j6kkW3v9PTInVcwYIrHryzKVz6k6aLIBYuC/nszBYRvmTOlDHBrBMWLbOzk8jH
 CRfgvhYv/XwIGK34DXqT1ZYmG86+J3qhcETVKR2/2gDpn6Xg5c5M8S8tayb6z8HzfaUb
 eVmAddvQ28kthWLn5DsnjiTcsXfyyMRh7cVlBia/svBGJS60e/6aiAUq15EzDPQIjDZ5
 LWkA==
X-Gm-Message-State: APjAAAWYbyBWrDr26HT3x+YImqC6rOP2CkgKBURjyOvzBHZHrwt7mqYG
 iwM4uui1OGmSgeb3OaVQjLu0i0tMjLNU7g==
X-Google-Smtp-Source: APXvYqw9cr0AJeOMuYf9c3iwqsmg8RWLKAie3QTXWVS6sDwM7krFflTW5KVptECDL2Qepv39q9RcUg==
X-Received: by 2002:a2e:9e97:: with SMTP id f23mr1068434ljk.89.1575446031396; 
 Tue, 03 Dec 2019 23:53:51 -0800 (PST)
Received: from msk1wst115n.omp.ru (mail.omprussia.ru. [5.134.221.218])
 by smtp.gmail.com with ESMTPSA id x23sm2807809lff.24.2019.12.03.23.53.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Dec 2019 23:53:50 -0800 (PST)
Message-ID: <96a288281d9d84f11dcc06e62a1ff20e2bb2f776.camel@dubeyko.com>
From: Vyacheslav Dubeyko <slava@dubeyko.com>
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
Date: Wed, 04 Dec 2019 10:53:50 +0300
In-Reply-To: <20191203193001.66906-1-ebiggers@kernel.org>
References: <20191203193001.66906-1-ebiggers@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icPyh-007LFo-1v
Subject: Re: [f2fs-dev] [PATCH] fs-verity: implement readahead for
 FS_IOC_ENABLE_VERITY
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2019-12-03 at 11:30 -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When it builds the first level of the Merkle tree,
> FS_IOC_ENABLE_VERITY
> sequentially reads each page of the file using read_mapping_page().
> This works fine if the file's data is already in pagecache, which
> should
> normally be the case, since this ioctl is normally used immediately
> after writing out the file.
> 
> But in any other case this implementation performs very poorly, since
> only one page is read at a time.
> 
> Fix this by implementing readahead using the functions from
> mm/readahead.c.
> 
> This improves performance in the uncached case by about 20x, as seen
> in
> the following benchmarks done on a 250MB file (on x86_64 with SHA-
> NI):
> 
>     FS_IOC_ENABLE_VERITY uncached (before) 3.299s
>     FS_IOC_ENABLE_VERITY uncached (after)  0.160s
>     FS_IOC_ENABLE_VERITY cached            0.147s
>     sha256sum uncached                     0.191s
>     sha256sum cached                       0.145s
> 
> Note: we could instead switch to kernel_read().  But that would mean
> we'd no longer be hashing the data directly from the pagecache, which
> is
> a nice optimization of its own.  And using kernel_read() would
> require
> allocating another temporary buffer, hashing the data and tree pages
> separately, and explicitly zero-padding the last page -- so it
> wouldn't
> really be any simpler than direct pagecache access, at least for now.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/enable.c | 46 ++++++++++++++++++++++++++++++++++++++++--
> ----
>  1 file changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index eabc6ac19906..f7eaffa60196 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -13,14 +13,44 @@
>  #include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
>  
> -static int build_merkle_tree_level(struct inode *inode, unsigned int
> level,
> +/*
> + * Read a file data page for Merkle tree construction.  Do
> aggressive readahead,
> + * since we're sequentially reading the entire file.
> + */
> +static struct page *read_file_data_page(struct inode *inode,
> +					struct file_ra_state *ra,
> +					struct file *filp,
> +					pgoff_t index,
> +					pgoff_t num_pages_in_file)
> +{
> +	struct page *page;
> +
> +	page = find_get_page(inode->i_mapping, index);
> +	if (!page || !PageUptodate(page)) {
> +		if (page)
> +			put_page(page);


It looks like that there is not necessary check here. If we have NULL
pointer on page then we will not enter inside. But if we have valid
pointer on page then we have double check inside. Am I correct? 


> +		page_cache_sync_readahead(inode->i_mapping, ra, filp,
> +					  index, num_pages_in_file -
> index);
> +		page = read_mapping_page(inode->i_mapping, index,
> NULL);
> +		if (IS_ERR(page))
> +			return page;

Could we recieve the NULL pointer here? Is callee ready to process theNULL return value? 

Thanks,
Viacheslav Dubeyko.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
