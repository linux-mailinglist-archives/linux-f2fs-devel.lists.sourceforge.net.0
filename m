Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 868623F66C4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 19:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIaCN-0005Vf-EN; Tue, 24 Aug 2021 17:26:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mIaCL-0005VX-VT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 17:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wq8hSFaCsG9kVVDYar5jQhzC0LVaC7nrUdUgjjUh7fU=; b=WWCM/GvGnsfGqcyOsjW6TUJNKc
 ZyddFb0j2otjR3N/+WXgevoI5Sa6OSzuyS4B+oPdTcrc4p+z7QGL5DJi9JhPSVfxGzlSnxzrDLFZI
 G2ll0VQOeao1ygZi6U2AR3JGRizI6MqjbpuXt1EnpGqzmCbBBTuLh/79/p4/vHUFdB4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wq8hSFaCsG9kVVDYar5jQhzC0LVaC7nrUdUgjjUh7fU=; b=DSqOtOOj7FTyLIxQjDmEfd0mSp
 Rk3EnFHxUfy69aq4fOKdQVlWf3EJgwA4+5aPFQY3C6sreF69FWf7nvkLwGKOj/GTusnO4ozgdPoXS
 3uTWbkX3Th5k6cMuwBPjIYoTruFYO7KPG71edMTHidKL7EHK/2C8sVR+DxgkgWvVwdo0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIaCK-0003PQ-1b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 17:26:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D472610A7;
 Tue, 24 Aug 2021 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629826006;
 bh=aIgNnNWgoZHQIiACgNhH+aNjlUHVUpf4mP6Hd9AYmJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GSeeaSKCriryh/io7TCKIjo5xUuUMX1HI/pARLoZcfeWy6iZBgey5msDgWfNi1Jt6
 Fa1+CM0ITFBVMj8TJJagrs/EL1RhzYW5fu2JQgJlu45MRuQjRmh3TN/nM0s2DZGSxb
 OQZlp05VQv8U3lph0UL3BIVuiwklgjWblZnSTMeHRzXkvYhgKrSQicx2Kq6gEKcJud
 uzcBhnSf2p+RN0g8QU4+RqtP4VErG6UtmEAjfnoHfdfmb6cmT8lb4K5qawm5g9jT/F
 LTyBj1A6GN3etNnhZ/1N+Aucp23md5QmOuLVLNoR59E9OPABVTygWmJKjeEnGDxZmJ
 ss3UjX3PPB97g==
Date: Tue, 24 Aug 2021 10:26:45 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YSUr1GS0M7weoRTt@google.com>
References: <20210824011948.15408-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824011948.15408-1-chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mIaCK-0003PQ-1b
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong option name printed by
 parse_options()
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/24, Chao Yu wrote:
> It prints below kernel message during mounting w/ checkpoint=disable
> option:
> 
> "F2FS-fs (pmem0): checkpoint=merge cannot be used with checkpoint=disable"
> 
> Fix typo "checkpoint=merge" w/ "checkpoint_merge"
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 49e153fd8183..88c66e46bd5c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1289,6 +1289,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		return -EINVAL;
>  	}
>  
> +	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
> +		f2fs_err(sbi, "checkpoint_merge cannot be used with checkpoint=disable\n");
> +		return -EINVAL;

What about disabling MERGE_CHECKPOINT autmatically?

> +	}
> +
>  	/* Not pass down write hints if the number of active logs is lesser
>  	 * than NR_CURSEG_PERSIST_TYPE.
>  	 */
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
