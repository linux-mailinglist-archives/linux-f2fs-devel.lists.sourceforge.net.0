Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 818AA7D29D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 03:11:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hszdJ-0005x4-8W; Thu, 01 Aug 2019 01:11:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hszdH-0005wp-M4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 01:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2oSTlSZK8/ihVmHsRDpRsSS88RTQxlEH5nDvJgzc7b4=; b=TEmYWK/+G7x4zvA9Lmq2vQRP4t
 Xu01kWdTIvS65AZWtEolUQK5+me3iOdlnrekwF6tpREK41wrJqvetd9gGJBffTJFv3kzJ8UbAulGJ
 jThHvtrvWuD9sceEEvcUqQC5DYeO/aOkoRm1VVaOI8M3Oh2uHQwBSL1JoI8ZEhuAyg60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2oSTlSZK8/ihVmHsRDpRsSS88RTQxlEH5nDvJgzc7b4=; b=eI9J3AOIid31zkCnOp7QG9pLUA
 YN4/BGl2i7Pa0NrNb3tvXb+Lt6Xnf1XaRAa3IG/pIg8Me6qpm2tSGVDDfQRPT6cgEvf0xd8+FZPBw
 eRZRKmG5OKe7ICDNlKIJvFZOeEPNPHewanSZq+dairJJfL4E/dFUnr1yo0GfaUYQ5GME=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hszdD-005vCc-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 01:11:51 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D166420665;
 Thu,  1 Aug 2019 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564621902;
 bh=H1VGC39qmcqOsG5Rnv48x88mYEzA6Ram+Ziuu/hGRjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e8Dwci5xbYFe0C6i+Jry/mUax6YutZbfR3b/Gv6NL6rFOTDCCnd/C6LBkT2KI54v8
 CsswFjk1ORn0BeQh+I/EUKIkcKyQOl9CS/Sr8D605d28SIESBmwR0cw69VcDq8gpU3
 Qniz1oJ5alZPULLLVyiKg5WFquPGWnvOd3X3n8cE=
Date: Wed, 31 Jul 2019 18:11:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190801011140.GB687@sol.localdomain>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731233843.GA2769@mit.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
X-Headers-End: 1hszdD-005vCc-Qz
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

On Wed, Jul 31, 2019 at 07:38:43PM -0400, Theodore Y. Ts'o wrote:
> On Wed, Jul 31, 2019 at 11:38:02AM -0700, Eric Biggers wrote:
> > 
> > This is perhaps different from what users expect from unlink().  It's well known
> > that unlink() just deletes the filename, not the file itself if it's still open
> > or has other links.  And unlink() by itself isn't meant for use cases where the
> > file absolutely must be securely erased.  But FS_IOC_REMOVE_ENCRYPTION_KEY
> > really is meant primarily for that sort of thing.
> 
> Seems to me that part of the confusion is FS_IOC_REMOVE_ENCRYPTION_KEY
> does two things.  One is "remove the user's handle on the key".  The
> other is "purge all keys" (which requires root).  So it does two
> different things with one ioctl.
> 

Well, it's either

1a. Remove the user's handle.
	OR 
1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)

Then

2. If no handles remain, try to evict all inodes that use the key.

By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
itself; root is only required to remove other users' handles (1b).

It could be argued that (2) should be a separate ioctl, so we'd have UNLINK_KEY
then LOCK_KEY.  But is there a real use case for this split?  I.e. would anyone
ever want to UNLINK_KEY without also LOCK_KEY?  Is that really something we
want/need to support?  I'd really like the API to be as straightforward as
possible for the normal use case of locking a directory, and not require some
series of multiple ioctl's, which would be more difficult to use correctly.

> > To give a concrete example: my patch for the userspace tool
> > https://github.com/google/fscrypt adds a command 'fscrypt lock' which locks an
> > encrypted directory.  If, say, someone runs 'fscrypt unlock' as uid 0 and then
> > 'fscrypt lock' as uid 1000, then FS_IOC_REMOVE_ENCRYPTION_KEY can't actually
> > remove the key.  I need to make the tool show a proper error message in this
> > case.  To do so, it would help to get a unique error code (e.g. EUSERS) from
> > FS_IOC_REMOVE_ENCRYPTION_KEY, rather than get the ambiguous error code ENOKEY
> > and have to call FS_IOC_GET_ENCRYPTION_KEY_STATUS to get the real status.
> 
> What about having "fscrypt lock" call FS_IOC_GET_ENCRYPTION_KEY_STATUS
> and print a warning message saying, "we can't lock it because N other
> users who have registered a key".  I'd argue fscrypt should do this
> regardless of whether or not FS_IOC_REMOVE_ENCRYPTION_KEY returns
> EUSERS or not.

Shouldn't "fscrypt lock" still remove the user's handle, as opposed to refuse to
do anything, though?  So it would still need to call
FS_IOC_REMOVE_ENCRYPTION_KEY, and could get the status from it rather than also
needing to call FS_IOC_GET_ENCRYPTION_KEY_STATUS.

Though, FS_IOC_GET_ENCRYPTION_KEY_STATUS would be needed if we wanted to show
the specific count of other users.

> 
> > Also, we already have the EBUSY case.  This means that the ioctl removed the
> > master key secret itself; however, some files were still in-use, so the key
> > remains in the "incompletely removed" state.  If we were actually going for
> > unlink() semantics, then for consistency this case really ought to return 0 and
> > unlink the key object, and people who care about in-use files would need to use
> > FS_IOC_GET_ENCRYPTION_KEY_STATUS.  But most people *will* care about this, and
> > may even want to retry the ioctl later, which isn't something youh can do with
> > pure unlink() semantics.
> 
> It seems to me that the EBUSY and EUSERS errors should be status bits
> which gets returned to the user in a bitfield --- and if the key has
> been removed, or the user's claim on the key's existence has been
> removed, the ioctl returns success.
> 
> That way we don't have to deal with the semantic disconnect where some
> errors don't actually change system state, and other errors that *do*
> change system state (as in, the key gets removed, or the user's claim
> on the key gets removed), but still returns than error.
> 
> We could also add a flag which indicates where if there are files that
> are still busy, or there are other users keeping a key in use, the
> ioctl fails hard and returns an error.  At least that way we keep
> consistency where an error means, "nothing has changed".
> 
> 	    	     	   	  	   - Ted

Do you mean use a positive return value, or do you mean add an output field to
the struct passed to the ioctl?

The latter might be more error-prone, since it invites bugs where a directory
silently fails to be locked, because the second field was not checked.

Either way note that it doesn't really need to be a bitfield, since you can't
have both statuses at the same time.  I.e. if there are still other users, we
couldn't have even gotten to checking for in-use files.

> 
> P.S.  BTW, one of the comments which I didn't make was the
> documentation didn't adequately explain which error codes means,
> "success but with a caveat", and which errors means, "we failed and
> didn't do anything".  But since I was arguing for changing the
> behavior, I decided not to complain about the documentation.
> 

Yes, in any case the FS_IOC_REMOVE_ENCRYPTION_KEY documentation needs
improvement.  I have some updates pending for it.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
