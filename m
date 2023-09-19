Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D97A6153
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Sep 2023 13:33:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiYzB-0005cO-3z;
	Tue, 19 Sep 2023 11:33:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qiYz9-0005cI-Kj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 11:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3M0d3dD3pzePraPqdY5Lb/FSgSUINN1vw73+jr5dq7Q=; b=KdHfqss3lYfSuODg8/BLwwnO+K
 3BpfDKR/58UhoBAMC2yuLErP2cf1H8wUkQWc1konAjqil3S0YpjWDjAiNAuzUrl8tPbEKlmaIumeX
 DHgXat/xhZue+7+fiqMp4ukwa4LbUJ4qz/99/ZdPmWg1uFxnP4M64hw+iIk6rU2GpCzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3M0d3dD3pzePraPqdY5Lb/FSgSUINN1vw73+jr5dq7Q=; b=irlJyF1fnkP/JJeGjbE/CSDzus
 v5raPxE6W3tM7OEVlVEvmZ/9XmrsCGhbhbjAuhxojmX0s7/GCono75Qq3vvvpzYr9NPR7Ww4CYRnF
 GMvoO8Rqx9eqroLMJZ5yXYllz1sSiKJ1bGRxmLGPFuOVCINJ3eTuu88JlnZfwkrOz6rM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qiYz7-00Ed1X-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 11:33:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D45C8B815DD;
 Tue, 19 Sep 2023 11:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D159EC433C8;
 Tue, 19 Sep 2023 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695123213;
 bh=3M0d3dD3pzePraPqdY5Lb/FSgSUINN1vw73+jr5dq7Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tQh6lksLqcIOBj/Ff0JXOKys/7/S9IytLOiF0JDIywzjJVGnvZkHN89m5sE62mpoB
 B3YDCwOOxX1gnLmVWc3ePStHNAbvbDg9jgbpVAv5wDbDdw2Vl89GZwZ9qNlNxra4Fg
 kiXuONNyEoPOCmaTk9QAiioZqeXDdQ8Od2dvXiPB2jbqabD8+vET4rWht6VUqialFl
 kMESlGGKraI/mfEF5XUwwnyQC7enBkaOr88DrXpjQxZ8vzJOm87lLPeOk13Z2jZZWP
 +DF8dMCw1HMweouCpDWHzR5OF6xSCTUQlXvt6hjtZ1K1zZoSy0NQYp4mHOMzF7pFix
 96Omsq9cDaYdg==
Message-ID: <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jan Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>
Date: Tue, 19 Sep 2023 07:33:25 -0400
In-Reply-To: <20230919110457.7fnmzo4nqsi43yqq@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
 <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2023-09-19 at 13:04 +0200, Jan Kara wrote: > On Tue
 19-09-23 15:05:24, Xi Ruoyao wrote: > > On Mon, 2023-08-07 at 15:38 -0400,
 Jeff Layton wrote: > > > Enable multigrain timestamps, which shou [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qiYz7-00Ed1X-K8
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
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, bug-gnulib@gnu.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
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
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2023-09-19 at 13:04 +0200, Jan Kara wrote:
> On Tue 19-09-23 15:05:24, Xi Ruoyao wrote:
> > On Mon, 2023-08-07 at 15:38 -0400, Jeff Layton wrote:
> > > Enable multigrain timestamps, which should ensure that there is an
> > > apparent change to the timestamp whenever it has been written after
> > > being actively observed via getattr.
> > > 
> > > For ext4, we only need to enable the FS_MGTIME flag.
> > 
> > Hi Jeff,
> > 
> > This patch causes a gnulib test failure:
> > 
> > $ ~/sources/lfs/grep-3.11/gnulib-tests/test-stat-time
> > test-stat-time.c:141: assertion 'statinfo[0].st_mtime < statinfo[2].st_mtime || (statinfo[0].st_mtime == statinfo[2].st_mtime && (get_stat_mtime_ns (&statinfo[0]) < get_stat_mtime_ns (&statinfo[2])))' failed
> > Aborted (core dumped)
> > 
> > The source code of the test:
> > https://git.savannah.gnu.org/cgit/gnulib.git/tree/tests/test-stat-time.c
> > 
> > Is this an expected change?
> 
> Kind of yes. The test first tries to estimate filesystem timestamp
> granularity in nap() function - due to this patch, the detected granularity
> will likely be 1 ns so effectively all the test calls will happen
> immediately one after another. But we don't bother setting the timestamps
> with more than 1 jiffy (usually 4 ms) precision unless we think someone is
> watching. So as a result timestamps of all stamp1 and stamp2 files are
> going to be equal which makes the test fail.
> 

That was my take too. The multigrain ctime changes are probably causing
nap() to settle on too small a time delta.

> The ultimate problem is that a sequence like:
> 
> write(f1)
> stat(f2)
> write(f2)
> stat(f2)
> write(f1)
> stat(f1)
>
> can result in f1 timestamp to be (slightly) lower than the final f2
> timestamp because the second write to f1 didn't bother updating the
> timestamp. That can indeed be a bit confusing to programs if they compare
> timestamps between two files. Jeff?
> 

Basically yes. When there is no stat() call issued on the file in
between writes, the kernel will use coarse-grained timestamps when
updating it (since no one is watching).


I'm not sure what we can do for this test. The nap() function is making
an assumption that the timestamp granularity will be constant, and that
isn't necessarily the case now.

-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
