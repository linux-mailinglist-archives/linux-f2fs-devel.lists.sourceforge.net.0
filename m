Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0079B2B9A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 10:35:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5M9Q-0002uQ-BG;
	Mon, 28 Oct 2024 09:35:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5M9O-0002uF-Db
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UgdAMHBO8MfX2DyGlD2e29VFCH5NJjq9nO9k07yeeiY=; b=FqmxyPlFR6UYQ2m/QsaX1WQ1f5
 teDmMIclGu1x8hlm7Hb7cNHAq6SgmzONdMyCx2LE0aiKYTWnaOlcc1apJoe579LhkBhS3apmOgr1/
 vL3T8740AnQz0hITR+UKaN5HxQX6wc5sMT+l58lKP06hiur/XhjVd5uPdYbN3s7fgsok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UgdAMHBO8MfX2DyGlD2e29VFCH5NJjq9nO9k07yeeiY=; b=RwdQQfMbdLftCo0P7ZAesOqUhs
 wxFqtlaY35Wkh60lMWEa9Y6olMW12Bqmk9711zroF7p51OFb8n0uSaUBwKyiPqntr+gd5rUZ/2oDi
 zHBSboN7NlqxUA0Zw74/GL9LBrEHJJtrT0rehH6G6bwOji1Uxj9OQbQyJ5h2D9Ejt9Es=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5M9O-0007LB-Hf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CBB49A419FE;
 Mon, 28 Oct 2024 09:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A98C4CEE4;
 Mon, 28 Oct 2024 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730108091;
 bh=3APMf245gF3+vWvLLBC0eJH2GM4YL5zqTKHdLoYBOcM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HGO4qx41duW8BJyREsdjwlBSBxaGLf9b7Bped3xCqnpg9T37xHMinwesIhJRKX35Z
 Sk0R8ewRczVppL3MMnj1amVwYMTOBhXELgxFNXiSJ+16rQHnhuFQ8eT0Bx2sspgVWc
 696Dw6tJvPtsoITWvUJ+egzHWmnZen7xrqXvcQyRR2kDWtvfpmltbzIA97MD+YVAWn
 tHbv9DGY1g6z9INxK9rE8hAP/957Iw3Gw+vTV4Moj/anC+uWxGvTF6voP/FAF2hebX
 IE8u0jcbf5wgM0/yHstbAKyvReYCQWUeR6DpeIhBaQhoezq80Yq3zEgu0+VZnhFp8j
 x/IBQ691ubSnw==
Message-ID: <b0760a9b-0973-453c-af18-3e384f85a9f5@kernel.org>
Date: Mon, 28 Oct 2024 17:34:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20241025091823.2467074-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20241025091823.2467074-1-hanqi@vivo.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/25 17:18, Qi Han wrote: > When the free segment
 is used up during CP disable, many write or > ioctl operations will get ENOSPC
 error codes, even if there are > still many blocks available. [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5M9O-0007LB-Hf
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: modify f2fs_is_checkpoint_ready
 logic to allow more data to be written with the CP disable
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/25 17:18, Qi Han wrote:
> When the free segment is used up during CP disable, many write or
> ioctl operations will get ENOSPC error codes, even if there are
> still many blocks available. We can reproduce it in the following
> steps:
> 
> dd if=/dev/zero of=f2fs.img bs=1M count=65
> mkfs.f2fs -f f2fs.img
> mount f2fs.img f2fs_dir -o checkpoint=disable:10%
> cd f2fs_dir
> i=1 ; while [[ $i -lt 50 ]] ; do (file_name=./2M_file$i ; dd \
> if=/dev/random of=$file_name bs=1M count=2); i=$((i+1)); done
> sync
> i=1 ; while [[ $i -lt 50 ]] ; do (file_name=./2M_file$i ; truncate \
> -s 1K $file_name); i=$((i+1)); done
> sync
> dd if=/dev/zero of=./file bs=1M count=20
> 
> In f2fs_need_SSR() function, it is allowed to use SSR to allocate
> blocks when CP is disabled, so in f2fs_is_checkpoint_ready function,
> can we judge the number of invalid blocks when free segment is not
> enough, and return ENOSPC only if the number of invalid blocks is
> also not enough.
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
