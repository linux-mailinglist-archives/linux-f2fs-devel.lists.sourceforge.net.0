Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2D57D8C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 04:53:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEinM-0005u4-Cz; Fri, 22 Jul 2022 02:53:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oEinL-0005ty-O3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 02:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iwgz6rw/0VxDD4XHZNJKjpHxdm+X7mgZM+/BX+Xre5I=; b=TpZitnUlUUGMirt9vvLNGRfZGg
 iKce03HYyEFYr1wLQlGgrBnRAbmOx4+7pgPbx5fgO2dmpfMLn+oT36bAMQwP6AT+gpH36VM5Jtk4A
 Nm0sslPA+mVKFVKtvuEkQ6rEFyZBKQ23XlTWXsMO89xhxlY1g4UdGRP5RXAf3AiSrq7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iwgz6rw/0VxDD4XHZNJKjpHxdm+X7mgZM+/BX+Xre5I=; b=bfvmakFt2bUgGZxDI02AoJ+owQ
 PvY2M6fSKsDbuxkI9AW+LcYEdzYTJOB7G0MFVuC0ZFaVIiTvw51Vb2WpC0cd2Z61uMApqqVErjqjJ
 gBWaNaNeX7GDoofEPSgQi2wwiXVW6MH5gqNkAZW6SMmTjGCDO1c3DJsVbyLenOAJi6Y4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEinJ-0005Ip-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 02:53:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A55361F90;
 Fri, 22 Jul 2022 02:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB555C3411E;
 Fri, 22 Jul 2022 02:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658458411;
 bh=2fgm6x/gVDPssek+ci0j5gDgctHBlJXtOZtyRX75aLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hrV+HJHJNhTu1LaLTXE00ULEsR0O9ElzYYs8W2UgBPviIz0KEmKVg6Pe8chYLxrxH
 Np6cm1NFDZY3oLRmsxUI7KTOpDUrUeT4/AAHOmOWINcwTf0CFCbpLU9fM275LgOdSl
 3j3RbIrf4u908TyCE/C6JTAC09Dx/Ay7zIRBS09ZmBfyientkGqnbvrrQwuKTLc4oc
 lszpL3+ysqn1e5kepMqCGu8a1IQwLOnWFS8nOoFJE/Hmby345ozS94OPvGLeoPUUnz
 OW+hXboLgMCgEO40I6r7kjawEM5Y74XEeycV+VJLovkJOy+C4zLZSo7HLyFy2GiE/0
 ZZee/Ghr3oTJg==
Date: Thu, 21 Jul 2022 19:53:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yufen Yu <yuyufen@huawei.com>
Message-ID: <YtoRKnBpmxxGkbv2@google.com>
References: <20220721045329.2155449-1-yuyufen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220721045329.2155449-1-yuyufen@huawei.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/21, Yufen Yu wrote: > If f2fs_iget cannot search inode
 from inode cache, it will read > the inode from disk. The processing of read
 from disk and init inode > should not dirty the inode, as the [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEinJ-0005Ip-Pi
Subject: Re: [f2fs-dev] [PATCH] f2fs: get rid of f2fs_inode_synced from
 f2fs_iget
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/21, Yufen Yu wrote:
> If f2fs_iget cannot search inode from inode cache, it will read
> the inode from disk. The processing of read from disk and init inode
> should not dirty the inode, as the commit 530e07042002 ("f2fs:
> don't mark compressed inode dirty during f2fs_iget()").

f2fs_truncate can make this?

552         if (file_should_truncate(inode) &&
553                         !is_sbi_flag_set(sbi, SBI_POR_DOING)) {
554                 ret = f2fs_truncate(inode);
555                 if (ret)
556                         goto bad_inode;


> 
> Thus, we can remove the unnecessary f2fs_inode_synced().
> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>  fs/f2fs/inode.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index fc55f5bd1fcc..ce87b66c6dfe 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -562,7 +562,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>  	return inode;
>  
>  bad_inode:
> -	f2fs_inode_synced(inode);
>  	iget_failed(inode);
>  	trace_f2fs_iget_exit(inode, ret);
>  	return ERR_PTR(ret);
> -- 
> 2.31.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
