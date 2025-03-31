Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1AA7624B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 10:32:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzAYw-0008Gi-6H;
	Mon, 31 Mar 2025 08:32:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tzAYu-0008Gb-2A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 08:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5b+vpsq+IhhTFMj0aEEAlD2eS1FX55cjVnM9czX34Go=; b=k8UXakLxyx+keWli37g95OqRBk
 BSq2nWTYinXfI0vnVFrrBYlXU/XdEL+/as0efvgYwSrcmLWc89Fq3BCgIEE38Cm58NQLjnQ+mW84N
 8kn1S7RYSzjq55z0yofyEhTNX0peuw4Mv/sXTDJ9/CUmttG2FjZndJSIaQPPlimIlax8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5b+vpsq+IhhTFMj0aEEAlD2eS1FX55cjVnM9czX34Go=; b=TO0ieW1VYI366+leAdMVPGjmT5
 0IXTS7/yARBKB9M+L/pWZmsB/FL84V8+M8y4yj/XFcp4ep6/2GoO2EwSa5KQyEaDXZCvqsyStS00k
 F1k3zR5AyfYqW4FvIsUx7w1JPdzzC99FeM+oMgz5zKFXbD3kT1unzL+1ApOsFSuTVmz4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzAYs-0007dd-Nz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 08:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DB925C0FF9;
 Mon, 31 Mar 2025 08:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE13C4CEE3;
 Mon, 31 Mar 2025 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743409912;
 bh=/87yX+teQPvBEOEioTBuzmyte0DDoh34RCg5UayJDPE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TpnkVcYv1L6sUH+S0w6nIHyvFqTPkyV0scjDV+Xj4K5rFoHynGCfPjWxrnGGjpaVW
 k86+DzHX1xBIDwQtZd0D+2yvhFBzTfJhHX8hTsN2i5RjUcc1HKcxrr8vK0SNSn1ZW1
 zuLug9Ki7jkR4DbgFUChP/ACiLsqwsZ7/UYVC2FTsOtZtD23lBNRS+2S7yMX9mPhdO
 VKzdwWpsanGTbz5zKoUWy7qIkfh/y6vkqVcT7LUIxMd+mYkoIM5t5xtLrBOrvPCpZl
 LRzuut6nfwV2cQdwi+B0RNcxbH7FDsVk6c4CejRsS+Xuno6XwFErgpUxPljMimwzMI
 1hdc292u46drg==
Message-ID: <c2d62ced-3a4f-442c-b438-043eec017a45@kernel.org>
Date: Mon, 31 Mar 2025 16:31:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <79090775-413e-437e-ab07-ac6965932a32@redhat.com>
Content-Language: en-US
In-Reply-To: <79090775-413e-437e-ab07-ac6965932a32@redhat.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/29/25 12:18, Eric Sandeen wrote: > I was working on next
 steps for this, and I have a followup question. > > Today, several mount
 options are simply ignored if the on-disk format > does not suppo [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tzAYs-0007dd-Nz
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: first steps towards mount API
 conversion
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/29/25 12:18, Eric Sandeen wrote:
> I was working on next steps for this, and I have a followup question.
> 
> Today, several mount options are simply ignored if the on-disk format
> does not support them. For example:
> 
>                 case Opt_compress_mode:
>                         if (!f2fs_sb_has_compression(sbi)) {
>                                 f2fs_info(sbi, "Image doesn't support compression");
>                                 break;
>                         }
>                         name = match_strdup(&args[0]);
>                         if (!name)
>                                 return -ENOMEM;
>                         if (!strcmp(name, "fs")) {
>                                 F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
>                         } else if (!strcmp(name, "user")) {
>                                 F2FS_OPTION(sbi).compress_mode = COMPR_MODE_USER;
>                         } else {
>                                 kfree(name);
>                                 return -EINVAL;
>                         }
>                         kfree(name);
>                         break;
> 
> so if f2fs_sb_has_compression() is not true, then the option is ignored without
> any validation.
> 
> in other words, "mount -o compress_mode=nope ..." will succeed if the feature
> is disabled on the filesystem.
> 
> If I move the f2fs_sb_has_compression() check to later for the new mount API,
> then "mount -o compress_mode=nope ..."  will start failing for all images. Is
> this acceptable? It seems wise to reject invalid options rather than ignore them,
> even if they are incompatible with the format, but this would be a behavior
> change.

I'm fine w/ this change. IIRC, I haven't saw above use case, otherwise user
should stop passing invalid mount option to f2fs.

Thanks,

> 
> The above would be simple enough to defer (maybe set to COMPR_MODE_INVAL and
> reject it later) but I think other options such as compress/nocompress extensions
> would be very messy to approach as "accept all options given during parsing,
> and validate them later only if the corresponding feature is present."
> 
> So I wonder if a behavior change (stricter option validation) would be
> acceptable here?
> 
> Thanks,
> -Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
