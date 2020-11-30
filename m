Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788B2C8EB6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 21:09:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjpUT-0005a8-AA; Mon, 30 Nov 2020 20:09:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1kjpUE-0005Ye-FU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 20:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r6KLMQOU9S+PU2kpKmDjwmwtj8ckmS+yfpfj8deQ9U0=; b=GAlt7vvQAz+lUiITuWk3+UumIA
 gn3NfnYS9p0Gq9ApGVz2CpyYbcNETKvK/H5c0wCfk2zj1/N1WJM/smbHMCSPzTyy1LFFJerwSMwL5
 PCrZ8WTuC1VFiZNTTfj3TdaUZkteqgmSTUOcCwoVZjH+gqDDod9MEBa3qRN4aHDeCEC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r6KLMQOU9S+PU2kpKmDjwmwtj8ckmS+yfpfj8deQ9U0=; b=kVdRJirGyAoHc0MMiKJsW10dux
 TZcWKdaW2NThpfk1YWBOefRZ8Swydk/tk5Gdwb4seqYk9KyQN6A5yIkktHOAiT8y4kAyC6ltXRNBl
 FWVaSH8O6shrmUOS90jtqYcGe4g7jJBPT/DFkjDNFsBWmUf04aPhTxSh7YFcEOw6J+6I=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjpUC-007S4h-3j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 20:09:26 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0AUK99nM026331
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 15:09:10 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 4EE63420136; Mon, 30 Nov 2020 15:09:09 -0500 (EST)
Date: Mon, 30 Nov 2020 15:09:09 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201130200909.GI5364@mit.edu>
References: <D1AD7D55-94D6-4C19-96B4-BAD0FD33CF49@dilger.ca>
 <X8U8TG2ie77YiCF5@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X8U8TG2ie77YiCF5@sol.localdomain>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1kjpUC-007S4h-3j
Subject: Re: [f2fs-dev] backup/restore of fscrypt files
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
Cc: Andreas Dilger <adilger@dilger.ca>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Sebastien Buisson <sbuisson@ddn.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 30, 2020 at 10:39:08AM -0800, Eric Biggers wrote:
> Then there is the issue of ordering and how different operations would interact
> with each other.  This proposal would require the ability to open() a regular
> file that doesn't have its encryption key available, and read and write from it.
> open() gives you a file descriptor on which lots of other things could be called
> too, so we'd need to make sure to explicitly prevent a lot of things which we
> didn't have to worry about before, like fallocate() and various ioctl()s.  Then,
> what happens if someone adds an encryption key -- when does the file's page
> cache get invalidated, and how does it get synchronized with any ongoing I/O, or
> memory maps that may exist, and so on.  (Allowing only direct I/O on files that
> don't have encryption key unavailable may help...)

I had put together a draft patch series which used a combination of
ioctls to set and get the necessary encryption metadata (including the
filename), and then allowed root to allow Direct I/O to fetch the data
blocks.

But it wa a mess, especially if you were backing up a directory
hierarchy, in terms of what would need to be done on userspace side
during the restore operation --- especially if one of the requirements
is that the *restore* operation had to work if you didn't have the
encryption key at restore time.  (Think of an Android tablet that had
muliple users, and the person doing the backup and restore might not
have all of the encryption keys available to her.)

Fortunately, the business requirement for this disappeared, and the
patch series (which was super messy, and not tested because it would
have required writing some complex code on the restore side --- the
issue is with the fact that mkdir generates a new encryption key for
new directories, so we would need to have a way to reset the key for a
directory after it was freshly created, but before any filenames were
added --- like I said, it was a real mess), and so I was happy to let
that patch series die a natural death.

These days, we now have support for Direct I/O when the encrpytion is
done by hardware between the OS and the storage device, and the
addition of inline crypto and the v2 encryption keys would have made
the patch series invalid (and far more complex, if someone wanted to
reconstitute it).

So it *could* be done, but it's a huge amount of work, and without the
business justification to dedicate the software engineering time to
implement both the kernel side patches, and the userspace backup and
restore (which would be different for a traditional Linux desktop and
what might be used by say, an Android userspace application), I
suspect it's pretty unlikely to happen.

Of course, if some volunteer wants to try do all of the work, I
suspect Eric and I could provide some design help --- but it really
isn't going to be trivial to design and implement.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
