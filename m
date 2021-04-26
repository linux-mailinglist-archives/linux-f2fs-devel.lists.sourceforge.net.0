Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046C36B77C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Apr 2021 19:05:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lb4fk-0002pP-8l; Mon, 26 Apr 2021 17:05:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lb4fi-0002p8-Un
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 17:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FLDnqI6z2XaCBAMjslfK4JoJZ21LOBs+YnOL+4hZaNA=; b=VwrfkZB9ZkjwbicSbN3xDyDre2
 RbYO1l8vR9Kbq6RUpoVP0kBsTJRwDS1z3RSZqOt9DhKLuzkjuswqaCO2yXeGPapJQDGzWUA/J5lKM
 PZf9XuoAaoFPKT/nCiFCt8trSjsDoPvHb+G3FVbW1oVEXfKfYJTtuE6fvn6iBV+o6Zc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FLDnqI6z2XaCBAMjslfK4JoJZ21LOBs+YnOL+4hZaNA=; b=Bo0K0SHVIPylhhK+wtAJ9opMTG
 htXZ5P53DrCKQdgr2W6SAJFdfyu9p2nYMnu1jumJHmR6wxz3EBOqpeQVLiebL2jx8Y9ZS9K6iaCDD
 EjWUoBt4NHxl4aX0fZGKtKJ6uFaliO1eZfw13Mp1wogjEwRAPBJCYSMfWSXNqxzrYOUg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lb4fg-00Ca2x-E5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 17:05:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F05061006;
 Mon, 26 Apr 2021 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619456710;
 bh=whSWFtRguZn5IvIkXJMILpCPs0/SrQbz5xioyWmUip0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CcCrHv6l1XKSipB1kZ6WFIp1UIndqQVKrn2FhsJAdSXUIjHJ1Op+ZLw/l2YlCBowT
 r+T3C6xgLX6QVe4PkKe5q/63+bcHF3AniBLuipOD7+NTxTeX9ML9gO4wwbr3exJCSP
 QZWs4iP9psLGB2KkRtoq46LpOMXoPfaOJ93BhjwKij+iROM/ZX8wu61xrxNO3Eg0VO
 /Sjqo+kI2+IK2pEbNzeL0W6uJ3uaeG9INMxNK0j3DHP/PwX7NwDek+gEe0srjI983X
 5Y8NoOJ4XxGp5rGuX+VSYbdervVGZF+Lu22iH4Y4Y7JLiG2SHe2liRARXoXEfDblVS
 RbK650EgEqGig==
Date: Mon, 26 Apr 2021 10:05:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YIbyxNAaaWUiVDT9@google.com>
References: <20210421083941.66371-1-yuchao0@huawei.com>
 <YID1sqemJVeBcdqD@google.com>
 <2c6f17e6-ef23-f313-5df2-6bd63d7df2b1@huawei.com>
 <YIS8KHf9VPxZl85b@google.com>
 <5d7de7c7-5cc5-c342-3652-ab904b3e43b2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d7de7c7-5cc5-c342-3652-ab904b3e43b2@huawei.com>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lb4fg-00Ca2x-E5
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: remove unneed check condition
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

On 04/25, Chao Yu wrote:
> On 2021/4/25 8:47, Jaegeuk Kim wrote:
> > On 04/22, Chao Yu wrote:
> > > On 2021/4/22 12:04, Jaegeuk Kim wrote:
> > > > On 04/21, Chao Yu wrote:
> > > > > In only call path of __cluster_may_compress(), __f2fs_write_data_pages()
> > > > > has checked SBI_POR_DOING condition, and also cluster_may_compress()
> > > > > has checked CP_ERROR_FLAG condition, so remove redundant check condition
> > > > > in __cluster_may_compress() for cleanup.
> > > > 
> > > > I think cp_error can get any time without synchronization. Is it safe to say
> > > > it's redundant?
> > > 
> > > Yes,
> > > 
> > > But no matter how late we check cp_error, cp_error can happen after our
> > > check points, it won't cause regression if we remove cp_error check there,
> > > because for compress write, it uses OPU, it won't overwrite any existed data
> > > in device.
> > > 
> > > Seems it will be more appropriate to check cp_error in
> > > f2fs_write_compressed_pages() like we did in f2fs_write_single_data_page()
> > > rather than in __cluster_may_compress().
> > > 
> > > BTW, shouldn't we rename __cluster_may_compress() to
> > > cluster_beyond_filesize() for better readability?
> > 
> > f2fs_cluster_has_data()?
> 
> Maybe cluster_has_invalid_data()? which indicates there is invalid data
> beyond filesize.

BTW, we can compress it with zero data?

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > ---
> > > > >    fs/f2fs/compress.c | 5 -----
> > > > >    1 file changed, 5 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > > > index 3c9d797dbdd6..532c311e3a89 100644
> > > > > --- a/fs/f2fs/compress.c
> > > > > +++ b/fs/f2fs/compress.c
> > > > > @@ -906,11 +906,6 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
> > > > >    		f2fs_bug_on(sbi, !page);
> > > > > -		if (unlikely(f2fs_cp_error(sbi)))
> > > > > -			return false;
> > > > > -		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> > > > > -			return false;
> > > > > -
> > > > >    		/* beyond EOF */
> > > > >    		if (page->index >= nr_pages)
> > > > >    			return false;
> > > > > -- 
> > > > > 2.29.2
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
