Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F74DACB7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Mar 2022 09:43:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nUPFf-00022l-CQ; Wed, 16 Mar 2022 08:43:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1nUPFd-000227-TI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 08:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qbkmVnk1NVSxt7xwKUHidFtz9pzJoAD+lOTCnUON3PU=; b=UTddktVpfVpSBfZHE4UtuiQFyw
 oWXb0n1QskghMLRnUybO40KMbzOLV2I91LwrKpEqCyit1tV8fd6Ga118tkATPUqvW2qx+qaerafbM
 T1bvRdQ51KGLzYwNMHbiqSQsdzFl08s3YOctDQGV60X7ArXGuBOlUTZQRq1lBn2BW8+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qbkmVnk1NVSxt7xwKUHidFtz9pzJoAD+lOTCnUON3PU=; b=LLiIjiN1h6B+Jjvm8QRcdgLWyh
 86hnyXvV6joHUXqQocaDOtrvUoefzSIM9qod8aWRdszw9ZMgr6j9lMC+fiwgwg5cpl/DE2mMmcdek
 5qcH3WXquIeQGGqm2+2yY7hDhcCUwGSqcvNxZb/Q4y8J3ckk1x5YDd5YlRXnUFzQJAwk=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nUPFa-000jOp-VO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 08:43:24 +0000
Received: by mail-ej1-f43.google.com with SMTP id gb39so2662798ejc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 16 Mar 2022 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qbkmVnk1NVSxt7xwKUHidFtz9pzJoAD+lOTCnUON3PU=;
 b=ScDYI7S0WDFdtofFHy1Wc6yCecfUzS/D0vwtRU5qf2TWGX1nmCA7gBn2FouXUFLoi+
 MJk3LqNpzw2pq3uLatgBI3reuUiWT9T3njLGSvj+uGBkB68nNiscHMYxWfWHTk72aNqE
 zn0jQyHojO9SEWXWAu6LXFVu31NGHZ4ac71CwKQLlg/M4frIFo/kdW+r9yoKxODsZUQZ
 qc0KHYxGI5BYcCnC6cA/2Sfou447f94yoOS68SFAHDxUch1GWIFjOptaFLaGmGuz5Zxo
 bsvi6J2s4J4hKlmYX+Lq6+3SezasFZ4xUYOMlqrOGNOizwm463oAS7LLuSbsLs+LfBO1
 Nrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qbkmVnk1NVSxt7xwKUHidFtz9pzJoAD+lOTCnUON3PU=;
 b=JSw7MgRl+VtJDV2W7PabD10JoCxwVm6QmITZsQEplMjinvM6ahwbkgeEK5VPXWVB23
 Tr0PTPDyZ7r4gxMD0OoC4ua/u83uB02SxDE5n+08tbs4KUHlrWYUyYW8NznRSEVifYtJ
 c3usKCfngrGP5zUnFq1nsWLghX6HFWCe3TgwpKYGeLsgh3yfoaF4Wp2u6I8vQn22I9aO
 8CuRfgo52N+IJSElwvTPLd8MkVrIB97MpdT7oZ1R08GIUmSQeaWlS2w9dr9KjKc7PapC
 GjXoVMm57gLB0n17/MPcAdD71nj08qOsf6DaAYj2cWhz7VvDgZPr5T0AoH356nLYBroh
 wi9Q==
X-Gm-Message-State: AOAM531+W09i9mrDqihcXU3QczYUxZjlIulqlgpNyaxj4pZYbQkFvS1n
 Lx+U7SMYIyY+M5FujLlDVmL+6wIjJgvGcxStAKXBwcmKhv3awQ==
X-Google-Smtp-Source: ABdhPJwUIu0qsiT7qpbjqDH/NGTdgmxsKLn7t61PXGW3vrw2Mj539EkH4cKnllQ/DO7031BDKA2wgBjA//gByoYqVZ0=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr25408650ejt.639.1647420196051; Wed, 16
 Mar 2022 01:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
 <15c6c075-7ed1-db3d-e9a3-d2beaa48577f@kernel.org>
 <CAD14+f1sr=kN_d59MGtrCJ8e-GAxzPXsc=j2TP6ChkAccS9hZg@mail.gmail.com>
 <376d12ed-afd0-41d7-495c-054bfd24d5d1@kernel.org>
 <CAD14+f3SnZir_Q7pyVzFZ6zHJendYyxYfGaxP9iLEDQuPE=AZw@mail.gmail.com>
 <CAD14+f1_smUWHgZRffuTNfsmCk-j_LL_vw5RuWffGdnd=vP8BA@mail.gmail.com>
 <YjD78BmHAKBHj3wN@google.com>
