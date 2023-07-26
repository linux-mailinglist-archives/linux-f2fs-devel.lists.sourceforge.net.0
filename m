Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D8763287
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 11:41:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOb1C-0001Av-5V;
	Wed, 26 Jul 2023 09:41:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joseph.qi@linux.alibaba.com>) id 1qOb19-0001Ao-Rq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SMp22aUAVq4Iw7OXiIgTyL4ngCRPy00sHfK8XUdN0Tc=; b=BKzMk7aT278w5I6BIWh73W3CNi
 OHpDVJWIgZAqgXdXY0ST/TBqlhMWyPZTkBp8R5UtOEkzET8ShG6JoKExY6Qy0F9lbG8w+cWPJgnQO
 JywCs9yCjkiSm5F9YAvAEu08k2QlIS5rNpcewdSHtTi/+Qy1z6or+xgbmL0yOYFbaEMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SMp22aUAVq4Iw7OXiIgTyL4ngCRPy00sHfK8XUdN0Tc=; b=XqosCbuQ9AiS863pFHFmwtlNxn
 GI7ZIGViDx6dcLR1bfEyKP5k4BUu69S+2qxKQjVQ5QphPyaB7Ut4TO29WqgdS3NlzzU6IuCAAwP9K
 zsL0HZqe92ykkfJIxpFEpJC7TtFscp4NFf29sAQLMPvqNdNENvdi5s9hm8yViv+P002c=;
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOb17-002tpd-E2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:41:15 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=24; SR=0;
 TI=SMTPD_---0VoGYt9._1690364457; 
Received: from 30.221.136.164(mailfrom:joseph.qi@linux.alibaba.com
 fp:SMTPD_---0VoGYt9._1690364457) by smtp.aliyun-inc.com;
 Wed, 26 Jul 2023 17:40:58 +0800
Message-ID: <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
Date: Wed, 26 Jul 2023 17:40:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
X-Spam-Score: -10.0 (----------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/25/23 10:58 PM, Jeff Layton wrote: > generic_fillattr
 just fills in the entire stat struct indiscriminately > today, copying data
 from the inode. There is at least one attribute > (STATX_CHANGE_C [...] 
 Content analysis details:   (-10.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.130 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOb17-002tpd-E2
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 Anthony Iliopoulos <ailiop@suse.com>, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 7/25/23 10:58 PM, Jeff Layton wrote:
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

...

> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> index 1b337ebce4df..8184499ae7a5 100644
> --- a/fs/ocfs2/file.c
> +++ b/fs/ocfs2/file.c
> @@ -1319,7 +1319,7 @@ int ocfs2_getattr(struct mnt_idmap *idmap, const struct path *path,
>  		goto bail;
>  	}
>  
> -	generic_fillattr(&nop_mnt_idmap, inode, stat);
> +	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);

For ocfs2 part, looks fine to me.

Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>

>  	/*
>  	 * If there is inline data in the inode, the inode will normally not
>  	 * have data blocks allocated (it may have an external xattr block).

...

> diff --git a/fs/stat.c b/fs/stat.c
> index 8c2b30af19f5..062f311b5386 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -29,6 +29,7 @@
>  /**
>   * generic_fillattr - Fill in the basic attributes from the inode struct
>   * @idmap:	idmap of the mount the inode was found from
> + * @req_mask	statx request_mask

s/req_mask/request_mask

>   * @inode:	Inode to use as the source
>   * @stat:	Where to fill in the attributes
>   *
> @@ -42,8 +43,8 @@
>   * uid and gid filds. On non-idmapped mounts or if permission checking is to be
>   * performed on the raw inode simply passs @nop_mnt_idmap.
>   */
> -void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> -		      struct kstat *stat)
> +void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
> +		      struct inode *inode, struct kstat *stat)
>  {
>  	vfsuid_t vfsuid = i_uid_into_vfsuid(idmap, inode);
>  	vfsgid_t vfsgid = i_gid_into_vfsgid(idmap, inode);
> @@ -61,6 +62,12 @@ void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
>  	stat->ctime = inode_get_ctime(inode);
>  	stat->blksize = i_blocksize(inode);
>  	stat->blocks = inode->i_blocks;
> +
> +	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> +		stat->result_mask |= STATX_CHANGE_COOKIE;
> +		stat->change_cookie = inode_query_iversion(inode);
> +	}
> +
>  }
>  EXPORT_SYMBOL(generic_fillattr);
>  
> @@ -123,17 +130,12 @@ int vfs_getattr_nosec(const struct path *path, struct kstat *stat,
>  	stat->attributes_mask |= (STATX_ATTR_AUTOMOUNT |
>  				  STATX_ATTR_DAX);
>  
> -	if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> -		stat->result_mask |= STATX_CHANGE_COOKIE;
> -		stat->change_cookie = inode_query_iversion(inode);
> -	}
> -
>  	idmap = mnt_idmap(path->mnt);
>  	if (inode->i_op->getattr)
>  		return inode->i_op->getattr(idmap, path, stat,
>  					    request_mask, query_flags);
>  
> -	generic_fillattr(idmap, inode, stat);
> +	generic_fillattr(idmap, request_mask, inode, stat);
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_getattr_nosec);

...



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
