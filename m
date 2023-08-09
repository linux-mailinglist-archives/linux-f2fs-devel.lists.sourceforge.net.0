Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B817756E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 12:11:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTg9q-0001S6-Pd;
	Wed, 09 Aug 2023 10:11:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qTg9o-0001S0-NQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 10:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eo2i7uJldKNgBm+LFT1PDtuMgoSPe8eMQdEaVs2mYLQ=; b=KBCHLCixbRd5RDJH9WM2eEN4xe
 uT5dDnPSHVoNBKETmACne3jMuckSRJVLRpZNNR/CHELwjD+4CCILRNy8Y8eQ5s/56n2qwhWUA52fY
 NTXQBXaS+99NW4l0l1xLqjxfi9UZcnsnokuzJRoGo6SRpBrwXOhS6/T4hPnjcRPBRwkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eo2i7uJldKNgBm+LFT1PDtuMgoSPe8eMQdEaVs2mYLQ=; b=ivlpS62bSk3pVSYm+yWQCoeRSW
 IcyioyWziuzrEMQuOHr8jrPuwue23nqHjYY3zOdzhCH0LraK/pGxUJkStPjoVXtqrvMGN0JQvOOJL
 2Jk/qdEq9ZZTDC+aLUhtu24MqgbHgcnhCVdtXCVpLyA8IQhfJo4KDZGVWWWYLZ4MAAHA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTg9j-0007IX-PB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 10:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F082630EB;
 Wed,  9 Aug 2023 10:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD92C433C7;
 Wed,  9 Aug 2023 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691575861;
 bh=3EDdk7dTfHs3Hy9RVE0ybDbynTaUkeq4N9itCD5SIYI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=SLiD6EwBwAaKjaENOfNjWpIjgTZ7uN7B4ABF6+Bc5uUdhACL29f5ZDgIl8J0BIcLg
 dmmWF/N3vxvPZnbf7qCfoiMntKQ5KpepxLV423OWizDLKnMdMdTqG2pBQ96c7iVI/q
 6jxcOzT1tUDuUKredqtZ802zOA9COiRKKjMvkV8B5wrgxL3TdF/tBsrcopqwbxnBca
 PDqh4/C6S52dVHwYp/5zmkTrm4IUk3O7TYiV8whC/vrlI1m9OAGJxPareUgxFZUC+2
 I7slyRMFE6wXePxHgLcOI25zOvoPWown/lV3vive98S0wwvTwTzicYt9+73JrhgKdm
 fHO15Q9CkD8KA==
Message-ID: <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Wed, 09 Aug 2023 06:10:53 -0400
In-Reply-To: <87msz08vc7.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-08-09 at 17:37 +0900, OGAWA Hirofumi wrote: >
 Jeff Layton <jlayton@kernel.org> writes: > > > Also, it may be that things
 have changed by the time we get to calling > > fat_update_time aft [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qTg9j-0007IX-PB
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
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Darrick
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

On Wed, 2023-08-09 at 17:37 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > Also, it may be that things have changed by the time we get to calling
> > fat_update_time after checking inode_needs_update_time. Ensure that we
> > attempt the i_version bump if any of the S_* flags besides S_ATIME are
> > set.
> 
> I'm not sure what it meaning though, this is from
> generic_update_time(). Are you going to change generic_update_time()
> too? If so, it doesn't break lazytime feature?
> 

Yes. generic_update_time is also being changed in a similar fashion.
This shouldn't break the lazytime feature: lazytime is all about how and
when timestamps get written to disk. This work is all about which
clocksource the timestamps originally come from.

> Thanks.
> 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/fat/misc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> > index 67006ea08db6..8cab87145d63 100644
> > --- a/fs/fat/misc.c
> > +++ b/fs/fat/misc.c
> > @@ -347,14 +347,14 @@ int fat_update_time(struct inode *inode, struct timespec64 *now, int flags)
> >  		return 0;
> >  
> >  	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> > -		fat_truncate_time(inode, now, flags);
> > +		fat_truncate_time(inode, NULL, flags);
> >  		if (inode->i_sb->s_flags & SB_LAZYTIME)
> >  			dirty_flags |= I_DIRTY_TIME;
> >  		else
> >  			dirty_flags |= I_DIRTY_SYNC;
> >  	}
> >  
> > -	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> > +	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
> >  		dirty_flags |= I_DIRTY_SYNC;
> >  
> >  	__mark_inode_dirty(inode, dirty_flags);
> 

-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
