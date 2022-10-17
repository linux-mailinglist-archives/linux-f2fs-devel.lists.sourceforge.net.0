Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1EC600F25
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 14:24:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okPAA-0006ro-JS;
	Mon, 17 Oct 2022 12:24:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1okPA6-0006rT-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 12:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gj7yUkSBrJWQbrdiUqoRgMnUjElThllgQkBroi/SIC4=; b=TuKM8AuaYgrwF/VP82vP2PcFGO
 u8TQxW6ZRntNRiddIiwukuxfYmh9/+DjZYK0B2l5uUcqoJ0GAp7vxsLWYg7rJAHH+ancwJOFUxhyD
 dq4n6UMJIy+mkxE32aYzUXWKzr84A+Q0M9xg6RfTcVWAjvUoFd4BKNkJq0j5NO1g+28Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gj7yUkSBrJWQbrdiUqoRgMnUjElThllgQkBroi/SIC4=; b=WPUjIzK3O4BIfxMUtG7rSJHPPp
 fIIHdp8WcCr1C5MX/2K5ftAOhy20SVIFGeGsMO5hFn3Gderj8Tf5jw0uO0FsmtupKBVo5iEmJNldJ
 /h8tVnzyQn8FfEkA188f9NKUBKtLpLPzNZ58NmXZxsAhbC0/Tr5pArvDxD68o1xRUZLI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okPA1-0001jK-FH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 12:24:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A32E36108D;
 Mon, 17 Oct 2022 12:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D76C433C1;
 Mon, 17 Oct 2022 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666009436;
 bh=8V48uvPxGKFSi7OzFbIVPe2DEkGqM7SFVUeaOyfbN3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uvLmd6eyRhVc1yDiqwXpr/XUYCNldnt2B9A/92GqZe7Ze0R+KgWEw6dnNMi4NiIaF
 BxW4xq9n3USmmHZ+AZxOsTokKjpYMIapljvutoiuCIuufSmnHZrh2rkQTrj3MMjJH4
 oj3byZtSHBgheCOviq7KUqfL4NRFba4k29i2g0l93wvoyFlkAGFsKVqeDvf0Kti0hb
 ClNHb1s/0D6ax+gJTWpzaylm/ncqIfWi7GlIkzaIm3NkQNmHSsj+UYl+qoeCtkJtRk
 oW6CVlc0qmxI48gArUfgrfqFTi2YBcnwfpNsJWrvK3uadAERerZzYo25htTehhMS3U
 5SuFDJuO1OPzQ==
Message-ID: <39c430b1-f4f1-e0a7-1089-9db85d1163d9@kernel.org>
Date: Mon, 17 Oct 2022 20:23:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Hoi Pok Wu <wuhoipok@gmail.com>, jaegeuk@kernel.org
References: <20221017100437.618363-1-wuhoipok@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221017100437.618363-1-wuhoipok@gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/17 18:04,
 Hoi Pok Wu wrote: > Pointer discard_thread
 is pointing to nowhere, using IS_ERR prevents the > situation. IS_ERR also
 seen being used throughout the file. I guess below patch can fix this issue
 from root cause? 
 Content analysis details:   (-5.5 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1okPA1-0001jK-FH
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: fix kernel discard_thread NULL
 dereference
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/17 18:04, Hoi Pok Wu wrote:
> Pointer discard_thread is pointing to nowhere, using IS_ERR prevents the
> situation. IS_ERR also seen being used throughout the file.

I guess below patch can fix this issue from root cause?

https://lore.kernel.org/linux-f2fs-devel/20221013155628.434671-1-chao@kernel.org/T/#u

Thanks,

> 
> Link: https://syzkaller.appspot.com/bug?id=9499bc6574cea5940e48199c2fd0732d9b11e5e1
> Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com
> Signed-off-by: Hoi Pok Wu <wuhoipok@gmail.com>
> ---
>   fs/f2fs/segment.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index acf3d3fa4363..79978b7206b5 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1634,7 +1634,8 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
>   		struct task_struct *discard_thread = dcc->f2fs_issue_discard;
>   
>   		dcc->f2fs_issue_discard = NULL;
> -		kthread_stop(discard_thread);
> +		if (!IS_ERR(discard_thread))
> +			kthread_stop(discard_thread);
>   	}
>   }
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
