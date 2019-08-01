Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 091957E246
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 20:36:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htFvr-0007il-LA; Thu, 01 Aug 2019 18:36:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1htFvq-0007iY-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 18:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VGgcG9Se5meLyEnmt1oNtFAZOgJIaXyb706ITG/3/PY=; b=Y42fI1Vav0K8vTjjSyFUS7bVy9
 uMFnRyeYLbZ4ZQxghKLEhwWrVqu15v0dTX5GS1kGMHIab9j4vYHEAUw2UMraFAg98omxDN0Dm7gsm
 PpVVnezr0sCPfo29Dbi05H2HYgAgaERrz7t8ejGaX4S9UnUSfoE/AXM0qFxwMC6fqvsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VGgcG9Se5meLyEnmt1oNtFAZOgJIaXyb706ITG/3/PY=; b=gqRUlCBIYQ8fXTdoBxjjMUxrco
 PONai2zcgAWBuFNw7l3dGFqBsUr4Kf5sUU89clnJVwVzal9Na2i9p4sWS1MMxiIS/nFEFk1H2U9iw
 YoQz6YJQFIgPzgpuKzGs1/JD3jqa54BiXF+Ehs/8gr8AHkBLYLpJNagk3EmXcJIxSqUs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htFvo-0063lK-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 18:36:06 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A69AF20838;
 Thu,  1 Aug 2019 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564684558;
 bh=gB6PyZEe+LT2zwLazfeSEmIf0CwJ4IcRfXQcgvcxbFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MquIZTsU8wzEJgSrwgxzGWtZqkxFhVTCYq6QrJJLnPM6KwsW0T8C3WWZsTraCMjjQ
 5g6AGpL+daDUfYaJEdx3AyvV59heDDgN8B3v4YETC/cgGivPPIhc6lmBEiW4x2dbKX
 GKk+FYf1mTe1wIMJ7aSr+X86F0F7fkDkHxHh6t4s=
Date: Thu, 1 Aug 2019 11:35:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190801183554.GA223822@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
 <20190731233843.GA2769@mit.edu>
 <20190801011140.GB687@sol.localdomain>
 <20190801053108.GD2769@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801053108.GD2769@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1htFvo-0063lK-Cv
Subject: Re: [f2fs-dev] [PATCH v7 07/16] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 01, 2019 at 01:31:08AM -0400, Theodore Y. Ts'o wrote:
> On Wed, Jul 31, 2019 at 06:11:40PM -0700, Eric Biggers wrote:
> > 
> > Well, it's either
> > 
> > 1a. Remove the user's handle.
> > 	OR 
> > 1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
> > 
> > Then
> > 
> > 2. If no handles remain, try to evict all inodes that use the key.
> > 
> > By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
> > itself; root is only required to remove other users' handles (1b).
> 
> No, I was talking about 1b.  I'd argue that 1a and 1b should be
> different ioctl.  1b requires root, and 1a doesn't.
> 
> And 1a should just mean, "I don't need to use the encrypted files any
> more".  In the PAM passphrase case, when you are just logging out, 1a
> is what's needed, and success is just fine.  pam_session won't *care*
> whether or not there are other users keeping the key in use.

But in both cases, we still need to do the same things if the last user is
removed: remove the master key secret, try to evict the inodes, and (if all
inodes could be evicted) unlink the key object from the filesystem-level
keyring.  So the ioctls would be nearly the same; it's just the
"remove key user(s)" step that would be different.

So in my view, these are variants of the same action, which is why it's a flag.
Likewise, there aren't separate ioctls for v1 and v2 policy keys, since
adding/removing those are variants on the same actions, and it allows the ioctls
to be extended to v3 in the future if it ever becomes necessary.

Now, I don't have *that* much of an issue with making it an separate ioctl
FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS.  We can make them call the same function
internally, with a bool argument to distinguish the two ioctls.  It just seems
like an unnecessary complication.

> 
> The problem with "fscrypt lock" is that the non-privileged user sort
> of wants to do REMOVE_FLAG_KEY_FLAG_FOR_ALL_USERS, but they doesn't
> have the privileges to do it, and they are hoping that removing their
> own key removes it the key from the system.  That to me seems to be
> the fundamental disconnect.  The "fscrypt unlock" and "fscrypt lock"
> commands comes from the v1 key management, and requires root.  It's
> the translation to unprivileged mode where "fscrypt lock" seems to
> have problems.

