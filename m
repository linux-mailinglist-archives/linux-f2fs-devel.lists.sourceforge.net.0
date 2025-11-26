Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A66C87DD8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 03:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0suAK2h54Ejv4KNmdBZBceQubpsj1DimdALRY78MW+M=; b=D3GaPYgG47sevYQh2vFs2M1qiv
	8Ua80TGm3mt3yHAiVjan2WaBrD8VjzII+Df9K9tHO0OTBRu+RkwbMGtv5UyMrkwJFQIBwwY+1dh52
	j/Z7QB6vlKf+bI2aRMeconezsoKfQjmkNBC7RMd9mpC0ZV/jTV02b2DptEz6+dfsDdzk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO5ZS-0001wV-UH;
	Wed, 26 Nov 2025 02:47:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vO5ZS-0001wP-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 02:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sk9uGPysXdIRkaFiFWJcSGc7lTclv5i7BdR3e3rYDN4=; b=LwP2UBq8ggHjUBdbiVCeMHCQnV
 Fzesemp4VKpRL8rwuFZW9pb4o06PruPZAgVxE3I53Iqh/UB+byK4DOy31Sr1ceCVT/uRaZhHJ/New
 e4OmJmqueKoT0xW6J4f28xi7TIvv7Yg2DxZ1Itfk3F5iqzcmD2VbnXxiImmiaP1wQJjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sk9uGPysXdIRkaFiFWJcSGc7lTclv5i7BdR3e3rYDN4=; b=dDoO9TX2P5ZcsC898+E0kVkhdq
 JdrKgUVnGwbbbqfeQVJkwpcWPsZbY2Oibu+J5jIq6mBUCk41/AtW2ltZqHslk84Nb5i/h6+L33sFi
 5sGbnim+J/i/HOwu1hTpn11Joym1uQZiWfLUpZlVxLxx/T60yULd6/se3+xr6igoTeEI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vO5ZR-0005LF-If for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 02:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C473960017;
 Wed, 26 Nov 2025 02:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30622C4CEF1;
 Wed, 26 Nov 2025 02:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764125262;
 bh=1oNBzvNf2gAnqRUnior1QIt69ZATe3IeVffGuLQOlxw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=D4K8BnfBegX3TznlV3lhq2+xjh9BYEp+0UbR+3lwBOmuZUG9EK+QqAzB+IOe74JYg
 Ai5MX7dXbkGB196M8hWzezrEbznSDh+eihzkL/4QobubgwlVZPcc20BnKt3l/pr5v3
 o3NENGCan5q+u8n9+hmbYk3G5UzwFu2kOmhBYYtkcr1n/cMQMGAH68V5lKQh9NjTOO
 jJx+PTorrzdDGTlHjeSqP5LkmMD+bV9vK3yGO/LXxAf+6HJXKaxNAlI8YZCBAzQ/Cu
 VPahFm/SBiANIwY5Ue0zwbrgMmjACZSL4KvPf5z/fvM1mcXwZY9QtT+PfIHRjG8se/
 ifIIBihadXhYg==
Message-ID: <09e48eba-6f00-455a-8299-8b8bb4122c7e@kernel.org>
Date: Wed, 26 Nov 2025 10:47:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk,
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org,
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
Content-Language: en-US
In-Reply-To: <20251124234806.75216-6-ckulkarnilinux@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 07:48,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making the error assignment > in __submit_discard_cmd()
 dead code. > > Initialize err to 0 and remove the erro [...] 
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vO5ZR-0005LF-If
Subject: Re: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/25 07:48, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making the error assignment
> in __submit_discard_cmd() dead code.
> 
> Initialize err to 0 and remove the error assignment from the
> __blkdev_issue_discard() call to err. Move fault injection code into
> already present if branch where err is set to -EIO.
> 
> This preserves the fault injection behavior while removing dead error
> handling.
> 
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
> ---
>  fs/f2fs/segment.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b45eace879d7..22b736ec9c51 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1343,15 +1343,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  
>  		dc->di.len += len;
>  
> +		err = 0;
>  		if (time_to_inject(sbi, FAULT_DISCARD)) {
>  			err = -EIO;
> -		} else {
> -			err = __blkdev_issue_discard(bdev,
> -					SECTOR_FROM_BLOCK(start),
> -					SECTOR_FROM_BLOCK(len),
> -					GFP_NOFS, &bio);
> -		}
> -		if (err) {
>  			spin_lock_irqsave(&dc->lock, flags);
>  			if (dc->state == D_PARTIAL)
>  				dc->state = D_SUBMIT;
> @@ -1360,6 +1354,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  			break;
>  		}
>  
> +		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
> +				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);

Oh, wait, bio can be NULL? Then below f2fs_bug_on() will trigger panic or warning.

Thanks,

>  		f2fs_bug_on(sbi, !bio);
>  
>  		/*



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
