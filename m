Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D943C1DC4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jul 2021 05:22:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1h5M-0000IP-L4; Fri, 09 Jul 2021 03:21:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m1h5L-0000ID-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 03:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrCaot6+Qq8dOvv6AXyKeebXivlvIsmOxlFvve+ZRWg=; b=Qzp8Sqrbr8+uH3ot7owfbf/BEb
 pZq3f1UCu/b9C5xHcCOngTITtJz6dj2f/Sb2GDBormiuYQEIwdH4+jrlucyYWSDhDTlZ5FRfavoIt
 VZ9MWtKsvIEmkpou5kMkDEtlHWzB+iPlqcKsNPJSpMn8184UTqCdf9YzJYsFL53v4Ybc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DrCaot6+Qq8dOvv6AXyKeebXivlvIsmOxlFvve+ZRWg=; b=lO6qb2Xw5g4ndDyuUDq0wvimO9
 69SF4SjLlyH5TfodCQbflbbxStHskuJ53mh/mWlXGdbhGuPGjqdJE0eJyrQB5pyQJ5tsyemSnmWIt
 I7/jhUPP/128PxTQPsUgrTeKrRjpCmAkMpWPjyETm1lRF0kFl+ZYwOniKQPZBYkQKouI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1h5A-000LPz-1k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 03:21:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A74E61355;
 Fri,  9 Jul 2021 03:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625800887;
 bh=fVKeIVQwMbKZDY5wCRecqQpMQbS9jXlHnO4drJOgPb8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KNT5Km0XIfnBAiiboSb7II6PbPttcoA7OoruMJ5tZsqAavubPwL0jvkY/y+WihUzh
 eSbwfH0lux0AmfT0N6wCrROi0vvLI7lLP8vJ+6ONOFU6it/JvMtO9g+4F/bLJt2LrF
 FO5m+HDJWYG2soj38mWwRvqa08R6QLFgAcc9nSGvH4v5W46b9hRQNg+Eyw90O2oSxv
 xIsK9q64hEX1K9LoZzd0D2ri4+FrzdPvrOHMQsKtmaceFVKUYhB4/X5gQAP1ZVJbh7
 sXQynEIcQuKr1Yn0KY8+XlL9fyJeqnFBCet7dLg4U8KPL3q4CxRVxad+5EfYtDRjVP
 S0Zhd64IYaGLg==
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20210709020559.3885430-1-wangxiaojun11@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <0b0ae666-e020-2e1d-c893-e8180a7f1225@kernel.org>
Date: Fri, 9 Jul 2021 11:21:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709020559.3885430-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1h5A-000LPz-1k
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid to create an empty string as the
 extension_list
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/9 10:05, Wang Xiaojun wrote:
> When creating a file, we need to set the temperature based on
> extension_list. If the empty string is a valid extension_list,
> the is_extension_exist will always returns true,
> which affects the separation of hot and cold.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> ---
>   fs/f2fs/namei.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index a9cd9cf97229..34341d3edb8d 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -219,6 +219,8 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
>   	int start, count;
>   	int i;
>   
> +	if (!strlen(name))
> +		return -EINVAL;

How about adding this in __sbi_store()? like:

if (!strlen(name) || strlen(name) >= F2FS_EXTENSION_LEN)
	return -EINVAL;

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

>   	if (set) {
>   		if (total_count == F2FS_MAX_EXTENSION)
>   			return -EINVAL;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
