Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F43F9BA0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Aug 2021 17:22:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJdgr-0001WB-8P; Fri, 27 Aug 2021 15:22:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mJdgq-0001Vw-AC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Aug 2021 15:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=12EwHYLs5eOm6quA+sm5cigmgg54YxcYAcpzFTkzTao=; b=ZWWDdQBs1DYytN4cgvaK7zULEy
 v6bUhuZjDxO1sP4r8GXFZ76K8HlxY61CrPWq9/qIAuvFrjH+cK/DMgCUMbTjww8whsO89vytVvBhx
 HP93jHG+GDgSW13EOE3uOrbd+y5ijCyDcoqjDkM2JT8q52mnZuIt4u+MRgj9o36fRLlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=12EwHYLs5eOm6quA+sm5cigmgg54YxcYAcpzFTkzTao=; b=GT+tu7T90KYiacHDzgYZsPqe+r
 T50W1aF8C0ffXbR42gaVwYHBVHu/Hqs7BnbUXQKxzsfesKtccUOMLnuknWY35SrDGAEK2cQLxUm66
 4t1sSbjoEcWTe8W2+ceerTfhDiUxQ4Ya3qbaRO1bBKPmWS+EM5VRQ+UxYxrnzIyEIlsg=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mJdgo-0004XM-Qo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Aug 2021 15:22:44 +0000
Received: by mail-lj1-f169.google.com with SMTP id m4so12023264ljq.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Aug 2021 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=12EwHYLs5eOm6quA+sm5cigmgg54YxcYAcpzFTkzTao=;
 b=jEpVum+lZp9b+V7si+VhVikOieyqbKysSBBXz1GeJAcrqjxbumhj6CG8FX6yRs56wo
 L+OZYerWMsGR6sJ3brzUy0IN39xDSptABdOkE3A6MSjbaKbmDbYqiQonD8NQQXozTemh
 vaSQQhHvMvfIr/RKr6j7hJVXR1ZXYwzuynk0dAptC0ikewkSAfXS4EdUBCYpUaqQZ6oE
 DTXQf87AGv4BliNaG8mvaq8VmMVI7IIiuU1TJ8fncxif4Kq+RVg77F9E9A0lTxxzCvCD
 yu5KJs3zrJ/ez/baVFiKRtkHpkr+gLxv2yqmYCjITAnC2qWJJQEDRdAbWsUwDT9UFy7P
 bETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=12EwHYLs5eOm6quA+sm5cigmgg54YxcYAcpzFTkzTao=;
 b=HcNm1Fc6aKr8qcx9dSDdGvqYBlnoXHbdsHX+3wdhrFOWQqGThWhOVgYeiXlFqim/Ru
 MfC/rsMj2j6C6tjbQjgcHC30vAma1PFRzl8yrPFgu1Js7tkVVQb2I6qHeMqunziRG23J
 tRnhI2SCXPhLIhkvDxPUrx8GICy7rFLpAN3QIcOtB3/UNWjsaBb2o41qtryrYMIVXC4b
 r1HW0LSN8ycJl9YIERbQtNmpEBeDEugWDtPIhoY55gDhe/TJWiQ7Rt8M/2ixxXykODhS
 Nywf2Lpz2LTDpTFt+/5TVKiXHKxaRqYTC64hMoeLzFpfs2CSjAJj1VU07Rw1amhxLtZJ
 SCyg==
X-Gm-Message-State: AOAM531S3/qE63Klso2S1EIjKSyK/yylJxi2JM+KKXu8cJgm4Lvq1alY
 wceSu7y3L22s3XAzXVo+Bw4/Uq67MRnvwdt0yqLnUuY3gqo=
X-Google-Smtp-Source: ABdhPJxWbKzBq4Syh4W699pjantVPGtpyDFbhimXMVsIQwhZumoSStC3iUlQZcQW1Mr/Lno5EIfKvAemGvjTGt1M7IQ=
X-Received: by 2002:a2e:2d01:: with SMTP id t1mr8022273ljt.400.1630077756278; 
 Fri, 27 Aug 2021 08:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210825185747.1627497-1-daeho43@gmail.com>
 <1f1e6d38-6bd1-17ea-b8ca-a45d1244728f@kernel.org>
In-Reply-To: <1f1e6d38-6bd1-17ea-b8ca-a45d1244728f@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 27 Aug 2021 08:22:25 -0700
Message-ID: <CACOAw_yhgo1_wrejKskSm=Rsw27ogx=TS_A=z=-NGLcecA-gYA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.169 listed in list.dnswl.org]
X-Headers-End: 1mJdgo-0004XM-Qo
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce fragment allocation mode
 mount option
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

> I'd like to add a fixed chunk/hole fragmentation mode in addition, then
> userspace can control the fragmented chunk/hole with fixed size.
>
> How do you think of renaming "fragment:block" to "fragment:rand_block", and
> then I can add "fragment:fixed_block" option and its logic in addition?
>

The reason I added the randomness on these values is the segment
selection in SSR mode.
If all the segments have the same free block counts, f2fs will
allocate a new segment sequentially in SSR.
This was what I didn't want. Plus, in the real world, the size of hole
and chunk will be different in different segments.

But, if you think we need this "fragment:fixed_block" mode, I am happy
to have it. :)

> Do we need to consider multiple thread scenario? in such case,
> .fragment_remained_chunk may update randomly.
>
> In addition, multiple log headers share one .fragment_remained_chunk,
> it may cause unexpected result, it means there may be continuous holes
> or chunks in locality due to swithing between different log headers.
>
> Thanks,
>

Oh, I overlooked that point. I am going to add the variable for each
segment as you said before.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
