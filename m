Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC670198AAA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2020 05:54:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJ7z4-0008Qk-6O; Tue, 31 Mar 2020 03:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jJ7z2-0008Qd-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 03:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W8K4sUyTH5nY+O4iQ0xGUcxh/+3/TigXPzNNVq7SAPY=; b=XCtULAxb67ThkT90hOWn8iomOT
 8Qf1IupQVFCAx7YioduB2VqR0UlhPs3r7Cgux59qChC5TokN9zOBN8uI8Z4TDM6aX0rFu86PwLVha
 v0WZ1q1oegHf+VwaN0VHf41fOt8z6Cq69+Up1NM2AxMPehym8gweStopGNUpSLMikQCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W8K4sUyTH5nY+O4iQ0xGUcxh/+3/TigXPzNNVq7SAPY=; b=lWSr5EbkYB5z2krXkyf61dacNe
 f3ALky8EiL/TyvdTnz8g17KaztapoJqqOtGBzrtX0L3Wv736PwGJnpE4IvgdPrcrHQn+moKJu6KKD
 9Xe6HihsVzXKslq/IbhVm/mF3h8VoIv+3m1i/vnDN2a9VUuPqvl08+SbNYEgFOuyBiXw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJ7yw-002OQG-7w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 03:54:36 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8A412072D;
 Tue, 31 Mar 2020 03:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585626859;
 bh=TKTh/9sPD0psIzinZfSfayKwQQgwyOsyAnSJ/BrlOqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cW8tGpMd0n2m42LIs3mSyPV9ZWV48h64ZooNkJZ3pbkRkYwanhso3jeRjBAvAtFf0
 81/AwUWRodIV0LkhSn60s5JyJ8BP11lAXjObarjnHMhJ0xXAA5FseeOk5ttlRACfRQ
 2KmETlalnf650sJTyIqnznFmXC2Xb+0RlbDZiXKk=
Date: Mon, 30 Mar 2020 20:54:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20200331035419.GB79749@google.com>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jJ7yw-002OQG-7w
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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

On 03/26, Sahitya Tummala wrote:
> allocate_segment_for_resize() can cause metapage updates if
> it requires to change the current node/data segments for resizing.
> Stop these meta updates when there is a checkpoint already
> in progress to prevent inconsistent CP data.

I'd prefer to use f2fs_lock_op() in bigger coverage.

> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
>  fs/f2fs/gc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5bca560..6122bad 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1399,8 +1399,10 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  	int err = 0;
>  
>  	/* Move out cursegs from the target range */
> +	f2fs_lock_op(sbi);
>  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
>  		allocate_segment_for_resize(sbi, type, start, end);
> +	f2fs_unlock_op(sbi);
>  
>  	/* do GC to move out valid blocks in the range */
>  	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
