Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCA5BBD77
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Sep 2022 12:46:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oZrol-0006Rb-5S;
	Sun, 18 Sep 2022 10:46:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oZroZ-0006R6-JR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Sep 2022 10:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VtqNbHK2BJOaT0OB8r/fDtlxzralQjOYmKKkXsvaPi8=; b=CNcqQC/QAaUSiuoeBrme31KrLz
 UEhu43zBZ+0eTcmFX4z+fWYnM1PwViTkeAjBkjqXT5+BmBTBqZzyc/ew6m/zJwq4Yx7IO+k2dzt6E
 //f3RjeHAHDXDf+U5iXjNObdA+BPr1WueLQxsWlbIc+mPCY/wJGxMwAJkuzJW4LMMaP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VtqNbHK2BJOaT0OB8r/fDtlxzralQjOYmKKkXsvaPi8=; b=Y/AkCdC20lk3s2BfgGg1bjqkQz
 0V/CQ7BfgpzKvMSJQMI6r9UxMPwwdnodg/X9kIhLe04BeSjmZ/0WbveuxZohyk77hKodjldYdFVBg
 fLd6UtGEyAszHTKXu2KyHrTPkeN1aT6VHdxLUrVROISGbaD8R0vDjsTagk3VliX2mLP0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oZroS-0003qn-O3 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Sep 2022 10:46:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8EF6614A1;
 Sun, 18 Sep 2022 10:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C838C433D6;
 Sun, 18 Sep 2022 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663497961;
 bh=zkPDclc9ypZuN/B77L98D9WxEHZJL08EA22fIWMnjYI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ISMYCEyMQgt8MCvRbCbQEQOqVGuuzNi4of9JXjsF/otyM8sQNExscbm4+/+8AOM7j
 FnayjoP/7utWQ0KuTmWkoI6U5b5iowvaXE1FMNyf+HfZMUfmsYoZQa4vO8FCZtpFoM
 ZVTBh6mLvsUAsQHQJBTFvniU6Qq0dsh7mVC1LiKZSxQd93fSIRLrofzEi9+6zpG751
 qUfovQCIZV2CgLZdDoc+ekfz1s5RkdLJczLuaVamAhJL8XZ+O/8o7heM6eZZPiTtHH
 YFQB3ZKjFQsXx0Hex2Im+369SiV0FzSUCAjTMtJ8zu/2iWqNDI8S3SKHo1WHgrCQs4
 BhalNxtTD1wdA==
Message-ID: <9e5b9c8b-e8a5-c1ec-d2ed-a068afb03b4a@kernel.org>
Date: Sun, 18 Sep 2022 18:45:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "zhiguo.niu" <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <1663222729-27774-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1663222729-27774-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/15 14:18, zhiguo.niu wrote: > During GC, if segment
 type stored in SSA and SIT is inconsistent, > we set SBI_NEED_FSCK first
 and then stop checkpoint, this will > cause the following issues: [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oZroS-0003qn-O3
Subject: Re: [f2fs-dev] [PATCH Vx 1/1] f2fs: fix some error handling case in
 gc
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
Cc: lvqiang.huang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/15 14:18, zhiguo.niu wrote:
> During GC, if segment type stored in SSA and SIT is inconsistent,
> we set SBI_NEED_FSCK first and then stop checkpoint, this will
> cause the following issues:
> 1. SBI_NEED_FSCK can not be set to flash truly because of checkpoint
> has been stopped.
> 2. Will cause more EIO error because of CP_ERROR_FLAG is set in
> f2fs_stop_checkpoint, this is not reasonable.
> 
> So we fix this error handling case by recording current victim segment
> as invalid for gc.
> 
> Signed-off-by: zhiguo.niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/gc.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d5fb426e0747..66bdf2678b5e 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1700,10 +1700,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
> 
>                  sum = page_address(sum_page);
>                  if (type != GET_SUM_TYPE((&sum->footer))) {
> -                       f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
> -                                segno, type, GET_SUM_TYPE((&sum->footer)));
> -                       set_sbi_flag(sbi, SBI_NEED_FSCK);
> -                       f2fs_stop_checkpoint(sbi, false);
> +#ifdef CONFIG_F2FS_CHECK_FS
> +                       if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
> +                               f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
> +                                       segno, type, GET_SUM_TYPE((&sum->footer)));
> +                               set_sbi_flag(sbi, SBI_NEED_FSCK);
> +                       }
> +#endif

What about:

f2fs_err(sbi, "...");
set_sbi_flag(sbi, SBI_NEED_FSCK);

#ifdef CONFIG_F2FS_CHECK_FS
if (test_bit())
	set_bit();
#endif

>                          goto skip;
>                  }
> 
> --
> 2.17.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
