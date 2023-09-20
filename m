Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CE7A7936
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 12:31:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiuUM-0001ob-Uk;
	Wed, 20 Sep 2023 10:31:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qiuUL-0001oV-Bk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 10:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LidcND7Q/xmM84vuZ4VuyfAyXYB6v9Bl/dE44NrgDCA=; b=TKToI8vHmM9AT9UqTuqkM9gpZW
 1LIzFddFWcgiFKnD18pRecyYS/9cO928222YS9f7GXfhItMnTzlaU7IEeDpHLyoSADaj80LsD8zP9
 LYx4cwMn0fI2t6p5q+1ICWtEAg9MQhCEc5fUXdjh01uvgO+/pDVmWGAnKUv0Wew7LRjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LidcND7Q/xmM84vuZ4VuyfAyXYB6v9Bl/dE44NrgDCA=; b=A4N+vDUxCsAQa5And2nnyIczR7
 8RCfJFsUwZn2uJ8NKItCFvXjDzGIokKenalKknCJeIQiNl3gNjZf87ybCEwmAdSFoyC8HW/GKERxi
 TPxca6G00Obf+8mkm9qPbiBV06bA3VO0aGYB5YaGdS/4Nb/k6XyQXS3xak3Xbzxd2XkM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qiuUK-0004Um-MW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 10:31:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 150BDCE1AD9;
 Wed, 20 Sep 2023 10:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6BEC433C8;
 Wed, 20 Sep 2023 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695205872;
 bh=oNOjwO1HWGBEpf3cBBh7axaasl75uB0qI4wAwRxWmjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m6K8pKJQEI2XsNKvGrTrUHZ4zNBx1PSzyYqaLhuL0UOA1rjOR0Sx+7Q/i8/z7W2QM
 SYGnkRAETNJ1YNqDE0jn02DsKPLnvT8Dlj7iQnQ1NkXBXxwS3bUvTlfmUmGNpqgnAt
 d9oRMMoNiJkxZxIEdxaattLdKZ+MxAOm6lzE9eOQq2WB04LbxlLCzO0W+i/lJa8N3o
 D3d0gZ8gcOuG4Q3xgoC9uMM7ew2rnaw5/drkoL/cZCwmQy5vWhB2Aze+Bi6z8jD2nY
 hy6BhkvXGhnFluc2A7TLkA6msDJfc0kYbpv59oX9ohVHSRtCeqb94+OWZe5Em0hGQ9
 ZunGxe0rj22wg==
Date: Wed, 20 Sep 2023 12:30:52 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230920-kaulquappen-computer-0a4a0e4c3c71@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920101731.ym6pahcvkl57guto@quack3>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 20, 2023 at 12:17:31PM +0200, Jan Kara wrote:
 > On Wed 20-09-23 10:41:30,
 Christian Brauner wrote: > > > > f1 was last written
 to *after* f2 was last written to. If the timestamp of f1 > > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
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
X-Headers-End: 1qiuUK-0004Um-MW
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
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, samba-technical@lists.samba.org,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, Amir Goldstein <l@gmail.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, bug-gnulib@gnu.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Gao Xiang <xiang@kernel.org>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
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
 ntfs3@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
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

On Wed, Sep 20, 2023 at 12:17:31PM +0200, Jan Kara wrote:
> On Wed 20-09-23 10:41:30, Christian Brauner wrote:
> > > > f1 was last written to *after* f2 was last written to. If the timestamp of f1
> > > > is then lower than the timestamp of f2, timestamps are fundamentally broken.
> > > > 
> > > > Many things in user-space depend on timestamps, such as build system
> > > > centered around 'make', but also 'find ... -newer ...'.
> > > > 
> > > 
> > > 
> > > What does breakage with make look like in this situation? The "fuzz"
> > > here is going to be on the order of a jiffy. The typical case for make
> > > timestamp comparisons is comparing source files vs. a build target. If
> > > those are being written nearly simultaneously, then that could be an
> > > issue, but is that a typical behavior? It seems like it would be hard to
> > > rely on that anyway, esp. given filesystems like NFS that can do lazy
> > > writeback.
> > > 
> > > One of the operating principles with this series is that timestamps can
> > > be of varying granularity between different files. Note that Linux
> > > already violates this assumption when you're working across filesystems
> > > of different types.
> > > 
> > > As to potential fixes if this is a real problem:
> > > 
> > > I don't really want to put this behind a mount or mkfs option (a'la
> > > relatime, etc.), but that is one possibility.
> > > 
> > > I wonder if it would be feasible to just advance the coarse-grained
> > > current_time whenever we end up updating a ctime with a fine-grained
> > > timestamp? It might produce some inode write amplification. Files that
> > 
> > Less than ideal imho.
> > 
> > If this risks breaking existing workloads by enabling it unconditionally
> > and there isn't a clear way to detect and handle these situations
> > without risk of regression then we should move this behind a mount
> > option.
> > 
> > So how about the following:
> > 
> > From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
> > From: Christian Brauner <brauner@kernel.org>
> > Date: Wed, 20 Sep 2023 10:00:08 +0200
> > Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option
> > 
> > While we initially thought we can do this unconditionally it turns out
> > that this might break existing workloads that rely on timestamps in very
> > specific ways and we always knew this was a possibility. Move
> > multi-grain timestamps behind a vfs mount option.
> > 
> > Signed-off-by: Christian Brauner <brauner@kernel.org>
> 
> Surely this is a safe choice as it moves the responsibility to the sysadmin
> and the cases where finegrained timestamps are required. But I kind of
> wonder how is the sysadmin going to decide whether mgtime is safe for his
> system or not? Because the possible breakage needn't be obvious at the
> first sight... If I were a sysadmin, I'd rather opt for something like

I think you'll basically enable this because you want to export a
filesystem via NFS.

> finegrained timestamps + lazytime (if I needed the finegrained timestamps
> functionality). That should avoid the IO overhead of finegrained timestamps

That would work with this patch, no? Or are you saying it would need
something else?

> as well and I'd know I can have problems with timestamps only after a
> system crash.
> 
> I've just got another idea how we could solve the problem: Couldn't we
> always just report coarsegrained timestamp to userspace and provide access
> to finegrained value only to NFS which should know what it's doing?

What would changes would be involved for that?

If this is invasive work and we decide this is something that we want to
do then we should remove FS_MGTIME from btrfs, xfs, ext4, and tmpfs for
v6.6.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
