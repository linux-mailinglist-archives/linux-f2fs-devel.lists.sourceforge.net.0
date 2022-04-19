Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20D506FAA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 16:03:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngoSF-0002rz-Mf; Tue, 19 Apr 2022 14:03:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <brauner@kernel.org>) id 1ngoSE-0002rs-FA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=huBclNwYLzCR7uL5xNUOLZKdNJKB3M97WbAGvzqQD2k=; b=ejQlAppRiYu9hA3dWHYvTiZFqc
 3S+Bdz1+HxzOUBb0cSxD2hExbvGVuoFLTBGip3xrxzbs5dtxu//n00RvLcqCUCUJ4d/UUJJcyfDx3
 +L8pHKql9exqpM5WYPIjJiFFmFfAUagfcopcl1uOPu1oH9W8ZKMlt9w72q4pqgK/AOIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=huBclNwYLzCR7uL5xNUOLZKdNJKB3M97WbAGvzqQD2k=; b=AKI5JkhNqeNIFlsOGlJ29hKLuu
 5KGCCj6Nc/QfMYECFWcjfMv0YsI9Y38z8JEw+tstRXJK/k8FlPlx3Zla0b553csv6OsUMn4C+/qMH
 AdEWZBP//521bxpfep+NqxiasEPdPSrmHogHtyIqbp9I+UY/UzrbCTtzKrjBiSJ0ew0U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngoSE-00037O-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:03:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F7F2615F1;
 Tue, 19 Apr 2022 14:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2536C385A7;
 Tue, 19 Apr 2022 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650377016;
 bh=tFAAs+fiYJ2BsZiyGNrhRo5R1A/suHSPfni/ubpjD7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kM2YxlsGmbliGkoVk+kdii1qyYQFWzN64NCescUWCKlxX0e/jHsQMFwYp6aGUFJti
 OuPUiHix3LVgMjiQ/q82Imej9B4osuruKNncgG92B/1GzzrudZrQm69ePkdPH0F9s3
 Zez6ZYfvKjW0fVkysaFyRefwdQJGBfzxyNGfP8xZCn9MO7ddM9y/WBRhMltrheIq4S
 tcLjr3nletIDq9AvMsq+kYN+B4zJ0pUwJcW2m7ADs2FMe4so+fbNFGSJz+SREFfHMN
 gtjkChCnr/jGYGWmTMlOzDmw1qqwuzJDxh62EzPCUvuyz0L1QfVDhMm1APeqASPm5W
 W107a1iSDBEHA==
Date: Tue, 19 Apr 2022 16:03:30 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20220419140330.jogjwtdzy735j567@wittgenstein>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-6-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1650368834-2420-6-git-send-email-xuyang2018.jy@fujitsu.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19, 2022 at 07:47:12PM +0800, Yang Xu wrote: >
 Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
 > style > > error = posix_acl_create(dir, &inode->i_mode, &def [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngoSE-00037O-Mp
Subject: Re: [f2fs-dev] [PATCH v4 6/8] ntfs3: Use the same order for acl
 pointer check in ntfs_init_acl
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

On Tue, Apr 19, 2022 at 07:47:12PM +0800, Yang Xu wrote:
> Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
> style
> 
>        error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>        if (error)
>                 return error;
> 
>         if (default_acl) {
>                 error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
>                                        default_acl, XATTR_CREATE);
>                 posix_acl_release(default_acl);
>         } else {
>                 inode->i_default_acl = NULL;
>         }
>         if (acl) {
>                 if (!error)
>                         error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
>                                                acl, XATTR_CREATE);
>                 posix_acl_release(acl);
>         } else {
>                 inode->i_acl = NULL;
>         }
> 	...
> 
> So for the readability and unity of the code, adjust this order.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---

Again, this patch is irrelevant to the main drive of this patch series
and it's sensitive enough as it is. Just drop it from this series and
upstream it separately to the relevant filesystem imho.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
