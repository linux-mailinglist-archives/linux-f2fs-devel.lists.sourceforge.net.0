Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8380C334929
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Mar 2021 21:53:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lK5pU-0004mK-Uu; Wed, 10 Mar 2021 20:53:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lK5pT-0004m6-7w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Mar 2021 20:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJ51uBYZQLRBewalou9z/x6pOojciU7MlFhrv7pKBM0=; b=ZCQpwBIFA0FVGJNxKcVsIlmlHw
 ggDGIVNvb1NEZUbE66u5fhAbetW5Do35Zg8/XrjUhtnT2ji8Q6ONdLqi/c+q7dvzRzg+L+u0VguH6
 R5E8CQ5+jN9eu4SBydJvIUYwYpUc1rEpz8H8RXuHffs35gAZVp80VgRsWFEVCypwi+bc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJ51uBYZQLRBewalou9z/x6pOojciU7MlFhrv7pKBM0=; b=J1qS15KWtJ6X34iRCXXZjbi9Db
 qAswWs47DUKTDge/+m0TFimctBFzM/c+uI2sdF09aLtnK4oIuNDlqDCiQqBK3GTIJAYPHxkvYtj2b
 EhXUHrF03DAmiFZP/gdY/NdHkns6sY8w9p8Nh89dU4uybi2wJYVf+xub6sHRpC1WW8pA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lK5pJ-0001CR-T8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Mar 2021 20:53:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7558E64FCA;
 Wed, 10 Mar 2021 20:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615409574;
 bh=9TLZ3UuLAek2YDKYxVEVIbMal/1XxdYrNY1x5nvkKsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hsBjUCehd8Lp0wCHjHa8PVi+JxUY0YTRjVLdeHdCXYM2KGpuLz0YvFVKDHOS/Aj9m
 FAZzhvF1sNE2hsY7P6S1zEDVb8x8qfAgprKC90t/RzJZf6Pf6xOHr4E9xM871zYYOj
 Kb+4HbX6ck43X1CM10LbhT7gmkQgzagHt/OOyqgiVD0K/XwBC1CYC7/+1SjEqlzRa+
 bJ7dvyyxYjQvxMKDAOktKukE8WN9d7BKU6hUgc/oIlDFs2b2uJyADP1If61deD6mnM
 ipBVoVDiMoScOs8Gd2ZColy3UTX3mTE1Oq/d7HGUoJ/Gvm01XE9fAlZoVK/PSj6ec4
 wIjEyRfF3QE1g==
Date: Wed, 10 Mar 2021 12:52:52 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YEkxpAp8FQjRUfm6@google.com>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
 <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
 <YEa66ekikyuPWSyd@google.com>
 <a40929d4-a8de-98ea-8dd8-6c807d8a6adc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a40929d4-a8de-98ea-8dd8-6c807d8a6adc@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lK5pJ-0001CR-T8
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 03/09, Chao Yu wrote:
> On 2021/3/9 8:01, Jaegeuk Kim wrote:
> > On 03/05, Chao Yu wrote:
> > > On 2021/3/5 4:20, Jaegeuk Kim wrote:
> > > > On 02/27, Jaegeuk Kim wrote:
> > > > > On 02/04, Chao Yu wrote:
> > > > > > Jaegeuk,
> > > > > > 
> > > > > > On 2021/2/2 16:00, Chao Yu wrote:
> > > > > > > -	for (i = 0; i < dic->nr_cpages; i++) {
> > > > > > > +	for (i = 0; i < cc->nr_cpages; i++) {
> > > > > > >     		struct page *page = dic->cpages[i];
> > > > > > 
> > > > > > por_fsstress still hang in this line?
> > > > > 
> > > > > I'm stuck on testing the patches, since the latest kernel is panicking somehow.
> > > > > Let me update later, once I can test a bit. :(
> > > > 
> > > > It seems this works without error.
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9
> > > 
> > > Ah, good news.
> > > 
> > > Thanks for helping to test the patch. :)
> > 
> > Hmm, I hit this again. Let me check w/o compress_cache back. :(
> 
> Oops :(

Ok, apprantely that panic is caused by compress_cache. The test is running over
24hours w/o it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
