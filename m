Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548A1E8E3C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 08:45:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jevEv-0000dj-5v; Sat, 30 May 2020 06:45:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jevEt-0000dU-PZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 06:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dY/KbrK93QD/g0DSblzOx0Jy/r+hU80HBmXKEIIL+KE=; b=mgZbo0OI180J0WpJX+kf+6GheH
 r8mnMpIJFaRNTe1QjaHSlQDovHkmXaYFqovAWRh0cITySe1f3PkPsEo2IqdBfIh1eH9C+kwm3BoST
 i1TCzs38EljfH0A6g6EA0RncqoFgVzJMDCJI0eEH1tCqK33I1xuwuXGvz5oY0FuqVzC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dY/KbrK93QD/g0DSblzOx0Jy/r+hU80HBmXKEIIL+KE=; b=Wc4MOsGmjQxg4Ps8+Ud4CNhOm0
 hhAm/CnudIekkKCEi8qknbdYNElTkrFY10WGUWW/JK3Bf6AUSBJ1sdZLGTMjm5Wvspkqx9hdJh+JA
 RqZUWEPoeYyNL7fo5iuMqt3nlS2j92nCc8mVSvUg2YG/RcNrGNOkqhqmcGQFX+VeWJQQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jevEs-00DTHk-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 06:45:03 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EBD12074B;
 Sat, 30 May 2020 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590821092;
 bh=Vfljkewu5yJyeYteJw8SGwaWsoTPtwkSKdk4FvA1jTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ci/MEcvwk27WjIwHUyNQ7oCgaVEplLP2VEwBZAr5lkXgqQAS+SvzonxWlpup5n43U
 EsFbxD/pfZrmwbTuEXG1NaWPiOkUevOVpctUFaGlnazdhEtaVNAn+9C2MSp2DtzCnM
 RL1MUP0n6M572M3b8U2UNMpZwi6kiDxDU+V/oEaA=
Date: Fri, 29 May 2020 23:44:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200530064450.GA317593@sol.localdomain>
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <85d06mkkv5.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85d06mkkv5.fsf@collabora.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: qstr.name]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jevEs-00DTHk-Kv
Subject: Re: [f2fs-dev] [PATCH] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 30, 2020 at 02:17:02AM -0400, Gabriel Krisman Bertazi wrote:
> >  > > +	/*
> > +	 * If the dentry name is stored in-line, then it may be concurrently
> > +	 * modified by a rename.  If this happens, the VFS will eventually retry
> > +	 * the lookup, so it doesn't matter what ->d_compare() returns.
> > +	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
> > +	 * string.  Therefore, we have to copy the name into a temporary buffer.
> > +	 */
> > +	if (len <= DNAME_INLINE_LEN - 1) {
> > +		unsigned int i;
> > +
> > +		for (i = 0; i < len; i++)
> > +			strbuf[i] = READ_ONCE(str[i]);
> > +		strbuf[len] = 0;
> > +		qstr.name = strbuf;
> > +	}
> > +
> 
> Could we avoid this if the casefolded version were cached in the dentry?
> Then we could use utf8_strncasecmp_folded which would be safe.  Would
> this be acceptable for vfs?

The VFS assumes that each dentry has one name, the one in d_name.  That's what
it passes to ->d_compare(), and that's what it updates in __d_move().

So while ext4 and f2fs could put the casefolded name in ->d_fsdata,
->d_compare() wouldn't actually have access to it (unless we added d_fsdata as a
parameter to ->d_compare()).  Also, the casefolded name would get outdated when
__d_move() changes d_name.

We could instead make d_name always be the casefolded name.  I'm not sure that
would be possible, though.  For one, I don't think ->lookup() is allowed to just
change the dentry name.  It would also make getcwd(), /proc/*/fd/, etc. always
show casefolded names, which could be problematic.  And probably other issues I
can't think of off the top of my head.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
