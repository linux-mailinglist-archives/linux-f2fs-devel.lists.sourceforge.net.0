Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833C76D71E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 20:48:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRGtW-0006OM-Vg;
	Wed, 02 Aug 2023 18:48:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pc@manguebit.com>) id 1qRGtV-0006OG-2B
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 18:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Date:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LM5dlnWT81GTwNGuf8M3+0tmWSk26IjSyG3XZJNlGxg=; b=La6XSXUv3yDlfuz6rsgX1aALu5
 OlI/cjCfhIrJZgNSr+Rj885tZjRNXcE42O/DpSa+9PiEPxeYK79r4dDUnW45kAaMD6o4KTfpfNzfJ
 QUB3oxpjEmk6F+0ppjzOphWjjuysGNI3qLG2QnBBpe8JeOEQ9HsAxEfzMc37v9G0tuE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:
 Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LM5dlnWT81GTwNGuf8M3+0tmWSk26IjSyG3XZJNlGxg=; b=e4qLyF9Be7YeqWgotwZVXS3iWD
 oQGsV4dQ/CecjfU5lYZCn3o/HROPzi782Th9GXEd9MLMtzgXC+dFnXFQPXomD8srsvKrFyHr2FKry
 WpBpIvxMAH81M6vrVzmZgU8cQ34yx0Zj+FymYIT/60an1zRuJYzN2KbaaQFq2YlBjjKg=;
