Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4365957C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Dec 2022 07:39:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pB93E-00042K-O5;
	Fri, 30 Dec 2022 06:39:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pB93C-00042D-Tw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Dec 2022 06:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpr7tPAz+dbyO5abA0tFiZYc5iQHw/yaPOzQVoBUqnY=; b=OpaAhpc+ZALcgp5aBkEgtk/Gs/
 QwlbBDtvnU1HHT/eBhmHzBAOzbWQY/JIF7eoz3a5J/DP9bdRKUnnwU74blCCKfm+fAJLZO1MTpztL
 VfpIdFNtp0v/2plDkfQZ0OzTi7xRcDFT9rpf98w9aTMSKOxuIDKltG1aLp9SEAU9N2iI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qpr7tPAz+dbyO5abA0tFiZYc5iQHw/yaPOzQVoBUqnY=; b=CNeEuDryzZYQsIR846K492nskI
 MMMYM4J83T9g1P0gbIEb7UON/pv7oTbs/80KEYXmaCnHL7V7VPEgcP7GFUR/TlwF9luh9TP1QuX9K
 9JoxsOf4aW3bJG6kp6UjQSAmh3xAUW9h9fOHVBHZiIqZxJj1fgfA2xPGcUJJzlOH7ywk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pB937-0003GL-5A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Dec 2022 06:39:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD97DB81ACE;
 Fri, 30 Dec 2022 06:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371DAC433EF;
 Fri, 30 Dec 2022 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672382357;
 bh=q8wxwX0wZcFLGiE0Owq5Y55vjOPnnvuF0IJnjlUHQQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E1QqX7mvBwvtYiYgzlRKkx5+AdvXwNKskV3hb9gbn7BlLtvHHgNkDaGINPa0KOFTp
 Kz6m0liioTY55DRPiX80Ya8/CZqDPG++A9ZtT85jub05Eo90wr0krBVKPsGgCnFCqB
 p4zmHmuBtRHIUAEwecBLrnlOtbU53Y+XKWpkBPwzkUGwZW+BZoP0fh11FtIJuRQZhT
 ECO5b15lPjeo7pMZVkHwuCVuNDp5XD0qn8Dj7XVcGsUKBxDGXtCRGdKHTfWH34aJTU
 tmgTufFBfcLc3p8nCHk2RYwoeub31f0ynX4EjSQQC8IyWDvoLZ2IYKWrjpxUs31mJ6
 jmaQLdRjXK5Yw==
Date: Thu, 29 Dec 2022 22:39:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Message-ID: <Y66Hk6waTeXQDz1/@sol.localdomain>
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me>
 <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 30, 2022 at 06:56:36AM +0100, Thorsten Leemhuis
 wrote: > On 30.12.22 05:04, Jeff Chua wrote: > > On 12/24/22 19:43, Bagas
 Sanjaya wrote: > >> On Sat, Dec 24, 2022 at 01:48:55PM +0800, Jeff [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pB937-0003GL-5A
Subject: Re: [f2fs-dev] Fwd: f2fs write error Linux v6.2
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Jeff Chua <jeff.chua.linux@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 30, 2022 at 06:56:36AM +0100, Thorsten Leemhuis wrote:
> On 30.12.22 05:04, Jeff Chua wrote:
> > On 12/24/22 19:43, Bagas Sanjaya wrote:
> >> On Sat, Dec 24, 2022 at 01:48:55PM +0800, Jeff Chua wrote:
> >>> Got the following error in latest linux-6.2-git with just vim (:w
> >>> file1). No problem with linux-6.1.1
> > 
> > What happened to the f2fs developers? No response from anyone yet.
> 
> Well, that indeed is unfortunate and ideally shouldn't happen, but the
> simple reality is: that can happen this time of the year due to this
> thing called "festive season".
> 
> > Am
> > I the only one facing this? Linux-6.2 is unusable until this is fixed.
> > What can I do to help?
> 
> The usual: bisect the issue, as then (a) we know exactly which developer
> caused it, (b) which subsystem/maintainer is responsible (issues in a fs
> might be caused by the VFS, block layer, mm, ...), and (c) might be able
> to quickly revert that culprit, even if the people normally responsible
> are MIA for some reason.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
> 

FWIW, I've tested f2fs on mainline in the last few days, and I haven't seen
this.  The following works fine, for example:

    mkfs.f2fs -f /dev/vdb
    mount /dev/vdb /mnt
    vim
    # write something, then ':w /mnt/file'

If you could provide the mkfs and mount options you are using, and any other
relevant details, that would be helpful.  Bisection would also be very helpful,
as Thorsten mentioned.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
