Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8D12A723
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Dec 2019 10:59:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ik3RY-00066s-OQ; Wed, 25 Dec 2019 09:59:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <slava@dubeyko.com>) id 1ik3RW-00066k-So
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Dec 2019 09:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Mime-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BimAE/wzLaoJ+Q76OTXF2tSOsXH3zuFfkC4OKhHyt4M=; b=OdQSOezkxtCobC5O5ZFE8Df48B
 KY2zHe8VpRIGJ4/PniFFT4SNqWf+byJ9uumpWJMliFbM/35g3Zic6eiLo0ErMPW+sToJQRDcaYYPw
 iKfqCOtCWBNkUmvL69EhUa5ZsbSOoanHOMSmZSg+3K0ssZR7nTIP0q3u5hEfITZ22Trs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BimAE/wzLaoJ+Q76OTXF2tSOsXH3zuFfkC4OKhHyt4M=; b=GV/fRC+FI1P2rJteupILh0ektC
 GkIwihUxOa3v3oh5pcJ9p0qMhzDVCimCokkkBAQ0OCQBcvKng/ItJSFHjJovvvdW8uIgI/jgLz90Z
 VhpCyxHsMDcA7dIbRuST62JGtnb6tH7zXoM3MIyBS2njId6CQ7aGUNJYKdKuTEoJrPMg=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ik3RP-00F1ED-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Dec 2019 09:59:02 +0000
Received: by mail-lj1-f195.google.com with SMTP id w1so573930ljh.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Dec 2019 01:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BimAE/wzLaoJ+Q76OTXF2tSOsXH3zuFfkC4OKhHyt4M=;
 b=Sawr3RJ0XQ4kFSYodnBYQ2C4OYnmS+dTU+GADcUfRFioyeQiYpsoojrV+bcKjvKhkr
 l5dBEP+1n70Gzok8JpiiQwOAZWyZN7V5YQeRXeSuBekS2vKw4/Zxn14sGbGYe6g8nYqt
 v8l8Rn/pmzy+OZuKWPrGBBbT4tyAe4GXN5bOSWIZ1Za4RNOlmEOYKsaaEKrl1bOG+Cpr
 AjrHMzLWPRePRZi4XsrgxD7ngKSSbETAa8A/oQg+/iiIBaqXioTP5j1+JeYe86C6QXxb
 BcIECzCTzgUgS4BC9DngU5jnB78k7UkDKW4Xsynzc++yrPCVw6RiMO7Mlzhu3VsY/epv
 pDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BimAE/wzLaoJ+Q76OTXF2tSOsXH3zuFfkC4OKhHyt4M=;
 b=ftgqesBh3DGXZZlGTs9kkdG+dHLOk43kfsAno9W4T4/BJQ43BJR7V0F8yCCfdm3K8H
 q+Ph6zQnXRV8z0TPIKrcoTuDbwP4Dtxk9mBNXBVxzSpziHYXRSeshkcu0BgQKlrx3VJL
 NW1JQUfa50UBXlIN1q+CaDzdCdSrZpeFWeOS5gCnCNEAjseu0B2lxiMfLWG4/PNMyxug
 H98SqcsPSI6LTmCrf+pbbwwpB5wcyzEpshoq46PCR5oyElGRmQApGZXzmUpDtnqYt4ah
 IDsau/OItDNmrP9tm4xm41kfqtJg88i++9ivOtPP4XY1pdT9gVCVZX5DvK4ItqQZPnnl
 t6kg==
X-Gm-Message-State: APjAAAUetbFGZ+xrCGtltJk3q1qN+oHEhQMkbFl5z9KC4KDYK9M/OelT
 F7jc0JCW+A3ykAx+PQaZTP3yOQ==
X-Google-Smtp-Source: APXvYqyVCaK3RhWsqGk8ogHzgSadR0YNeuWFjHPQK3y6zRy7veQsw5x+SJ1Znlr403nf6FVtEcldXA==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr22412615ljg.149.1577267929007; 
 Wed, 25 Dec 2019 01:58:49 -0800 (PST)
Received: from msk1wst115n.omp.ru (mail.omprussia.ru. [5.134.221.218])
 by smtp.gmail.com with ESMTPSA id t9sm11127171lfl.51.2019.12.25.01.58.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Dec 2019 01:58:48 -0800 (PST)
Message-ID: <1cc2d2a093ebb15a1fc6eb96d683e918a8d5a7d4.camel@dubeyko.com>
From: Vyacheslav Dubeyko <slava@dubeyko.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Chao Yu <yuchao0@huawei.com>
Date: Wed, 25 Dec 2019 12:58:47 +0300
In-Reply-To: <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
References: <20191223040020.109570-1-yuchao0@huawei.com>
 <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ik3RP-00F1ED-Qi
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce DEFAULT_IO_TIMEOUT_JIFFIES
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
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2019-12-23 at 09:41 +0100, Geert Uytterhoeven wrote:
> Hi,
> 
> CC linux-fsdevel
> 
> On Mon, Dec 23, 2019 at 5:01 AM Chao Yu <yuchao0@huawei.com> wrote:
> > As Geert Uytterhoeven reported:
> > 
> > for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);
> > 
> > On some platforms, HZ can be less than 50, then unexpected 0
> > timeout
> > jiffies will be set in congestion_wait().
> > 


It looks like that HZ could have various value on diferent platforms.
So, why does it need to divide HZ on 50? Does it really necessary?
Could it be used HZ only without the division operation?

Thanks,
Viacheslav Dubeyko.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
