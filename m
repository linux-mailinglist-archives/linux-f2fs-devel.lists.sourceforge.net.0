Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B173BF2B6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jul 2021 02:10:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1Hcn-00044x-32; Thu, 08 Jul 2021 00:10:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m1Hcl-00044q-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 00:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yn5IxrBxHayAd8OBjKD5qqPpW2Sh4qXI8tpl+DggWL0=; b=O2ULke0uASgbyw5vBWor4LWEEx
 6s4zVklAV1xKmkncGMhuHALw1aA5gLn3NqGCnuyO19SpnjzqVwoNcHIIyKBYwW2GfaKGeK66A0Mh2
 ae6fTaK3pI2xhPNvP3jk5rsy4IwGNQBVd8NxgQhO6PfchSR3LEWQxeXgFHoBa9TMT4Hs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yn5IxrBxHayAd8OBjKD5qqPpW2Sh4qXI8tpl+DggWL0=; b=mWH6TPex6grfB06mJErI9bmsLt
 eH7guj9uAuUJMqi3ttbYlT1vANwdN7FM/7N+5I0DbZytS1ty6xBUimmTgzXognLXVwyr8qM+Y1ZXA
 FtT6Ly/uqZ49M9MfOzz2UDbkGsc77PU27eK9itLpL3r/i+GszFDXtM4079m/QEsfClj0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1HcZ-00073K-Kp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 00:10:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 595CE61C42;
 Thu,  8 Jul 2021 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625703020;
 bh=u5cr8gCXRmIVEx9nPKy91mk6gsb4DsQEiJQdZ5vKous=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GIP1pj7y1EiJTOl39ck4CBjDTiGSrUCBNLAU5lITvUNN80ii13vqkMY/7CXxMumy6
 JC7y877N/SeUUo3B/bQp1rqMYfNE/2j+69+3uXSH3fFnZpBCw0HpGZ2p1mDm6IX2y9
 GUPosEvXYcUvthWDVzEcpCBZwbyZOOUHW28IRYkOOwRvz56V3lNve/XJYkrEB4OF93
 zqnQMwHqRRSoHx5D6V2uODT5QEQRuGXEzhFq2blXLMFLjbv8nV5UH9TtHH4BrMMra4
 DVYOMr9zjr9HOKycdSC9LniG1n35QHFK8zJQIoesaxTqlcSPPeXgOAq4UcmYdwBLqq
 /LbRs+JReC2vg==
Date: Wed, 7 Jul 2021 17:10:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <YOZCaqG7TZVLOnl+@google.com>
References: <YOYHejl3CgABOnhP@google.com>
 <20210708094647.7c0d3060@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708094647.7c0d3060@canb.auug.org.au>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [198.145.29.99 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1HcZ-00073K-Kp
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.14-rc1
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
Cc: Jan Kara <jack@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Stephen,

On 07/08, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> On Wed, 7 Jul 2021 12:58:50 -0700 Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > Could you please consider this pull request?
> > 
> > Thanks,
> > 
> > The following changes since commit bd3c9cdb21a2674dd0db70199df884828e37abd4:
> > 
> >   Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux (2021-05-14 10:52:47 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.14-rc1
> > 
> > for you to fetch changes up to 28607bf3aa6f9762b32dc7f1ed0488823c0651b8:
> > 
> >   f2fs: drop dirty node pages when cp is in error status (2021-07-06 22:05:06 -0700)
> 
> Its worth mentioning the semantic conflict against the ext3 tree (which
> hasn't been merged by Linus yet, but presumably will be).
> 
> https://lore.kernel.org/lkml/20210623104922.30a5a3fa@canb.auug.org.au/

I think this looks good to me. Thank you~

> 
> The ext3 commit has been rebased and is now
> 
>   1474c39351f0 ("f2fs: Convert to using invalidate_lock")
> 
> but I am still applying the mentioned merge resolution patch.
> -- 
> Cheers,
> Stephen Rothwell




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
