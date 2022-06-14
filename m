Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411954B69B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 18:47:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o19hA-0003oB-JA; Tue, 14 Jun 2022 16:47:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1o19h9-0003o1-AV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 16:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XDk/gviZ4PTB0F4aeM/SYkP/gckoTZKcQotKkjmgkbU=; b=EJTANioWLLonV4CRC2TyAkm6yu
 WD/7+TFEKSDUijvhgGK/D2sBQDwrNanDgRTYkrq0tC/ohyT5qf5AIi1H1qasV03awZu6j1thDKxkx
 Tk817P+/WK7ILGnsnq1h9nnFvH9feouPx3jCmmqHvjl/vOTxnhNlv4mxFn2EaPawUkls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XDk/gviZ4PTB0F4aeM/SYkP/gckoTZKcQotKkjmgkbU=; b=B9F2IA2axirDJl1yunL22HsU8y
 gFIfRvUYViknlzkWGoxx5BYPns0UC6gKBG2QoLSSLtzrZYE/i3KKws/oaS4EwMYKjID757hD/dMa9
 hJpWEnSL+7oX9rt5SXgme4UyNdPtwKS2PZhtzeZDwrHm9BQ6cYUfhRIBopqnUz4euKVU=;
Received: from mail-yb1-f171.google.com ([209.85.219.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o19h5-001bL8-JB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 16:47:11 +0000
Received: by mail-yb1-f171.google.com with SMTP id v81so16218973ybe.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDk/gviZ4PTB0F4aeM/SYkP/gckoTZKcQotKkjmgkbU=;
 b=UVo7z7mq83OdvUMfv2zalYzpjivYTuojc8nrC14VtzHQxfO8kkrbOasAwYDGrmh0Kr
 TPWc0pt/+WTr1mK679VBnfsxfJSlmVDdvJ3irqhAxmkoAx4FZyftOa92c55uGWg46fGk
 TdeH+DwIPD6MdYHH/1Jk2bwZMF8Li/tN3dYF48d71K87UHk4aSTUsKGoVJ/WFX7QGdRI
 WUP6m+iWKKgwgI4iEZMZPYuix0X3vA0PE9jMY5DudkbQGiz+Y33Dbzk6rPJIk+Wro6vk
 D8eKjKUczvkIQmPIhuCy3K231YVzvYQ5+wSL6oRpyTUF/8ZI14KP36My6ida7g7SkjWH
 t5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDk/gviZ4PTB0F4aeM/SYkP/gckoTZKcQotKkjmgkbU=;
 b=l9NbLICzIt8tWG11swK6/3rp8Bn2htwjP+hmivXGm8qWAmv8K2m0XU30yVnWiyy3U7
 wu0Ln+aE6McgMIqTuVTKSdcUTAgb14hyYwqA2rdK3SzdLoCEi/s9qemUGmyx5C+9eMeR
 UBT9QZxYkW9PmzoSOC3CckXSuvUa7112P3iYwVIbjwN3GNogsV2Cr32Vc1KCIBeSa4DD
 4JsNWqeQUSYQy6DcB6qUJzUG8ftp+wq4CWWJB/XksstFL0CZ4HwL9LllhZI8Oa8z9L7w
 hRGoQPaWfPe2dOFwyS8IsSFlhFgwY4IH7zZH35u6Jn2x+nkSh6XZHlOdq0gDwft298MO
 DSoQ==
X-Gm-Message-State: AJIora/+FxjGdsvzgK/oeCjsaiylZkpAFTw972lk/5CDhEyQqj+tzaBg
 hnANU4Qu61pCpTgnisIFhe8mWVrgU0TYBbTGqhM=
X-Google-Smtp-Source: AGRyM1v5cuCGYw9RPYwQDmZWRztbN8i22S3AMOZQ1Zdps8kxiWn7B6Dux4ERGYj+6pPK+GABe7xiCvTpqdRn6UHJIaE=
X-Received: by 2002:a25:4688:0:b0:664:68b5:e283 with SMTP id
 t130-20020a254688000000b0066468b5e283mr6098349yba.546.1655225221744; Tue, 14
 Jun 2022 09:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220613155612.402297-1-daeho43@gmail.com>
 <Yqge0XS7jbSnNWvq@sol.localdomain>
 <YqhRBZMYPp/kyxoe@B-P7TQMD6M-0146.local>
In-Reply-To: <YqhRBZMYPp/kyxoe@B-P7TQMD6M-0146.local>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 14 Jun 2022 09:46:50 -0700
Message-ID: <CACOAw_wjCyTmwusY6S4+NgMuLOZm9fwGfrvCT272GJ01-RP6PQ@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > Some my own previous thoughts about this strategy: > >
 - If we allocate all memory and map these before I/Os, all inflight I/Os
 > will keep such temporary pages all the time until decompression is [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o19h5-001bL8-JB
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle decompress only post processing
 in softirq
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Nathan Huckleberry <nhuck@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>
> Some my own previous thoughts about this strategy:
>
>  - If we allocate all memory and map these before I/Os, all inflight I/Os
>    will keep such temporary pages all the time until decompression is
>    finished. In contrast, if we allocate or reuse such pages just before
>    decompression, it would minimize the memory footprints.
>
>    I think it will impact the memory numbers at least on the very
>    low-ended devices with bslow storage. (I've seen f2fs has some big
>    mempool already)
>
>  - Many compression algorithms are not suitable in the softirq contexts,
>    also I vaguely remembered if softirq context lasts for > 2ms, it will
>    push into ksoftirqd instead so it's actually another process context.
>    And it may delay other important interrupt handling.
>
>  - Go back to the non-deterministic scheduling of workqueues. I guess it
>    may be just due to scheduling punishment due to a lot of CPU consuming
>    due to decompression before so the priority becomes low, but that is
>    just a pure guess. May be we need to use RT scheduling policy instead.
>
>    At least with WQ_HIGHPRI for dm-verity at least, but I don't find
>    WQ_HIGHPRI mark for dm-verity.
>
> Thanks,
> Gao Xiang

I totally understand what you are worried about. However, in the real
world, non-determinism from workqueues is more harsh than we expected.
As you know, reading I/Os in the system are critical paths most of the
time and now I/O variations with workqueue are too bad.

I also think it's better that we have RT scheduling like things here.
We could think about it more.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
