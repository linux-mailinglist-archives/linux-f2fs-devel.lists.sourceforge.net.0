Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC6241706
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 09:16:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5OWI-0006dy-9Q; Tue, 11 Aug 2020 07:16:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1k5OWD-0006dh-QB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 07:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xrv8XZP8H/ArYsyMct/psi+RXUwQ58EUZbmfZHuJsQY=; b=L07n2bs+En6x2kg6TzSNCK7udj
 Fbi18zkKDmkz4qpsHCUEJQ2quLa51rwEnSTXM64Ld+7m/sEhfEaMuS+WlZQVLLHa0kQehNavX0/iS
 7DTi5jKGV3crtOu4I2SFtrV5SLGkojAtxAExnTbcRZh+V/38kjGA/tZ3MZ2w5JV411o0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xrv8XZP8H/ArYsyMct/psi+RXUwQ58EUZbmfZHuJsQY=; b=mDU4qbUfy7nQ7VCtcpbBdvISwa
 lEBmBNQ2HjGaOiIwR7HjHFPU1btE8lbYXbI1YIKIWdcAZsmEU4F0R+jLxRekJdoZgYl5CD2ojmZr+
 JshHGfbGffYDR5PnxIpK1z3Wcu2vlabkgduJ67v84zje0wRs9sWDE+a/3pr+pF+eIlDI=;
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1k5OWB-007aLj-Nw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 07:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597130166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xrv8XZP8H/ArYsyMct/psi+RXUwQ58EUZbmfZHuJsQY=;
 b=KD96iiW7TtRROg+YmLBdRODQG95b0wcP5+/5o2baJfGFS03jNPcVvGGHmrjRiTBmEY5ODJ
 94AOeeQOi0kE5C5keAybIAtcrrrEYcpmg/IJJu4teGhjUEpIxkGYM9zhfF737J525o1mq0
 bquuBFpKhLF6z7Yn7deXU4VAvHHncUA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-8vSRreQsN5O7pNL9nbU_bw-1; Tue, 11 Aug 2020 03:16:04 -0400
X-MC-Unique: 8vSRreQsN5O7pNL9nbU_bw-1
Received: by mail-pj1-f69.google.com with SMTP id t13so1712762pjd.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 00:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xrv8XZP8H/ArYsyMct/psi+RXUwQ58EUZbmfZHuJsQY=;
 b=c0OAwPJO2f6w+V0psaoKknfxvzoLi8PiugqNZn5yhYp2NBjdmB0xKVXoXzsXAjHzxQ
 W7n05nVs4UNy8A830yWM30eALkfwqSOLflSZPNayJkQneFuJ0tkkca4uTxKraJkT9MPF
 42eoa8qOs7tZxrC8bLHMoFiraZbDuzA1GBWsoSID1vMUgAFk3au/MR+knc9FnxOtimD4
 q5MKlEQs4uQGqztbO/jgGFVHq2uZyPmxxuOQUHg3MW6MTNxXhatrgrCSW6pa9mjz8iuT
 zQ6LXg42yTr6ph+XXL5eoscpXTZn+2zTeIpZQ7klcZ4IZ5GSQCfXst4SrA+OAUc5fFh7
 5Bwg==
X-Gm-Message-State: AOAM532KQrgjLu0skUuPIO1HJqPYFpcaesul5jnuK2K6v8ZqYhECBd6b
 ngsh3nD4aUi/uDF4mq1HO1l2uAqQs0Qim+dB97CojFAdRl1d73gil91GzDgHu294PKugRR2vVdV
 JzDiEQuqQnpRIqay1fBpQ20tTWAi1dsXFeDpu6w==
X-Received: by 2002:aa7:8c42:: with SMTP id e2mr4736673pfd.181.1597130163792; 
 Tue, 11 Aug 2020 00:16:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf1G31CFvGYO57m79ydCITVqNOalSz5r3SbZByWQFEL0s50DMTAQKFGbGKQ3vkFoGu7rqr6g==
X-Received: by 2002:aa7:8c42:: with SMTP id e2mr4736653pfd.181.1597130163573; 
 Tue, 11 Aug 2020 00:16:03 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n13sm1685916pjb.20.2020.08.11.00.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 00:16:03 -0700 (PDT)
Date: Tue, 11 Aug 2020 15:15:52 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200811071552.GA8365@xiangao.remote.csb>
References: <20200811033753.783276-1-daeho43@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200811033753.783276-1-daeho43@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k5OWB-007aLj-Nw
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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

On Tue, Aug 11, 2020 at 12:37:53PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> By profiling f2fs compression works, I've found vmap() callings are
> bottlenecks of f2fs decompression path. Changing these with
> vm_map_ram(), we can enhance f2fs decompression speed pretty much.
> 
> [Verification]
> dd if=/dev/zero of=dummy bs=1m count=1000
> echo 3 > /proc/sys/vm/drop_caches
> dd if=dummy of=/dev/zero bs=512k
> 
> - w/o compression -
> 1048576000 bytes (0.9 G) copied, 1.999384 s, 500 M/s
> 1048576000 bytes (0.9 G) copied, 2.035988 s, 491 M/s
> 1048576000 bytes (0.9 G) copied, 2.039457 s, 490 M/s
> 
> - before patch -
> 1048576000 bytes (0.9 G) copied, 9.146217 s, 109 M/s
> 1048576000 bytes (0.9 G) copied, 9.997542 s, 100 M/s
> 1048576000 bytes (0.9 G) copied, 10.109727 s, 99 M/s
> 
> - after patch -
> 1048576000 bytes (0.9 G) copied, 2.253441 s, 444 M/s
> 1048576000 bytes (0.9 G) copied, 2.739764 s, 365 M/s
> 1048576000 bytes (0.9 G) copied, 2.185649 s, 458 M/s

Indeed, vmap() approach has some impact on the whole
workflow. But I don't think the gap is such significant,
maybe it relates to unlocked cpufreq (and big little
core difference if it's on some arm64 board).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
