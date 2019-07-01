Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCDD5BE6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 16:38:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhxRS-0005wl-Fv; Mon, 01 Jul 2019 14:38:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hhxRR-0005wX-7h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 14:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ojrI7Gmga21dHhKi0uLWWVTxBWUCcEpnaWalEZuEePs=; b=jtz0/2irQN75Om24YRzUxKl1oD
 NdpYG6R1OQ6oeA4PEzbCYBXdwKvR4j8ttMOK/YxzAfoFp6l39beHxpVvgV6j3sNcdhoByyVrCpEr7
 53gRUOTGc4JfMhcwXVcuK0F2tZmcPusKURhX/nWDIebOoF8ZxcuCSE9za1aQJrAPGfUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ojrI7Gmga21dHhKi0uLWWVTxBWUCcEpnaWalEZuEePs=; b=V/gXO3FqhITlg/gXrUCfZ0PdfK
 dhSohZOpA0edG2L6Fn27wtXYko3/Md/wooXp7CZFjV3YwhMbJ1ZuAj2wzoCHCoWbWlsI0zqJjuEth
 KJ39plRXzgDCGYMx8YxD8Da4UGfZZy2dYA8q6gTj5xa0TOL9OyN623pTTh/iQyLEs1uU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhxRW-000iZE-Tj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 14:38:09 +0000
Received: from [192.168.0.101] (unknown [49.65.245.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94E06214AE;
 Mon,  1 Jul 2019 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561991881;
 bh=IrdLVTrOJB2ZPFcpqaowq4zGKbhkhofEJFmL32P0KBU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aBiWDjZKdNqFrpKJq+ZiO6RvDMwCvDyEDsOEevo6/IAsx3uBTTQCKMFsgPYAiyZNm
 KbmFLxI6tA+lORHfeN704ea8l6t3zDFmYR3jvu3KPss3FQQzp3Gc46agKCiFmIyqEI
 M8oWsloKkY3vmSvEk7dpawlIdyYaQFNeoWLOkDmo=
To: Liu Song <fishland@aliyun.com>, jaegeuk@kernel.org, yuchao0@huawei.com
References: <20190701133841.3201-1-fishland@aliyun.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <c02efb8b-0ee0-665f-4b33-08ee694cc659@kernel.org>
Date: Mon, 1 Jul 2019 22:37:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190701133841.3201-1-fishland@aliyun.com>
Content-Language: en-US
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
X-Headers-End: 1hhxRW-000iZE-Tj
Subject: Re: [f2fs-dev] [PATCH] f2fs: use multiplication instead of division
 in sanity_check_raw_super
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
Cc: linux-f2fs-devel@lists.sourceforge.net, liu.song11@zte.com.cn,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Song,

On 2019-7-1 21:38, Liu Song via Linux-f2fs-devel wrote:
> From: Liu Song <liu.song11@zte.com.cn>
> 
> Use multiplication instead of division and be more
> consistent with f2fs_msg output information.
> 
> Signed-off-by: Liu Song <liu.song11@zte.com.cn>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index af58b2cc21b8..eba4c0f9c347 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2489,7 +2489,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  		return 1;
>  	}
>  
> -	if ((segment_count / segs_per_sec) < total_sections) {

I think we use division intentionally to avoid potential overflow when doing
multiplication.

You can see the detailed commit message in below fixing patch:

0cfe75c5b011 ("f2fs: enhance sanity_check_raw_super() to avoid potential overflows")

Thanks,

> +	if (segment_count < (segs_per_sec * total_sections)) {
>  		f2fs_msg(sb, KERN_INFO,
>  			"Small segment_count (%u < %u * %u)",
>  			segment_count, segs_per_sec, total_sections);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
