Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A54327CC1E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 20:38:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hstUO-0000Wj-Pj; Wed, 31 Jul 2019 18:38:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hstUL-0000WE-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 18:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZTyyaQSfDBzn7dcqkzIQbhS6e0ReRkFnEBWleDYf7Kg=; b=fa6ah2boOuj1hYNExCnew13c3Q
 4vB5UMz5PLFx60vBIH/IYCqtgwJzckdrzQ6oJDXJBozmsP6Luh3BqavnbYK+RMlqc8TsW8CRxpJsA
 f2VSvTqQKTmas+0aWbCpOof5Sii9IP02K6Rai6wktZ4ISsKEf5fjKa65wu2pOt9CdmNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZTyyaQSfDBzn7dcqkzIQbhS6e0ReRkFnEBWleDYf7Kg=; b=CfaWagucONOCXwNUhHPagoSTq7
 LXqgUmtE7gzjPYFVViAOBP5fWVA/uMQkP2Kkd15yZdzxHe9eIAj3+H+B1DCB5nxdOb+Hkjr0vdK65
 o09YcuRTGD4rE5P8J0YUzQAoKCgoOZw2qVXzuS2L6kTivSbVtX78/biXlomEcdp4T4MI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hstUI-005XU2-SI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 18:38:12 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 196BF206A3;
 Wed, 31 Jul 2019 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564598284;
 bh=mwf/L4kawPnA1+kq4IqMkos0fqY4xHcvedV1SVvmgr4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=0SBhBqvGEFIUO9Q+X1GiRxRfAhxkriFVan66HT0bGDPhuMdNTX8kCHLadzRChzP4O
 OKShL0aapWqVZ6CtauvlQDheMoSsBzO54aB87yx0xEz7IKpbCUA8GYPua8suG6ultw
 koL6k+O0wO1Ftp9+M/dFACaiJQwyP8yBpRpTOjac=
Date: Wed, 31 Jul 2019 11:38:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Message-ID: <20190731183802.GA687@sol.localdomain>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729195827.GF169027@gmail.com>
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
X-Headers-End: 1hstUI-005XU2-SI
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

On Mon, Jul 29, 2019 at 12:58:28PM -0700, Eric Biggers wrote:
> On Sun, Jul 28, 2019 at 03:24:17PM -0400, Theodore Y. Ts'o wrote:
> > > +
> > > +/*
> > > + * Try to remove an fscrypt master encryption key.  If other users have also
> > > + * added the key, we'll remove the current user's usage of the key, then return
> > > + * -EUSERS.  Otherwise we'll continue on and try to actually remove the key.
> > 
> > Nit: this should be moved to patch #11
> > 
> > Also, perror(EUSERS) will display "Too many users" which is going to
> > be confusing.  I understand why you chose this; we would like to
> > distinguish between there are still inodes using this key, and there
> > are other users using this key.
> > 
> > Do we really need to return EUSERS in this case?  It's actually not an
> > *error* that other users are using the key.  After all, the unlink(2)
> > system call doesn't return an advisory error when you delete a file
> > which has other hard links.  And an application which does care about
> > this detail can always call FS_IOC_ENCRYPTION_KEY_STATUS() and check
> > user_count.
> > 
> 
> Returning 0 when the key wasn't fully removed might also be confusing.  But I
> guess you're right that returning an error doesn't match how syscalls usually
> work.  It did remove the current user's usage of the key, after all, rather than
> completely fail.  And as you point out, if someone cares about other users
> having added the key, they can use FS_IOC_GET_ENCRYPTION_KEY_STATUS.
> 
> So I guess I'll change it to 0.
> 

So after making this change and thinking about it some more, I'm not sure it's
actually an improvement.

The normal use case for this ioctl is to "lock" some encrypted directory(s).  If
it returns 0 and doesn't lock the directory(s), that's unexpected.

This is perhaps different from what users expect from unlink().  It's well known
that unlink() just deletes the filename, not the file itself if it's still open
or has other links.  And unlink() by itself isn't meant for use cases where the
file absolutely must be securely erased.  But FS_IOC_REMOVE_ENCRYPTION_KEY
really is meant primarily for that sort of thing.

To give a concrete example: my patch for the userspace tool
https://github.com/google/fscrypt adds a command 'fscrypt lock' which locks an
encrypted directory.  If, say, someone runs 'fscrypt unlock' as uid 0 and then
'fscrypt lock' as uid 1000, then FS_IOC_REMOVE_ENCRYPTION_KEY can't actually
remove the key.  I need to make the tool show a proper error message in this
case.  To do so, it would help to get a unique error code (e.g. EUSERS) from
FS_IOC_REMOVE_ENCRYPTION_KEY, rather than get the ambiguous error code ENOKEY
and have to call FS_IOC_GET_ENCRYPTION_KEY_STATUS to get the real status.

Also, we already have the EBUSY case.  This means that the ioctl removed the
master key secret itself; however, some files were still in-use, so the key
remains in the "incompletely removed" state.  If we were actually going for
unlink() semantics, then for consistency this case really ought to return 0 and
unlink the key object, and people who care about in-use files would need to use
FS_IOC_GET_ENCRYPTION_KEY_STATUS.  But most people *will* care about this, and
may even want to retry the ioctl later, which isn't something you can do with
pure unlink() semantics.

So I'm leaning towards keeping the EUSERS and EBUSY errors.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
