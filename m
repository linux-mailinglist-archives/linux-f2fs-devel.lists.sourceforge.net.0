Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520E781DFB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Aug 2023 15:44:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qXiiu-0004aw-81;
	Sun, 20 Aug 2023 13:44:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1qXiis-0004ap-7C
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 20 Aug 2023 13:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIc6ZgR3jaW2rTLhnT91fRRNt6h6j7md3wuAMtiDu1Y=; b=XvtcU6kl9oqaqjDyW3zeD8EHUx
 gd8iUoXpPAxhAozUBSTN5gMZxolNgC2X+JEjmrCX46/GSlWaTNEZ+7fwTSYmCiWVZ1S/H2mr0xgC4
 b1G17EQux+KCoczMaVvZ4Qz+ju8RSdL8umH52vQIvU5rjWdOvd8zJlN5aM3a6v2bJZ0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oIc6ZgR3jaW2rTLhnT91fRRNt6h6j7md3wuAMtiDu1Y=; b=Gzv04DD6oFTf3eRJVbi0lI/NIi
 McGWc36NItulGXmC/Juo15LobqYCl42kN91d83XOLIZMB5k2q9+enpkkYIpnTWucd+wEIaIWOehfs
 Z1HYLwVmR18Q2Hv27F4T9/DRWYepW/TlngMJ7GKySIgH9yL2flF0bd8qI/Qtr0kNqNfU=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qXiio-00081z-QJ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 20 Aug 2023 13:44:06 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso4013545ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 20 Aug 2023 06:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692539037; x=1693143837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oIc6ZgR3jaW2rTLhnT91fRRNt6h6j7md3wuAMtiDu1Y=;
 b=f6d09OqsK3KI72hr+oLpBiWLs19u4qrlaFRXzE9H80N/dVnTFN4I5KmSSVBBLfTrXv
 EsmQSTcz6OcA8U2WHnU47u/179AKYbZSaHWicv7OmsFSkpXiWRGO7XALKBIU8g9YBXn7
 CT1DNUV7MZAURk8DlrDiqiWhA7Lw7TrL17gBM3Z4mGwZCBeq+TSVhrcpfkdYMzsOXGUj
 hDuvd+gkU8hQgOq6+x6UPP2FcTfDiMWTSq8bNrc9w0AYVJe5nO7mT+hjCUQJHOGR1aFC
 Cmvo7Ww7KXiyA+ZJfsxSVI+mgG1kD8Zv4gJWNvmP8WiPOMdlEAKewgSXx0s5AQHxJyiu
 cwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692539037; x=1693143837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oIc6ZgR3jaW2rTLhnT91fRRNt6h6j7md3wuAMtiDu1Y=;
 b=dkbw5nTKvNc56+Kew38orw6DIMWnbWDECEYJW4cRI3R7yolvID2r4C9aArtvHNEgW6
 41qFuZKD5y4Qd4tW21EjmkmZ6/JjUKdIdsw5RH7XhqGkLg839Ssbu5f1JHv3timjMnxo
 S8IhoVAuucG72EURveidYn8O0rV0a8xBCc1mQmHKrByzBXpzbNQikhia91tLzbncRG1P
 cg1mSioDZhfTPhqtq38XCki5a/j7IljF3qbdkRvmyOApBG7i6v+nrLMIWhLcKPLWzssX
 AUiqURby65SsVc7ehY58G3AHceL/tCH3Ia3nraf0by376zSo1+XxgEPMFTbAB1sHyJSH
 LA6g==
X-Gm-Message-State: AOJu0Yy5P5d0NFlXpHl3QGyc8hCW2XYMcmqHADWlPSVoAoezVqniRjjF
 Pr6eAyRbMc0TVgXi3iM70mWEVdLEuyYWxw==
X-Google-Smtp-Source: AGHT+IHAycM2Mi8Cc+F3dGF+HT//EpUe+8fNUyOkqX+v9g+xe3qaKMj2uX4E23CsfHy4deM51XuXPQ==
X-Received: by 2002:a17:902:70cc:b0:1bc:9c70:b955 with SMTP id
 l12-20020a17090270cc00b001bc9c70b955mr2315532plt.28.1692539036968; 
 Sun, 20 Aug 2023 06:43:56 -0700 (PDT)
Received: from [192.168.50.127] (awork083154.netvigator.com. [203.198.87.154])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f7c600b001bc6fe1b9absm3550133plw.276.2023.08.20.06.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Aug 2023 06:43:56 -0700 (PDT)
Message-ID: <f93c210b-6b55-98b1-9b72-a0a5a81b9046@gmail.com>
Date: Sun, 20 Aug 2023 21:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, chao@kernel.org
References: <791fbf71-093e-3ef5-b02b-6d6bba72b57f@kernel.org>
 <20230807023823.49564-1-bo.wu@vivo.com>
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <20230807023823.49564-1-bo.wu@vivo.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping ... On 2023/8/7 10:38, Wu Bo wrote: > On 2023/8/6 10:05,
 Chao Yu wrote: > >> On 2023/7/31 9:26, Wu Bo wrote: >>> This patch has been
 tested with xfstests by running 'kvm-xfstests -c >>> f2fs -g auto' with [...]
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -4.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qXiio-00081z-QJ
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: move fiemap to use iomap framework
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
Cc: jaegeuk@kernel.org, daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ping ...

