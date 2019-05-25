Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65C2A4C3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 15:57:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUXAX-0006xU-Bm; Sat, 25 May 2019 13:57:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hUXAV-0006x5-S5
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 May 2019 13:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWP5+7nuxoGjfHJ/T9/n9W4YIGH6X7bI/DJPbHb4Oyo=; b=VzvwaL0NHGp36/pcdVx2dDAPU/
 6ILvk2wotm83FCVN1HQqza0RaDFsN1AaRS82LQgECG52qgGhmRjrRk3URyKulygsyPTYG8hxUuox8
 e8yD5a+i2kbr3Vo5P0KhyfLCBQAybjsST2f1f3K6ZiK0TnzWWbBLtNTL5d1Z3vfzSjoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PWP5+7nuxoGjfHJ/T9/n9W4YIGH6X7bI/DJPbHb4Oyo=; b=QlInO2uaq9tmZOLMNnam0egA16
 xXtl7nDGMOu/0mJhUbRvKpN8ex2FwZBQnLlyV2LJgSv9ZERDEu0bpWjR9QbAHY/sKklKQrAzfHlbi
 SCsxjtMh5ayHrijh6eYogv5h7lpuhZA2pDDr7e7G+b+SkS1p7Sj4qnC5YwHhL3z738Gg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUXAU-00Gd6o-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 May 2019 13:57:03 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 373352168B;
 Sat, 25 May 2019 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558792616;
 bh=pwh+PE1rIFMiucNrJB1PXbcLOVclHdgZZ2LaqpxP554=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ilAebpZH2hacVJgxmI6tRgAWR5NN7XkrnbFU8biTFZu1/IMcbGp2uQleO0CpufcU2
 A1dGHalWwmwLBZKVqarucf9nLmCU3fjfFnAirjMI7tACOjcjhaJx7xGxQnJFiflz1+
 Rgg3LEEHKTY5XxDMXdFx7MKzIFsqXFZhad9FkmZI=
To: YueHaibing <yuehaibing@huawei.com>, jaegeuk@kernel.org, yuchao0@huawei.com
References: <20190525124809.17424-1-yuehaibing@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <33f73a57-285d-e37e-f911-6f3ad5cc6e01@kernel.org>
Date: Sat, 25 May 2019 21:56:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190525124809.17424-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hUXAU-00Gd6o-HJ
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Make sanity_check_curseg static
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Haibing,

Thanks for the patch, there is a similar report from 0-day project, but I forget
to fix my v1 patch.

Anyway, I prefer to merge this into original patch which has not upstreamed yet. :)

Thanks,

On 2019-5-25 20:48, YueHaibing wrote:
> Fix sparse warning:
> 
> fs/f2fs/segment.c:4246:5: warning:
>  symbol 'sanity_check_curseg' was not declared. Should it be static?
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1a83115284b9..51f57393ad5b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4243,7 +4243,7 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
>  	return init_victim_secmap(sbi);
>  }
>  
> -int sanity_check_curseg(struct f2fs_sb_info *sbi)
> +static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  {
>  	int i;
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
