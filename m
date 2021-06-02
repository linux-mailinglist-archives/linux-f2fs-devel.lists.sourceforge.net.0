Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A439967C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 01:49:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loacQ-0001L8-FT; Wed, 02 Jun 2021 23:49:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1loacP-0001L1-GF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 23:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s/eIrUrQdl2JatwFDZBVU2Su7wjREm/J1te+/OZSn3o=; b=QupW5VpzSWI/oCEUGjkXE9/+nF
 Uk64hpmNkoOrckaA0x1uxHNb+9X/7aRiwpM1zXaPcphyk+EZZ+KBdkXrzicOVcvIIwzpc1y/Gsgc5
 exJVNUt/piSzEzHKt9cLXZl+dF9V5VZlHIXzFwMlqO+w79LU0/hqFWH7VcUQdkCJBh/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s/eIrUrQdl2JatwFDZBVU2Su7wjREm/J1te+/OZSn3o=; b=mIX0Mp9d9tn8oKeiEw7gDM5HOp
 uiPaXhrIMJF7LTl7Hj7pagyoInU7sQUD6EmkGXYcYUF0ntWaAxvY0/2kstxF12jut0jPXwSGEvU7b
 874HNCAFK/RpTX4NyfM7Cr5EkaZWzrTWQ0B1D8KwyZquSgnOqlQKNwwz5q6G6e6OM02A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loacI-0086M7-Ue
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 23:49:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DA9A613D8;
 Wed,  2 Jun 2021 23:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622677772;
 bh=03OVd6l7oQj7vrcl0Aa1QgC37aMuKF9JB7s8GqaXSLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RWwqLESx/uN0TCUq74s7on3lrH3UFn2rv2kdcIzf1o5Jgnn7d8PgdrYIpePQLuTL6
 UUBhYp6K0+WSWlYcoCOFDSWk03Zx3dl51cY7bEwFxqfwazFX0rP9sOORPXVWLBVuwb
 BdzV30lQzXtiCp3gCR6Ee/gAfzVSCX67IJz7EwgwNQeosZ/9kihFo1Ib1aunBzepRE
 243u5/pct8DogyydXFMXgkhK+sa2xEfGCLgmiXkRn6qGbSEEOZYBQtNvYI1opQQ3ee
 gsOP+DpRKZlfHP9mawzwBEvOc4tRZ8nbZQCPcAbs0A9uK8VaNqUjbE3ESiu6ycIsW8
 B1Lhbs6BOfARw==
Date: Wed, 2 Jun 2021 16:49:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <YLgZCwPLenETHx1+@sol.localdomain>
References: <20210602041539.123097-1-drosen@google.com>
 <20210602041539.123097-3-drosen@google.com>
 <YLfh9pv1fDT+Q3pe@sol.localdomain>
 <CA+PiJmR1vWN7ij7ak4q=C0Wxa++t=SCnEFh_iDt7QVOAZy-VFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+PiJmR1vWN7ij7ak4q=C0Wxa++t=SCnEFh_iDt7QVOAZy-VFw@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loacI-0086M7-Ue
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Advertise encrypted casefolding in
 sysfs
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
Cc: kernel-team@android.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 04:22:38PM -0700, Daniel Rosenberg wrote:
> On Wed, Jun 2, 2021 at 12:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Wed, Jun 02, 2021 at 04:15:39AM +0000, Daniel Rosenberg wrote:
> > > +#ifdef CONFIG_UNICODE
> > > +F2FS_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
> > > +#endif
> >
> > Shouldn't it be defined(CONFIG_UNICODE) && defined(CONFIG_FS_ENCRYPTION)?
> >
> > >  #endif
> > >  #ifdef CONFIG_BLK_DEV_ZONED
> > >  F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
> > > @@ -815,6 +823,9 @@ static struct attribute *f2fs_feat_attrs[] = {
> > >  #ifdef CONFIG_FS_ENCRYPTION
> > >       ATTR_LIST(encryption),
> > >       ATTR_LIST(test_dummy_encryption_v2),
> > > +#ifdef CONFIG_UNICODE
> > > +     ATTR_LIST(encrypted_casefold),
> > > +#endif
> >
> > Likewise here.
> >
> > - Eric
> 
> Those are already within an #ifdef CONFIG_FS_ENCRYPTION, so it should
> be covered already.

Adding a comment to the #endif for CONFIG_FS_ENCRYPTION would make it easier to
read:

	#endif /* CONFIG_FS_ENCRYPTION */

> Should I send a v2 set with the
> 
> Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> Cc: stable@vger.kernel.org # v5.11+
> 
> appended?

Yes, please add those tags.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
