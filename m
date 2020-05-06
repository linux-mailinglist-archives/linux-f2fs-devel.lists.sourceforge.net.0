Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87A1C738E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 17:05:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWLc2-0003lH-HV; Wed, 06 May 2020 15:05:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jWLc0-0003l6-7p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 15:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jGqdkh7TTJ45vjKzWmcK2DTojE2aSuNTDGkblxNI2xg=; b=avovVQAhtFtRgj5r1ITgoZSouB
 bZujuXGO0vDW24f6bPx4WxaqsmdCeE0hY7Ec+YmseZqY6SLc2Xq3sC54OIOdY83rNssO0UmRw3eNK
 ui7K2gSXgGd3BOz+vfJqOeTsSBkHWGwu9p8RFmGzD+ffRV/ozSiX/7x5IoVzLbN+hGfo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jGqdkh7TTJ45vjKzWmcK2DTojE2aSuNTDGkblxNI2xg=; b=AF0XLymZoCgNnyHwjKutAg4oPk
 Bms3LWdRJzcZgFo9iVWZAvEhJqtPn2DyKJ8R0rXyNGdhYlTLesoLx1EUNo59MkU1O/zZoxNc4Ry/N
 KzJFPawgiPulyYTro5Gl0IXys7z4vn3+owDZwbAU+Fj3wemae/URwynX/CsrPAQ6NODQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWLbz-00D0Y9-6E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 15:05:28 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 896382076D;
 Wed,  6 May 2020 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588777521;
 bh=9EYI9KnuzJ4wy8Y0tCTKcy7C5bKDBzJt+DTI14fSzfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPtEdxFYcKZWnPZ5jgQGUjbOSBqPbRDEAyTkAUCtJbI03Q56n2YlsQ2FvsdBNXHWn
 vWUNTOfRtidssL08ENE6w1qvV7oUwIygRe6LUzl6D+k9zmzaqN3F3hPuqHK0MCasmE
 EPArj5nScAa0HLtN1YCR5i3fdeknEFxMMiU3KN9E=
Date: Wed, 6 May 2020 08:05:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200506150521.GE107238@google.com>
References: <20200506104542.123575-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506104542.123575-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWLbz-00D0Y9-6E
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: shrink spinlock coverage
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

On 05/06, Chao Yu wrote:
> In f2fs_try_to_free_nids(), .nid_list_lock spinlock critical region will
> increase as expected shrink number increase, to avoid spining other CPUs
> for long time, it's better to implement like extent cache and nats
> shrinker.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - fix unlock wrong spinlock.
>  fs/f2fs/node.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 4da0d8713df5..ad0b14f4dab8 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2488,7 +2488,6 @@ void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid)
>  int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
>  {
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
> -	struct free_nid *i, *next;
>  	int nr = nr_shrink;
>  
>  	if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
> @@ -2498,14 +2497,22 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
>  		return 0;
>  
>  	spin_lock(&nm_i->nid_list_lock);
> -	list_for_each_entry_safe(i, next, &nm_i->free_nid_list, list) {
> -		if (nr_shrink <= 0 ||
> -				nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
> +	while (nr_shrink) {
> +		struct free_nid *i;
> +
> +		if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
>  			break;
>  
> +		i = list_first_entry(&nm_i->free_nid_list,
> +					struct free_nid, list);
> +		list_del(&i->list);
> +		spin_unlock(&nm_i->nid_list_lock);
> +
>  		__remove_free_nid(sbi, i, FREE_NID);

__remove_free_nid() will do list_del again. btw, how about just splitting out
given nr_shrink into multiple trials?

>  		kmem_cache_free(free_nid_slab, i);
>  		nr_shrink--;
> +
> +		spin_lock(&nm_i->nid_list_lock);
>  	}
>  	spin_unlock(&nm_i->nid_list_lock);
>  	mutex_unlock(&nm_i->build_lock);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
