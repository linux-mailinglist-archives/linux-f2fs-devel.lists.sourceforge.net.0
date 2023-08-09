Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A37762D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 16:44:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTkQT-0004wz-BG;
	Wed, 09 Aug 2023 14:44:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hirofumi@parknet.co.jp>) id 1qTkQS-0004ws-I5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 14:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MOCsRKWVFDQ5+8K52e1Kw/ijj3OYX5HbMPhfQsu89XE=; b=KVojFDI8yo0qMbnykU1vxSfWMO
 ky9tIy0MEh4fsaPUS9bjYA4wpnNLdzT1Sl3FfB9vNyi1ymD6fhnVczdymCWsytde3eRBg5EPaUl4i
 GoFUyq5y6wb/jYoCMiwuHoioRpGzfYwfwMdaI2aADY1LHu08p+x1VCtljDTbaJLiL1vE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MOCsRKWVFDQ5+8K52e1Kw/ijj3OYX5HbMPhfQsu89XE=; b=WMAKPcaZd47oHR9v0J48nrQUyr
 6oIIvov/A/jAVlrP3h2Wwwn0usdTliLleRF1HqpKmksvGn0oQz9v0/jTrZLzc9SIDDnd19pUxQOjp
 iAbwcwEWd3D+fYhvR/RSSgkgB6appHG0D9RvqkSHY+rJWiU02/Gd49lz+H6/kkyshs2k=;
Received: from mail.parknet.co.jp ([210.171.160.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qTkQR-0006G3-1b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 14:44:40 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
 by mail.parknet.co.jp (Postfix) with ESMTPSA id 593222055FA0;
 Wed,  9 Aug 2023 23:44:33 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
 by ibmpc.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id
 379EiWdd218003
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 23:44:33 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
 by devron.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 379EiV6k197737
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 23:44:31 +0900
Received: (from hirofumi@localhost)
 by devron.myhome.or.jp (8.17.2/8.17.2/Submit) id 379EiQ5o197730;
 Wed, 9 Aug 2023 23:44:26 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <7edc9239f73022b9c2a1d3f4f946153f85f94739.camel@kernel.org> (Jeff
 Layton's message of "Wed, 09 Aug 2023 10:22:54 -0400")
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
 <878rak8hia.fsf@mail.parknet.co.jp>
 <7edc9239f73022b9c2a1d3f4f946153f85f94739.camel@kernel.org>
Date: Wed, 09 Aug 2023 23:44:26 +0900
Message-ID: <874jl88ed1.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Jeff Layton <jlayton@kernel.org> writes: > I'm a little
 confused
 too. Why do you believe this will break > -o relatime handling? This patch
 changes two things: > > 1/ it has fat_update_time fetch its own timestamp
 (and ignore the "now" > par [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [210.171.160.6 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qTkQR-0006G3-1b
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

Jeff Layton <jlayton@kernel.org> writes:

> I'm a little confused too. Why do you believe this will break
> -o relatime handling? This patch changes two things:
>
> 1/ it has fat_update_time fetch its own timestamp (and ignore the "now"
> parameter). This is in line with the changes in patch #3 of this series,
> which explains the rationale for this in more detail.
>
> 2/ it changes fat_update_time to also update the i_version if any of
> S_CTIME|S_MTIME|S_VERSION are set. relatime is all about the S_ATIME,
> and it is specifically excluded from that set.
>
> The rationale for the second change is is also in patch #3, but
> basically, we can't guarantee that current_time hasn't changed since we
> last checked for inode_needs_update_time, so if any of
> S_CTIME/S_MTIME/S_VERSION have changed, then we need to assume that any
> of them may need to be changed and attempt to update all 3.
>
> That said, I think the logic in fat_update_time isn't quite right. I
> think want something like this on top of this patch to ensure that the
> S_CTIME and S_MTIME get updated, even if the flags only have S_VERSION
> set.
>
> Thoughts?

I'm not talking about "relatime" at all, I'm always talking about
"lazytime".

I_DIRTY_TIME delays to update on disk inode only if changed
timestamp. But you changed it to I_DIRTY_SYNC, i.e. always update on
disk inode by timestamp.

Thanks.

> ---------------------8<-----------------------
>
> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> index 080a5035483f..313eef02f45c 100644
> --- a/fs/fat/misc.c
> +++ b/fs/fat/misc.c
> @@ -346,15 +346,21 @@ int fat_update_time(struct inode *inode, int flags)
>         if (inode->i_ino == MSDOS_ROOT_INO)
>                 return 0;
>  
> -       if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> -               fat_truncate_time(inode, NULL, flags);
> -               if (inode->i_sb->s_flags & SB_LAZYTIME)
> -                       dirty_flags |= I_DIRTY_TIME;
> -               else
> -                       dirty_flags |= I_DIRTY_SYNC;
> -       }
> +       /*
> +        * If any of the flags indicate an expicit change to the file, then we
> +        * need to ensure that we attempt to update all of 3. We do not do
> +        * this in the case of an S_ATIME-only update.
> +        */
> +       if (flags & (S_CTIME | S_MTIME | S_VERSION))
> +               flags |= S_CTIME | S_MTIME | S_VERSION;
> +
> +       fat_truncate_time(inode, NULL, flags);
> +       if (inode->i_sb->s_flags & SB_LAZYTIME)
> +               dirty_flags |= I_DIRTY_TIME;
> +       else
> +               dirty_flags |= I_DIRTY_SYNC;
>  
> -       if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
> +       if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
>                 dirty_flags |= I_DIRTY_SYNC;
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
