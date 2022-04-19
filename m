Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB8506FAC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 16:05:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngoTt-0004fY-Ox; Tue, 19 Apr 2022 14:05:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <brauner@kernel.org>) id 1ngoTt-0004fS-58
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eyolx3WkawdmgyQKh8K4ckL6R/I53ODc69SptHzAcsY=; b=J1uPYsVmCygAT6ICJnWncVGhR6
 eEmq8U3LnzsynFvCaEgi8Cw/UgaZmHGCvPaXmOjhn04HJhOkKI7fl8Cx9uBd0ctpFF0sVdTG+5WMf
 jJYDvzTmXipKfHApXu7gxec2cHz0YpPUDpWu6jvXcQeWF7hLFqNmad0bFfzx2LeDlDeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eyolx3WkawdmgyQKh8K4ckL6R/I53ODc69SptHzAcsY=; b=SiOfeqkAN0eLhYZhcJf87II1C0
 NOjVm5+OwQ/lKLIx7T922uVRTP9NBJ/e+s8A2DwLNstT5+TU7do1EChlnewvE929JaQPtfWrkczB3
 cgM6feU+7M+/y6D3hZeJSC6rrx76/otPh8ZRxOe1Hp4loi4v/rr3+q0/BBvjjsWRi85M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngoTn-003xSt-7V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:05:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C66CA616AB;
 Tue, 19 Apr 2022 14:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A661BC385A7;
 Tue, 19 Apr 2022 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650377113;
 bh=mCyLOQ+YYWJdnCkas4j4KrcCEsk9TWMaw5fUA2B90wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sbUJfZtKE357HLp9zwkgO1gzbtcIxHIOOMuWmDIljYvWwcLZdyiJ/Z+gm3xs2XS/3
 62n6gpgcZwGH2LfiSx0A+5gKTfdMcONgxyIt+InI4zGJqnY84H/LuCnsQDO0Px9G/N
 vTDDN71LOQJt3cKZ0ThGi3Fo2zsRnvmXAy5HmJ9GQ/UqpRXNrN9AoJll/tvY4WWE5E
 ppI5nh+G7uVGCJvBmOQYl49dNALLu442pIiHZh0eVa1pggrPjnC2QXiyZPw2rTRzAP
 Do7Kd2/fCr2TTpw+wSa/pKf0FCtBVw/g4NmGZ50jEKRUFySiu6NnEDyaF87NF8RNKh
 TPDU8z9wgcbFw==
Date: Tue, 19 Apr 2022 16:05:08 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20220419140508.b6c4uit3u5hmdql4@wittgenstein>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19, 2022 at 07:47:07PM +0800, Yang Xu wrote: >
 This has no functional change. Just create and export inode_sgid_strip api
 for > the subsequent patch. This function is used to strip S_ISGID [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngoTn-003xSt-7V
Subject: Re: [f2fs-dev] [PATCH v4 1/8] fs: move sgid strip operation from
 inode_init_owner into inode_sgid_strip
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
Cc: linux-nfs@vger.kernel.org, djwong@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jlayton@kernel.org,
 ceph-devel@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 19, 2022 at 07:47:07PM +0800, Yang Xu wrote:
> This has no functional change. Just create and export inode_sgid_strip api for
> the subsequent patch. This function is used to strip S_ISGID mode when init
> a new inode.
> 
> Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  fs/inode.c         | 22 ++++++++++++++++++----
>  include/linux/fs.h |  3 ++-
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 9d9b422504d1..3215e61a0021 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2246,10 +2246,8 @@ void inode_init_owner(struct user_namespace *mnt_userns, struct inode *inode,
>  		/* Directories are special, and always inherit S_ISGID */
>  		if (S_ISDIR(mode))
>  			mode |= S_ISGID;
> -		else if ((mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP) &&
> -			 !in_group_p(i_gid_into_mnt(mnt_userns, dir)) &&
> -			 !capable_wrt_inode_uidgid(mnt_userns, dir, CAP_FSETID))
> -			mode &= ~S_ISGID;
> +		else
> +			inode_sgid_strip(mnt_userns, dir, &mode);
>  	} else
>  		inode_fsgid_set(inode, mnt_userns);
>  	inode->i_mode = mode;
> @@ -2405,3 +2403,19 @@ struct timespec64 current_time(struct inode *inode)
>  	return timestamp_truncate(now, inode);
>  }
>  EXPORT_SYMBOL(current_time);
> +
> +void inode_sgid_strip(struct user_namespace *mnt_userns,
> +		      const struct inode *dir, umode_t *mode)
> +{

I think with Willy agreeing in an earlier version with me and you
needing to resend anyway I'd say have this return umode_t instead of
passing a pointer.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
