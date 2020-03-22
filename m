Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65E18EA5B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2020 17:28:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jG3Sl-0004kl-Fv; Sun, 22 Mar 2020 16:28:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jG3Sk-0004ke-5j
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 16:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+q5SE8PabkJ4E2ARJpyvT2voAuJ2mKWWauYSLk4KvP8=; b=NHFppTSje9bh+r4Isf+ymV5owd
 0uTJeSDF36Db5lFLNhxfwPJ7De58ChurMpwtLc/a+n374MIpidi4U00bALaL+MsPqc+xCBNQL9zm6
 1mXNMwxB1CxrZncAgGlnn0QolJsArhwtr6V+NMZhSQ7mmOWBG2Oq8htZDoh2qyTKWmFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+q5SE8PabkJ4E2ARJpyvT2voAuJ2mKWWauYSLk4KvP8=; b=TZFAA++vZahVnU0YP4IFa6WWXm
 w9KjhcPQjRNyUZ5GgZZS//k4RegukTolbgQvYlYrG4YaL6YOLe3tuPtd5ceXWNOqLJaqz5VerEP6X
 8VD1/lsrIqZUHQ2Vii85FfTU9iqiVTiMAX8lo8vufSDIhKsWAReZd3dmGTqK0CDHdVzk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jG3Sg-00CpWF-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 16:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+q5SE8PabkJ4E2ARJpyvT2voAuJ2mKWWauYSLk4KvP8=; b=DMIkZSYbAXVYZnU8ct+6eTALIM
 IIwMq32XvglVnA0tcHkjB7yxlMiata26hBz45kwB5a05tIb02c9RE5ySYhs3Ho1G+lFVSgzlzVVDc
 DUMiK8p2sT6gtwlUuoh5Nc7LPQ6R2kVmwSly/JqhfRE2B1JKygrsPQSdgxP2bs4+VdMciVAE86kHt
 faPtljJno8DX46yFjGcZZwU56Jt23D6buy8qiu9daFTCr8dE5hV5cU6dlBPdz0Fx7mooeF/M7/3E9
 cV1R/zopL7FbuerKPz2Tn81i5E79BF6SUI1praSaJFyVmD8DjvZ9DxsxJvgden2Wq6jHCv3KoNE8F
 cMFMFWAw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jG3SU-0000CF-PX; Sun, 22 Mar 2020 16:28:18 +0000
Date: Sun, 22 Mar 2020 09:28:18 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200322162818.GG4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-13-willy@infradead.org>
 <20200320165828.GB851@sol.localdomain>
 <20200320173040.GB4971@bombadil.infradead.org>
 <20200320180017.GE851@sol.localdomain>
 <20200320181132.GD4971@bombadil.infradead.org>
 <20200320182452.GF851@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320182452.GF851@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jG3Sg-00CpWF-Tk
Subject: Re: [f2fs-dev] [PATCH v9 12/25] mm: Move end_index check out of
 readahead loop
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 11:24:52AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 11:11:32AM -0700, Matthew Wilcox wrote:
> > On Fri, Mar 20, 2020 at 11:00:17AM -0700, Eric Biggers wrote:
> > > But then if someone passes index=0 and nr_to_read=0, this underflows and the
> > > entire file gets read.
> > 
> > nr_to_read == 0 doesn't make sense ... I thought we filtered that out
> > earlier, but I can't find anywhere that does that right now.  I'd
> > rather return early from __do_page_cache_readahead() to fix that.
> > 
> > > The page cache isn't actually supposed to contain a page at index ULONG_MAX,
> > > since MAX_LFS_FILESIZE is at most ((loff_t)ULONG_MAX << PAGE_SHIFT), right?  So
> > > I don't think we need to worry about reading the page with index ULONG_MAX.
> > > I.e. I think it's fine to limit nr_to_read to 'ULONG_MAX - index', if that makes
> > > it easier to avoid an overflow or underflow in the next check.
> > 
> > I think we can get a page at ULONG_MAX on 32-bit systems?  I mean, we can buy
> > hard drives which are larger than 16TiB these days:
> > https://www.pcmag.com/news/seagate-will-ship-18tb-and-20tb-hard-drives-in-2020
> > (even ignoring RAID devices)
> 
> The max file size is ((loff_t)ULONG_MAX << PAGE_SHIFT) which means the maximum
> page *index* is ULONG_MAX - 1, not ULONG_MAX.

I see where we set that for _files_ ... I can't find anywhere that we prevent
i_size getting that big for block devices.  Maybe I'm missing something.

> Anyway, I think we may be making this much too complicated.  How about just:
> 
> 	pgoff_t i_nrpages = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> 
> 	if (index >= i_nrpages)
> 		return;
> 	/* Don't read past the end of the file */
> 	nr_to_read = min(nr_to_read, i_nrpages - index);
> 
> That's 2 branches instead of 4.  (Note that assigning to i_nrpages can't
> overflow, since the max number of pages is ULONG_MAX not ULONG_MAX + 1.)

I like where you're going with this.  Just to be on the safe side, I'd
prefer to do this:

@@ -266,11 +266,8 @@ void __do_page_cache_readahead(struct address_space *mapping,
        end_index = (isize - 1) >> PAGE_SHIFT;
        if (index > end_index)
                return;
-       /* Avoid wrapping to the beginning of the file */
-       if (index + nr_to_read < index)
-               nr_to_read = ULONG_MAX - index + 1;
        /* Don't read past the page containing the last byte of the file */
-       if (index + nr_to_read >= end_index)
+       if (nr_to_read > end_index - index)
                nr_to_read = end_index - index + 1;
 
        page_cache_readahead_unbounded(mapping, file, index, nr_to_read,

end_index - index + 1 could only overflow if end_index is ULONG_MAX
and index is 0.  But if end_index is ULONG_MAX and index is 0, then
nr_to_read is necessarily <= ULONG_MAX, so the condition is false.
And if nr_to_read is 0, then the condition is also false, so it won't
increase nr_to_read from 0 to 1.  It might assign x to nr_to_read when
nr_to_read is already x, but that's harmless.

Thanks!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
