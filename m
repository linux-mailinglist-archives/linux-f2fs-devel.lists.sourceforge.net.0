Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2DA2427A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Aug 2020 11:33:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5n83-0004Rx-Qx; Wed, 12 Aug 2020 09:33:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1k5n82-0004Rn-7G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Aug 2020 09:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=McgSm4gZG0IJUDrzxF8YLSNKil+nQCTSx4aOJLvpZXU=; b=BWXhxDdAx9RNAOUYiWEZvLpJh1
 eYXV53NlLO9ts0VQBvnteahkqrsmxtulhjtAAlTwsyr5mPuAAaN4wfKKgZgFQ9jiuDS1Rd8eXnGvk
 M3+TeOaD3kmihWSrFl6YpC+PSPXqjlYOXu15WB2Fkr15HkVHv+gQ+Ar/sbWNyisxaG/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=McgSm4gZG0IJUDrzxF8YLSNKil+nQCTSx4aOJLvpZXU=; b=bNvYx0OvMLa6zMtlw8wpJJapDM
 HpeEH/UmIDJAfLXY+SCZOb4LF0m7z/VlTVrRor77vGGCnCtmMYvu4wXFJiGR3LU+j8eqyQsYjD2i5
 RxUgt/kkN/sRI5awsqNjYz59SSE4SWYYmzNE7Uf2R0E4ef8XAO/Xa/OGrc/TLhnTo14w=;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1k5n7x-007jyR-53
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Aug 2020 09:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597224771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=McgSm4gZG0IJUDrzxF8YLSNKil+nQCTSx4aOJLvpZXU=;
 b=GBiV2QtezXRBlNuQkXT6zj5dolK+YcbsxZlkQLKTJX6ZqPUuGjEQxZQ0gJv9rfuYkBjEd9
 vfHiBg7WyE9RcULxNsD/p4nT3B2kpNsI34PzQcAuYESWdPWDBVf0e3b1dB3oEGP1r/9ron
 kcKq0bX5wHgPNvKvZOomu2Gy+ZPHyVo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-BNRRd1iINWSunH3PQZpfRg-1; Wed, 12 Aug 2020 05:32:49 -0400
X-MC-Unique: BNRRd1iINWSunH3PQZpfRg-1
Received: by mail-pl1-f198.google.com with SMTP id p14so1229664plq.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Aug 2020 02:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=McgSm4gZG0IJUDrzxF8YLSNKil+nQCTSx4aOJLvpZXU=;
 b=d8Rr0PGjlkfqsexb1cUX4B3kHVakkIuqZaCDcGMG4xzN//07l2UsWRYtwd7bcuCG2M
 ye1buKnr4QyfusvZ4sPPHdU0ZauVkODdDGWFL4O1d38+28N+T4MtsIWCCq7RVKre+9f2
 QpowMGdQ+2TnxhZSWy5yq6eS8+/U4hcz+YsLUkLtg5bWzRaDdmdHpnkOqpCRCI6aGt9a
 Fiux4VMHxIbQIErScITk8uxNYhWDksSrryj5CelVmaDJv/0y4LeuR0QVR7sOLBenkBSM
 7La+qlw3hwL2h5qrZ9BQm3IytcrHQdbt4lSk2+PgGS/tnZd/bFGQbMpMM6qwOEZIcsQV
 qNkA==
X-Gm-Message-State: AOAM533AIjHx2LaJ9agJ5aj6PjpSgh1dYmfqoGD5NBw65wlb9HDMcaQD
 2fU77aoKTGeGjuspxvScFCeWSDe5G+McW6F/UsRDBYvV26MR2tY4GGQIuhDu3nkoOfchT5W0RMu
 3gRvMVZtzLDl54XEMRskRBOvjlt+k5Xqpyd95lw==
X-Received: by 2002:a65:614f:: with SMTP id o15mr4297310pgv.321.1597224768558; 
 Wed, 12 Aug 2020 02:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx911sIO9/OZXyBonuONBWz+oLANJEAcEjx1Ld7BQlkUUtIu6DFXuiWv8TKBtMS/vO+GeEdAw==
X-Received: by 2002:a65:614f:: with SMTP id o15mr4297295pgv.321.1597224768283; 
 Wed, 12 Aug 2020 02:32:48 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y196sm1854702pfc.202.2020.08.12.02.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 02:32:47 -0700 (PDT)
Date: Wed, 12 Aug 2020 17:32:34 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200812093234.GA759@xiangao.remote.csb>
References: <20200812051711.2147716-1-daeho43@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200812051711.2147716-1-daeho43@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5n7x-007jyR-53
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change virtual mapping way for
 compression pages
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 12, 2020 at 02:17:11PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> By profiling f2fs compression works, I've found vmap() callings have
> unexpected hikes in the execution time in our test environment and
> those are bottlenecks of f2fs decompression path. Changing these with
> vm_map_ram(), we can enhance f2fs decompression speed pretty much.
> 
> [Verification]
> Android Pixel 3(ARM64, 6GB RAM, 128GB UFS)
> Turned on only 0-3 little cores(at 1.785GHz)
> 
> dd if=/dev/zero of=dummy bs=1m count=1000
> echo 3 > /proc/sys/vm/drop_caches
> dd if=dummy of=/dev/zero bs=512k
> 
> - w/o compression -
> 1048576000 bytes (0.9 G) copied, 2.082554 s, 480 M/s
> 1048576000 bytes (0.9 G) copied, 2.081634 s, 480 M/s
> 1048576000 bytes (0.9 G) copied, 2.090861 s, 478 M/s
> 
> - before patch -
> 1048576000 bytes (0.9 G) copied, 7.407527 s, 135 M/s
> 1048576000 bytes (0.9 G) copied, 7.283734 s, 137 M/s
> 1048576000 bytes (0.9 G) copied, 7.291508 s, 137 M/s
> 
> - after patch -
> 1048576000 bytes (0.9 G) copied, 1.998959 s, 500 M/s
> 1048576000 bytes (0.9 G) copied, 1.987554 s, 503 M/s
> 1048576000 bytes (0.9 G) copied, 1.986380 s, 503 M/s
>

The reason why I raised up this was that I once observed vmap() vs
vm_map_ram() on arm64 kirin platform as well. it indeed had some
impact (~10%) but not as huge as this. Anyway, such description
with test environment looks ok.

Thanks,
Gao Xiang

 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
