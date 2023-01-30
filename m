Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0CA681FAA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:31:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMdcB-0005Vo-W1;
	Mon, 30 Jan 2023 23:31:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMdc8-0005Vh-6v
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJDE9Kf/2GBMO+pO9liL+MbrNnD7Wp711YjZrdzld4Y=; b=Q5qw6IYWJrjSe1KJFjJG9gBAht
 e27sgrGW3BILVzHPC/m3A+RBP1/J0ZlGnEFbmBa3FeAckwW+oYNfYOWTkT4QAC+xNNBluNq5qZemB
 Yyxhwhqhd/IQ65+1POQQIqaRAw5HhcD8DiQsbaINOBx+s666c2jD5VAoyAA2m7T2n2lw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJDE9Kf/2GBMO+pO9liL+MbrNnD7Wp711YjZrdzld4Y=; b=C9uRqe5uOgGQ7Ex/w6VnO5I9Vt
 rMmkCtH2gFEqrEuALVS9yDla3pP3cny7XIzuR8loUBDpc/nTuUuODb1ln3tPXetIeAusyV2ZZGQq7
 tM+GANh7Zz+eLcS9rF7S+6UCecfXfsxS+w2tgacduriwpwIwEWFiCpaQcXb3rFagE4TI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMdc5-0003JY-LC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:31:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BDA8ACE1ACC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 23:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD3CC433D2;
 Mon, 30 Jan 2023 23:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675121450;
 bh=DpxNNhsxgqKE9Wys4/3ZeGlNxYXe363r24lY4vhPuYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXhLet066ErVudwXH/t+/yIX96xs6gV1Q0F6a0H4BS4q6xNUr32gRYfLjDxVl5E5Q
 ihVREUGbLSRlU3K22iL6th9UoELewgWexGIlEXZMVzmcL2VqzkFWMjAkJbZ1HKZHoa
 4nD2dm2LyCshkevxjaWgnNLnq1GLf9sXY6Op+k3OveQ8/jzDYVlZJle4kfhii5lZP9
 bA+HgJA6uFvVTB+oE22FqD+zLe/JtJW7pPXq+RDTdDsgQxqXC7t7B6v8oZVrB0WUI1
 vH4cCvyRFKqaC1BRsdfvvLgS6z3tZksqRy702py23mGDryENvkvExVD1bjIUgeBvpV
 z/TmBz3Xc5lIg==
Date: Mon, 30 Jan 2023 15:30:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9hTKKGBqQ0TIQil@google.com>
References: <20230105233908.1030651-1-jaegeuk@kernel.org>
 <Y74O+5SklijYqMU1@google.com>
 <77b18266-69c4-c7f0-0eab-d2069a7b21d5@kernel.org>
 <Y78E9NpDxtvr2/Hs@google.com>
 <bb9a9d1a-0d4c-b27e-e724-f99d5b8b4283@kernel.org>
 <Y8CfUMsas4ZqVL0R@google.com>
 <b2112f3d-e0a5-0562-9ea1-a158c75ef3b3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2112f3d-e0a5-0562-9ea1-a158c75ef3b3@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/28, Chao Yu wrote: > On 2023/1/13 8:01, Jaegeuk Kim
 wrote: > > On 01/12, Chao Yu wrote: > > > On 2023/1/12 2:50, Jaegeuk Kim wrote:
 > > > > On 01/11, Chao Yu wrote: > > > > > On 2023/1/11 9:20, [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMdc5-0003JY-LC
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: retry to update the inode page
 given EIO
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/28, Chao Yu wrote:
> On 2023/1/13 8:01, Jaegeuk Kim wrote:
> > On 01/12, Chao Yu wrote:
> > > On 2023/1/12 2:50, Jaegeuk Kim wrote:
> > > > On 01/11, Chao Yu wrote:
> > > > > On 2023/1/11 9:20, Jaegeuk Kim wrote:
> > > > > > In f2fs_update_inode_page, f2fs_get_node_page handles EIO along with
> > > > > > f2fs_handle_page_eio that stops checkpoint, if the disk couldn't be recovered.
> > > > > > As a result, we don't need to stop checkpoint right away given single EIO.
> > > > > 
> > > > > f2fs_handle_page_eio() only covers the case that EIO occurs on the same
> > > > > page, should we cover the case EIO occurs on different pages?
> > > > 
> > > > Which case are you looking at?
> > > 
> > > - __get_node_page(PageA)		- __get_node_page(PageB)
> > >   - f2fs_handle_page_eio
> > >    - sbi->page_eio_ofs[type] = PageA->index
> > > 					 - f2fs_handle_page_eio
> > > 					  - sbi->page_eio_ofs[type] = PageB->index
> > > 
> > > In such race case, it may has low probability to set CP_ERROR_FLAG as we expect?
> > 
> > Do you see that case in products?
> 
> Not yet.
> 
> > I'm trying to avoid setting CP_ERROR_FLAG here.
> 
> Copied, how about using the same logic for node page as meta page, like
> we did in f2fs_get_meta_page_retry()?

Yeah.. let me send v3 and test a bit. Thanks~ :)

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Signed-off-by: Randall Huang <huangrandall@google.com>
> > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > ---
> > > > > > 
> > > > > >     Change log from v1:
> > > > > >      - fix a bug
> > > > > > 
> > > > > >     fs/f2fs/inode.c | 2 +-
> > > > > >     1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > > index ff6cf66ed46b..2ed7a621fdf1 100644
> > > > > > --- a/fs/f2fs/inode.c
> > > > > > +++ b/fs/f2fs/inode.c
> > > > > > @@ -719,7 +719,7 @@ void f2fs_update_inode_page(struct inode *inode)
> > > > > >     	if (IS_ERR(node_page)) {
> > > > > >     		int err = PTR_ERR(node_page);
> > > > > > -		if (err == -ENOMEM) {
> > > > > > +		if (err == -ENOMEM || (err == -EIO && !f2fs_cp_error(sbi))) {
> > > > > >     			cond_resched();
> > > > > >     			goto retry;
> > > > > >     		} else if (err != -ENOENT) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
