Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C612AC54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 14:08:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikSsq-00061I-5A; Thu, 26 Dec 2019 13:08:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <slava@dubeyko.com>) id 1ikSso-000618-9D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 13:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Mime-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XX+uD6u26dDFDC626LQb9o9CPegZnPxVtayuH9+QP+c=; b=HU7xOE5RbohuDdM8QrA56TUOwF
 8n/698xXy58bcb86XIQA93hXrSQz+BTANh2GTsviosTivQ+KbwCWbTAsICTzL5pDzfdOQHDOk0EEI
 neVClwdh+5GG/rrmSSB1R73k1UPnrkrHt/gDz0yS8jdUGzokFgckSBm724zDXtshe1rE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XX+uD6u26dDFDC626LQb9o9CPegZnPxVtayuH9+QP+c=; b=aUlVtJiFbCtc2vTgFwX7ktjuoN
 gV+v0de2QWbozaxHHEoalh8XeaV+XmTNs8IGK4X6NK8mXjB2/Q0ONlbMU8IMYkTrCbGzKrFb0sfOH
 LyzZqXi5kDYxsKbSDSbG8x+lWkfirkqcO7OqSZmIvElg07oEbO+bG0ZOf7ZLh+FqWLDs=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ikSsi-00FhLh-W0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 13:08:54 +0000
Received: by mail-lj1-f194.google.com with SMTP id o13so13288023ljg.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2019 05:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XX+uD6u26dDFDC626LQb9o9CPegZnPxVtayuH9+QP+c=;
 b=yHMEur933ZoxenJTF/O5tNptMe7y2msn2A4nAJAGHsuHLTSECG/y5MRFeXwBggLWqp
 /gqUCKjAPxCWnGxfttHxQxTr2RA4ccUj3nGztv6us+e2bFB3O6r1xR2yD1cLZH0LtVzp
 ChsZvQzl8eopBmxkxcXv9VU/PN/whUHhS01A2LOp6pkNxxw11O5CDI7yfNbaPUleWeL4
 ejLUj6YVTtb2TFohC6tHr2y2CHtudkODp0kVhuMMNYxD4GMEVxc/L27eOg1VWDEeBApJ
 dcT2nk5ikZMCf8qoCiec2jRp0ShuHC3OXNaaJl2eKI+8DXD4GbCMsHYyeqDiBYk36kT3
 wG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XX+uD6u26dDFDC626LQb9o9CPegZnPxVtayuH9+QP+c=;
 b=h5UcLLeslm23qrW0Knf3I/zEK1w0mtRdrA0w4yYudn7cnozJjDzYgjV8G6xsJ7MWBQ
 B2Bi0KMlBrQwMx0ijo3cg+ztXMb2X15+6kJ+T8DRN9+SpRXJFPMRLt8t41e+MvkTXpa5
 jlxhtzBehyPMDJk0MpKmXgqeps99WhtiWT7cvC4fBXKm8ZpMdsv32VR6qLIQ/Ar1ftiV
 1B44Jrmf84YAuq1zNkTTsiWoPoEfiHBRXjR8KFJPHKijSTC5S3YTGtuKwIgJN/dU3eTM
 GFPcHInLI1HY0BwizgXctHxBIhA/82YR2413EZSoiRJuWm+SapELZcJuOd/2HvlrqwhW
 YBKg==
X-Gm-Message-State: APjAAAXmN3jVXsXLmQ7MjP36RiYQKgadWFYs0/X6/0zsCFrUCGpt07tf
 5rE2mnj8QA22BvWYT8bnAlHC2g==
X-Google-Smtp-Source: APXvYqxvUQ91Q6j1NhdVDolhqYVyEmWyagtDXGJ4B+gMTFF1SRRbv75fwcnAT7i9EH20MjdxcZEHvw==
X-Received: by 2002:a05:651c:118b:: with SMTP id
 w11mr26296295ljo.54.1577365722046; 
 Thu, 26 Dec 2019 05:08:42 -0800 (PST)
Received: from msk1wst115n.omp.ru (mail.omprussia.ru. [5.134.221.218])
 by smtp.gmail.com with ESMTPSA id d25sm12356658ljj.51.2019.12.26.05.08.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Dec 2019 05:08:41 -0800 (PST)
Message-ID: <61e43dcb781c9e880fac95b525830fd384de122a.camel@dubeyko.com>
From: Vyacheslav Dubeyko <slava@dubeyko.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Dec 2019 16:08:40 +0300
In-Reply-To: <CAMuHMdV5VtR+vgYKcZtvcz16GPp9YLG_ecAeDsiNCreP4rYKjw@mail.gmail.com>
References: <20191223040020.109570-1-yuchao0@huawei.com>
 <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
 <1cc2d2a093ebb15a1fc6eb96d683e918a8d5a7d4.camel@dubeyko.com>
 <CAMuHMdV5VtR+vgYKcZtvcz16GPp9YLG_ecAeDsiNCreP4rYKjw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ikSsi-00FhLh-W0
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Geert,

On Thu, 2019-12-26 at 11:43 +0100, Geert Uytterhoeven wrote:
> Hi Vyacheslav,
> 
> On Wed, Dec 25, 2019 at 10:58 AM Vyacheslav Dubeyko <
> slava@dubeyko.com> wrote:
> > On Mon, 2019-12-23 at 09:41 +0100, Geert Uytterhoeven wrote:
> > > On Mon, Dec 23, 2019 at 5:01 AM Chao Yu <yuchao0@huawei.com>
> > > wrote:
> > > > As Geert Uytterhoeven reported:
> > > > 
> > > > for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);
> > > > 
> > > > On some platforms, HZ can be less than 50, then unexpected 0
> > > > timeout
> > > > jiffies will be set in congestion_wait().
> > 
> > It looks like that HZ could have various value on diferent
> > platforms.
> > So, why does it need to divide HZ on 50? Does it really necessary?
> > Could it be used HZ only without the division operation?
> 
> A timeout of HZ means 1 second.
> HZ/50 means 20 ms, but has the risk of being zero, if HZ < 50.
> 
> If you want to use a timeout of 20 ms, you best use
> msecs_to_jiffies(20),
> as that takes care of the special cases, and never returns 0.
> 

The msecs_to_jiffies(20) looks much better for my taste. Maybe, we
could use this as solution of the issue?

Thanks,
Viacheslav Dubeyko.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
