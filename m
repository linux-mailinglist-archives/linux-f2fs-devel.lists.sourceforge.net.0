Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA5163CDF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 07:04:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4ITD-0002kr-Vq; Wed, 19 Feb 2020 06:04:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4ITC-0002kj-NF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 06:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFjhUzdSTL6y+bUgZojZ9Wfk2mmuh2/h+v4Y4bp+dts=; b=OVsuDzk9TARXmehYEqYOnxSbdH
 aHezeghKKiQqPY97xSiONzOTleqRVdZqHZdkfc90ip+ysyDtohRUZqGGOKWTKwD9W5RUuQwwCwFel
 vocPqFTU4F9ENoiDgnaN7p8DurCX2VN5YDuQ4FZTgEv1bTLuQTNgF4y+QXkA33ACePIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AFjhUzdSTL6y+bUgZojZ9Wfk2mmuh2/h+v4Y4bp+dts=; b=j1QX8rfpCrpN5DzObZJSBnTstS
 6jnMsDzW8oy/Fa1B+awhQIG6w1KjUFbk5IZdQdVMrnNgOVx+/Pz/un+B2rcj9jGYdXwGxSuN94bpn
 8a32HXc1I2wI/UBN0ygstrLEn3ZovLtLp+6COcS5u/drFn6uqVCwaShXul4l5IiBAxlE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4ITB-00HEsv-Gd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 06:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AFjhUzdSTL6y+bUgZojZ9Wfk2mmuh2/h+v4Y4bp+dts=; b=euzainEafG+87t1P9h7KE5mkvI
 BHK6B7Pb2S42nRqKfcgAxHx9lFxGyY7C4gj0VsK14d+283DNJqKHVA8ulMfTJEKhRhjaq5HbAv/Bj
 yCSVjDiOvBuN5IouW8M010Z1gvID/vYICHdQtwhvOJL8WI0Prvbbr6uWzK5nJ222Oa6HP/Mr12RGo
 jPGPdHpBaPvDbncrTzOP/5LqdTrwJZFkq06bWAdt2uPG75ZDwc3cqft38JwV/UZQwpSUxvyhp1NxM
 bDCDWcvC/x8L3kKhtMOzDVs+Xy/gJ34WwhYKpGiluzGZtbEfTxXFNIj6sPNg+5CRpsUh1EjuiFaHm
 uGIQ/O2Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4IT1-0003R9-8O; Wed, 19 Feb 2020 06:04:15 +0000
Date: Tue, 18 Feb 2020 22:04:15 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219060415.GO24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-31-willy@infradead.org>
 <20200219032900.GE10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219032900.GE10776@dread.disaster.area>
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
X-Headers-End: 1j4ITB-00HEsv-Gd
Subject: Re: [f2fs-dev] [PATCH v6 17/19] iomap: Restructure
 iomap_readpages_actor
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 02:29:00PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:46:11AM -0800, Matthew Wilcox wrote:
> > @@ -418,6 +412,15 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
> >  		}
> >  		ret = iomap_readpage_actor(inode, pos + done, length - done,
> >  				ctx, iomap, srcmap);
> > +		if (WARN_ON(ret == 0))
> > +			break;
> 
> This error case now leaks ctx->cur_page....

Yes ... and I see the consequence.  I mean, this is a "shouldn't happen",
so do we want to put effort into cleanup here ...

> > @@ -451,11 +454,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
> >  done:
> >  	if (ctx.bio)
> >  		submit_bio(ctx.bio);
> > -	if (ctx.cur_page) {
> > -		if (!ctx.cur_page_in_bio)
> > -			unlock_page(ctx.cur_page);
> > -		put_page(ctx.cur_page);
> > -	}
> > +	BUG_ON(ctx.cur_page);
> 
> And so will now trigger both a warn and a bug....

... or do we just want to run slap bang into this bug?

Option 1: Remove the check for 'ret == 0' altogether, as we had it before.
That puts us into endless loop territory for a failure mode, and it's not
parallel with iomap_readpage().

Option 2: Remove the WARN_ON from the check.  Then we just hit the BUG_ON,
but we don't know why we did it.

Option 3: Set cur_page to NULL.  We'll hit the WARN_ON, avoid the BUG_ON,
might end up with a page in the page cache which is never unlocked.

Option 4: Do the unlock/put page dance before setting the cur_page to NULL.
We might double-unlock the page.

There are probably other options here too.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
