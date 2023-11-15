Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5167EBAC8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 02:05:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r34Ld-0001YG-Be;
	Wed, 15 Nov 2023 01:05:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r34Lb-0001YA-Is
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 01:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N3us8qPlJeMXbHQGXGvmiyfUos6X5l5m5KAzmXg2IYU=; b=BBqW8s1s7blA5NlS+4jYfyYh8h
 How+hfU/IC/vWpvGzckcrvyzrakdTJJhg9SPS1RLvKioCuqs2QFNoDNvhm+8Uiw92zxtjKk98m6pp
 QyVXuIvnGbGGARsYqHbp6cnnqg1oxb1VJ1F/CfgGLD8VlhZHCED2tJ3Oin2n8OFXgAYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N3us8qPlJeMXbHQGXGvmiyfUos6X5l5m5KAzmXg2IYU=; b=lhXLFZ6QUI4ax5SrlYDBAMk6jI
 hWmxqBFbWPxcsoFR7U3STXjOTuITbrahVO/hTDHXd5UPCM9pjPcP51cZpfFnckgIMblmrqYvVi3M1
 2EESTiZxP6BBXb6+q4Xv0/nDbZMUNmuwTSuBiMQ6kX5nquulDKg8ksF7gskcu+SmHP9w=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r34LX-0061bI-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 01:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B58ECE1ADE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Nov 2023 01:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6FFC433C7;
 Wed, 15 Nov 2023 01:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700010326;
 bh=zjoq9C6XZilV4BPnYqnlBuYtqaLJtUzuKWFZVWPEsOY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=tIWbEb/SVmPlKXgK4eUJq+lyP9LHSwWSDWBGONHCyMnAhfm1b89tLzTjmqVIyMIMX
 Ro+QET8x1DPNI0gRwUkjYHQqLZFuANKXujfUmzO1XIPR5E3T7Hmiypp4YlOcooWGGu
 7I1VzMLmgN4RIyzwllJUzA/NQ8jxh2z2qCCn1DdLcLpLy23qTucbsClRY5blJqej5N
 sRDO52l2GUvqcZ3pCHwFPuxOgDrckCjOKSfKLkvhreE/r3NUTtcLwygIlFI/3Z4hKw
 Ah27BT/tdqQHL7xb60djfbrd4BP8xwbrI4MocUDRap9WppOLdryuHh7AnDtigHPRBP
 sAm0rCovLMBeA==
Message-ID: <4a0e1c6f-12c4-f3dd-bb26-4bf0aee6be4b@kernel.org>
Date: Wed, 15 Nov 2023 09:05:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20231114212414.3498074-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231114212414.3498074-1-jaegeuk@kernel.org>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/15 5:24,
 Jaegeuk Kim wrote: > When recovering zoned UFS,
 sometimes we add the same zone to discard multiple > times. Simple workaround
 is to bypass adding it. What about skipping f2fs_bug_on() just for zoned
 UFS case? so that the check condition can still be used for non-zoned UFS
 case. Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r34LX-0061bI-Ns
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip adding a discard command if exists
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/15 5:24, Jaegeuk Kim wrote:
> When recovering zoned UFS, sometimes we add the same zone to discard multiple
> times. Simple workaround is to bypass adding it.

What about skipping f2fs_bug_on() just for zoned UFS case? so that the check
condition can still be used for non-zoned UFS case.

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/segment.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 727d016318f9..f4ffd64b44b2 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1380,7 +1380,8 @@ static void __insert_discard_cmd(struct f2fs_sb_info *sbi,
>   			p = &(*p)->rb_right;
>   			leftmost = false;
>   		} else {
> -			f2fs_bug_on(sbi, 1);
> +			/* Let's skip to add, if exists */
> +			return;
>   		}
>   	}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
