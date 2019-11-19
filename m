Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1940102DB1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2019 21:44:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iXALv-0008DY-VP; Tue, 19 Nov 2019 20:43:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1iXALr-0008D4-QL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 20:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AYJH5q1nb+UJyV1Mzy4snEXLp8784y78vmaBY92SwyY=; b=XhhswjIuiwaiFPu9D1/HsD24Z7
 bx+DQMHY2dduTkDM7/vWU1NzfuIL3yqWaC/aUVhlAl14126mglG+90MEf2DVvVFTniYPMfh9P5FKS
 71SQtrTEASSMYJUx2aYCuyqvoOZwD+4OvCHs3xnx/tP0IOcjNckqiIaRktezGVQu6XE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AYJH5q1nb+UJyV1Mzy4snEXLp8784y78vmaBY92SwyY=; b=TgkPQS6xRqozSFXHiZjychjm//
 MHJd0KpS0ywxDKSGoI+jkG6enJm6pO1hwlJ+qO6oy+oS9JaSLTHt4cZ2pG8f535PyLYwCISGPp3sn
 eheI17ZjY3VRVVbN29ZW4q9my21CJyzrXQk5xV0T6JgDXyifykwbA7MkPPSOf+vboP/U=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iXALn-00Czmm-PJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 20:43:55 +0000
Received: from dread.disaster.area (pa49-181-255-80.pa.nsw.optusnet.com.au
 [49.181.255.80])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 2216E43F136;
 Wed, 20 Nov 2019 07:43:41 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1iXALc-0007gT-7X; Wed, 20 Nov 2019 07:43:40 +1100
Date: Wed, 20 Nov 2019 07:43:40 +1100
From: Dave Chinner <david@fromorbit.com>
To: Chengguang Xu <cgxu519@mykernel.net>
Message-ID: <20191119204340.GZ4614@dread.disaster.area>
References: <20191118050949.15629-1-cgxu519@mykernel.net>
 <20191118050949.15629-3-cgxu519@mykernel.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118050949.15629-3-cgxu519@mykernel.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=P6RKvmIu c=1 sm=1 tr=0
 a=XqaD5fcB6dAc7xyKljs8OA==:117 a=XqaD5fcB6dAc7xyKljs8OA==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=MeAgGD-zjQ4A:10
 a=aKLo6qE4AAAA:8 a=7-415B0cAAAA:8 a=2IXG0JadBsM__kedw_oA:9
 a=wPNLvfGTeEIA:10 a=O0NXIRw7_9tMP-H1FTy7:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iXALn-00Czmm-PJ
Subject: Re: [f2fs-dev] [RFC PATCH 3/3] xfs: show prjquota info on statfs
 for a file
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
Cc: tytso@mit.edu, darrick.wong@oracle.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 18, 2019 at 01:09:49PM +0800, Chengguang Xu wrote:
> Currently we replace filesystem statistics using prjquota info
> on statfs when specified directory has project id inherit flag.
> However, statfs on a file(accurately non-dir) which is under the
> project quota dir(with inherit flag) still shows whole filesystem
> statistics. In container use case, it will give container user
> inconsistent experience and cause confusion about available free
> space.
> =

> Detail info like below:
> We use project quota to limit disk space usage for a container
> and run df command inside container.
> =

> Run df on a directory:
> =

> [root /]# df -h /etc/
> Filesystem=A0=A0=A0=A0=A0 Size=A0 Used Avail Use% Mounted on
> kataShared=A0=A0=A0=A0=A0 1.0G=A0=A0 13M 1012M=A0=A0 2% /
> =

> Run df on a file:
> =

> [root /]# df -h /etc/exports
> Filesystem=A0=A0=A0=A0=A0 Size=A0 Used Avail Use% Mounted on
> kataShared=A0=A0=A0=A0=A0 1.5T=A0 778M=A0 1.5T=A0=A0 1% /
> =

> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
> ---
>  fs/xfs/xfs_super.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 8d1df9f8be07..9f4d9e86572a 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1125,7 +1125,8 @@ xfs_fs_statfs(
>  	statp->f_ffree =3D max_t(int64_t, ffree, 0);
>  =

>  =

> -	if ((ip->i_d.di_flags & XFS_DIFLAG_PROJINHERIT) &&
> +	if (((ip->i_d.di_flags & XFS_DIFLAG_PROJINHERIT) ||
> +	     !S_ISDIR(dentry->d_inode->i_mode)) &&
>  	    ((mp->m_qflags & (XFS_PQUOTA_ACCT|XFS_PQUOTA_ENFD))) =3D=3D
>  			      (XFS_PQUOTA_ACCT|XFS_PQUOTA_ENFD))
>  		xfs_qm_statvfs(ip, statp);

So this also changes statfs() for non-directory quota uses. It will
now *always* report project quota info for a file, whether directory
quotas are in use or not. This is going to confuse users who see the
full filesystem info when they statfs a directory, then see project
quota limits when they statfs a file.

i.e. all this patch does is move the inconsistency in reporting to
non-directory based project quota users.

So from that perspective, this is not a viable solution.

What is a viable solution is to add an explicit dirquota mount
option (which we've recently discussed) that explicitly presents all
directory quota specific behaviours to userspace without tying them
to the internal project quota-based on-disk implementation. This is
the only sane way to solve this problem as it tells the filesysetm
exactly what behaviour set it should be exposing to userspace.

IOWs, the statfs code should probably end up looking like this:

-	if ((ip->i_d.di_flags & XFS_DIFLAG_PROJINHERIT) &&
+	if ((mp->m_flags & XFS_MOUNT_DIRQUOTA) &&
 	    ((mp->m_qflags & (XFS_PQUOTA_ACCT|XFS_PQUOTA_ENFD))) =3D=3D
 			      (XFS_PQUOTA_ACCT|XFS_PQUOTA_ENFD))
 		xfs_qm_statvfs(ip, statp);

Cheers,

Dave.

-- =

Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
