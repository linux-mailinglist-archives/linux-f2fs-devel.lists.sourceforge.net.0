Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16230951327
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 05:33:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se4li-00078r-GT;
	Wed, 14 Aug 2024 03:33:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1se4lh-00078f-CT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 03:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xJCmdiqoT3ARWuE3r6yHJrI4CfdpXg8eQGvFUisESo=; b=Vgzgcq49ExO8TusN+/X+GjcTPb
 nTVyp6grk3dS/yUKTlmJgOazhKiHKVKd/gI64ZIBItVRPekPjKrwxDcH0JTS4Gh6pDzV9grZi5/rm
 79LuvYFPdyyqcdU4F2slB5wNoFYHTfnA/7OIJ61xhQVe3AecwXfKnNp99dGt0Fhl95S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+xJCmdiqoT3ARWuE3r6yHJrI4CfdpXg8eQGvFUisESo=; b=B1x82kjHj6/IoqzlEOC5Kaq8Xv
 u70FGVZ9UTgnRqalc4nmq/ro39JdVPrIsYUhzGskEM7R5zuBRPelE0Al6fEEETeNpionDT3UktnxW
 6r018GkbqRFsfNQGeFgDh8OXd8F1uOqvio8myai8iuNs/quZUOo/BHFpUWS6b6+DBM1U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se4lg-00085e-JA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 03:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DAE10CE1882;
 Wed, 14 Aug 2024 03:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A14C32782;
 Wed, 14 Aug 2024 03:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723606416;
 bh=EpuLSgfvUytePDBb/IQzp2Wnvo6eIoYC51acrnOgLbE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t4tfajytKCQfAlcaVn6v+H1gnB28gQ2+8v/5q+SD+j+qRlXuHq69Ocr2BrGYTCslM
 GRXL7pHRxjNDWmtsNaX/zgQF9zQJRlzDSGu6FG7ScnpTrMhE0cD5PgiG62Z++7YQOE
 zR0ZtvRUyZPnedyqge4kXRmRm0GhHCYzEaQMHcBwRvBE25VW7rauPMYnmk+3xFtFle
 N9jMqk18F8FCb/fo3BjG6yfDJR7wT6jWLpmAIMFHNvxGA2oEWauPogfzZ4ofWTCdU/
 174q7vlDWIVKIg23YMGBYu+5zrsfxEJ/5d4pSSLuuxiMP3oLL/yky3WU+QO3Cg58YD
 OJQNaQ96vp85Q==
Message-ID: <02214d48-6aee-40f7-9a40-60b4091b5bfa@kernel.org>
Date: Wed, 14 Aug 2024 11:33:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+78ff2855f26377625419@syzkaller.appspotmail.com
References: <000000000000ebae95061f96be85@google.com>
 <tencent_E51B7925E5BAF4BBCF33739E5E1BFA4B9F08@qq.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <tencent_E51B7925E5BAF4BBCF33739E5E1BFA4B9F08@qq.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/14 8:48,
 Edward Adam Davis wrote: > unlock i_gc_rwsem[WRITE]
 before quiting f2fs_commit_atomic_write > > Fixes: 7566a155c666 ("f2fs:
 atomic:
 fix to not allow GC to pollute atomic_file") Since original patch has not
 been merged, if you don't mind, I'd like to fix this issue in original patch.
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1se4lg-00085e-JA
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_commit_atomic_write
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
Cc: jaegeuk@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/14 8:48, Edward Adam Davis wrote:
> unlock i_gc_rwsem[WRITE] before quiting f2fs_commit_atomic_write
> 
> Fixes: 7566a155c666 ("f2fs: atomic: fix to not allow GC to pollute atomic_file")

Since original patch has not been merged, if you don't mind, I'd like to
fix this issue in original patch.

Thanks,

> Reported-by: syzbot+78ff2855f26377625419@syzkaller.appspotmail.com
> 
> #syz test: net-next 9e6869691724
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 741e46f9d0fd..a43054ab0cf1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -389,13 +389,13 @@ int f2fs_commit_atomic_write(struct inode *inode)
>   
>   	err = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>   	if (err)
> -		return err;
> +		goto out;
>   
>   	/* writeback GCing page of cow_inode */
>   	err = filemap_write_and_wait_range(fi->cow_inode->i_mapping,
>   							0, LLONG_MAX);
>   	if (err)
> -		return err;
> +		goto out;
>   
>   	filemap_invalidate_lock(inode->i_mapping);
>   
> @@ -407,6 +407,7 @@ int f2fs_commit_atomic_write(struct inode *inode)
>   	f2fs_unlock_op(sbi);
>   
>   	filemap_invalidate_unlock(inode->i_mapping);
> +out:
>   	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>   
>   	return err;
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
