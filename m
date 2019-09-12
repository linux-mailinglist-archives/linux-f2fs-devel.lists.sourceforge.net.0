Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21792B0C13
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2019 11:57:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i8Lr9-0006m9-7L; Thu, 12 Sep 2019 09:57:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mbobrowski@mbobrowski.org>) id 1i8Lr7-0006lk-Eo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Sep 2019 09:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dt0j6/Dbs+dwW1SIPthaW+qziOAlFsuqXt20b4c12nE=; b=M6FQNpc6ZCWWWGN9UvkViOuOaI
 AAIJ9u40eUpcgAwUhqB8kjvs88dxwuKbxyUKKODmolg1MsKopwVgYfupS2hLGMyu00fBkq2DUgO3J
 lbMFeKHgaAx0Nzv0h7pnATBgE49tHHmZz5NQnCT/UEsw8keezhOlqea1/jzWIZXmlFQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dt0j6/Dbs+dwW1SIPthaW+qziOAlFsuqXt20b4c12nE=; b=eln4JHOkgfb+DJc5V2qQ/VUcNQ
 OQa7LTWmUPH5+JfLOClEYVbubLQKAciSvk7ysTVJanEDuDIDMqfgBtRl35Lp34GVzilB1rv5f1TOV
 FwqTcsV1ozgWgj/CycbKDSsB1Uudmxq0m1EHvvmjRvrdIox0MY/qLb1wY0U0ecv6vj60=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i8Lr5-0021Dm-7C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Sep 2019 09:57:37 +0000
Received: by mail-io1-f68.google.com with SMTP id r8so28101027iol.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Sep 2019 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dt0j6/Dbs+dwW1SIPthaW+qziOAlFsuqXt20b4c12nE=;
 b=12hCQat9jUcgSa47++/HQI/Kl7LxMpOdcs5vqzMW95pKZMUHEhyw9ZMTKknS+6Z2Rx
 K9qJNKmsGVjwgxprs5gDVl8K+aUT2VnsLU60nF0AzZqv5zXtsCwN++iPfEVHgWC+J7j+
 dzo27W3kuN+k10OHxZQp4JFaIL0RYtJn0rAoEKVV3Tjp/yso+xeP3PIyvRGhxb2KSfST
 ffoFGuMIjtreThdQ+W41KGD+0jkLetWQM+B1FTVLAr6v++nXXRuC0Pw6a6KKqO9IL1Es
 KlgfJcVrWGFzhtJHgrA+FEtA/80mCRFIS7z+ma8tpq3q4vca8MZ/qHfHgMp7DzPy84Ad
 FAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dt0j6/Dbs+dwW1SIPthaW+qziOAlFsuqXt20b4c12nE=;
 b=YfQI+V1e8RtqGn3PYEjau0HA+lDgIa2Aa182kIeF5FfW5FzJN1281FCkQwA+aRlCmW
 Evq/ShUMeNuK4RBCZtzOU4XemDqz/U8g0e6lGl+ZAgj1/VvqAaVqbvxbM0H3OGaPXvsg
 qP2V+2HQ8Qkon22JWoh/Llss/GVuzHcNT5oMb1+Bs3TIPOKvhUpH6kc+V2hHDV+zDmJ9
 wvfblu+YZstFZOGUwc9tUJniqh6rBmFjA9r8yompJTbSfSucdSxzSZf4Oe1MatdeXer5
 JJs/rMXOlK1W9iCfCd/EgLMb50kV5EF6JLDU8AcxyXCkxwc+0oJN9pwezLzhLgUhVVjP
 I6ww==
X-Gm-Message-State: APjAAAVLynEXC1a0Dtg5yJMKnutDSeY0iukhhthsqpjW9zCdEfE+t1DQ
 yai2JhVSk+TXelDUgLl9LX8YGpMDVeqQ
X-Google-Smtp-Source: APXvYqwyIDlF1caDTpNVqUKoLG7l8JslVWsCl4azAP5rgYV6Wp1tuclPnO2lsBQan2QfColr2D8A2g==
X-Received: by 2002:a63:211c:: with SMTP id h28mr36886434pgh.438.1568280381146; 
 Thu, 12 Sep 2019 02:26:21 -0700 (PDT)
Received: from bobrowski ([110.232.114.101])
 by smtp.gmail.com with ESMTPSA id c62sm29491396pfa.92.2019.09.12.02.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 02:26:20 -0700 (PDT)
Date: Thu, 12 Sep 2019 19:26:14 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Ritesh Harjani <riteshh@linux.ibm.com>
Message-ID: <20190912092614.GB9747@bobrowski>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-3-rgoldwyn@suse.de>
 <20190912085236.7C51642042@d06av24.portsmouth.uk.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912085236.7C51642042@d06av24.portsmouth.uk.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i8Lr5-0021Dm-7C
Subject: Re: [f2fs-dev] [PATCH 2/3] ext4: fix inode rwsem regression
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
Cc: Goldwyn Rodrigues <rgoldwyn@suse.de>, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Goldwyn Rodrigues <rgoldwyn@suse.com>, aneesh.kumar@linux.ibm.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, andres@anarazel.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 12, 2019 at 02:22:35PM +0530, Ritesh Harjani wrote:
> cc'd Matthew as well.
> 
> > This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
> > Apparently our current rwsem code doesn't like doing the trylock, then
> > lock for real scheme.  So change our read/write methods to just do the
> > trylock for the RWF_NOWAIT case.
> > 
> > Fixes: 728fbc0e10b7 ("ext4: nowait aio support")
> > Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> This patch will conflict with recent iomap patch series.
> So if this is getting queued up before, so iomap patch series will
> need to rebase and factor these changes in the new APIs.

Noted. I've been keeping my eye on this thread, so I'm aware of this.

--<M>--


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
