Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E1345780
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 06:48:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOZuH-0003Xc-T8; Tue, 23 Mar 2021 05:48:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <butterflyhuangxx@gmail.com>) id 1lOZuG-0003XT-B5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 05:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yZZJL9tMbCU4qyjcbaauUNvkSw0s/ZCjez5b1Gyz4S8=; b=jG0bc10BTBhnC6lKPNL9YzuxEJ
 OIb1NHF+c3ddRBWujqPZtLyG/jQIAks+mKkSRlt3cM96cm4savpVyWGzY75fF9Zg+EjHy+Djh5A7a
 q4Qg2Q5d3qKT78WXiME7TXXVOYGtoc4k4kAPVYx4ONRANz1z0FFWKeGHoQtbPBJziXCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yZZJL9tMbCU4qyjcbaauUNvkSw0s/ZCjez5b1Gyz4S8=; b=gUPPb0cYprngb5eQOxgFROEBzo
 UhgY2+GfLJNTFpTblK/rgjtNU2/4BxB51UOcrMUIyjli/4XeGDAfayMeLKjjMD0x3gefjZ6Nif1cr
 TrmzihYeU7vb5MkZog45hS6fU7c+HcHSL+hKjbc1fhGMfWbGrs2tgtoGbmyRh95C5YvE=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lOZuE-0002rr-Co
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 05:48:44 +0000
Received: by mail-yb1-f172.google.com with SMTP id g12so9127543ybh.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Mar 2021 22:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZZJL9tMbCU4qyjcbaauUNvkSw0s/ZCjez5b1Gyz4S8=;
 b=oECYu6YlH6Xy3A+Q3DJws9QupqCPURtpETO8BHQJ73xnbY2Jw/t9myjwODxL5T3T0K
 BOSPs9kDXkeAJd6v5T+cbgc2vzFqQccYCF8uOL6uO6WdqLzdiq3SJzUJ+KmDrLSVO/fV
 Ico+21m0wwuoGcxTqVNJ3N8kR3cF/cYtjWHJHSWg/Zp9hP+5/bksxJQkrKjgUqIgJZq0
 N6T+VuWsl7QFwtOSAfTlPS/7WRFoNzvOp5/l+UUss659mLC1wmtlk6PxX+iCMSWJnCtv
 puum9NUw6Hp4qJxh8JYgyeGChieey6MfOAKJKlv25sUBFOdHdYhcCY5HxzfmL5LHcg7f
 XT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZZJL9tMbCU4qyjcbaauUNvkSw0s/ZCjez5b1Gyz4S8=;
 b=bDUG/c2sGGCFiZrpECd9eEKeNvTEvExwT97x+3cFb+AaF/7+mk8W2ib6/kp2b9rTO9
 wBZkANOMoecfzM86O0uyWhdDIsSmjrRL+1/Rsl5b05tOEwuJEjjhubtsRoT+O7WavEOY
 yY+QSogkJkLNHqmbo/VUX1b/CYR4zka5QaIIHzWPpOhbN9Y3p0HWyTYKtChtjpFLM+4x
 zZangImwsniFKWOWXPp29dekj53C5y0eoOfag/NgZgbVyOw5y3l9spOLAqyOOKO6Mvkm
 a/7kYHC0n6avhr1FDryaGl8PwDigaGB1UoHjIX7eVdqt3BeR5NsJNGO4fsxmGQGiR3bE
 bHjw==
X-Gm-Message-State: AOAM532ZFDnXKbC/Tei9EGHCqFAbgdqebG3PjJkeNDM8Km2uKk93O/bd
 4EYhwaPqdIejR0UIo7Q/fHNFkX7ILTHocr/XUPc=
X-Google-Smtp-Source: ABdhPJwXaegWtmXRx2z3HnIUdy2+xQ7NoaXw4TsiY606NDIxA7o1ioERcpkTu4NzhLvG6UeYSdXTzRZWpXiIAscT2+I=
X-Received: by 2002:a25:76c3:: with SMTP id r186mr3073528ybc.365.1616478516726; 
 Mon, 22 Mar 2021 22:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210322114730.71103-1-yuchao0@huawei.com>
In-Reply-To: <20210322114730.71103-1-yuchao0@huawei.com>
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Tue, 23 Mar 2021 13:48:26 +0800
Message-ID: <CAFcO6XMak8GSRqQbZ3nPdGvV_eM6DL0+P0z1X2y0G9hkrccaCg@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (butterflyhuangxx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lOZuE-0002rr-Co
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-bounds memory
 access
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
Cc: jaegeuk@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, I have tested the patch on 5.12.0-rc4+, it seems to fix the problem.

Regards,
 butt3rflyh4ck.


On Mon, Mar 22, 2021 at 7:47 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> butt3rflyh4ck <butterflyhuangxx@gmail.com> reported a bug found by
> syzkaller fuzzer with custom modifications in 5.12.0-rc3+ [1]:
>
>  dump_stack+0xfa/0x151 lib/dump_stack.c:120
>  print_address_description.constprop.0.cold+0x82/0x32c mm/kasan/report.c:232
>  __kasan_report mm/kasan/report.c:399 [inline]
>  kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
>  f2fs_test_bit fs/f2fs/f2fs.h:2572 [inline]
>  current_nat_addr fs/f2fs/node.h:213 [inline]
>  get_next_nat_page fs/f2fs/node.c:123 [inline]
>  __flush_nat_entry_set fs/f2fs/node.c:2888 [inline]
>  f2fs_flush_nat_entries+0x258e/0x2960 fs/f2fs/node.c:2991
>  f2fs_write_checkpoint+0x1372/0x6a70 fs/f2fs/checkpoint.c:1640
>  f2fs_issue_checkpoint+0x149/0x410 fs/f2fs/checkpoint.c:1807
>  f2fs_sync_fs+0x20f/0x420 fs/f2fs/super.c:1454
>  __sync_filesystem fs/sync.c:39 [inline]
>  sync_filesystem fs/sync.c:67 [inline]
>  sync_filesystem+0x1b5/0x260 fs/sync.c:48
>  generic_shutdown_super+0x70/0x370 fs/super.c:448
>  kill_block_super+0x97/0xf0 fs/super.c:1394
>
> The root cause is, if nat entry in checkpoint journal area is corrupted,
> e.g. nid of journalled nat entry exceeds max nid value, during checkpoint,
> once it tries to flush nat journal to NAT area, get_next_nat_page() may
> access out-of-bounds memory on nat_bitmap due to it uses wrong nid value
> as bitmap offset.
>
> [1] https://lore.kernel.org/lkml/CAFcO6XOMWdr8pObek6eN6-fs58KG9doRFadgJj-FnF-1x43s2g@mail.gmail.com/T/#u
>
> Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/node.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index caf43970510e..8311b2367c7c 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2790,6 +2790,9 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>                 struct f2fs_nat_entry raw_ne;
>                 nid_t nid = le32_to_cpu(nid_in_journal(journal, i));
>
> +               if (f2fs_check_nid_range(sbi, nid))
> +                       continue;
> +
>                 raw_ne = nat_in_journal(journal, i);
>
>                 ne = __lookup_nat_cache(nm_i, nid);
> --
> 2.29.2
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
