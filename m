Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D775D9AF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Jul 2023 06:30:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qN4Ff-0006Lg-RG;
	Sat, 22 Jul 2023 04:29:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qN4Fe-0006LX-NS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Jul 2023 04:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iE7CtcwGJ2XW9xfcT6j8HNt+PMo3woRj8eBHL125ou0=; b=R8M9yKGQ1N1MYmQ6Spr5ZB+PB7
 xlV3Nn3yOa+6fX6+SRgwogEhirn6JVdCZqRIV2NktF+rj7vi52egNzd5djkspRBYKFawD2p+C+IgZ
 HBKDwzSSMAIsZLopgX7fuJhfqO/BqYBdlZj1P1uOgJAkGsTSQPddN9XuPGeZ9fzrNhZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iE7CtcwGJ2XW9xfcT6j8HNt+PMo3woRj8eBHL125ou0=; b=QJxkmXTNiXuojKg8486sstpuQG
 TDmYuaMtaT6tTPpA/GJA3C97O9+G8S7YlTee0wUDevTz4lTYU+YVNwrE2n4HAZITmGjCIuFrxcCeo
 JF8NzMrjlvvVNmIWa8RzEfg6VG6fdqtc1DAkcp7H//erKY2qaVCqQTOuILccz8tpMl5Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qN4Fb-0002Qn-EM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Jul 2023 04:29:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC6D60A4B;
 Sat, 22 Jul 2023 04:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78390C433C9;
 Sat, 22 Jul 2023 04:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690000181;
 bh=KBzG5bolVWZz3VdJ21H1CdN4OdjZ+jv8Wok+YIRRtaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YmY7ZCVl6UKWNvfLhwuerzICgHNPsKEXC/FamYqipG6pCKnUsYQIyCcIFkrOExufl
 5onwwtqAeVw2LwsT69R8gDc4q3rd0vu7OncHVb15Qp7HCVpwzNf3o0iyxKH6LpWLB/
 xTBMOGfLvcnft4+poJKLEELPnbz4Wsh+9VLWIQDmNtA/LDk0vXbcw0Si91Mn4g6Vgn
 Bf8eqGbAqi/P/CuiG0D1HD9l7IwgvjxSEV1c8lcO8d4QS5nCZQeuU7J1GnF9veA9IL
 0TnUXzHRYeVgZd/DoxskbGLuHjvP1zjRDKzMDVDou4yxKgdIL97+d4c9Tgj7qYMVyB
 3mAdc3RH1bMNg==
Date: Fri, 21 Jul 2023 21:29:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230722042939.GC5660@sol.localdomain>
References: <20230719221918.8937-1-krisman@suse.de>
 <20230719221918.8937-4-krisman@suse.de>
 <20230720060657.GB2607@sol.localdomain>
 <20230720064103.GC2607@sol.localdomain> <87bkg53tr5.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkg53tr5.fsf@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 21, 2023 at 04:16:30PM -0400, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > On Wed,
 Jul 19, 2023 at 11:06:57PM -0700, Eric Biggers wrote: > >> > >> I'm [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qN4Fb-0002Qn-EM
Subject: Re: [f2fs-dev] [PATCH v3 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 21, 2023 at 04:16:30PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Wed, Jul 19, 2023 at 11:06:57PM -0700, Eric Biggers wrote:
> >> 
> >> I'm also having trouble understanding exactly when ->d_name is stable here.
> >> AFAICS, unfortunately the VFS has an edge case where a dentry can be moved
> >> without its parent's ->i_rwsem being held.  It happens when a subdirectory is
> >> "found" under multiple names.  The VFS doesn't support directory hard links, so
> >> if it finds a second link to a directory, it just moves the whole dentry tree to
> >> the new location.  This can happen if a filesystem image is corrupted and
> >> contains directory hard links.  Coincidentally, it can also happen in an
> >> encrypted directory due to the no-key name => normal name transition...
> >
> > Sorry, I think I got this slightly wrong.  The move does happen with the
> > parent's ->i_rwsem held, but it's for read, not for write.  First, before
> > ->lookup is called, the ->i_rwsem of the parent directory is taken for read.
> > ->lookup() calls d_splice_alias() which can call __d_unalias() which does the
> > __d_move().  If the old alias is in a different directory (which cannot happen
> > in that fscrypt case, but can happen in the general "directory hard links"
> > case), __d_unalias() takes that directory's ->i_rwsem for read too.
> >
> > So it looks like the parent's ->i_rwsem does indeed exclude moves of child
> > dentries, but only if it's taken for *write*.  So I guess you can rely on that;
> > it's just a bit more subtle than it first appears.  Though, some of your
> > explanation seems to assume that a read lock is sufficient ("In __lookup_slow,
> > either the parent inode is locked by the caller (lookup_slow) ..."), so maybe
> > there is still a problem.
> 
> I think I'm missing something on your clarification. I see your point
> about __d_unalias, and I see in the case where alias->d_parent !=
> dentry->d_parent we acquire the parent inode read lock:
> 
> static int __d_unalias(struct inode *inode,
> 		struct dentry *dentry, struct dentry *alias)
> {
> ...
> 	m1 = &dentry->d_sb->s_vfs_rename_mutex;
> 	if (!inode_trylock_shared(alias->d_parent->d_inode))
> 		goto out_err;
> }
> 
> And it seems to use that for __d_move. In this case, __d_move changes
> from under us even with a read lock, which is dangerous.  I think I
> agree with your first email more than the clarification.
> 
> In the lookup_slow then:
> 
> lookup_slow()
>   d_lookup()
>     d_splice_alias()
>       __d_unalias()
>         __d_move()
> 
> this __d_move Can do a dentry move and race with d_revalidate even
> though it has the parent read lock.
> 
> > So it looks like the parent's ->i_rwsem does indeed exclude moves of child
> > dentries, but only if it's taken for *write*.  So I guess you can rely on that;
> 
> We can get away of it with acquiring the d_lock as you suggested, I
> think.  But can you clarify the above? I wanna make sure I didn't miss
> anything. I am indeed relying only on the read lock here, as you can see.

In my first email I thought that __d_move() can be called without the parent
inode's i_rwsem held at all.  In my second email I realized that it is always
called with at least a read (shared) lock.

The question is what kind of parent i_rwsem lock is guaranteed to be held by the
caller of ->d_revalidate() when the name comparison is done.  Based on the
above, it needs to be at least a write (exclusive) lock to exclude __d_move()
without taking d_lock.  However, your analysis (in the commit message of "libfs:
Validate negative dentries in case-insensitive directories") only talks about
i_rwsem being "taken", without saying whether it's for read or write.  One thing
you mentioned as taking i_rwsem is lookup_slow, but that only takes it for read.
That seems like a problem, as it makes your analysis not correct.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
