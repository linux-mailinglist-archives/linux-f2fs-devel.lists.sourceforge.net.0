Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EA63517A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 08:52:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxkYO-00011Y-7B;
	Wed, 23 Nov 2022 07:52:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oxkYN-00011S-8I
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 07:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P19tg7f0hwXERpV/M7ELvgDfUdF9U5SKIaEHruEwVZ8=; b=cVLRGS6+XzOlhZK10hzqPKRi4E
 /hF+22lg7+VE4ZnSqlSyLwFjm5j3HpjTeuR2pl9Hk23x+4REb07X7g3f2uOt+EPkP5z2/kNmKZxxe
 Uds+ICn9IqVq2gsqZ8Kdav2loUqng5TAhpf1ohsOMXawbYYqSB3TFsXV+s+RAe5BuEXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P19tg7f0hwXERpV/M7ELvgDfUdF9U5SKIaEHruEwVZ8=; b=MRpMAe3loKul1dBjZ5Tlev4ciF
 WsgKB8BoWd2QVtEZ/r6AIvrZmrpjGfbYAppBF+qRHlXxeVCZ1O/nq/0U/TcYjqSowxX3ScQLKgWZg
 UfydC0Ikob1zGugCf+SUF+70d7kolZOoDnKphRY+7ppXv6/zF8vbe6dj5R36Fg5nR7RI=;
