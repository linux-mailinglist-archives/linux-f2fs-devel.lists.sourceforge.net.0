Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C071295272C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2024 02:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seOiT-00042y-LL;
	Thu, 15 Aug 2024 00:51:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seOiS-00042q-7c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 00:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fb8ABiWlPi0Wv7GYOe8oO4YDBfQJB3BpIU4zlWb0P5E=; b=ELsYLpvjm9KbSYzVg6tMIjbCIN
 a/VeVYehKa+m8YqpUuMGs1EzvmQ4CDG08/k4I2V/i6P7Chhk0Cuda+e74Xek6KSxrzJeABwf9aIaf
 RZFI7E/FUy9+YXlQxhjer+/lee+7sVskKbrY7GU0qEuIUgQ/tJBMhJxlcEJMpiWyF3Ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fb8ABiWlPi0Wv7GYOe8oO4YDBfQJB3BpIU4zlWb0P5E=; b=SX9IRO7sxGy7Cd8hArZ2f5jnuv
 kQdBpBBTFx9s+53V4S8rmpg3y5kHgXjgSqyxTuccsblLUyE6YXlPAiH/iJX70d9oGvPWm6oHqDe/K
 ibukU9FKlY/ja/VZElvmhKzfYmG89+Mkg0AgTMayyPoxNIob++FdrfPs5I7qp4Ee9l0M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seOiQ-0002Kg-Vh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 00:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98B5E61D24;
 Thu, 15 Aug 2024 00:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5707C116B1;
 Thu, 15 Aug 2024 00:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723683096;
 bh=pPzJvLK4QhT/YIFBLvsdlqwEKbdcS1cslS2BGsUwV1s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KH5ey9aWoFgXYB82sXPybGE6NIClJr9ElHCv5l24WRTZ3YVYYy96e8VsbXGuJVtNS
 kgiAC4qX8TDB1+h0lf3sLhR1yfCmfruXlNUKkNCZbfSdSY+9f5E8TRHIb7+IKLnAhV
 DnzwVHtNUFGfAJsZ98IMemn/qjBDwZUu2/sufX62z+Wr9rUTJFBqAhqrzcKJpWy2OI
 /VgSotL9jOMeLAe44KmQlRntNetVTCdLATvBFtPGmUs+5lEYqUWuZyNFVbF6n5plLu
 Rm+TibJtiX/HkR6nrM/crWXVD3fOX0yZZE3zqbz8NEv9vBJVJIK7tnKmoo8l4lWQov
 QfnKpZhw/2Yyg==
Message-ID: <efcc15bf-0248-4690-b4d4-11022d12cffd@kernel.org>
Date: Thu, 15 Aug 2024 08:51:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Diogo Jahchan Koike <djahchankoike@gmail.com>, jaegeuk@kernel.org
References: <20240814211640.167728-1-djahchankoike@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240814211640.167728-1-djahchankoike@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/15 5:16, Diogo Jahchan Koike wrote: > fix reader
 lock unreleased in error path. Thank you for catching this, if you don't
 mind, I'd like to merge it to original patch, since it is still in dev-test
 branch. Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seOiQ-0002Kg-Vh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix unreleased reader lock on return
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
Cc: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/15 5:16, Diogo Jahchan Koike wrote:
> fix reader lock unreleased in error path.

Thank you for catching this, if you don't mind, I'd like to merge it to
original patch, since it is still in dev-test branch.

Thanks,

> 
> Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")
> Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
> Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
> ---
>   fs/f2fs/file.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 51f6ffd5f4e2..c9eda5dbd11f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2172,6 +2172,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>   	if (ret) {
>   		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   		goto out;
>   	}
>   
> @@ -2181,6 +2182,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>   		if (IS_ERR(pinode)) {
>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   			ret = PTR_ERR(pinode);
>   			goto out;
>   		}
> @@ -2189,6 +2191,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		iput(pinode);
>   		if (ret) {
>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   			goto out;
>   		}
>   
> @@ -2202,6 +2205,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>   		if (ret) {
>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&fi->i_gc_rwsem[READ]);
>   			goto out;
>   		}
>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
