Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED788C04B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 12:12:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rp4iy-0002Eq-MN;
	Tue, 26 Mar 2024 11:12:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rp4iw-0002Eb-J8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 11:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Tk6DS2QAq6koFHYij25bP5TbhpaX6EhVX5UwuXE/YQ=; b=Et1Jd1Yh4cyOKSb2ATK95ec9vu
 l9ukFSPPgJ4G4887dIEPS6YyTQGYydlSNvmuXATJL/Do3ouTzsHAVV1oMl115+J66KBuqD8KzfOQb
 ClcXK0qcP5I5qn7zLN3rfo6YIGMeP2eNQXxmcbNT26qoYB7K77ibgLFyZEpxs0NRktpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Tk6DS2QAq6koFHYij25bP5TbhpaX6EhVX5UwuXE/YQ=; b=lfVIwpX+pskHtJyXXtrzY+vrNW
 r4Mmy8Tk2lvKv3mV2nzvsy4Y/DzFRdjgCRFLb80zOiV35gpTdSEJ5JJ0i2xfE05Uj1tQhSa9Lbi+E
 Tw4JHiWfbO8q2VsvHE3u4YA0bXUrROT2uolN+3ZzpwicpSlkb7wiIR0T1s0kDmFHrntE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rp4it-0004Cx-Gw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 11:12:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0E74BCE1EF1;
 Tue, 26 Mar 2024 11:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EACC433F1;
 Tue, 26 Mar 2024 11:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711451515;
 bh=XOachr2WIaie8cJhl/lzaSmTxBP/4J3wqYR/eRLBdO8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UZUDLLRuPSnii715EPgehEkwLpc2bCCpy55jaWgGp7uH9FxbqW6+vaJAhstkh64Ho
 Gp2OkGWlSF8rL6b5MobYtUjhJ33VzlDTeB+jQlCNoOyHba2er/P6yvjlddDKuq9CI0
 SwiMQlt4FBmRFGIXM3Str9hGkUeWkCbme/wd5mNGTkAZHewRFc1hjyZuB1v9fUijfn
 bhvkzlyOaCdIkKuEaHm5LXOWbNoBoljVZn2jRggs8ETEQ07HIcP/PwN0OanHRA6oFr
 h6AymSgN3MVLdAhMD2Eu6CjqbXrt4UkovwTTKET5xqQx7IlY+/YbJjZGSJRgTo6rGn
 t4GxWigrJrzwA==
Message-ID: <8a6b2768-8ab6-4275-8c4e-05b4eca83987@kernel.org>
Date: Tue, 26 Mar 2024 19:11:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1711346195-24555-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1711346195-24555-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/25 13:56, Zhiguo Niu wrote: > A length that exceeds
 the real size of the inode may be > specified from user,
 although these out-of-range
 areas > are not mapped, but they still need to be che [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rp4it-0004Cx-Gw
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropirate
 defragment pg_end
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/25 13:56, Zhiguo Niu wrote:
> A length that exceeds the real size of the inode may be
> specified from user, although these out-of-range areas
> are not mapped, but they still need to be check in
> while loop, which is unnecessary.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v2: check i_size within inode lock according to Chao's suggestions
> ---
> ---
>   fs/f2fs/file.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 128e53d..cf63db7 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2608,9 +2608,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>   	bool fragmented = false;
>   	int err;
>   
> -	pg_start = range->start >> PAGE_SHIFT;
> -	pg_end = (range->start + range->len) >> PAGE_SHIFT;
> -
>   	f2fs_balance_fs(sbi, true);
>   
>   	inode_lock(inode);
> @@ -2629,10 +2626,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,

pg_start = range->start >> PAGE_SHIFT;
pg_end = min_t(pgoff_t, (range->start + range->len) >> PAGE_SHIFT,
			DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));

>   
>   	/* writeback all dirty pages in the range */
>   	err = filemap_write_and_wait_range(inode->i_mapping, range->start,
> -						range->start + range->len - 1);
> +						min_t(loff_t, range->start + range->len - 1,
> +						i_size_read(inode) - 1));

, pg_start << PAGE_SHIFT - 1, pg_end << PAGE_SHIFT - 1); ?

Thanks,

>   	if (err)
>   		goto out;
>   
> +	pg_start = range->start >> PAGE_SHIFT;
> +	pg_end = min_t(pgoff_t,
> +				(range->start + range->len) >> PAGE_SHIFT,
> +				DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
> +
>   	/*
>   	 * lookup mapping info in extent cache, skip defragmenting if physical
>   	 * block addresses are continuous.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
