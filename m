Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFF5760139
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 23:34:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qO3Bt-00008M-0o;
	Mon, 24 Jul 2023 21:34:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qO3Bm-00007n-09
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 21:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZWFMC0OaVUBV1G7vGuGgs0gnoyzaxFVN0lnZJV+aZP4=; b=BT7weTy5fPdoRv3eZN0ldBuOdT
 NpKwqgZOAi85eLa1JVUWCwVhFzH5vtBV+Qy/htV+jqUAxqeOmmSGZHIJr9o4i9tvQURIcrhFweOTn
 sIh7j4kCpKD8VCYqlZ3m8Bhr5Af8MI2gzgK5YtiSjeWLMUhkU4E4td6ubyKX8xFEqrYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZWFMC0OaVUBV1G7vGuGgs0gnoyzaxFVN0lnZJV+aZP4=; b=j/OemWlm6sAXqcMrE394v9nskV
 MqkvtgFBA7MiECDgxBBc1RGsryijmK48EgmHElWPqHQM2q5nO+cyGZVDUM5cR27OtKsBwX+Jud85F
 f0XagZCKSpibT2DPckXOcv9j265Z4CzYO9Z2a+O7aD5lzrbFwluzB4zdX3REjam2bz6g=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qO3Bi-0007Kp-TD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 21:33:56 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64D1322709;
 Mon, 24 Jul 2023 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690234425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZWFMC0OaVUBV1G7vGuGgs0gnoyzaxFVN0lnZJV+aZP4=;
 b=h+QC3MyAJ23SiY0WzKNnRfxvmo0izLYptmwRx7pbeI2L/MmYliXOdWqcAPL62h6SsENocb
 tHeIv1rVlOJODQJgOfsyBQHiRxALeA3zv3Yu3uWQDLliUHdrcTARQQqakMQm8TSMHLfH7g
 w2xNRGvNw5JgLAQGFFEopj1+lIXTHwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690234425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZWFMC0OaVUBV1G7vGuGgs0gnoyzaxFVN0lnZJV+aZP4=;
 b=i23Q6f99nULPqudBdZ4v3LfsO0tGlVYYjAlFghzWRoVVq+Xve4ueHoxyzqwdVMf0toNmnS
 2YQ1lhNqgjArUpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 299F6138E8;
 Mon, 24 Jul 2023 21:33:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vg7zAznuvmQBJwAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 24 Jul 2023 21:33:45 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Organization: SUSE
References: <20230719221918.8937-1-krisman@suse.de>
 <20230719221918.8937-4-krisman@suse.de>
 <20230720060657.GB2607@sol.localdomain>
 <20230720064103.GC2607@sol.localdomain> <87bkg53tr5.fsf@suse.de>
 <20230722042939.GC5660@sol.localdomain>
Date: Mon, 24 Jul 2023 17:33:43 -0400
In-Reply-To: <20230722042939.GC5660@sol.localdomain> (Eric Biggers's message
 of "Fri, 21 Jul 2023 21:29:39 -0700")
Message-ID: <87zg3l2dvs.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Jul 21, 
 2023 at 04:16:30PM -0400, Gabriel Krisman Bertazi wrote: >> Eric Biggers
 <ebiggers@kernel.org> writes: >> >> > On Wed, Jul 19, 2023 at 11:06:57PM -0700,
 Eric Biggers wrote: >> >> >> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qO3Bi-0007Kp-TD
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

Eric Biggers <ebiggers@kernel.org> writes:

