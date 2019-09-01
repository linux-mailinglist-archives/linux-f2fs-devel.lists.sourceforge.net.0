Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A4A4815
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Sep 2019 09:18:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4K7n-0004KO-6M; Sun, 01 Sep 2019 07:18:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i4K7l-0004KA-QB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Sep 2019 07:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qo0JPDahUDhz2sL8eW6q6OaXEV14QOHbDYWTVA0Lq5Q=; b=I/Hii809SyfKVP2UMFK2ZWKT9B
 E6sHUzWhB4yQQK4DKo/xWYKaqxOriYwNFoCV6eqzoc217rIi3Ig/jITtXDdTvhz1XUthPhVQIY8Pw
 vaaTnbS5N6tBDA2XF3AfJqlSBeoEmGfWPjNRbhqoJdj/ut0uSDvBcqRGJTs/u/0BOCg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qo0JPDahUDhz2sL8eW6q6OaXEV14QOHbDYWTVA0Lq5Q=; b=dP9higyxOGmAbywSZC7bnuJZi6
 A8Sb8/Rwg8025Rw3MFp4yhAWX3gOQzEqNkvL2f38fbOQvMboEhwH931t6ygo7fgHBjJnT0qetRNwN
 k6MCs9BFybLRJCU7mrPk06cr9YINFaQBUaO5Cg+T173WVKQGHD8+et7xWHXX/lwh0G9U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4K7f-00BLHe-LL
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Sep 2019 07:18:09 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE4CE22CF7;
 Sun,  1 Sep 2019 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567322278;
 bh=csVVin+Olpb/qDxAyD+cBrDfz5AYW4dnPEW/8nHkCXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T27OuVHr9dwrxAnstXVsyaik9OZpoR4Vpdc8V26AcSOcVEDLxYXSQRUKEPVF9Efr7
 2gsuumL5aEwqeupMejKbNDz7AEBBhcj2ObGMBGxIkvfPKa0jNR6MkcyhZhW89QLl2E
 pIw0wT+ll3v0yX3/Ff2kspPG431Kosc9m6EveRKY=
Date: Sun, 1 Sep 2019 00:17:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190901071757.GA49907@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190219081529.5106-1-yuchao0@huawei.com>
 <d2b3c101-0399-4e85-5765-7b6504aaca74@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2b3c101-0399-4e85-5765-7b6504aaca74@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1i4K7f-00BLHe-LL
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add bio cache for IPU
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

On 08/31, Chao Yu wrote:
> On 2019/2/19 16:15, Chao Yu wrote:
> > @@ -1976,10 +2035,13 @@ static int __write_data_page(struct page *page, bool *submitted,
> >  	}
> >  
> >  	unlock_page(page);
> > -	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode))
> > +	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode)) {
> > +		f2fs_submit_ipu_bio(sbi, bio, page);
> >  		f2fs_balance_fs(sbi, need_balance_fs);
> > +	}
> 
> Above bio submission was added to avoid below deadlock:
> 
> - __write_data_page
>  - f2fs_do_write_data_page
>   - set_page_writeback        ---- set writeback flag
>   - f2fs_inplace_write_data
>  - f2fs_balance_fs
>   - f2fs_gc
>    - do_garbage_collect
>     - gc_data_segment
>      - move_data_page
>       - f2fs_wait_on_page_writeback
>        - wait_on_page_writeback  --- wait writeback
> 
> However, it breaks the merge of IPU IOs, to solve this issue, it looks we need
> to add global bio cache for such IPU merge case, then later
> f2fs_wait_on_page_writeback can check whether writebacked page is cached or not,
> and do the submission if necessary.
> 
> Jaegeuk, any thoughts?

How about calling f2fs_submit_ipu_bio() when we need to do GC in the same
context?

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
