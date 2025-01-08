Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A941A05A3C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2025 12:44:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVUU3-0002OP-AY;
	Wed, 08 Jan 2025 11:44:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tVUU1-0002OG-PZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 11:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CxhOLzc4/YXvhQlC3ZDC6LYyEaU9IS3jZo82LQr+VGg=; b=Cmr5XhFQ7B9+w+q/5kmexM4DDq
 9BKd6B/5TNUtEWZgxYXhQo2Swte0+cGKPSra9nAQ8xjb0gw44sRxtemjjmJk2K/X7M4IXKriCGz7W
 uyAiJBLHzXGGzEyZtG+OY0W420cn9QAeOniuRe0i4Y8y7ZDSOD7aSkuwZV4ZVBxJDgmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CxhOLzc4/YXvhQlC3ZDC6LYyEaU9IS3jZo82LQr+VGg=; b=bCtEI6QnpVz/VVNIXD08rK8f9A
 vsNMmrjM9lVoA59dcKVHPK7FWehRysU7arXQCu/TMcYD/gkCnNmiu7aMc4Ec5AkgZgiQvJeF0OHDT
 jAf0DmU9fTJ0WhfK/k8YSE8MDIzz9B4J9Yg5/8ticZAQDQ6okZnIWRZtG34OHJGqN3kQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVUU0-0005Kc-JD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 11:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3109D5C4A19;
 Wed,  8 Jan 2025 11:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB519C4CEDD;
 Wed,  8 Jan 2025 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736336650;
 bh=vZUZXlQtqy6x5JVkmRBxdMYe9T7dmpB5GPXALnouEFA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=P+Rrl0s0c7KzGL7Qq7Svr/iviU19HK3beanbc/sDlacnxanEyudoZfKGHIYNSMFUq
 rH4Vccczta0EovNCWWvlcC80vwmFm1IiuPGEPJMo2kFcA35ULV00Qy3rGNlAZ5nEwZ
 dexjcVeTiRjLp1Id5WAz6aldOo1/r6m7PZhnpTv/4K3dkNR3aMQFZE/SMVD8B8UOtz
 NbDAqGavhptS0hnvdpmhcfhr/FTVCD6Dc5TSSCg2j3g4PBxjlEco1uAAl8XxIs7XUX
 2KuGHN+GpTXEytk2U9CfwDFjcrymbiyPHwXV8d7rFCZhNgx4UR0BD5lgocdUTL4PlN
 6JobIGpIR+h+g==
Message-ID: <60ec8f56-5d00-426a-978d-a31894262705@kernel.org>
Date: Wed, 8 Jan 2025 19:44:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: qasdev <qasdev00@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <Z32y1rfBY9Qb5ZjM@qasdev.system>
Content-Language: en-US
In-Reply-To: <Z32y1rfBY9Qb5ZjM@qasdev.system>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Qasim, On 2025/1/8 07:03,
 qasdev wrote: > In f2fs_getxattr(), 
 the function lookup_all_xattrs() allocates a 12-byte > (base_size) buffer
 for an inline extended attribute. However, when > __find_inline_xattr() [...]
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVUU0-0005Kc-JD
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix slab-out-of-bounds Read KASAN bug
 in f2fs_getxattr()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Qasim,

On 2025/1/8 07:03, qasdev wrote:
> In f2fs_getxattr(), the function lookup_all_xattrs() allocates a 12-byte
> (base_size) buffer for an inline extended attribute. However, when
> __find_inline_xattr() calls __find_xattr(), it uses the macro
> "list_for_each_xattr(entry, addr)", which starts by calling
> XATTR_FIRST_ENTRY(addr). This skips a 24-byte struct f2fs_xattr_header
> at the beginning of the buffer, causing an immediate out-of-bounds read
> in a 12-byte allocation. The subsequent !IS_XATTR_LAST_ENTRY(entry)
> check then dereferences memory outside the allocated region, triggering
> the slab-out-of bounds read.
> 
> This patch prevents the out-of-bounds read by adding a check to bail
> out early if inline_size is too small and does not account for the
> header plus the 4-byte value that IS_XATTR_LAST_ENTRY reads.

Thank you very much for analyzing this issue, the root cause you figured 
out makes sense to me.

Can you please check the patch in below link? It seems it can fix this 
issue as well? IIUC.

https://lore.kernel.org/linux-f2fs-devel/20241216134600.8308-1-chao@kernel.org/

Thanks,

> 
> Reported-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
> Tested-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
> Tested-by: Qasim Ijaz <qasdev00@gmail.com>
> Fixes: 388a2a0640e1 ("f2fs: remove redundant sanity check in sanity_check_inode()")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>   fs/f2fs/xattr.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 3f3874943679..cf82646bca0e 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -329,6 +329,9 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>   	if (!xnid && !inline_size)
>   		return -ENODATA;
>   
> +	if (inline_size < sizeof(struct f2fs_xattr_header) + sizeof(__u32))
> +		return -ENODATA;
> +
>   	*base_size = XATTR_SIZE(inode) + XATTR_PADDING_SIZE;
>   	txattr_addr = xattr_alloc(F2FS_I_SB(inode), *base_size, is_inline);
>   	if (!txattr_addr)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
