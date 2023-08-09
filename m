Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C76557766CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 19:59:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTnTE-0002FJ-1e;
	Wed, 09 Aug 2023 17:59:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qTnTC-0002F7-8v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 17:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJYkWobh6KEl/9KBdVbAet9rd5oJbzUXYYantWtSSuI=; b=TnvDKsf+fc1lNr6EG8va5Qk9Dj
 9p24eqfL4nKVMHTwpQzcVUay47kT/eMoMRtbC+hoG1UqDOHBDgVmwbdkBT71TtEZUmVgtyCR4LYa/
 LsZHPHecSjb9ru7M5LpH7jZM0ToemMGiUQB2xL0FEQKTluauu4QVRWUeAsGkry0a+19c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZJYkWobh6KEl/9KBdVbAet9rd5oJbzUXYYantWtSSuI=; b=Lrq9HTFe6OkJ+UL1VeBzm+kNkZ
 BAjmnSxsIQuRnexl9NBwlVjtMi/FVMZWCMkAU2HQOGM31K+1O0IwTHkYy9c5Ma5v+FIsDdMKewe1Q
 rpi4kog5J6Zrw8sw3C5aNZFgSaj2TZLWGz3tF5BIARM8lGwOBHE7g9L8D8Naiq+Nii4Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTnTA-0003T7-Ce for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 17:59:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A7C864360;
 Wed,  9 Aug 2023 17:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5192AC433C8;
 Wed,  9 Aug 2023 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691603973;
 bh=xOe+Vz95v0qUUg0QOdDgphymvgENzflkYZLnMMULJfc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=meGLBjWxluzaOBNuo8p0RmOQwgxUuFNZjvOIrqHLsT0YVm/rgDHwnHDJAx99/2L/o
 bhtobjoD8C6zGB5rdBPrQ785IrHaS3N4jJtTCfHc34NT0geG1/U9IaQFq3S4WuZ+t8
 gzoPyUaQOM1ROi1uUYhm2o1c3laLFRiCZK/Lx2Wm4O80TbvA4CQm+kAJim7vyqiQ1H
 44XIoEDh201mHVX5XJvZmC/E4Ogx1IKt/t/nyvPCcopm66rc52em9DBbgLmnfaxUsA
 shBRwdOI1wQgTtwpw38zZcoHm5c5hE7yNnsry2zyL7HvpHmwfSKALId/x1hyiXL2cb
 CwGZoXi1fmKhQ==
Message-ID: <ccffe6ca3397c8374352b002fe01d55b09d84ef4.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Wed, 09 Aug 2023 13:59:26 -0400
In-Reply-To: <87leek6rh1.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
 <878rak8hia.fsf@mail.parknet.co.jp>
 <20230809150041.452w7gucjmvjnvbg@quack3>
 <87v8do6y8q.fsf@mail.parknet.co.jp>
 <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
 <87leek6rh1.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-08-10 at 02:44 +0900, OGAWA Hirofumi wrote: >
 Jeff Layton <jlayton@kernel.org> writes: > > > On Thu, 2023-08-10 at 00:17
 +0900, OGAWA Hirofumi wrote: > > > Jan Kara <jack@suse.cz> writes: [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qTnTA-0003T7-Ce
Subject: Re: [f2fs-dev] [PATCH v7 05/13] fat: make fat_update_time get its
 own timestamp
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
 Jan Kara <jack@suse.cz>, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-unionfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Benjamin Coddington <bcodding@redhat.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 codalist@telemann.coda.cs.cmu.edu, Shyam Prasad N <sprasad@microsoft.com>,
 Amir Goldstein <amir73il@gmail.com>, Kees Cook <keescook@chromium.org>,
 ocfs2-devel@lists.linux.dev, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2023-08-10 at 02:44 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > On Thu, 2023-08-10 at 00:17 +0900, OGAWA Hirofumi wrote:
> > > Jan Kara <jack@suse.cz> writes:
> 
> [...]
> 
> > My mistake re: lazytime vs. relatime, but Jan is correct that this
> > shouldn't break anything there.
> 
> Actually breaks ("break" means not corrupt fs, means it breaks lazytime
> optimization). It is just not always, but it should be always for some
> userspaces.
> 
> > The logic in the revised generic_update_time is different because FAT is
> > is a bit strange. fat_update_time does extra truncation on the timestamp
> > that it is handed beyond what timestamp_truncate() does.
> > fat_truncate_time is called in many different places too, so I don't
> > feel comfortable making big changes to how that works.
> > 
> > In the case of generic_update_time, it calls inode_update_timestamps
> > which returns a mask that shows which timestamps got updated. It then
> > marks the dirty_flags appropriately for what was actually changed.
> > 
> > generic_update_time is used across many filesystems so we need to ensure
> > that it's OK to use even when multigrain timestamps are enabled. Those
> > haven't been enabled in FAT though, so I didn't bother, and left it to
> > dirtying the inode in the same way it was before, even though it now
> > fetches its own timestamps from the clock. Given the way that the mtime
> > and ctime are smooshed together in FAT, that seemed reasonable.
> > 
> > Is there a particular case or flag combination you're concerned about
> > here?
> 
> Yes. Because FAT has strange timestamps that different granularity on
> disk . This is why generic time truncation doesn't work for FAT.
> 
> Well anyway, my concern is the only following part. In
> generic_update_time(), S_[CM]TIME are not the cause of I_DIRTY_SYNC if
> lazytime mode.
> 
> -	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> +	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
> 		dirty_flags |= I_DIRTY_SYNC;
> 

That would be wrong. The problem is that we're changing how update_time
works:

Previously, update_time was given a timestamp and a set of S_* flags to
indicate which fields should be updated. Now, update_time is not given a
timestamp. It needs to fetch it itself, but that subtly changes the
meaning of the flags field.

It now means "these fields needed to be updated when I last checked".
The timestamp and i_version may now be different from when the flags
field was set. This means that if any of S_CTIME/S_MTIME/S_VERSION were
set that we need to attempt to update all 3 of them. They may now be
different from the timestamp or version that we ultimately end up with.

The above may look to you like it would always cause I_DIRTY_SYNC to be
set on any ctime or mtime update, but inode_maybe_inc_iversion only
returns true if it actually updated i_version, and it only does that if
someone issued a ->getattr against the file since the last time it was
updated.

So, this shouldn't generate any more DIRTY_SYNC updates than it did
before.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