"fscrypt lock" actually doesn't exist yet; it's a missing feature.  My patch to
the fscrypt tool adds it.  So we get to decide on the semantics.  We don't want
to require root, though; so for v2 policy keys, the real semantics have to be
that "fscrypt lock" registers the key for the user, and "fscrypt unlock"
unregisters it for the user.

One could argue that because of this they should be named "fscrypt register_key"
and "fscrypt unregister_key".  However, in the vast majority of cases these will
be run as a single user, with a key that is not shared with any other user.

[In fact, I recently changed the fscrypt tool to automatically set mode 0700 on
new encrypted directories, since most people found it surprising that their
unlocked encrypted files weren't private to them by default.  So if someone
wants to share their encrypted directory with another user, they now also need
to explicitly chmod it, unless the root user is involved.]

So presenting the commands as locking/unlocking a directory is a useful
simplication that makes them much easier to use, IMO.  People shouldn't need to
understand multi-user key registration in order to unlock/lock their personal
encrypted directories.

And if "fscrypt lock" does nevertheless hit the case where other users remain, I
think it would be most user-friendly to print a warning like this:

	Directory not fully locked; other users have added the key.
 	Run 'sudo fscrypt lock --all-users DIR' if you want to force-lock the directory.

We *could* make the --all-users option a separate subcommand like
"fscrypt force_lock", but again to me it seems like a variant of the same thing.

> > > It seems to me that the EBUSY and EUSERS errors should be status bits
> > > which gets returned to the user in a bitfield --- and if the key has
> > > been removed, or the user's claim on the key's existence has been
> > > removed, the ioctl returns success.
> > > 
> > > That way we don't have to deal with the semantic disconnect where some
> > > errors don't actually change system state, and other errors that *do*
> > > change system state (as in, the key gets removed, or the user's claim
> > > on the key gets removed), but still returns than error.
> > > 
> > 
> > Do you mean use a positive return value, or do you mean add an output field to
> > the struct passed to the ioctl?
> 
> I meant adding an output field.  I see EBUSY and EUSERS as status bits
> which *some* use cases might find useful.  Other use cases, such as in
> the pam_keys session logout code, we won't care at *all* about those
> status reporting (or error codes).  So if EBUSY and EUSERS are
> returned as errors, then it adds to complexity of those programs
> whichd don't care.  (And even for those that do, it's still a bit more
> complex since they has to distinguish between EBUSY, EUSERS, or other
> errors --- in fact, *all* programs which use
> FS_IOC_REMOVE_ENCRYPTION_KEY will *have* to check for EBUSY and
> ESUSERS whether they care or not.)
> 

I see it a little differently: I'd prefer for the API to be "secure by default",
i.e. it tries hard to really remove the key, and it returns an error if it
couldn't really be removed (but still did as much as possible).  And if the
caller is fine with some case(s) where the key wasn't truly removed, then they
can just explicitly handle those case(s).

You're suggesting the opposite: the ioctl will return 0 if the key was
unregistered for current user only, or if some files are still in use; and if
someone cares whether the key was *really* removed, then they'd need to check
the additional status bits.

That's easier to misuse in the more important ways, in my view.  Now, it's not a
huge deal, as the API provides the same information either way, and regardless
of which one we choose, I'll make sure it's used correctly in fscrypt, Android,
Chrome OS, etc...

> > Either way note that it doesn't really need to be a bitfield, since you can't
> > have both statuses at the same time.  I.e. if there are still other users, we
> > couldn't have even gotten to checking for in-use files.
> 
> That's actually an implementation detail, though, right?  In theory,
> we could check to see if there are any in-use files, independently of
> whether there are any users or not.
> 

Yes, but wouldn't people assume that if the bitfield is provided, that all the
bits are actually filled in?  Remember that to determine the "in-use files" bit
we have to actually go through the inode list and try to evict all the inodes.
That's not really something we should be doing before the last user is removed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
