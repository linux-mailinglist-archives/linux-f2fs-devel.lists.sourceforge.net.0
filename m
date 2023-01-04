Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE2565DCA2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 20:20:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD9JQ-0001Rt-Il;
	Wed, 04 Jan 2023 19:20:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pD9JO-0001Rn-Mw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 19:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+IyoAWKvDlKpUfNWhYTuDG9v/T/ff/6Kjae0YCvee+Y=; b=JcVhQAMHlWlsT/3MZYMA6nPBjH
 xZ6D4+zOYYERJtK7qSc37i3RWjIH3qHonc8AWx996MnFIMpQOKUna0S5nmER/xX8gNhSH20fk1WMw
 szVkBL0zzQJcZKJ3G9yWlvpHyPsGvZbW0N64QMfiyYTyWXDuM/xelGcih1ReCqU5Yzfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+IyoAWKvDlKpUfNWhYTuDG9v/T/ff/6Kjae0YCvee+Y=; b=DZgK6TLJmiq9D6eSLQ3K4FHJ74
 HmYeVfXvlkIzRldSWQzNRMpXzrkF3sUG2+LFCJDAKcX9I3mW8I+YP2R3P9126ZDV7QZOPNmD1gsqd
 a2OFrM5Yqey7hFRCXNUNi7hlu9d9rWKqu+kfk6A7glDaw0y2b6luX4qIET2h9glzcaC8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD9JK-004wLa-V0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 19:20:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A9466179B;
 Wed,  4 Jan 2023 19:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAA6C433EF;
 Wed,  4 Jan 2023 19:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672860021;
 bh=LpiVGTpm8ApY3OR3JbRwYHLopeoTKEw6B1JHMX4gXiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bbdkcoCwzuuXfX7vSc31lbbGKZU9AZsXOaw4pd8z4VulQmx1Ys3VVEZcSDx4xM+At
 iyxONlbK25qxA85djRVAecg2l84tbSlsAac+btL+SspzzEIEmmoHW5/VgX4Fa9ojK2
 MOP6ErLXZlI1Mlc/DCJmKItahxo22TgGV3g2Hf3g3CKev1kICa5XoT9+QPZWPwUOl3
 962x9qRBNw3ypwK3axNQPsezeeXDmXiKrQzwbhYxz+EVsk0smyLka98YVnMPaK4gBZ
 zpxesLin9HIKqxYwu7CPIThTuLrNre3H+3isgyvs/MVBcdDgiBx/req2+8PWrs/Nd3
 wA+W4FpFVE7EQ==
Date: Wed, 4 Jan 2023 11:20:19 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y7XRc+UiLBF/m3KW@google.com>
References: <20230104112158.15844-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230104112158.15844-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yangtao, These are all in dev-test branch, which means
 you don't need to stack up more patches on top of it. I just integrated most
 of them into two original patches. Could you please take a look at this? 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pD9JK-004wLa-V0
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: reset iostat_count in
 f2fs_reset_iostat()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yangtao,

These are all in dev-test branch, which means you don't need to stack up more
patches on top of it. I just integrated most of them into two original patches.
Could you please take a look at this?

c1706cc0cd72 f2fs: add iostat support for flush
acd6f525e01c f2fs: support accounting iostat count and avg_bytes

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

Thanks,

On 01/04, Yangtao Li wrote:
> Commit 8754b465c249 ("f2fs: support accounting iostat count and avg_bytes")
> forgot to reset iostat count in f2fs_reset_iostat(), let's fix it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/iostat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> index c53b62a7ca71..8460989e9bab 100644
> --- a/fs/f2fs/iostat.c
> +++ b/fs/f2fs/iostat.c
> @@ -220,6 +220,7 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>  
>  	spin_lock_irq(&sbi->iostat_lock);
>  	for (i = 0; i < NR_IO_TYPE; i++) {
> +		sbi->iostat_count[i] = 0;
>  		sbi->rw_iostat[i] = 0;
>  		sbi->prev_rw_iostat[i] = 0;
>  	}
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
