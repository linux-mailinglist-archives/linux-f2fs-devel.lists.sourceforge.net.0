Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A61BAED250
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 04:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNTZWaU5qvbRyQnFrFklTSt84Ly1eck8t8M9Yjq84EU=; b=KVgok0f1L7MLCwph4bFfz/2cL6
	yMa/fUxL2VZA5ISoon9lpqpp5z20vW6ori4CsdsRQJv7dGz2mQXglUZ+kruuyc5yWulekGjVSwFtT
	nl+yOV0XtSv2K9c6qvnCoio3zPKChz7gfmM9aPTozuzNets0uZd3wtBIR3xKQRSHIhek=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uW3tx-0001Vi-8u;
	Mon, 30 Jun 2025 02:05:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uW3tQ-0001Sc-4D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 02:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Osnr0TWMD2QeZVjZbIrBXvnoEW4PNLrFfDC6Fgk0bw8=; b=i8BtQcacKjwbVKaHLDzoiAdkXD
 iJtsZpjXF8Q7fVV/Ll+O0I4ZOkDJ4Y6Qk2XxPbC3vEyFZxltUOQf050CqcHwLEbljmqm4Kc3BGil/
 twLWpji+ePayQQxjfen6aPYRV6w/dRXGBdalxDErQozsbM+5YpkPGz/yYvUe7AOHi5Sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Osnr0TWMD2QeZVjZbIrBXvnoEW4PNLrFfDC6Fgk0bw8=; b=KHmQxC8c1SBqzpXAp1I15Q73Zd
 Drujz/+OJmAdKcq+0HCMaMxhppEHpWb9+Un4lnb5SwU/pRm4uR0RMevB3ZmoBKVob63Hnkis/8QMK
 ftqfSMGcI5oDL6xMmt4m6Y6julNlyZqN/yL1jeEK1Rq7+Xk6ffGJRbWDDckulIXC613c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uW3tO-0005AE-MK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 02:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47D8C5C5791;
 Mon, 30 Jun 2025 02:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6906EC4CEEB;
 Mon, 30 Jun 2025 02:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751249100;
 bh=LHkXBL7gK5HKdb3qamSQTHysQHLotgukhWQRR/PJUCU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YOyBkXPI2YSbDgty/YcnmQpQGdHHMmTxOW3ui3Eg5Am4BZw50Mz+WKkWwzY6fOobS
 Jj4ZkC3xtNLzTZb3vLQBvw7psReWW4/EvDv2zm3DLbziHGTnA143l+wyTPLSY7hv9c
 gVkDQITP9We0bJqYzRCIjQzX92l/U2Aqcd1TR48N+LHYsBHEAOVPUhlh60254J2sgx
 GRVpAJMj+EEukevWli4WAd11Wzki0RHVFvHz8zcduKvsys8UX3P+XyoiC5MgI/k0tM
 qME1Tz6ptgTMy4lCZE+wO4gDkvEklDffz9FqSqu66/H0fjX1iywuRn3o+B5q509sNC
 MyjegCFfVeWXg==
Message-ID: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
Date: Mon, 30 Jun 2025 10:04:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250624035938.3176350-1-wangzijie1@honor.com>
 <20250624035938.3176350-2-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250624035938.3176350-2-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/24/25 11:59, wangzijie wrote: > To prevent scattered
 pin block generation, don't allow non-section aligned truncation > to smaller
 or equal size on pinned file. But for truncation to larger size, [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uW3tO-0005AE-MK
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/24/25 11:59, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.

Zijie, can you take a look generic/494? suspect that it is caused by this change.

generic/494 3s ... - output mismatch (see /share/git/fstests/results//generic/494.out.bad)
    --- tests/generic/494.out   2025-01-12 21:57:40.279440664 +0800
    +++ /share/git/fstests/results//generic/494.out.bad 2025-06-30 10:01:37.000000000 +0800
    @@ -2,7 +2,7 @@
     Format and mount
     Initialize file
     Try to truncate
    -ftruncate: Text file busy
    +ftruncate: Invalid argument
     Try to punch hole
     fallocate: Text file busy
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/494.out /share/git/fstests/results//generic/494.out.bad'  to see the entire diff)
Ran: generic/494
Failures: generic/494
Failed 1 of 1 tests

Thanks,

> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v4:
> - convert sbi first and apply change
> ---
>  fs/f2fs/file.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 209f43653..4809f0fd6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		/*
> +		 * To prevent scattered pin block generation, we don't allow
> +		 * smaller/equal size unaligned truncation for pinned file.
> +		 * We only support overwrite IO to pinned file, so don't
> +		 * care about larger size truncation.
> +		 */
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size <= i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
