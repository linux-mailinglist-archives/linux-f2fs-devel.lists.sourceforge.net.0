Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 455455F67B9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 15:21:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogQo2-00024x-Qu;
	Thu, 06 Oct 2022 13:20:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ogQo1-00024n-QY; Thu, 06 Oct 2022 13:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZA/qVV/OjVPeYSfM3XvsjCeMNgcHk9DsjyLEvsY4vvA=; b=D9p7vD/GIxpvA91wa8wzazTk8B
 dZuw89M4L4mFs2z8RO7WROjaQ0GNlzdPqmVx2kfE2Ta8pNigXkkijO4InwWdoj1yjFk3Ui2jV6Ak3
 JtcNGJNg9O1T0+RwUwSxqilvGh2f2orzaPvwe8GUETG+9n0ljJt0N1hvRRqnWH9vZ4yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZA/qVV/OjVPeYSfM3XvsjCeMNgcHk9DsjyLEvsY4vvA=; b=ErbO8IQkjxuRPrhnWV5AASd+4S
 AB9n/YjsoXcUsba4SL7srOgBzAY2aXY/ibSUPt+GTBJ2b3oRzwzNiDhX5OArY4rSfsvhwSam6R2mu
 qEnTywxlPsa5yH82tYfJo7/Kdd3xC7X3iujZonhWgO4ajG3G5qTvRp8N0qfSW+qD6Y84=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogQny-00EjE9-8p; Thu, 06 Oct 2022 13:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665062450; x=1696598450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EU0abpI6YFdk3YA4KGgLZ9e2cnqNyTF/1r17KmA6WbU=;
 b=H3zGzsswgPPvwomrZq9GE2mR6+GwMUlxzvRegiBV5hM2lHHux6Ql1/cH
 wvvkEJ65xOvvsFmuWqxA8H0i/u5nwlzn8rtxC8V0UmmkTafjNXEEv+HcV
 2M3bOKQOegX0cb7WpY5VAiuxcvY70PuHf7aQnrViofxZyxWI7+dEHBpkV
 F6myIPML3jwxdilB+YZ5I/P5FDCH6k+DCD9FnF551iCHmBwlVvqN1OXx6
 flWIZasybIV62K5GlkcjZMz79erGmz1U+cwdlWuYWXYbaobKBrF4Cfmcj
 HXemU265g2jjKVCtGcrKUsGaW0Zaw8c6z5yn5ErEPJTCo/WeRLWEx4lsb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="302157911"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="302157911"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 06:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="729143418"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="729143418"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2022 06:20:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ogQng-0039rX-0O; Thu, 06 Oct 2022 16:20:32 +0300
Date: Thu, 6 Oct 2022 16:20:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <Yz7WHyD+teLOh2ho@smile.fi.intel.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com> <Yz7OdfKZeGkpZSKb@ziepe.ca>
 <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld
 wrote: > On Thu, Oct 6, 2022 at 6:47 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
 > > On Wed, Oct 05, 2022 at 11:48:42PM +0200, Jason A. Donenf [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.120 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogQny-00EjE9-8p
Subject: Re: [f2fs-dev] [PATCH v1 3/5] treewide: use get_random_u32() when
 possible
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, dev@openvswitch.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com,
 coreteam@netfilter.org, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com,
 linux-raid@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld wrote:
> On Thu, Oct 6, 2022 at 6:47 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Oct 05, 2022 at 11:48:42PM +0200, Jason A. Donenfeld wrote:

...

> > > -     u32 isn = (prandom_u32() & ~7UL) - 1;
> > > +     u32 isn = (get_random_u32() & ~7UL) - 1;
> >
> > Maybe this wants to be written as
> >
> > (prandom_max(U32_MAX >> 7) << 7) | 7

> > ?
> 
> Holy smokes. Yea I guess maybe? It doesn't exactly gain anything or
> make the code clearer though, and is a little bit more magical than
> I'd like on a first pass.

Shouldn't the two first 7s to be 3s?

...

> > > -     psn = prandom_u32() & 0xffffff;
> > > +     psn = get_random_u32() & 0xffffff;
> >
> >  prandom_max(0xffffff + 1)
> 
> That'd work, but again it's not more clear. Authors here are going for
> a 24-bit number, and masking seems like a clear way to express that.

We have some 24-bit APIs (and 48-bit) already in kernel, why not to have
get_random_u24() ?


-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
