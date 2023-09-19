Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D807A60A0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Sep 2023 13:05:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiYXZ-0001ZK-Nv;
	Tue, 19 Sep 2023 11:05:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qiYXX-0001ZE-SA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 11:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2a6e2yyPMgqeI3y+2Rnc2fZeeo+kgiK2m70Hco9fnr4=; b=ROTn3QWriX8O4QR6vI84LtCQxG
 2vmjpgaoe1y7NnwrkcSvtt6gt8Qqx0fbxLxXaHdwSCCLVWmlfJp7sPJgeqUn+bSBuf53J/sHwQqNN
 H4IMRyzcc0oxwdhnvXZC40u93YdWfh1GPejIqqM98QhO8k+10b/Z5dbuog5J+7m7v5Cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2a6e2yyPMgqeI3y+2Rnc2fZeeo+kgiK2m70Hco9fnr4=; b=Q/L3uV47XaMNUHuqRZXOOvvWF5
 jjNas3c4f6p9p9uwun9Z979bV7adoHAWi6DBmsHEB59ghyGnBhdvDeaOqrOAMGUCDZDMsYpskHrDH
 3+CajcVzgKn0afmSxock8eeFwFDE8vLLEVQTkwznqozMlUMutmU+OK5KElTKE1TDtRW4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qiYXT-0004P8-7h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 11:05:10 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5342D1FE31;
 Tue, 19 Sep 2023 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695121498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2a6e2yyPMgqeI3y+2Rnc2fZeeo+kgiK2m70Hco9fnr4=;
 b=cJr+PwvUYyZH2t3upcBw0eryf4DE/LlFfn7Ufm2eAWd1VY02qygFmTzBIaJahVSz94O4Vb
 yGqIOI0jCW0Ip0Sk2rToBmP3VAYVKS3al3oLycPIe7d7v/sSOaNYyizpxk5ZIrSJFN93/P
 SUBM4OkiK17iPKtzTKMO612fqmtdvLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695121498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2a6e2yyPMgqeI3y+2Rnc2fZeeo+kgiK2m70Hco9fnr4=;
 b=meYxUUYPlIj0HPS4xS8OLRDZWnsHTMsdExQo9ACa74+dnEYe0U3v8eAO6qjvM08RQNmwM8
 rVywJglnBJnDHgDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A0D613A49;
 Tue, 19 Sep 2023 11:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wCZPAFqACWVOYAAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 19 Sep 2023 11:04:58 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 11C86A0759; Tue, 19 Sep 2023 13:04:57 +0200 (CEST)
Date: Tue, 19 Sep 2023 13:04:57 +0200
From: Jan Kara <jack@suse.cz>
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Message-ID: <20230919110457.7fnmzo4nqsi43yqq@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
 <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 19-09-23 15:05:24, Xi Ruoyao wrote: > On Mon,
 2023-08-07
 at 15:38 -0400, Jeff Layton wrote: > > Enable multigrain timestamps, which
 should ensure that there is an > > apparent change to the tim [...] 
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
X-Headers-End: 1qiYXT-0004P8-7h
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
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 samba-technical@lists.samba.org, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Benjamin Coddington <bcodding@redhat.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 19-09-23 15:05:24, Xi Ruoyao wrote:
> On Mon, 2023-08-07 at 15:38 -0400, Jeff Layton wrote:
> > Enable multigrain timestamps, which should ensure that there is an
> > apparent change to the timestamp whenever it has been written after
> > being actively observed via getattr.
> > =

> > For ext4, we only need to enable the FS_MGTIME flag.
> =

> Hi Jeff,
> =

> This patch causes a gnulib test failure:
> =

> $ ~/sources/lfs/grep-3.11/gnulib-tests/test-stat-time
> test-stat-time.c:141: assertion 'statinfo[0].st_mtime < statinfo[2].st_mt=
ime || (statinfo[0].st_mtime =3D=3D statinfo[2].st_mtime && (get_stat_mtime=
_ns (&statinfo[0]) < get_stat_mtime_ns (&statinfo[2])))' failed
> Aborted (core dumped)
> =

> The source code of the test:
> https://git.savannah.gnu.org/cgit/gnulib.git/tree/tests/test-stat-time.c
> =

> Is this an expected change?

Kind of yes. The test first tries to estimate filesystem timestamp
granularity in nap() function - due to this patch, the detected granularity
will likely be 1 ns so effectively all the test calls will happen
immediately one after another. But we don't bother setting the timestamps
with more than 1 jiffy (usually 4 ms) precision unless we think someone is
watching. So as a result timestamps of all stamp1 and stamp2 files are
going to be equal which makes the test fail.

The ultimate problem is that a sequence like:

write(f1)
stat(f2)
write(f2)
stat(f2)
write(f1)
stat(f1)

can result in f1 timestamp to be (slightly) lower than the final f2
timestamp because the second write to f1 didn't bother updating the
timestamp. That can indeed be a bit confusing to programs if they compare
timestamps between two files. Jeff?

								Honza


> > Acked-by: Theodore Ts'o <tytso@mit.edu>
> > Reviewed-by: Jan Kara <jack@suse.cz>
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> > =A0fs/ext4/super.c | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> > index b54c70e1a74e..cb1ff47af156 100644
> > --- a/fs/ext4/super.c
> > +++ b/fs/ext4/super.c
> > @@ -7279,7 +7279,7 @@ static struct file_system_type ext4_fs_type =3D {
> > =A0	.init_fs_context	=3D ext4_init_fs_context,
> > =A0	.parameters		=3D ext4_param_specs,
> > =A0	.kill_sb		=3D kill_block_super,
> > -	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
> > +	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP |
> > FS_MGTIME,
> > =A0};
> > =A0MODULE_ALIAS_FS("ext4");
> > =A0
> > =

> =

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
