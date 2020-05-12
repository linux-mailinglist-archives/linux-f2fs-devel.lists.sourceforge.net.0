Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3A31CEB99
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2020 05:39:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYLl5-00018Y-Fs; Tue, 12 May 2020 03:39:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jYLl4-00018L-9D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 03:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OthUmtie8QWwp8Z2okLWyxgqLOZHm+1mJKSNQoz8MSo=; b=aAeN7NdOYdlY1VjphfFmP84Brs
 RHqovgm5/pncjk9l4/etDbkI6lDh1O/rBjuGifcm/WkqbidwXxQ0r6qldlMlOuwt/xJoy8n4sK3gN
 CWhIBG8gbx6JFXY+5dSJKJd2zVItQr8O9MfRYhNIh8IVC6aFrIqbA6fgknN0gvHpRowM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OthUmtie8QWwp8Z2okLWyxgqLOZHm+1mJKSNQoz8MSo=; b=R2j+mtQIS3ho3gLAJrD1o6d4Hy
 rYYGxoicN/pRjURaYPS9qxeZu/8Kb008WDny90od4hZzVVqNFMcRXM+FvH7eELX8/SHw4Q5z+xU7M
 jR4MalSB7zlr7iwkeVUK3u7Cju5WTeRUTY8nH1nD5NvntYnVhgNDLR9pag7ZB1By49F0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYLl2-00AKPM-AL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 03:39:06 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D7812068D;
 Tue, 12 May 2020 03:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589254737;
 bh=DLeKVsDA/v6K8a/K2XI2ggyPV7Ter9FG71TmhOGM4do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L79F2/EAK6YLnnh7iPFV+1b8zshAtOUW5LzqGtuc8sLFdIxn7IIKnECOg0jfS55hE
 3hh1z+mTx2mUEWqdwh8ArE6u8X0/MS+9Z6nG8OW4eEnBHq1XWhDEp4Yilcv8toexqy
 gCmayNoODIt8efBzMQBO/CpoikMxs7Nrcp+2gPeA=
Date: Mon, 11 May 2020 20:38:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200512033856.GB216359@google.com>
References: <1589197886-10580-1-git-send-email-mafeng.ma@huawei.com>
 <6641e0f4-cea3-cf3a-bb9b-954bfa630778@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6641e0f4-cea3-cf3a-bb9b-954bfa630778@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jYLl2-00AKPM-AL
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: make num_compress_pages and
 f2fs_compress_free_page static
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
Cc: Ma Feng <mafeng.ma@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Chao Yu wrote:
> Hello Ma,
> 
> On 2020/5/11 19:51, Ma Feng wrote:
> > Fix the following sparse warning:
> > 
> > fs/f2fs/compress.c:501:5: warning: symbol 'num_compress_pages' was not declared.
> >  Should it be static?
> > fs/f2fs/compress.c:530:6: warning: symbol 'f2fs_compress_free_page' was not
> > declared. Should it be static?
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
> 
> Thanks for fixing this.
> 
> It's better to merge this into original patch, let me know if you mind it.

Hi Ma,

Please let me know, if you have any concern on this.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=5e6bbde95982300d66d78fb282d4ee39df78fc33

Thanks,

> 
> Thanks,
> 
> > ---
> >  fs/f2fs/compress.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 4c7eaee..c7c5a8f 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -498,7 +498,7 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
> >  }
> > 
> >  static mempool_t *compress_page_pool = NULL;
> > -int num_compress_pages = 512;
> > +static int num_compress_pages = 512;
> >  module_param(num_compress_pages, uint, 0444);
> >  MODULE_PARM_DESC(num_compress_pages,
> >  		"Number of intermediate compress pages to preallocate");
> > @@ -527,7 +527,7 @@ static struct page *f2fs_compress_alloc_page(void)
> >  	return page;
> >  }
> > 
> > -void f2fs_compress_free_page(struct page *page)
> > +static void f2fs_compress_free_page(struct page *page)
> >  {
> >  	if (!page)
> >  		return;
> > --
> > 2.6.2
> > 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
