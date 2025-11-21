Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83894C774B7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 05:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuPa3kU0A31ZuqS+Q0XZswnpyv7Vk+bxl7LKhgA0c9s=; b=GcCMIoYR11L3Q+n513oQoVy4zW
	KI/apXkrq74jkIvb6SChtAfW8IS3Ug/DRX3DnO2AYcW2iOMfwhuum/wwq7VWnclUQ2GkuzV3n8I4F
	rvS/dkBiQxe6YmokL+L/88Y4WdiYImzNcsM5TBrX73dGBCyhOyH89rYB6ZuP8g/mvfC8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMJ2S-0002j4-FM;
	Fri, 21 Nov 2025 04:46:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMJ2R-0002iy-Ce
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 04:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wClFwaqCDCTLWkJnh5xtguD/stIC1+VFFR4527iUPMU=; b=PShqB1IHMdg47ATnBIRGMcJ/sP
 Ba/2PO1aGSsAEPxbH1XYZjnVgSKGxJrJseDDnzWP43y//3sM9GX068DG5wDIDfCAO+HbYhJKw3ert
 5Iamc/NpA9fE8xjdys2BPi5TdbUUjyODlcbPU7xwZfNwCK5WSdZELOlZ8OiuGcEE+X4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wClFwaqCDCTLWkJnh5xtguD/stIC1+VFFR4527iUPMU=; b=Hm5ig9oJVcjGuyxnCdxV4HygWb
 lMg7P1XQpUjbFwIuJiQD1a/6+KXo4zbhNEJQl+E4urG4hUDRitOMOsznpGM+tVKtEkFzQ0guqxDfx
 2tXNiUVSt0LI509V5O17GenOqXhjXqLPRFQVb2syyVLjhiFLoxtJ2ln6YSd2ng0QWyHU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMJ2Q-0000Hz-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 04:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5824140B55;
 Fri, 21 Nov 2025 04:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030B2C4CEF1;
 Fri, 21 Nov 2025 04:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763700376;
 bh=8BNbTE9okAQd3oSyfX1xipCtV8nyD1u5qgEglox2ZXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R2RCW30NUswCnHncAGnQiPS/Lywv1Q5PwlZhIbzuoPJNGvuE9PgY+JJcjqbSi2K1L
 giJF2MzTkvJY2/E+KkOjSHMznKWSbsTMjYBUm/k88S42mN8+8euLplxaGLTdw3Q2+M
 yhD5zw8um5lJjKJXMt7diqW8VUjoPbaTo9UhGzyVQHIeLKD3vYhpgh2uA71FWBB4BP
 vPbmXYCVl8gJ/qUOPjH+KVnZ5zo4B26Uz23Ohkk2M3WVeEz1sv3mZkMeJu3w1F1mFX
 7hk2n5X8lLj3iCe7iKcFT6qbVr9bmsRiDyeaA2HpiY1OMY1zlljVSWV+QG5Ab4ZJUQ
 va0BqBN972Zlw==
Date: Fri, 21 Nov 2025 04:46:14 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aR_ultJzXh1rmOKs@google.com>
References: <20251121032718.1993528-1-jaegeuk@kernel.org>
 <aR_pCGtcc7ASeA77@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aR_pCGtcc7ASeA77@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21, Matthew Wilcox wrote: > On Fri, Nov 21, 2025 at
 03:27:18AM +0000,
 Jaegeuk Kim wrote: > > This patch introduces a new POSIX_FADV_MLOCK
 which 1) invalidates the range of > > cached pages, 2) s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMJ2Q-0000Hz-M3
Subject: Re: [f2fs-dev] [PATCH] [RFC] mm/fadvise: introduce POSIX_FADV_MLOCK
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21, Matthew Wilcox wrote:
> On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
> > This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
> > cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
> > pages directly to the inaccessible mapping.
> 
> ... what?
> 
> This seems like something which is completely different from mlock().
> So it needs a different name.
> 
> But I don't understand the point of this, whatever it's called.  Need
> more information.

So, the sequence that I'd like to optimize is mmap(MAP_POPULATE) followed
by  mlock(). For example, mmap() takes 1 second to load 4GB data, and mlock()
takes 330ms additionally in order to migrate all the pages into inaccessible
map, IIUC.

So, I'm thinking to combine two operations into single fadvise() with whatever
advise. Does it make sense?

> 
> > The inaccessible pages will be invalidated by evict_inode or explicit munlock().
> > 
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  include/uapi/linux/fadvise.h |  2 ++
> >  mm/fadvise.c                 | 14 ++++++++++++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/include/uapi/linux/fadvise.h b/include/uapi/linux/fadvise.h
> > index 0862b87434c2..06018688b99b 100644
> > --- a/include/uapi/linux/fadvise.h
> > +++ b/include/uapi/linux/fadvise.h
> > @@ -19,4 +19,6 @@
> >  #define POSIX_FADV_NOREUSE	5 /* Data will be accessed once.  */
> >  #endif
> >  
> > +#define POSIX_FADV_MLOCK	8 /* Load pages into inaccessible map.  */
> > +
> >  #endif	/* FADVISE_H_INCLUDED */
> > diff --git a/mm/fadvise.c b/mm/fadvise.c
> > index 588fe76c5a14..849b151d2024 100644
> > --- a/mm/fadvise.c
> > +++ b/mm/fadvise.c
> > @@ -56,6 +56,7 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
> >  		case POSIX_FADV_WILLNEED:
> >  		case POSIX_FADV_NOREUSE:
> >  		case POSIX_FADV_DONTNEED:
> > +		case POSIX_FADV_MLOCK:
> >  			/* no bad return value, but ignore advice */
> >  			break;
> >  		default:
> > @@ -93,6 +94,19 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
> >  		file->f_mode &= ~FMODE_RANDOM;
> >  		spin_unlock(&file->f_lock);
> >  		break;
> > +	case POSIX_FADV_MLOCK:
> > +		/* Remove the cached pages. */
> > +		if (!mapping_unevictable(mapping)) {
> > +			invalidate_inode_pages2_range(mapping,
> > +					offset >> PAGE_SHIFT,
> > +					(offset + len - 1) >> PAGE_SHIFT);
> > +
> > +			/* set the mapping is unevictable */
> > +			filemap_invalidate_lock(mapping);
> > +			mapping_set_inaccessible(mapping);
> > +			filemap_invalidate_unlock(mapping);
> > +		}
> > +		fallthrough;
> >  	case POSIX_FADV_WILLNEED:
> >  		/* First and last PARTIAL page! */
> >  		start_index = offset >> PAGE_SHIFT;
> > -- 
> > 2.52.0.487.g5c8c507ade-goog
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