Received: from [167.235.159.17] (helo=mx.manguebit.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRGtQ-0001s9-Id for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 18:48:25 +0000
Message-ID: <471c346601a7daace902428e56b8579b.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1691002083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LM5dlnWT81GTwNGuf8M3+0tmWSk26IjSyG3XZJNlGxg=;
 b=q+WFWoVwU8f/i7FIz0XAfDaWphvSKk6j9cTrweJn7z9x5iBr7hiB35FGPAUBDF4ISjvz5h
 zznWulE1I6cYjxCc8w+oI7LqEsabOb90uMokjyBo26cUl9nOO1TEwZN8Rko1gnGWvU899Z
 +EBpH1/sTAIcDBro/WhZd/24PR+naT0wlQBLDVmBmCkMhE+2F6usEQx/ESFOSTzKfD3foi
 57LqLxR9Es5qHclOHN7ZNd3Wf1NFp5sNHd92kPnDoE27zzkvm/xF1Zegdhw2DWwM4cUSYl
 FcRs0tYEjK3/9OByMH8nBUpqgGgWvImVoeFcmbN4cGs0tbYOYiDHxrQ3J3/9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1691002083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LM5dlnWT81GTwNGuf8M3+0tmWSk26IjSyG3XZJNlGxg=;
 b=AoW9sil2tg15RxkemetVcD0MQH7aqHOPx9s45t6q2mXk4iNoevRltavPuQhHJickRN06JC
 9twitSFZovdSmN54RsIMwcP9LbHZ1K86aCiRYdAMGoHCsXm0u0QTFFXXd8+eXqppmU9Kp1
 Q9pg/HXE5fSlbCGR+84Z036/rAjhvge6A7ij00bIpSGub9bNIOdCFcEgHSqmL5WMnIl1Uf
 VF0itzVid71/SBJv2BhC3GrS7WwIz1UW8ofISSDCmwhyuSGM2Z2MEfKyccU/HDsRsX7g/2
 qop6kKp78QWclngeoV7X+/F2IIcl/qVTZIg1Eck9BzyGSdE1iSwHxnOAmhWl8g==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1691002083; a=rsa-sha256; cv=none;
 b=cp3+mC0OMj7F40WMT7qUHuJDwt5m+4Y0ISygYXiZ4GOzzVuy+cXksXQTjexnbnoHqJnkLv
 A/Xh4iI5m54yLclEpvkUfV+Z5z+yl3bkiSW7DPqp7d3qf2mgApmdG2r6OnrC3HAVdpFkRR
 FGIzkra0rLP1oeUH2LzXYwCEn0h5f1JOcg5inVxvd5FI0X3iaV9zS9fxN8/uoNWsRSS8bg
 YveFBiSbZ9Cz5RuNQ9Dpsxd6wNh4r8y+aIu582+NYrL0UgzojRiCHbVTSN7csXMG8yKhXg
 YDPPznVWXhPSF0A8cu9cmJOJmS32KIv4mwdX1lo6pb8zpon7EJ1dEyaA13ArHw==
To: Jeff Layton <jlayton@kernel.org>, Eric Van Hensbergen
 <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique
 Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi
 <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, Andreas
 Gruenbacher <agruenba@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Trond
 Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna@kernel.org>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook
 <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, Steve French
 <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, Hans de
 Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
Date: Wed, 02 Aug 2023 15:47:56 -0300
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Jeff Layton <jlayton@kernel.org> writes: > generic_fillattr
 just fills in the entire stat struct indiscriminately > today, copying data
 from the inode. There is at least one attribute > (STATX_CHANGE_COOKIE) that
 can have side effects when i [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1qRGtQ-0001s9-Id
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fs: pass the request_mask to
 generic_fillattr
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
From: Paulo Alcantara via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, Anthony Iliopoulos <ailiop@suse.com>,
 ecryptfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jeff Layton <jlayton@kernel.org> writes:

> generic_fillattr just fills in the entire stat struct indiscriminately
> today, copying data from the inode. There is at least one attribute
> (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> and we're looking at adding more with the addition of multigrain
> timestamps.
>
> Add a request_mask argument to generic_fillattr and have most callers
> just pass in the value that is passed to getattr. Have other callers
> (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> STATX_CHANGE_COOKIE into generic_fillattr.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/9p/vfs_inode.c       |  4 ++--
>  fs/9p/vfs_inode_dotl.c  |  4 ++--
>  fs/afs/inode.c          |  2 +-
>  fs/btrfs/inode.c        |  2 +-
>  fs/ceph/inode.c         |  2 +-
>  fs/coda/inode.c         |  3 ++-
>  fs/ecryptfs/inode.c     |  5 +++--
>  fs/erofs/inode.c        |  2 +-
>  fs/exfat/file.c         |  2 +-
>  fs/ext2/inode.c         |  2 +-
>  fs/ext4/inode.c         |  2 +-
>  fs/f2fs/file.c          |  2 +-
>  fs/fat/file.c           |  2 +-
>  fs/fuse/dir.c           |  2 +-
>  fs/gfs2/inode.c         |  2 +-
>  fs/hfsplus/inode.c      |  2 +-
>  fs/kernfs/inode.c       |  2 +-
>  fs/libfs.c              |  4 ++--
>  fs/minix/inode.c        |  2 +-
>  fs/nfs/inode.c          |  2 +-
>  fs/nfs/namespace.c      |  3 ++-
>  fs/ntfs3/file.c         |  2 +-
>  fs/ocfs2/file.c         |  2 +-
>  fs/orangefs/inode.c     |  2 +-
>  fs/proc/base.c          |  4 ++--
>  fs/proc/fd.c            |  2 +-
>  fs/proc/generic.c       |  2 +-
>  fs/proc/proc_net.c      |  2 +-
>  fs/proc/proc_sysctl.c   |  2 +-
>  fs/proc/root.c          |  3 ++-
>  fs/smb/client/inode.c   |  2 +-
>  fs/smb/server/smb2pdu.c | 22 +++++++++++-----------
>  fs/smb/server/vfs.c     |  3 ++-
>  fs/stat.c               | 18 ++++++++++--------
>  fs/sysv/itree.c         |  3 ++-
>  fs/ubifs/dir.c          |  2 +-
>  fs/udf/symlink.c        |  2 +-
>  fs/vboxsf/utils.c       |  2 +-
>  include/linux/fs.h      |  2 +-
>  mm/shmem.c              |  2 +-
>  40 files changed, 70 insertions(+), 62 deletions(-)
>
> [...]
>
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 218f03dd3f52..93fe43789d7a 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -2540,7 +2540,7 @@ int cifs_getattr(struct mnt_idmap *idmap, const struct path *path,
>  			return rc;
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	stat->blksize = cifs_sb->ctx->bsize;
>  	stat->ino = CIFS_I(inode)->uniqueid;

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
