Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F720685FC5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 07:31:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pN6en-0006UB-Fv;
	Wed, 01 Feb 2023 06:31:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pN6em-0006U5-AV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 06:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q4Jf8mVmOq5SDbkPb4K0Nf4Sx2TXrAphFNEdgoTlGVY=; b=cWOawZyAbtKTcwUlNc5Ke/ElMK
 bmUeUDC0vTfRoi7GOpLP6xu6TEnZ3VLU5r2Ioz7lLL3jFkdxAg7cSv9xk1BaFUKnpl4OizBqH4Eeq
 Whe927AOAp4fAlJdkZ60oPphl7WR8/EX/QgQMW45ZZB5dX0CefAfSjLf3TT2EgSsSoek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q4Jf8mVmOq5SDbkPb4K0Nf4Sx2TXrAphFNEdgoTlGVY=; b=UO2Gefw4mzLJeBfTqxV5T854Q4
 Ie4MX0VDJqiq2SVAuFawrP10P3Z0cah7IPKEg6Kk9ngh5f1l25rYMkDUMWjgGHTjhpD1NQPCKZ6Dk
 +uBXzam5d7e7eohwGuBHae16Q1w/LS6IpmNLEEyY+0/W1q8wH6Nyt7AfKxFkn7oVs4PM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pN6ei-0006m5-GG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 06:31:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E928FB820E3;
 Wed,  1 Feb 2023 06:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DECC4339C;
 Wed,  1 Feb 2023 06:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675233093;
 bh=kODbu8v8FoJJKSYLR/mctHsB9SNw4l1AhxYgBT5F4R8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9FoKfofj9I8z7FRGoI5KTEFES31+jAGm9T1tXLHLt1ICF1vzD9lVLQ1PMHKF118R
 6gxgIJ4cvI9lNcgU8jhgYhiEgv0BWrRs5Y/zh8bBLAXcpiK3QfXg6S7LZIzG/slYMS
 swQmWjHUhSmrxd2OTgLY5hwoNrZgsycTEcAuddMz581Mil5Ri2sQKK3WIB2+xpqArZ
 kEhjGm4ZjunZ/TEXjM0KgrLsC6WGXeZTQmZl679nScLECIBqVi2GGuQ9cdxWQq4Zgo
 u0iSFo5+bK8fU17enBhGUD60FFec9CC5212xX0Hf8PjBrr4OTPvVVBpviTK7zVBKNh
 4741njuFWUngA==
Date: Tue, 31 Jan 2023 22:31:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Tejun Heo <tj@kernel.org>
Message-ID: <Y9oHQ6MfRbfwmFyK@sol.localdomain>
References: <20230129121851.2248378-1-willy@infradead.org>
 <Y9a2m8uvmXmCVYvE@sol.localdomain>
 <Y9bkoasmAmtQ2nSV@casper.infradead.org>
 <Y9mH0PCcZoGPryXw@slm.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9mH0PCcZoGPryXw@slm.duckdns.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 31, 2023 at 11:27:44AM -1000, Tejun Heo wrote:
 > Hello, > > On Sun, Jan 29, 2023 at 09:26:57PM +0000, Matthew Wilcox wrote:
 > > > > diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pN6ei-0006m5-GG
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 31, 2023 at 11:27:44AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Sun, Jan 29, 2023 at 09:26:57PM +0000, Matthew Wilcox wrote:
> > > > diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> > > > index e78be66bbf01..a4e76f96f291 100644
> > > > --- a/fs/crypto/crypto.c
> > > > +++ b/fs/crypto/crypto.c
> > > > @@ -205,6 +205,9 @@ struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
> > > >  	}
> > > >  	SetPagePrivate(ciphertext_page);
> > > >  	set_page_private(ciphertext_page, (unsigned long)page);
> > > > +#ifdef CONFIG_MEMCG
> > > > +	ciphertext_page->memcg_data = page->memcg_data;
> > > > +#endif
> > > >  	return ciphertext_page;
> > > >  }
> > > 
> > > Nothing outside mm/ and include/linux/memcontrol.h does anything with memcg_data
> > > directly.  Are you sure this is the right thing to do here?
> > 
> > Nope ;-)  Happy to hear from people who know more about cgroups than I
> > do.  Adding some more ccs.
> > 
> > > Also, this patch causes the following:
> > 
> > Oops.  Clearly memcg_data needs to be set to NULL before we free it.
> 
> These can usually be handled by explicitly associating the bio's to the
> desired cgroups using one of bio_associate_blkg*() or
> bio_clone_blkg_association().

Here that already happens in wbc_init_bio(), called from io_submit_init_bio() in
fs/ext4/page-io.c.

> It is possible to go through memcg ownership
> too using set_active_memcg() so that the page is owned by the target cgroup;
> however, the page ownership doesn't directly map to IO ownership as the
> relationship depends on the type of the page (e.g. IO ownership for
> pagecache writeback is determined per-inode, not per-page). If the in-flight
> pages are limited, it probably is better to set bio association directly.

ext4 also calls wbc_account_cgroup_owner() for each pagecache page that's
written out.  It seems this is for a different purpose -- it looks like the
fs-writeback code is trying to figure out which cgroup "owns" the inode based on
which cgroup "owns" most of the pagecache pages?

The bug we're discussing here is that when ext4 writes out a pagecache page in
an encrypted file, it first encrypts the data into a bounce page, then passes
the bounce page (which don't have a memcg) to wbc_account_cgroup_owner().  Maybe
the proper fix is to just pass the pagecache page to wbc_account_cgroup_owner()
instead?  See below for ext4 (a separate patch would be needed for f2fs):

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index beaec6d81074a..1e4db96a04e63 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -409,7 +409,8 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 
 static void io_submit_add_bh(struct ext4_io_submit *io,
 			     struct inode *inode,
-			     struct page *page,
+			     struct page *pagecache_page,
+			     struct page *bounce_page,
 			     struct buffer_head *bh)
 {
 	int ret;
@@ -421,10 +422,11 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 	}
 	if (io->io_bio == NULL)
 		io_submit_init_bio(io, bh);
-	ret = bio_add_page(io->io_bio, page, bh->b_size, bh_offset(bh));
+	ret = bio_add_page(io->io_bio, bounce_page ?: pagecache_page,
+			   bh->b_size, bh_offset(bh));
 	if (ret != bh->b_size)
 		goto submit_and_retry;
-	wbc_account_cgroup_owner(io->io_wbc, page, bh->b_size);
+	wbc_account_cgroup_owner(io->io_wbc, pagecache_page, bh->b_size);
 	io->io_next_block++;
 }
 
@@ -561,8 +563,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 	do {
 		if (!buffer_async_write(bh))
 			continue;
-		io_submit_add_bh(io, inode,
-				 bounce_page ? bounce_page : page, bh);
+		io_submit_add_bh(io, inode, page, bounce_page, bh);
 	} while ((bh = bh->b_this_page) != head);
 unlock:
 	unlock_page(page);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
