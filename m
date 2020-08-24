Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC9250C66
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Aug 2020 01:32:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kALwu-0006gi-VR; Mon, 24 Aug 2020 23:32:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kALwt-0006gQ-A0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 23:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGTwP/THWKhMN3i8/vqy2882g5YjFKG1nE46qfkXtUA=; b=Rr0owNmmIY13XUJ9UNMR1iQEnt
 IX2nzdy0aH1FA6nFhZii2BXkrmbsbWYJRzWh483cxWXS5JHL6aSnDsmjQeyyKqhAUK0W5DdG60Jpk
 YzH34Ajp/BZt9ovMBCsj656Yf1n0q9FNBQn96WXmFnIi+UA9WeBkCvFnngo68ha86Yz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tGTwP/THWKhMN3i8/vqy2882g5YjFKG1nE46qfkXtUA=; b=LxfpDEcK3cJJzFUU42LIVXBY2Y
 S9nMUHa1tkSbIccNciRpv7xpMTpGtdfreWWaW/Kur7hbPUBCXqj4XU19vSE/mhrRN5+kuxXCWEgiR
 O4+UjkzpRPccdH/jnQwu+j39Xy5LHYYK6z6HM33BZ5MWBeZU5RbEgkfIw9pPOwzygOPM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kALwr-00HTDe-BE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 23:32:23 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1090C2074D;
 Mon, 24 Aug 2020 23:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598311931;
 bh=MHWFxrSNWgUFbkwhstp/6s6DxFuZbPykagmrmfORDj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IsooUHbL1hbNjt/UxArRuXQ4gDx5qqLpZrSaveZCC0UMlS1Ca4PHW8BaGvurwQ/PM
 0aFlZxQiWzqU2b6+2MLc9JWtCT2OCvP4nSwiSvkH8QOgdW7lsTBnv+LTZoxH5Ucz5x
 sabwm2+ayVwUI+Ntm4IX2sz/ljDaix2w++h75wVY=
Date: Mon, 24 Aug 2020 16:32:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200824233210.GA122905@google.com>
References: <20200708091237.3922153-1-drosen@google.com>
 <20200720170951.GE1292162@gmail.com>
 <20200727164508.GE1138@sol.localdomain>
 <20200824230015.GA810@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824230015.GA810@sol.localdomain>
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kALwr-00HTDe-BE
Subject: Re: [f2fs-dev] [PATCH v12 0/4] Prepare for upcoming
 Casefolding/Encryption patches
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/24, Eric Biggers wrote:
> On Mon, Jul 27, 2020 at 09:45:08AM -0700, Eric Biggers wrote:
> > On Mon, Jul 20, 2020 at 10:09:51AM -0700, Eric Biggers wrote:
> > > On Wed, Jul 08, 2020 at 02:12:33AM -0700, Daniel Rosenberg wrote:
> > > > This lays the ground work for enabling casefolding and encryption at the
> > > > same time for ext4 and f2fs. A future set of patches will enable that
> > > > functionality.
> > > > 
> > > > These unify the highly similar dentry_operations that ext4 and f2fs both
> > > > use for casefolding. In addition, they improve d_hash by not requiring a
> > > > new string allocation.
> > > > 
> > > > Daniel Rosenberg (4):
> > > >   unicode: Add utf8_casefold_hash
> > > >   fs: Add standard casefolding support
> > > >   f2fs: Use generic casefolding support
> > > >   ext4: Use generic casefolding support
> > > > 
> > > 
> > > Ted, are you interested in taking this through the ext4 tree for 5.9?
> > > 
> > > - Eric
> > 
> > Ping?
> > 
> 
> Unfortunately this patchset got ignored for 5.9.
> 
> Ted, will you have any interest in taking this patchset for 5.10?  Or should
> Jaegeuk just take patches 1-3 via the f2fs tree?

fyi; I think I can merge 1-3, if Al has no concern on 1 & 2. 

> 
> The fscrypt tree is also an option, but I feel it's not really appropriate since
> this patchset is just a refactoring of the existing casefolding support.
> 
> More reviews on patches 1-2 would be appreciated too.  So far just Gabriel and I
> have reviewed them.  I was hoping that other people would review them too.
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
