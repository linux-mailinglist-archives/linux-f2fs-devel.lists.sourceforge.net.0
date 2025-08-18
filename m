Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B627CB29C11
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Aug 2025 10:25:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2AAadSzU7GpA7qiLZf3R9dNo4lqiKnJeObqD56TVxA=; b=B3mQ1udXKck5rn+klYTguqha44
	F7khLGTAUvti09TkzZ5iuOsOLl/iTBOTs/LU9PtcXxdZVZplIqnuVgcWaUQtIwSnnLl4xgmf2GbPl
	ClUOxBSBzakwA2ylR611wXNTNxhEEumtasLQXPQG/BjPUfzCD4y3CxcyX++Fr7iYo2Ik=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unvB8-0005uy-Fg;
	Mon, 18 Aug 2025 08:25:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1unvB5-0005uf-Pb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 08:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wFX1/aoUCbsGzpy/0/sLSC2jpSMhe5ctQvUZZ371q1I=; b=eQqcGStTpa/GNWHL/GkDfU5DS3
 OqQRSgVJfbr6qDwIZBIAHN4FT73db9ummvcTOtWYmulMoSZRHKek+nnx5nIZugEF5guJzH0SUoeD2
 T8oCDEfp2vkPQc8bqtZquNR/hkeElN+DuFx4oJCLYFNJ/KVr/bkk5hll1oUxfjGtjlrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wFX1/aoUCbsGzpy/0/sLSC2jpSMhe5ctQvUZZ371q1I=; b=J17W95PTkS1RzXkWEY3KK0S6Db
 yM7rnwNQHWMEO4qUEsesKd21/d1Nx9/3nIUSYAyEhBlio+/fxANhclHSU5QuUG4hhJYwjQ2oz2PMq
 aE6y7TfSdu0W7zv8UNkr25K0xsb+lTmtZ1sh+r7uGuk0NDkAt8Vi6D7ksPDpKlDNMx1M=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unvB5-0005Ad-QI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 08:25:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c54tS1whKzFrjJ;
 Mon, 18 Aug 2025 16:01:52 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 0AEB4140158;
 Mon, 18 Aug 2025 16:06:28 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:27 +0800
Message-ID: <f503b139-ba90-40ae-8900-db0ba7789525@huawei.com>
Date: Mon, 18 Aug 2025 16:06:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20250818020939.3529802-1-chao@kernel.org>
 <20250818020939.3529802-2-chao@kernel.org>
Content-Language: en-US
In-Reply-To: <20250818020939.3529802-2-chao@kernel.org>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, On 2025/8/18 10:09,
 Chao Yu wrote: > The mount behavior
 changed after commit d18535132523 ("f2fs: separate the > options parsing
 and options checking"), let's fix it. > > [Scripts] > mkfs.f2fs -f /dev [...]
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1unvB5-0005Ad-QI
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix to allow removing qf_name
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On 2025/8/18 10:09, Chao Yu wrote:
> The mount behavior changed after commit d18535132523 ("f2fs: separate the
> options parsing and options checking"), let's fix it.
> 
> [Scripts]
> mkfs.f2fs -f /dev/vdb
> mount -t f2fs -o usrquota /dev/vdb /mnt/f2fs
> quotacheck -uc /mnt/f2fs
> umount /mnt/f2fs
> mount -t f2fs -o usrjquota=aquota.user,jqfmt=vfsold /dev/vdb /mnt/f2fs
> mount|grep f2fs
> mount -t f2fs -o remount,usrjquota=,jqfmt=vfsold /dev/vdb /mnt/f2fs
> mount|grep f2fs
> dmesg
> 
> [Before commit]
> mount#1: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
> mount#2: ...,quota,jqfmt=vfsold,...
> kmsg: no output
> 
> [After commit]
> mount#1: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
> mount#2: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
> kmsg: "user quota file already specified"
> 
> [After patch]
> mount#1: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
> mount#2: ...,quota,jqfmt=vfsold,...
> kmsg: "remove qf_name aquota.user"
> 
> Fixes: d18535132523 ("f2fs: separate the options parsing and options checking")
> Cc: Hongbo Li <lihongbo22@huawei.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/super.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 465604fdc5dd..07f6c8cac07a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1219,8 +1219,11 @@ static int f2fs_check_quota_consistency(struct fs_context *fc,
>   				goto err_jquota_change;
>   
>   			if (old_qname) {
> -				if (new_qname &&
> -					strcmp(old_qname, new_qname) == 0) {
> +				if (!new_qname) {

Thanks for catching this. Do we also need the patch 1/2 ? It seems this 
patch also solve the syzbot problems.

Thanks,
Hongbo

> +					f2fs_info(sbi, "remove qf_name %s",
> +								old_qname);
> +					continue;
> +				} else if (strcmp(old_qname, new_qname) == 0) {
>   					ctx->qname_mask &= ~(1 << i);
>   					continue;
>   				}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
