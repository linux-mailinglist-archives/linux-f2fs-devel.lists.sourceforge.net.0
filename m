Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539680B35F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Dec 2023 10:08:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rBtJb-0000YO-T9;
	Sat, 09 Dec 2023 09:08:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rBtJa-0000YH-JX
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Dec 2023 09:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VhaMnrrXxdnfk82wNWCNna6CoeFvO3vbHVXgxnHaF9c=; b=kXSVil6lbGBmc3eoT73RNlNn3h
 99ffkENbjYeHZhM04LmWkyoXyB7yRxhEyvy15dUiKH0pkdmzH3d3plQzRRs8UT9oZXTBY+tdPexZw
 AP6Q3KNA5S5L0tJ94G74zfetgPeeE3gqdw5osaklyaNo/5KIlKy0SkzPRcAKpm6wCZ1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VhaMnrrXxdnfk82wNWCNna6CoeFvO3vbHVXgxnHaF9c=; b=HwOQAeJ33c+yu5iHjJxhH3fsXz
 O64Ww5gg8D/l8t9eA/8pqkRHYFBOM05bq1fgul0ftVI+G+LHervUQbj2u/U7Ejkve1sZ5FoGWVTiv
 /qsS3mgBmvu4bNrZk7sGZr81SlQDOuaAi5tqQ/Xpr61m31r2gAKx6ik/T22cP6DGJNLo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rBtJY-000815-Qk for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Dec 2023 09:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E226BB831B8;
 Sat,  9 Dec 2023 09:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0734C433C7;
 Sat,  9 Dec 2023 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702112867;
 bh=Te1ZPTeA2oHIZ2byR91guQ/ayXHNpwpIAlanhv07ZOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RRPwawK4rvpOV2pZwrJeqH0X3XNptKQJkzNTH6wbV+i0ig+3DTK+UHREL6SbJYm6T
 kkeRVJUfRxVZt8MKkMFYw+0c+pZG7ky8erSmu9iBRV7lptUJwE2JLO/AvlTtt4c3Rt
 dR3kSiOVLELPHtYXGUFagJIKrdvmDrnEvfZRfuxr3ZUPVnuZIkzWryYhYedMi9sTRZ
 qQFs+h1IphJVvy4ay00aDrwcQLalnB/AesBq+nmb7CgsFKA+zGsTNPnrijvrKOcgxx
 vhV1inmCaO8iSIjY7/7Qw0M3GWQbjjgsjXWjfq/18uUsvKtDfKPuwuPFzlSYXnLB4Z
 OSAQTGir56Nng==
Message-ID: <1332b650-0415-47a0-b439-053060c869f1@kernel.org>
Date: Sat, 9 Dec 2023 17:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231130092310.1297336-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231130092310.1297336-1-frank.li@vivo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/30 17:23, Yangtao Li wrote: > Remove unnecessary
 code logic. > > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- >
 fs/f2fs/compress.c | 30 +++++++++++++ > 1 file change [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rBtJY-000815-Qk
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: do cleanup in
 f2fs_truncate_partial_cluster()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/30 17:23, Yangtao Li wrote:
> Remove unnecessary code logic.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/compress.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 36e5dab6baae..de55c266509a 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1170,7 +1170,9 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
>   	int log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
>   	pgoff_t start_idx = from >> (PAGE_SHIFT + log_cluster_size) <<
>   							log_cluster_size;
> -	int err;
> +	struct page **rpages = fsdata;

fsdata is NULL here.

Thanks,

> +	int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	int err, i;
>   
>   	err = f2fs_is_compressed_cluster(inode, start_idx);
>   	if (err < 0)
> @@ -1190,25 +1192,19 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
>   	if (err <= 0)
>   		return err;
>   
> -	if (err > 0) {
> -		struct page **rpages = fsdata;
> -		int cluster_size = F2FS_I(inode)->i_cluster_size;
> -		int i;
> -
> -		for (i = cluster_size - 1; i >= 0; i--) {
> -			loff_t start = rpages[i]->index << PAGE_SHIFT;
> +	for (i = cluster_size - 1; i >= 0; i--) {
> +		loff_t start = rpages[i]->index << PAGE_SHIFT;
>   
> -			if (from <= start) {
> -				zero_user_segment(rpages[i], 0, PAGE_SIZE);
> -			} else {
> -				zero_user_segment(rpages[i], from - start,
> -								PAGE_SIZE);
> -				break;
> -			}
> +		if (from <= start) {
> +			zero_user_segment(rpages[i], 0, PAGE_SIZE);
> +		} else {
> +			zero_user_segment(rpages[i], from - start,
> +							PAGE_SIZE);
> +			break;
>   		}
> -
> -		f2fs_compress_write_end(inode, fsdata, start_idx, true);
>   	}
> +
> +	f2fs_compress_write_end(inode, fsdata, start_idx, true);
>   	return 0;
>   }
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