In-Reply-To: <YjD78BmHAKBHj3wN@google.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Wed, 16 Mar 2022 17:43:04 +0900
Message-ID: <CAD14+f2nSy710HggEVfzRAipL_7F=HHmqc9mG4oyLrn2=AhzXw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, I'll perform the trace debugging later. Meanwhile,
 we encountered another issue. 
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.43 listed in list.dnswl.org]
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nUPFa-000jOp-VO
Subject: Re: [f2fs-dev] EIO returned when reading files from R/O,
 compressed f2fs image
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

Hi Jaegeuk,

I'll perform the trace debugging later.

Meanwhile, we encountered another issue.

For now, I added a workaround that performs mlockall() on all files
(vmtouch -L $val.mount -d -w -P $val.vmtouch) under the f2fs partition
so that the cp command works.

After confirming that extraction works, I've parallelized the script
again (on our production server again, so v5.15 without f2fs-stable
backports) and while userspace processes don't complain, there's
something going on on dmesg:

[224319.321668] loop0: detected capacity change from 0 to 11041080
[224319.361530] F2FS-fs (loop0): Found nat_bits in checkpoint
[224319.365029] F2FS-fs (loop0): write access unavailable, skipping recovery
[224319.365033] F2FS-fs (loop0): Mounted with checkpoint version = 4321
[224340.047471] loop1: detected capacity change from 0 to 11769352
[224340.101509] F2FS-fs (loop1): Found nat_bits in checkpoint
[224340.103799] F2FS-fs (loop1): write access unavailable, skipping recovery
[224340.103802] F2FS-fs (loop1): Mounted with checkpoint version = 4321
[224361.763528] loop2: detected capacity change from 0 to 11386480
[224361.812891] F2FS-fs (loop2): Found nat_bits in checkpoint
[224361.814881] F2FS-fs (loop2): write access unavailable, skipping recovery
[224361.814886] F2FS-fs (loop2): Mounted with checkpoint version = 4321
[224386.701011] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[224386.701248] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[224386.701779] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[224386.701806] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[224386.701826] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[224391.823216] loop3: detected capacity change from 0 to 11045240
[224391.884383] F2FS-fs (loop3): Found nat_bits in checkpoint
[224392.194608] F2FS-fs (loop3): write access unavailable, skipping recovery
[224392.194612] F2FS-fs (loop3): Mounted with checkpoint version = 4321
[224401.386330] loop4: detected capacity change from 0 to 11428112
[224401.424575] F2FS-fs (loop4): Found nat_bits in checkpoint
[224401.428872] F2FS-fs (loop4): write access unavailable, skipping recovery
[224401.428875] F2FS-fs (loop4): Mounted with checkpoint version = 4321
[224576.100839] loop0: detected capacity change from 0 to 11041080
[224576.140862] F2FS-fs (loop0): Found nat_bits in checkpoint
[224576.142694] F2FS-fs (loop0): write access unavailable, skipping recovery
[224576.142699] F2FS-fs (loop0): Mounted with checkpoint version = 4321
[224599.330003] loop1: detected capacity change from 0 to 2913344
[224599.360425] F2FS-fs (loop1): Found nat_bits in checkpoint
[224599.362257] F2FS-fs (loop1): write access unavailable, skipping recovery
[224599.362260] F2FS-fs (loop1): Mounted with checkpoint version = 4321
[224602.241868] loop2: detected capacity change from 0 to 2064344
[224602.276146] F2FS-fs (loop2): Found nat_bits in checkpoint
[224602.277955] F2FS-fs (loop2): write access unavailable, skipping recovery
[224602.277971] F2FS-fs (loop2): Mounted with checkpoint version = 4321
[224629.346056] loop3: detected capacity change from 0 to 41776
[224629.375324] F2FS-fs (loop3): Found nat_bits in checkpoint
[224629.377167] F2FS-fs (loop3): write access unavailable, skipping recovery
[224629.377170] F2FS-fs (loop3): Mounted with checkpoint version = 4321
[225029.224078] loop0: detected capacity change from 0 to 11411472
[225029.270396] F2FS-fs (loop0): Found nat_bits in checkpoint
[225029.271345] F2FS-fs (loop0): write access unavailable, skipping recovery
[225029.271348] F2FS-fs (loop0): Mounted with checkpoint version = 4321
[225625.045254] loop0: detected capacity change from 0 to 11045240
[225625.078435] F2FS-fs (loop0): Found nat_bits in checkpoint
[225625.079453] F2FS-fs (loop0): write access unavailable, skipping recovery
[225625.079455] F2FS-fs (loop0): Mounted with checkpoint version = 4321
[225651.466438] loop1: detected capacity change from 0 to 11428112
[225651.532489] F2FS-fs (loop1): Found nat_bits in checkpoint
[225651.582589] F2FS-fs (loop1): write access unavailable, skipping recovery
[225651.582594] F2FS-fs (loop1): Mounted with checkpoint version = 4321
[225653.729775] loop2: detected capacity change from 0 to 2896696
[225653.817115] F2FS-fs (loop2): Found nat_bits in checkpoint
[225653.842649] F2FS-fs (loop2): write access unavailable, skipping recovery
[225653.842654] F2FS-fs (loop2): Mounted with checkpoint version = 4321
[225665.480652] loop3: detected capacity change from 0 to 2064344
[225665.548952] F2FS-fs (loop3): Found nat_bits in checkpoint
[225665.551460] F2FS-fs (loop3): write access unavailable, skipping recovery
[225665.551465] F2FS-fs (loop3): Mounted with checkpoint version = 4321
[225687.173551] loop4: detected capacity change from 0 to 3753984
[225687.297132] F2FS-fs (loop4): Found nat_bits in checkpoint
[225687.299702] F2FS-fs (loop4): write access unavailable, skipping recovery
[225687.299705] F2FS-fs (loop4): Mounted with checkpoint version = 4321
[225694.934235] loop5: detected capacity change from 0 to 1868760
[225695.047462] F2FS-fs (loop5): Found nat_bits in checkpoint
[225695.049562] F2FS-fs (loop5): write access unavailable, skipping recovery
[225695.049567] F2FS-fs (loop5): Mounted with checkpoint version = 4321
[225704.254531] loop6: detected capacity change from 0 to 41776
[225704.282972] F2FS-fs (loop6): Found nat_bits in checkpoint
[225704.286725] F2FS-fs (loop6): write access unavailable, skipping recovery
[225704.286730] F2FS-fs (loop6): Mounted with checkpoint version = 4321
[225723.689515] loop0: detected capacity change from 0 to 11411472
[225723.723250] F2FS-fs (loop0): Found nat_bits in checkpoint
[225723.725740] F2FS-fs (loop0): write access unavailable, skipping recovery
[225723.725744] F2FS-fs (loop0): Mounted with checkpoint version = 4321
[225727.574004] loop2: detected capacity change from 0 to 11386480
[225727.621016] F2FS-fs (loop2): Found nat_bits in checkpoint
[225727.623296] F2FS-fs (loop2): write access unavailable, skipping recovery
[225727.623300] F2FS-fs (loop2): Mounted with checkpoint version = 4321
[225728.404524] loop3: detected capacity change from 0 to 41776
[225728.440403] F2FS-fs (loop3): Found nat_bits in checkpoint
[225728.442743] F2FS-fs (loop3): write access unavailable, skipping recovery
[225728.442748] F2FS-fs (loop3): Mounted with checkpoint version = 4321
[225731.328330] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[225731.328400] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[225731.328424] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
[225743.064116] loop1: detected capacity change from 0 to 11769352
[225743.110306] F2FS-fs (loop1): Found nat_bits in checkpoint
[225743.113408] F2FS-fs (loop1): write access unavailable, skipping recovery
[225743.113414] F2FS-fs (loop1): Mounted with checkpoint version = 4321
[225761.148410] loop3: detected capacity change from 0 to 3758152
[225761.195014] F2FS-fs (loop3): Found nat_bits in checkpoint
[225761.196431] F2FS-fs (loop3): write access unavailable, skipping recovery
[225761.196432] F2FS-fs (loop3): Mounted with checkpoint version = 4321
[225766.885693] loop4: detected capacity change from 0 to 1868760
[225767.010849] F2FS-fs (loop4): Found nat_bits in checkpoint
[225767.013024] F2FS-fs (loop4): write access unavailable, skipping recovery
[225767.013027] F2FS-fs (loop4): Mounted with checkpoint version = 4321
[225781.475142] loop5: detected capacity change from 0 to 3766472
[225781.500625] F2FS-fs (loop5): Found nat_bits in checkpoint
[225781.503148] F2FS-fs (loop5): write access unavailable, skipping recovery
[225781.503150] F2FS-fs (loop5): Mounted with checkpoint version = 4321
[225785.367635] loop6: detected capacity change from 0 to 1868760
[225785.474029] F2FS-fs (loop6): Found nat_bits in checkpoint
[225785.475673] F2FS-fs (loop6): write access unavailable, skipping recovery
[225785.475678] F2FS-fs (loop6): Mounted with checkpoint version = 4321
[225802.664721] loop7: detected capacity change from 0 to 41776
[225802.706846] F2FS-fs (loop7): Found nat_bits in checkpoint
[225802.709092] F2FS-fs (loop7): write access unavailable, skipping recovery
[225802.709095] F2FS-fs (loop7): Mounted with checkpoint version = 4321
[225812.972186] loop0: detected capacity change from 0 to 41776
[225813.000175] F2FS-fs (loop0): Found nat_bits in checkpoint
[225813.003617] F2FS-fs (loop0): write access unavailable, skipping recovery
[225813.003619] F2FS-fs (loop0): Mounted with checkpoint version = 4321

