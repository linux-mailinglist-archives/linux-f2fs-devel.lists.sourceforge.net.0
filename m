Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43484738572
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jun 2023 15:39:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBy3a-0000Gz-BY;
	Wed, 21 Jun 2023 13:39:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBy3X-0000Gr-9g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 13:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jd1MeGn2IWF85uEFPAcc6lXeFNLFuhytuj2ifchJWNo=; b=d33il4PzVR/atO3HQfZlF+iptg
 1SssM0LRUBuJo+s/1IOkxL2H57OTeyROdiFB9DmoC8NP5LDOmFB1wyCdZsDKdpu/M4uDy7fYDvhJp
 PfZ+SQBTfsIkDnoeL89jtA8C5QJ+l0gCTWPxJa2NbMLvEirSxhA/IprW5m+DiqSVCV3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jd1MeGn2IWF85uEFPAcc6lXeFNLFuhytuj2ifchJWNo=; b=ZyG+slnNVZM595V/7octK9pH6v
 CD/ENgKcVxzsepJp9ooqQYnCI5VqWByaHgk+BPJpzF4m/9oIUYHoZj1COST6AN6DYonboRoAKwKvJ
 l8aQXbzJ03ur9hQKuLoN6VmQ94AVT2cPHPmJOVBMosFWfLSCPOXD2Gom96rKyPTDIhAU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBy3W-0003TD-Ms for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 13:39:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5159A601D3;
 Wed, 21 Jun 2023 13:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF29C433C0;
 Wed, 21 Jun 2023 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687354764;
 bh=cPsPjRKWcEmtzMQaG/waG+l05hgrMv31+72e1daYl9M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=elAsHbJhVVL5byp6B61wcncTPmAifiqJYTATP71ljhJRJ772RaHrY/aysK1dWm1eQ
 wbWXf+Eg2zV58tzr5jHEQ/fNPLZFpmzc0Jn1JBj+HsB5bKArHRvvNhunaVGk50PE+1
 LSftbspqLEjjDpd2Suh3Lk3NFPWCOsZ/AMpkX/XaMH4MSdKNP4gKjPD78YNra37bPs
 VEWIxAWCXkHd62mLIDsfHqMCoIpHTK71SYQqdi09kfmD4RLLqLsbNFrl6tq6YV9f0u
 0swlglT7SRAtanxh51wMrFomm0mg1BdKefK+lJgKkWzmpUkkMkHoeu/UySWfouu2WE
 mN42R3oh6jZvg==
Message-ID: <9f3a5518-1de5-17b9-5aec-9820fe79c223@kernel.org>
Date: Wed, 21 Jun 2023 21:39:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Yunlei He <heyunlei@oppo.com>, jaegeuk@kernel.org
References: <20230621094359.3827832-1-heyunlei@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230621094359.3827832-1-heyunlei@oppo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/21 17:43, Yunlei He wrote: > Mtime and ctime stay
 old value without update after move > file range ioctl. This patch add time
 update. > > Signed-off-by: Yunlei He <heyunlei@oppo.com> > --- > [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBy3W-0003TD-Ms
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move
 file range method
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

On 2023/6/21 17:43, Yunlei He wrote:
> Mtime and ctime stay old value without update after move
> file range ioctl. This patch add time update.
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>
> ---
> v2:
> -update both src and dst inode
>   fs/f2fs/file.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cb42d8464ad9..4adcf62e2665 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2884,8 +2884,22 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   
>   	if (src != dst)
>   		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
> +

Unneeded blank line.

>   out_src:
>   	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
> +
> +	if (!ret) {
> +		src->i_mtime = src->i_ctime = current_time(src);
> +		f2fs_mark_inode_dirty_sync(src, false);
> +
> +		if (src != dst) {
> +			dst->i_mtime = dst->i_ctime = current_time(dst);
> +			f2fs_mark_inode_dirty_sync(dst, false);
> +		}
> +
> +		f2fs_update_time(F2FS_I_SB(src), REQ_TIME);

f2fs_update_time(sbi, REQ_TIME);

Thanks,

> +	}
> +
>   out_unlock:
>   	if (src != dst)
>   		inode_unlock(dst);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
