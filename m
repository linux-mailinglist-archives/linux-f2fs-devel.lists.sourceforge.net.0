Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 181002625E4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Sep 2020 05:28:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFqmY-00028e-AA; Wed, 09 Sep 2020 03:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kFqmX-00028X-15
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 03:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SRIkwEe7tptXGqLwLrEsMyoJ+ejU2wr6C8a3mvmjUGw=; b=IW3qTD5vxXpTh34bAsQMaf28Nb
 6+hmmkOvMRHlhPQ98eYTQZRiQIQYoy8SnENeHQkANvsFHI057Ygpg72cAiROdK97UlWmiDQMIeicG
 GwLS7dE/RMh5eeRzwxRLRWo9Y3WzRcChcXz2ZEnwMHPV1vCSxfVCgZg36N9eimBUERn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SRIkwEe7tptXGqLwLrEsMyoJ+ejU2wr6C8a3mvmjUGw=; b=lnMF9aQtvHXwTjbSPPJWdmz3TK
 5/KOXGl/wdy/lqKpFsxPL/rAWY8bXEGJjii+RDJJMhlBvEYig/cFkS/eMM/VG3yGWKdfRxhUE5zrp
 qTIXQWQ9/N4XlMNuOaeDmivXSDAe59FmoHAxU9INW6Ype/V6PAmZBAwPvUJlUm84J95U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFqmQ-0001rF-BM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 03:28:24 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37DCB20EDD;
 Wed,  9 Sep 2020 03:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599622083;
 bh=yzC3pCeyfI5uFIun3bqi6B7dO5+teVjviJKxlHi7g9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJAKmp492OjH2PaDukesr862GMPGdJqtGH/Cb2DCicdFsGLJcT40D/dj58DQL46+v
 CFAKWJBacg906/jo17EUZ4aoCdu3CinvlsJeH023JxrsjUKtLcjWaLnBqKnjEu81Fo
 rDfThrbofVVxfxadvUNtGItHW2Mt1+lfK+yCCEQs=
Date: Tue, 8 Sep 2020 20:28:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200909032802.GA3377963@google.com>
References: <20200909023634.3821423-1-daeho43@gmail.com>
 <4c8971ce-98b5-4675-8310-5e9af0a14bb6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c8971ce-98b5-4675-8310-5e9af0a14bb6@huawei.com>
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
X-Headers-End: 1kFqmQ-0001rF-BM
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up vm_map_ram() call
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/09, Chao Yu wrote:
> On 2020/9/9 10:36, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > Made f2fs_vmap() wrapper to handle vm_map_ram() stuff.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> LGTM,
> 
> I think it should be merged into original patch. :)
> 
> Maybe Jaeguek could help to do that.

Yeah, no worries. :)

> 
> Thanks,
> 
> > ---
> >   fs/f2fs/compress.c | 42 ++++++++++++++++++------------------------
> >   1 file changed, 18 insertions(+), 24 deletions(-)
> > 
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 357303d8514b..7895186cc765 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -557,6 +557,20 @@ static void f2fs_compress_free_page(struct page *page)
> >   #define MAX_VMAP_RETRIES	3
> > +static void *f2fs_vmap(struct page **pages, unsigned int count)
> > +{
> > +	int i;
> > +	void *buf = NULL;
> > +
> > +	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> > +		buf = vm_map_ram(pages, count, -1);
> > +		if (buf)
> > +			break;
> > +		vm_unmap_aliases();
> > +	}
> > +	return buf;
> > +}
> > +
> >   static int f2fs_compress_pages(struct compress_ctx *cc)
> >   {
> >   	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> > @@ -593,23 +607,13 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
> >   		}
> >   	}
> > -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> > -		cc->rbuf = vm_map_ram(cc->rpages, cc->cluster_size, -1);
> > -		if (cc->rbuf)
> > -			break;
> > -		vm_unmap_aliases();
> > -	}
> > +	cc->rbuf = f2fs_vmap(cc->rpages, cc->cluster_size);
> >   	if (!cc->rbuf) {
> >   		ret = -ENOMEM;
> >   		goto out_free_cpages;
> >   	}
> > -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> > -		cc->cbuf = vm_map_ram(cc->cpages, cc->nr_cpages, -1);
> > -		if (cc->cbuf)
> > -			break;
> > -		vm_unmap_aliases();
> > -	}
> > +	cc->cbuf = f2fs_vmap(cc->cpages, cc->nr_cpages);
> >   	if (!cc->cbuf) {
> >   		ret = -ENOMEM;
> >   		goto out_vunmap_rbuf;
> > @@ -728,23 +732,13 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
> >   			goto out_free_dic;
> >   	}
> > -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> > -		dic->rbuf = vm_map_ram(dic->tpages, dic->cluster_size, -1);
> > -		if (dic->rbuf)
> > -			break;
> > -		vm_unmap_aliases();
> > -	}
> > +	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
> >   	if (!dic->rbuf) {
> >   		ret = -ENOMEM;
> >   		goto destroy_decompress_ctx;
> >   	}
> > -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> > -		dic->cbuf = vm_map_ram(dic->cpages, dic->nr_cpages, -1);
> > -		if (dic->cbuf)
> > -			break;
> > -		vm_unmap_aliases();
> > -	}
> > +	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
> >   	if (!dic->cbuf) {
> >   		ret = -ENOMEM;
> >   		goto out_vunmap_rbuf;
> > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
