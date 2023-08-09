Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D21776496
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 17:58:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTlZZ-0001ZY-OE;
	Wed, 09 Aug 2023 15:58:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1qTlZY-0001ZS-7H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 15:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ltztflm5uh3qzayYTwLS8Tgqv2vBfXKuJ/QAANgymoQ=; b=f98V69mzF1CczPX64F9EgnGQSu
 PYjqtxxyFU1UekMTq6TMwrngKKzn+DAZV6YQH5v/fCo04jIh0aAGjyLADBErIp/kY0geGoO6UmngB
 bz6VJ/+T/+2tvG6aiGrYHnqzQMBX9nwh9iHPI9M9gPUowGu2lfnifE4UkzxKcNaNT2NU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ltztflm5uh3qzayYTwLS8Tgqv2vBfXKuJ/QAANgymoQ=; b=bzeYFhQQN4rq3zNEvZ3W7JWAS4
 IPspRq+sdDpP4Q7bTaYPkddZRQoKw0rrbvwq+dQSdA66fy4salVgT3sN9GlxPy/DRfK1I5IR/bRwu
 7HAewgelBJ9SLUL0Gn9Gi6dsm5JwhgWRsFX+Xkh8b8q7n9LvPWSX7OV6Cu67PUfes8N4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTlZT-000eMC-38 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 15:58:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FF5363FB2;
 Wed,  9 Aug 2023 15:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE8CC433C8;
 Wed,  9 Aug 2023 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691596676;
 bh=BLJ8BG9cjda67FtOFMSOw2lof21Rwgd62y3h6CJUJXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFE0tJAC1VN3lHwsywzTvQMCtTkKwH+fzaHay423Nn8U4BvgbFPhFlDGPhv+CSPLy
 dFQ0xVpMhQ3C2M5foD/fbgkNjIR7VMHxas0FwdgXCZ4RBZmNRoRBLtdmPfwP64p4CR
 L1KLFjlwnPyYmvJ9g5BmRhxInIEwBnrizZouBo3g6eX8F8ZAnH1hnfnSPD6lrGk5TK
 9rNGMty4rm4EuDy1vedzHwVAPS2NqLbaLW0knF3RHZVQHqjJb96V1TtEusFyVz0K14
 VuLDs1Rym4oqY/gmU++wX3w7TKa1AFDz9Dgv9eLPqBx47m/DAmODVEOpJWGSAeViqX
 g//bmjx4l6oPA==
Date: Wed, 9 Aug 2023 08:57:56 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230809155756.GV11352@frogsfrogsfrogs>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mgctime-v7-7-d1dec143a704@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 03:38:38PM -0400, Jeff Layton wrote:
 > In later patches we're going to drop the "now" parameter from the >
 update_time
 operation. Prepare XFS for this by reworking how it fetch [...] 
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
X-Headers-End: 1qTlZT-000eMC-38
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
 linux-xfs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
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

On Mon, Aug 07, 2023 at 03:38:38PM -0400, Jeff Layton wrote:
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
>  
>  	trace_xfs_update_time(ip);
>  
> @@ -1056,12 +1057,15 @@ xfs_vn_update_time(
>  		return error;
>  
>  	xfs_ilock(ip, XFS_ILOCK_EXCL);
> -	if (flags & S_CTIME)
> -		inode_set_ctime_to_ts(inode, *now);
> +	if (flags & (S_CTIME|S_MTIME))

Minor nit: spaces around    ^ the operator.

Otherwise looks ok to me...
Acked-by: Darrick J. Wong <djwong@kernel.org>

--D

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
> 
> -- 
> 2.41.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
