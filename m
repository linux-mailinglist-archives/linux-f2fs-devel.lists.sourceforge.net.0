Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0517E42C816
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Oct 2021 19:53:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1maiRS-0006je-PB; Wed, 13 Oct 2021 17:53:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1maiRG-0006jN-1s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 17:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=daV7f6edlBjE64Q8UviKTbVUx/C1ouI6DaLQnoPVZz4=; b=EcczA/RKFPS+gjXtdT4YOavvjd
 5jaKOvmvsbeNadALseulYfoV4iq+22MgBvT3D2BoxMjDQ3rsDdILfQZAgyDO22cdGU4HB1CQoSyeT
 1sSs7B2/1ERi1q3h6i1O3p1YWgMZEt/0ofQiz4UTHFjo9TbD+C2H4oipLKdvwIZQpLAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=daV7f6edlBjE64Q8UviKTbVUx/C1ouI6DaLQnoPVZz4=; b=D+BzN9J98MZopCovTt+3iKhiEm
 mdsfo0jWtWsmA3pUObIlbTz+Nsl/kQqpUC4iA9czsWO7fqjuT5CwRJqScfiwKKdDb1937PKY2LBjA
 qJDLFPaQk5rCjW/PXpwdQrSwIVZIuCwGtxKhr06pyCmJRhL+rxmCuguaLueEN6y4w/5M=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1maiR9-008tsc-8t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 17:53:07 +0000
Received: by mail-lf1-f46.google.com with SMTP id t9so15247541lfd.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Oct 2021 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=daV7f6edlBjE64Q8UviKTbVUx/C1ouI6DaLQnoPVZz4=;
 b=qUQSNI+tWAI3H3fGeeYhU04G3fOMAvst+PyBREFniFJzQeAaYYZvLlXjo4M2CdAbEk
 33CBKZzgWQE/KbeysNTdrj/G4lK0ogEl1hoCYfF4lpRBHderFOC4xtnyz2dkuw52aKBa
 mgtXifvoYMLq4VkbrmT/456ybO9DIAiepjAsviCPet/52JMxo50teZTsE+9yOWZH/5vW
 vRb8P+fIQX+2QmLaA9tP0jRP7Hvi5YImPLxKZ8mWpc6CRrwZlm/8IV3/RM31yYy56SSb
 2a314RhlkYp6Wv+dF8bEnFZ8q3iHxCcSwKoUTms7GIilHSgXy4iPReWA7lZjDodmxQ8z
 epqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=daV7f6edlBjE64Q8UviKTbVUx/C1ouI6DaLQnoPVZz4=;
 b=wnAHlLxqncCvwBuYva2FNBD4yZjqT9xrtTBdD/VAHYxtcegTLlZBP5NGEeGDOHgv/i
 jGIxRTGIfXcYK4RB/Zecu8p12B1gILFjxDu0nlZpq588r7dar7ClghumO5xlxi2tAmKn
 fL8inuERRjaTAmvlc5JttvhTV9WxnMxOH0nSrrZlnfdQXLgJKq9W9XHwC/DI9Q4TURbN
 dGsRtVta/qe+5h4JQOI0pbEAcAbi0C/R/yY5kxQSKMmIL+wv0oa35sivNu7lj7mm0tny
 3PffEzCN/gs3Q15PNkeVlEOgGYnEqybvtRCr1tWTeQ1bpxVGrN2cQgdyiAkJB7cJUC7r
 t6wQ==
X-Gm-Message-State: AOAM5326dQyN3suov/cNOcm/XrnJAND8N86iMNJhMyeMEqIV5S9OJJL2
 onf/gW7jRYVg3t0khNZ1/3++BGRESuw3emOT7n4=
X-Google-Smtp-Source: ABdhPJxA9vh2A+FeRnKkK8PokhkES4JqkDIMOW168Xf4a+v536ilyqGol1spqhD4/jpYqp2hQFLzT5z8D72WX8XZxjY=
X-Received: by 2002:a05:6512:12d3:: with SMTP id
 p19mr460668lfg.280.1634147580783; 
 Wed, 13 Oct 2021 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211006174910.2964885-1-daeho43@gmail.com>
 <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
 <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
 <16840026-35ba-cce6-4e0b-3332b0902d2a@kernel.org>
In-Reply-To: <16840026-35ba-cce6-4e0b-3332b0902d2a@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 13 Oct 2021 10:52:49 -0700
Message-ID: <CACOAw_xW7MZi8BVi-2Zo-=LruZr6k7fC7huYiYuWyaDDDti6WA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Sorry, many parts of userspace already rely on these names.
 I wrote that compr_written_blocks shows the block count written after
 compression
 since mount. So, the count of blocks written as original d [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1maiR9-008tsc-8t
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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

Sorry, many parts of userspace already rely on these names.
I wrote that compr_written_blocks shows the block count written after
compression since mount.
So, the count of blocks written as original data after compression
because of no gain would not be an exception.

Thanks,


On Wed, Oct 13, 2021 at 7:17 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/10/12 0:02, Daeho Jeong wrote:
> >>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >>> index c1bf9ad4c220..9b663eaf4805 100644
> >>> --- a/fs/f2fs/compress.c
> >>> +++ b/fs/f2fs/compress.c
> >>> @@ -1530,6 +1530,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
> >>>        if (cluster_may_compress(cc)) {
> >>>                err = f2fs_compress_pages(cc);
> >>>                if (err == -EAGAIN) {
> >>> +                     add_compr_block_stat(cc->inode, cc->cluster_size);
> >>
> >> Shouldn't we relocate this after 'write' label?
> >>
> >> One more concern, it looks we've changed what compr_block stat indicated,
> >> literally, the block we account should be compressed..., how about accounting
> >> it by introducing .presist_blocks, used_blocks or occupied_blocks.... thoughts?
> >>
> >
> > What I wanted to add here is just one case in which compression was
> > tried, but couldn't save any block, so gave up.
> > If we put this below the "write" label, we will count blocks, even if
> > the file is turned off for compression in "user-controlled
> > compression" mode.
> > Like the commit comment says, I want to estimate the overall compression rate.
> > But, if we include every other compression disabled condition, it
> > won't work like that.
>
> Got it, thanks for the explanation.
>
> Any thoughts about renaming compr_block? since some blocks accounted in
> .compr_block weren't compressed blocks.
>
> Thanks,
>
> >
> > Thanks,
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
