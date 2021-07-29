Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79E3D9A24
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jul 2021 02:37:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8u3a-0005x6-Ds; Thu, 29 Jul 2021 00:37:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m8u3Z-0005wz-1d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qqWw+vA0vUKlaNP16C5Qr9XxtQOKXd8xnAmGappybWY=; b=Pt26kXx/2JFRHqgEFnei/Bzw28
 XXp0gQl7rxrueGTeeWIEGkw9VnMN6BLMG1ABF/AuTkKFSgVtiTvMHsXXurZVh7NEJK9AMoYUFvtRr
 HqRedJ4u8B9nxkn8dAoU8qX5rsnoXm+UXCe0piazZDcth2KuUAyPUdYkuynVHI68mGQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qqWw+vA0vUKlaNP16C5Qr9XxtQOKXd8xnAmGappybWY=; b=SI5MQRTuW7xe/wNZCb4O1daHKI
 tReuhhYJJW7/9c9MlGLbHbSe6vd7LEKVLRTR/+dwwPfY6m+veGO5lmYb689wPMOvtfKzq8ROuM9zu
 Z51wcjHTi02HvEbs6lGPqNU4HwTX0kXyiLA1jH6gtPdqMePlZEew9rgDxMO5+2ErWtVA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8u3R-0007JK-Eu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:37:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95B616103B;
 Thu, 29 Jul 2021 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627519047;
 bh=HKuJ/sGTGEoDM22RJYLhczo7YamW8A07HkBki046ZPs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=W+nFlplcDkxPtR6FK3U73kf6y7ker+0HsuiHS9wyd/pPFKIAJmkEnT2usx4ttscK8
 Ut3KSQ8XWplcwRZeWCg6WVpxygCU8Dgeo6jDQrieKEQdD5bZ7f5wAMFC/dW+X/GTqP
 AkgWoL7GBpUMLLea8K7BEcXRi4Yd+VGM6SvAa3QKqDwcKDQ2JNvtSODKHGx6tAkaQ+
 GcEGdb7MTtemveefybubjMWR64Z70a6DPAJcRoiD49FBaeRC/3oSx46fTUFUkWQqXg
 a6LTP74Rr2/fCfDKtu94/BMf6+4Mjc/10Pn8PBIBVmA/+RyTKo0CU+j+9MrSus0zQl
 J1lZhmK8hjtvA==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210726041819.2059593-1-daeho43@gmail.com>
 <f9555521-8878-2d46-36f1-3032bb8bbc0a@kernel.org>
 <CACOAw_zvFcV-5ePrFOr-bo2DxXyFzjDTSo-7aPcXG6jtNweEbA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <66d9419d-5ce6-626c-7ac8-d0592f34ec31@kernel.org>
Date: Thu, 29 Jul 2021 08:37:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_zvFcV-5ePrFOr-bo2DxXyFzjDTSo-7aPcXG6jtNweEbA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m8u3R-0007JK-Eu
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/28 0:41, Daeho Jeong wrote:
> How about adding this?
> 
> skip_fill:
> 
>          if (map.m_pblk == COMPRESS_ADDR) {
> 
>                  if (start_blk & (cluster_size - 1)) {
> 
>                          ret = -EFSCORRUPTED;
> 
>                          goto out;
> 
>                  }
> 
>                  compr_cluster = true;
> 
>                  count_in_cluster = 1;
> 
>          } else if (compr_appended) {

It seems we can add a separate patch to cover all cases that cluster metadata is
going to be accessed rather than just fixing fiemap() case here?

>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> Tested-by: Eric Biggers <ebiggers@google.com>

Anyway, this patch looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
