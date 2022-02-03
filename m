Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8D4A8CDC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Feb 2022 21:03:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFiKa-0006ps-HU; Thu, 03 Feb 2022 20:03:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nFiKX-0006pl-Bx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 20:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n9IuIlk0CGto/oB+tgxwQgFOfL88ktJTvS4we9LD68Q=; b=k+o7HfjGmCuyQqZuZffO7PixM+
 xsT4ZsnO/ITx8Vf1oTeV740LlJlGI1kPWEnyJg52ag1T8J+BirvWpkjNQieJasHFAJQ34heSVo/Mm
 xFJ6TzBH8EsHWU2QMn3GNMKJA8oPWWhK4BECmnrbejrwqV42NK9+fJFXQ7ZruDxBXtm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n9IuIlk0CGto/oB+tgxwQgFOfL88ktJTvS4we9LD68Q=; b=e9b+y0kQPDpFuetrzmxvzZUT4N
 z8ZXNDfmEEbq8Y10I1v2g44dp6NKElXkUj8xszrX04GPcXRQ5V1wLzn+80NGfssVQMxS0yITjHPCl
 BRjIgMI55tDtbVA9hANCs0r6J7RmnLeOM71S8kyIC3LN4cQPHrScdsA1p7c23qSAgacY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFiKV-0000lr-AS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 20:03:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DE03B81C86;
 Thu,  3 Feb 2022 20:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE22AC340E8;
 Thu,  3 Feb 2022 20:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643918616;
 bh=BYyFT3gy5b+xN2UQFHLCszX9c7Iabdr/TmYfxt+xQUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QwAcCqAL/FVaQKM8cIMP+5ZlptqiakqUcwqpRfN6f+nVS99ComXMXrL96B4dyvDRT
 vzCKXRavC2X4Ea7OWwST1O4eZhwJMeNo3/IEuC3Bm54RVjXvaZG5S/9ROTalIpiMkO
 Jxmvbwr5ymrZR6K2J0Rg9mOBrtXyOT7LiMqKi/KTsLnQt8nJO3DF9yYvNq99h3+pFG
 v9N6WefJrpmJU8WSyB3+9WSPcexVU7AK/xhTERqXFeFz8laNvFTfJMcIQOSfoIh3Wk
 DcHVaLZclc250RHukoEqt5DZfEACEYc16iwXm5nrO0Wfj4NxNeZHJkd32PipNw7Qpi
 V/9uID0gXGKvA==
Date: Thu, 3 Feb 2022 12:03:34 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yfw1FnkiO+U+zGS0@google.com>
References: <20220203144705.23528-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220203144705.23528-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/03, Chao Yu wrote: > As Pavel Machek reported in below
 link [1]: > > After commit 77900c45ee5c ("f2fs: fix to do sanity check in
 is_alive()"), > node page should be unlock via calling f2fs_put_p [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFiKV-0000lr-AS
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to unlock page correctly in error
 path of is_alive()
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
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/03, Chao Yu wrote:
> As Pavel Machek reported in below link [1]:
> 
> After commit 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()"),
> node page should be unlock via calling f2fs_put_page() in the error path
> of is_alive(), otherwise, f2fs may hang when it tries to lock the node
> page, fix it.
> 
> [1] https://lore.kernel.org/stable/20220124203637.GA19321@duo.ucw.cz/

Need -stable? It seems 4.19+?

> 
> Fixes: 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/gc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0a6b0a8ae97e..2d53ef121e76 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1038,8 +1038,10 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  	}
>  
> -	if (f2fs_check_nid_range(sbi, dni->ino))
> +	if (f2fs_check_nid_range(sbi, dni->ino)) {
> +		f2fs_put_page(node_page, 1);
>  		return false;
> +	}
>  
>  	*nofs = ofs_of_node(node_page);
>  	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
