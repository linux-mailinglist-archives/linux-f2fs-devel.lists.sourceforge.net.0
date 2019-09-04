Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E0A81A1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2019 13:59:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i5TwH-000708-Fj; Wed, 04 Sep 2019 11:59:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i5TwF-0006zf-TU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Sep 2019 11:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z8HfHVpOSjziVKcy/ceMIrDKiXpksTCt7LNdVpGeI2s=; b=WrfWlM4qJv4peloPuv6uyEWIQo
 QiFnOhTXA2EXPBd1/xu3v9Zxk9BaZGRmg5sK1nTxfBMOGhVaLAMduF2V3iMZVtGPiqriGfvqfaZ4T
 uZ/X27NuF1AZhokve4u7LDKQ+3QIBNd8PtdYajhFjheiYKnew8mv9mCzEOPMadkFC6fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z8HfHVpOSjziVKcy/ceMIrDKiXpksTCt7LNdVpGeI2s=; b=epBIqbYW5MxKCk2tuUZxrhrySy
 52U4tdff5Uzc34tYjM2AlQnMvLL0rVKUaFbINWL8QyFhq1AcO74MNbGUNx61+um2f7+0EIVDrz8VF
 z3xybAJ/Ov1o0Q3uSmpTiaWahDmBgeLGI1k9dF9h1IojrAw5yJwHnPd0lDZ/xLqghpXY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i5TwD-0095OC-IJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Sep 2019 11:59:03 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5F0A4C1B84A24276A792;
 Wed,  4 Sep 2019 19:43:15 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019
 19:43:10 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190904100239.GC7007@mwanda>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
Date: Wed, 4 Sep 2019 19:43:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190904100239.GC7007@mwanda>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i5TwD-0095OC-IJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: signedness bug in
 f2fs_fname_setup_ci_filename()
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
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/4 18:02, Dan Carpenter wrote:
> The error handling doesn't work because "cf_name->len" is unsigned.

Dan, thanks for catching this, would you mind merging this into original patch,
since it's still in the dev branch. :)

Thanks,

> 
> Fixes: fbce5d4ab3ab ("f2fs: optimize case-insensitive lookups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/f2fs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 9de688a4e115..c83b666f9d7e 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -157,7 +157,7 @@ void f2fs_fname_setup_ci_filename(struct inode *dir,
>  	cf_name->len = utf8_casefold(sbi->s_encoding,
>  					iname, cf_name->name,
>  					F2FS_NAME_LEN);
> -	if (cf_name->len <= 0) {
> +	if ((int)cf_name->len <= 0) {
>  		kvfree(cf_name->name);
>  		cf_name->name = NULL;
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
