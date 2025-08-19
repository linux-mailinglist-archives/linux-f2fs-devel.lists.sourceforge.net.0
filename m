Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF5B2B5C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Aug 2025 03:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73ZEzRs7tE/Pq17z3I4rAMy00tu6xrWAXEVB0a1wKtY=; b=iBXdo98kCHILQArJS4ZpAcDhq1
	RGxyTFe6LKi8IKE7tMB3Ym5ay7eAq8kBaUWbt/OjNRABhwV44uGp75sxEVujw6iphWucnLasbnzQs
	DG3tPU0cKxNO5466Fk42/smM9FvLsydmxzoH1jILyYZ4htTtB070uxEghCeoBlUI7+L0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoAxx-00051Z-9E;
	Tue, 19 Aug 2025 01:16:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uoAxv-00051S-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 01:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26wRAHsV8F2qZ+L6YvfLq/KL7UOze0bT48ytGwtHuHo=; b=MjQW1k+X3iLEf/LYYfQA5Dl55s
 Af4pe9+0/HALi1FkLTmA+nfvE3zhw2FhdMSJlrnuq22ShC89vZfr2fl3TYj5oZCsFJeCSCzINTcG+
 Emirl4gbT+QYp74r0K/Ie8YTiKNAZ/7hjU3Dm6sApHUveWlrEWcCpiMpflf3+0Ya47yI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=26wRAHsV8F2qZ+L6YvfLq/KL7UOze0bT48ytGwtHuHo=; b=czw8ePoabhdLS70XH0NCXWmn7R
 0158kaVS90Ge00IlKwfuKNhIhtfPi6ZrJCgmRUIdq9fXb2lVqjlgUNmbv++V3GEbzzBTVeQJgUW67
 1/iETdv8ztrElSRfe8ACHlYtc7/DkA063Egwpb5Ty9BB0zGGrllPp9Xr9aJP091Z3c5A=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoAxu-0001EX-SJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 01:16:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c5WrJ0zZ7z14MG0;
 Tue, 19 Aug 2025 09:16:32 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 51971140275;
 Tue, 19 Aug 2025 09:16:35 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 09:16:34 +0800
Message-ID: <5c282df8-c1bc-4433-9cfb-f5c8e8c955c1@huawei.com>
Date: Tue, 19 Aug 2025 09:16:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20250818020939.3529802-1-chao@kernel.org>
 <20250818020939.3529802-2-chao@kernel.org>
In-Reply-To: <20250818020939.3529802-2-chao@kernel.org>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/18 10:09,
 Chao Yu wrote: > The mount behavior changed
 after commit d18535132523 ("f2fs: separate the > options parsing and options
 checking"), let's fix it. > > [Scripts] > mkfs.f2fs -f /dev [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoAxu-0001EX-SJ
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

Reviewed-by: Hongbo Li <lihongbo22@huawei.com>

Thanks,
Hongbo

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
