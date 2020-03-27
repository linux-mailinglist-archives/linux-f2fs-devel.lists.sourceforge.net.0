Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF41195BC5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Mar 2020 18:01:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHsLt-0001BR-36; Fri, 27 Mar 2020 17:01:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+db0fc927f0092e366218+6060+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jHsLs-0001BK-7T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Mar 2020 17:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y4jqMXMuSCLjtxZfZUroyV7Ldlb0usNsMs0ZoH+IuWE=; b=kgBNZiZfW4sFbaLmdIBt9t1s4c
 PEjBK2eHXARJ1uqdFH/EQmeKv7t2cO3Pt821DFQQaG96ckqn26GC6m8ut+FRzG3o82DpzhYtw0SI/
 +k5mMbBaPvNcBtDKdWDu4zYWp1l8kstkFrMBOuSSpkazSGTx7T11b162CEKpqrHkgk8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y4jqMXMuSCLjtxZfZUroyV7Ldlb0usNsMs0ZoH+IuWE=; b=UXzDphoDzPVwqCQZPlrsybA8Zd
 20pcxrdZdzbT+IDbh7DOHw8TGeCE2gFYtBQLEyj1eUwcxZwvHIiKWw2sLuj6u8Ml9rkk6fb2Im8G1
 BbhEauIFI1gKH0uYIAQibSQID0QE2DlWP4u/u0YT2R5ycZ30REaIegLIoCw/tKjWn5LE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHsLq-006bzE-PD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Mar 2020 17:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y4jqMXMuSCLjtxZfZUroyV7Ldlb0usNsMs0ZoH+IuWE=; b=etdXQcPbKq+hMTQy1uJbrj3Dwy
 S43mHrDmjodUSCeE2wcyLdiTBbZJji4+WjPE4HUq2bPN515bISs4fQbf8iy6g0GnC/kLmQW2umQoC
 MMfuXv8wpvN7PtMkMYIwpWJvRGQiwaX1yPIpaph27QJWiwOSxDnwSbMAQjDDsV452yNDgMra3H2br
 HJZU6dXL+GOF5RIelMf0M3qQXd0XOSSLEIN61bYpPNgi7M0qZjp8iQxaFKDqzCCUi5yYZQRjdIg7S
 R+6EFzJShR0M2/KGokbmRcDYGxefBu/VbHisjiZ965IiOWNK1hBiGOpezrfse89/d53XlYXi4+ZO5
 cdtm2WfQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHsLf-00084s-Sa; Fri, 27 Mar 2020 17:00:47 +0000
Date: Fri, 27 Mar 2020 10:00:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200327170047.GA24682@infradead.org>
References: <20200326030702.223233-1-satyat@google.com>
 <20200326030702.223233-2-satyat@google.com>
 <20200326062213.GF858@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326062213.GF858@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHsLq-006bzE-PD
Subject: Re: [f2fs-dev] [PATCH v9 01/11] block: Keyslot Manager for Inline
 Encryption
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
Cc: linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 25, 2020 at 11:22:13PM -0700, Eric Biggers wrote:
> > +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> > +	/* Inline crypto capabilities */
> > +	struct blk_keyslot_manager *ksm;
> > +#endif
> 
> I do still wonder whether the concept of inline crypto support should be more
> separated from keyslot management, to be better prepared for device-mapper
> passthrough support and for hardware that accepts keys directly.  (Such hardware
> exists, though I'm not sure support for it will be upstreamed.)  For example,
> the crypto capabilities could be stored in a 'struct blk_crypto_capabilities'
> rather than in 'struct blk_keyslot_manager', and the latter could be optional.
> 
> What you have now is fine for the functionality in the current patchset though,
> so I'm not really complaining.  Just something to think about.

I'd rather keep things simple (aka as-is) for now.  If needed we can
change it. I doubt we'll even have a handful drivers with inline
crypto in the next years..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
