Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5C89D104
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 05:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ru28S-0006HA-37;
	Tue, 09 Apr 2024 03:27:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ru28Q-0006H0-1v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 03:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WtJU1x4mCRDzWmw69883pr9c0ERTH5iSlCqucoNZ4Co=; b=Ep5AkFpDZDEE9Ig+13GV1B4aBT
 JpRAKQuhBoGHEXiCfroHJpcdbpwuJvrpj72Jag9zB2zGy4xYnjAylejfjR/pGDSkMXuf8KwOB3u0x
 Ba0jd8veAyIOPav+JjJ3UTtEAsfybqBoSU7+RWZQpqyfOKrqmljOlTtneUOQD08T09Dg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WtJU1x4mCRDzWmw69883pr9c0ERTH5iSlCqucoNZ4Co=; b=PGqgrKx9yeuao2Ns/rCXadDOp0
 P5XUfOkgTva1VC0aoGgMAX6G1NryWWZ4zcCazaqBnwQzeJZoC2MT4lYiHzE9IG/RUg6nlVZt9mimr
 toIAX67wXWrB/Iruhiq6ynGC+kmkvWZ2KQZd9aJb2CNgCJ+jiS2r0rWrXbN/WJQEyLeM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ru28P-0007oq-C6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 03:26:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B04F4CE1CE3;
 Tue,  9 Apr 2024 03:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D1EC433F1;
 Tue,  9 Apr 2024 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712633205;
 bh=zLjEAgzkB+JpDCvxpEPY0OQlpTPkNB7ZIlx6AlyPL58=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VUfpY0ZzPQA0tiHkKkPZIpVlwxIKkHhVZ0Vz5UkfGORUvqpa30Vo3nMBHVmVyHGEd
 1Q1wA+tZJWjJ6sy+WLCt5udiXIouXBuEFB7+MdbctTEX8KxYaXAmyIsEm0yKl29j+o
 5wO1yZ/B5rc/jjN6AZT1juNUt2O4Ix4kRcTpIOSU36bL5gGw9kXJxy5rXuj0SqiB0a
 n/AqnnFA1YK8ftJA+4pCRq5VldrHUil1kaHbUVzUkwNPlo3FV9Jub4falZfjEs2GSN
 suhiv7mOfOrLlAbmlKev7+Pj5zZTS23JWkZVa4vL1gSmTtwDIXUgqc7bG6wIOBjPb6
 9jn4H/8McFy7A==
Message-ID: <98c1738a-9a83-49d2-a877-0856209203dd@kernel.org>
Date: Tue, 9 Apr 2024 11:26:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240408131140.4100090-1-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240408131140.4100090-1-shengyong@oppo.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/8 21:11,
 Sheng Yong wrote: > The "hot file extensions"
 list does not print properly. > > **Before** > > extension_count [0x 23 :
 35] > cold file extentsions > [mp wm og jp ] > [avi m4v m4p m [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ru28P-0007oq-C6
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: print extension list properly
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/8 21:11, Sheng Yong wrote:
> The "hot file extensions" list does not print properly.
> 
> **Before**
> 
> extension_count                         [0x      23 : 35]
> cold file extentsions
>                                          [mp      wm      og      jp      ]
>                                          [avi     m4v     m4p     mkv     ]
>                                          [mov     webm    wav     m4a     ]
>                                          [3gp     opus    flac    gif     ]
>                                          [png     svg     webp    jar     ]
>                                          [deb     iso     gz      xz      ]
>                                          [zst     pdf     pyc     ttc     ]
>                                          [ttf     exe     apk     cnt     ]
>                                          [exo     odex    vdex    ]
> hot_ext_count                           [0x       1 : 1]
> hot file extentsions
> db      ]
> cp_payload                              [0x       0 : 0]
> 
> **After**
> 
> extension_count                         [0x      23 : 35]
> cold file extentsions
>                                          [mp      wm      og      jp      ]
>                                          [avi     m4v     m4p     mkv     ]
>                                          [mov     webm    wav     m4a     ]
>                                          [3gp     opus    flac    gif     ]
>                                          [png     svg     webp    jar     ]
>                                          [deb     iso     gz      xz      ]
>                                          [zst     pdf     pyc     ttc     ]
>                                          [ttf     exe     apk     cnt     ]
>                                          [exo     odex    vdex            ]
> hot_ext_count                           [0x       1 : 1]
> hot file extentsions
>                                          [db                              ]
> cp_payload                              [0x       0 : 0]
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
