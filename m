Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2A3248A8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Feb 2021 02:50:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lF5ni-0002Ha-Id; Thu, 25 Feb 2021 01:50:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lF5nf-0002HQ-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Feb 2021 01:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TZcrvvbNPNeF92v7guskEUM420X0A63lWzVv6hqTEoA=; b=h+QKqVUVrRMyAs8wVjTqn7BFZr
 gaQ/aasONFnC+c3yUyYu3R/2MhuHnPS6qcKAS67b2jVCH0y6eQWOAlX3f7j+JEH+TF+eM24O9yOQ0
 dCt8+VE+TUOyT/ZW/TqbZMgOBEaZC3N8im7gn1G56k/luMWGoZHHmwAdO6V1IvKnB5Kk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TZcrvvbNPNeF92v7guskEUM420X0A63lWzVv6hqTEoA=; b=E16Lc1OhJqchfOfeChlFp0Fe+U
 EY1b/TEC9D5CnhrVtetZtguWGpdOlwZ8d37FXT0wyblwnFgSKlzP8YVtINu62rbkwNVOJcB9srFZs
 ILBO+wecozYAC0hRg6GREovLW/5AI03IvtgN02qBn+ilBnoftXCDsk6VoWzYT0F1xxE8=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lF5nV-004NUQ-GK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Feb 2021 01:50:43 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmG0b1V02zjS9s;
 Thu, 25 Feb 2021 09:48:47 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 25 Feb
 2021 09:50:19 +0800
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210224170327.237831-1-arnaud.ferraris@collabora.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4f3d7d52-a5bb-e219-229a-7fee728c025f@huawei.com>
Date: Thu, 25 Feb 2021 09:50:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210224170327.237831-1-arnaud.ferraris@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lF5nV-004NUQ-GK
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: fix new reserved segments
 calculation
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/25 1:03, Arnaud Ferraris wrote:
> f8410857b7a81b1b347253fcca713d8b105e9e7b changed the way reserved

Commit f8410857b7a8 ("f2fs-tools: zns zone-capacity support") changed ...

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> segments count was calculated in `mkfs`, but that wasn't reported back
> to `resize`, making it impossible to resize a filesystem in some cases.
> 
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> ---
>   fsck/resize.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fsck/resize.c b/fsck/resize.c
> index 46b1cfb..3ee05f7 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -148,8 +148,8 @@ safe_resize:
>   	/* Let's determine the best reserved and overprovisioned space */
>   	c.new_overprovision = get_best_overprovision(sb);
>   	c.new_reserved_segments =
> -		(2 * (100 / c.new_overprovision + 1) + 6) *
> -						get_sb(segs_per_sec);
> +		(2 * (100 / c.new_overprovision + 1) + NR_CURSEG_TYPE) *
> +			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
>   
>   	if ((get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
>   		get_sb(segment_count_main) * blks_per_seg >
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
