Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775729476C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Oct 2020 06:37:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kV5rt-0002rX-AK; Wed, 21 Oct 2020 04:36:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kV5rm-0002qh-1s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 04:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lESAiDDvvz5V+Lr5Rzb9SIGtKe3pfdrGxS83jzaKtnU=; b=XgYTa6dAhCb/H2khD7F+oxsFaL
 fQOMbzlv/XesbTa/ycpAGL0eAWfeL3XLnrr48SOIlkfxk+I6U60ctEW5Yj2rR8YMLJcQKHrqG8Y0d
 23f3IlZqZTyFpMvSFc6bl9IShGqL0dKWV+0SZRZuLijsez+NqVQ2hnD8KHyBeTShF6yA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lESAiDDvvz5V+Lr5Rzb9SIGtKe3pfdrGxS83jzaKtnU=; b=LzftEYiqp1n39SQX4TKwybzSP9
 tyBM29lM/6l5bXXlXQjbqMNlJxfn/BcWwNekFKBkkmYDQ8CFrehTgdFOxQZhFu5CEuaYObFB63SUz
 UPwkz7rVRqW/NhWVMKB+PJwwzvltFMyRGRqFrN5Zbwuu0sGSfVA31LTCge1WOg8XP6fA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kV5ra-000e4d-VH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 04:36:48 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 706FC20795;
 Wed, 21 Oct 2020 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603254982;
 bh=US29mnjG65+3xtVs/p9mRVy5ww8iDF1b1Klps/Bj9SM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qm0rDQEMO6FxAufRXSJzGlC11JAZp8mUhBKuSp8/KCUbIVIz2e3ZK/zpuc9tPHQJR
 xyVfn1ffwy98bI3Y3wxsYh0nkkT9hg8MGFpOvuXp8EUj10fAEZ6+6sgukkKLVVjRK6
 brPMbI6yrVgvbZp0gRAXZ0jaD+ei+bUGI3exsISc=
Date: Tue, 20 Oct 2020 21:36:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201021043620.GA3939@sol.localdomain>
References: <20201016051455.1913795-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016051455.1913795-1-daeho43@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kV5ra-000e4d-VH
Subject: Re: [f2fs-dev] [PATCH] f2fs: add compr_inode and compr_blocks sysfs
 nodes
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 16, 2020 at 02:14:55PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added compr_inode to show compressed inode count and compr_blocks to
> show compressed block count in sysfs.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 10 ++++++++++
>  fs/f2fs/sysfs.c                         | 17 +++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 834d0becae6d..a01c26484c69 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -350,3 +350,13 @@ Date:		April 2020
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
>  Description:	Give a way to change iostat_period time. 3secs by default.
>  		The new iostat trace gives stats gap given the period.
> +
> +What:		/sys/fs/f2fs/<disk>/compr_inode
> +Date:		October 2020
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show compressed inode count
> +
> +What:		/sys/fs/f2fs/<disk>/compr_blocks
> +Date:		October 2020
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show compressed block count

Is it the count in memory, or on disk?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
