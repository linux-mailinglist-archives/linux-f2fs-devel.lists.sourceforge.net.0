Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3CC7D4E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 07:31:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ht3gW-0005zT-0A; Thu, 01 Aug 2019 05:31:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1ht3gU-0005zL-AC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 05:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=To2Nw5LmpUxzncRm244P/cj4FgOAAyL3VNGllYb9Eu8=; b=fzS9ceSbX52iCOvvJdoNSIDBYv
 2BWOH6E/DIqem7sQdaJBum9dnlYXXbrUJVs2rM/E3a7dToxP0an297inmsK0v3tgm8W8Fy+mhw20M
 kZ7Tqh6GhQ1OzD+ESVXRPejaYwKnrh1ofbnCd+3wFMXGcFJgyTwbzVjzeS1H/wrbFi3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=To2Nw5LmpUxzncRm244P/cj4FgOAAyL3VNGllYb9Eu8=; b=RcfQK+Fp7P4T/KeLk2WDgX6sGi
 1pkfrXDp/4gN+tABQqkz4OVixYZloBvDOfCxViOhPGcK7jNMey+r1kNRHSrFyIWbOqpwh2TX7wnT7
 bShGzMyk3UiAS3r3dthPVz1sA0rSn/dFZLbiKczq5PCNc436xhnVIuIILpuxPt+0K7X4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ht3gS-0050nG-1w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 05:31:26 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x715V9Rn013938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2019 01:31:10 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id EEE8D4202F5; Thu,  1 Aug 2019 01:31:08 -0400 (EDT)
Date: Thu, 1 Aug 2019 01:31:08 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Message-ID: <20190801053108.GD2769@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
 <20190731233843.GA2769@mit.edu>
 <20190801011140.GB687@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801011140.GB687@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1ht3gS-0050nG-1w
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 31, 2019 at 06:11:40PM -0700, Eric Biggers wrote:
> 
> Well, it's either
> 
> 1a. Remove the user's handle.
> 	OR 
> 1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
> 
> Then
> 
> 2. If no handles remain, try to evict all inodes that use the key.
> 
> By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
> itself; root is only required to remove other users' handles (1b).

No, I was talking about 1b.  I'd argue that 1a and 1b should be
different ioctl.  1b requires root, and 1a doesn't.

And 1a should just mean, "I don't need to use the encrypted files any
more".  In the PAM passphrase case, when you are just logging out, 1a
is what's needed, and success is just fine.  pam_session won't *care*
whether or not there are other users keeping the key in use.

The problem with "fscrypt lock" is that the non-privileged user sort
of wants to do REMOVE_FLAG_KEY_FLAG_FOR_ALL_USERS, but they doesn't
have the privileges to do it, and they are hoping that removing their
own key removes it the key from the system.  That to me seems to be
the fundamental disconnect.  The "fscrypt unlock" and "fscrypt lock"
commands comes from the v1 key management, and requires root.  It's
the translation to unprivileged mode where "fscrypt lock" seems to
have problems.

> > What about having "fscrypt lock" call FS_IOC_GET_ENCRYPTION_KEY_STATUS
> > and print a warning message saying, "we can't lock it because N other
> > users who have registered a key".  I'd argue fscrypt should do this
> > regardless of whether or not FS_IOC_REMOVE_ENCRYPTION_KEY returns
> > EUSERS or not.
> 
> Shouldn't "fscrypt lock" still remove the user's handle, as opposed to refuse to
> do anything, though?  So it would still need to callh
> FS_IOC_REMOVE_ENCRYPTION_KEY, and could get the status from it rather than also
> needing to call FS_IOC_GET_ENCRYPTION_KEY_STATUS.
> 
> Though, FS_IOC_GET_ENCRYPTION_KEY_STATUS would be needed if we wanted to show
> the specific count of other users.
 
So my perspective is that the ioctl's should have very clean
semantics, and errors should be consistent with how the Unix system
calls and error reporting.

If we need to make "fscrypt lock" and "fscrypt unlock" have semantics
that are more consistent with previous user interface choices, then
fscrypt can use FS_IOC_GET_ENCRYPTION_KEY_STATUS to print the warning
before it calls FS_IOC_REMOVE_ENCRYPTION_KEY --- with "fscrypt purge_keys"
calling something like FS_IOC_REMOVE_ALL_USER_ENCRYPTION_KEYS.

> > It seems to me that the EBUSY and EUSERS errors should be status bits
> > which gets returned to the user in a bitfield --- and if the key has
> > been removed, or the user's claim on the key's existence has been
> > removed, the ioctl returns success.
> > 
> > That way we don't have to deal with the semantic disconnect where some
> > errors don't actually change system state, and other errors that *do*
> > change system state (as in, the key gets removed, or the user's claim
> > on the key gets removed), but still returns than error.
> > 
> 
> Do you mean use a positive return value, or do you mean add an output field to
> the struct passed to the ioctl?

I meant adding an output field.  I see EBUSY and EUSERS as status bits
which *some* use cases might find useful.  Other use cases, such as in
the pam_keys session logout code, we won't care at *all* about those
status reporting (or error codes).  So if EBUSY and EUSERS are
returned as errors, then it adds to complexity of those programs
whichd don't care.  (And even for those that do, it's still a bit more
complex since they has to distinguish between EBUSY, EUSERS, or other
errors --- in fact, *all* programs which use
FS_IOC_REMOVE_ENCRYPTION_KEY will *have* to check for EBUSY and
ESUSERS whether they care or not.)

> Either way note that it doesn't really need to be a bitfield, since you can't
> have both statuses at the same time.  I.e. if there are still other users, we
> couldn't have even gotten to checking for in-use files.

That's actually an implementation detail, though, right?  In theory,
we could check to see if there are any in-use files, independently of
whether there are any users or not.

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
