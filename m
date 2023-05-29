Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0206714D37
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 17:38:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3ewj-0002A3-LK;
	Mon, 29 May 2023 15:38:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q3ewg-00029x-UH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 15:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VfC2IdpO+7uEiBHhtf+jBby1eH6FWQ5ChsH/O7pLur0=; b=jI0jMBJjZwawkHmv8B8OvzC9PU
 T3IhDdrenzDuEqgALgw9UzGkvhNI1tGguCInwQPRapKQmcIIADiiTc7s2WBACd7zhro83EGpSdGLi
 zdq+Go+V2OyHzhue6Q4vP+jAd2Tsk5xFRjAMrJHPNDQvyJwFX24aGfL3xoz0MXIhZvHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VfC2IdpO+7uEiBHhtf+jBby1eH6FWQ5ChsH/O7pLur0=; b=LWCGF3pelD9FPDaBrHJ5kqByNZ
 Ii73n187khOdAIW9ZAy23+SBmG7gtO0mkLMjWqlQkxh41QSHuW9VG2pl++PBEa0wn1KJa9W9psDEL
 gi/4pr17lRJrDBKTv2Rz943gi1vmxvc3YyR2JuhuM0xfJZNa6seiDqIzUDfKKIGE89/g=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q3ewe-000721-PU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 15:38:07 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8E621F8B5;
 Mon, 29 May 2023 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685374674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfC2IdpO+7uEiBHhtf+jBby1eH6FWQ5ChsH/O7pLur0=;
 b=gSf0t+vZ0B4myh9SviD61zCj1EH1uc1YlVGhNUgb/MCZXxzHgA8J3XifwVyza2KRq20hWr
 pZGc6AXCETQnP8jb+U91N20w7vIA7f5VobiHfL+/HbuvYR4sGOy/Qvb7o1ZnPBWqac7LBg
 kZfgvCRZqV9R20JgWvdDd1kIZir+lK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685374674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfC2IdpO+7uEiBHhtf+jBby1eH6FWQ5ChsH/O7pLur0=;
 b=2+2tMQkyipmhcoqtqPAlHCSakWLZKRrkGMRW/G1J4HZuo+ZsFqLS2sYv/igpPh23T0GX71
 4QMmBZeR6OW2F3DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87AAC13A36;
 Mon, 29 May 2023 15:37:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BKs+INLGdGQrSAAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 29 May 2023 15:37:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0BA32A06F2; Mon, 29 May 2023 14:41:31 +0200 (CEST)
Date: Mon, 29 May 2023 14:41:31 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230529124131.gbb3fmhrspl332i6@quack3>
References: <20230525100654.15069-1-jack@suse.cz>
 <20230525101624.15814-4-jack@suse.cz>
 <20230526-polarstern-herrichten-32fc46c63bfc@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526-polarstern-herrichten-32fc46c63bfc@brauner>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 26-05-23 11:45:15, Christian Brauner wrote: > On Thu, 
 May 25, 2023 at 12:16:10PM +0200, Jan Kara wrote: > > Currently the locking
 order of inode locks for directories that are not > > in ancest [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q3ewe-000721-PU
Subject: Re: [f2fs-dev] [PATCH 4/6] fs: Establish locking order for
 unrelated directories
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
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 26-05-23 11:45:15, Christian Brauner wrote:
> On Thu, May 25, 2023 at 12:16:10PM +0200, Jan Kara wrote:
> > Currently the locking order of inode locks for directories that are not
> > in ancestor relationship is not defined because all operations that
> > needed to lock two directories like this were serialized by
> > sb->s_vfs_rename_mutex. However some filesystems need to lock two
> > subdirectories for RENAME_EXCHANGE operations and for this we need the
> > locking order established even for two tree-unrelated directories.
> > Provide a helper function lock_two_inodes() that establishes lock
> > ordering for any two inodes and use it in lock_two_directories().
> > 
> > CC: stable@vger.kernel.org
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/inode.c    | 34 ++++++++++++++++++++++++++++++++++
> >  fs/internal.h |  2 ++
> >  fs/namei.c    |  4 ++--
> >  3 files changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/inode.c b/fs/inode.c
> > index 577799b7855f..2015fa50d34a 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -1103,6 +1103,40 @@ void discard_new_inode(struct inode *inode)
> >  }
> >  EXPORT_SYMBOL(discard_new_inode);
> >  
> > +/**
> > + * lock_two_inodes - lock two inodes (may be regular files but also dirs)
> > + *
> > + * Lock any non-NULL argument. The caller must make sure that if he is passing
> > + * in two directories, one is not ancestor of the other.  Zero, one or two
> > + * objects may be locked by this function.
> > + *
> > + * @inode1: first inode to lock
> > + * @inode2: second inode to lock
> > + * @subclass1: inode lock subclass for the first lock obtained
> > + * @subclass2: inode lock subclass for the second lock obtained
> > + */
> > +void lock_two_inodes(struct inode *inode1, struct inode *inode2,
> > +		     unsigned subclass1, unsigned subclass2)
> > +{
> > +	if (!inode1 || !inode2)
> > +		goto lock;
> 
> Before this change in
> 
> lock_two_nondirectories(struct inode *inode1, struct inode *inode2)
> 
> the swap() would cause the non-NULL inode to always be locked with
> I_MUTEX_NONDIR2. Now it can be either I_MUTEX_NORMAL or I_MUTEX_NONDIR2.
> Is that change intentional?

Kind of. I don't think we really care so I didn't bother to complicate the
code for this. If you think keeping the lockdep class consistent is worth
it, I can modify the patch...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
