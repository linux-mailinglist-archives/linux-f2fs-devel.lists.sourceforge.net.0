Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2635775518
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 10:23:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTeTF-0002HJ-Lj;
	Wed, 09 Aug 2023 08:23:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qTeTD-0002H0-SF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 08:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=; b=DtuyWZAPMW4F7gK45GDQdmXQnQ
 DD+d4qnNJ30wyBwlEHBQ+13I4Tp8PNZeE+4yjc68KxsFN2/1FYgynlZEDguoLHNdNX04xnpHwvUmC
 aqkCDTGoCoCXm1wy/1ZavlI1ZPju5lMIsjPIKVDDm/rwhd5+iMjQKAmqDwsnNJKuEqlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=; b=MG6RCsCBf2eZTSqNjSSq/4AUjt
 GSMhsEoSdp/zmBV+K9gKMHLOkOQrhmaNgt3hlZ/ml2MOH1wDDilQ2Vxj7AnpI5cfwekF1EspUxrpe
 GFUStFZlDVJfwZELS2i/bafboRqwL8Rdz6y6EwFhJapuTs1A+k7BG3e7gFZG69a/jfFM=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTeTE-000Mjd-15 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 08:23:08 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A8C41F388;
 Wed,  9 Aug 2023 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691569381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=;
 b=g4FDCoxrnA/p+GYB2SAgg9FCsHDC8xx9oZ/+5lp2F0zXGltHAWDKRIOtF8gm878iBpKXUt
 roN9QLxvxxz/hruPD50xpPKd1EJgyufH1Q9BSATz9Nc8CpHpABXAhB63acjBhnT8R1dzx/
 osOyq4rFMxe4W2YvEs3BmnQMVSN/P5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691569381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=;
 b=YP+i5WCgxaDO0MJwnfKAGmomKqp+nrgJtNPAsBPZzyeBoI4TdjLxb1qRz8dnXxGoUZwRPp
 ye7wBZnxxnt9gbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2633E13251;
 Wed,  9 Aug 2023 08:23:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kWhPCeVM02RBbwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 09 Aug 2023 08:23:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9D476A0769; Wed,  9 Aug 2023 10:23:00 +0200 (CEST)
Date: Wed, 9 Aug 2023 10:23:00 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230809082300.veczantamvcpinxu@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-6-d1dec143a704@kernel.org>
 <20230808093701.ggyj7tyqonivl7tb@quack3>
 <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 09-08-23 09:06:34, Christian Brauner wrote: > On Tue, 
 Aug 08, 2023 at 11:37:01AM +0200, Jan Kara wrote: > > On Mon 07-08-23 15:38:37,
 Jeff Layton wrote: > > > In later patches, we're going to d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qTeTE-000Mjd-15
Subject: Re: [f2fs-dev] [PATCH v7 06/13] ubifs: have ubifs_update_time use
 inode_update_timestamps
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
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
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
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 09-08-23 09:06:34, Christian Brauner wrote:
> On Tue, Aug 08, 2023 at 11:37:01AM +0200, Jan Kara wrote:
> > On Mon 07-08-23 15:38:37, Jeff Layton wrote:
> > > In later patches, we're going to drop the "now" parameter from the
> > > update_time operation. Prepare ubifs for this, by having it use the new
> > > inode_update_timestamps helper.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > 
> > One comment below:
> > 
> > > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > > index df9086b19cd0..2d0178922e19 100644
> > > --- a/fs/ubifs/file.c
> > > +++ b/fs/ubifs/file.c
> > > @@ -1397,15 +1397,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
> > >  		return err;
> > >  
> > >  	mutex_lock(&ui->ui_mutex);
> > > -	if (flags & S_ATIME)
> > > -		inode->i_atime = *time;
> > > -	if (flags & S_CTIME)
> > > -		inode_set_ctime_to_ts(inode, *time);
> > > -	if (flags & S_MTIME)
> > > -		inode->i_mtime = *time;
> > > -
> > > -	release = ui->dirty;
> > > +	inode_update_timestamps(inode, flags);
> > >  	__mark_inode_dirty(inode, I_DIRTY_SYNC);
> > > +	release = ui->dirty;
> > >  	mutex_unlock(&ui->ui_mutex);
> > 
> > I think this is wrong. You need to keep sampling ui->dirty before calling
> > __mark_inode_dirty(). Otherwise you could release budget for inode update
> > you really need...
> 
> Fixed in-tree.

Thanks. With that feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
