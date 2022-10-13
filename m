Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 263B65FD2BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 03:37:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oinAK-0004e2-Sn;
	Thu, 13 Oct 2022 01:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joe@perches.com>) id 1oinAJ-0004do-I0;
 Thu, 13 Oct 2022 01:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c2YwssGIaPysLPcR20mrskERCj5dzMDhD63/1J4p7RU=; b=PLPw745zS9uMBrf6r8+9n/G+hO
 32zjVzM9tMfQ2RFI2bGyCMkUIxMxOrFtpzV1p5ZlGnk5LI2LQsAWcrAc18LF4PAldNv/KbOsV1VIy
 jrsvmmskWd4bSwSStQ1WDX3SdhMuMPLyk6s+J/oyV15h9bCx4gT8PlsS8svpUdM7m/Pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c2YwssGIaPysLPcR20mrskERCj5dzMDhD63/1J4p7RU=; b=fht1Aej5Gv8b7tF9obyuV/rNYY
 pqrr7s0JpWXIQFTh0WhjhSmaNhliQUhJXCJiefEtp9KirqcuABRaXex+PpM8oxcBqOXkPDwAkPhBF
 vMHP3bDYFnIq2MtM4ni9nIH4Yzgt1zI+gwvbfG4RIlufTu6tRzJsGpWS6/bqmRPglkw8=;
Received: from smtprelay0013.hostedemail.com ([216.40.44.13]
 helo=relay.hostedemail.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oinAH-0001pt-Ok; Thu, 13 Oct 2022 01:37:39 +0000
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id 640C9120237;
 Thu, 13 Oct 2022 01:37:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf20.hostedemail.com (Postfix) with ESMTPA id 56EDD20026; 
 Thu, 13 Oct 2022 01:37:01 +0000 (UTC)
Message-ID: <3f527ec95a12135eb40f5f2d156a2954feb7fbfe.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: David Laight <David.Laight@ACULAB.COM>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Wed, 12 Oct 2022 18:37:11 -0700
In-Reply-To: <d45bd258e033453b85a137112e7694e1@AcuMS.aculab.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
 <f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel@perches.com>
 <d45bd258e033453b85a137112e7694e1@AcuMS.aculab.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=0.88
X-Stat-Signature: jmxt1u5agdpi9w76hr4tp6uotie3p373
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 56EDD20026
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18KEIRmyyr9pSEavQqF5X0dTzAEITyiJq4=
X-HE-Tag: 1665625021-540494
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2022-10-12 at 21:29 +0000,
 David Laight wrote: > From:
 Joe Perches > > Sent: 12 October 2022 20:17 > > > > On Wed, 2022-10-05 at
 23:48 +0200, Jason A. Donenfeld wrote: > > > The prandom_u32() [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.13 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.13 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 FORGED_SPF_HELO        No description available.
X-Headers-End: 1oinAH-0001pt-Ok
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "dev@openvswitch.org" <dev@openvswitch.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "dccp@vger.kernel.org" <dccp@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "lvs-devel@vger.kernel.org" <lvs-devel@vger.kernel.org>,
 "SHA-cyfmac-dev-list@infineon.com" <SHA-cyfmac-dev-list@infineon.com>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "cake@lists.bufferbloat.net" <cake@lists.bufferbloat.net>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2022-10-12 at 21:29 +0000, David Laight wrote:
> From: Joe Perches
> > Sent: 12 October 2022 20:17
> > 
> > On Wed, 2022-10-05 at 23:48 +0200, Jason A. Donenfeld wrote:
> > > The prandom_u32() function has been a deprecated inline wrapper around
> > > get_random_u32() for several releases now, and compiles down to the
> > > exact same code. Replace the deprecated wrapper with a direct call to
> > > the real function.
> > []
> > > diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
> > []
> > > @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
> > >  				   &ep->com.remote_addr;
> > >  	int ret;
> > >  	enum chip_type adapter_type = ep->com.dev->rdev.lldi.adapter_type;
> > > -	u32 isn = (prandom_u32() & ~7UL) - 1;
> > > +	u32 isn = (get_random_u32() & ~7UL) - 1;
> > 
> > trivia:
> > 
> > There are somewhat odd size mismatches here.
> > 
> > I had to think a tiny bit if random() returned a value from 0 to 7
> > and was promoted to a 64 bit value then truncated to 32 bit.
> > 
> > Perhaps these would be clearer as ~7U and not ~7UL
> 
> That makes no difference - the compiler will generate the same code.

True, more or less.  It's more a question for the reader.

> The real question is WTF is the code doing?

True.

> The '& ~7u' clears the bottom 3 bits.
> The '- 1' then sets the bottom 3 bits and decrements the
> (random) high bits.

Right.

> So is the same as get_random_u32() | 7.

True, it's effectively the same as the upper 29 bits are random
anyway and the bottom 3 bits are always set.

> But I bet the coder had something else in mind.

Likely.

And it was also likely copy/pasted a few times.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
