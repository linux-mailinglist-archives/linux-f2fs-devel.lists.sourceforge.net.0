Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B78712B5F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 19:05:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2asT-00026Z-Up;
	Fri, 26 May 2023 17:05:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q2asS-00026T-Gl
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 17:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkWlPl9OY2OKB8e7s8p10JcYLC/4T+EuGxM70lrvD6g=; b=V4oCjkjDeDQJFahE5nVrnZdwMx
 ilrIqjcDAnaGfitgK1dst4obi2aqqAYtscGTremieqgbiYN7sGIv7vNN95ziZnnbueb4VmLICTEeQ
 MWybsK692byz3WLM0tEZv/WVDJwbT0GCOU4Wz9Xah2nVEXVCThxNQS5gjl5P1PtHpMnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kkWlPl9OY2OKB8e7s8p10JcYLC/4T+EuGxM70lrvD6g=; b=akc8ns7coC7aJA5wa7FR+VOllU
 CJmXfssfTa2CXBtEJ8266nJUgphBTGpwHNISlXslpbvxb2L2pjq6zrgjTZtep31qGiz9aTj+NAZFP
 K+m5aNP34kI2Wtc5EUqb1K9h1Ej11NQrUcKn0WlNBEnwOVvzJ1f+t+r+YAreJnVi4qkY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2asR-0002wZ-Ls for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 17:05:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44668616EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 May 2023 17:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBD1C433EF;
 Fri, 26 May 2023 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685120705;
 bh=ePK1BfFlvFrWar0yL2hBGckKFKq2mnc2EzLSm0R6ijc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GXgdFunLkyGrpkIU9YdEqlG2fBFk9ls+vr4FDXPuJGWqELhwebezmSz8ZUR5HR2da
 B8NYURXh77JegpXXuG8HPqF4UkB9PUu4sASuJEl1ME4u1LqzY47zim5rbmpJJmXHd2
 vMAlAcqxK8UURKtgU5YSO0npZFMmsQwgjKjr6YUYY9JA1A+RfYkV38jDXerzOBg5M7
 Z3/oTIeEuOK04HAm3otUSozyENpAkWbYyQhyavImhT1oTkYTDgTr3/jQZtXEV7WqKn
 wR/rmo/c4CeOGo5oSTdlB0x2N7f2jLHsQZRS5CF/YPUJe0pGbAdK+M1LYBWippl8Zi
 VVZlpvYs0S57w==
Date: Fri, 26 May 2023 10:05:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZHDmv2hLR9WZ16Pl@google.com>
References: <20230525082508.2320763-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525082508.2320763-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/25,
 Chao Yu wrote: > We should set noatime bit for quota
 files, since no one cares about > atime of quota file, and we should set
 immutalbe bit as well, due to > nobody should write to the file [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2asR-0002wZ-Ls
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to set noatime and immutable
 flag for quota file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/25, Chao Yu wrote:
> We should set noatime bit for quota files, since no one cares about
> atime of quota file, and we should set immutalbe bit as well, due to
> nobody should write to the file through exported interfaces.
> 
> Meanwhile this patch use inode_lock to avoid race condition during
> inode->i_flags, f2fs_inode->i_flags update.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix to detect i_flags status correctly.
>  fs/f2fs/super.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 51812f459581..1cf84c993d7c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2763,7 +2763,17 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
>  	}
>  
>  	/* Don't account quota for quota files to avoid recursion */
> +	inode_lock(qf_inode);
>  	qf_inode->i_flags |= S_NOQUOTA;
> +
> +	if (!(F2FS_I(qf_inode)->i_flags & F2FS_NOATIME_FL) ||
> +		!(F2FS_I(qf_inode)->i_flags & F2FS_IMMUTABLE_FL)) {

What about this?

if ((F2FS_I(qf_inode)->i_flags & qf_flag) != qf_flag)

> +		F2FS_I(qf_inode)->i_flags |=
> +				F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
> +		f2fs_set_inode_flags(qf_inode);
> +	}
> +	inode_unlock(qf_inode);
> +
>  	err = dquot_load_quota_inode(qf_inode, type, format_id, flags);
>  	iput(qf_inode);
>  	return err;
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
