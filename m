Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC42CE67D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 04:28:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl1lt-00037l-CR; Fri, 04 Dec 2020 03:28:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kl1ls-00037e-8d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 03:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/TeyZe0/mI0AOkIHZc4rEEZabMAXTNEZFXYNwt0k5Lo=; b=JI//vHCU/413qhsEn8Ber5Ff6W
 v9Vr+yAW5Ab1yKiUxgJTIFLr4RhWgpM9xawFiSLyvETc6gMt4fmgszN+rnBJo31I02mvry1hBDX1h
 pdEEgd5qA3CkDZNS4X9KUE0zVn6VVuyMQxZ8AnKvyCZi7EIJ6s7wBxiRZDlJmYZq81SM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/TeyZe0/mI0AOkIHZc4rEEZabMAXTNEZFXYNwt0k5Lo=; b=TqRblmZcuDWmcASMklUgyFUAiV
 ALKoIVrdRJlIeHnUmoi0qyj0ojFEdb70LgMj3UvyZQ8s3Wl+RI+k3i211svZ5v+7YwtVnR7XWsE3z
 vudtXhY9ByMh2Db9BkdmpXMvVWgPQuPaOI6u1yPtSPiyDu3ULhOumn0h8rDrROeAqOOE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kl1ln-0010r4-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 03:28:36 +0000
Date: Thu, 3 Dec 2020 19:28:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607052494;
 bh=LSn0KRD2PS55Qfjku+L9Oy5ZlN/QdMdDyNZ36/PvM8A=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLeUlRdAtr+nikQ+ES2mOIYMNJGkWvOzBmDFyNC892TJlrKZdsVj4vfLcSyJvg9sl
 BcyeCqHDSNu7rqDCe8wpVvbDXaEYytfQOVerM1PaxTqB7ZvunIovK9FVW2zXMeLwRS
 55DIGZbygCp8SkmaB+nUKttwOrSH76v+ZlzBXxTDlCq6gL/ujLCUkQdsvl0jNT09xw
 Q+3cRlLy9Sx0RNNA26UfSExxx9KyLxeK0qGq28Kfzc+m0ZL7vengtRB2H7fKjS0QOC
 V6fQ9I94EPQGnrsbVq9SLHda0mkdR+wgljgai4YX5pkcCq6fELK5+ZnGgfdDA5tyGF
 hOM2/VZSNNOrA==
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X8msy1T8uqZ4Z/iR@sol.localdomain>
References: <20201204005847.654074-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204005847.654074-1-daeho43@gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl1ln-0010r4-Ii
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 04, 2020 at 09:58:47AM +0900, Daeho Jeong wrote:
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 87090da8693d..cdf72e153da0 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -803,8 +803,6 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>  	if (cops->destroy_decompress_ctx)
>  		cops->destroy_decompress_ctx(dic);
>  out_free_dic:
> -	if (verity)
> -		atomic_set(&dic->pending_pages, dic->nr_cpages);
>  	if (!verity)
>  		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
>  								ret, false);
> @@ -1498,6 +1496,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>  	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
>  	dic->inode = cc->inode;
>  	atomic_set(&dic->pending_pages, cc->nr_cpages);
> +	if (fsverity_active(cc->inode))
> +		atomic_set(&dic->verity_pages, cc->nr_cpages);
>  	dic->cluster_idx = cc->cluster_idx;
>  	dic->cluster_size = cc->cluster_size;
>  	dic->log_cluster_size = cc->log_cluster_size;

The check for fsverity_active() is wrong.  It looks like you need to know
whether the bio needs to go through the fs-verity data verification.  The
correct way to determine that is to check whether STEP_VERITY is enabled in the
bio's bio_post_read_ctx.  It's set by f2fs_grab_read_bio() when needed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
