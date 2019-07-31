Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2B7BE56
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 12:25:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsln2-0005Sa-5Q; Wed, 31 Jul 2019 10:25:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hsln0-0005SS-4W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 10:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CWDINEkHlSA+kg8hDCur6MxZqnN61IhEUStrjMcILKE=; b=YAZSfC0sptdU0yUEmf6T2Uypa7
 sUvnDRNMnPHhfuZqzsRSKYuCHavNGjUcPdkeWnJp5oFQakpAJB+wGBMNao5/au4uxZ1AKrxpKogBl
 N4Steo3M34yWHAmTmqw0OgWf0yzUBXnlLvy4YVJ7Ffu/yThGxWtUktcl76qxYbdElzFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CWDINEkHlSA+kg8hDCur6MxZqnN61IhEUStrjMcILKE=; b=IniE+e1jE0Vz6AOyKFpxq7Ab9s
 gzV2Ij5vl11Bn0Q6yKluF1tavXjgn3T6R1E/BLIgy6V7Pc0qhMP7aZWIMDLJii1jMqJsULuxMWA+2
 oF34S8vbGk8OZHS0XC4/tpaiA/hs33gDH58WuNiJIai1cRRVqM+7qnlgkri2cHbvd55M=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hslmw-005BaL-AP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 10:24:58 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A73204E70EFCB0362009
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2019 18:24:46 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 31 Jul
 2019 18:24:40 +0800
To: Xiaojun Wang <wangxiaojun11@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <1564543621-123550-1-git-send-email-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <61d50405-d7a9-99f8-a7fc-1286db1a38e0@huawei.com>
Date: Wed, 31 Jul 2019 18:24:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1564543621-123550-1-git-send-email-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hslmw-005BaL-AP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix memory leak in build_directory
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/31 11:27, Xiaojun Wang wrote:
> This patch fix bug that variable dentries going
> out of scope leaks the storage it points to.

Normally, we use title like "sload.f2fs: xxx" to indicate this is a patch of
f2fs-tools, otherwise it looks like a kernel one.

It's local filesystem change, so we'd better get rid of fsdevel mailing list
submission to avoid in-there folks' complaint which has happened previously...

So just f2fs mailing list is okay. For f2fs change in kernel side,
scripts/get_maintainer.pl can indicate which list we should send to or cc. :)

> 
> Signed-off-by: Xiaojun Wang<wangxiaojun11@huawei.com>
> ---
>  fsck/sload.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fsck/sload.c b/fsck/sload.c
> index f5a4651..e5de2e1 100644
> --- a/fsck/sload.c
> +++ b/fsck/sload.c
> @@ -240,15 +240,18 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
>  		ret = set_selinux_xattr(sbi, dentries[i].path,
>  					dentries[i].ino, dentries[i].mode);
>  		if (ret)
> -			return ret;
> +			goto out;
> +	}
>  
> +out:
I'd like to suggest to release each entry in the end of cycle to save memory in
time, and in error path, we can traverse and release dentries[i, entries]. How
do you think?

Thanks,

> +	for (i = 0; i < entries; i++) {
>  		free(dentries[i].path);
>  		free(dentries[i].full_path);
>  		free((void *)dentries[i].name);
>  	}
>  
>  	free(dentries);
> -	return 0;
> +	return ret;
>  }
>  
>  static int configure_files(void)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
