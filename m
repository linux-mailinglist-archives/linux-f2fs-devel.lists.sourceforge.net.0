Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBACF78C9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 10:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPUEbor167ASdAWmVMED10rID3bG5779Y1KoLvVKFmc=; b=XLNwh7q5KwIN2lGv2OTxXiMaVT
	lbbT5khfZ7BT5DkFYtb2Od51hAzJnPhDQLGtax6Rqia1uNG/jbF6rqZyer2qXBwK8bFjJyP2j464M
	u5Ss0Y9209R0aDcBZdJ/i3cv5ECs0YHEm03fzOMnxnc7F6MbAJTsz4uBV5MUnWuWtNbw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd3TH-0005if-3V;
	Tue, 06 Jan 2026 09:35:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd3TE-0005iN-RB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bht4jmxmUfU9z4NJyvjPF5vKhxpKlMketIC/vbJcoIU=; b=XOS42TphaEdtcqo7nlM615XTO/
 iavPsUg7hRYwgQQHJY7e/bn2XAr/ghQXhVebdPnoTbi2ThxCmes34S6+rZD3rrzAT1jly2iaEAmCA
 CU8DQ9y4YqspK+V7l6YFTTuKN5juACw5AFcMz4wtPZ7/ZpG3vFfhvmMjWdF5xJCubMRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bht4jmxmUfU9z4NJyvjPF5vKhxpKlMketIC/vbJcoIU=; b=iOfyh0imiYwf3qLawOBj5Vfym/
 PpgRXagwHeb3pLXgWDCJZb3pIYeUHAGEm8qwgWuyUV3i0x+XX6EOpZ8wx5tdq44HoMXpWmOazyKwh
 xaZOCdSA2F+splIoARqyCi1QrZUJy+FWStHXB6y8UDJB6/EBugVxT+qpMu2O7R/D6jdE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd3TF-0002NV-7t for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8B9D43DC7;
 Tue,  6 Jan 2026 09:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C86C116C6;
 Tue,  6 Jan 2026 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767692110;
 bh=XIq6M4UbEmrOWTHwxdcXNVwcnnNutZI50868xEC0uYk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cUySUx98FYbcUlvaRZbyOCiF4ajM47DWtdBmrtS5xj68olE+Y/2sA7tZjmpRBpqGP
 Z3yDRj6ZURpVtruGvJCQuN8EqF1qreZMcVas7IDnNa1cM0NlocDoeodj0F2D7StN1B
 R5YKXhJxIC1/lxuBREEecwgWEVb7T0UaR1njchD84gDia0Ypcu2SWKt55IhaN/85Y9
 2htXyXh3JKVc4fdRueO3ZA9ih8zb2mB9incN0mUTiMctNPeSbacxPYeeZ9pLIPqpKu
 4PP+lNv9I/CSCgpBDoH59HqvvJYBi5b73HzjQJ21atjOQewp9wFpBj9YttIVusgLXE
 U4i1otCUrbpJg==
Message-ID: <5af27303-8347-4518-acc3-8d36cf14280d@kernel.org>
Date: Tue, 6 Jan 2026 17:35:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>, Kim Jaegeuk <jaegeuk@kernel.org>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-6-nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <20260105153101.152892-6-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/5/2026 11:31 PM,
 Nanzhe Zhao wrote: > In f2fs_read_data_large_folio(), 
 the block zeroing path calls > folio_zero_range() and then continues the
 loop. However, it fails to > advance index and offs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd3TF-0002NV-7t
Subject: Re: [f2fs-dev] [PATCH v1 5/5] f2fs: advance index and offset after
 zeroing in large folio read
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/5/2026 11:31 PM, Nanzhe Zhao wrote:
> In f2fs_read_data_large_folio(), the block zeroing path calls
> folio_zero_range() and then continues the loop. However, it fails to
> advance index and offset before continuing.
> 
> This can cause the loop to repeatedly process the same subpage of the
> folio, leading to stalls/hangs and incorrect progress when reading large
> folios with holes/zeroed blocks.
> 
> Fix it by incrementing index and offset in the zeroing path before
> continuing.
> 
> Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
> ---
>   fs/f2fs/data.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index ac569a396914..07c222bcc5e0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2446,7 +2446,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	if (!folio)
>   		goto out;
> 
> -	folio_in_bio = false
> +	folio_in_bio = false;

Should be fixed in 4/5.

>   	index = folio->index;
>   	offset = 0;
>   	ffs = NULL;
> @@ -2483,6 +2483,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   				ret = -EIO;
>   				goto err_out;
>   			}
> +			index++;
> +			offset++;

What about increasing index & offset in for () statement, in case we missed
to update them anywhere.

Thanks,

>   			continue;
>   		} else if((map.m_flags & F2FS_MAP_MAPPED)) {
>   			block_nr = map.m_pblk + index - map.m_lblk;
> --
> 2.34.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
