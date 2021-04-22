Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC2367830
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 06:04:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZQZm-0007vX-Ii; Thu, 22 Apr 2021 04:04:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lZQZk-0007vO-OD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 04:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZAv9tLqrkVZOAHtRu1Ftpqpi6B5B4moHm680BDyXvw=; b=Nk8WkoPt2dybBC/6cjiZQ1bheD
 u80jsHUsmhRLGIT8J13kgkqZ+/xacllGxirWllm7ae49cP15zMDfw/i0NxYb4zDk+I8CiaqX+SfDY
 vMBDZ0HaehA+fcFio8z8XJP60/8rWZnnFg2E5qlnDcSkMFlu88aLicEg2nGojq9ZEZUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZAv9tLqrkVZOAHtRu1Ftpqpi6B5B4moHm680BDyXvw=; b=RljZdQCrnEtKVFAE3+bKHzpuOI
 tRZrYCKecai8Dwwz6cuwlsjRUkB2a2yJO58p+s4UIYI9Wm8GOAJ1dQwh9JhBA/buQtUm2xgGizitG
 1t+oPdKCxpEeLR8vVgithY2NyB7kS9uiXW+cOYp4zngwb2SgeQRjYdQ01sUXcdiWo2zg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lZQZa-0006y1-PZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 04:04:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F5B1613CC;
 Thu, 22 Apr 2021 04:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619064244;
 bh=vs3ayIaBY68FqZS//4WZP7ftXNR4rRy3qqwmFLiugpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vKLbE6T5+jN47C/PGbTCN6CmFwsH7i17h/qAlfAM+z7Ar5+qCVPjF9Moyr8DcR8xq
 E/o818HE1z3zqtK8/s3afrUcPBVWKZ71BsO7FqqdtnDAADgzwpwHHa1MTdkpyBu2gc
 I71Nr/VjufUu1SzBNDZEptGOnZsUo1okRrWV1tCUSAWgCTqEGQE+NZVLhTLIEMwBgC
 z9PXv496oiprc6UpvvQtDdpIwDU5wUnyIwpqlGrt93BxOQc6iKxnSucaMaT6XrEm5s
 z9gRE2cz906bwMOBWGkGsqZMLrCiAy29DYpCRRcj1A+QS117+Tq2JI/HnMSmC7LXEi
 7z2B3zUUScbVA==
Date: Wed, 21 Apr 2021 21:04:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YID1sqemJVeBcdqD@google.com>
References: <20210421083941.66371-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421083941.66371-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lZQZa-0006y1-PZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: remove unneed check condition
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

On 04/21, Chao Yu wrote:
> In only call path of __cluster_may_compress(), __f2fs_write_data_pages()
> has checked SBI_POR_DOING condition, and also cluster_may_compress()
> has checked CP_ERROR_FLAG condition, so remove redundant check condition
> in __cluster_may_compress() for cleanup.

I think cp_error can get any time without synchronization. Is it safe to say
it's redundant?

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/compress.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 3c9d797dbdd6..532c311e3a89 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -906,11 +906,6 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
>  
>  		f2fs_bug_on(sbi, !page);
>  
> -		if (unlikely(f2fs_cp_error(sbi)))
> -			return false;
> -		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> -			return false;
> -
>  		/* beyond EOF */
>  		if (page->index >= nr_pages)
>  			return false;
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
