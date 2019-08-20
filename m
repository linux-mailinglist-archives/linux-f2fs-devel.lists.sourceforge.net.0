Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C5966A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 18:42:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i07Co-0006Xh-8S; Tue, 20 Aug 2019 16:41:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1i07Cm-0006XM-7l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 16:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=onBTP92XmzoSw0uJfNa+XH9A9VLRv0aIT28vfGRmLHU=; b=LSIc43gIK6R2KqZ7099Pfw3aV1
 i4XNlhUsV6Enb8YNSqmsKcf6HTX0zQOHQUSX7mUEyaxljctppoG5kcj7WN30AwBd3ampl5v5gJylk
 yOKKWScLqJy55xsV5NNoBLMtM7ybPbUJXUiKJmOU8RROnI3u/l0bmwHYkWP9vsCmtos4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=onBTP92XmzoSw0uJfNa+XH9A9VLRv0aIT28vfGRmLHU=; b=U1MEMUsOYhf4NTmAB/6jpy03uN
 8NrePYN7btJdDc3jMsBuPvGZ6B630OhpVUtxOvK9jpYp3Bl1NSHYjVZZmDrAtzvTkowReYRFvtOlD
 XvR0ExZbEks0g2NG2WWm1ox4cAtc33xFaRzTuJwPqiJycnNhaLaI6G0/nBjI7ofjuygM=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i07Ck-00AAVT-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 16:41:56 +0000
Received: from callcc.thunk.org (wsip-184-188-36-2.sd.sd.cox.net
 [184.188.36.2]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7KGcboC007051
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 12:38:39 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 4B96E420843; Tue, 20 Aug 2019 12:38:37 -0400 (EDT)
Date: Tue, 20 Aug 2019 12:38:37 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Chandan Rajendra <chandan@linux.ibm.com>
Message-ID: <20190820163837.GD10232@mit.edu>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
 <1652707.8YmLLlegLt@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1652707.8YmLLlegLt@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1i07Ck-00AAVT-Bd
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
 ebiggers@kernel.org, linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 20, 2019 at 10:35:29AM +0530, Chandan Rajendra wrote:
> Looks like F2FS requires a lot more flexiblity than what can be offered by
> read callbacks i.e.
> 
> 1. F2FS wants to make use of its own workqueue for decryption, verity and
>    decompression.
> 2. F2FS' decompression code is not an FS independent entity like fscrypt and
>    fsverity. Hence they would need Filesystem specific callback functions to
>    be invoked from "read callbacks". 
> 
> Hence I would suggest that we should drop F2FS changes made in this
> patchset. Please let me know your thoughts on this.

That's probably the best way to go for now.  My one concern is that it
means that only ext4 will be using your framework.  I could imagine
that some people might argue that should just move the callback scheme
into ext4 code as opposed to leaving it in fscrypt --- at least until
we can find other file systems where we can show that it will be
useful for those other file systems.

(Perhaps a useful experiment would be to have someone implement patches
to support fscrypt and fsverity in ext2 --- the patch might or might
not be accepted for upstream inclusion, but it would be useful to
demonstrate how easy it is to add fscrypt and fsverity.)

The other thing to consider is that there has been some discussion
about adding generalized support for I/O submission to the iomap
library.  It might be that if that work is accepted, support for
fscrypt and fsverity would be a requirement for ext4 to use that
portion of iomap's functionality.  So in that eventuality, it might be
that we'll want to move your read callbacks code into iomap, or we'll
need to rework the read callbacks code so it can work with iomap.

But this is all work for the future.  I'm a firm believe that the
perfect should not be the enemy of the good, and that none of this
should be a fundamental obstacle in having your code upstream.

Cheers,

					- Ted




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
