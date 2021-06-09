Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031C3A1DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jun 2021 21:23:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lr3nL-0001LS-P0; Wed, 09 Jun 2021 19:23:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1lr3nK-0001LL-CC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 19:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KRDuvwIDZpfCxSd6EaCM1HhXlTd7wXvevvyvLnyQfUg=; b=XAeLg4XnmCUl2QMQYvq5NiPIJ/
 hmNmosoqSb/VPI0wRNAVqa5jkiv7tr0hiWtyg1eq7FyFeo0whFIfpZ5K8qfNxgXpMKP89kPRjgbRl
 WSWUmPBAHMaGLj6tj/iIkNF1YYfpM7rxT5vfyD3e/7+qei0pyj99Pbf5ARDl63zrjx2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KRDuvwIDZpfCxSd6EaCM1HhXlTd7wXvevvyvLnyQfUg=; b=X6kXNPr32OoYvDA73lZZ19xhRF
 sXeMhiIa+T9Q0nSDpn91ruXe6Hi5ei8DZf+ILXwEezAvqsRGnV4wfK59gl7bEvBjRvgCkNP54arQe
 ECArtAPUBoVHqDxNeRY8BEE+Y5s7MImNuaSjTw3BogPi4CZcw3rRlT3AKTyzuN7GumhM=;
