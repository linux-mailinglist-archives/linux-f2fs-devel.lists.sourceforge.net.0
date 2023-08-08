Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9DB773967
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 11:39:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTJBH-0006Kp-Ik;
	Tue, 08 Aug 2023 09:39:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qTJBG-0006Kg-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 09:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PVeErVjOshT1HL9BKit56tV7zQvJsI4KiQWED3rMFuk=; b=mtl5co5airrBVRKqf4uuN/tLq0
 xVsnHNjAWtjhsckGnz9gu/6EiTRm6j4QK/2RfK2j6o1B1LN2yYnCwmzBKuoKWZ/EH3o0KWW/+FkVA
 Lks7Oo2XlTFetm2giLbrsjkRuY9e9n1Fj/KQQjdAlqNSN6ifD/vW5MX9wxyYonJwKab0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PVeErVjOshT1HL9BKit56tV7zQvJsI4KiQWED3rMFuk=; b=bPlU4qfbIQW2MDDeVxhZywr8xt
 I634gXHuAwSMhTnnuc1H1iLjB5K/mtnBh9LaFg31hjNuIupimKMBuN+dqLUOsEzK7dIUcd95QXkMI
 /WosaCe4zJqoiQICp1CtCdV1r9I2DDDc1BTe6zhEWJPMxV7FGpPmZqFaWkm78rPxY1VM=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTJBG-00025S-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 09:39:11 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 186E41F88D;
 Tue,  8 Aug 2023 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691487544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVeErVjOshT1HL9BKit56tV7zQvJsI4KiQWED3rMFuk=;
 b=Ih/dtuDlLjuehwLx/dl1alOHiAbINBHhQjqICxdO8QzvDNyayDD12QEIdQQqzzznj7Q14P
 c5hv8MUHhglxrWQtTaFcAIVopxDABjqy/dP+ec5Lv+rEt0nndTNahsaoLReC2CFkrCP+64
 W8/atfzAfsnelhickcggtSiPj4yTuJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691487544;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVeErVjOshT1HL9BKit56tV7zQvJsI4KiQWED3rMFuk=;
 b=j1Qrid+U1SfmOjtDLooGt12t1hCG9o0NAGXfAvVFTMysCO70VmrTAY263EbPzLWm1azsyz
 yYZCAZd1ftjgXqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B42139E9;
 Tue,  8 Aug 2023 09:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u1hdADgN0mRKHgAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 08 Aug 2023 09:39:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 732A5A0769; Tue,  8 Aug 2023 11:39:03 +0200 (CEST)
Date: Tue, 8 Aug 2023 11:39:03 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230808093903.2cg5wwbwbvflkeph@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 07-08-23 15:38:38,
 Jeff Layton wrote: > In later patches
 we're going to drop the "now" parameter from the > update_time operation.
 Prepare XFS for this by reworking how it fetches > timestamps [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qTJBG-00025S-SQ
Subject: Re: [f2fs-dev] [PATCH v7 07/13] xfs: have xfs_vn_update_time gets
 its own timestamp
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
 Eric Van Hensbergen <ericvh@kernel.org>,
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

On Mon 07-08-23 15:38:38, Jeff Layton wrote:
> In later patches we're going to drop the "now" parameter from the
> update_time operation. Prepare XFS for this by reworking how it fetches
> timestamps and sets them in the inode. Ensure that we update the ctime
> even if only S_MTIME is set.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/xfs/xfs_iops.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 731f45391baa..72d18e7840f5 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1037,6 +1037,7 @@ xfs_vn_update_time(
>  	int			log_flags = XFS_ILOG_TIMESTAMP;
>  	struct xfs_trans	*tp;
>  	int			error;
> +	struct timespec64	now = current_time(inode);

No need to fetch current_time() here where you overwrite it just a bit
later...

> @@ -1056,12 +1057,15 @@ xfs_vn_update_time(
>  		return error;
>  
>  	xfs_ilock(ip, XFS_ILOCK_EXCL);
> -	if (flags & S_CTIME)
> -		inode_set_ctime_to_ts(inode, *now);
> +	if (flags & (S_CTIME|S_MTIME))
> +		now = inode_set_ctime_current(inode);
> +	else
> +		now = current_time(inode);
> +
>  	if (flags & S_MTIME)
> -		inode->i_mtime = *now;
> +		inode->i_mtime = now;
>  	if (flags & S_ATIME)
> -		inode->i_atime = *now;
> +		inode->i_atime = now;
>  
>  	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
>  	xfs_trans_log_inode(tp, ip, log_flags);

Otherwise the patch looks good to me so feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