Those "lz4 invalid rlen:16384, expected:16384", is this normal?

Thanks.

On Wed, Mar 16, 2022 at 5:49 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> On 03/15, Juhyung Park wrote:
> > Here's strace from both commands right after drop_caches.
> >
> > cp: https://pastebin.com/raw/GH51BjV4
> > tar: https://pastebin.com/raw/0wgiu7fE
>
> Can we catch who sets EIO?
>
> # echo 1 > /sys/kernel/tracing/events/f2fs/f2fs_readpage/enable
> # echo 1 > /sys/kernel/tracing/events/f2fs/f2fs_readpages/enable
> # echo 1 > /sys/kernel/tracing/events/f2fs/f2fs_decompress_pages_start/enable
> # echo 1 > /sys/kernel/tracing/events/f2fs/f2fs_decompress_pages_end/enable
> # echo 1 > /sys/kernel/tracing/tracing_on
> # cat /sys/kernel/tracing/trace_pipe
>
> >
> > It seems that cp is calling a few extra fadvise and ioctl.
> >
> > On Tue, Mar 15, 2022 at 7:25 PM Juhyung Park <qkrwngud825@gmail.com> wrote:
> > >
> > > Hi Chao,
> > >
> > > On Tue, Mar 15, 2022 at 5:45 PM Chao Yu <chao@kernel.org> wrote:
> > > >
> > > > Hi Juhyung,
> > > >
> > > > On 2022/3/15 16:37, Juhyung Park wrote:
> > > > > Hi Chao,
> > > > >
> > > > > I actually have never used compression on f2fs yet and this image is
> > > > > from an unmodified firmware taken directly from the OTA server, not
> > > > > made by me.
> > > >
> > > > Alright.
> > > >
> > > > >
> > > > > If you can tell me how to check if the file is compressed or not, I'll
> > > > > run it and report back.
> > > >
> > > > lsattr <target_file_path> |grep c
> > > >
> > > > You can check the flag's mean in manual of chattr.
> > >
> > > Ah, didn't know that lsattr shows compressed state.
> > > It seems that every single file under that system partition is
> > > compressed except ones with file size of < 4096, but the error only
> > > happens on select files.
> > >
> > > >
> > > > >
> > > > > I never had this sort of issue (a lot of multiple readers causing
> > > > > troubles) before with a regular R/W, uncompressed f2fs partition, so
> > > > > I'm guessing it has something to do with RO or compression feature.
> > > >
> > > > Agreed, maybe we can repacking image to RO one or compressed one to
> > > > check which one can cause this issue?
> > >
> > > Is this easy to do standalone?
> > >
> > > AOSP's ext4 image creation was already super complicated to do
> > > out-of-tree with their dedup and minimizing file size (so that the
> > > resulting image is as small as possible) thinggies going on. I think
> > > I've seen EROFS support but I don't know how f2fs system images are
> > > handled under AOSP.
> > >
> > > Also, I moved the environment to my personal laptop. It's running
> > > v5.15.28 with the latest f2fs-stable/linux-5.15.y merged and it still
> > > happens there.
> > >
> > > One weird thing that I've been able to confirm is that it seems that
> > > multiple readers are not the problem:
> > > #!/bin/bash
> > >
> > > set -v
> > >
> > > APK=system/app/some_app/some_app.apk
> > >
> > > echo 3 > /proc/sys/vm/drop_caches
> > > tar -pcf - $APK | cat > /dev/null     # Works!
> > > cp $APK /tmp                          # Works!
> > >
> > > echo 3 > /proc/sys/vm/drop_caches
> > > tar -pcf - $APK | cat > /dev/null     # Works!
> > > echo 3 > /proc/sys/vm/drop_caches
> > > cp $APK /tmp                          # cp: error reading
> > > 'system/app/some_app/some_app.apk': Input/output error
> > >
> > > echo 3 > /proc/sys/vm/drop_caches
> > > cp $APK /tmp                          # cp: error reading
> > > 'system/app/some_app/some_app.apk': Input/output error
> > > tar -pcf - $APK | cat > /dev/null     # tar:
> > > system/app/some_app/some_app.apk: File shrank by 3375397 bytes;
> > > padding with zeros
> > >
> > > echo 3 > /proc/sys/vm/drop_caches
> > > cp $APK /tmp                          # cp: error reading
> > > 'system/app/some_app/some_app.apk': Input/output error
> > > echo 3 > /proc/sys/vm/drop_caches
> > > tar -pcf - $APK | cat > /dev/null     # Works!
> > >
> > > I'm guessing some system-calls that cp use causes f2fs to malfunction.
> > > (GNU tar is smart enough to detect if the output is /dev/null, so it
> > > skips the actual file read when it is piped directly to /dev/null, so
> > > I added `cat` in between.)
> > >
> > > Hope this new info helps.
> > >
> > > Thanks.
> > >
> > > >
> > > > Thanks,
> > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > > On Tue, Mar 15, 2022 at 5:33 PM Chao Yu <chao@kernel.org> wrote:
> > > > >>
> > > > >> On 2022/3/14 1:52, Juhyung Park wrote:
> > > > >>> Hi.
> > > > >>>
> > > > >>> We have a production server storing some Android firmwares over a ZFS
> > > > >>> file-system, and we noticed some issues when extracting firmware files
> > > > >>> that use f2fs for Android system partitions.
> > > > >>>
> > > > >>> This is a proprietary environment, so I cannot disclose every detail,
> > > > >>> so I hope you understand. I'll try to elaborate as much as I can.
> > > > >>>
> > > > >>> The server is running Ubuntu 20.04 with Linux v5.15 (recently upgraded
> > > > >>> from v5.13 after noticing RO feature added on v5.14 being required).
> > > > >>> We have a set of scripts extracting Android firmware files. The input
> > > > >>> is typically the OTA zip file and after going through the script, it
> > > > >>> extracts every file and binary image from a given file.
> > > > >>>
> > > > >>> So that includes extracting super (dynamic partition), ext4 system
> > > > >>> partitions with dedup enabled, and now, f2fs system partitions with RO
> > > > >>> and compression enabled.
> > > > >>>
> > > > >>> Our script never had to deal with f2fs before as we only started
> > > > >>> seeing f2fs system partitions with recently released devices.
> > > > >>>
> > > > >>> This is the f2fs mount flag after mounting with `mount -o ro
> > > > >>> system.raw /some/dir`:
> > > > >>> ro,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=2,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,discard_unit=block
> > > > >>>
> > > > >>> There are *a lot* of files in Android firmware these days, so we try
> > > > >>> to parallelize parts when we can.
> > > > >>>
> > > > >>> This is a snippet of the script:
> > > > >>> ```
> > > > >>> #!/bin/bash
> > > > >>> <...>
> > > > >>> RSYNC="rsync -ahAXx --inplace --numeric-ids"
> > > > >>> <...>
> > > > >>> for val in system vendor product odm; do
> > > > >>>     if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> > > > >>>
> > > > >>>     mkdir -p fs
> > > > >>>     cd fs
> > > > >>>
> > > > >>>     mkdir -p $val.mount tmp_$val
> > > > >>>     mount -o ro ../images/$val.raw $val.mount
> > > > >>>
> > > > >>>     $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> > > > >>>     echo $! > $val.pid
> > > > >>>     disown
> > > > >>>
> > > > >>>     cd $val.mount
> > > > >>>     find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> > > > >>>     find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> > > > >>>
> > > > >>>     while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > > > >>> & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> > > > >>>     wait
> > > > >>>
> > > > >>> <...>
> > > > >>>
> > > > >>>     cd ../
> > > > >>>     rm -rf tmp_$val
> > > > >>>     cd ../
> > > > >>> done
> > > > >>>
> > > > >>> wait
> > > > >>> <...>
> > > > >>> for val in system vendor product odm; do
> > > > >>>     if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> > > > >>>     tail --pid=$(cat fs/$val.pid) -f /dev/null
> > > > >>>     umount fs/$val.mount
> > > > >>>     rmdir fs/$val.mount
> > > > >>>     rm -f images/$val.img images/$val.raw 2>/dev/null
> > > > >>> done
> > > > >>> ```
> > > > >>>
> > > > >>> The offending part is:
> > > > >>> ```
> > > > >>>     $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> > > > >>>     find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> > > > >>>     find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> > > > >>>     while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > > > >>> & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> > > > >>>     wait
> > > > >>> ```
> > > > >>>
> > > > >>> When that part is reached, the script forks thousands of new processes
> > > > >>> and starts reading from f2fs. (We simply decided to rely on Linux's
> > > > >>> task scheduler and didn't bother to limit the number of
> > > > >>> sub-processes.)
> > > > >>>
> > > > >>> I am able to reliably cause f2fs to return EIO on some files:
> > > > >>> cp: error reading './system/priv-app/some_apk_1/some_apk_1.apk':
> > > > >>> Input/output error
> > > > >>> cp: error reading './system/priv-app/some_apk_2/some_apk_2.apk':
> > > > >>> Input/output error
> > > > >>> cp: error reading './system/priv-app/some_apk_3/some_apk_3.apk':
> > > > >>> Input/output error
> > > > >>> rsync: [sender] read errors mapping
> > > > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > > > >>> Input/output error (5)
> > > > >>> rsync: [sender] read errors mapping
> > > > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > > > >>> Input/output error (5)
> > > > >>> rsync: [sender] read errors mapping
> > > > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > > > >>> Input/output error (5)
> > > > >>> rsync: [sender] read errors mapping
> > > > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > > > >>> Input/output error (5)
> > > > >>> ERROR: system/priv-app/some_apk_1/some_apk_1.apk failed verification
> > > > >>> -- update retained.
> > > > >>> rsync: [sender] read errors mapping
> > > > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > > > >>> Input/output error (5)
> > > > >>> ERROR: system/priv-app/some_apk_2/some_apk_2.apk failed verification
> > > > >>> -- update retained.
> > > > >>> rsync: [sender] read errors mapping
> > > > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > > > >>> Input/output error (5)
> > > > >>> ERROR: system/priv-app/some_apk_3/some_apk_3.apk failed verification
> > > > >>> -- update retained.
> > > > >>> rsync error: some files/attrs were not transferred (see previous
> > > > >>> errors) (code 23) at main.c(1333) [sender=v3.2.3-45-ga28c4558]
> > > > >>
> > > > >> Hi Juhyung,
> > > > >>
> > > > >> Do you enable compression on specified files? if so, do all EIOs come from compressed
> > > > >> file?
> > > > >>
> > > > >> Thanks,
> > > > >>
> > > > >>>
> > > > >>> The dmesg remains silent.
> > > > >>>
> > > > >>> When I modify the script a little bit and force it to run in a
> > > > >>> single-thread (by removing &), it runs well.
> > > > >>>
> > > > >>> I was able to confirm that it isn't a memory issue. The server has
> > > > >>> 50G+ of free memory, and the issue is still reliably reproducible when
> > > > >>> I defragment the memory by dropping caches and doing `echo 1 >
> > > > >>> /proc/sys/vm/compact_memory`.
> > > > >>>
> > > > >>> I wasn't able to test any recent kernels (v5.16 or v5.17) as it's
> > > > >>> unsupported by ZFS. And it being a production server, I am somewhat
> > > > >>> limited in dabbling around the kernel.
> > > > >>>
> > > > >>> I am planning to test a new kernel with v5.15 +
> > > > >>> f2fs-stable/linux-5.15.y merged. Meanwhile, if this is a new report or
> > > > >>> fixed with newer commits, I'd appreciate a tip.
> > > > >>>
> > > > >>> Thanks.
> > > > >>>
> > > > >>>
> > > > >>> _______________________________________________
> > > > >>> Linux-f2fs-devel mailing list
> > > > >>> Linux-f2fs-devel@lists.sourceforge.net
> > > > >>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
