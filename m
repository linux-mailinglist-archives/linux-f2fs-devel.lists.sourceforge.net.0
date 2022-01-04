Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C804842B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jan 2022 14:43:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n4k5z-0007kg-P3; Tue, 04 Jan 2022 13:43:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1n4k5x-0007kD-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 13:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UFw4Wmq9Q+FHIvU4uEOTuUVTdeFPiwBEbg55zQxrc54=; b=ACtgfVb9tnGLRuVAxxaibcPAST
 R/z2Z8RULfeOwYr+J42PNMBFaW75NkXQITWOvxgkBA9yKsUQdaj+8nPmB5L/1o8lO3rgD0AyCe5jl
 9utdR3MS6ymwtiuVusWOXfYp1ivoVXmcSY8qcNu8XqV7VFUTUOowGuLjCXXRjrAVvOZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UFw4Wmq9Q+FHIvU4uEOTuUVTdeFPiwBEbg55zQxrc54=; b=iuCTJnW30Nu6fyDS/EHom9hF/D
 e73FenAClWvo9ojZWWUmNPwFc1LEdKnmNcCXUAo1qHPVjOaxMexJqTCRoOcb5BFmDElJdd87Kh6zd
 Tk/m+UpiKrmTRhKww4kgzoOvTj9RoN1Dq36qcMdquvP7vn4CPa07Y2ey8T68TeKgDMEY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n4k5v-001txK-Pj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 13:43:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1695B613EF;
 Tue,  4 Jan 2022 13:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE805C36AE7;
 Tue,  4 Jan 2022 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641302292;
 bh=YnMaCUMaN6MFS9SW5hsu5+kjGgZjuaZQH7Uhhs1C3Gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LtIDotKL3VLhomm+82i1sW3l066f/grL3B9XKtLTY0T6yApKTBaRXQpTye4wZ5g5Y
 /F0m/BxlGPQ7xYsM7qzh2E/eoUcLxiHhJDalfvIPmZ5TR+1vxCTXEe2+1a5blzUeh7
 ggARx95Bcyy7aBDcvQ/fdEwB9uV70d70CfVlMuy8=
Date: Tue, 4 Jan 2022 14:18:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YdRJEBhSg8vlD6cP@kroah.com>
References: <20220104130513.3077-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104130513.3077-1-chao@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 04, 2022 at 09:05:13PM +0800, Chao Yu wrote: >
 commit a5c0042200b28fff3bde6fa128ddeaef97990f8d upstream. > > As Yi Zhuang
 reported in bugzilla: > > https://bugzilla.kernel.org/show_bug.cgi [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n4k5v-001txK-Pj
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix potential deadlock
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
Cc: jaegeuk@kernel.org, Yi Zhuang <zhuangyi1@huawei.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 04, 2022 at 09:05:13PM +0800, Chao Yu wrote:
> commit a5c0042200b28fff3bde6fa128ddeaef97990f8d upstream.
> 
> As Yi Zhuang reported in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=214299
> 
> There is potential deadlock during quota data flush as below:
> 
> Thread A:			Thread B:
> f2fs_dquot_acquire
> down_read(&sbi->quota_sem)
> 				f2fs_write_checkpoint
> 				block_operations
> 				f2fs_look_all
> 				down_write(&sbi->cp_rwsem)
> f2fs_quota_write
> f2fs_write_begin
> __do_map_lock
> f2fs_lock_op
> down_read(&sbi->cp_rwsem)
> 				__need_flush_qutoa
> 				down_write(&sbi->quota_sem)
> 
> This patch changes block_operations() to use trylock, if it fails,
> it means there is potential quota data updater, in this condition,
> let's flush quota data first and then trylock again to check dirty
> status of quota data.
> 
> The side effect is: in heavy race condition (e.g. multi quota data
> upaters vs quota data flusher), it may decrease the probability of
> synchronizing quota data successfully in checkpoint() due to limited
> retry time of quota flush.
> 
> Fixes: db6ec53b7e03 ("f2fs: add a rw_sem to cover quota flag changes")
> Cc: stable@vger.kernel.org # v5.3+
> Reported-by: Yi Zhuang <zhuangyi1@huawei.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 83e9bc0f91ff..7b0282724231 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1162,7 +1162,8 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>  	if (!is_journalled_quota(sbi))
>  		return false;
>  
> -	down_write(&sbi->quota_sem);
> +	if (!down_write_trylock(&sbi->quota_sem))
> +		return true;
>  	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
>  		ret = false;
>  	} else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)) {
> -- 
> 2.32.0
> 

What stable tree(s) is this for?

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