Received: from mail-yb1-f179.google.com ([209.85.219.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oxkYK-0003PR-03 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 07:52:19 +0000
Received: by mail-yb1-f179.google.com with SMTP id n189so7587269yba.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P19tg7f0hwXERpV/M7ELvgDfUdF9U5SKIaEHruEwVZ8=;
 b=I95petThg7UhoVdm4lGriYYMJnxYtrjHaIKc1ojn69HShPmb7N9LE53ranGPKehWXD
 Ai7zjiizdZ5fTOLoFalxm72zrYF0BWSX6/g9h4YwnEPMtfXAHNNOGxe2Rr9tQHPPv4HT
 OmTbe1DlwFoX6z67skQJ+vP08jCgR4Y+hk6ui+6u1V3x67bNsFc82XsVMiHvB9gcFW0v
 NLoWDWwPcd8/yfCWCgp3udpc/bEFUjZjVuLYZLdBas4KrJqZjIPSW72Ac2PgQ4w7qvt+
 kyBz/SXl0PZDEeFEnI34l4ov9q4NPNDW/n+y81wrZrHINxDHDaMUZzsQf5jGAA6II0Cu
 7oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P19tg7f0hwXERpV/M7ELvgDfUdF9U5SKIaEHruEwVZ8=;
 b=lOo3ymKiB0XczT7HHTJIu/AeglZGBtgDnTQcec4xSCzqqo9nd1SqmhDC9yWy6EPg7A
 wwURKY18vwuXDzVWasjzGt8Mkv1K9XKCAaWUcgtBxeWWKGyEcAQKscn7ECWh1SmSg3Pc
 OgH9CS5qnjxIIhi2WatGaoY39iRYBnBDmBmbtFo8X1IfhYLgq+ppMcUKpg9r0zAdFE3s
 lSH0qSuvM63ictIl14i2JFboUQQb+Jy/4giwkdYeFKVDeRjE1L/MD3d9zBoR0/jhejUJ
 TMYA+eGfGWKpBkgc0f0XAxZoAAs7al+nR4lhUHg9XI/Sc4P77ge3JYiz6wyEOh36Mvcl
 KQfw==
X-Gm-Message-State: ANoB5pk77hGVwGtPBYuwxnOfAmBba6AE2H2mXbZvyBK9p3RKEkMSNNFA
 lFmPkeKlDAA4/CEhbpH/YcJXzAvPv5jdxCnU2vo=
X-Google-Smtp-Source: AA0mqf7fGDDGExKSXNOos7vNzx8TqR3lvacFwRNqRaQ3jTxl7oWgkKtDUzNZIqGW1zW9LTV0JvEoeN3bc7y2t0XFyhQ=
X-Received: by 2002:a25:ae04:0:b0:6eb:1172:34ca with SMTP id
 a4-20020a25ae04000000b006eb117234camr9524097ybj.219.1669189930096; Tue, 22
 Nov 2022 23:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-15-vishal.moola@gmail.com>
 <9c01bb74-97b3-d1c0-6a5f-dc8b11113e1a@kernel.org>
 <CAOzc2pweRFtsUj65=U-N-+ASf3cQybwMuABoVB+ciHzD1gKWhQ@mail.gmail.com>
 <CAOzc2pzoG1CN3Bpx5oe37GwRv71TpTQmFH6m58kTqOmeW7KLOw@mail.gmail.com>
In-Reply-To: <CAOzc2pzoG1CN3Bpx5oe37GwRv71TpTQmFH6m58kTqOmeW7KLOw@mail.gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 22 Nov 2022 23:51:59 -0800
Message-ID: <CAOzc2pw_AvE_BabounZvVMmQMpt70Dj8qLFPV8CXwJowzBL+BQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 22, 2022 at 6:26 PM Vishal Moola wrote: > > On
 Mon, Nov 14, 2022 at 1:38 PM Vishal Moola wrote: > > > > On Sun, Nov 13,
 2022 at 11:02 PM Chao Yu wrote: > > > > > > On 2022/10/18 4:24 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.179 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.179 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oxkYK-0003PR-03
Subject: Re: [f2fs-dev] [PATCH v3 14/23] f2fs: Convert
 f2fs_write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 22, 2022 at 6:26 PM Vishal Moola <vishal.moola@gmail.com> wrote:
>
> On Mon, Nov 14, 2022 at 1:38 PM Vishal Moola <vishal.moola@gmail.com> wrote:
> >
> > On Sun, Nov 13, 2022 at 11:02 PM Chao Yu <chao@kernel.org> wrote:
> > >
> > > On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
> > > > Converted the function to use a folio_batch instead of pagevec. This is in
> > > > preparation for the removal of find_get_pages_range_tag().
> > > >
> > > > Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
> > > > of pagevec. This does NOT support large folios. The function currently
> > >
> > > Vishal,
> > >
> > > It looks this patch tries to revert Fengnan's change:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01fc4b9a6ed8eacb64e5609bab7ac963e1c7e486
> > >
> > > How about doing some tests to evaluate its performance effect?
> >
> > Yeah I'll play around with it to see how much of a difference it makes.
>
> I did some testing. Looks like reverting Fengnan's change allows for
> occasional, but significant, spikes in write latency. I'll work on a variation
> of the patch that maintains the use of F2FS_ONSTACK_PAGES and send
> that in the next version of the patch series. Thanks for pointing that out!

Here are some numbers for reference to performance. I'm thinking we may
want to go with the new version, but I'll let you be the judge of that.
I ran some fio random write tests with block size 64k on a system with 8 cpus.

1 job with 1 io-depth:
Baseline:
  slat (usec): min=8, max=849, avg=16.47, stdev=12.33
  clat (nsec): min=253, max=751838, avg=346.51, stdev=2452.10
  lat (usec): min=9, max=854, avg=17.00, stdev=12.74
  lat (nsec)   : 500=97.09%, 750=1.73%, 1000=0.57%
  lat (usec)   : 2=0.41%, 4=0.09%, 10=0.06%, 20=0.04%, 50=0.01%
  lat (usec)   : 100=0.01%, 1000=0.01%

This patch:
  slat (usec): min=9, max=3690, avg=16.61, stdev=17.36
  clat (nsec): min=28, max=380434, avg=336.59, stdev=1571.23
  lat (usec): min=10, max=3699, avg=17.13, stdev=17.51
  lat (nsec)   : 50=0.01%, 500=97.95%, 750=1.42%, 1000=0.33%
  lat (usec)   : 2=0.19%, 4=0.05%, 10=0.03%, 20=0.03%, 50=0.01%
  lat (usec)   : 100=0.01%, 250=0.01%, 500=0.01%

Folios w/ F2FS_ONSTACK_PAGES (next version):
  slat (usec): min=12, max=13623, avg=19.48, stdev=48.94
  clat (nsec): min=265, max=386917, avg=380.97, stdev=1679.85
  lat (usec): min=12, max=13635, avg=20.06, stdev=49.27
  lat (nsec)   : 500=93.55%, 750=4.62%, 1000=0.92%
  lat (usec)   : 2=0.65%, 4=0.09%, 10=0.10%, 20=0.06%, 50=0.01%
  lat (usec)   : 100=0.01%, 250=0.01%, 500=0.01%

1 job with 16 io-depth:
Baseline:
  slat (usec): min=8, max=3907, avg=16.89, stdev=23.39
  clat (usec): min=12, max=15160k, avg=11115.61, stdev=265051.86
  lat (usec): min=137, max=15160k, avg=11132.68, stdev=265051.75
  lat (usec)   : 20=0.01%, 250=57.66%, 500=39.56%, 750=1.96%, 1000=0.22%
  lat (msec)   : 2=0.16%, 4=0.06%, 10=0.01%, 2000=0.29%, >=2000=0.08%

This patch:
  slat (usec): min=9, max=1230, avg=17.15, stdev=12.95
  clat (usec): min=4, max=39471k, avg=14825.22, stdev=588237.30
  lat (usec): min=80, max=39471k, avg=14842.55, stdev=588237.27
  lat (usec)   : 10=0.01%, 250=38.78%, 500=59.53%, 750=1.12%, 1000=0.16%
  lat (msec)   : 2=0.04%, 2000=0.34%, >=2000=0.02%

Folios w/ F2FS_ONSTACK_PAGES (next version):
  slat (usec): min=9, max=1188, avg=18.74, stdev=14.12
  clat (usec): min=5, max=15278k, avg=8936.75, stdev=214230.09
  lat (usec): min=90, max=15278k, avg=8955.67, stdev=214230.10
  lat (usec)   : 10=0.01%, 250=9.68%, 500=86.49%, 750=2.74%, 1000=0.54%
  lat (msec)   : 2=0.18%, 2000=0.32%, >=2000=0.04%


> How do the remaining f2fs patches in the series look to you?
> Patch 16/23 f2fs_sync_meta_pages() in particular seems like it may
> be prone to problems. If there are any changes that need to be made to
> it I can include those in the next version as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
