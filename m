Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7923125E4E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2019 10:54:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihsVc-000559-Bn; Thu, 19 Dec 2019 09:54:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1ihsVZ-00054y-MO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 09:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZUKPu+3lzNZNRX0GPct7+0OF4dHxMBRWmyHMUXjgvFU=; b=e4coFBXxQyeGjFjs+h41q8bUO3
 dg01iyZNvI0nlsAmBbUvk9pQpcedu089IgkQgFzsglyAuc95F07WP5eqC4tbuoDy4rpUF3G6k/mHq
 T3QVuIxl0Wl0iFZKkzjppdGzdHA1L4djf/sLnfgZMfTAbV4qI1hdbOKZfkjQXTaE5aM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZUKPu+3lzNZNRX0GPct7+0OF4dHxMBRWmyHMUXjgvFU=; b=mbc2o4yuUILBcxuONS9zNTjnNa
 XgNE6ww9MHIBiIOImdLZOzOPpurQTXpmrczBbE5C02acu3A3Dm1KTv+rL+UxbKAagoP7A5aL+++EH
 +nHP48+B/AYggxcAhy1dTmn+5RArloz2P/QrKJo75jhhA8iyunpXJiD86JEdZ0B6F3mA=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihsVW-006vtw-0D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 09:54:13 +0000
Received: by mail-oi1-f194.google.com with SMTP id 18so1685534oin.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Dec 2019 01:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUKPu+3lzNZNRX0GPct7+0OF4dHxMBRWmyHMUXjgvFU=;
 b=cEUYZoUYsaP3hlUTJLLoqJvw1mUAUGzOiqJUJuMkdy41QMw0XfEigHJHqnIY7Ny+Ty
 L1d1VI2LuLDN6qKfcsaGEXv8iSPKd7F621LHnBL437xs3arAM40fYCpGQWIfnPCl4Abd
 Kn8+TopV4HeLZtv95OwMCICOj3wjZVWCoZR47X5KEOF1hVBzqj5n/M0OBBB9PMlxXSp+
 WQq5/1PT4Ib8muwYvKg7YYVfoSI5RJXyMLVgs77KtRG+gdOrWdv7+eF/k9X/ce/1yn73
 Mxd5tQ1RrLqTlxaOxeKssqG54UmuyjSU37KVj+gi9QWuMuJejC4o1AtE9TUnMBK+Qf7r
 WbZw==
X-Gm-Message-State: APjAAAVk4e3crNQmxXk/mHCcgSJ+9xqfo39nr+SayAMTizfoiEh2twUT
 thiH1fC3qsj+5pEO+SXh5hGZ2cxLHwXPzRgQn+g=
X-Google-Smtp-Source: APXvYqxGRCQ+HGG1eHMEhsUuHEO4jMulwydAvw7vvY4zmIqXYi1z525a9XEwSsmQKa80af+gnHaisBN2rlN7G8IGYk0=
X-Received: by 2002:a05:6808:8ec:: with SMTP id
 d12mr1679787oic.131.1576749244150; 
 Thu, 19 Dec 2019 01:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20191216062806.112361-1-yuchao0@huawei.com>
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2019 10:53:52 +0100
Message-ID: <CAMuHMdVvqccd_iwdz8khxYKUjrD-pnBYggagVCYZyNmbZxB9Tw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihsVW-006vtw-0D
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 16, 2019 at 7:29 AM Chao Yu <yuchao0@huawei.com> wrote:
> This patch tries to support compression in f2fs.

> +static int f2fs_write_raw_pages(struct compress_ctx *cc,
> +                                       int *submitted,
> +                                       struct writeback_control *wbc,
> +                                       enum iostat_type io_type,
> +                                       bool compressed)
> +{
> +       int i, _submitted;
> +       int ret, err = 0;
> +
> +       for (i = 0; i < cc->cluster_size; i++) {
> +               if (!cc->rpages[i])
> +                       continue;
> +retry_write:
> +               BUG_ON(!PageLocked(cc->rpages[i]));
> +
> +               ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
> +                                               NULL, NULL, wbc, io_type);
> +               if (ret) {
> +                       if (ret == AOP_WRITEPAGE_ACTIVATE) {
> +                               unlock_page(cc->rpages[i]);
> +                               ret = 0;
> +                       } else if (ret == -EAGAIN) {
> +                               ret = 0;
> +                               cond_resched();
> +                               congestion_wait(BLK_RW_ASYNC, HZ/50);

On some platforms, HZ can be less than 50.
What happens if congestion_wait() is called with a zero timeout?

> +                               lock_page(cc->rpages[i]);
> +                               clear_page_dirty_for_io(cc->rpages[i]);
> +                               goto retry_write;
> +                       }
> +                       err = ret;
> +                       goto out_fail;
> +               }
> +
> +               *submitted += _submitted;
> +       }
> +       return 0;
> +
> +out_fail:
> +       /* TODO: revoke partially updated block addresses */
> +       BUG_ON(compressed);
> +
> +       for (++i; i < cc->cluster_size; i++) {
> +               if (!cc->rpages[i])
> +                       continue;
> +               redirty_page_for_writepage(wbc, cc->rpages[i]);
> +               unlock_page(cc->rpages[i]);
> +       }
> +       return err;
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
