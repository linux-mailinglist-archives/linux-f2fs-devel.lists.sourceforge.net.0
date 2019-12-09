Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E29181179A4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:46:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRnQ-0005vn-S7; Mon, 09 Dec 2019 22:46:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieRnP-0005ve-75
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U40sVV4frHjBOQ+84CrHwqht9K36XVfTUFq39yidIks=; b=MOHAqJI6UbJX+vDerF42Tla4PO
 0kGw9/qdcYyZgU2n1CE7MXlBwfUFFoQwd5F9qhKsNWSjjAEXmwpv35B/Ku3UWAwoH8FVE5G84htuF
 b8gL3PKPFk1dRDu9Hw0K501bpzeUZZdrfjSsPpcc7O9fhgcusYeOVTr+mgGKGgWlUOg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U40sVV4frHjBOQ+84CrHwqht9K36XVfTUFq39yidIks=; b=jcO2362WRqgEbf8VvnS+CtQ8m/
 b8K5U22LGOKZNnnnENQHlNuc1pz6peTlCZwknIUvxR4Y1qhLzfcfXBVgWVG0x6nIeYTh045j08kHk
 jm4nJXxTQTKrmRFS2TVssgEhoPcO/m3WN75w+sSnKXpOmrE6NeX1FpmYP70FTjLosxjE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRnO-00Fvxa-0P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:46:27 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5788D206E0;
 Mon,  9 Dec 2019 22:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575931580;
 bh=0AgztB5XCqmGtl8eo6+glDUwMI+RvTnl2/qdjaplZQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WqkalGHrgltNsOu6+hiuv7xTH0WqWn5oPt/Bt4UEfu7WAR5nfOE2X3jZ7ekt7/4iC
 3p86DBIKDQVKGwmsEEe/Q/NVB3PgSZbMAqWY1VseDYAAbQY8W2a4qEFdYCHpnuqmdg
 u1JY2+2DkYPpxe8dAUlgyiFGcibHsrapA6Ai4XjE=
Date: Mon, 9 Dec 2019 14:46:15 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ju Hyung Park <qkrwngud825@gmail.com>
Message-ID: <20191209224615.GB798@jaegeuk-macbookpro.roam.corp.google.com>
References: <CAD14+f0rw8wUBsN9Cs3Nrp03g40qOk_7AnrOiVSN98d5Ec7PsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f0rw8wUBsN9Cs3Nrp03g40qOk_7AnrOiVSN98d5Ec7PsQ@mail.gmail.com>
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
X-Headers-End: 1ieRnO-00Fvxa-0P
Subject: Re: [f2fs-dev] f2fs: How should I use the defragmentation tools?
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

Hi Ju Hyung,

On 12/10, Ju Hyung Park wrote:
> Hi everyone.
> 
> I've had interests in defragging f2fs for a long time now.
> 
> https://www.usenix.org/system/files/conference/atc17/atc17-hahn.pdf
> This paper proves that defragmentation caused from the filesystem
> takes a big portion of performance degradation.
> (It'd be interesting to see whether f2fs would behave differently from
> ext4 in terms of fragmentation.)
> 
> While doing defragmentation on a production device currently poses a
> lot of practicality issues, I'd still like to try them out for
> educational purposes.
> 
> However, I'm still not sure how to do defragmentation while f2fs
> having 2 tools for that purpose.
> 
> 1. Is either of `defrag.f2fs` or `f2fs_io defrag_file` meant to be
> feature-parity with e4defrag?

The defrag.f2fs is a tool to conduct runtime GC in user land,. IOWs, it'll
migrate source range of blocks to target range of blocks directionally.
OTOH, f2fs_io defrag_file is runtime ioctl to gather allocated blocks
given file descriptor, which is more like e4defrag, IIUC.

> 
> 2. What's the expected output from `defrag.f2fs` and `f2fs_io
> defrag_file`? I'd like to get example outputs from you guys for me to
> compare.

The defrag.f2fs will reduce # of dirty segments. The f2fs_io defrag_file will
arrange more consecutive blocks allocated to the file; it doesn't guarantee
whole blocks are sequential explicitly since it reads and writes back shortly
to get spatial locality.

> 
> 3. Is `defrag.f2fs` and `f2fs_io defrag_file` tested thoroughly?
> Should I expect any potential corruptions from running these?

The defrag.f2fs uses part of block migration flow which was used for sload.f2fs,
while f2fs_io defrag_file uses general writeback. So, the risk would be small.

> 
> 4. `defrag.f2fs` seems to only work on an unmounted block device.
> What's the intended use-case scenario for this? I'm assuming running
> `defrag.f2fs` and feeding the entire block length to -l is not how
> it's meant to be used.

It gives a way to decrease # of dirty segments.

> 
> 5. Why did you make it mandatory for the users to supply the lengths
> to `f2fs_io defrag_file`? Is it any practical to defrag a part of a
> file?

Yup.

> 
> 6. How exactly should I run `f2fs_io defrag_file`? My following
> attempts failed with -EINVAL:

Is this cold file by ".pdf"?

> # ls -al session-02.pdf
> -rw-rw-r--. 1 1023 1023 30517375 Nov  7 21:10 session-02.pdf
> # f2fs_io defrag_file 0 30517375 session-02.pdf
> F2FS_IOC_DEFRAGMENT failed: Invalid argument
> # f2fs_io defrag_file 0 1048576 session-02.pdf
> F2FS_IOC_DEFRAGMENT failed: Invalid argument
> 
> Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
