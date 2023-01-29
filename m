Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B04680182
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 22:27:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMFCy-0001F9-SK;
	Sun, 29 Jan 2023 21:27:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1pMFCv-0001F2-Aw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 21:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXKHXmqEaebxMzK8gnHyzoWXhX9Kr2E4BvSYUnQui+s=; b=Ug9Mm4zlpoXTbQbuDDBHrYhjsZ
 5nVdGYyd9ZH7i2ItaWLkQWuhKmZlkVkfGH5wjBEzPxULRqYSuobK6ZJlS3cHh2V0Tn/A06+H8SLip
 tKnMB7Lw1gxh+JD7goTT60F8XCc8LBEgh7HYcQ8Xx5WHP5ylTOlG86cb1zyYsjCg5PRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bXKHXmqEaebxMzK8gnHyzoWXhX9Kr2E4BvSYUnQui+s=; b=iFk49NPKqMO4LYKPAFhuLvX1A4
 83jeIa6GFdjLjgsOfHV7ZT6fvnx1W5GqlsH1Ck++zvS6eGfygRSw91HEqlBBDIxN1rzlbKnS3UaOe
 xqHh2IWWuIdpKGGHryRcCe0HR0/h1pf1WnGzPfCuw4R0VLQKfvAi59K8f5G/cTVKAhEo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMFCq-002sU3-Qi for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 21:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bXKHXmqEaebxMzK8gnHyzoWXhX9Kr2E4BvSYUnQui+s=; b=IxMHpJnXGWl1mAd9RBC6Fzs9tN
 /g2C0765JWZhKFeJDvJac3rnrbux8FmFABeZaU67CqtwPrSCEYxMm37nwuy4iuy7sFMtF8J16OHQO
 AhoX3yt7iYvrcw/aIwYbNJrbKrOhPAVYpg3zqChpqv1rO0hTL3A9y8BmG7vBf+889jCkVVHMScdES
 K2jIJ4U2SkTozsLcoHUNIRdmhj3BtcHFfoExh40VIL8wXG89Gby/vBoMwKaVoUGeHyldtIXa4x+9o
 5q2v3Ke1jzOwYBGPBii/hIRmojfICe5/UAWHdOQ9NJILhSpLOmb8DWdZox/0LXt4/MP0T+9bygsP1
 S2t2wNrQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pMFCU-009l87-0X; Sun, 29 Jan 2023 21:26:58 +0000
Date: Sun, 29 Jan 2023 21:26:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y9bkoasmAmtQ2nSV@casper.infradead.org>
References: <20230129121851.2248378-1-willy@infradead.org>
 <Y9a2m8uvmXmCVYvE@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9a2m8uvmXmCVYvE@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jan 29, 2023 at 10:10:35AM -0800, Eric Biggers wrote:
 > On Sun, Jan 29, 2023 at 12:18:51PM +0000, Matthew Wilcox (Oracle) wrote:
 > > Both f2fs and ext4 end up passing the ciphertext page to > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pMFCq-002sU3-Qi
Subject: Re: [f2fs-dev] [PATCH] fscrypt: Copy the memcg information to the
 ciphertext page
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Tejun Heo <tj@kernel.org>,
 linux-fscrypt@vger.kernel.org, cgroups@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jan 29, 2023 at 10:10:35AM -0800, Eric Biggers wrote:
> On Sun, Jan 29, 2023 at 12:18:51PM +0000, Matthew Wilcox (Oracle) wrote:
> > Both f2fs and ext4 end up passing the ciphertext page to
> > wbc_account_cgroup_owner().  At the moment, the ciphertext page appears
> > to belong to no cgroup, so it is accounted to the root_mem_cgroup instead
> > of whatever cgroup the original page was in.
> > 
> > It's hard to say how far back this is a bug.  The crypto code shared
> > between ext4 & f2fs was created in May 2015 with commit 0b81d0779072,
> > but neither filesystem did anything with memcg_data before then.  memcg
> > writeback accounting was added to ext4 in July 2015 in commit 001e4a8775f6
> > and it wasn't added to f2fs until January 2018 (commit 578c647879f7).
> 
> What is the actual effect of this bug?
> 
> The bounce pages are short-lived, so surely it doesn't really matter what memory
> cgroup they get charged to?

Ah, we don't want to charge the _memory_ of the bounce pages to the
cgroup.  We want to charge the _I/O_ to the cgroup.

Looking at the original commits, the effect will be that if you have
an unencrypted filesystem, writeback will be throttled according to
the cgroup's rules, but if you have an encrypted filesystem, it will
escape the cgroup I/O limits.

> I guess it's really more about the effect on cgroup writeback?  And that's also
> the reason why this is a problem here but not e.g. in dm-crypt?

I haven't looked at dm-crypt at all, but my assumption is that the fs
charges the I/O of the pagecache page to the cgroup, and there's no need
to do it again.

> > diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> > index e78be66bbf01..a4e76f96f291 100644
> > --- a/fs/crypto/crypto.c
> > +++ b/fs/crypto/crypto.c
> > @@ -205,6 +205,9 @@ struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
> >  	}
> >  	SetPagePrivate(ciphertext_page);
> >  	set_page_private(ciphertext_page, (unsigned long)page);
> > +#ifdef CONFIG_MEMCG
> > +	ciphertext_page->memcg_data = page->memcg_data;
> > +#endif
> >  	return ciphertext_page;
> >  }
> 
> Nothing outside mm/ and include/linux/memcontrol.h does anything with memcg_data
> directly.  Are you sure this is the right thing to do here?

Nope ;-)  Happy to hear from people who know more about cgroups than I
do.  Adding some more ccs.

> Also, this patch causes the following:

Oops.  Clearly memcg_data needs to be set to NULL before we free it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
