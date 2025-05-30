Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F5AC91AB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 May 2025 16:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3EQG2lAP7iDVo+fqAtyGK9omUt2i/HvmF77adAI8wA=; b=V8fzXRmrPtwI41rtJsz1AKyjMe
	4f+RlrFZfztQr91g9cTM8gesWpwdXhF2+xs/HBjH0hq5PqHBmwkt2ATSzkeR0VnLae9ns3ADGKIH9
	VlNjErI7ZZ+VWXjt4kUvnwT08fv9sSfZ9+WeE+XVz76w0QqiXJWqPS/ZY9cDrqAYgK84=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uL0oy-0005OV-OL;
	Fri, 30 May 2025 14:34:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uL0ox-0005OI-G9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 14:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0AySjgt6kRkCCSlKABVCJFKYGqydWzv73KarpAVDkw=; b=DjnYQw0G0f4/aJh0NcmeoG47NE
 LTxGG06rb8ZJDTwXh6NByG8BK514OGwPwO+SgUNb1uYs2vG3g3JVNs8lixk4/F+v9s8cXZ1NXmzkt
 SUGkZX8M0xxduP9liUYOy8saI9NTU18vgVPlbU6ddNKL5ih8QRIn1qq/rL/7DA+baj8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d0AySjgt6kRkCCSlKABVCJFKYGqydWzv73KarpAVDkw=; b=UIZSjnq66BAd2L9vmWT5Dyt4nN
 BUunfCGC/hgnvxPydYl2DFhhEPPvh/wBTaLDUZNkxTWqE8J4KMTIOBAPa4jmHlIRxFgZeatkWch0v
 U2kzJS21r+lCLAJJZv8rWgWVV+wrI/hAcJWVqdqzg7YT+u+Ncoagd26arJV4j+3MtzcQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uL0ow-0003v7-T2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 14:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 80B54435ED;
 Fri, 30 May 2025 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3668C4CEE9;
 Fri, 30 May 2025 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748615684;
 bh=1S/VS8/Bcw6UStVGiFNaj5BF65cGwFQfGdO1d8CfHq8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Bgm755Vqkarxhu23N9mWuVlU6LqdXrH+xIdKNozIOQ8ypEhOtWtgmGn5CZvD/OsTw
 FiimlU9VhnV5AsdVibbUggtf7G5qT4mUhx5k8fs6bd+ZjpGYhJMUpUK919uo9FZPDm
 y1ZruOPNGXj6DuioF7H9HWSjh5iK8JUiLVcibJ1BTwrS3m0okRQGQxfqiNBUQELj0+
 Au54IRZBbFz9ixufLpqmh5fX6UiGVHz4JA/akrQ25TPfcM2EmtYbsG0rUEjwHOcXp/
 KsecO9F9gj0l2Q+sgzQJcCgRTKTX4W1UJnO5fvMJJYdzWe6IwD7LWGTkG5SBc9xmnz
 NJqjNWKToMSsg==
Message-ID: <8f56170c-d63a-41a2-a50a-a70de79965d3@kernel.org>
Date: Fri, 30 May 2025 22:35:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250529213750.1068920-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250529213750.1068920-1-daeho43@gmail.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/5/30 5:37, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > one_time mode is only for background GC. So, we
 need to set it back to > false when foreground GC is enforced. > 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uL0ow-0003v7-T2
Subject: Re: [f2fs-dev] [PATCH] f2fs: turn off one_time when forcibly set to
 foreground GC
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/5/30 5:37, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> one_time mode is only for background GC. So, we need to set it back to
> false when foreground GC is enforced.
> 

Need a fixes line?

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/gc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2b8f9239bede..f752dec71e45 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	/* Let's run FG_GC, if we don't have enough space. */
>   	if (has_not_enough_free_secs(sbi, 0, 0)) {
>   		gc_type = FG_GC;
> +		gc_control->one_time = false;
>   
>   		/*
>   		 * For example, if there are many prefree_segments below given



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
