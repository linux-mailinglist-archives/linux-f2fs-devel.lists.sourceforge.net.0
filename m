Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D659A90B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:10:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPB7t-0007ct-Fd;
	Fri, 19 Aug 2022 23:10:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oPB7s-0007cm-0T
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/YRGxkqHSLLsDGMtIChnYKj97ZLW6WRE354eChmvAlM=; b=Aj/9+6QXW0h3+wuPP5kFLkqwQd
 wq7JIZV8IUvOhzCQjtDqU7ZhdjXS4x0coGp1zpi4V9QU/DOGwjDtNlcaBDEg4RQssVMqkIGO3e6nD
 uQffKZlPjsL+tkbQTxP62mwIa9iz64itl7kzgEAwCun+UdHr18mE1rsifcVoWOufvEI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/YRGxkqHSLLsDGMtIChnYKj97ZLW6WRE354eChmvAlM=; b=mieHAGIrC+lon6CezQOqbiv5PS
 KEPRizNyyr3iUYrQ1mWiOjddbFCtwD7SOpYWroyzBwprndU9PcE1ZV7DVCKSZM1YftTxsYw4SBoEY
 eeSP1XBttVSHFrwDFkoK0cOY76/mGqSsM0R+NZZHAPB0DUTvN8yggWmnQWD17iV0nfuI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPB7p-00054z-OH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:10:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9201C61842;
 Fri, 19 Aug 2022 23:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BD3C433C1;
 Fri, 19 Aug 2022 23:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660950591;
 bh=jyQMlfDyLfQswfrcmubQj7ukvdgCEoTA8LhJP39mZNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuOfKLcTLqSxarEIMozH41HlKKSXIw1Ha5z+iGobBTp0XC/190sxrbX4xymxeQZFF
 3WudYVrb63Ic60WpCeWYRRbbMC6sNiKGVAznV8UysIUN6uVjyi5NDY0XFhaprIuD8A
 pF59daiDM0+L9HkOjVyll+2uPITOtrvjzgrPS16r1XJmBV5ma+KvcLc+BHhqr03upy
 fMsLt1xcBM7/2jnJiXFv+FJPXeiiS+0sz7tw4jOhLuKIjQw+8yi7bYCZL/cqb3a2bJ
 OHxlSv4rJUDd6AvnKU3c4q61YHoNXW9ZdFJr7Qw7jTpstVUaoUe5id8DJL1pk0juet
 AgN1uJU3z9Rkg==
Date: Fri, 19 Aug 2022 16:09:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Dilger <adilger@dilger.ca>
Message-ID: <YwAYPFxW7VV4M9D1@sol.localdomain>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-7-ebiggers@kernel.org>
 <YtyoF89iOg8gs7hj@google.com> <Yt7dCcG0ns85QqJe@sol.localdomain>
 <YuXyKh8Zvr56rR4R@google.com> <YvrrEcw4E+rpDLwM@sol.localdomain>
 <20220816090312.GU3600936@dread.disaster.area>
 <D1CDACE3-EC7E-43E4-8F49-EEA2B6E71A41@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D1CDACE3-EC7E-43E4-8F49-EEA2B6E71A41@dilger.ca>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 16, 2022 at 10:42:29AM -0600,
 Andreas Dilger wrote: > > IMHO,
 this whole discussion is putting the cart before the horse. > Changing
 existing (and useful) IO behavior to accommodate an API [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPB7p-00054z-OH
Subject: Re: [f2fs-dev] [PATCH v4 6/9] f2fs: don't allow DIO reads but not
 DIO writes
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
Cc: linux-block <linux-block@vger.kernel.org>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, xfs <linux-xfs@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 16, 2022 at 10:42:29AM -0600, Andreas Dilger wrote:
> 
> IMHO, this whole discussion is putting the cart before the horse.
> Changing existing (and useful) IO behavior to accommodate an API that
> nobody has ever used, and is unlikely to even be widely used, doesn't
> make sense to me.  Most applications won't check or care about the new
> DIO size fields, since they've lived this long without statx() returning
> this info, and will just pick a "large enough" size (4KB, 1MB, whatever)
> that gives them the performance they need.  They *WILL* care if the app
> is suddenly unable to read data from a file in ways that have worked for
> a long time.
> 
> Even if apps are modified to check these new DIO size fields, and then
> try to DIO write to a file in f2fs that doesn't allow it, then f2fs will
> return an error, which is what it would have done without the statx()
> changes, so no harm done AFAICS.
> 
> Even with a more-complex DIO status return that handles a "direction"
> field (which IMHO is needlessly complex), there is always the potential
> for a TOCTOU race where a file changes between checking and access, so
> the userspace code would need to handle this.
> 

I'm having trouble making sense of your argument here; you seem to be saying
that STATX_DIOALIGN isn't useful, so it doesn't matter if we design it
correctly?  That line of reasoning is concerning, as it's certainly intended to
be useful, and if it's not useful there's no point in adding it.

Are there any specific concerns that you have, besides TOCTOU races and the lack
of support for read-only DIO?

I don't think that TOCTOU races are a real concern here.  Generally DIO
constraints would only change if the application doing DIO intentionally does
something to the file, or if there are changes that involve the filesystem being
taken offline, e.g. the filesystem being mounted with significantly different
options or being moved to a different block device.  And, well, everything else
in stat()/statx() is subject to TOCTOU as well, but is still used...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
