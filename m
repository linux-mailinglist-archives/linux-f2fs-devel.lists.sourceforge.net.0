Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E637791337
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 10:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qd4qC-000143-6I;
	Mon, 04 Sep 2023 08:21:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qd4qB-00013x-BX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 08:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5utycOS1i+T5o7RZXCSo1x43xY5NKwZP8g+cky/f61U=; b=FPVbSEPhtLW5A5BvUjlcUQYa+7
 RCisjJg5JSSe2Vt0YF+t+LSM/SZzoYu9/30l49SMH033LgamgCJIyyQKl81TWNi92hZbTQdIjB6x5
 Gb2s7dE272yN6MxT+iQ1uIJVnmBf1AXNz1sT9tXv1615TVAgtzKpsUubGSMMe/NSxNok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5utycOS1i+T5o7RZXCSo1x43xY5NKwZP8g+cky/f61U=; b=hyyRaiWqbk+IHVvJ3Rj3gn6YrP
 wlLWnBWk1u6c2lPvS+5HTJ4f0/hKUijVVaht6O5TLAlFj27gcQu5nq7j61HkyuPDS2CyTWWqtundn
 oEjMIv8vdbfbxAW7oCBQNeoZpXaOYFAupt+fZoRYvKfXc+Z55Fe3VT6xfSoBtT59ohOM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qd4q8-00051e-4A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 08:21:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4A73B80D71;
 Mon,  4 Sep 2023 08:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF44CC433C7;
 Mon,  4 Sep 2023 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693815696;
 bh=ZBFrCqwjvVuMDlDB1niobclvuRI8AMUZXYztRkxjvzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=htIO8Vtn8t8ALGLXCqUp8DBvDlCPDV+FnEa3qPqWNqMKI14XGUT8cYlstOmayp5V2
 SxGuS1lxiq7QoXas0SQd1XN5fjJtDydIkzgk/5UVpqBYywmh9wCDOm3W+636U3cpBb
 voQXMXGjzp51JId5Hp39dTmOjMVjsWqXa40vE7rtYyWPMls4872UlhaQmgdYaLkUNz
 g24S4sqvvuFtxgRJ4JsqHqKYgXqBLfjO2+8wjlVhIbiWMEizo6regFek+pXVbVn/0J
 zhBk5aMaLeo454/4OCjCRQaHfdAi8BChM1yRt8nWgrSiJvYSAbcMrf/oJ63543skZt
 aQHQ95GCrEuDg==
Message-ID: <0749d51f-bbc3-dfcb-93e3-c6c34614f403@kernel.org>
Date: Mon, 4 Sep 2023 16:21:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230831071011.56116-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230831071011.56116-1-guochunhai@vivo.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/31 15:10,
 Chunhai Guo wrote: > The commit 344150999b7f
 ("f2fs: fix to avoid potential deadlock") only > requires unplugging
 current->plug.
 Using blk_finish_plug() is unnecessary > as it sets [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qd4q8-00051e-4A
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/31 15:10, Chunhai Guo wrote:
> The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
> requires unplugging current->plug. Using blk_finish_plug() is unnecessary
> as it sets current->plug as NULL and prevents wb_writeback() from using
> plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>   fs/f2fs/data.c | 3 +--
>   fs/f2fs/node.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 916e317ac925..77b4a55d6d94 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3346,8 +3346,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>   		atomic_inc(&sbi->wb_sync_req[DATA]);
>   	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
>   		/* to avoid potential deadlock */
> -		if (current->plug)
> -			blk_finish_plug(current->plug);

What about?

if (current->plug) {
	struct blk_plug *plug = current->plug;

	blk_finish_plug(plug);
	blk_start_plug(plug);
}

Jaegeuk, thoughts?

Thanks,

> +		blk_flush_plug(current->plug, false);
>   		goto skip_write;
>   	}
>   
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index ee2e1dd64f25..c4b5717a8c1a 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2126,8 +2126,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
>   		atomic_inc(&sbi->wb_sync_req[NODE]);
>   	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
>   		/* to avoid potential deadlock */
> -		if (current->plug)
> -			blk_finish_plug(current->plug);
> +		blk_flush_plug(current->plug, false);
>   		goto skip_write;
>   	}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
