Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7E611FF6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 06:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oodIn-0001mY-Iz;
	Sat, 29 Oct 2022 04:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oodIl-0001mS-Tr
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z5N1e7/oP4LU7RQJL/sQG0qpTKAayHdvBjjGNJMs8u0=; b=UhoVMFUEaVKy1HW8mQdd6LQFRc
 rplYDtBfg7S8s4Ifs6tgI0tHiseT00qIweeXd+mKhZd8H/VXzvCZ91XGI4cRRuFGKYA38N5dyW94U
 NrCj4VMnAmKL7JOY8BSPizJl/VFj8/lOdz6SJADMtrNG47GQZ+HwlTUGCkykaYzCOGBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z5N1e7/oP4LU7RQJL/sQG0qpTKAayHdvBjjGNJMs8u0=; b=UtgczJ1IKrhXoP/vUEPfNQqXS1
 7m03T92p+QXLRRuF4f/jdyUmJRd45MzhU7zDHlwDc0qpzJIx2I7F1Fg8riWsx/yH3bg4kNDQSZsiO
 vAGL3NrHjxvzh0NUzhipHxVzRUZoWefhlijDymlaKGJqdjRB3AqBo5qIdDTlaeyV8eQo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oodIh-0049Oq-Mq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:18:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4389C601CD;
 Sat, 29 Oct 2022 04:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7964EC433C1;
 Sat, 29 Oct 2022 04:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667017093;
 bh=bfmSe1xdl/TsRAPmZ7VtlLBP4R3hq8IJflIoAGQwlg4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y/SDIuRoo7qMZgpwVx2nk+36jXpqXKjZoZuFJMSkNBhlfpYVPkl7770BuaOrjZlvu
 MpmXVB+BdddHZOxWo0il+ZRN2M/uZi0Y9O3QciuecUGf54lT+H6hECpOVE1Og28nv0
 +MQfeoGMDsqsuBKw+qcMmtXJ+L7PrnEotJkd6ZgMFd5gCWi7lY8G7xINgWKnBykLFJ
 Ao7bzln3ghPbd1tnOBbaFFnQ5hggvb1D0bDb1bCMXDNonk6dKClw3c8/maPFV4N/yQ
 6aSPYbfcTtBlZrr2HXKtdclzBT7UHdDIVlT7ojjKqIa32AC54X6BTVIPCTwco7TVQp
 5zoBGLffShSug==
Message-ID: <423b0738-e72a-7ae8-72dc-40f924d9fe0d@kernel.org>
Date: Sat, 29 Oct 2022 12:18:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221026130504.26312-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221026130504.26312-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/26 21:05, Yangtao Li via Linux-f2fs-devel wrote:
 > Some minor modifications to flush_merge and related parameters: > > 1.The
 FLUSH_MERGE opt is set by default only in non-ro mode. > 2.When [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oodIh-0049Oq-Mq
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set flush_merge opt and show
 noflush_merge
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/26 21:05, Yangtao Li via Linux-f2fs-devel wrote:
> Some minor modifications to flush_merge and related parameters:
> 
>    1.The FLUSH_MERGE opt is set by default only in non-ro mode.
>    2.When ro and merge are set at the same time, an error is reported.
>    3.Display noflush_merge mount opt.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/super.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 3834ead04620..475fa10c6007 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1347,6 +1347,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		return -EINVAL;
>   	}
>   
> +	if ((f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb))
> +		 && test_opt(sbi, FLUSH_MERGE)) {

One more blank before &&.

> +		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
> +		return -EINVAL;
> +	}
> +
>   	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
>   		f2fs_err(sbi, "Allow to mount readonly mode only");
>   		return -EROFS;
> @@ -1935,8 +1941,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   		seq_puts(seq, ",inline_dentry");
>   	else
>   		seq_puts(seq, ",noinline_dentry");
> -	if (!f2fs_readonly(sbi->sb) && test_opt(sbi, FLUSH_MERGE))
> +	if (test_opt(sbi, FLUSH_MERGE))
>   		seq_puts(seq, ",flush_merge");
> +	else
> +		seq_puts(seq, ",noflush_merge");
>   	if (test_opt(sbi, NOBARRIER))
>   		seq_puts(seq, ",nobarrier");
>   	if (test_opt(sbi, FASTBOOT))
> @@ -2065,7 +2073,8 @@ static void default_options(struct f2fs_sb_info *sbi)
>   	set_opt(sbi, MERGE_CHECKPOINT);
>   	F2FS_OPTION(sbi).unusable_cap = 0;
>   	sbi->sb->s_flags |= SB_LAZYTIME;
> -	set_opt(sbi, FLUSH_MERGE);
> +	if (!(f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb)))

How about using more explicit condition?

if (!f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)))

> +		set_opt(sbi, FLUSH_MERGE);
>   	if (f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi))
>   		set_opt(sbi, DISCARD);
>   	if (f2fs_sb_has_blkzoned(sbi)) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