On 2023/8/7 10:38, Wu Bo wrote:
> On 2023/8/6 10:05, Chao Yu wrote:
>
>> On 2023/7/31 9:26, Wu Bo wrote:
>>> This patch has been tested with xfstests by running 'kvm-xfstests -c
>>> f2fs -g auto' with and without this patch; no regressions were seen.
>>>
>>> Some tests fail both before and after, and the test results are:
>>> f2fs/default: 683 tests, 9 failures, 226 skipped, 30297 seconds
>>>     Failures: generic/050 generic/064 generic/250 generic/252 generic/459
>>>         generic/506 generic/563 generic/634 generic/635
>> Can you please take a look at gerneic/473 ?
> This generic/473 case is failed on xfs too. It's an issue of iomap.
>
>> generic/473 1s ... - output mismatch (see
>> /media/fstests/results//generic/473.out.bad)
>>      --- tests/generic/473.out    2022-11-10 08:42:19.231395230 +0000
>>      +++ /media/fstests/results//generic/473.out.bad    2023-08-04
>> 02:02:01.000000000 +0000
>>      @@ -6,7 +6,7 @@
>>       1: [256..287]: hole
>>       Hole + Data
>>       0: [0..127]: hole
>>      -1: [128..255]: data
>>      +1: [128..135]: data
>>       Hole + Data + Hole
>>       0: [0..127]: hole
>>      ...
>>      (Run 'diff -u /media/fstests/tests/generic/473.out
>> /media/fstests/results//generic/473.out.bad'  to see the entire diff)
> The layout of the test file is:
> fiemap.473:
>   EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>     0: [0..127]:        hole               128
>     1: [128..255]:      5283840..5283967   128 0x1000
>     2: [256..383]:      hole               128
>     3: [384..511]:      5283968..5284095   128 0x1000
>
> And the test command is:
> xfs_io -c "fiemap -v 0 65k" fiemap.473
>
> So the difference is about when to stop traversal the extents.
> The iomap stop when the length beyond it is requested from fiemap command:
> ...
> xfs_io-7399    [001] .....  1385.656328: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 15, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
> xfs_io-7399    [001] .....  1385.656328: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 16, start blkaddr = 0x3400, len = 0x1, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
>
> While previous logic is that stop traversal until next data extent is found:
> ...
> xfs_io-2194    [000] .....   116.046690: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 15, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
> xfs_io-2194    [000] .....   116.046690: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 16, start blkaddr = 0xa1400, len = 0x10, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
> xfs_io-2194    [000] .....   116.046691: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 32, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
> ...
> xfs_io-2194    [000] .....   116.046706: f2fs_map_blocks: dev = (254,48), ino = 5, file offset = 48, start blkaddr = 0xa1410, len = 0x10, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
>
>> Other concern is, it needs to test this implementation on compressed
>> file,
>> since the logic is a little bit complicated.
> To be honest, all the complex logic is try to handle compressed file situation.
>
> I used enwiki8 dataset to test compressed file:
>      mkfs.f2fs -f -O extra_attr,compression f2fs.img
>      mount f2fs.img f2fs -o compress_algorithm=lz4,compress_log_size=3,compress_mode=user
>      touch compressed_file
>      f2fs_io setflags compression compressed_file
>      cat enwiki8 > compressed_file
>      f2fs_io compress compressed_file
>      f2fs_io release_cblocks compressed_file
>      xfs_io -c fiemap compressed_file | awk '{print $2 $3}'
>
> enwiki8 download url: http://mattmahoney.net/dc/enwik8.zip
>
> And the result is:
> --- a/orig
> +++ b/new
> @@ -1750,8 +1750,8 @@
>   [111872..111935]:323448..323511
>   [111936..111999]:323488..323551
>   [112000..112063]:323520..323583
> -[112064..112087]:323560..323583
> -[112088..112127]:53248..53287
> +[112064..112095]:323560..323591
> +[112096..112127]:53248..53279
>   [112128..112191]:53256..53319
>   [112192..112255]:53288..53351
>   [112256..112319]:53328..53391
> @@ -2078,10 +2078,8 @@
>   [132800..132863]:65408..65471
>   [132864..132927]:65448..65511
>   [132928..132991]:65488..65551
> -[132992..132999]:65528..65535
> -[133000..133007]:65528..65535
> -[133008..133039]:69632..69663
> -[133040..133055]:hole
> +[132992..133007]:65528..65543
> +[133008..133055]:69632..69679
>   [133056..133119]:69664..69727
>   [133120..133183]:69704..69767
>   [133184..133247]:69744..69807
>
> The first diff is I count the space of COMPRESS_ADDR belong to the head of one
> compressed cluster while previous count at the rear of cluster.
> The secound diff show the previous print a 'hole' in one cluster. I think a
> compressed cluster should not include a 'hole', so there may have a bug before.
>
> Also, as discussed in this thread:
> https://lore.kernel.org/linux-f2fs-devel/ZJmBmt3WmUpWR3+2@casper.infradead.org/T/#t
> If f2fs can support async buffer write, the performance can be greatly improved
> when using io_uring.
>
> I think it's time to move f2fs to iomap framework. And really looking forward
> to hearing your opinion on this.
>
> Thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