> On Fri, Jul 21, 2023 at 04:16:30PM -0400, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>> > On Wed, Jul 19, 2023 at 11:06:57PM -0700, Eric Biggers wrote:
>> >> 
>> >> I'm also having trouble understanding exactly when ->d_name is stable here.
>> >> AFAICS, unfortunately the VFS has an edge case where a dentry can be moved
>> >> without its parent's ->i_rwsem being held.  It happens when a subdirectory is
>> >> "found" under multiple names.  The VFS doesn't support directory hard links, so
>> >> if it finds a second link to a directory, it just moves the whole dentry tree to
>> >> the new location.  This can happen if a filesystem image is corrupted and
>> >> contains directory hard links.  Coincidentally, it can also happen in an
>> >> encrypted directory due to the no-key name => normal name transition...
>> >
>> > Sorry, I think I got this slightly wrong.  The move does happen with the
>> > parent's ->i_rwsem held, but it's for read, not for write.  First, before
>> > ->lookup is called, the ->i_rwsem of the parent directory is taken for read.
>> > ->lookup() calls d_splice_alias() which can call __d_unalias() which does the
>> > __d_move().  If the old alias is in a different directory (which cannot happen
>> > in that fscrypt case, but can happen in the general "directory hard links"
>> > case), __d_unalias() takes that directory's ->i_rwsem for read too.
>> >
>> > So it looks like the parent's ->i_rwsem does indeed exclude moves of child
>> > dentries, but only if it's taken for *write*.  So I guess you can rely on that;
>> > it's just a bit more subtle than it first appears.  Though, some of your
>> > explanation seems to assume that a read lock is sufficient ("In __lookup_slow,
>> > either the parent inode is locked by the caller (lookup_slow) ..."), so maybe
>> > there is still a problem.
>> 
>> I think I'm missing something on your clarification. I see your point
>> about __d_unalias, and I see in the case where alias->d_parent !=
>> dentry->d_parent we acquire the parent inode read lock:
>> 
>> static int __d_unalias(struct inode *inode,
>> 		struct dentry *dentry, struct dentry *alias)
>> {
>> ...
>> 	m1 = &dentry->d_sb->s_vfs_rename_mutex;
>> 	if (!inode_trylock_shared(alias->d_parent->d_inode))
>> 		goto out_err;
>> }

>> this __d_move Can do a dentry move and race with d_revalidate even
>> though it has the parent read lock.
>> 
>> > So it looks like the parent's ->i_rwsem does indeed exclude moves of child
>> > dentries, but only if it's taken for *write*.  So I guess you can rely on that;
>> 
>> We can get away of it with acquiring the d_lock as you suggested, I
>> think.  But can you clarify the above? I wanna make sure I didn't miss
>> anything. I am indeed relying only on the read lock here, as you can see.
>
> In my first email I thought that __d_move() can be called without the parent
> inode's i_rwsem held at all.  In my second email I realized that it is always
> called with at least a read (shared) lock.

I see. Thank you.  We are on the same page now.   I was confused by
this part of your second comment:

>> > I guess you can rely on that; it's just a bit more subtle than it
>> > first appears.  Though, some of your explanation seems to assume
>> > that a read lock is sufficient ("In __lookup_slow, either the
>> > parent inode is locked by the caller (lookup_slow) ..."),

...because I was then failing to see, after learning about the __d_move
case, how I could rely on the inode read lock.  But, as I now realize,
__d_move is not called for negative dentries, so lookup_slow is indeed
safe.

> The question is what kind of parent i_rwsem lock is guaranteed to be held by the
> caller of ->d_revalidate() when the name comparison is done.  Based on the
> above, it needs to be at least a write (exclusive) lock to exclude __d_move()
> without taking d_lock.  However, your analysis (in the commit message of "libfs:
> Validate negative dentries in case-insensitive directories") only talks about
> i_rwsem being "taken", without saying whether it's for read or write.  One thing
> you mentioned as taking i_rwsem is lookup_slow, but that only takes it for read.
> That seems like a problem, as it makes your analysis not correct.

My understanding and explanation was that a read lock should be enough
at all times, despite the __d_move case.  Any time d_revalidate is
called for a (LOOKUP_CREATE | LOOKUP_RENAME_TARGET), it holds at least
the read lock, preventing concurrent changes to d_name of negative
dentries.

I will review the places that touch ->d_name again and I will keep the
patch as-is and update my explanation to include this case.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
