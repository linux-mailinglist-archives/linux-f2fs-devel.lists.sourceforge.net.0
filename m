Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C276E0EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 09:07:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRSR0-0005qY-VD;
	Thu, 03 Aug 2023 07:07:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qRSQz-0005qR-79
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 07:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQElS5Lddlt0o0JlqmEWO0k2hY8bNGlhwCvrjvMV2oM=; b=eQzwJlOXdrO9GmylSNZJpMO3Au
 IWNg/AWuPV0toAKLLX7coQt+v7uqtkywEADPvayn1tZw4RgxKQkEXZAxX+prg9OY4jdoi3/mi0br2
 sE2CUiVBX8dzMlWjyy9WwSzm7UecaeptpYpvdVroskzhsqsGKTtA4+TdjqfvjvPhWQ34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQElS5Lddlt0o0JlqmEWO0k2hY8bNGlhwCvrjvMV2oM=; b=iZeXvIhhXgg6H2KCw1BlYK4nHJ
 /vFt5cLU4l5wim4kgEszksJFRZGBB+fc9Ek8WWpq3PCmqiS55QSeNSxW8+hL70rVdgbF5/jilL1zi
 0axT4CJokgbDKETCAsJHt3NBfgFFc489VdDlJHSYMHTJzYXRJBr/x4EUDgKxJGLavZ98=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRSQy-0003JA-Lb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 07:07:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 161ED61C2F;
 Thu,  3 Aug 2023 07:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11F6C433C8;
 Thu,  3 Aug 2023 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691046458;
 bh=OeoqI+Oj2qYvPhNh0DFzNOPr7pzFVMjDj3jNrQ8auks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=idRaG8hdjFUCkTULCrK1dlyrRw8nW6SsI8wPcvzHLRBFJ7RKTCTZlaIU62uYdbg4B
 v0RwXTV+e7cpJngYnZGKJtq7ESuBCy9J/C6MoesGkjIOYrOfr0haegZpPN8Sl9AhEd
 /n7WAYLHhl7fcuzysrjeSm+K2USNWNIDAZPnKmucJcQSBzrpkTOBZyKIcqcDXFpGYt
 Ot014gaLbdp3bPGIltO92l77KW+89JgNgWl/HhyJnpogoXWT3yn30LmoJtXe7q8BgQ
 BoF4BFW//BfONhWdG7QTLXlmT0Mq4K+GIYn3JQ7ha2jeWaBCaSeemPXWQz4OJUap49
 laskZlFECJL1w==
