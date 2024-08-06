Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB90949935
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 22:36:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sbQue-00051x-08;
	Tue, 06 Aug 2024 20:36:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1sbQuc-00051n-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Aug 2024 20:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yOZsdAQoHQ9ECHbMTj5+F8nYAi2mJLf7YFtaK8qMTBw=; b=MMHih2jmdJcHWzli7MFUhlhvf6
 9NjBKaawJOJTD7++qiZKHUwo3ISHb2Tz1B4gurEg1Va1Xsv6w6LoeGS5KP88HCfWsTRJYFHmVinmg
 RAFNmW0GnCX3J6TDctmSMCocRhbBGLerMvdAC6yGKOvdWTITeNb0FYOik5dt3Giv7N40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yOZsdAQoHQ9ECHbMTj5+F8nYAi2mJLf7YFtaK8qMTBw=; b=gGykS0CsMPmmEEDA+F5pSpSKkj
 9/iwb50IfOK8FhthtYM2mC8M/fK0mc6nIv0+LwGnX4GP4+3XqHzfpTYyUWimFchSFw8h83+5uBo4Y
 BYWeXX7QWWsTSaBkQNYbiZ8qzWKhGHkSwQkt92SwoG8Iw7um9+VFwS6xIDB7SAE+hBIU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sbQub-0003Gi-Q0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Aug 2024 20:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 706D86106C;
 Tue,  6 Aug 2024 20:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9740C32786;
 Tue,  6 Aug 2024 20:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722976555;
 bh=mQKKY+nJ0uY3IUjy66Pt5rpL9+oW2CYI1J7x+XK/Jeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0BwozzLVeCTO5xLh+2V+tVO09O1fALeoDn/XLIOJCzgRktz/iS1yA7bnwjdwnB/L
 3bNedjEs09by6tGVJUZ60VNgEcGGzRTf2d6a/LQQPrXssFqsfVZshykd5KREtpvdmQ
 bwwqv1j/QfOXHj0zPqOvjYYXX4y2diTiFjZuZDIN4M8t2JAKxBR/DeYH7ezk6e2ORE
 iC8hRd+pK5RJ3t17k4pBiFIVSnmH14+XBnYsIrTsscdO5uuImvaV8VHyJpOSqc7pht
 96NnXIgZOeW06vJYckV1miaiQESD9FHrFwxFv9yyGIlSDgWcb8WLatR6+ZRjPk/yOo
 4sHe8UcrxbZnw==
Date: Tue, 6 Aug 2024 13:35:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jann Horn <jannh@google.com>
Message-ID: <20240806203553.GA2447@sol.localdomain>
References: <20240806-f2fs-atomic-write-v1-1-8a586e194fd7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240806-f2fs-atomic-write-v1-1-8a586e194fd7@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 06, 2024 at 04:07:16PM +0200,
 Jann Horn via Linux-f2fs-devel
 wrote: > The F2FS ioctls for starting and committing atomic writes check
 for > inode_owner_or_capable(), but this does not give [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sbQub-0003Gi-Q0
Subject: Re: [f2fs-dev] [PATCH] f2fs: Require FMODE_WRITE for atomic write
 ioctls
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 06, 2024 at 04:07:16PM +0200, Jann Horn via Linux-f2fs-devel wrote:
> The F2FS ioctls for starting and committing atomic writes check for
> inode_owner_or_capable(), but this does not give LSMs like SELinux or
> Landlock an opportunity to deny the write access - if the caller's FSUID
> matches the inode's UID, inode_owner_or_capable() immediately returns true.
> 
> There are scenarios where LSMs want to deny a process the ability to write
> particular files, even files that the FSUID of the process owns; but this
> can currently partially be bypassed using atomic write ioctls in two ways:
> 
>  - F2FS_IOC_START_ATOMIC_REPLACE + F2FS_IOC_COMMIT_ATOMIC_WRITE can
>    truncate an inode to size 0
>  - F2FS_IOC_START_ATOMIC_WRITE + F2FS_IOC_ABORT_ATOMIC_WRITE can revert
>    changes another process concurrently made to a file
> 
> Fix it by requiring FMODE_WRITE for these operations, just like for
> F2FS_IOC_MOVE_RANGE. Since any legitimate caller should only be using these
> ioctls when intending to write into the file, that seems unlikely to break
> anything.
> 
> Fixes: 88b88a667971 ("f2fs: support atomic writes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  fs/f2fs/file.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
