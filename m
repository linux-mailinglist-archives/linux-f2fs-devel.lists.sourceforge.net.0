Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37482848C9E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 10:57:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWZFy-0001cK-IU;
	Sun, 04 Feb 2024 09:57:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rWZFx-0001cA-85
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 09:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X8fEnK3Gu/tI3XmhVgQmd08bfu+h/lfeF+2L+a7QKUw=; b=Y6txPfUeT3DCLpcbyX7JRLhWeg
 T2p7iXNcHq8UipD9YdYmNxdCC40zlyQXr2AHNTIG221RaWESCtrrlq5SzZ4/ZuLRFLVpMXcTOuQPS
 G/3WIm6B2c2FxornrxnZp/ly9dBzaAqUnnDAUGsqOJOtpSmacD4gqosvH4/kgU6SlQ3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X8fEnK3Gu/tI3XmhVgQmd08bfu+h/lfeF+2L+a7QKUw=; b=aZCWMQHsC6WCRROIzr/WRkKHMI
 ZXUvxGy1w/gnlOYsAkiFTxTOO8jH3BjQC7GfeRaivC227WdXfkZbYUyeF/UaI4qujusJIA3nDZunb
 4zfqx3/m8TihZwYaT8wXKYdgjrZNsI7rEBPz9GwN3/sQqDhK54yAMfzoO9e4x54wEUqo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWZFv-0002fl-1g for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 09:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0517CE0256;
 Sun,  4 Feb 2024 09:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D483CC433F1;
 Sun,  4 Feb 2024 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707040651;
 bh=1a/18m8aWACDG3JH7A3osAHapKeJBpsbrh6a8Bw7mDE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=utPpMcZSrIfJKn/VOqwSZid26sdGLBT7jLF7djuLRlF6NonziJBO34m66M8HW55AB
 1zEZdExTzJ94IySse+rTvEaJF3P5WU+hITF2DIZckoEmPaLS2tcR4jIFSFZwJ7V7e7
 eHB5RY1Aq9ZgMe4mZGAgTeAMSCEGt+d1iCY9rG+wWd4bp7jN11bkCKclsvIeiWjkl5
 kZRSHe1A66BasJrW8nq32I6mX4BVaLXtxLUVxDTNjII8SBR8W279cw9Nkvm18JKFLh
 rbgzGRooiouKV/N7TwrEXmGZtN308HEmWBTEvzg55d51H8yYIjBE++KIuccTCjzIeg
 LlscORnplMkNw==
Message-ID: <22bd1968-5ab1-4f4c-843e-03e4b74d7023@kernel.org>
Date: Sun, 4 Feb 2024 17:57:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <3b2852b3d404ecbb53d9affa781d12d0e9ea3951.1707022643.git.liujinbao1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <3b2852b3d404ecbb53d9affa781d12d0e9ea3951.1707022643.git.liujinbao1@xiaomi.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/4 12:58,
 liujinbao1 wrote: > From: liujinbao1 <liujinbao1@xiaomi.com>
 > > Currently, IO can only be ignored when GC_URGENT_HIGH is set, > and the
 default algorithm used for GC_URGENT_HIGH is [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rWZFv-0002fl-1g
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: sysfs: support gc_io_aware
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/4 12:58, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> Currently, IO can only be ignored when GC_URGENT_HIGH is set,
> and the default algorithm used for GC_URGENT_HIGH is greedy.
> It gives a way to enable/disable IO aware feature for background
> gc, so that we can tune background gc more precisely. e.g.
> force to disable IO aware and choose more suitable algorithm
> if there are large number of dirty segments.
> 
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
