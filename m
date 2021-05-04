Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F85372C4E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 May 2021 16:42:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ldwFx-0005eR-1s; Tue, 04 May 2021 14:42:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ldwFv-0005eA-Rh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 May 2021 14:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SAJSquLSTKMvL0PxIvJaezknxPq9OS0BuPniFnBCLVo=; b=kqywAGRuXa2UD0kvxLSvnDNKl8
 CEpml0W5C5MGkueJyFqTQgesan0UrqryPRr6ibuVafiWL2VvRTlL8I8C06Hv3H/i5ArfRhAhGW2+/
 eSaEJrDI1ODAgo7/Xa+eQhpSl8ErUD7bOoIDBgDn6e6h9N3FjdcRRl/h3/H5wcFG7pXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SAJSquLSTKMvL0PxIvJaezknxPq9OS0BuPniFnBCLVo=; b=QjnciQAE1jqr4VeXSCYsp4IZb/
 WHYmDfGfqkUZottV5Ml3MGK8p3iMJP8M8onXsWjwWieL0lPVKTqOpAjFtYKYyt7cjjB66xiAfyypT
 8qRoNypxTsvom0RabOMSIuQOyeewZFGeUy3LzJ73fLgKCtE2WjYpg70PuYvd7Fw10u4A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ldwFr-00DqJe-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 May 2021 14:42:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF68C613B4;
 Tue,  4 May 2021 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620139346;
 bh=5/y4t4rgPYKWP8Sygi6NZZixNOOrVT9vxB45I1DKOMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r505mmRs2qM2fN0TQebZUs0F9lhLXNGzDPzzcK34EqPsKKhdRAi0FS3JvWqr47OU+
 EsDMpjOspSwU9ob0isexPQyGzAhRqY3pn9pqdhkOtRYNeWz6uUVvAEUtQx1lwhTa0j
 rX7FpL3wjgAJyxzkmzkRe4RqXSCA5Gqi0x6aAd3lmMQ/JXXG65dSIyHbAT8rxtpcyx
 SYyK78Dc5lsBTEX4N+TLJ4FkCQE9GOl8yPRUyL2rdbhcN7NMPeD2EUi+9aVcBw2PSe
 EI5snYVosw/wqNLaaYrrww9mTrE829BXkPtcwcV9DO35PqNuGuAhrfwE2deEHhERr5
 /gmc8+p4S7fGw==
Date: Tue, 4 May 2021 07:42:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJFdUEmYFba8sEKJ@google.com>
References: <20210427030730.90331-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427030730.90331-1-yuchao0@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ldwFr-00DqJe-Gj
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneed check
 condition
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I split this into two patches along with upstreamed change.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

Thanks,

On 04/27, Chao Yu wrote:
> This patch changes as below:
> - remove unneeded check condition in __cluster_may_compress()
> - rename __cluster_may_compress() to cluster_has_invalid_data() for
> better readability
> - add cp_error check in f2fs_write_compressed_pages() like we did
> in f2fs_write_single_data_page()
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - rename function for better readability
> - add cp_error check in f2fs_write_compressed_pages()
>  fs/f2fs/compress.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 6e46a00c1930..53f78befed8f 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -888,9 +888,8 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
>  	return is_page_in_cluster(cc, index);
>  }
>  
> -static bool __cluster_may_compress(struct compress_ctx *cc)
> +static bool cluster_has_invalid_data(struct compress_ctx *cc)
>  {
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
>  	loff_t i_size = i_size_read(cc->inode);
>  	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);
>  	int i;
> @@ -898,18 +897,13 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
>  	for (i = 0; i < cc->cluster_size; i++) {
>  		struct page *page = cc->rpages[i];
>  
> -		f2fs_bug_on(sbi, !page);
> -
> -		if (unlikely(f2fs_cp_error(sbi)))
> -			return false;
> -		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> -			return false;
> +		f2fs_bug_on(F2FS_I_SB(cc->inode), !page);
>  
>  		/* beyond EOF */
>  		if (page->index >= nr_pages)
> -			return false;
> +			return true;
>  	}
> -	return true;
> +	return false;
>  }
>  
>  static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
> @@ -985,7 +979,7 @@ static bool cluster_may_compress(struct compress_ctx *cc)
>  		return false;
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(cc->inode))))
>  		return false;
> -	return __cluster_may_compress(cc);
> +	return !cluster_has_invalid_data(cc);
>  }
>  
>  static void set_cluster_writeback(struct compress_ctx *cc)
> @@ -1232,6 +1226,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  	loff_t psize;
>  	int i, err;
>  
> +	/* we should bypass data pages to proceed the kworkder jobs */
> +	if (unlikely(f2fs_cp_error(sbi))) {
> +		mapping_set_error(cc->rpages[0]->mapping, -EIO);
> +		goto out_free;
> +	}
> +
>  	if (IS_NOQUOTA(inode)) {
>  		/*
>  		 * We need to wait for node_write to avoid block allocation during
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
