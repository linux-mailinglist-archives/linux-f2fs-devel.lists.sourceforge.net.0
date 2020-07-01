Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352D211064
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 18:16:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqfPP-0004Da-8W; Wed, 01 Jul 2020 16:16:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqfPN-0004DT-TE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mPw/p1xXbLS/CD/LUAU8v1WJB//c5fXBBWbzYECQg6k=; b=c5qBa3vReBKujHsFMtOz9dfEW4
 JFpG8TZNCTuAAi6yx6COvJwh26veuD7/r5sXfstpS4EsAMWG7FrPoVzIYY7Wc4dhg1YojGWukNUId
 KkHhb/gCYDWJmeDWkZC1IPvI8qqu+Yi8eGcq3clJSa5vzsq3gHLYMTvsah0s1iOJQii0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mPw/p1xXbLS/CD/LUAU8v1WJB//c5fXBBWbzYECQg6k=; b=Cjy4NxaL11m0CAy+Jf6Mg74Cxu
 VridrvIqcjTE6Idst2qFF1P+ySCKBv/cWfuGK5AoaXsAcXL4P7bOmVt/P1iibSA5EILNBczjlIfX0
 hQKy3XBA9qOpbRGBQVbXO9lP+CuK19jsmf2zM/ypsWUp7+aF3/cSV8VxMuZb4FPghapc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqfPM-0079mH-GU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:16:25 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13C0220760;
 Wed,  1 Jul 2020 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593620179;
 bh=biSVuLSqQZyLre5EwX6Uvz2QqPXPFeUjqpSTrZwznjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vTOyYkkPatGqGjoHMBGchOV0BardXrrM+BzIJEzXyQxiNomH2hqFL2adPpq6OToav
 Cf2JycIVfByZm7leXmWxcjfCQHnOaRQDOa5CBFXvCuj4Pu3DiTem2Pit5CeT+gq328
 HZZbrDbvyOd0P2PBditYnnsoA2OQILBqdy6qMKJw=
Date: Wed, 1 Jul 2020 09:16:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Message-ID: <20200701161618.GC1724572@google.com>
References: <20200701152858.50516-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701152858.50516-1-weiyongjun1@huawei.com>
X-Spam-Score: -0.2 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqfPM-0079mH-GU
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: make __allocate_new_segment()
 static
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
Cc: hulkcommits@huawei.com, Hulk Robot <hulkci@huawei.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/01, Wei Yongjun wrote:
> From: Hulk Robot <hulkci@huawei.com>
> 
> From: Hulk Robot <hulkci@huawei.com>
> 
> Fix sparse build warning:
> 
> fs/f2fs/segment.c:2736:6: warning:
>  symbol '__allocate_new_segment' was not declared. Should it be static?

It was fixed.
https://lore.kernel.org/linux-f2fs-devel/20200701042222.GA1539525@google.com/T/#m9667447e4d37672e26dee7e30896d129eac1c479

> 
> Signed-off-by: Hulk Robot <hulkci@huawei.com>
> ---
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b45e473508a9..c35614d255e1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2733,7 +2733,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>  	up_read(&SM_I(sbi)->curseg_lock);
>  }
>  
> -void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
> +static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	unsigned int old_segno;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
