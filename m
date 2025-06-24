Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D22AE6814
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 16:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6z3BKQ9VQEI/yHLrg/wNlWWJBV/eZ5oRA3HFeRV9GM=; b=Wjpm55gzZVLJC0EPV0K5B1Bjoj
	6BUDNllZpZDCrfxtJW1wNh1O+1ZSXilall6swObMFPjiYxgxeeu6KY6uI4QDeHsQiRf9Oe5s3dB58
	lq9qLlH97+xSlGp9yDXhaKMWqJi548Cg9rhb+xCUlEWiiV7q0OsAJ+oLCymYa00IXdxo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uU4Rd-0005hv-4j;
	Tue, 24 Jun 2025 14:16:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uU4Rb-0005ho-JU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aN3SxhbYv7LWWWnAh3vPtjTE2wDWoRKRoLNBCpVgIOc=; b=dnUOE6CMlxRNR2tFesCL5ewGrR
 WqOUO1OypWGxZ9Vy2jQZeuqTsFIgfOuRvguNt5gBlGkz/KMVb0QEQQqG2mRW/r4ABwlp8BS+0Y+7U
 pwJR/euJv4uSUsXPY1Kih5zv79C0J+sPXq7yo3BpxPV13CPiBRyZ5DevigctpwpHThlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aN3SxhbYv7LWWWnAh3vPtjTE2wDWoRKRoLNBCpVgIOc=; b=OW7QrEgPCQjaOYLM8lpk3df3Cr
 8gPZNeg0YC5H7DUyfkjiSmOI44lIdyhiFIgpsy7mHDha+MVxEuJ1CZa0F9QbugULAybp1goXt3kPx
 xfPoeDr6lsC2dV3X6n0YhgSjtVT/mAMc1C7GdwGAMBazYF4gWUEDhZQ7D9l6Ll0N+WbE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU4Rb-0004Ik-7n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DBF9E44ECA;
 Tue, 24 Jun 2025 14:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0381C4CEE3;
 Tue, 24 Jun 2025 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750774569;
 bh=APRJ75gDDgjrFelZorQyx/we/9Q0+eEodhRUdBFHpAQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rAk4Wn249dTFd5Emt922vdewi1qVT7QCVZohFukFQw4dcOVJku25zBI3VpJP2lK69
 SJyBwiuT35xOz3jIg99MsQ05HgliYrr1dVFnuPYOB/ED+wTvq3t/mnGAvmT9bj5jDt
 2QlqM2ZYFz5t40L4dU2eZDbELsneQxQJZX4pySq4zXhKELBwgR75s1vfOMalbo6Jhg
 EohaP61uzhO8jsTzsdEUmIBDNvEMDOjhqUo5sH1qqsO71nGMaeWMRpsGodVjeM1M+R
 rWzjx78pUfMR0fC0wV9WjlsGCi8rm56Ot+wHIxA/W534CLbSlMnG4nd7tETauMZylk
 NONDtjPx9F4dQ==
Message-ID: <1669c05c-7468-4347-a924-cfc4145c8c75@kernel.org>
Date: Tue, 24 Jun 2025 22:16:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abinash Singh <abinashlalotra@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250619120933.125932-1-abinashsinghlalotra@gmail.com>
Content-Language: en-US
In-Reply-To: <20250619120933.125932-1-abinashsinghlalotra@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/19 20:09, Abinash Singh wrote: > KMSAN reported
 a use of uninitialized value in `__is_extent_mergeable()` and >
 `__is_back_mergeable()`
 via the read extent tree path. > > The root cause is t [...] 
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
X-Headers-End: 1uU4Rb-0004Ik-7n
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix KMSAN uninit-value in
 extent_info usage
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>,
 syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/19 20:09, Abinash Singh wrote:
> KMSAN reported a use of uninitialized value in `__is_extent_mergeable()` and
> `__is_back_mergeable()` via the read extent tree path.
> 
> The root cause is that `get_read_extent_info()` only initializes three fields
> (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the remaining fields
> uninitialized. This leads to undefined behavior when those fields are accessed
> later, especially during extent merging.
> 
> Fix it by zero-initializing the `extent_info` struct before population.
> 

It needs to add a fixes line, otherwise, it looks good to me.

Thanks,

> Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> 
> ---
> v2 : Corrected Author name
> ---
>   fs/f2fs/extent_cache.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index cfe925a3d555..4ce19a310f38 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>   	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
>   	struct extent_tree *et;
>   	struct extent_node *en;
> -	struct extent_info ei;
> +	struct extent_info ei = {0};
>   
>   	if (!__may_extent_tree(inode, EX_READ)) {
>   		/* drop largest read extent */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
