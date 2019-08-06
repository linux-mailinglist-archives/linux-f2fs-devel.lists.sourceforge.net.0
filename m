Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F8A8292B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 03:28:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huoHS-0008Rh-G7; Tue, 06 Aug 2019 01:28:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1huoHQ-0008RZ-9C
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4pKhNM1qxwQtZwQn4HMMmutYZyMMDDvn7eEiJKfGI4=; b=Lh8tlXJULf9Fu+2/UoVIDdfMte
 0aISWUUoLcnuZKI+2G4BaDnTyypx3P4SBezfSf1rCom+nr31bDATHzx7yREUxh3MzQ7+0n50d+uf1
 bAs8oFrWjmAYydaadGFy8rDMD3pkOrid5MtzF2zT2PoT7fVJhilqQkK3uznGP9KUmZYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/4pKhNM1qxwQtZwQn4HMMmutYZyMMDDvn7eEiJKfGI4=; b=Kg5smyntcJMfGsCCQTu+Ab0zug
 9fGRQ0ctSGEo+JQz4d0MU+FqxvZvYhxUC58zaZqCRTfWIh3bYleZs+/1nHrAnmPJs2qhpRRXF9Zn/
 f5HjiW35+pyIYSbUUXAPJvxi0loXvW7Zn7OpwaZUBlgrjqr17PtH9KgxY4jDfJkmsh6Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huoHN-00CCNC-H8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:28:48 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCC592147A;
 Tue,  6 Aug 2019 01:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565054919;
 bh=KnLY1sAJ7ObFvAXL3EPBllmg22XMnePEwMFus9ls9Uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0zWqr68TcP+9F8cFVvHxfxnP2RZnRTkMHBKP/fAw2rF14+rdMrRy3hBa8l1iq5lkX
 JvUoidCCMZemeRklpULqGSnW3yoR7gWkN5fqYyWGb5VMuH4B9D9QLFPJDjO3BQ+jRw
 lzVQ67jhsbsFGxg3vtHFUmQ9mYGw0R9Lien6XcoU=
Date: Mon, 5 Aug 2019 18:28:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190806012839.GD1029@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190802101548.96543-1-yuchao0@huawei.com>
 <20190806004215.GC98101@jaegeuk-macbookpro.roam.corp.google.com>
 <dd284020-77b0-1627-2fc2-bc51745adfd3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd284020-77b0-1627-2fc2-bc51745adfd3@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1huoHN-00CCNC-H8
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: avoid out-of-range memory
 access"
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

On 08/06, Chao Yu wrote:
> On 2019/8/6 8:42, Jaegeuk Kim wrote:
> > On 08/02, Chao Yu wrote:
> >> As Pavel Machek reported:
> >>
> >> "We normally use -EUCLEAN to signal filesystem corruption. Plus, it is
> >> good idea to report it to the syslog and mark filesystem as "needing
> >> fsck" if filesystem can do that."
> >>
> >> Still we need improve the original patch with:
> >> - use unlikely keyword
> >> - add message print
> >> - return EUCLEAN
> >>
> >> However, after rethink this patch, I don't think we should add such
> >> condition check here as below reasons:
> >> - We have already checked the field in f2fs_sanity_check_ckpt(),
> >> - If there is fs corrupt or security vulnerability, there is nothing
> >> to guarantee the field is integrated after the check, unless we do
> >> the check before each of its use, however no filesystem does that.
> >> - We only have similar check for bitmap, which was added due to there
> >> is bitmap corruption happened on f2fs' runtime in product.
> >> - There are so many key fields in SB/CP/NAT did have such check
> >> after f2fs_sanity_check_{sb,cp,..}.
> >>
> >> So I propose to revert this unneeded check.
> > 
> > IIRC, this came from security vulnerability report which can access
> 
> I don't think that's correct report, since we have checked validation of that
> field during mount, if it can be ruined after that, any variables can't be trusted.

I assumed this was reproduced with a fuzzed image.
I'll check it with Ocean.

> 
> Now we just check bitmaps at real-time, because we have encountered such bitmap
> corruption in product.
> 
> Thanks,
> 
> > out-of-boundary memory region. Could you write another patch to address the
> > above issues?
> > 
> >>
> >> This reverts commit 56f3ce675103e3fb9e631cfb4131fc768bc23e9a.
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/segment.c | 5 -----
> >>  1 file changed, 5 deletions(-)
> >>
> >> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >> index 9693fa4c8971..2eff9c008ae0 100644
> >> --- a/fs/f2fs/segment.c
> >> +++ b/fs/f2fs/segment.c
> >> @@ -3492,11 +3492,6 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
> >>  		seg_i = CURSEG_I(sbi, i);
> >>  		segno = le32_to_cpu(ckpt->cur_data_segno[i]);
> >>  		blk_off = le16_to_cpu(ckpt->cur_data_blkoff[i]);
> >> -		if (blk_off > ENTRIES_IN_SUM) {
> >> -			f2fs_bug_on(sbi, 1);
> >> -			f2fs_put_page(page, 1);
> >> -			return -EFAULT;
> >> -		}
> >>  		seg_i->next_segno = segno;
> >>  		reset_curseg(sbi, i, 0);
> >>  		seg_i->alloc_type = ckpt->alloc_type[i];
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
