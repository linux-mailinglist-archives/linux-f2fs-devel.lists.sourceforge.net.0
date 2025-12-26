Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF4CDE426
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 04:01:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0i+r6rYHVNQPgEPfkghpac+Ma8uRFFOLSqcj9S+Q80=; b=cs4N6lg3dmVQGO9vmmdwJp/P3c
	PQ54sfiUhw/qc4z+ihpQ3n+rKbrXig8TmdRsEVM5GyVTW5doaytkNcohCvJwzGvcJioyVFVimWtEZ
	HDAaEXvNLB5hW6CBu3X/JqLj6Jx+8AFhZFdzPmsox2xviJiRHMpq09frhA/7vaVaiwFM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYy53-0006RB-QE;
	Fri, 26 Dec 2025 03:01:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYy51-0006R4-IG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i/evLnrz/P1GC6nx+makVIBO+xU9VAEQ0U8TFuktr4U=; b=dvnsP4ZgxUST9Re1z3kDYWeevR
 Y/FQqA+FQrvYTtRQ9/W4fELvvigmM7p5mc1kpyf4r1lps4k4BUw6YE92ZRsFSyWnF09SsJeTkif6L
 +G9pAvTVDQCczB6jofYkRIxP+qpVY0kZcxqwAmMbblTrRayZos7GfclODnBjw05bhRnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i/evLnrz/P1GC6nx+makVIBO+xU9VAEQ0U8TFuktr4U=; b=g8jVCc3HWv+UCXDHGzEkj5tq4B
 r+PIA4qd6P4KEfIoZ9JVJXmyqIySKneIfPAOWLMUlfJoAPJpE99RFEpHH+F1qpP15rgGNiRA8DZGQ
 1g05wb0bzgURbOCEybfyyGsD+Vik3Og+gzh8NZfsBcx/Os3IvA8qRZq9ICD3ObU1QfLI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYy51-000120-4O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 82E346000A;
 Fri, 26 Dec 2025 03:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658E0C4CEF1;
 Fri, 26 Dec 2025 03:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766718076;
 bh=kw7i8d330dYGw8f17T6hf3D3jonDzqxMLICt59ZeO4c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fb5MK+B1drA1Cfg9tfBrJZHF5Eldo93RZ9OdtgO5eeV3cJvM95Damh+xsQtjrv7rH
 WOm9/I4VqMFUEXJzp1oGyCxXdKbsZ2nXY+ITcGcZqMHqP84jqDxn3qGovc5JXzlQiI
 xsvdp33gpK09czBjw39q0w6zhBjDTlusJ5l0RE6AU8HFnPsV/z6pj0G5gw/5PvXf7T
 peqqQmoquAq9ukYRO897+zTj4ZbrFQ3DgNo3CmdAZBWzV1bojGjr08G8/RAAW4qZHz
 KDJJKdHyPO1rWZxkyIKC36viUduasysxMBRvvbWngA0XZkHq0ykqymy571sKiiiYzq
 FVBPiS24Jc9QQ==
Message-ID: <2bc6224e-a4df-429e-9c86-acdbf460ce86@kernel.org>
Date: Fri, 26 Dec 2025 11:01:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <938c75a4-b825-4341-b208-44de1dc5a7fd@auroraos.dev>
Content-Language: en-US
In-Reply-To: <938c75a4-b825-4341-b208-44de1dc5a7fd@auroraos.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/25/2025 4:44 AM,
 Sergey Shtylyov wrote: > In __is_valid_data_blkaddr(), 
 an *if* statement is used where a *switch* > statement clearly fits better...
 I think previous version is clear to understand, unless we add more *_ADDR.
 :) Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYy51-000120-4O
Subject: Re: [f2fs-dev] [PATCH] f2fs: use *switch* statement in
 __is_valid_data_blkaddr()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/25/2025 4:44 AM, Sergey Shtylyov wrote:
> In __is_valid_data_blkaddr(), an *if* statement is used where a *switch*
> statement clearly fits better...

I think previous version is clear to understand, unless we add more *_ADDR. :)

Thanks,

> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> ---
> This patch is against the dev branch of Jaegeuk Kim's f2fs.git repo.
> 
>   fs/f2fs/f2fs.h | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 53cbce96f126..ea2b224150ce 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3680,10 +3680,14 @@ static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
>   
>   static inline bool __is_valid_data_blkaddr(block_t blkaddr)
>   {
> -	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR ||
> -			blkaddr == COMPRESS_ADDR)
> +	switch (blkaddr) {
> +	case NEW_ADDR:
> +	case NULL_ADDR:
> +	case COMPRESS_ADDR:
>   		return false;
> -	return true;
> +	default:
> +		return true;
> +	}
>   }
>   
>   /*



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
