Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A975BA112D6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2025 22:16:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXoGx-0004Tn-AM;
	Tue, 14 Jan 2025 21:16:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tXoGv-0004TZ-VA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 21:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jHX+EBhTmSd5aQX3XbR7AIrs2ZOuVDRSb8ZGE2c0Dis=; b=YU+qa3lJs1m2wRoGsf4VasH7Zz
 XJH/Y/ICM0ksmcEcSVLrYj37N0KmvvyDvYTk/aDbkq4liJvmscZpfCoPUTbklh+zoJgYFJlnz2F7e
 EzYh2Z6LIKYlxbBCewlWW4juLsbOx1OXC09VIgHjrorwFDc7BzpZXJn6LqoBfkLlxMAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jHX+EBhTmSd5aQX3XbR7AIrs2ZOuVDRSb8ZGE2c0Dis=; b=WI/7PZ88W8Jpq1BfcLoAeGkJFs
 jn46mx5J6Y00nJCiZIE+HSE2WvFyUq45SJxj13Q2mkUOuOL32l0LD9rQkS6i0gIgFvVDDLmGmrnjd
 DcP1tAoNw9q1jpdoqU0X912lkYuwxm2+2cdb1sDy1jYA0hmB+3bf5JXq+lYY9Qfp4jC8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXoGv-0007XP-CW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 21:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8DE74A41BC1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jan 2025 21:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F08CC4CEDD;
 Tue, 14 Jan 2025 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736889379;
 bh=dvYQdshJ0GviX6gyP3fQ0CFpSzfYScujSsw8/UDlM9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g56qtw2LXBerAWgBQ9QbRzdWpUHuCGa35C9KP3ml/5GRKtpaNCCFMFwDFN3+Pfd0d
 wQff1W5Z1HtM9HLvvMp4UvzBlntBfFz0pvenoAn6wkkLkiSsyjrZHNqPxHRAUYE33e
 TylmaXTObFb+2yvFdTojvAhEMG9rbhZmkCZ0ML4aPvpkq52cpnm6J249HmZKceUi4S
 K19DGrPcjE+z7wig5ZnwWYlzYWBSI4NV+5VQwdgY9q3JeHlqXTr7syUNHsDacF2bPB
 XU1NUyqv3+6FJODiuRjQh2Q8jKb3PwUKgxFnjvFnWSzo93ZeWA+wdJAbRtPWe4fwAr
 jC8eK/XiGrq5Q==
Date: Tue, 14 Jan 2025 21:16:17 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20250114211617.GA2558329@google.com>
References: <20250113183933.1268282-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113183933.1268282-1-jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 13, 2025 at 06:39:32PM +0000, Jaegeuk Kim via
 Linux-f2fs-devel wrote: > This patch introduces an inode list to keep the
 page cache ranges that users > can donate pages together. > > #defin [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXoGv-0007XP-CW
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: register inodes which is able to
 donate pages
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 13, 2025 at 06:39:32PM +0000, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch introduces an inode list to keep the page cache ranges that users
> can donate pages together.
> 
>  #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
> 						struct f2fs_donate_range)
>  struct f2fs_donate_range {
> 	__u64 start;
> 	__u64 len;
>  };
> 
> e.g., ioctl(F2FS_IOC_DONATE_RANGE, &range);
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/debug.c           |  3 +++
>  fs/f2fs/f2fs.h            |  9 +++++++-
>  fs/f2fs/file.c            | 48 +++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/inode.c           | 14 ++++++++++++
>  fs/f2fs/super.c           |  1 +
>  include/uapi/linux/f2fs.h |  7 ++++++
>  6 files changed, 81 insertions(+), 1 deletion(-)

Missing a rationale, documentation, tests, and fuzzing.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
