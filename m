Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9469679D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 19:31:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i07yf-0005nc-T9; Tue, 20 Aug 2019 17:31:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i07yd-0005nU-Nt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 17:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D/olYTfWk0wRjQA6NxD2hVBCAmBQq69yH3eqzSV6vEY=; b=cE+C4Nr4UUOCt4UUHQ9LCn58nC
 r5g0rKoj6HB9qgNcNq3oVg8VCrgCMg10j3r2Fr7FK9jWr2CJ3X5HVPjpCDo8XKoafqHxR6HH2kNNT
 1Y0oPpFg36TFlWaR7spJtQ8dITJJnmZEExSYoPg7kojUIk511XrZVUA0Ujra9ctRHDK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D/olYTfWk0wRjQA6NxD2hVBCAmBQq69yH3eqzSV6vEY=; b=CY8+D+hMJ2i5waG0UbqSjsrtaC
 S0u7WW4imsHHEsfy2DB2PfcXgZlMLI5/tIsaFuBroyPpy3K9pktdBvjssuCmMh1UEAR9MPV3ENnrs
 y4YyhjvdGvSrr920nVIWYtAoftG6F5uiIk7wCaPZjlg95FSXg1W9OW0472YiS9r7dxvc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i07yc-009jWv-H0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 17:31:23 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA7F9206DF;
 Tue, 20 Aug 2019 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566322276;
 bh=xchQBhCrLDaryEtWVa7H/buI3AaIEZHu2PtVlis3tCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EALnhDjg14LpO0z6cXs41pGJl7VFZngK162MACYic3kP6I//VLW2CmWhxhuzm0c6H
 wcvyfirgB/snkOQx4T15wm1bmb9l4uIsgtgzjBZ+9/uEO0LGb8H/igXp4ZS938r7Xf
 hjpdWBYQLCRV1iQNAm+ZeItii52405uPaddS2Xug=
Date: Tue, 20 Aug 2019 10:31:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190820173116.GA58214@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
 <1652707.8YmLLlegLt@localhost.localdomain>
 <20190820163837.GD10232@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820163837.GD10232@mit.edu>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i07yc-009jWv-H0
Subject: Re: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for
 decrypting file data
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
Cc: hch@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fscrypt@vger.kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chandan,

On 08/20, Theodore Y. Ts'o wrote:
> On Tue, Aug 20, 2019 at 10:35:29AM +0530, Chandan Rajendra wrote:
> > Looks like F2FS requires a lot more flexiblity than what can be offered by
> > read callbacks i.e.
> > 
> > 1. F2FS wants to make use of its own workqueue for decryption, verity and
> >    decompression.
> > 2. F2FS' decompression code is not an FS independent entity like fscrypt and
> >    fsverity. Hence they would need Filesystem specific callback functions to
> >    be invoked from "read callbacks". 
> > 
> > Hence I would suggest that we should drop F2FS changes made in this
> > patchset. Please let me know your thoughts on this.
> 
> That's probably the best way to go for now.  My one concern is that it
> means that only ext4 will be using your framework.  I could imagine
> that some people might argue that should just move the callback scheme
> into ext4 code as opposed to leaving it in fscrypt --- at least until
> we can find other file systems where we can show that it will be
> useful for those other file systems.

I also have to raise a flag on this. Doesn't this patch series try to get rid
of redundant work? What'd be the rationale, if it only supports ext4?

How about generalizing the framework to support generic_post_read and per-fs
post_read for fscrypt/fsverity/... selectively?

Thanks,

> 
> (Perhaps a useful experiment would be to have someone implement patches
> to support fscrypt and fsverity in ext2 --- the patch might or might
> not be accepted for upstream inclusion, but it would be useful to
> demonstrate how easy it is to add fscrypt and fsverity.)
> 
> The other thing to consider is that there has been some discussion
> about adding generalized support for I/O submission to the iomap
> library.  It might be that if that work is accepted, support for
> fscrypt and fsverity would be a requirement for ext4 to use that
> portion of iomap's functionality.  So in that eventuality, it might be
> that we'll want to move your read callbacks code into iomap, or we'll
> need to rework the read callbacks code so it can work with iomap.
> 
> But this is all work for the future.  I'm a firm believe that the
> perfect should not be the enemy of the good, and that none of this
> should be a fundamental obstacle in having your code upstream.
> 
> Cheers,
> 
> 					- Ted
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
