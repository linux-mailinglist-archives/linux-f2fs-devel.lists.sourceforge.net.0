Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07982227BD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 May 2019 19:32:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSPfN-0003Bp-ET; Sun, 19 May 2019 17:32:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hSPfM-0003Bb-4F
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 17:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xd/j2bFTFqvTkhoe0dY27U0vgyUtV1T98XiRQZuV78o=; b=Q9jL68mkeMEvW/rZQIqghBbQ2b
 a09jycHwXqgyd97lghe3R/1CFBmk/hVI9oj0j3wcDdkiCfa3bG6YnkvwuxGfjdC+aJJeAD9+D8MCJ
 CqqYvO0946fAej394E+o5VtKcSuiHegSa+gt0vK1KaYqHUWHaOzn9S9vwkBWWiVRD7zY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xd/j2bFTFqvTkhoe0dY27U0vgyUtV1T98XiRQZuV78o=; b=b4eO6PmeCg0C/TxpVGorLxruwP
 OieDrj1r+YxUPkd4gNTxcNijHIZPAaB6NGVAXzTESXzdxlfJdfzRdKjKxDhOvebfmke63bl6LNdYs
 18l6e58JbsyBlPx5HQXYJGAHbfj+cS1FStMUOVTefD8jzc/Y6ISC7KwJXrbMczEuB8+c=;
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hSPfK-008z9r-GS
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 17:32:08 +0000
Received: by mail-qt1-f196.google.com with SMTP id y22so13725170qtn.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 May 2019 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xd/j2bFTFqvTkhoe0dY27U0vgyUtV1T98XiRQZuV78o=;
 b=X1tfe5A90x6J5V4+wVqHQimvtvECfIyQ1m7PveGOvsG/VqCe+kmo27BWVjB58gA+Wt
 UU6QiA5sVlMIie9hU0PZfiEbYBsTAw3RiuusnjaHar3uOtbL4co7CwVmGY/LsvVZPc0x
 fdrbpulN85v4u+GKt+e+O/uB4hJO3CE6ICCWCr9EXK2+qajhYxWXZM7O6AL1WzI3v31k
 H5F2EB2iVCCmDmB4q62TrrKC1QmmH6QUajYzafenWm5+ZZBhz6OQwcO1GQunln94GJ+O
 aKiI83p7G21ObFabwIj4UKmi5QZcr85FT7nf3os45NkWsOj7M1FkcMq2g/sGMyn3xNsZ
 SO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd/j2bFTFqvTkhoe0dY27U0vgyUtV1T98XiRQZuV78o=;
 b=bx5IRHVirrol60EBvOKDNkhKY7GbGFwILLC7MWebZ2ArxaRMFyBGhUmBGUTU1y4TUL
 sEWFRtTcFkOFsZTrTuoqG3mFLY/vnYMBjn8nBGEnSNPLkEianxqOVb4yky8PMw/NLRk8
 GeXXKelaoT/c3a7o8buDoocGOAzxSDmIe2w2Jy4PDTKPLLGOuPWb5EPP/limbUP6j8QN
 RWl35iFZvqWXxRQ6+R2NCmsF0BpIxAvd3UZkINvMVoXdPSNEGQ2I2B8JKSaJeNIPtzak
 r3yFa8cnzB5QdOvBXPAVgAaMFLjL5zRFZuANUu++8qPeZgV4XMAApjiOpsGnKh0my82i
 Fe9w==
X-Gm-Message-State: APjAAAUp6JG1tPyYmqAG/wcdaVusIaZdmHNFkbR93R2bAhUB1PAI1q8r
 5RuVVCPX55+OMWUrDB6G8ci6AiO9axZNxhc3joI=
X-Google-Smtp-Source: APXvYqzXDx3NLiybo6NRxAHAzaM+6GWVTQUIcE1VaLVGLZadSNyE9hmcJBInctQqW26CkCTb4sli09T8U1Zii3P+SJU=
X-Received: by 2002:ac8:3862:: with SMTP id r31mr58971037qtb.26.1558287120129; 
 Sun, 19 May 2019 10:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190426022554.56393-1-yuchao0@huawei.com>
In-Reply-To: <20190426022554.56393-1-yuchao0@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Mon, 20 May 2019 02:31:49 +0900
Message-ID: <CAD14+f0f9fKMmzNYXzoPD9W5CrECwvmGLi2a8EphfyZhTPjvnA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.196 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arter97.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hSPfK-008z9r-GS
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: relocate chksum_offset for
 large_nat_bitmap feature
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk and Chao,

I was semi-forced today to use the new kernel and test f2fs.

My Ubuntu initramfs got a bit wonky and I had to boot into live CD and
fix some stuffs. The live CD was using 4.15 kernel, and just mounting
the f2fs partition there corrupted f2fs and my 4.19(with 5.1-rc1-4.19
f2fs-stable merged) refused to mount with "SIT is corrupted node"
message.

I used the latest f2fs-tools sent by Chao including "fsck.f2fs: fix to
repair cp_loads blocks at correct position"

