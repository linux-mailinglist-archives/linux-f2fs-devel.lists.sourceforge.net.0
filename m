Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188A34ED09
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Mar 2021 18:02:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRGoZ-00082D-0f; Tue, 30 Mar 2021 16:01:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1lRGoG-0007zr-Td
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 16:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdzCFCLMvvg0RnoP86wisrN9O1agsv+ZeQ7KKgGHrn0=; b=XsCw20Xlb7RzGUdbAkHl1rMEOI
 7pc11PHC+ZfsiFrD6zxN5MGS+vRy4sR3BIZ78ulaB0BFFOy60qa3TXthl1EbwMeYJI6/GJg3SiJ4C
 LHdx/93aYOk0xWIaErd/a1XWW6y0MgBcn98Gp1AOlOBSdOCIdmL0hsPoSeFDdHUPbsko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EdzCFCLMvvg0RnoP86wisrN9O1agsv+ZeQ7KKgGHrn0=; b=XbCjAu88TKoNASB0gMN2jRwt6S
 1inqpFR9JLTnoFRj4zPF0yAdPGApF02RyBajLv0FV4OcwbdbFTkEJesirvkdE2xjxDEfkfMHavnv6
 p6DbkGyhoGIUkazd9D5v02W7agVHFwM1HdTX4EN2leXRg67aSjPwtfY64WcFb8TBPPoQ=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lRGo7-00076B-PZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 16:01:40 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 12UG0nHa013090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 12:00:49 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 32C5415C39CD; Tue, 30 Mar 2021 12:00:49 -0400 (EDT)
Date: Tue, 30 Mar 2021 12:00:49 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YGNLMRmr+tQb8WQ3@mit.edu>
References: <20210329204240.359184-1-shreeya.patel@collabora.com>
 <20210329204240.359184-5-shreeya.patel@collabora.com>
 <YGKGhxaozX3ND6iB@gmail.com> <87v999pequ.fsf@collabora.com>
 <YGK7iNRXcMr/ahsL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGK7iNRXcMr/ahsL@sol.localdomain>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lRGo7-00076B-PZ
Subject: Re: [f2fs-dev] [PATCH v5 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: kernel@collabora.com, drosen@google.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, andre.almeida@collabora.com,
 linux-ext4@vger.kernel.org, Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 29, 2021 at 10:47:52PM -0700, Eric Biggers wrote:
> > Isn't this a user problem?  If the modules required to boot are on the
> > filesystem itself, you are in trouble.  But, if that is the case, your
> > rootfs is case-insensitive and you gotta have utf8 as built-in or have
> > it in an early userspace.
> 
> We could make it the user's problem, but that seems rather unfriendly.
> Especially because the utf8 module would be needed if the filesystem has the
> casefold feature at all, regardless of whether any casefolded directories are
> needed at boot time or not.  (Unless there is a plan to change that?)

I guess I'm not that worried, since the vast majority of desktop
distribution are using initial ramdisks these days.  And if someone
did build a monolithic kernel that couldn't mount the root file
system, they would figure that out pretty quickly.

The biggest problem they would have with trying to enable encryption
or casefolding on the root file system is that if they are using Grub,
older versions of Grub would see an unknown incompat feature, and
immediately have heartburn, and refuse to touch whatever file system
/boot is located on.  If the distribution has /boot as a stand-alone
partition, that won't be a problem, but if you have a single file
system which includes the location of kernels and initrds' are
located, the moment you try set the encryption or casefold on the file
system, you're immediately hosed --- and if you do this on a laptop
while you are on an airplane, without thinking things through, and
without access to a rescue USB thumb drive, life can
get... interesting.  (Why, yes, I'm speaking from direct experience;
why do you ask?  :-)

So in comparison to making such a mistake, building a kernel that was
missing casefold, and needing to fall back to an older kernel is not
really that bad of a user experience.  You just have to fall back the
distro kernel, which most kernel developers who are dogfooding
bleeding kernels are probably smart enough keep one around.

We *could* teach ext4 to support mounting file systems that have
casefold, without having the unicode module loaded, which would make
things a bit better, but I'm not sure it's worth the effort.  We could
even make the argument that letting the system boot, and then having
access to some directories return ENOTSUPP would actually be a more
confusing user experience than a simple hard failure when we try
mounting the file system.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
