Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533530A646
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 12:14:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6X9a-0000Un-F5; Mon, 01 Feb 2021 11:13:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1l6X9W-0000UE-2m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 11:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RLU8sNVXRSwQvcQ9Qv8D6rwZxuEAO9er5VHUrLUQ6lo=; b=ei1DUVLt9iHM1EQZzeGK+vIsfi
 bXxPoxplJdOuDvloRHThep3Ss7NJQ6mfN4nSFOnXqQyxO5mkrOrHdM8ujVDsm/bjbGaqkc/XzMx2Q
 ZcAHivo/xRcuH1L+nWXVXRuRNehZkPy2ct5MHO9E2nZH5Mm0D1FDZVtna5ZHmeZ9uBrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RLU8sNVXRSwQvcQ9Qv8D6rwZxuEAO9er5VHUrLUQ6lo=; b=LGowrGaDvY1JdOXEzm8wMdqFsq
 nBWAXVKxbeBtxHY2UCOZHgz2T8ILGgoEa/jDV9e+XTji7/y12kwDeRThcPorasOOcN7PN3sX14NF/
 U1cCCEdMNogo8zA9uLcnYHzbN/KIZLgIdKpXKGCedjdt5TafdI0V33TNrlrEE4iXyEA8=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l6X9O-00ARbk-Jn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 11:13:54 +0000
Received: by mail-wm1-f54.google.com with SMTP id 190so12291485wmz.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RLU8sNVXRSwQvcQ9Qv8D6rwZxuEAO9er5VHUrLUQ6lo=;
 b=L2BSNt7JuuX3qwrFkNZjtFXfNANw5QJ85Zzv/tI14dXMoLSgBfFXpzNkCEQk/s7y+n
 c9pr4KSWgfja57hPagkEj3aixUcSalBsGKYezPNuM5yfObu8/dbV04WdroKRi/Rd0a4w
 O7Op0qUxgDVAKuovjloSRmC6zp8ufwg0s/wfHy8/sbP+huWE2bBFaNK0SHu7Z66ebzwf
 r4vJ8bEssS00XyFQhuv1gG82ev6Tu8DEyCSdg7CFvkSrHv19xK7s2AvSa8t8Cq2ux+g+
 DWjitlTOE0tXzXdee8aSLYl8CyS9NTAnBlNZXO4d2SLYFiJ/RLu6oOcYTz2Iw+p3kOZx
 L3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RLU8sNVXRSwQvcQ9Qv8D6rwZxuEAO9er5VHUrLUQ6lo=;
 b=Xb4LslDNF4goGzM93gODQ6lJKExKr63sev0TjbGoMaxiwzIPLDnyN7XmbgNrSOu4k8
 pbXcnPe95L8DOr8Au1d82c/2iPXWoM4uQFVRSqCC3MWh2/v3y6TfaZj97ol9bG4erAmY
 4B3TfaeurRsOwp+qUK0zDEWPBNxcbYzo15KoO63OWZYhOCCo3q+Ydp/Tg/qyycsV0tN3
 XAE2Q/XjLS32DeMg1vmpiBpOW+MeQMzfno9XdF4PFOs48iq2WhEx/6Vrtm6be+702LhI
 2omYKiW+gAbCMgEINEhPVpymlRbvmhaOfEwU8DG7lBGQAY8YScdrjjzSnnJzMK1EPOCs
 2OIg==
X-Gm-Message-State: AOAM5301Wrp16QMzyUi3wlNS+nU3CssWOAdCeKFXbg1NtVz8JGmNOTUv
 Vo41vPxYocmDg4zpUvIWHnszrFJnc498/jD2
X-Google-Smtp-Source: ABdhPJy+7Y+iue1isMhdjoV1Xc/lHilNv71BbVLNluwnVBC9ltGuPGGKpSfDIeSgGZuBP/PW2ylyQQ==
X-Received: by 2002:a17:90a:7c08:: with SMTP id
 v8mr14272367pjf.135.1612142198128; 
 Sun, 31 Jan 2021 17:16:38 -0800 (PST)
Received: from [10.8.1.62] ([89.187.162.118])
 by smtp.gmail.com with ESMTPSA id a37sm15527889pgm.79.2021.01.31.17.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 17:16:37 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Song Liu <song@kernel.org>
References: <20210126145247.1964410-1-hch@lst.de>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <9d376309-5d67-d859-1ad0-a669bdb75cdd@cloud.ionos.com>
Date: Mon, 1 Feb 2021 02:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l6X9O-00ARbk-Jn
Subject: Re: [f2fs-dev] misc bio allocation cleanups
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Christoph,

I tried with latest for-5.12/block branch, and got below issue when 
trying to create raid1 array.

