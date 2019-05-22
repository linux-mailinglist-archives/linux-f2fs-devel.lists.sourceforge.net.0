Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E7263D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 14:29:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTQNB-0007Ki-8H; Wed, 22 May 2019 12:29:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hTQN9-0007KU-HW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 12:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eD9swnpgzU09oy8QbmHLU+ZgDlxKTOnileR3ZPD24Hs=; b=fjh84pdDf2QmkEF9XelYo76ihC
 jOKmPQu6Pq48p+7mV0l65pfecEEHjcEruAJ6oVEQgijCspR4f0fd/kaKicsguWsfHiFxyMcKaNr7u
 3DLWoL2q6XYa2nMU+hE6rtT4peOB4QsDPrS6BWAYAAGimbOr8uyHyMVLVJ3bBqvWUuRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eD9swnpgzU09oy8QbmHLU+ZgDlxKTOnileR3ZPD24Hs=; b=GmqQQj7P0QDR93tXzadmhzGVhN
 Q1E+hN63nqCQl2d92Jlum8Pzi2e155gf5utSQxMXFygZeToAVCAO9w20JQTXFerNMgr/qe6PtW0el
 +cEqD26JzIo62VnbPp/G3yFObq9FMSwUqf6V23nlJpt776eG4+PNa5xpEbdm998J3NGo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTQMu-00H22G-Cb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 12:29:31 +0000
Received: from [192.168.0.101] (unknown [49.77.233.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30B0C2173C;
 Wed, 22 May 2019 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558528150;
 bh=upmsRZdkQq8h/PyD9HJOtFErgwAT7ktBsV7srF/AT70=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=bJfD+mjFb6YdomL+VqHfR6L1H6ztDKFP/+OfrymNyi4djSftXdHR/bx4GkO4OY7Q9
 K96jNO+km9Hcjda9UHQtxiEo3bNKrIdrK3Apk0sWuAsjCaSOLQMQfohPVdtpBvVnQP
 M54ptaNLWAaA8y/o/ba0aZEzLh4ixvb3hJgemL/A=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190521180625.10562-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <8e9a4cac-c81b-11ce-0a5a-c6f5caf716c4@kernel.org>
Date: Wed, 22 May 2019 20:29:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190521180625.10562-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hTQMu-00H22G-Cb
Subject: Re: [f2fs-dev] [PATCH 1/2] Revert "f2fs: don't clear
 CP_QUOTA_NEED_FSCK_FLAG"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-22 2:06, Jaegeuk Kim wrote:
> This reverts commit fb40d618b03978b7cc5820697894461f4a2af98b.
> 
> The original patch introduced # of fsck triggers.

How about pointing out the old issue has been fixed with below patch:

f2fs-tools: fix to check total valid block count before block allocation

Otherwise, user should keep kernel commit "f2fs: don't clear
CP_QUOTA_NEED_FSCK_FLAG".

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index d0539ddad6e2..89825261d474 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1317,10 +1317,8 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  
>  	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
>  		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
> -	/*
> -	 * TODO: we count on fsck.f2fs to clear this flag until we figure out
> -	 * missing cases which clear it incorrectly.
> -	 */
> +	else
> +		__clear_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
>  
>  	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
>  		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
