Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4C87BB59
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 11:35:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkiQf-00050F-8K;
	Thu, 14 Mar 2024 10:35:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rkiQd-000500-MP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 10:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ziSFZDgPaURQjSZ585vZ5HD8vjcI+7x10Of9m6jdibo=; b=BUeGgbdhatNCVCdFHo2FMiNxpN
 0bF82obIbwa/Ab/YjcWsj9YX/gGMmWpeZjKiQtrmYJyO3mBx83EnBMub+9Bz3gLpTtT8UjofsCjiD
 J2BPvV3MbldCR32XBd+0Yy8/unmXqgQN/bBM7GI3in81msEfqPT7RL/J1BhHkkFVKAmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ziSFZDgPaURQjSZ585vZ5HD8vjcI+7x10Of9m6jdibo=; b=PXjOFAajnIWk318uJEz5gIkVZ/
 Ces1y4m2CbyV607c+sMEAmAWvnas/mpXc8z6PAnKD5NVcWuomqgBzIqw7vvdfIRFZwZYo2ff1+oYl
 kayC+ebSZQChlltBuTYdTR+pTA9U7XT94GFggCrnl9/cM9oStkGSW8PnR1SKKeMMIIgU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkiQT-0004Dw-NC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 10:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24B3DCE1BB5;
 Thu, 14 Mar 2024 10:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267A9C433C7;
 Thu, 14 Mar 2024 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710412504;
 bh=Hgh3vqIzWxqRwj99BTgkEyg/C7Qp+Y8i8zd0DBoV0s4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QHqFn20qzFzCc3m9XfQtjPCP8ChhpEfXDlzVqGaAq47X45+NtjjXk/uAzTEYBhAXx
 DvWcywyLjDORNUYnc90svStElyasG9rDj8NFgIBcmApxxoIkUxhQpORosFnqVAWmMj
 whzkLD6oN71LZMFvA6Q38imkZoQIRO/rtyduiUUTsduulq1UnJdeiNtcrxaYfjCOnp
 JvJcsCQ6jDE8Mj0A+FIfshIXXEjiIAWxD+JFpq6uGbbxfsLsK7RJyhgVfsEMqGdRlY
 MEAUFK2AxCgTpmFLRuOVL9rcE6xzFwMPukiGGvsw3G1d1NZFWNu+NPEkJYEo1hg08Q
 +xmlAYrfH0woA==
Message-ID: <9049ab55-7be4-4cc8-b2f2-2cc355f0bc8e@kernel.org>
Date: Thu, 14 Mar 2024 18:34:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <CGME20240313112650epcas1p3e65fdc5f6df18a4f700fa62bb5480b28@epcas1p3.samsung.com>
 <20240313112620.1061463-1-s_min.jeong@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240313112620.1061463-1-s_min.jeong@samsung.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/13 19:26,
 Sunmin Jeong wrote: > In f2fs_update_inode, 
 i_size of the atomic file isn't updated until > FI_ATOMIC_COMMITTED flag
 is set. When committing atomic write right > after the writebac [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkiQT-0004Dw-NC
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: mark inode dirty for
 FI_ATOMIC_COMMITTED flag
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/13 19:26, Sunmin Jeong wrote:
> In f2fs_update_inode, i_size of the atomic file isn't updated until
> FI_ATOMIC_COMMITTED flag is set. When committing atomic write right
> after the writeback of the inode, i_size of the raw inode will not be
> updated. It can cause the atomicity corruption due to a mismatch between
> old file size and new data.
> 
> To prevent the problem, let's mark inode dirty for FI_ATOMIC_COMMITTED
> 
> Atomic write thread                   Writeback thread
>                                          __writeback_single_inode
>                                            write_inode
>                                              f2fs_update_inode
>                                                - skip i_size update
>    f2fs_ioc_commit_atomic_write
>      f2fs_commit_atomic_write
>        set_inode_flag(inode, FI_ATOMIC_COMMITTED)
>      f2fs_do_sync_file
>        f2fs_fsync_node_pages
>          - skip f2fs_update_inode since the inode is clean
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org #v5.19+
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
