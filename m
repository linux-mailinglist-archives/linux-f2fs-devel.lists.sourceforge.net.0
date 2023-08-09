Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC21776334
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 17:01:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTkgC-0000UB-8R;
	Wed, 09 Aug 2023 15:00:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qTkg9-0000Tt-Am
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 15:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T9pM1doI1agk+X2MmwPKol+CkTUFgsM83Ac97tdZe88=; b=UMe+Gz8l+oNkGaxQ5ae8AL6IiV
 anMHPSMymEMwxHNI7QmfUSGDh8JJZCPT9JuBSBJHZxLL8zXsZc4Zbz7ZERkF93bDSmQEjWEGUxl/+
 mvaKe+HVy5uEHfjehFxNH+7wwrE7Anb3sCZcOMxMABLVkwuOZilgn33EqJqw8V20haBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T9pM1doI1agk+X2MmwPKol+CkTUFgsM83Ac97tdZe88=; b=ks+4JjiB1ir2Rt7dRccfwfCH2W
 2GkwrHBTBeXb7Tzdxz2xip8Dl2PAX4dMSkds2MAgM7ohdQYBttbppaQTrAIZyDJL9/Qk+wuOeGVAN
 G9wupnGjuA99yW5YHbZlqnLss4/KUBbV3HghZJNJNx5bIlZRUiOiVJ5Gq/O8byC1TbE4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTkg4-000cOf-7u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 15:00:52 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B36721F38C;
 Wed,  9 Aug 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691593241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T9pM1doI1agk+X2MmwPKol+CkTUFgsM83Ac97tdZe88=;
 b=PhVUi/uOUAMtA9N5d0/Cfyd7ajz4cp2kJoUJhaQu6DDg/4ZBR2ulD5NnnIutb+RvTgOhZu
 va3jLTw2VLniHCcL7mPa8wCZF+q+F4znEx4s9wuxLkAbwAMW1TTsE6/P2XRHAKC2zla6BB
 rR1DtgPeT6Q9ikUt3HY3IlDOz+sGSpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691593241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T9pM1doI1agk+X2MmwPKol+CkTUFgsM83Ac97tdZe88=;
 b=cqqb6K6iG6a7Y6ZZq2rzMwz1c5y090ilDlyL/8hMS5IblOhw3I1NrjIjlnRdaQl5+/nifI
 AlcMBSfF0kUhaGAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91AA713596;
 Wed,  9 Aug 2023 15:00:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6+fVIhmq02RwPAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 09 Aug 2023 15:00:41 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1BAC9A0769; Wed,  9 Aug 2023 17:00:41 +0200 (CEST)
Date: Wed, 9 Aug 2023 17:00:41 +0200
From: Jan Kara <jack@suse.cz>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Message-ID: <20230809150041.452w7gucjmvjnvbg@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
 <878rak8hia.fsf@mail.parknet.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878rak8hia.fsf@mail.parknet.co.jp>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 09-08-23 22:36:29, OGAWA Hirofumi wrote: > Jeff Layton
 <jlayton@kernel.org> writes: > > > On Wed, 2023-08-09 at 17:37 +0900, OGAWA
 Hirofumi wrote: > >> Jeff Layton <jlayton@kernel.org> writes: [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
X-Headers-End: 1qTkg4-000cOf-7u
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
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>,
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
 ntfs3@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
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

On Wed 09-08-23 22:36:29, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > On Wed, 2023-08-09 at 17:37 +0900, OGAWA Hirofumi wrote:
> >> Jeff Layton <jlayton@kernel.org> writes:
> >> 
> >> > Also, it may be that things have changed by the time we get to calling
> >> > fat_update_time after checking inode_needs_update_time. Ensure that we
> >> > attempt the i_version bump if any of the S_* flags besides S_ATIME are
> >> > set.
> >> 
> >> I'm not sure what it meaning though, this is from
> >> generic_update_time(). Are you going to change generic_update_time()
> >> too? If so, it doesn't break lazytime feature?
> >> 
> >
> > Yes. generic_update_time is also being changed in a similar fashion.
> > This shouldn't break the lazytime feature: lazytime is all about how and
> > when timestamps get written to disk. This work is all about which
> > clocksource the timestamps originally come from.
> 
> I can only find the following update in this series, another series
> updates generic_update_time()? The patch updates only if S_VERSION is
> set.
> 
> Your fat patch sets I_DIRTY_SYNC always instead of I_DIRTY_TIME. When I
> last time checked lazytime, and it was depending on I_DIRTY_TIME.
> 
> Are you sure it doesn't break lazytime? I'm totally confusing, and
> really similar with generic_update_time()?

Since you are talking past one another with Jeff let me chime in here :). I
think you are worried about this hunk:

-	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
 		dirty_flags |= I_DIRTY_SYNC;

which makes the 'flags' test pass even if we just modified ctime or mtime.
But do note the second part of the if - inode_maybe_inc_iversion() - so we
are going to mark the inode dirty with I_DIRTY_SYNC only if someone queried
iversion since the last time we have incremented it.

So this hunk is not really changing how inode is marked dirty, it only
changes how often we check whether iversion needs increment and that should
be fine (and desirable). Hence lazytime isn't really broken by this in any
way.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
