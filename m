Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D41F0D8B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2019 05:05:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSCZa-0003T3-W8; Wed, 06 Nov 2019 04:05:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iSCZZ-0003Sw-Lx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 04:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u20NtsRh8wPdt6Y2k694Fw1DlguyGxl4m9G93RqYRV8=; b=CfaZp/aqaIh1VSzupF+3n7ILrC
 4WKZxwFirhD1CkktNR2Sstyrlz5DtvdiUk0pHA1t29SYvEI1uLJQ1BqwmkKj90dY9X7+m0wr0gS6N
 z3UlT53s0QP17gQZeqPaMTc9PwmpAJraEOyTvxXUYNnPE5leb/nxFGLWYJz7FzuX3taI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u20NtsRh8wPdt6Y2k694Fw1DlguyGxl4m9G93RqYRV8=; b=GUTVEh9kfmAx6ZaOvow7GOddG4
 FeICQb02/y9jHzLowF58rHZEftL8Qm4GlYRbnLXfI4/GrsPcJ2IqSUB90sEaJCoKme06Ky25flQTM
 fjLXsLOyqsJdeYLK61RJknhrNqzO+piDavyg+ze/1zVMJ/BvnMsBiQ8BNcUbwfjQqQKM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSCZX-001iXu-K9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Nov 2019 04:05:33 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 146A820717;
 Wed,  6 Nov 2019 04:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573013121;
 bh=Z0GxY95oJxO9ZLq8oaOmmcb0jIbpBQJAL5XisXjvaEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyEdLZm6RSRKo2uOnglC4+TurPB07Qt0Yie+qg069GiVrVlXNuPHZpNdCMdqunXXU
 578Ib5wQ8lOqzDmUFMycgh3jvuHOYBSid4q5TnN+bbA4yivNJX9C48fHKvKoZ5tK+E
 3BIlG4gNPpY7fJ5x6AkHqEZs4OxdQm+Sw+vpLKCI=
Date: Tue, 5 Nov 2019 20:05:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191106040519.GA705@sol.localdomain>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191024215438.138489-1-ebiggers@kernel.org>
 <20191024215438.138489-2-ebiggers@kernel.org>
 <20191106033544.GG26959@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106033544.GG26959@mit.edu>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSCZX-001iXu-K9
Subject: Re: [f2fs-dev] [PATCH v2 1/3] fscrypt: add support for
 IV_INO_LBLK_64 policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 05, 2019 at 10:35:44PM -0500, Theodore Y. Ts'o wrote:
> On Thu, Oct 24, 2019 at 02:54:36PM -0700, Eric Biggers wrote:
> > @@ -83,6 +118,10 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
> >  			return false;
> >  		}
> >  
> > +		if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) &&
> > +		    !supported_iv_ino_lblk_64_policy(policy, inode))
> > +			return false;
> > +
> >  		if (memchr_inv(policy->__reserved, 0,
> >  			       sizeof(policy->__reserved))) {
> >  			fscrypt_warn(inode,
> 
> fscrypt_supported_policy is getting more and more complicated, and
> supported_iv_ino_lblk_64_policy calls a fs-supplied callback function,
> etc.  And we need to use this every single time we need to set up an
> inode.  Granted that compared to the crypto, even if it is ICE, it's
> probably small beer --- but perhaps we should think about caching some
> of what fscrypt_supported_policy does on a per-file system basis at
> some point?

I don't think this will make any difference given everything else that needs to
be done to set up a file's key.  Also, anything extra we spend here will be far
less than the amount of time we save with IV_INO_LBLK_64 policies by not having
to do the key derivation and tfm allocation for every file.

Christoph suggested replacing ->has_stable_inodes() and
->get_ino_and_lblk_bits() with a new SB_* flag like SB_IV_INO_LBLK_64_SUPPORT.
But I don't like that that would result in worse error messages and would "leak"
a specific fscrypt policy flag into filesystems rather than having the
filesystems declare their properties.

If we really wanted to optimize fscrypt_get_encryption_info(), I think we
probably shouldn't try to microoptimize fscrypt_supported_policy(), but rather
take advantage of the fact that fscrypt_has_permitted_context() already ran.
E.g., we could cache the xattr, or skip both the keyring lookup and
fscrypt_supported_policy() by grabbing them from the parent directory.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
