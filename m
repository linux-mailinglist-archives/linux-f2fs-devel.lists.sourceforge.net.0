Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339A7E4371
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Nov 2023 16:30:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0O1o-00066C-UD;
	Tue, 07 Nov 2023 15:30:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r0O1k-000666-GZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 15:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N3NfUK9vTca0Yu7sRR+7zkU4QC3cBvby2mUMCIq0JIc=; b=lRBafY4AN83yxYx4ss5fnSqieV
 EvQpQDNmMS7Zvvhgm1SxiVoa8aNIT7+USfoAOsKDb3IXkrxO2nh+THk8VHVFcbvrcYjX4jXih+xDu
 9JVOE2dR6mgvMYfCJJE6d1Lj9E738bgfTlRr+bn2yK0TZDXst3hLPUXRkeiyeXEDSEk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N3NfUK9vTca0Yu7sRR+7zkU4QC3cBvby2mUMCIq0JIc=; b=MlhQhvVBRp4Sj8PvaVpBeg68p8
 PS0JKz4kBehCLEM9JYDxFzoO+DmJXV/vXfb65jY5KxoJB+ZaUHZ9L9HTCXPqrv5dyQynWFecxrYV0
 RuHybzAN9/EM5sNFS2UNAJFKtiNDcc5V7UyiQJ21TB16jZFqC364cl2Z8fDEoj5HA3Ng=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0O1j-00AXC6-ON for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 15:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 27388CE0EB2;
 Tue,  7 Nov 2023 15:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648F4C433C8;
 Tue,  7 Nov 2023 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699370996;
 bh=cmxamXDMEWUMn8cEgNqWaQdc+pX1ObexCCh/OMwnfHI=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=b4FN91eqriAaFztaTy2f+42mALgF03S0uKEpBnmgUhocuaniZd6h7Y8UPj3uEMr0q
 0OPCW/creEavn5kKuhQSbll4vxj25ID2Docy0fwdZsJsHQFUFFhUsgH6ug7XRdqt3h
 YNi9CPucW3PUjALzU/Zv328qAy32nRVtX0KbQu13wCTY1CcukMGx0x9W7L9YWcc2hr
 FGu1cFpqh20d2escaYfKmj2KDmj4aVQ2Fu+FQGpgWffFQopIsTnTYeJySCIpXibp3q
 Hfosa/XQ5yjnau/o+Aw82wsAVV+YcsnI/6R1UUxNmFYWGb6UIH8JkF7z/VfE/fRwkK
 ULfd7rEmE7s0Q==
Message-ID: <e2167506-2b0a-a0f5-c0e9-0e8b6139c69e@kernel.org>
Date: Tue, 7 Nov 2023 23:29:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20231025202019.5228-1-s.shtylyov@omp.ru>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231025202019.5228-1-s.shtylyov@omp.ru>
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Sergey, Thanks for the patch. On 2023/10/26 4:20, Sergey
 Shtylyov wrote: > In check_swap_activate(), if the *while* loop exits early
 (0- or 1-page > long swap file), an overflow happens while calculating the
 value of the > span pa [...] 
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0O1j-00AXC6-ON
Subject: Re: [f2fs-dev] [PATCH] f2fs: data: fix possible overflow in
 check_swap_activate()
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sergey,

Thanks for the patch.

On 2023/10/26 4:20, Sergey Shtylyov wrote:
> In check_swap_activate(), if the *while* loop exits early (0- or 1-page
> long swap file), an overflow happens while calculating the value of the
> span parameter as the lowest_pblock variable ends up being greater than
> the highest_pblock variable. Let's set *span to 0 in this case...

What do you think of returning -EINVAL for such case? I assume this is a
corner case.

> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> This patch is against the 'master' branch of Jaegeuk Kim's F2FS repo...
> 
>   fs/f2fs/data.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 916e317ac925..342cb0d5056d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4047,7 +4047,10 @@ static int check_swap_activate(struct swap_info_struct *sis,
>   		cur_lblock += nr_pblocks;
>   	}
>   	ret = nr_extents;
> -	*span = 1 + highest_pblock - lowest_pblock;
> +	if (lowest_pblock <= highest_pblock)

if (unlikely(higest_pblock < lowest_pblock))
	return -EINVAL;

*span = 1 + highest_pblock - lowest_pblock;

Thanks,

> +		*span = 1 + highest_pblock - lowest_pblock;
> +	else
> +		*span = 0;
>   	if (cur_lblock == 0)
>   		cur_lblock = 1;	/* force Empty message */
>   	sis->max = cur_lblock;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
