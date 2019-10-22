Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 068BAE0876
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 18:15:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMwod-0007HN-VY; Tue, 22 Oct 2019 16:15:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMwod-0007HG-4H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 16:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fkcn/+FPnDLmW3xRlllpDFLClvQht+GCWPUdS3itGIU=; b=gLzdMfGNeghXCzk7WFh6cpIEDN
 Vkyo5S21zGSaUbahQmu4KlnrQRZXpeMC3anVDOfmwddOhdy0QFaT796wFpYs18DER7Fb8LMO6X1ZE
 v2CPkT9wcf0Q8o6Swr2+g42h4BLpdhMGDkDLlTH2B/dzg9jZAiY5WjNELtS+87m1RxLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fkcn/+FPnDLmW3xRlllpDFLClvQht+GCWPUdS3itGIU=; b=IC92ZTZLsJbAjqSVAxvfFUFvVM
 hYbpgNrwMtFzHsHruzUPgU5r8QDW3KNsE4zXAaD2yInvvKY9KLv4VYCisV5MZGrZVn9p3O0RxdOKD
 2BLpxNtqphVtSFHCy9TcfWFjCGlf87YwH+33SdR6EBZGpXG5s4t03M+opZpoYYZ7BOMk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMwoY-00GvI4-9z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 16:15:22 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FF7820B7C;
 Tue, 22 Oct 2019 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571760907;
 bh=jm5gtMdP07KkfSKxsAaLk29QiN6xgSCjIxXzWNwp05Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tw1A3NnYtI/hR1ki4FEWB3YJEGkTwWqRbzz5wAUUuaaqe5I2DkOH6rOIRlPiV6mBp
 8hg+XebiRYNX6glDUPm6qws0Blwt6JXLIz3oSFDdtyOpuwQKfmhQR2xaabA+/vIXu4
 kqEc9MyvQw505uyQ1NTTQjFrmJWMR83hZMwcQRlY=
Date: Tue, 22 Oct 2019 09:15:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191022161504.GA229362@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 Dave Chinner <david@fromorbit.com>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
 <20191022133001.GA23268@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022133001.GA23268@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMwoY-00GvI4-9z
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Dave Chinner <david@fromorbit.com>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 22, 2019 at 09:30:01AM -0400, Theodore Y. Ts'o wrote:
> > An alternative which would work nicely on ext4 and xfs (if xfs supported
> > fscrypt) would be to pass the physical block number as the DUN.  However, that
> > wouldn't work at all on f2fs because f2fs moves data blocks around.  And since
> > most people who want to use this are using f2fs, f2fs support is essential.
> 
> And that is something fscrypt supports already, so if people really
> did want to use 64-bit logical block numbers, they could do that, at
> the cost of giving up the ability to shrink the file system (which XFS
> doesn't support anyway....)

I was talking about the physical block number (offset from the start of the
filesystem -- ext4_fsblk_t on ext4), not the file logical block number (offset
in the file data -- ext4_lblk_t on ext4).  fscrypt doesn't currently support
using the physical block number.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
