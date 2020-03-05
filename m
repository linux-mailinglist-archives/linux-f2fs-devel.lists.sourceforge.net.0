Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3DB17AA3C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Mar 2020 17:11:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j9t6H-00069C-4i; Thu, 05 Mar 2020 16:11:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+f57f9490110fc31f28f2+6038+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j9t6F-000691-5V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 16:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uen6VLar276Fa0qz/XOKv1RvuUuLbo9suzCz5NScJNI=; b=O8cG9R6AV28MqeQKZXmQzo2xMJ
 z+LdwQeeffVC1KA0Ha9PX2IMUkMqQV/tbnjX8kNvmR/Q6bbnBCN3fqocq0qHkSLVAeOzujb8wvLUY
 CWsB3mPim+vwl+MkBIie6mg9ghEcBEOESEhDQ8EWPxm/oyxoIT5A1unLDI4lnWe/kGwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uen6VLar276Fa0qz/XOKv1RvuUuLbo9suzCz5NScJNI=; b=SCYOWrb78a9Wgaz1lGkhWWCtQx
 DqrlGas0OA0oBnO30vbotnZKGvy/HV6Q4o28cmbtEq7UNSHkAYdwljakxC0KMSHvGhZlEwvGchReL
 qz4+Oa1GFm+V24EelJ0HBahfYdtYM4Eyn0AI85AIH7SHLrIXvoZiSDismZF7qj9lZvZI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j9t6C-000ITT-4F
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 16:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Uen6VLar276Fa0qz/XOKv1RvuUuLbo9suzCz5NScJNI=; b=tow7fovI56zU/zHIFBvyQFjPvu
 oxu7I0rkCiFvKuf0jEyycgSOkgif2ymuw5tLBs0Iv2NiEPVqH11+DMB5tD5Y1H5n5aG/6Y8W7Z8/g
 I9rzwwornx2tBwTtWTg7Jy50rRRciiS730r/9jfMQuw/uB3cN+ipx7Q+YO+vTUh+5OgwpnmMwOvPd
 xjsFxPMQlR8JlJEeUjcvs7Uk/1Dg1af47nYqVfza4SpnXum9WuKlu4VGLvQsHemNL/GQhsJkzwJID
 JJsVbxURX6EkP2HNco5kV4mp9mkq4B9IciJaI9mhKj378teu4MbbrEbnSAeqCsMgEfix3nL3UWdSI
 wvQ8JOIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j9t63-00054F-6B; Thu, 05 Mar 2020 16:11:39 +0000
Date: Thu, 5 Mar 2020 08:11:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200305161139.GA19270@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-2-satyat@google.com>
 <20200221170434.GA438@infradead.org>
 <20200221173118.GA30670@infradead.org>
 <20200227181411.GB877@sol.localdomain>
 <20200227212512.GA162309@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227212512.GA162309@google.com>
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
X-Headers-End: 1j9t6C-000ITT-4F
Subject: Re: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 27, 2020 at 01:25:12PM -0800, Satya Tangirala wrote:
> I think it does make some sense at least to make the keyslot type opaque
> to most of the system other than the driver itself (the driver will now
> have to call a function like blk_ksm_slot_idx_for_keyslot to actually get
> a keyslot number at the end of the day). Also this way, the keyslot manager
> can verify that the keyslot passed to blk_ksm_put_slot is actually part of
> that keyslot manager (and that somebody isn't releasing a slot number that
> was actually acquired from a different keyslot manager). I don't think
> it's much benefit or loss either way, but I already switched to passing
> pointers to struct keyslot around instead of ints, so I'll keep it that
> way unless you strongly feel that using ints in this case is better
> than struct keyslot *.

Exactly.  This provides a little type safety.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
