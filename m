Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C640960C5EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:58:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onEpm-0002dp-7P;
	Tue, 25 Oct 2022 07:58:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onEpl-0002dj-1W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3GesQqHOAqr8Acbd+PueIkV1+1LhSzc6X7zTu9USvQ=; b=DNk+j3Im1RPcgHFCB9Qx6iLKvR
 jg4fy8csF0njLi4emJdFd0APvcSIt5C1+GiNWRO3kpKtGbouEfyMqB1HfNOZj6s1sGlWptzjDOX1Q
 yC6S4Pjb8fllgeAyx2qs8eeY2ocKz8+yMhsUtxwbNrFbPofz0B0x7/doefUA6zxR/NQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c3GesQqHOAqr8Acbd+PueIkV1+1LhSzc6X7zTu9USvQ=; b=DtuKME1yvgyOjOIhtiHHLvVSkl
 bfXmIiVuh8XJhn28LcoluMVoFtNMV+yOgylaVzTqQy/otVMFVAs/ibM7fgCTZ5aq/cR7PkQJkVSeM
 iY7cjqKQyAV4ujvXBr0xzZYF+gGat2d5v7Al85eELqNohM5xZvHh5qpsgy3YtiQTO4Mk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onEpk-00Gehg-GY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:58:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 226D1617CB;
 Tue, 25 Oct 2022 07:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C9C433C1;
 Tue, 25 Oct 2022 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666684722;
 bh=PMF3VvJo3bQWQNenOPvO6ZiLylBNnSBY5EWI1FSgOFQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E5OI4YHlo6c2BHQvdYP1W5YBLpAwPE0X8NubHKfbSBs/tE6vpZ/QGLWd/vpm2TWVd
 ctCMfQCZ7OyfTymZxwfzKOWG6ReLEJOlfLcXvo+ERMlXC9Zovj6TL33J6Fu9zpuSfX
 Rv7w+dnKlH6GKENwkiUeo6L3fI92kpIDZCgKi4Awgia/wxL4BJdyw4UoPVks9c2RED
 6qZjRPB59CPRYspsGwPxJfygT0oAGHc1SohdibP+8rPQm576Eu3sZx2wvoluTkb6YO
 pg1GXvl5A5HJnXCSk8/jhLV6clMkrBxdE18sL0BQamfDFWbe93o7nOI1bvnFL6AueU
 B8ZkK/lEkz/fw==
Message-ID: <5cc0d3cd-8b32-0a05-f662-e2ec4f784900@kernel.org>
Date: Tue, 25 Oct 2022 15:58:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025075623.7958-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025075623.7958-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 15:56, Yangtao Li wrote: > Remove the local
 'err' variable for readable,
 > no functional changes. > > Signed-off-by: Yangtao
 Li <frank.li@vivo.com> > --- > fs/f2fs/segment.c | 10 ++++--- [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onEpk-00Gehg-GY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: cleanup in
 f2fs_create_flush_cmd_control()
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

On 2022/10/25 15:56, Yangtao Li wrote:
> Remove the local 'err' variable for readable,
> no functional changes.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index acf3d3fa4363..ed247195a20c 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -620,12 +620,11 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
>   {
>   	dev_t dev = sbi->sb->s_bdev->bd_dev;
>   	struct flush_cmd_control *fcc;
> -	int err = 0;
>   
>   	if (SM_I(sbi)->fcc_info) {
>   		fcc = SM_I(sbi)->fcc_info;
>   		if (fcc->f2fs_issue_flush)
> -			return err;
> +			return 0;
>   		goto init_thread;
>   	}
>   
> @@ -638,19 +637,18 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
>   	init_llist_head(&fcc->issue_list);
>   	SM_I(sbi)->fcc_info = fcc;
>   	if (!test_opt(sbi, FLUSH_MERGE))
> -		return err;
> +		return 0;
>   
>   init_thread:
>   	fcc->f2fs_issue_flush = kthread_run(issue_flush_thread, sbi,
>   				"f2fs_flush-%u:%u", MAJOR(dev), MINOR(dev));
>   	if (IS_ERR(fcc->f2fs_issue_flush)) {
> -		err = PTR_ERR(fcc->f2fs_issue_flush);
>   		kfree(fcc);
>   		SM_I(sbi)->fcc_info = NULL;
> -		return err;
> +		return PTR_ERR(fcc->f2fs_issue_flush);

It will cause use-after-free issue.

Thanks,

>   	}
>   
> -	return err;
> +	return 0;
>   }
>   
>   void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
