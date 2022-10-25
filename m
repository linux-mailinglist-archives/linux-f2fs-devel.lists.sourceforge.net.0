Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 498CB60C173
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 03:53:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on98S-0008ER-H0;
	Tue, 25 Oct 2022 01:53:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1on98R-0008EL-2a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 01:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oi3E18W3WsTJ91H6klzV5c2iEFgpDC7/QdA3xOrF9cw=; b=Rgb6YeTfIpRuNiCuNQhMcpFscP
 ZScRDQE5cIoAw7SLoJOcJqOlDzjnBI+SjVOJnfiNmdYhHz4ELqppIVbls0LUOdk0Iz7w5ZKQtKDKq
 WxpTgx1GXzq3W5d+OOpN/fSvKTYV2lPo/KwHSKyvv8ronmeB/ib0+QhjwLzQTzorLEy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oi3E18W3WsTJ91H6klzV5c2iEFgpDC7/QdA3xOrF9cw=; b=D7ggbEdVwJfcmlYB3npoRcXn75
 Cjb/kazy7AbAP2MI5SchUaK9C9o5WeskRn3PgsUuhY6zwyqVYKzytaY5GtfTowHt0eq2nxctYO0Ir
 E+4IijL3sG6ekYq94WRadhQVpzF2XoA+kVfrI0dKmgcpp0dSceh91VTuS8Sxo7YNg+aI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on98G-0006Rg-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 01:53:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3609B81729;
 Tue, 25 Oct 2022 01:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659EAC433D6;
 Tue, 25 Oct 2022 01:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666662800;
 bh=AFgp/5bljv1xkC2WXg28XrrmXC0YtFMKV40o9tRVu2I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DzsJe2NWo41YbYaoOY8Qy9c6NCwUwP+6srq630XEkkouFJJzjjeCIcUqbocIvqFog
 Ba9RS8XMlc+3lVlcfk4QSE7VxE3+LuoIx354P9S7CHJiFOs0S+sJM1dNquW+UsD4fJ
 r+At/C2cBjzr83SyEnMxvUKY7A5ZT8rEdr7Bya7P3BY5J8EuW5hFKTFeVdkOiwM1jj
 rfTWVecLji+mE8HI7Wkt3gxI7BDpqKd72VjuoiJnrLIwOJAbo+w3p/coxXxZEVLBHf
 ogFvzd4M1ieWEG9aUUcA0kXDdAji8ruyuAZ5iEnm7aeVVVHW2c163YydlvwqGYzoip
 meiPjQNMVKoIw==
Message-ID: <dfc051bb-71ca-035c-b945-ad298aa5e1ae@kernel.org>
Date: Tue, 25 Oct 2022 09:53:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221021082657.26559-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221021082657.26559-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 16:26, Yangtao Li wrote: > Changed a way of
 showing values of them to use strings. This change breaks forward
 compatibility of gc_idle interface. Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on98G-0006Rg-W2
Subject: Re: [f2fs-dev] [PATCH] f2fs: make gc_idle sysfs node readable
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

On 2022/10/21 16:26, Yangtao Li wrote:
> Changed a way of showing values of them to use strings.

This change breaks forward compatibility of gc_idle interface.

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/sysfs.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index b4476adea776..555849d4c744 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -332,6 +332,10 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
>   #endif
>   
> +	if (!strcmp(a->attr.name, "gc_idle"))
> +		return sysfs_emit(buf, "%s\n",
> +				gc_mode_names[sbi->gc_mode]);
> +
>   	if (!strcmp(a->attr.name, "gc_urgent"))
>   		return sysfs_emit(buf, "%s\n",
>   				gc_mode_names[sbi->gc_mode]);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
