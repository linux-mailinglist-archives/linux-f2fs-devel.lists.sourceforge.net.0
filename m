Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE654B7F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 19:50:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1Afs-0007wM-Gj; Tue, 14 Jun 2022 17:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1o1Afr-0007wG-3a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 17:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9HssQcvv+z8PMOk3w7trm8lob60ctWFcsyzhbTHkSh0=; b=JufhpCha9XgrsVon6W9OepcqrR
 8z4nHXilni9I5RifMwKxu2FSH8T1sA6mDeQVhlrUKGjulyN5mEMB6uQbZfcFY54C53jPALUbaefCa
 WKdG801DsXBFjOxA/JfpPGEzURimMef2zdwJpvMHaoZ5Tkoo6rEJ1lWQHOMqVATrSRLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9HssQcvv+z8PMOk3w7trm8lob60ctWFcsyzhbTHkSh0=; b=UGr/I5ZSxnnh88SRKwlT4eCsZS
 dvFjz1xJqE8RNMYvWz4IXZ7MCBjZMrvpPcS5NyDhwmq5YmSgRI4NWfGOgcfsa5+fytuqeqaqFINNX
 o/+puy/QfrfxEfnS701ClBZFw3Jvl2LGHaMfw+ZTVXj6eAlPE3dtxv5k+zdbysyo/rdE=;
Received: from mail-yb1-f169.google.com ([209.85.219.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o1Afp-0008Vb-CS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 17:49:55 +0000
Received: by mail-yb1-f169.google.com with SMTP id l204so16368857ybf.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9HssQcvv+z8PMOk3w7trm8lob60ctWFcsyzhbTHkSh0=;
 b=nn/vJ8LnxV4y5b2PuVbbt1J/VBwpoZbFlgmg33sw6MgHr50fS2e9v94ZHMC1UNjj0u
 YtAChRXlf1KXvkPNjhD5qeqFzNyF397fzsPmUWDCf/0kwSE3ukH3IM43fPPl9s/c8v4V
 XA7C4RnbnkTWRE94yaKshUFkUGxdfPzmMgCu5RIyxOfuYPjx0Q6x5gMmiFHGYEQeD5pc
 54GjSM6KorNdJGP5kLwmI+a0TWdkJMuhsEQ70TNlP70ZMi3d9igKsZL53kcbr5jyNiKQ
 FG1pKyROK2VDZ7nn7vTocHpthJjf/Y7RM8ER/EViKQ7+tc77I/nSYW3YHKH73SLTtH1I
 U+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9HssQcvv+z8PMOk3w7trm8lob60ctWFcsyzhbTHkSh0=;
 b=jLx9OY38Tvc9k2O/6K7XzVSYsbda8vH5N/dG5sMlznayjlgirrblkCCDPCF4UaihsK
 TajhST74dJElTHJvCwHICGJKazhgpUalTjRSQ56ur4W9mTqreVcRPdE9itibDIU7jJga
 k2w7C2q1zSbPSvleMNMKB1a8gSl5gnecSnqKP48Ajw5PErOUOeMaXf8kiILx4ATD26ke
 YlN7ULioZz44CMFaBoN9jOO7R0u1iZ2vALePqg8NTh9xAblI3hFYpSd+rIsoe/p6Tmds
 zzAtFMAQ/lv3ridv6PYgfWzRSEcOJt2BN35mmdlHmvy7/4VYzxSDg09gdYaGPuneiX8P
 hBTQ==
X-Gm-Message-State: AJIora+D1rBTRVVqM9yt5YKM12eWN0ZmBpxzpm7SAKFOv7J1HN+QBJs8
 IFzRuRbgYOyhNzdhi7IgaqYkKl1dKaStr0er3WU=
X-Google-Smtp-Source: AGRyM1t7eamBoCcTiRk0CAMvHWvlPV/gdt1veg9RZAslhtt8XbZtdUgVF9TI8KMPBJToajZs+i2yQNWe0Eu+3JRYZsI=
X-Received: by 2002:a25:7209:0:b0:663:f48e:83d6 with SMTP id
 n9-20020a257209000000b00663f48e83d6mr6158586ybc.76.1655228988939; Tue, 14 Jun
 2022 10:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220613155612.402297-1-daeho43@gmail.com>
 <Yqge0XS7jbSnNWvq@sol.localdomain>
 <YqhRBZMYPp/kyxoe@B-P7TQMD6M-0146.local>
 <CACOAw_wjCyTmwusY6S4+NgMuLOZm9fwGfrvCT272GJ01-RP6PQ@mail.gmail.com>
 <Yqi+vyY4K0mzEdeP@B-P7TQMD6M-0146.local>
In-Reply-To: <Yqi+vyY4K0mzEdeP@B-P7TQMD6M-0146.local>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 14 Jun 2022 10:49:37 -0700
Message-ID: <CACOAw_xw3jN2KQaiG7AgCttaQr+uqJme=rsj8AT9wdsGWj3iVQ@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Yeah, I heard that you folks are really suffered from the
 scheduling > issues. But for my own previous experience,
 extra memory footprints
 are > really critical in Android low memory scenarios (no m [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.169 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.169 listed in wl.mailspike.net]
X-Headers-End: 1o1Afp-0008Vb-CS
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

> Yeah, I heard that you folks are really suffered from the scheduling
> issues. But for my own previous experience, extra memory footprints are
> really critical in Android low memory scenarios (no matter low-ended
> devices or artificial workloads), it tossed me a lot. So I finally
> ntroduced many inplace I/O to handle/minimize that, including inplace
> I/O for compressed pages and temporary pages.
>
> But I'm not quite sure what's currently happening now, since we once
> didn't have such non-deterministic workqueues, and I don't hear from
> other landed vendors.  I think it'd be better to analyse what's going
> on for these kworkers from scheduling POV and why they don't schedule
> in time.
>
> I also have an idea is much like what I'm doing now for sync
> decompression, is that just before lock page and ->read_folio, we can
> trigger some decompression in addition to kworker decompression, but it
> needs some MM modification, as below:
>
>    !PageUptodate(page)
>
>    some callback to decompress in addition to kworker
>
>    lock_page()
>    ->read_folio()
>
> If mm folks don't like it, I think RT thread is also fine after we
> analysed the root cause of the kworker delay I think.
>
> Thanks,
> Gao Xiang
>
> >
> > Thanks,

I don't think this is not a problem with most devices, since the
allocated memory is not too big and it'll be kept just as long as I/O
processing is on. However, I still understand what you're worried
about, so I think I can make a new mount option like "memory=low",
which can be used to give a hint to F2FS to have a priority on as
little memory as possible. In this mode, we will try to keep minimal
memory and we can use the previous implementation for decompression.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
