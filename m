Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E36191A6B1F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2020 19:15:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jO2g4-0008EK-HL; Mon, 13 Apr 2020 17:15:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jO2g2-0008E3-J5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Apr 2020 17:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3/6fTazW5TwI9kqhXT3ROa7AvzrLO9qcOZyRWPPPIMg=; b=lkiXbsqE6+FwwpiMl9b9bjnUsI
 KaAPqWJzDXOOjkHunCqVbE8Cn0qm8wyhNWBhaYxIhIchlSkQwTbWEQ05GNcALKO/hnEyu+DxrfHNC
 az+Oy3adgWm4ZGqzL7oavk1YyTPlxPyLFEaXTGG1SlNl/QOsVom5xLcWn9SaWKLVvp6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3/6fTazW5TwI9kqhXT3ROa7AvzrLO9qcOZyRWPPPIMg=; b=Fw+D9tOEAOSa94Q03RXI8HLyck
 dqvgovzL6gTq+tdcj4FWYdSI6T5bQFKF5+7m8wVdQwWYkF9C7kNRZ00D9W+zzXzUAOgKZE9jCeYp2
 +jDVGdV7K5Nmw1/Kasm1Pxnsen/jBonQl2EYH67DD5wHk3Qdt/R/AZuaprPXoMgsNyHQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jO2g1-00HSv6-B0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Apr 2020 17:15:18 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F6DF2072C;
 Mon, 13 Apr 2020 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586798110;
 bh=hKWDdxtiuMsT+aX4yKXVRSPwG0mqJ5XXelD9/99n/vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=McryodrYcJ4V5BQLuRLAchOaXtkTzZYjxDNNBMeiZazGSAs0CKaF8zB1ccKfugfOI
 jIhByQRjj+cue8zhOOA34r5z9+PG7H+neqclNZOIDZtGZEHP2cdHO1n02dYhPTJpmt
 WHZvB78gfH4NVMGF3LzkXRY32iOZLQ7gcwalyjPs=
Date: Mon, 13 Apr 2020 10:15:09 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: ericonr@disroot.org
Message-ID: <20200413171509.GB39092@google.com>
References: <ecfeeb92efb299cce883d25a4669fbd5@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecfeeb92efb299cce883d25a4669fbd5@disroot.org>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jO2g1-00HSv6-B0
Subject: Re: [f2fs-dev] f2fs-tools: Question about mkfs and fsck behavior
 for documentation purposes
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 04/09, ericonr@disroot.org wrote:
> Hi there!
> 
> I'm working on the man pages and usage messages of the various f2fs
> tools, to make them more descriptive and correspond better to what the
> code is doing.  So I'm hunting around the f2fs-tools tree to try to
> understand things, but I'd like to confirm some ideas I have.
> 
> - Inside mkfs, the overprovision percentage is either provided by the
> user (-o option) or determined by the program.  The current usage text
> says the default is 5. Should I remove this default to make it clear
> that if no percentage is provided, it is determined at runtime?

Yes, exactly. We need to remove the default value, 5.

> 
> - For the -c option in mkfs, it says there's a maximum of 7 additional
> devices, except for "meta devices". What is a meta device? Given that
> the code for parsing arguments passed to -c doesn't seem to
> distinguish between meta or normal devices, can I remove this part of
> the text?

Yes, I think it should be better to remove it.

> 
> - The verity feature has a "Reserved" comment next to it, but it is used
> by the Android default options. Should I therefore not document it in
> the options for -O?

Agreed.

> 
> - I documented the -g option as "Add Android default options". Is there
> a better description for it?

This is useful for Android build, since we don't need to change here and
there in AOSP when we want to add a new option.

> 
> - mkfs uses -e and -E to specify the file extensions for cold and hot
> files. Is there anywhere I can find a small explanation of what these
> features mean to include in the man pages? I kind of understood that
> they differ in what the filesystem expects will be their lifetime and
> access patterns, but I don't know how to communicate this adequately.

Once mkfs sets the extension list of hot and cold files, f2fs will 1) load
the list when mounting the disk, 2) set appropriate flag when creating files
according to the file name extension, 3) store all the data into hot or cold
logs separately per file temparature. This can give spatial as well as temporal
localities on top of the storage space.

> 
> - fsck, during the feature parsing phase, doesn't seem to pass any
> specific argument to  parse_feature(). Does that mean all extra
> features can be enabled by fsck, even if they weren't enabled when the
> filesystem was created?

tune_sb_features() will finally check whether new feature can be settable.
And, encryption and casefold are only allowed.

> 
> More generally, I've fixed a few typos along the way as well. Is it ok
> if I put everything together into a single commit when I make a patch?

Sure.

> 
> Another question regarding preferences: both here and in the
> documentation of other tools like mkfs.ext4, "filesystem" is written all
> together and as "file system". Is there any preferred spelling for new
> content?

It'd be great to have "filesystem" in all places.

Thank you so much for the hard work. :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
