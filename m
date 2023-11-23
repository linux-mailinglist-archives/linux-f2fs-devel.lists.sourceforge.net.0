Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E47F6624
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 19:24:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6ENe-0001sR-8l;
	Thu, 23 Nov 2023 18:24:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r6ENd-0001sL-3d
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 18:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzBtdnKUjpPFnRpQQXW79rPDBbblRFlb1WYi8ZvDINo=; b=TDWkBxLKBUuPFcZjUXJps0YrJK
 UztwBIqXCxfwJUyMHhqjTUu+t7pL9H9d33A4MOeTqz58vOwHBj1eoftjFBLgn+dvAbxV4mXT6LTGo
 akSwRrEsFUW0SlHD7FzZYIFwzGd/eXAqtkT5LSlLTJwG5iQJPTaYvkz3Wd2HQML5hcqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tzBtdnKUjpPFnRpQQXW79rPDBbblRFlb1WYi8ZvDINo=; b=jUCp+mNc5uBRlPJE2mul3pCeht
 yITeAOZp8ZQqIY9y2GPiT/v2xCNOJdnj1iZezcYVhseXdRLL/AnKNeHmEnuHJYxH9Dyvkx30zwq5X
 02Ev8EJsxrqJSsiPpeooOBwRTfi9WzI2RRxXGcsYF3g5YG0XDneMBdOfcOH/OUfQJl6c=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6ENZ-00Dkyu-JE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 18:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tzBtdnKUjpPFnRpQQXW79rPDBbblRFlb1WYi8ZvDINo=; b=Fabkz98tmntc9tx+TcR3dogL0S
 9nhgmRAWY4xYIehskIPbIkiFauMkDyDWXNEgb2HZOU2Z6DsuH6P0HOhRJVSzIJLca+iTSSbT0KlId
 lCLtMcwgUjrMwTFYr9KvEiJjCaqcJrtw7F+T2OOPYEjI8ACX1VRwL11rhDsfjG3aCcJ9r99tRGMlm
 BHR/Mo8gapMS45KiEq3XY+fiKdVEnd5530I9NebMuEdijoEWKK6PKRAd+w20V/K30JO3oKjb/Sz0h
 QvMxxD5yme5qv8A6hBrfkvCKeZd/jQNy6tDobkyN3DNbi5myUJuIpPXH14o2XnypfcKYibR6URwLH
 hhQ93KVA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r6ENG-002CAr-2l; Thu, 23 Nov 2023 18:24:26 +0000
Date: Thu, 23 Nov 2023 18:24:26 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <gabriel@krisman.be>
Message-ID: <20231123182426.GO38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <87h6lcid5k.fsf@>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6lcid5k.fsf@>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 23, 2023 at 12:37:43PM -0500, Gabriel Krisman
 Bertazi wrote: > > That's the problem I'd been talking about - there is a
 class of situations > > where the work done by ext4_lookup() to set [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r6ENZ-00Dkyu-JE
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 23, 2023 at 12:37:43PM -0500, Gabriel Krisman Bertazi wrote:
> > That's the problem I'd been talking about - there is a class of situations
> > where the work done by ext4_lookup() to set the state of dentry gets
> > completely lost.  After lookup you do have a dentry in the right place,
> > with the right name and inode, etc., but with NULL
> > ->d_op->d_revalidate.
> 
> I get the problem now. I admit to not understanding all the details yet,
> which is why I haven't answered directly, but I understand already how
> it can get borked.  I'm studying your explanation.
> 
> Originally, ->d_op could be propagated trivially since we had sb->s_d_op
> set, which would be set by __d_alloc, but that is no longer the case
> since we combined fscrypt and CI support.
>
> What I still don't understand is why we shouldn't fixup ->d_op when
> calling d_obtain_alias (before __d_instantiate_anon) and you say we
> better do it in d_splice_alias.  The ->d_op is going to be the same
> across the filesystem when the casefold feature is enabled, regardless
> if the directory is casefolded.  If we set it there, the alias already
> has the right d_op from the start.

*blink*

A paragraph above you've said that it's not constant over the entire
filesystem.

Look, it's really simple - any setup work of that sort done in ->lookup()
is either misplaced, or should be somehow transferred over to the alias
if one gets picked.

As for d_obtain_alias()... AFAICS, it's far more limited in what information
it could access.  It knows the inode, but it has no idea about the parent
to be.

The more I look at that, the more it feels like we need a method that would
tell the filesystem that this dentry is about to be spliced here.  9p is
another place where it would obviously simplify the things; ocfs2 'attach
lock' stuff is another case where the things get much more complicated
by having to do that stuff after splicing, etc.

It's not even hard to do:

1. turn bool exchange in __d_move() arguments into 3-value thing - move,
exchange or splice.  Have the callers in d_splice_alias() and __d_unalias()
pass "splice" instead of false (aka normal move).

2. make __d_move() return an int (normally 0)

3. if asked to splice and if there's target->d_op->d_transfer(), let
__d_move() call it right after
        spin_lock_nested(&dentry->d_lock, 2);
	spin_lock_nested(&target->d_lock, 3);
in there.  Passing it target and dentry, obviously.  In unlikely case
of getting a non-zero returned by the method, undo locks and return
that value to __d_move() caller.

4. d_move() and d_exchange() would ignore the value returned by __d_move();
__d_unalias() turn
        __d_move(alias, dentry, false);
	ret = 0;
into
	ret = __d_move(alias, dentry, Splice);
d_splice_alias() turn
				__d_move(new, dentry, false);
				write_sequnlock(&rename_lock);
into
				err = __d_move(new, dentry, Splice);
				write_sequnlock(&rename_lock);
				if (unlikely(err)) {
					dput(new);
					new = ERR_PTR(err);
				}
(actually, dput()-on-error part would be common to all 3 branches
in there, so it would probably get pulled out of that if-else if-else).

I can cook a patch doing that (and convert the obvious beneficiaries already
in the tree to it) and throw it into dcache branch - just need to massage
the series in there for repost...

PS: note, BTW, that fscrypt folks have already placed a hook into
__d_move(), exactly for the case of splice; I wonder if that would be
foldable into the same mechanism - hadn't looked in details yet.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
