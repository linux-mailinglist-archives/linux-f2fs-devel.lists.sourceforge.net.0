Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 346013C7063
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 14:36:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3Hdu-0004rz-JC; Tue, 13 Jul 2021 12:36:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m3Hds-0004rl-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 12:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nlezZmaJGKsn3wThAAqUns1S5039quPyWkLk1BLMszA=; b=DwW1Nv5yyFn2PSqWj9oM5jNjdE
 GNSw9kv1wKmH9OkGnDHEprXhEYtF97CnNQQMPTygJY+rd3qqc1vy8PJVrQ7/QS+HHW6uBefrD5HLb
 4RwVJzEtlIRANZrAcm+xQtC3XFZTb4LZ//bFbfDIrR/FlIQPFvdA3KsXXN0dU6rOsam4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nlezZmaJGKsn3wThAAqUns1S5039quPyWkLk1BLMszA=; b=CBiWn8f/3cTvyLTA2f+P8+qJyV
 2m1z46rkByJO8TuCHYtVNZhmMNC1MGqIUCVvw8frJgNGo3bUylCS02hmtjcUDEOPe1FiqUtAMyQWj
 8NaOHnkvYaQ2eIyv2QRJcI6q1xEji3fmu3Ke2mVyZr4D+ULoHsoLbRp4A4ew7izgnGpY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3Hdm-0001yw-CT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 12:36:04 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 83C3D22075;
 Tue, 13 Jul 2021 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626179748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nlezZmaJGKsn3wThAAqUns1S5039quPyWkLk1BLMszA=;
 b=L0Ik4SGLKPMprCMpIDZu5I9SJkk6iVnXbqXSILIKOJ1tUsAz+3nm9Fiv2/sQhIhFL9aOmi
 Xdd54ETzCRoMIv/6ptRzy+K8vp6P0oCs0DxP7fFszUwp7i+yxHOadd6Ea9UosE6mdaj5+9
 3H6ZtOh5KYeEBpKjmeYcIikKLdDRKL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626179748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nlezZmaJGKsn3wThAAqUns1S5039quPyWkLk1BLMszA=;
 b=k26gwy3dwwIlQyBP4N54gjqPfnfyayfHxU0JZPsEVY6lWzaQ34iMd6jTvkatBxRCs6Y6HK
 8UfNH2RVTEz7qqDg==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 6FB26A3BBB;
 Tue, 13 Jul 2021 12:35:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4DCC31E0BBC; Tue, 13 Jul 2021 14:35:48 +0200 (CEST)
Date: Tue, 13 Jul 2021 14:35:48 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20210713123548.GA24271@quack2.suse.cz>
References: <20210712163901.29514-1-jack@suse.cz>
 <20210712165609.13215-3-jack@suse.cz>
 <YO0xwY+q7d8rQE3f@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO0xwY+q7d8rQE3f@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m3Hdm-0001yw-CT
Subject: Re: [f2fs-dev] [PATCH 03/14] mm: Protect operations adding pages to
 page cache with invalidate_lock
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
Cc: linux-cifs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 13-07-21 07:25:05, Christoph Hellwig wrote:
> Still looks good.  That being said the additional conditional locking in
> filemap_fault makes it fall over the readbility cliff for me.  Something
> like this on top of your series would help:

Yeah, that's better. Applied, thanks. 

								Honza

> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index fd3f94d36c49..0fad08331cf4 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3040,21 +3040,23 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  	 * Do we have something in the page cache already?
>  	 */
>  	page = find_get_page(mapping, offset);
> -	if (likely(page) && !(vmf->flags & FAULT_FLAG_TRIED)) {
> +	if (likely(page)) {
>  		/*
> -		 * We found the page, so try async readahead before
> -		 * waiting for the lock.
> +		 * We found the page, so try async readahead before waiting for
> +		 * the lock.
>  		 */
> -		fpin = do_async_mmap_readahead(vmf, page);
> -	} else if (!page) {
> +		if (!(vmf->flags & FAULT_FLAG_TRIED))
> +			fpin = do_async_mmap_readahead(vmf, page);
> +		if (unlikely(!PageUptodate(page))) {
> +			filemap_invalidate_lock_shared(mapping);
> +			mapping_locked = true;
> +		}
> +	} else {
>  		/* No page in the page cache at all */
>  		count_vm_event(PGMAJFAULT);
>  		count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
>  		ret = VM_FAULT_MAJOR;
>  		fpin = do_sync_mmap_readahead(vmf);
> -	}
> -
> -	if (!page) {
>  retry_find:
>  		/*
>  		 * See comment in filemap_create_page() why we need
> @@ -3073,9 +3075,6 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  			filemap_invalidate_unlock_shared(mapping);
>  			return VM_FAULT_OOM;
>  		}
> -	} else if (unlikely(!PageUptodate(page))) {
> -		filemap_invalidate_lock_shared(mapping);
> -		mapping_locked = true;
>  	}
>  
>  	if (!lock_page_maybe_drop_mmap(vmf, page, &fpin))
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
