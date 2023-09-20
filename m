Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D3E7A81DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 14:48:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiwdA-0003RY-Rr;
	Wed, 20 Sep 2023 12:48:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qiwd8-0003RR-3Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 12:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S4Cb2+aB7mfyt7b8CnMGxNhCI32rhMMOyFzUtOYeWkI=; b=HoGhi/s95LpiSO10XKWpJsw+bw
 BSsxuhkXAKXyJMg1wNKETQ7bKSvD3puapcRG1y8Tjx5pEeea03SnpL5HN+sii74BPlSr6WbB4HOW5
 ffYF+gJ6Bv98K1DZIizZBK01Q1nAx+qr4UIeW1lBZ+qKjxva7scpeHzmsDEJCUcOs6H8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S4Cb2+aB7mfyt7b8CnMGxNhCI32rhMMOyFzUtOYeWkI=; b=So8NlnblS+ghdmo6ya/XkSXvZc
 nyx5/ZV1e3ibNaVBqfMCfxNh+lfvGfUX7DbylZE0DR704qVa4P29//SxCX26v4rly9tc2l7ZTZTIG
 NpEE0nFOcuAyBmStH3m0p9H8MmIuXaimv1/fucOlORU3xnIxaulpNMcGls+n77JzW50Q=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qiwd4-00GhV6-NF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 12:48:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6FD471F854;
 Wed, 20 Sep 2023 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695214104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S4Cb2+aB7mfyt7b8CnMGxNhCI32rhMMOyFzUtOYeWkI=;
 b=F7mgIbanJ66gmiZEnO9W56nZWxHlxkK7s6FOoSjoypnC5mKMR7KN4k+DpGXfgaj5VjGrIN
 M0WZKpREOaiHCVlfxV6kRat3Qsi7lPO5Z2V/s3ZDJoLypj4Zm8y+7h34PJ3ugAMCBOih8J
 +FrYu16LwC7uAnxqkcIerKEtN0dDPrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695214104;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S4Cb2+aB7mfyt7b8CnMGxNhCI32rhMMOyFzUtOYeWkI=;
 b=ekUr1ejuvPyxJth9da/nEkPHSmqGtFGO/4Uu+iGJvWuLB6F/9QQ+xqsl4Q0KgC4KgxQtPa
 Leco5xPA1ZhiWrBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5150913A64;
 Wed, 20 Sep 2023 12:48:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4Cc/ExjqCmXZZgAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 12:48:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id CD6D5A077D; Wed, 20 Sep 2023 14:48:23 +0200 (CEST)
Date: Wed, 20 Sep 2023 14:48:23 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230920124823.ghl6crb5sh4x2pmt@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 20-09-23 06:35:18, Jeff Layton wrote: > On Wed,
 2023-09-20
 at 12:17 +0200, Jan Kara wrote: > > If I were a sysadmin, I'd rather opt
 for something like > > finegrained timestamps + lazytime (if [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qiwd4-00GhV6-NF
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
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
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
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 20-09-23 06:35:18, Jeff Layton wrote:
> On Wed, 2023-09-20 at 12:17 +0200, Jan Kara wrote:
> > If I were a sysadmin, I'd rather opt for something like
> > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > functionality). That should avoid the IO overhead of finegrained timestamps
> > as well and I'd know I can have problems with timestamps only after a
> > system crash.
> 
> > I've just got another idea how we could solve the problem: Couldn't we
> > always just report coarsegrained timestamp to userspace and provide access
> > to finegrained value only to NFS which should know what it's doing?
> > 
> 
> I think that'd be hard. First of all, where would we store the second
> timestamp? We can't just truncate the fine-grained ones to come up with
> a coarse-grained one. It might also be confusing having nfsd and local
> filesystems present different attributes.

So what I had in mind (and I definitely miss all the NFS intricacies so the
idea may be bogus) was that inode->i_ctime would be maintained exactly as
is now. There will be new (kernel internal at least for now) STATX flag
STATX_MULTIGRAIN_TS. fill_mg_cmtime() will return timestamp truncated to
sb->s_time_gran unless STATX_MULTIGRAIN_TS is set. Hence unless you set
STATX_MULTIGRAIN_TS, there is no difference in the returned timestamps
compared to the state before multigrain timestamps were introduced. With
STATX_MULTIGRAIN_TS we return full precision timestamp as stored in the
inode. Then NFS in fh_fill_pre_attrs() and fh_fill_post_attrs() needs to
make sure STATX_MULTIGRAIN_TS is set when calling vfs_getattr() to get
multigrain time.

I agree nfsd may now be presenting slightly different timestamps than user
is able to see with stat(2) directly on the filesystem. But is that a
problem? Essentially it is a similar solution as the mgtime mount option
but now sysadmin doesn't have to decide on filesystem mount how to report
timestamps but the stat caller knowingly opts into possibly inconsistent
(among files) but high precision timestamps. And in the particular NFS
usecase where stat is called all the time anyway, timestamps will likely
even be consistent among files.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
