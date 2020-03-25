Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78A192C7F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 16:29:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH7y0-0005KG-7H; Wed, 25 Mar 2020 15:29:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jH7xz-0005K9-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s9o1YcFIkmflqsWaxbFgkp4az0GTva1vt7Qz7uMqp0U=; b=YMyIOcJ+Rr8C4vg8NarZtAMxBx
 EvB8JGg2TNJeWzWBQyhy8UwubFhbmadJx0SXqWSAEsAzHlrSpkv1bcsJ7+wQ+ia0Tgm/sCyIu4XlX
 A8F+wRVoChT6g3wLeZVLjgfhXCmyaZupxBbjmOzJVF2AgaItZk3LFWZPBuir4vqssK/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s9o1YcFIkmflqsWaxbFgkp4az0GTva1vt7Qz7uMqp0U=; b=D3ovFGdP7KO3XP+jcH2Fp4HzP3
 Y973xyA+7UaVQBV1b4FYrCkDxUREx1iMA7VHPmL8joR03J0Kh+97LcPIHdiIZb6MsTVA+Sd7CfBZG
 L/r4nyrHOBt1xr9AFqUwfRwXlvQV5P3KqGtWJLoZjCDlH01zVWryWIK2P1hAHTD34mjg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH7xu-00GXto-OG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:29:15 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3320520409;
 Wed, 25 Mar 2020 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585150140;
 bh=go8gp5X5K5OQI1lxpw0RRcIOUv+vtN2Xt4lszINpSVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYFuAIgDSELsbPZkjA7m82K7TGTMyRQ9dbkvkHK09E9tTOsldIet9fDTIy4pGYP4A
 Awd2zJ44Bpanck72XTb913evoBw8wuTDBPbvhMUIqZDRBVAn+QfGRMcRg7eayqe5ON
 dJKAAlOJ89KRGs1gVzN62bGnOQpdl5uQJqeOcv1Y=
Date: Wed, 25 Mar 2020 08:28:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: John <graysky@archlinux.us>
Message-ID: <20200325152859.GA65658@google.com>
References: <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
 <20200323041143.GC147648@google.com>
 <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
 <20200323150205.GA119787@google.com>
 <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
 <8b47e963-9e12-c945-e40e-a9d54a412d52@huawei.com>
 <CAO_nJAYWQWrWaQVfUmVpJGFtOeKKE76im-AkLUDTJm8DN4VAgA@mail.gmail.com>
 <2292eb8d-8357-227f-5448-d1d03b33c042@huawei.com>
 <CAO_nJAaNxRfC6SHQrr0BCDnA2H6HHkz1Pk5vJMCVfGqUSP0u1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_nJAaNxRfC6SHQrr0BCDnA2H6HHkz1Pk5vJMCVfGqUSP0u1Q@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH7xu-00GXto-OG
Subject: Re: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS
 partitions
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

On 03/25, John wrote:
> On Tue, Mar 24, 2020 at 9:01 PM Chao Yu <yuchao0@huawei.com> wrote:
> > I guess ssd should support discard, however I saw sdb was wrapped with device
> > mapper, which may have different character, just want to check that whether
> > device mapper disable the discard.
> >
> > If backup/restore is hard for you, how about let me add some logs on fstrim
> > interface? then we could retry fstrim to see where we actually fail.
> 
> I have an older totally different SSD for testing that seems to support discard:
> # hdparm -I /dev/sdc | grep TRIM
>    * Data Set Management TRIM supported (limit 8 blocks)
>    * Deterministic read ZEROs after TRIM
> 
> As I test, I created two f2fs partitions on this different SSD:
> 1) /dev/sdc2 normal F2FS
> 2) /dev/sdc3 encrypted with LUKS (dm-crypt) then formatted to F2FS
> 
> Results:
> 1) Regular F2FS
> # fstrim -v /regular
> /regular: 0 B (0 bytes) trimmed

This is normal.

> 
> 2) Encrypted F2FS
> # fstrim -v /encrypted
> fstrim: /encrypted: the discard operation is not supported

It seems dm-crypt has discard-related support, ie., "allow_discards", in ctrl.
But, FWIW, the target simply doesn't support discard at all.

# grep discards_supported drivers/md/*
drivers/md/dm-cache-target.c:	ti->discards_supported = true;
drivers/md/dm-clone-target.c:	ti->discards_supported = true;
drivers/md/dm-log-writes.c:	ti->discards_supported = true;
drivers/md/dm-table.c:	if (!tgt->num_discard_bios && tgt->discards_supported)
drivers/md/dm-table.c:		DMWARN("%s: %s: ignoring discards_supported because num_discard_bios is zero.",
drivers/md/dm-table.c:		 * 'discards_supported') or it relies on _all_ data devices having
drivers/md/dm-table.c:		if (!ti->discards_supported &&
drivers/md/dm-thin.c:		 * Setting 'discards_supported' circumvents the normal
drivers/md/dm-thin.c:		ti->discards_supported = true;
drivers/md/dm-thin.c:		ti->discards_supported = true;
drivers/md/dm-zoned-target.c:	ti->discards_supported = true;


> 
> Can we conclude that the device mapper is some how spoofing fstrim
> into thinking the device doesn't support trim?  Happy to hear your
> thoughts.
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
