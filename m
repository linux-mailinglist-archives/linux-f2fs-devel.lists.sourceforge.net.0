Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342622A28E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 00:44:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyNTf-0007Cv-Vu; Wed, 22 Jul 2020 22:44:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jyNTQ-0007CS-Vr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 22:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1S5XB5jiOs5OBOB/2wH4SZBx30nFn9Ws/CcKpaLIvw=; b=MHWIW6/wWal/f5UGnvmdcjgIS9
 iD3EvccHLpvuYXxxzM+DmMtQI5iEBBWp2pcClInQUktQJnnCdsG8Sq67whfUuh/vLRuHkWJS7PNj/
 hH5rvntPy4gw/bYkXOzbbs9cznyeSoTxKFx/3P0s9qpbvD0zh5IbZwho1VRXwCwYhXrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M1S5XB5jiOs5OBOB/2wH4SZBx30nFn9Ws/CcKpaLIvw=; b=IlKxS9kVwDE0GkVHyHlcV1TMq6
 hJh9lDVIQW7AN+fg7f+0BlEGMx4/WODxySwitvYKsLFOybQe7w1b0Dbo4NeaZEqlWlkNUQiG3DSaR
 Dac7TkAOO4ax1qNsDLb66ST3D4PXEBtlbU4509u//RE3iCgHN3vCCIluGmQxgItmEz20=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyNTP-00E8UT-8W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 22:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M1S5XB5jiOs5OBOB/2wH4SZBx30nFn9Ws/CcKpaLIvw=; b=Vk6TjZt44S+/o/6Za+Yv8f+njY
 HByLP468kZDGhNcS1rfX0KpYuV5q+9yAZdxTk2zCbasyjrcuzHK1ql0TqJnEOCKG1qmX38vWiIf3y
 anIhRutn1IkLiYU2CX13chtoOhugQ9623I/k3Bgc54XywPpW05WhcM8cu/kvK8VHohtCLFF/fyeLv
 DnB4vDru6uXeWEYNCJWxMlXp15X41KriDq9C6mt3VV7kq5oYEclCox3a3nFCgh/LhDRjvErgVkMob
 gKUJx5RUghjFtfTVXD6EadMlsi29AnTVT1WT0L4UOwu27vikJZkKvWaN/izhcaXw++r3sG5Gbs/aK
 GtGsxJxg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jyNT5-0005no-5i; Wed, 22 Jul 2020 22:44:07 +0000
Date: Wed, 22 Jul 2020 23:44:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200722224407.GR15516@casper.infradead.org>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722223404.GA76479@sol.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jyNTP-00E8UT-8W
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 22, 2020 at 03:34:04PM -0700, Eric Biggers wrote:
> > Which means you are now placing a new constraint on this code in
> > that we cannot ever, in future, zero entire blocks here.
> > 
> > This code can issue arbitrary sized zeroing bios - multiple entire fs blocks
> > blocks if necessary - so I think constraining it to only support
> > partial block zeroing by adding a warning like this is no correct.
> 
> In v3 and earlier this instead had the code to set an encryption context:
> 
> 	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
> 				  GFP_KERNEL);
> 
> Would you prefer that, even though the call to fscrypt_set_bio_crypt_ctx() would
> always be a no-op currently (since for now, iomap_dio_zero() will never be
> called with an encrypted file) and thus wouldn't be properly tested?
> 
> BTW, iomap_dio_zero() is actually limited to one page, so it's not quite
> "arbitrary sizes".

I have a patch for that

http://git.infradead.org/users/willy/pagecache.git/commitdiff/1a4d72a890ca9c2ea3d244a6153511ae674ce1d8

It's not going to cause a problem for crossing a 2^32 boundary because
pages are naturally aligned and don't get that big.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
