Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9EC7A68FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Sep 2023 18:31:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiddO-00035L-Mp;
	Tue, 19 Sep 2023 16:31:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qiddK-00035F-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 16:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YOWI6/JAFOB4t8+Jl1G0UAU2WJNOEKR+ozWrF+wCHw=; b=PYmTSnkepDcDHu4yJ8dG+TRJ7p
 fgCqe8QT9DtnZk12nkmzkJNikU4bLgBxy7epTQWrYdtfUwErFygur61+pw5LjKm4WWD6DNn1Se6SL
 3uOtHDyGWCR8Sl0czSamQ+iJdtrdreh39HJIj7ETyp91Rw5BoV27zDE4zBFo1xywBsQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2YOWI6/JAFOB4t8+Jl1G0UAU2WJNOEKR+ozWrF+wCHw=; b=WPJDHhmZZIUmw9arxx7GiGU3U7
 vszI8b+suOPF3D8neVuRtT/UkhUOuS8FnvqrnjwHAC3bQF+rH96N4CKV20PFkC3chTeoOQ60j7iCo
 EYZKZatgzDix/rjQji8diU4OUn/lKDqq71pR3Wxuof/qF8H2AE7Dr1K3l0CFkJDoxxFc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qiddI-0007pT-F4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 16:31:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8CD0BCE139A;
 Tue, 19 Sep 2023 16:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A27C433CD;
 Tue, 19 Sep 2023 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695141076;
 bh=2YOWI6/JAFOB4t8+Jl1G0UAU2WJNOEKR+ozWrF+wCHw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=NSgO9mQ/kogScKOyruXs27QKGb28KeH5iN8518jdQIxYZ9Zq8W5Yeb8HJpLNbIZ40
 EQDdGtIWCMRwCZr+hkVhSKagEDB2fBTdAzDnNexBTyvRGH8+mWpGC7k4O3oOthSODy
 kLPJh5RYmd+l51ixbejRXP63ZyU1UyglaFGETEGRw2BGftvafb/kUzhWZeRY/B1ibo
 Wti21rW2JgdQmcow8/EHQlT7uWQR0pPH/ecD4lkrfORAvjqUH6xcDxBDFUTwISNY24
 GBmtqEOt9wCW1B2y4/2rn4A5SVB2ofaAjm8Z64p+ka1gu4ZTZ9u3KdunqSf9K8+AlP
 OJGP0iADrktsQ==
Message-ID: <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Bruno Haible <bruno@clisp.org>, Jan Kara <jack@suse.cz>, Xi Ruoyao
 <xry111@linuxfromscratch.org>, bug-gnulib@gnu.org
Date: Tue, 19 Sep 2023 12:31:08 -0400
In-Reply-To: <4511209.uG2h0Jr0uP@nimes>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2023-09-19 at 16:52 +0200, Bruno Haible wrote: > Jeff
 Layton wrote: > > I'm not sure what we can do for this test. The nap()
 function
 is making > > an assumption that the timestamp granularity [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qiddI-0007pT-F4
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
 linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
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
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2023-09-19 at 16:52 +0200, Bruno Haible wrote:
> Jeff Layton wrote:
> > I'm not sure what we can do for this test. The nap() function is making
> > an assumption that the timestamp granularity will be constant, and that
> > isn't necessarily the case now.
> 
> This is only of secondary importance, because the scenario by Jan Kara
> shows a much more fundamental breakage:
> 
> > > The ultimate problem is that a sequence like:
> > > 
> > > write(f1)
> > > stat(f2)
> > > write(f2)
> > > stat(f2)
> > > write(f1)
> > > stat(f1)
> > > 
> > > can result in f1 timestamp to be (slightly) lower than the final f2
> > > timestamp because the second write to f1 didn't bother updating the
> > > timestamp. That can indeed be a bit confusing to programs if they compare
> > > timestamps between two files. Jeff?
> > > 
> > 
> > Basically yes.
> 
> f1 was last written to *after* f2 was last written to. If the timestamp of f1
> is then lower than the timestamp of f2, timestamps are fundamentally broken.
> 
> Many things in user-space depend on timestamps, such as build system
> centered around 'make', but also 'find ... -newer ...'.
> 


What does breakage with make look like in this situation? The "fuzz"
here is going to be on the order of a jiffy. The typical case for make
timestamp comparisons is comparing source files vs. a build target. If
those are being written nearly simultaneously, then that could be an
issue, but is that a typical behavior? It seems like it would be hard to
rely on that anyway, esp. given filesystems like NFS that can do lazy
writeback.

One of the operating principles with this series is that timestamps can
be of varying granularity between different files. Note that Linux
already violates this assumption when you're working across filesystems
of different types.

As to potential fixes if this is a real problem:

I don't really want to put this behind a mount or mkfs option (a'la
relatime, etc.), but that is one possibility.

I wonder if it would be feasible to just advance the coarse-grained
current_time whenever we end up updating a ctime with a fine-grained
timestamp? It might produce some inode write amplification. Files that
were written within the same jiffy could see more inode transactions
logged, but that still might not be _too_ awful.

I'll keep thinking about it for now.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
