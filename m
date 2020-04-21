Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C6A1B1CBD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2020 05:25:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQjXM-0000op-BB; Tue, 21 Apr 2020 03:25:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jQjXK-0000oW-CI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 03:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yMiQgSp6+44yHi8Y/SiNH79yEV2BxaTZglsheeQ2n48=; b=dJtcYWwN5RP2/cc7PZ7TnhqnPs
 VhiQSWF/EpNBXYQm1EPNKM3dZOL1j9rkgXhePqWCgs8+oeVEMrbyyP+ybrCUhqZ0uGpJfIlgFS/x/
 pjk/xaTUxHg3RD+OV4RUoaMSN2AG1oFEbKocFPCppVARbMSZjNyFYQlQ/IJZX8hlm1nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yMiQgSp6+44yHi8Y/SiNH79yEV2BxaTZglsheeQ2n48=; b=lHCYbnIHWwb6/WdsHj/OVgueL5
 MUpr0M2F/YNDx3i1OgQqUOK5jFt69V4mMxsm9JQaCRGcWNiPrfUl1KeHLUTtjGkKpiObimdgtGAM7
 aEcHik3v7YFnda7nmhZBKGCxiixoerp+GqxdYvWoehRfwWOMkmZKpFJ415TbehHTHCcg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jQjXI-0050L1-FO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 03:25:26 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C310206F9;
 Tue, 21 Apr 2020 03:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587439513;
 bh=H29oCtqsrJtGWyg/QmRKF2AXzQxEwBYJaGQqfrdaBIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JG7FSWTdN2QwjRKOyL04yifSxZUp8D6NrGwqKaBut9eS5w882u7MYS5c1iXvZaWzV
 p6tdkBdfSdH31LdypXsi3BPb4bgmWo4E830nbs5CKfm6qn8/WOZAKBZhpkwSk3yFB7
 bmkquRPoaiAVVlV68lzal/m9OjYpn2eYa4YVTveI=
Date: Mon, 20 Apr 2020 20:25:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200421032513.GA134303@google.com>
References: <20200415021313.95538-1-yuchao0@huawei.com>
 <634e3958-ee48-90b1-f32f-60e2bc4ca88e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <634e3958-ee48-90b1-f32f-60e2bc4ca88e@huawei.com>
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
X-Headers-End: 1jQjXI-0050L1-FO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid page count leak
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

On 04/21, Chao Yu wrote:
> Hi Jaegeuk,
> 
> Let's drop this patch, I encounter bad page state (nonzero refcount) reported
> by vm w/ this patch.

Ok.

> 
> On 2020/4/15 10:13, Chao Yu wrote:
> > In f2fs_read_data_pages(), once we add page into radix tree, we need to
> > release reference count of that page, however when f2fs_read_multi_pages()
> > fails, we didn't handle that case correctly, fix it.
> > 
> > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