Date: Thu, 3 Aug 2023 09:07:20 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230803-wellpappe-haargenau-f6cb3e3585d8@brauner>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-2-a794c2b7abca@kernel.org>
 <20230802193537.vtuuwuwazocjbatv@quack3>
 <ccc52562305bd1a1affb14e94a1cc08433eb8316.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccc52562305bd1a1affb14e94a1cc08433eb8316.camel@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 04:54:09PM -0400, Jeff Layton wrote:
 > On Wed, 2023-08-02 at 21:35 +0200, Jan Kara wrote: > > On Tue 25-07-23
 10:58:15, Jeff Layton wrote: > > > The VFS always uses coarse-grai [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRSQy-0003JA-Lb
Subject: Re: [f2fs-dev] [PATCH v6 2/7] fs: add infrastructure for multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 04:54:09PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-02 at 21:35 +0200, Jan Kara wrote:
> > On Tue 25-07-23 10:58:15, Jeff Layton wrote:
> > > The VFS always uses coarse-grained timestamps when updating the ctime
> > > and mtime after a change. This has the benefit of allowing filesystems
> > > to optimize away a lot metadata updates, down to around 1 per jiffy,
> > > even when a file is under heavy writes.
> > > 
> > > Unfortunately, this has always been an issue when we're exporting via
> > > NFSv3, which relies on timestamps to validate caches. A lot of changes
> > > can happen in a jiffy, so timestamps aren't sufficient to help the
> > > client decide to invalidate the cache. Even with NFSv4, a lot of
> > > exported filesystems don't properly support a change attribute and are
> > > subject to the same problems with timestamp granularity. Other
> > > applications have similar issues with timestamps (e.g backup
> > > applications).
> > > 
> > > If we were to always use fine-grained timestamps, that would improve the
> > > situation, but that becomes rather expensive, as the underlying
> > > filesystem would have to log a lot more metadata updates.
> > > 
> > > What we need is a way to only use fine-grained timestamps when they are
> > > being actively queried.
> > > 
> > > POSIX generally mandates that when the the mtime changes, the ctime must
> > > also change. The kernel always stores normalized ctime values, so only
> > > the first 30 bits of the tv_nsec field are ever used.
> > > 
> > > Use the 31st bit of the ctime tv_nsec field to indicate that something
> > > has queried the inode for the mtime or ctime. When this flag is set,
> > > on the next mtime or ctime update, the kernel will fetch a fine-grained
> > > timestamp instead of the usual coarse-grained one.
> > > 
> > > Filesytems can opt into this behavior by setting the FS_MGTIME flag in
> > > the fstype. Filesystems that don't set this flag will continue to use
> > > coarse-grained timestamps.
> > > 
> > > Later patches will convert individual filesystems to use the new
> > > infrastructure.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/inode.c         | 98 ++++++++++++++++++++++++++++++++++++++----------------
> > >  fs/stat.c          | 41 +++++++++++++++++++++--
> > >  include/linux/fs.h | 45 +++++++++++++++++++++++--
> > >  3 files changed, 151 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/fs/inode.c b/fs/inode.c
> > > index d4ab92233062..369621e7faf5 100644
> > > --- a/fs/inode.c
> > > +++ b/fs/inode.c
> > > @@ -1919,6 +1919,21 @@ int inode_update_time(struct inode *inode, struct timespec64 *time, int flags)
> > >  }
> > >  EXPORT_SYMBOL(inode_update_time);
> > >  
> > > +/**
> > > + * current_coarse_time - Return FS time
> > > + * @inode: inode.
> > > + *
> > > + * Return the current coarse-grained time truncated to the time
> > > + * granularity supported by the fs.
> > > + */
> > > +static struct timespec64 current_coarse_time(struct inode *inode)
> > > +{
> > > +	struct timespec64 now;
> > > +
> > > +	ktime_get_coarse_real_ts64(&now);
> > > +	return timestamp_truncate(now, inode);
> > > +}
> > > +
> > >  /**
> > >   *	atime_needs_update	-	update the access time
> > >   *	@path: the &struct path to update
> > > @@ -1952,7 +1967,7 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
> > >  	if ((mnt->mnt_flags & MNT_NODIRATIME) && S_ISDIR(inode->i_mode))
> > >  		return false;
> > >  
> > > -	now = current_time(inode);
> > > +	now = current_coarse_time(inode);
> > >  
> > >  	if (!relatime_need_update(mnt, inode, now))
> > >  		return false;
> > > @@ -1986,7 +2001,7 @@ void touch_atime(const struct path *path)
> > >  	 * We may also fail on filesystems that have the ability to make parts
> > >  	 * of the fs read only, e.g. subvolumes in Btrfs.
> > >  	 */
> > > -	now = current_time(inode);
> > > +	now = current_coarse_time(inode);
> > >  	inode_update_time(inode, &now, S_ATIME);
> > >  	__mnt_drop_write(mnt);
> > >  skip_update:
> > 
> > There are also calls in fs/smb/client/file.c:cifs_readpage_worker() and in
> > fs/ocfs2/file.c:ocfs2_update_inode_atime() that should probably use
> > current_coarse_time() to avoid needless querying of fine grained
> > timestamps. But see below...
> > 
> 
> Technically, they already devolve to current_coarse_time anyway, but
> changing them would allow them to skip the fstype flag check, but I like
> your idea below better anyway.
> 
> > > @@ -2072,6 +2087,56 @@ int file_remove_privs(struct file *file)
> > >  }
> > >  EXPORT_SYMBOL(file_remove_privs);
> > >  
> > > +/**
> > > + * current_mgtime - Return FS time (possibly fine-grained)
> > > + * @inode: inode.
> > > + *
> > > + * Return the current time truncated to the time granularity supported by
> > > + * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
> > > + * as having been QUERIED, get a fine-grained timestamp.
> > > + */
> > > +static struct timespec64 current_mgtime(struct inode *inode)
> > > +{
> > > +	struct timespec64 now;
> > > +	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
> > > +	long nsec = atomic_long_read(pnsec);
> > > +
> > > +	if (nsec & I_CTIME_QUERIED) {
> > > +		ktime_get_real_ts64(&now);
> > > +	} else {
> > > +		struct timespec64 ctime;
> > > +
> > > +		ktime_get_coarse_real_ts64(&now);
> > > +
> > > +		/*
> > > +		 * If we've recently fetched a fine-grained timestamp
> > > +		 * then the coarse-grained one may still be earlier than the
> > > +		 * existing one. Just keep the existing ctime if so.
> > > +		 */
> > > +		ctime = inode_get_ctime(inode);
> > > +		if (timespec64_compare(&ctime, &now) > 0)
> > > +			now = ctime;
> > > +	}
> > > +
> > > +	return timestamp_truncate(now, inode);
> > > +}
> > > +
> > > +/**
> > > + * current_time - Return timestamp suitable for ctime update
> > > + * @inode: inode to eventually be updated
> > > + *
> > > + * Return the current time, which is usually coarse-grained but may be fine
> > > + * grained if the filesystem uses multigrain timestamps and the existing
> > > + * ctime was queried since the last update.
> > > + */
> > > +struct timespec64 current_time(struct inode *inode)
> > > +{
> > > +	if (is_mgtime(inode))
> > > +		return current_mgtime(inode);
> > > +	return current_coarse_time(inode);
> > > +}
> > > +EXPORT_SYMBOL(current_time);
> > > +
> > 
> > So if you modify current_time() to handle multigrain timestamps the code
> > will be still racy. In particular fill_mg_cmtime() can race with
> > inode_set_ctime_current() like:
> > 
> > fill_mg_cmtime()				inode_set_ctime_current()
> >   stat->mtime = inode->i_mtime;
> >   stat->ctime.tv_sec = inode->__i_ctime.tv_sec;
> > 						  now = current_time();
> > 							/* fetches coarse
> > 							 * grained timestamp */
> >   stat->ctime.tv_nsec = atomic_long_fetch_or(I_CTIME_QUERIED, pnsec) &
> > 				~I_CTIME_QUERIED;
> > 						  inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
> > 
> > and the information about a need for finegrained timestamp update gets
> > lost. So what I'd propose is to leave current_time() alone (just always
> > reporting coarse grained timestamps) and put all the magic into
> > inode_set_ctime_current() only. There we need something like:
> > 
> > struct timespec64 inode_set_ctime_current(struct inode *inode)
> > {
> > 	... variables ...
> > 
> > 	nsec = READ_ONCE(inode->__i_ctime.tv_nsec);
> >  	if (!(nsec & I_CTIME_QUERIED)) {
> > 		now = current_time(inode);
> > 
> > 		if (!is_gmtime(inode)) {
> > 			inode_set_ctime_to_ts(inode, now);
> > 		} else {
> > 			/*
> > 			 * If we've recently fetched a fine-grained
> > 			 * timestamp then the coarse-grained one may still
> > 			 * be earlier than the existing one. Just keep the
> > 			 * existing ctime if so.
> > 			 */
> > 			ctime = inode_get_ctime(inode);
> > 			if (timespec64_compare(&ctime, &now) > 0)
> > 				now = ctime;
> > 
> > 			/*
> > 			 * Ctime updates are generally protected by inode
> > 			 * lock but we could have raced with setting of
> > 			 * I_CTIME_QUERIED flag.
> > 			 */
> > 			if (cmpxchg(&inode->__i_ctime.tv_nsec, nsec,
> > 				    now.tv_nsec) != nsec)
> > 				goto fine_grained;
> > 			inode->__i_ctime.tv_sec = now.tv_sec;
> > 		}
> > 		return now;
> > 	}
> > fine_grained:
> > 	ktime_get_real_ts64(&now);
> > 	inode_set_ctime_to_ts(inode, now);
> > 
> > 	return now;
> > }
> > 
> > 								Honza
> > 
> 
> This is a great idea. I'll rework the series along the lines you
> suggest. That also answers my earlier question to Christian:
> 
> I'll just resend the whole series (it's not very big anyway), and I'll
> include the fill_mg_cmtime prototype change.

Ok, sound good!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