[   80.605832] BUG: kernel NULL pointer dereference, address: 
0000000000000018
[   80.606159] #PF: supervisor read access in kernel mode
[   80.606159] #PF: error_code(0x0000) - not-present page
[   80.606159] PGD 0 P4D 0
[   80.606159] Oops: 0000 [#1] SMP NOPTI
[   80.606159] CPU: 1 PID: 207 Comm: mdadm Not tainted 5.11.0-rc5+ #37
[   80.606159] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS 1.10.2-1ubuntu1 04/01/2014
[   80.606159] RIP: 0010:bdev_read_only+0x0/0x30
[   80.606159] Code: 89 df 5b 5d e9 71 21 e7 ff 81 e6 ff ff 0f 00 48 c7 
c7 40 99 d9 9e e8 0f e5 04 00 eb a0 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 
00 <80> 7f 18 00 b8 01 00 00 00 75 11 48 8b 97 60 03 00 00 48 8b 4a 40
[   80.606159] RSP: 0018:ffffb14f405dfd38 EFLAGS: 00000246
[   80.606159] RAX: 0000000000000000 RBX: ffff9b0e0863b018 RCX: 
ffff9b0e01edc000
[   80.606159] RDX: ffff9b0e01b54c00 RSI: ffff9b0e0863b000 RDI: 
0000000000000000
[   80.606159] RBP: ffff9b0e01272200 R08: 0000000000000000 R09: 
0000000000000000
[   80.606159] R10: ffffee978004da40 R11: 0000000000000cc0 R12: 
ffff9b0e0863b000
[   80.606159] R13: ffff9b0e01f2cc00 R14: ffff9b0e0863b000 R15: 
0000000000000000
[   80.606159] FS:  00007f522ec65740(0000) GS:ffff9b0e7bc80000(0000) 
knlGS:0000000000000000
[   80.606159] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.606159] CR2: 0000000000000018 CR3: 0000000001364000 CR4: 
00000000000006e0
[   80.606159] Call Trace:
[   80.606159]  bind_rdev_to_array+0x2f7/0x380
[   80.606159]  ? cred_has_capability+0x80/0x120
[   80.606159]  md_add_new_disk+0x204/0x630
[   80.606159]  ? security_capable+0x33/0x50
[   80.606159]  md_ioctl+0xee7/0x1690
[   80.606159]  ? selinux_file_ioctl+0x143/0x200
[   80.606159]  blkdev_ioctl+0x1ff/0x240
[   80.606159]  block_ioctl+0x34/0x40
[   80.606159]  __x64_sys_ioctl+0x89/0xc0
[   80.606159]  do_syscall_64+0x33/0x40
[   80.606159]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   80.606159] RIP: 0033:0x7f522e564317
[   80.606159] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00 
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
[   80.606159] RSP: 002b:00007ffc3abd96f8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000010
[   80.606159] RAX: ffffffffffffffda RBX: 00005653ee690350 RCX: 
00007f522e564317
[   80.606159] RDX: 00005653ee694058 RSI: 0000000040140921 RDI: 
0000000000000004
[   80.606159] RBP: 00005653ee690410 R08: 00007f522e839db0 R09: 
0000000000000000
[   80.606159] R10: 00005653ee690010 R11: 0000000000000246 R12: 
0000000000000000
[   80.606159] R13: 0000000000000000 R14: 0000000000000000 R15: 
00005653ee694010
[   80.606159] Modules linked in:
[   80.606159] CR2: 0000000000000018
[   80.622996] ---[ end trace 22144b856a3c1001 ]---
[   80.623285] RIP: 0010:bdev_read_only+0x0/0x30
[   80.623501] Code: 89 df 5b 5d e9 71 21 e7 ff 81 e6 ff ff 0f 00 48 c7 
c7 40 99 d9 9e e8 0f e5 04 00 eb a0 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 
00 <80> 7f 18 00 b8 01 00 00 00 75 11 48 8b 97 60 03 00 00 48 8b 4a 40
[   80.624544] RSP: 0018:ffffb14f405dfd38 EFLAGS: 00000246
[   80.624788] RAX: 0000000000000000 RBX: ffff9b0e0863b018 RCX: 
ffff9b0e01edc000
[   80.625136] RDX: ffff9b0e01b54c00 RSI: ffff9b0e0863b000 RDI: 
0000000000000000
[   80.625449] RBP: ffff9b0e01272200 R08: 0000000000000000 R09: 
0000000000000000
[   80.625761] R10: ffffee978004da40 R11: 0000000000000cc0 R12: 
ffff9b0e0863b000
[   80.626112] R13: ffff9b0e01f2cc00 R14: ffff9b0e0863b000 R15: 
0000000000000000
[   80.626429] FS:  00007f522ec65740(0000) GS:ffff9b0e7bc80000(0000) 
knlGS:0000000000000000
[   80.626784] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.627035] CR2: 0000000000000018 CR3: 0000000001364000 CR4: 
00000000000006e0
Killed


Thanks,
Guoqing


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