It spit out 140M worth of output, but at least I didn't have to run it
twice. Everything returned "Ok" in the 2nd run.
The new log is at
http://arter97.com/f2fs/final

After fixing the image, I used my 4.19 kernel with 5.2-rc1-4.19
f2fs-stable merged and it mounted.

But, I got this:
[    1.047791] F2FS-fs (nvme0n1p3): layout of large_nat_bitmap is
deprecated, run fsck to repair, chksum_offset: 4092
[    1.081307] F2FS-fs (nvme0n1p3): Found nat_bits in checkpoint
[    1.161520] F2FS-fs (nvme0n1p3): recover fsync data on readonly fs
[    1.162418] F2FS-fs (nvme0n1p3): Mounted with checkpoint version = 761c7e00

But after doing a reboot, the message is gone:
[    1.098423] F2FS-fs (nvme0n1p3): Found nat_bits in checkpoint
[    1.177771] F2FS-fs (nvme0n1p3): recover fsync data on readonly fs
[    1.178365] F2FS-fs (nvme0n1p3): Mounted with checkpoint version = 761c7eda

I'm not exactly sure why the kernel detected that I'm still using the
old layout on the first boot. Maybe fsck didn't fix it properly, or
the check from the kernel is improper.

I also noticed that Jaegeuk sent v1 of this patch to upstream. (Maybe
that's why the kernel detected old layout?) Please send v2 to upstream
soon, as running older fsck will cause much more headaches.

Thanks.


On Fri, Apr 26, 2019 at 11:26 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> For large_nat_bitmap feature, there is a design flaw:
>
> Previous:
>
> struct f2fs_checkpoint layout:
> +--------------------------+  0x0000
> | checkpoint_ver           |
> | ......                   |
> | checksum_offset          |------+
> | ......                   |      |
> | sit_nat_version_bitmap[] |<-----|-------+
> | ......                   |      |       |
> | checksum_value           |<-----+       |
> +--------------------------+  0x1000      |
> |                          |      nat_bitmap + sit_bitmap
> | payload blocks           |              |
> |                          |              |
> +--------------------------|<-------------+
>
> Obviously, if nat_bitmap size + sit_bitmap size is larger than
> MAX_BITMAP_SIZE_IN_CKPT, nat_bitmap or sit_bitmap may overlap
> checkpoint checksum's position, once checkpoint() is triggered
> from kernel, nat or sit bitmap will be damaged by checksum field.
>
> In order to fix this, let's relocate checksum_value's position
> to the head of sit_nat_version_bitmap as below, then nat/sit
> bitmap and chksum value update will become safe.
>
> After:
>
> struct f2fs_checkpoint layout:
> +--------------------------+  0x0000
> | checkpoint_ver           |
> | ......                   |
> | checksum_offset          |------+
> | ......                   |      |
> | sit_nat_version_bitmap[] |<-----+
> | ......                   |<-------------+
> |                          |              |
> +--------------------------+  0x1000      |
> |                          |      nat_bitmap + sit_bitmap
> | payload blocks           |              |
> |                          |              |
> +--------------------------|<-------------+
>
> Related report and discussion:
>
> https://sourceforge.net/p/linux-f2fs/mailman/message/36642346/
>
> Reported-by: Park Ju Hyung <qkrwngud825@gmail.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - improve hint message suggested by Ju Hyung.
> - move verification to f2fs_sanity_check_ckpt().
>  fs/f2fs/f2fs.h  |  4 +++-
>  fs/f2fs/super.c | 13 +++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 119bc5a9783e..aa71c1aa9eaa 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1909,9 +1909,11 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info *sbi, int flag)
>         int offset;
>
>         if (is_set_ckpt_flags(sbi, CP_LARGE_NAT_BITMAP_FLAG)) {
> +               unsigned int chksum_size = sizeof(__le32);
> +
>                 offset = (flag == SIT_BITMAP) ?
>                         le32_to_cpu(ckpt->nat_ver_bitmap_bytesize) : 0;
> -               return &ckpt->sit_nat_version_bitmap + offset;
> +               return &ckpt->sit_nat_version_bitmap + offset + chksum_size;
>         }
>
>         if (__cp_payload(sbi) > 0) {
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index fefc8cc6e756..22241bb866df 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2714,6 +2714,19 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>                 return 1;
>         }
>
> +       if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG)) {
> +               unsigned int chksum_offset;
> +
> +               chksum_offset = le32_to_cpu(ckpt->checksum_offset);
> +               if (chksum_offset != CP_MIN_CHKSUM_OFFSET) {
> +                       f2fs_msg(sbi->sb, KERN_WARNING,
> +                               "using deprecated layout of large_nat_bitmap, "
> +                               "please run fsck v1.13.0 or higher to repair, "
> +                               "chksum_offset: %u", chksum_offset);
> +                       return 1;
> +               }
> +       }
> +
>         if (unlikely(f2fs_cp_error(sbi))) {
>                 f2fs_msg(sbi->sb, KERN_ERR, "A bug case: need to run fsck");
>                 return 1;
> --
> 2.18.0.rc1
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
