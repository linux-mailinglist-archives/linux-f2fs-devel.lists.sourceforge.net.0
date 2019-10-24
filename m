Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C0E27B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 03:28:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNRvC-0007De-W5; Thu, 24 Oct 2019 01:28:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7d07f63deafc16831ef1+5905+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iNRvB-0007DP-IC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 01:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOJSv5AEO1P0oZySMka50rrSmMrrts/dJHKNuIUqNOo=; b=B4lNU8m94OPvH26wDQ/UJKXn8k
 ZIxnk0vWaDTftftxGVhbPY2xdv2IqvDxW8Lin3LbpFxVV3JWuoyBy8tPhprdrUjxTt2A8WeTsrphJ
 xUO7FF67HrnYddheFg7x3BAdmikf4NNhEzlltkcQl0nGDIQcRzWswgLR2IGIT9F1LN88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oOJSv5AEO1P0oZySMka50rrSmMrrts/dJHKNuIUqNOo=; b=W0/nJ/wMMk8MucGsDlfuhC/jMu
 pqQJD2Ss+TJ/YE+pB1h8yBpNHlmQOpL8X5/H8MVZEmi7yN9JsiDnis7TGIvsVoUlmPwKBmH0okNDH
 bzb5RGXFnVO6+tRau1OxqFBCM4aOtiXTIH2N4Sw9J1la7dPgTdsWayK25nF3M7LwR4L8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNRv9-000wkQ-RR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 01:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOJSv5AEO1P0oZySMka50rrSmMrrts/dJHKNuIUqNOo=; b=p0Wf+fyQKYQ+zmCljn+rA0DQl
 8YlfbIoi3u8Tc3vTG6MHb2BO+ialHTOQFunLNZ9gMdwbAMwG6gy6Q/TvM2k3NUvJF7ABzsT3zRfBt
 xcExWeK/TDjIQNu4gvsin8QqUt8gEEGaHXq4Q4dOWbGbrUCSqdKuotJTFmSOWmujaR0ZWYoUppVRK
 hBWeP5HCQRP3zpYSAYFf5HwokDoRdTCXs+lu3HbOGuM9WsaX16oG9zU9j9COwUyeEWDwEkDYjrymV
 kV4QiUrHqqJ4wSjVB3uX/suXqft0eZckiYWyJKyJOya03V/uoD6KUPpcN52hKGhI5zR5uMVawR9G+
 D9uTgaupA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iNRux-00005c-2V; Thu, 24 Oct 2019 01:27:59 +0000
Date: Wed, 23 Oct 2019 18:27:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191024012759.GA32358@infradead.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
 <20191022133001.GA23268@mit.edu>
 <20191023092718.GA23274@infradead.org>
 <20191023125701.GA2460@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023125701.GA2460@mit.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1iNRv9-000wkQ-RR
Subject: Re: [f2fs-dev] [PATCH 1/3] fscrypt: add support for
 inline-encryption-optimized policies
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
Cc: Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> If and when the vaporware shows up in real hardware, and assuming that
> fscrypt is useful for this hardware, we can name it
> "super_duper_fancy_inline_crypto".  :-)

I think you are entirely missing the point.  The point is that naming
the option someting related to inline encryption is fundamentally
wrong.  It is related to a limitation of existing inline crypto
engines, not related to the fudamental model.  And all the other
rambling below don't matter either.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
