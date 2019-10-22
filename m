Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E5E0500
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 15:30:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMuF0-0008Nk-61; Tue, 22 Oct 2019 13:30:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iMuEz-0008NQ-5C
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 13:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zf5WAT/rodrig6SQ0X30l84kceZbfAM0si3X7WC0CZo=; b=FYq9skpb+YWzzQ3jo+st749Ebc
 vjdDgSUkzNIYyM4WGIczxYdapWhzeqpwoqro14gRhcj/mDmIxMizweDAF2/yrqRSIFKDWvzp15+ds
 WNf0G8phc28qIjUg8EbzkfRJ0/JLX4iQYXy075xbn64RXoAPTT8XqQlZH3p6y6W+isVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zf5WAT/rodrig6SQ0X30l84kceZbfAM0si3X7WC0CZo=; b=XD2PJHw08Hl72O6Rn3M5JEw1It
 ffGcvMRdvtfGuQ9F/ZYISKivltb1lhmDm5NQziamI6KTkdNC+avePL3cy6kyWeJVhjV6N5r3NMwuB
 XSmvvM12olcfhX97V22ZZi7ppoCJQA4i6NOtO7fn7VoiCie3VSsi34g+WJ2quAEC3ewA=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMuEw-00BUZR-IN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 13:30:25 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9MDU3no022015
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 09:30:04 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id E1AD6420456; Tue, 22 Oct 2019 09:30:01 -0400 (EDT)
Date: Tue, 22 Oct 2019 09:30:01 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Dave Chinner <david@fromorbit.com>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191022133001.GA23268@mit.edu>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022060004.GA333751@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
X-Headers-End: 1iMuEw-00BUZR-IN
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 21, 2019 at 11:00:04PM -0700, Eric Biggers wrote:
> That won't work because we need consecutive file blocks to have consecutive IVs
> as often as possible.  The crypto support in the UFS and EMMC standards takes
> only a single 64-bit "data unit number" (DUN) per request, which the hardware
> uses as the first 64 bits of the IV and automatically increments for each data
> unit (i.e. for each filesystem block, in this case).

It seems very likely that for systems that are using UFS and eMMC
(which are overwhelming lower-end devices --- e.g., embedded and
mobile handsets) 32-bit inode and logical block numbers will be just
fine.

If and when we actually get inline crypto support for server-class
systems, hopefully they will support 128-bit DUN's, and/or they will
have sufficiently fast key load times such that we can use per-file
keying.

> An alternative which would work nicely on ext4 and xfs (if xfs supported
> fscrypt) would be to pass the physical block number as the DUN.  However, that
> wouldn't work at all on f2fs because f2fs moves data blocks around.  And since
> most people who want to use this are using f2fs, f2fs support is essential.

And that is something fscrypt supports already, so if people really
did want to use 64-bit logical block numbers, they could do that, at
the cost of giving up the ability to shrink the file system (which XFS
doesn't support anyway....)

							- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
