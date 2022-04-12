Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB44FE5C1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 18:24:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neJJL-0000IO-P7; Tue, 12 Apr 2022 16:24:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1neJJK-0000IC-FT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 16:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=781Lnu1/9HDYPZ/usziGUO0ne9i1JOyN5LS146InDBE=; b=fd4ocQdaBgYsbRg38A5f+Mci1Y
 E9TS2gyJRm4OfA9n17QauUKK/2aKVf9CFS7NovmKwSazRm1nYGv6HSue7DyyA3tWVfvynNNz9es3B
 WXkrB1E4zsUyxYkxs6z7VRJ7vsYqLjBikYUS4XkplF5klcPLGkvX+hUBs/pfOHMKAqug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=781Lnu1/9HDYPZ/usziGUO0ne9i1JOyN5LS146InDBE=; b=A4BUoGb01DkOnFuFTCjfpTw2+F
 puN1zr27CSUBbMCD+Ojd/XbIBcVKH7UB2BbZToV1iEG26hqw8Fnb6c+2h/ZIHyUlUXiZfYtodm0e5
 JmDvPEjPWeylw7k3wldB9o/zg4RtRccghm4gCDYn/SIpgHycGn9qgFiEMG+JqfqvIIvM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neJJK-0005GY-I7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 16:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=781Lnu1/9HDYPZ/usziGUO0ne9i1JOyN5LS146InDBE=; b=q5MoAOB80+PBYAps/+4//Fevvb
 SG/n7XyngHB1NTDEn+iSQ3M+tMPer1/Qekg//Z0FS05rqrEPJdh71a84uYaxT4RuUK67YUbPpqdI6
 T9BC3X6uDUDrOS9CE0EuvYWRarBdKxV3HZIqj6W0Mmf8u/Z7OIRYZi7LmglcJA7eHXHglw+1FogLO
 vspCUg/EZYL4jD5MNtGVVUbR993PPxphYf++aYcZRAzMG5XgjPElzyzziv3YRUvB9XaPgEEBob8sV
 xkEzkXo84OOqkZZVquTQcdiz1xM9NjPen16kEwNPLj0564/H9CdCjZrNhMuUKzxAvHHdTGiQhTIe4
 xwDzYL/w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1neJJ6-00F5ys-PD; Tue, 12 Apr 2022 16:23:56 +0000
Date: Tue, 12 Apr 2022 09:23:56 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <YlWnnJEw1ifCkU/k@bombadil.infradead.org>
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31@eucas1p1.samsung.com>
 <20220412112745.44108-3-p.raghav@samsung.com>
 <aa4133c915f61811b40cd11a738bdb18859fe3c0.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa4133c915f61811b40cd11a738bdb18859fe3c0.camel@wdc.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 12, 2022 at 12:14:13PM +0000,
 Damien Le Moal wrote:
 > On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote: > > From: Luis
 Chamberlain <mcgrof@kernel.org> > > > > Expand get_device_info( [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1neJJK-0005GY-I7
Subject: Re: [f2fs-dev] [PATCH 2/3] libf2fs: add support to report zone size
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
Cc: "p.raghav@samsung.com" <p.raghav@samsung.com>,
 "javier.gonz@samsung.com" <javier.gonz@samsung.com>,
 "pankydev8@gmail.com" <pankydev8@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 12, 2022 at 12:14:13PM +0000, Damien Le Moal wrote:
> On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote:
> > From: Luis Chamberlain <mcgrof@kernel.org>
> > 
> > Expand get_device_info() to report the zone size.
> > This is now important give power of 2 zone sizees (PO2)
> 
> s/give/given that
> s/sizees/size
> 
> > can exist, and so can non power of 2 zones sizes (NPO2),
> 
> No they cannot, not yet in Linux.

They *do* exist in the real world, and in Linux they do come up when
users are manually removing the current po2 requirement on Linux
sources [0].

So how about:

This is now important give power of 2 zone sizees (PO2)
do exist and some users are manually forcing to enable these
on Linux [0].

[0] https://lkml.kernel.org/r/CAJjM=8Cap1bwu8cp-mRTsiBmbHH=Ed8pp9vdAsig2o_ZiHTc-g@mail.gmail.com

> Overall, I really do not see the point of this patch.

It makes the subsequent patch easier to read and also makes
the displaying zone support separate easier to review. It can
certainly be merged, but I don't think it makes the last patch
as easier to read. It's subjective and up to the maintainer.

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
