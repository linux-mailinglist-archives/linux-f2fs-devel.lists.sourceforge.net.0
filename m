Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB381E1143
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 May 2020 17:06:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdEgD-0002oX-5t; Mon, 25 May 2020 15:06:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jdEgC-0002oQ-6T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 15:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fLvqJrwq087yxdBpeo9/hmrXcl+Urs7GboudNQy6C6E=; b=ap11/q+a3HpyWOeJI4UiDYepFy
 HXiAMrD2QTmlAR+3jEfdbPsZ+2OK5DL7xuc74B3W9f7kriQkvJ0p1JlWRI2F8dKYTkEKxYrLVzYdV
 Zqg6MbngaDw2telOFKguDC1LJ8fyaE10fyVVmvsu2XnKeeSG6QeR9voyXIk2fqMXrKWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fLvqJrwq087yxdBpeo9/hmrXcl+Urs7GboudNQy6C6E=; b=C7Y751X0KC/ZhGElS+O/5UYSVL
 LYBTamD6mgIGfabj29SoaGaaOtNggCdPkPORamCmDCgZek5r7+21z78SUK5m8GgE/+H9wi1sNArRH
 3tpPrVqURFYQKzSiO0toMBJ1dO88nMO1opVevCGSGyB8Te9CePXLMUzTn8f7oX0gL4tM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdEgA-00Bq43-8k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 May 2020 15:06:16 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B334C2073B;
 Mon, 25 May 2020 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590419168;
 bh=4SC2F/J4NM6UzddDGe9P2eGlKLN/Z3dzLHep/jr+Cg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jlK20N5IGG1yq/mL5w9FNBnsglQEBvK/wPUtLGakC+fhSReBtCHjU0u23i3kQRBxB
 yhm0qwTkD0TvHHE7w6RgTvc/dbHJZ8EIzx5PftivOe9DWBbQr2O1GdeCzh3gyWtCiW
 3ClhhR8uygFFtIFwoRCm4hOyj4RSgmuvkokxr/rw=
Date: Mon, 25 May 2020 08:06:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200525150608.GA55033@google.com>
References: <20200522144752.216197-1-jaegeuk@kernel.org>
 <20200522233243.GA94020@google.com>
 <20200525035655.GA135148@google.com>
 <565af47c-8364-d910-8d1c-93645c12e660@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <565af47c-8364-d910-8d1c-93645c12e660@huawei.com>
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
X-Headers-End: 1jdEgA-00Bq43-8k
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid inifinite loop to wait for
 flushing node pages at cp_error
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/25, Chao Yu wrote:
> On 2020/5/25 11:56, Jaegeuk Kim wrote:
> > Shutdown test is somtimes hung, since it keeps trying to flush dirty node pages
> 
> IMO, for umount case, we should drop dirty reference and dirty pages on meta/data
> pages like we change for node pages to avoid potential dead loop...

I believe we're doing for them. :P

> 
> Thanks,
> 
> > in an inifinite loop. Let's drop dirty pages at umount in that case.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> > v3:
> >  - fix wrong unlock
> > 
> > v2:
> >  - fix typos
> > 
> >  fs/f2fs/node.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index e632de10aedab..e0bb0f7e0506e 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1520,8 +1520,15 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
> >  
> >  	trace_f2fs_writepage(page, NODE);
> >  
> > -	if (unlikely(f2fs_cp_error(sbi)))
> > +	if (unlikely(f2fs_cp_error(sbi))) {
> > +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> > +			ClearPageUptodate(page);
> > +			dec_page_count(sbi, F2FS_DIRTY_NODES);
> > +			unlock_page(page);
> > +			return 0;
> > +		}
> >  		goto redirty_out;
> > +	}
> >  
> >  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >  		goto redirty_out;
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