Received: from mail-ej1-f46.google.com ([209.85.218.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lr3nE-0001pe-D1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 19:23:20 +0000
Received: by mail-ej1-f46.google.com with SMTP id k25so34600151eja.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Jun 2021 12:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KRDuvwIDZpfCxSd6EaCM1HhXlTd7wXvevvyvLnyQfUg=;
 b=JWOEV1HdQqZVEYjGYD4GdpJFWiMifwphJlOeklcYRsstRAaTb0BRACO1kqSQtDe3on
 Y8cF35OLHuZLnJjQjURTY3JnXi2Z1y7mzPZj+tYhqjY3+8CMqf0DaygOttnroB+qtyNT
 u+6old0qtsy4DgazxSU6j2S3GxB7JxSH60TPugj/o9Xzb+sSqCzwCk4BCJu+Iad5cAYo
 O/URWfWZg2fpeaPGC/d9GdhoN8x1rTFJVkpgzZLtZoH4fgEQBBp++QaFqIXZQnZcl2wJ
 Jyb5IE+I0OjCqrjSsYC9V+RrjTpSbjHUP93eEYugKIPXjbojK6r4E47EfYwn3nW9Xrse
 8ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KRDuvwIDZpfCxSd6EaCM1HhXlTd7wXvevvyvLnyQfUg=;
 b=NR522nEOzatNzy9+hhTsd1eZHWRzMbNbN46DZEBVoiwKn2gW/NFlCcuVEIlu4HVbGe
 kebOozYPzYYUNV9ERkh7D4bjnFtCLsYtERw0NysgOHNEE+j46jcjLxW1ME8YBLC5kOvN
 uxA2ttNOlg/EQsGui2x7G2SXL611eRNUTnd45iiyJM2+qVqs7f1P0xgXWY1NeWkGSBc2
 7afX5O99LHtkhy4ZGm5cSsgWZ4u90Sjhq+cdqk1HkotXImwbPYqrQS5FCMd2HIZiUakU
 ZTNYyZ9eRp3teYLPbAn0E7JimqxwF0RQg/2dhG6Oigz9O6m6mfQ8BlbYkHTShLViCDD6
 HSVA==
X-Gm-Message-State: AOAM531NkccEWqtipaZqM61676sdFoqX6VQgd375pHc6IJ9HHPgROIqx
 gYqDMSqYVEnjO/HkfU4xEDrO2z8O3htM2jXNbv8=
X-Google-Smtp-Source: ABdhPJyp8Q3DoYKKmtyWlmPSOviVKP6Mr77N3jvtNa9321j/nTZyz8mtMdFbyOoy5VRI+p3SYN5wim4surCQHoibBBc=
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr1320464ejz.73.1623266586472; 
 Wed, 09 Jun 2021 12:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f3k7LB7w_XyfQGFRYDKbM9GoD8n7gos2URPjGrzeEEwUw@mail.gmail.com>
 <ad9f3ec7-3b27-5722-ad25-ebb696bb1502@kernel.org>
In-Reply-To: <ad9f3ec7-3b27-5722-ad25-ebb696bb1502@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Thu, 10 Jun 2021 04:22:55 +0900
Message-ID: <CAD14+f2KsnWBStV2PGmRkb_VxWinG_CDiyXRKhDH0qOACcck7w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.46 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lr3nE-0001pe-D1
Subject: Re: [f2fs-dev] Multiple fsck runs required to fix quota
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

No worries, this wasn't critical at all :)

I wasn't able to get a dump of the userdata partition then as it was
running on my real daily driver phone, but I'll try it if I notice the
issue again.

Thanks!

On Wed, Jun 9, 2021 at 10:28 PM Chao Yu <chao@kernel.org> wrote:
>
> Hi Ju Hyung,
>
> Sorry for the delay.
>
> On 2021/5/25 16:03, Ju Hyung Park wrote:
> > Hi.
> >
> > I'm reporting a possible issue with fsck requiring multiple runs to fix quota.
> >
> > The fsck version is the latest master branch, statically compiled
> > under arm64 flavor of Ubuntu and was executed under recovery mode.
> >
> > First run:
> > OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
> > Info: Fix the reported corruption.
> > Info: Force to fix corruption
> > Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
> > Info: Segments per section = 1
> > Info: Sections per zone = 1
> > Info: sector size = 4096
> > Info: total sectors = 59463283 (232278 MB)
> > Info: MKFS version
> >    "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
> > 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
> > Info: FSCK version
> >    from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> > version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> > 2019"
> >      to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> > version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> > 2019"
> > Info: superblock features = 80 :  quota_ino
> > Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> > Info: total FS sectors = 59463283 (232278 MB)
> > Info: CKPT version = 5a6b3a3
> > Info: checkpoint state = 45 :  crc compacted_summary unmount
> > [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
> > size 88064 does not match page offset 28
> > [fsck_chk_quota_files:1880] Fixing Quota file ([  0] ino [0x4])
> > [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
> > size 160768 does not match page offset 53
> > [fsck_chk_quota_files:1880] Fixing Quota file ([  1] ino [0x5])
> >
> > [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> > [FSCK] SIT valid block bitmap checking                [Ok..]
> > [FSCK] Hard link checking for regular file            [Ok..] [0x153c]
> > [FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
> > [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
> > [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
> > [FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
> > [FSCK] free segment_count matched with CP             [Ok..] [0xd395]
> > [FSCK] next block offset is free                      [Ok..]
> > [FSCK] fixing SIT types
> > [FSCK] other corrupted bugs                           [Fail]
> > Info: Duplicate valid checkpoint to mirror position 1024 -> 512
> > Info: Write valid nat_bits in checkpoint
> > Info: Write valid nat_bits in checkpoint
> >
> > Done: 75.117901 secs
> > 1|OnePlus7Pro:/ #
> >
> > As you can see, the first run returns 1.
> >
> > Second run:
> > 1|OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
> > Info: Fix the reported corruption.
> > Info: Force to fix corruption
> > Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
> > Info: Segments per section = 1
> > Info: Sections per zone = 1
> > Info: sector size = 4096
> > Info: total sectors = 59463283 (232278 MB)
> > Info: MKFS version
> >    "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
> > 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
> > Info: FSCK version
> >    from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> > version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> > 2019"
> >      to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> > version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> > 2019"
> > Info: superblock features = 80 :  quota_ino
> > Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> > Info: total FS sectors = 59463283 (232278 MB)
> > Info: CKPT version = 5a6b3a3
> > Info: Checked valid nat_bits in checkpoint
> > Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
> > [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
> > size 88064 does not match page offset 28
> > [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
> > size 159744 does not match page offset 53
> >
> > [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> > [FSCK] SIT valid block bitmap checking                [Ok..]
> > [FSCK] Hard link checking for regular file            [Ok..] [0x153c]
> > [FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
> > [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
> > [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
> > [FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
> > [FSCK] free segment_count matched with CP             [Ok..] [0xd395]
> > [FSCK] next block offset is free                      [Ok..]
> > [FSCK] fixing SIT types
> > [FSCK] other corrupted bugs                           [Ok..]
> >
> > Done: 73.506501 secs
> > OnePlus7Pro:/ #
> >
> > We can see that it returns 0, but still prints "Quota inode # corrupted".
>
> I doubt we didn't fix filesize of quota file at first fsck repair, not
> sure this can fix this issue..., could you please have a try with it?
>
> ---
>   fsck/quotaio_v2.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fsck/quotaio_v2.c b/fsck/quotaio_v2.c
> index 9353f85..c49ae3a 100644
> --- a/fsck/quotaio_v2.c
> +++ b/fsck/quotaio_v2.c
> @@ -203,7 +203,8 @@ static int v2_init_io(struct quota_handle *h, enum quota_type qtype)
>                         h->qh_qf.ino,
>                         filesize,
>                         last_blkofs);
> -               filesize = (last_blkofs + 1) << F2FS_BLKSIZE_BITS;
> +               filesize = qf->filesize =
> +                               (last_blkofs + 1) << F2FS_BLKSIZE_BITS;
>                 f2fs_filesize_update(qf->sbi, qf->ino, filesize);
>         }
>
> --
> 2.22.1
>
> Thanks,
>
> >
> > Third run:
> > OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
> > Info: Fix the reported corruption.
> > Info: Force to fix corruption
> > Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
> > Info: Segments per section = 1
> > Info: Sections per zone = 1
> > Info: sector size = 4096
> > Info: total sectors = 59463283 (232278 MB)
> > Info: MKFS version
> >    "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
> > 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
> > Info: FSCK version
> >    from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> > version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> > 2019"
> >      to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> > version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> > 2019"
> > Info: superblock features = 80 :  quota_ino
> > Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> > Info: total FS sectors = 59463283 (232278 MB)
> > Info: CKPT version = 5a6b3a3
> > Info: Checked valid nat_bits in checkpoint
> > Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
> >
> > [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> > [FSCK] SIT valid block bitmap checking                [Ok..]
> > [FSCK] Hard link checking for regular file            [Ok..] [0x153c]
> > [FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
> > [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
> > [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
> > [FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
> > [FSCK] free segment_count matched with CP             [Ok..] [0xd395]
> > [FSCK] next block offset is free                      [Ok..]
> > [FSCK] fixing SIT types
> > [FSCK] other corrupted bugs                           [Ok..]
> >
> > Done: 68.652988 secs
> >
> > Thanks.
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
