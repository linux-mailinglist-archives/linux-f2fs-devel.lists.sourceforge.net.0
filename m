Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57393CC57
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 03:20:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX9dV-0003Vv-Tl;
	Fri, 26 Jul 2024 01:20:45 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sX9dT-0003Vm-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nAuPapKsiAFKBC1gvgsrM8z39XSl/F1Y6rmi66vxIj4=; b=R0SBZQlzg97eteGFhgq5H+3oGi
 4zQW+j7RYcUtsY4M+Kdtu6Z9gf1KyYbyc7nLIavBaoIrCb6ekidEPavxvz3PCoKcbTBK61162h6Jd
 ViDoYgVXMvqRuj0cyIOatm82tMu5Tgw0AbiHXN2jxzuKtQHTDEB+daEY21BDk10w4VMk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nAuPapKsiAFKBC1gvgsrM8z39XSl/F1Y6rmi66vxIj4=; b=SrX0qxxFt33BYHPW+JmKMF7meS
 ezWPPPqow6CAN6WcML9COIQz85Z+IEd2PaovGeqoZaCK/15vDgSXHyjLFw8PFV+5vk48o9ddt/CmK
 rP68H7HsJV1PHmLIvyiP/DRzszYMlzWv0dyTDrb+Xa16bmlQTJo1odq7PXVUdky+W284=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX9dT-0003EP-46 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF4D36167D;
 Fri, 26 Jul 2024 01:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD09C116B1;
 Fri, 26 Jul 2024 01:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721956837;
 bh=YozLokCRygnO9rCCHDNVibLyEQRw1CmSYywlm7K/76c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gMFlrYz9jOPOvC0dbOXjUJWp+hTMqc5+NNcvpWe1k54RK/dvBsuNMgWiKfKcXCAk2
 caaSsjE3GG/atGwmbTZ3tdiVt8r2BW2iTtSoO7VoWUV168VLn1cpqFP2ar8pGIj29G
 eLb3F0VKpmYY+44rTK+M5SXg9+2h8F2QsZUdghS+R4Sb71b7I3u8OoNZEo5x7Ss3En
 UNOVChzoIEIlUfXUoKwBSW+hyWxqiJzFY6/cfUThSjnsDObg0yZjjJCGPsadjhmKFD
 ICNyF8y2uLozss0XYM7YAPZBZgaqr/K4C/ozN8aHquh4+bIzyzliNiwYDHIZ/1tlSr
 2Grm/ArWC8I2A==
Message-ID: <a2bf5d3e-6727-44d7-b1a0-3b1bcc7edad1@kernel.org>
Date: Fri, 26 Jul 2024 09:20:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20240221073249.1710026-1-jinbaoliu365@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240221073249.1710026-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/21 15:32,
 liujinbao1 wrote: > From: liujinbao1 <liujinbao1@xiaomi.com>
 > > When we add "atgc" to the fstab table, ATGC is not immediately enabled.
 > There is a 7-day time threshold, and we c [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX9dT-0003EP-46
Subject: Re: [f2fs-dev] [PATCH] f2fs: sysfs: support atgc_enabled
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/21 15:32, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> When we add "atgc" to the fstab table, ATGC is not immediately enabled.
> There is a 7-day time threshold, and we can use "atgc_enabled" to
> show whether ATGC is enabled.

Oh, I missed to reply on this patch, what about adding this readonly
atgc_enabled sysfs entry into /sys/fs/f2fs/<dev>/stat/ directory?

Thanks,

> 
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
>   fs/f2fs/sysfs.c                         | 8 ++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 36c3cb547901..8597dfaef700 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -564,6 +564,12 @@ Description:	When ATGC is on, it controls age threshold to bypass GCing young
>   		candidates whose age is not beyond the threshold, by default it was
>   		initialized as 604800 seconds (equals to 7 days).
>   
> +What:		/sys/fs/f2fs/<disk>/atgc_enabled
> +Date:		Feb 2024
> +Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
> +Description:	It represents whether ATGC is on or off. The value is 1 which
> +               indicates that ATGC is on, and 0 indicates that it is off.
> +
>   What:		/sys/fs/f2fs/<disk>/gc_reclaimed_segments
>   Date:		July 2021
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 417fae96890f..0915872abd97 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -143,6 +143,12 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
>   				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
>   }
>   
> +static ssize_t atgc_enabled_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", sbi->am.atgc_enabled ? 1 : 0);
> +}
> +
>   static ssize_t gc_mode_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -1017,6 +1023,7 @@ F2FS_GENERAL_RO_ATTR(encoding);
>   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
>   F2FS_GENERAL_RO_ATTR(pending_discard);
> +F2FS_GENERAL_RO_ATTR(atgc_enabled);
>   F2FS_GENERAL_RO_ATTR(gc_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_GENERAL_RO_ATTR(moved_blocks_background);
> @@ -1144,6 +1151,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(atgc_candidate_count),
>   	ATTR_LIST(atgc_age_weight),
>   	ATTR_LIST(atgc_age_threshold),
> +	ATTR_LIST(atgc_enabled),
>   	ATTR_LIST(seq_file_ra_mul),
>   	ATTR_LIST(gc_segment_mode),
>   	ATTR_LIST(gc_reclaimed_segments),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
