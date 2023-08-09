Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87C776BEA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Aug 2023 00:07:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTrLH-0005Ob-Ie;
	Wed, 09 Aug 2023 22:07:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qTrLE-0005DU-6O
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 22:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H9IbH6+57da+z9TY8RVSNuba4Oxlp4Zqiw/waeZJsjI=; b=cPC+w9PPCVjLmY0FkTTJ+jDAJa
 lIXFup5oYyaAS5AJwQDaKkz6/Rz/vvusHieR/vS2EMrWC2NbCWNV5AIwVDkEL0f0v0yK5CbqC7zCL
 YqNuZ1qYzvlo0MiqHUsxKT0n6k4D+KBq+GUIPxMi7yPWyeV9DiK+lBGxO21G0xEnW4+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H9IbH6+57da+z9TY8RVSNuba4Oxlp4Zqiw/waeZJsjI=; b=Vz9ClzvOWaj3lK4ePKm618h3z9
 l0S2V66G78w2mJHbRRqC0Iw1VdE8FvC7da3WAQ2dj9Rbx9EPq1/Qc+J0wcJR91DL5zh8dnI+0okxz
 yAcryYdWaPWOj0ZxmlQvEvHAMjUM2OIO27dWRlpFniAiaVPZdDsw/064qynD5fAm+7d0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTrLD-000tIy-I1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 22:07:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C164F6142A;
 Wed,  9 Aug 2023 22:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A1FC433C8;
 Wed,  9 Aug 2023 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691618857;
 bh=Sbngo3UIZo2TJfFo7ktsW7U9FXdWGIk5Lt7H9K5XFM8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jLUEcluJ8QWu44nwg8FvEto5mxdSD6jhT4hkYGZFSvOuTab/uQF0xUgz8zLDtJscq
 f+HBUBgdFJj3+Y2ejcBWfM2DahqOuHFBxu+LY+Hv0Ofoq0ohoPPQ6mfudIqZwl+oWN
 pLNza58hUz5pcfryyZpEKO+0VcHneBut5CYMVVo+IlIVXRYDByI99w4/3LNaQTR8ZH
 5Tcm+fOwhAMw+LBYRd9XcCm1AD2BTsoO11JuCHNeGAZ3X/S7nnQe6dSMtz75w2+y5t
 1AyLcsRC7pto0A+XhqMGGaQoyj7sZyZ0q03rK2TphlgLtVEfD926pjyggGNcgTjePk
 OQw0IGY/USDEA==
Message-ID: <e4cee2590f5cb9a13a8d4445e550e155d551670d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Frank Sorenson
 <sorenson@redhat.com>
Date: Wed, 09 Aug 2023 18:07:29 -0400
In-Reply-To: <87a5v06kij.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
 <878rak8hia.fsf@mail.parknet.co.jp>
 <20230809150041.452w7gucjmvjnvbg@quack3>
 <87v8do6y8q.fsf@mail.parknet.co.jp>
 <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
 <87leek6rh1.fsf@mail.parknet.co.jp>
 <ccffe6ca3397c8374352b002fe01d55b09d84ef4.camel@kernel.org>
 <87h6p86p9z.fsf@mail.parknet.co.jp>
 <edf8e8ca3b38e56f30e0d24ac7293f848ffee371.camel@kernel.org>
 <87a5v06kij.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-08-10 at 05:14 +0900, OGAWA Hirofumi wrote: >
 Jeff Layton <jlayton@kernel.org> writes: > > > When you say it "doesn't work
 the same", what do you mean, specifically? > > I had to make som [...] 
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
X-Headers-End: 1qTrLD-000tIy-I1
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

On Thu, 2023-08-10 at 05:14 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
> 
> > When you say it "doesn't work the same", what do you mean, specifically?
> > I had to make some allowances for the fact that FAT is substantially
> > different in its timestamp handling, and I tried to preserve existing
> > behavior as best I could.
> 
> Ah, ok. I was misreading some.
> 
> inode_update_timestamps() checks IS_I_VERSION() now, not S_VERSION.  So,
> if adding the check of IS_I_VERSION() and (S_MTIME|S_CTIME|S_VERSION) to
> FAT?
> 
> With it, IS_I_VERSION() would be false on FAT, and I'm fine.
> 
> I.e. something like
> 
> 	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && IS_I_VERSION(inode)
> 	    && inode_maybe_inc_iversion(inode, false))
>   		dirty_flags |= I_DIRTY_SYNC;
> 
> Thanks.

If you do that then the i_version counter would never be incremented.
But...I think I see what you're getting at.

Most filesystems that support the i_version counter have an on-disk
field for it. FAT obviously has no such thing. I suspect the i_version
bits in fat_update_time were added by mistake. FAT doesn't set
SB_I_VERSION so there's no need to do anything to the i_version field at
all.

Also, given that the mtime and ctime are always kept in sync on FAT,
we're probably fine to have it look something like this:

--------------------8<------------------
int fat_update_time(struct inode *inode, int flags) 
{ 
        int dirty_flags = 0;

        if (inode->i_ino == MSDOS_ROOT_INO) 
                return 0;

        fat_truncate_time(inode, NULL, flags);
        if (inode->i_sb->s_flags & SB_LAZYTIME)
                dirty_flags |= I_DIRTY_TIME;
        else
                dirty_flags |= I_DIRTY_SYNC;

        __mark_inode_dirty(inode, dirty_flags);
        return 0;
} 
--------------------8<------------------

...and we should probably do that in a separate patch in advance of the
update_time rework, since it's really a different change.

If you're in agreement, then I'll plan to respin the series with this
fixed and resend.

Thanks for being patient!
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
