Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF84006AE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Sep 2021 22:33:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMFsV-0000if-4r; Fri, 03 Sep 2021 20:33:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1mMFsT-0000iY-CO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 20:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vIdOCwskLhI0m4Y2FZRTnOUO+8ZEDMLcxJfUG+PYvsE=; b=H6fPT9h13e22YSOMsBjILw2ND1
 YhKVjGGl73tWvzU9f9GfFRuc1yIUM/jt/dXi+lNCMJCf+cCDvcOF3BfiZS3ZthkPAmToIRB2mpqaO
 uB/3/yLbzy75druJ+zD0FHKX05vPzr9DgsBSiRTSgz+ynFt/snKzJoqgQ1V/uuYJHCM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vIdOCwskLhI0m4Y2FZRTnOUO+8ZEDMLcxJfUG+PYvsE=; b=lieUY0Ifk0g6h8vemVbQpvFqj9
 Sf/xFctuYludJEkvtrdc2rEJmPAPT9kcEyKHe6lf1uITPkmqKDT50AqHvaU7OEGdLwlglZx31I9lR
 N0CW7DRnrePO8/M6JbIseF7jRI55PBZvj0BoGSC3nsvITgBjd6cDWLKFT+n93zhZB9IE=;
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mMFsO-0007On-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 20:33:33 +0000
Received: by mail-lj1-f177.google.com with SMTP id h1so636404ljl.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Sep 2021 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vIdOCwskLhI0m4Y2FZRTnOUO+8ZEDMLcxJfUG+PYvsE=;
 b=elj3tFd6Azm9vkuRGF+FrmR71fOH2ItuvYsMvpUWC4tTW+kE9P9mmsuv21eqppFMNT
 OVOeJXFeNwUr1u4luok6uLL6cLGY45GR0Uo54NN8xZs0s2622ASNm0G2rjlW8mGOI5RB
 bDAq4/XAt2wl3feYfbjdMrARbuXCN3pOs/p3pO5Ju2RIysueURvBes8LXn9z1ogrCv2i
 7IuS/nyX5ebUC5BKHYXO1YTTkzTqehPTere1t8wl57nl6YAm0isSNrR+lhanyaUVzWaY
 cOqSwCiSO3wvalKuTPcXQl4gcVjT9PqmNUgwG0gM0FcJ3t1sX4lW9bHNNuLrsFf2zjTQ
 n+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vIdOCwskLhI0m4Y2FZRTnOUO+8ZEDMLcxJfUG+PYvsE=;
 b=YE5nebZORX/YknVnllsx0tXRwql+wRWM90UUrR4jf2pHq/kuvmtVAHFK+HT8l9M2x9
 NvZA4gOYdj39wj0n4LlHy2IbzQd1zhE4SgMspFXwAhTKprQ9Q29qM95J/cUY5KhQh4iX
 t6aaZjPzyCBajs1rpOOMykTuU2ONKsQvaF+IkKl4K4+L3cLDOx1EJ7apMEQPP7oDW/tw
 gFtXJPwUxqDYZUOHh6wctrJ+T8TzN8B5O6eprzLLwoppyvmWE0EuYSdrVSyMXGcho3BG
 lh1DZrc3aIXSjSHz++6dECmMwXFeuC0MNJM6bgE4MCFkOFVfNLHKl/7RWR9pD8hCI/jt
 QCkA==
X-Gm-Message-State: AOAM531mRWFKWtypD6eacSOxXCmcZ+g4u6eZk2pl3hTd+mVAHz7RJzxX
 UpP9moYDqVdJEvWeS8PwQjJ4Fbl89ebhHJBTbS0=
X-Google-Smtp-Source: ABdhPJybDor+zVy/06ynl2HCn/3r7iQr2WBBZejKayn8CxV4gBUWz2lh/Sb6wJsZCF/ZDPOCHR/e5G1kkFqL5PlGXSk=
X-Received: by 2002:a2e:6c09:: with SMTP id h9mr577564ljc.30.1630701202021;
 Fri, 03 Sep 2021 13:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
In-Reply-To: <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 3 Sep 2021 13:33:11 -0700
Message-ID: <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.177 listed in list.dnswl.org]
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
 [209.85.208.177 listed in wl.mailspike.net]
X-Headers-End: 1mMFsO-0007On-Jd
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
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

>         if (f2fs_need_seq_seg(sbi))
>                 return 0;
>
> static inline bool f2fs_need_seq_seg(struct f2fs_sb_info *sbi)
> {
>         return F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_FIXED_BLK;
> }
>

Do you need this in select_policy(), either?
Like,
        if (f2fs_need_rand_seg(sbi))
                p->offset = prandom_u32() % (MAIN_SECS(sbi) *
sbi->segs_per_sec);
        else if (f2fs_need_seq_seg(sbi))
                p->offset = 0;

> One more concern... we'd better to save fragment_remained_hole as well
> as fragment_remained_chunk,  otherwise, if fragment_chunk_size +
> fragment_hole_size > 512, fragment hole will be truncated to 512 -
> fragment_chunk_size due to we won't create hole with enough size as
> seg->next_blkoff has crossed end of current segment.
>

Sorry, I don't get it. You mean making fragment_remained_hole as a
global variable?
Maybe, we run into the same race condition issue you told before for
fragment_remained_chunk.
Could you clarify this more?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
