Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7C7A7BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 13:57:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qivpM-0001zc-Kc;
	Wed, 20 Sep 2023 11:57:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qivpH-0001zO-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 11:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v+kxoG9eOGJ5xusIWXasOkiwnORCBCOMs4NdoCLCV+Y=; b=PEPUxsp9nNHKdlEmdhXvLhSQvn
 8TNPkKhPreJLRqEsnNq1niBZwLLvRoM/gW39Q0P/HXKVQiZHzB1uz2kLdQ7gs9MuRXYNJFi05hX7f
 DCluYwFYWMAVvj+Mfa8MAsx7YFTOeyy/22dy6dMT1PpJZsnVeijWHGfra2BlLWgycG8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v+kxoG9eOGJ5xusIWXasOkiwnORCBCOMs4NdoCLCV+Y=; b=A97EjphEm9hC9QC9hvMXLymb7+
 HjoYgvsVO/KhjXTLoXQWGgGHFhYlN+KYJR5wtPhPt2fk3Q0Pdns15RdMqmgijAE8yQWZJsmwjgh1j
 QDEOqHC9+tQ2gm4I8g+xkFi57udzJnTveB4H4KfbnMztSbweCG8mY+Xond/GFTkRUKlo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qivpF-00GdhQ-Dp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 11:57:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 877BDB81BEB;
 Wed, 20 Sep 2023 11:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677F3C433CD;
 Wed, 20 Sep 2023 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695211011;
 bh=v+kxoG9eOGJ5xusIWXasOkiwnORCBCOMs4NdoCLCV+Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Rg4SDYT2G/5iLIMjOccnvEi1JiFZ6DWISJeHQBkraG1wlEzFngIZ40YiKunM8cbSc
 +aGiW2BG1XlefCOYsICZDxSIj/cycJoqoVgH21scC+LvhZuM/I7QY33SH4s37GiB3i
 xx8VoYkq8098drZ1/id4lmBEMu3eQVNXWTxAUaEp2MAhsi3wNH08SmNvjfcYqsJCu1
 KXrrrvTysK40Yb4V8RFHdyvz2X1AZgX3gj24E21SykmhPZrGV8Spjbs29Y+Wz+E6KX
 beC0Mxqh0EOjy/WL/hLY5L03MPDQWMARcGn8Qnl4hdNKDEe2Is8D1IwBJNuuGtXBBF
 rmhEIbbPeuCGA==
Message-ID: <35c28758a9cc28a276a6b4b4ae8a420a1444e711.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Date: Wed, 20 Sep 2023 07:56:43 -0400
In-Reply-To: <20230920-raser-teehaus-029cafd5a6e4@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
 <20230920-raser-teehaus-029cafd5a6e4@brauner>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-09-20 at 13:48 +0200, Christian Brauner wrote:
 > > > > While we initially thought we can do this unconditionally it turns
 out > > > > that this might break existing workloads that rely on [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qivpF-00GdhQ-Dp
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
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
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Benjamin Coddington <bcodding@redhat.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bo b Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2023-09-20 at 13:48 +0200, Christian Brauner wrote:
> > > > While we initially thought we can do this unconditionally it turns out
> > > > that this might break existing workloads that rely on timestamps in very
> > > > specific ways and we always knew this was a possibility. Move
> > > > multi-grain timestamps behind a vfs mount option.
> > > 
> > > Surely this is a safe choice as it moves the responsibility to the sysadmin
> > > and the cases where finegrained timestamps are required. But I kind of
> > > wonder how is the sysadmin going to decide whether mgtime is safe for his
> > > system or not? Because the possible breakage needn't be obvious at the
> > > first sight...
> > > 
> > 
> > That's the main reason I really didn't want to go with a mount option.
> > Documenting that may be difficult. While there is some pessimism around
> > it, I may still take a stab at just advancing the coarse clock whenever
> > we fetch a fine-grained timestamp. It'd be nice to remove this option in
> > the future if that turns out to be feasible.
> > 
> > > If I were a sysadmin, I'd rather opt for something like
> > > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > > functionality). That should avoid the IO overhead of finegrained timestamps
> > > as well and I'd know I can have problems with timestamps only after a
> > > system crash.
> > 
> > > I've just got another idea how we could solve the problem: Couldn't we
> > > always just report coarsegrained timestamp to userspace and provide access
> > > to finegrained value only to NFS which should know what it's doing?
> > > 
> > 
> > I think that'd be hard. First of all, where would we store the second
> > timestamp? We can't just truncate the fine-grained ones to come up with
> > a coarse-grained one. It might also be confusing having nfsd and local
> > filesystems present different attributes.
> 
> As far as I can tell we have two options. The first one is to make this
> into a mount option which I really think isn't a big deal and lets us
> avoid this whole problem while allowing filesytems exposed via NFS to
> make use of this feature for change tracking.
> 
> The second option is that we turn off fine-grained finestamps for v6.6
> and you get to explore other options.
> 
> It isn't a big deal regressions like this were always to be expected but
> v6.6 needs to stabilize so anything that requires more significant work
> is not an option.

Oh, absolutely.

I wasn't proposing to do that work for v6.6. For that, we absolutely
either need the mount option or to just revert the mgtime conversions.

My plan was to take a stab at doing this for a later kernel release.
This is very much a "back to the drawing board" idea. It may not pan out
after all, but if it does then we could consider removing the mount
option at that point.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
