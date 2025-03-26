Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD8FA713AB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 10:26:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txN2A-0000Bd-Sr;
	Wed, 26 Mar 2025 09:26:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txN1y-0000BH-A8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 09:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R+WMssAgLWT0ouaiUGQbS9YXQ2gRvk/MDQT6upsblbI=; b=G1viY/D3o8HqAfdo1bSIpKCkP9
 WIsGptBLbn5CLTzVPu5VgQGF6waB/USsZfH4wRXqm5wKnnM2TlSpZUDYsDVm57XzsNs3Fx0HBaQzt
 aY+316awgT0YPZcm6HCNsAbckB+rAULmQx/uA5R9hcLzcJNist+Xa6uggKfrC5f9wRMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R+WMssAgLWT0ouaiUGQbS9YXQ2gRvk/MDQT6upsblbI=; b=BtGH3gPwqXNDaXqDj3TA27z37W
 XIXbfGgt6T/fvWI8XKIkS6G6AUDoZxVG5k0yzEyc3Dan93avAVXbHADjBKQ8pGieLeCR4yUB4KYPc
 owJaYKrmlzMwv9xUvUkWdmXHAVNOxSyCpvqGrQLBzEtk0CJb1W93LldqgP7MnHqHp9Yw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txN1n-0000kr-TZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 09:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8AB2D5C6206;
 Wed, 26 Mar 2025 09:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A72C4CEE2;
 Wed, 26 Mar 2025 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742981182;
 bh=1ud3vRRXqS1I2uDnOUgws83uw4pDL84Krm3xaR/sLdo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YGFQqUJlHJr+GggPvwrpWnZ3irOGWe8S9rr2aZlsFwWilypQ9hoSSuX48gO96QzTC
 kZwU6aTEqr0GWBigPAa2ZhxybpJ7lwa7Zz0KhZ3q0ayFpbOifMuGm6JZmKyQ09ieEX
 9jg6DAQiDzv4WJ+6euRzMon/xuWcQeAxhBvvAbgdI2HKXVydyov17JpbSWKE8sBrGL
 +Ej0/yMz0M5OO6X+dnXJLNkGACc1xo7yV/WztiV3V2KimN007erRBhnij9meIOO4Dk
 60bdtSg98IgeeS/ajGz3Z5EsDW4xLt3iYtoMSsHQD2MQB4FqBd0FCa9D4D9iRcmaJB
 rbqOaPiKB8/Pw==
Message-ID: <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
Date: Wed, 26 Mar 2025 17:26:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, daehojeong@google.com,
 jaegeuk@kernel.org
References: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/26/25 16:46, Zhiguo Niu wrote: > Commit fccaa81de87e
 ("f2fs: prevent atomic file from being dirtied before commit") > adds the
 processing of FI_ATOMIC_DIRTIED in the following two positions, > [1 [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txN1n-0000kr-TZ
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/26/25 16:46, Zhiguo Niu wrote:
> Commit fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
> adds the processing of FI_ATOMIC_DIRTIED in the following two positions,
> [1]
> f2fs_commit_atomic_write
>  - __f2fs_commit_atomic_write
>   - sbi->committed_atomic_block += fi->atomic_write_cnt;
>   - set_inode_flag(inode, FI_ATOMIC_COMMITTED);
>   - if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>   -    clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>   -    f2fs_mark_inode_dirty_sync(inode, true);
>   - }
> [2]
> f2fs_abort_atomic_write
>   - if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>   -    clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>   -    f2fs_mark_inode_dirty_sync(inode, true);
>   - }
> 
> but [1] seems to be redundant:
> The atomic file flag FI_ATOMIC_FILE is still set here, so f2fs_mark_inode_dirty_sync
> still does not set the dirty state to vfs. If FI_ATOMIC_DIRTIED was originally set
> when atomic file is committing, then FI_ATOMIC_DIRTIED is just cleared here, and
> then do the repeating action of setting FI_ATOMIC_DIRTIED?
> So is it enough to do this only in [2]?

Hi Zhiguo,

I checked the code again, finally, I got this, could you please take
a look?

Ping Daeho as well.

Subject: [PATCH] f2fs: fix to set atomic write status more clear

1. After we start atomic write in a database file, before committing
all data, we'd better not set inode w/ vfs dirty status to avoid
redundant updates, instead, we only set inode w/ atomic dirty status.

2. After we commit all data, before committing metadata, we need to
clear atomic dirty status, and set vfs dirty status to allow vfs flush
dirty inode.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c   |  4 +++-
 fs/f2fs/segment.c | 10 ++++++----
 fs/f2fs/super.c   |  4 +++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 5c8634eaef7b..f5991e8751b9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -34,7 +34,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 	if (f2fs_inode_dirtied(inode, sync))
 		return;

-	if (f2fs_is_atomic_file(inode))
+	/* only atomic file w/ FI_ATOMIC_COMMITTED can be set vfs dirty */
+	if (f2fs_is_atomic_file(inode) &&
+			!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
 		return;

 	mark_inode_dirty_sync(inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dc360b4b0569..28659a71891a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -376,10 +376,12 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
 		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
-		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
-			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
-			f2fs_mark_inode_dirty_sync(inode, true);
-		}
+
+		f2fs_bug_on(sbi, !is_inode_flag_set(inode, FI_ATOMIC_DIRTIED));
+
+		/* clear atomic dirty status and set vfs dirty status */
+		clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+		f2fs_mark_inode_dirty_sync(inode, true);
 	}

 	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9a42a1323f42..a5cc9f6ee16a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1532,7 +1532,9 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
 	}
 	spin_unlock(&sbi->inode_lock[DIRTY_META]);

-	if (!ret && f2fs_is_atomic_file(inode))
+	/* if atomic write is not committed, set inode w/ atomic dirty */
+	if (!ret && f2fs_is_atomic_file(inode) &&
+			!is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
 		set_inode_flag(inode, FI_ATOMIC_DIRTIED);

 	return ret;
-- 
2.48.1


> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/segment.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 396ef71..d4ea3af 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -376,10 +376,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>  	} else {
>  		sbi->committed_atomic_block += fi->atomic_write_cnt;
>  		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
> -		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
> -			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
> -			f2fs_mark_inode_dirty_sync(inode, true);
> -		}
>  	}
>  
>  	__complete_revoke_list(inode, &revoke_list, ret ? true : false);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
