Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB2125EDB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2019 11:25:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihszr-0001hW-93; Thu, 19 Dec 2019 10:25:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1ihszp-0001hP-HA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 10:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qXY/bekMxM74rBpabc0IortWdwZ5JIbPWlc66tqqZzg=; b=QvsnR02K2uTfCeOJsK8LufEbwN
 rASDBsJ1B32lVUCJTrGZWSn5Zojyz2vfBFoOvnL8k9zRIF0Mmfr+lsk4Sd00l6gjn16Ane/EFqG1+
 Tptyh8VrjSr74QmNhUXcwOFJISu8uze2XYtlWsKUFIeAE+JMuN214Bqe8Kv6iQ6VyZ8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qXY/bekMxM74rBpabc0IortWdwZ5JIbPWlc66tqqZzg=; b=U3TemrI8FPwfgVS/F8eYR/uf3x
 ZelX2JqO/3LgAURmKafRMYVCBw/kmFoWLIoOqxApsEmHwJxez6lDIAGWN5a2WfePQ6gClvqAEu9XF
 FayO0SyLrtLYDVaCZpxoaAm9yjqHY3CjU7B0XMbmMgXCsp6hNTxNdYIq2ha9m8k0ugxQ=;
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihszo-009dSC-3S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 10:25:29 +0000
Received: by mail-ot1-f68.google.com with SMTP id h9so4058724otj.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Dec 2019 02:25:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXY/bekMxM74rBpabc0IortWdwZ5JIbPWlc66tqqZzg=;
 b=MujBAacw1IPfdGSwTESaiyekEepK9oIkQfP+dcbxPVKiZd9BaD2B2qtXWeUGb1Fwd2
 ahqFzKDBDWXF1C/ioMYQ4pgOl2KhEkYZuuNC+wbEU5upNTi7hXJ2z1T/U784oaF92HSg
 7Zgxjtdp8RJmVGacsnwfR1Sqs7fk8F7yGkmNmGC/pZnSrx+PLpybKRsyA8mq/iSw0n6K
 G8D69qXXGBD2dQdXG5lGHxaM0bKOWN15VIpmARwFeOpBeIhLjW9ABABeHh7UmVWY4u63
 IRhp2biNwLmeWzzQKGe6mzLIMWA1xXiCokNIrTsBEmKFTzXDJH3pofdNJqQDv8HSeU1a
 c1XA==
X-Gm-Message-State: APjAAAU2ePIcJ+A9DE7k0n1rFw8UwYh5M/PwFrUcqr9yMCETemV502s3
 NrAkbHM9ofEXFIyS97sXbMihpiNDzwt7GzfP3KA=
X-Google-Smtp-Source: APXvYqyYLv7usVsn93H5qh2dCkD0JPqTwk1wDn60NmEe2dX2BaCHIZn8ydrShg0SGD5KCWpvEC03FH33JtVmWwwkDh0=
X-Received: by 2002:a05:6830:2141:: with SMTP id
 r1mr7956333otd.39.1576751122361; 
 Thu, 19 Dec 2019 02:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20191216062806.112361-1-yuchao0@huawei.com>
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2019 11:25:11 +0100
Message-ID: <CAMuHMdUDURUQJjJU+2QQgY1hXN8ndJ6dwc-PF1CWc-HAio0sKA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.68 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihszo-009dSC-3S
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Linux-Next <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Mon, Dec 16, 2019 at 7:29 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> This patch tries to support compression in f2fs.



> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c

> @@ -667,6 +719,24 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>         return err;
>  }
>
> +int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> +{
> +       u64 free_from = from;
> +
> +       /*
> +        * for compressed file, only support cluster size
> +        * aligned truncation.
> +        */
> +       if (f2fs_compressed_file(inode)) {
> +               size_t cluster_size = PAGE_SIZE <<
> +                                       F2FS_I(inode)->i_log_cluster_size;
> +
> +               free_from = roundup(from, cluster_size);

This is a 64-by-32 or 64-by-64 division, causing a link failure on
32-bit platforms:

    fs/f2fs/file.o: In function `f2fs_truncate_blocks':
    file.c:(.text+0x1db4): undefined reference to `__udivdi3'

Please use DIV_ROUND_UP_ULL() instead.

Reported-by: <noreply@ellerman.id.au>

> +       }
> +
> +       return do_truncate_blocks(inode, free_from, lock);
> +}


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
