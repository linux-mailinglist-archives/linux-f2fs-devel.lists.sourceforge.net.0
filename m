Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D024D1C7D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 13:30:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQVdk-0008A3-PA; Tue, 14 May 2019 11:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hQVdi-00089v-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 11:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=82gBYUg0Q9zvN8BFETtKShYk93y/tqU5T7Ky5uxnMeU=; b=edm82gIi3P1nvGZs08wvwB9Qlg
 ZC233Iv8h1fIJ0TanDmvite1G1Y1bjGEJYFW+PNlKzM0+CSSKIgVZZO/1Z3oSmVdZq766cnzMKA2s
 o+faDaJrEhR/g2RauXz+1P7TIENTWvClwCAGgprvYzFadhEmJYpk3yToCaOX7UqjKV8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=82gBYUg0Q9zvN8BFETtKShYk93y/tqU5T7Ky5uxnMeU=; b=aE3GreqNqLHfKc3AXWzcAP5JPM
 mirPdegniFCoV8A8NYf/J67iWKPl3Cw5u02rAnn5ukNitax/d+I/1jhhk8LNgTJfXImSyX7X+U+Rm
 xP4A1m/0EAqrCUC7726lgZ0LKRD63S7r1I6MrCo9Hhy18stgPS68/6xiXKMdEIR8ym7c=;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQVdh-00GV0M-I6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 11:30:34 +0000
Received: by mail-qk1-f194.google.com with SMTP id z128so10009072qkb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 May 2019 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82gBYUg0Q9zvN8BFETtKShYk93y/tqU5T7Ky5uxnMeU=;
 b=XHQ23WcvhAqxm0TqEG5lpWppngctR3+8ulR7ArsBpJ1/o42gCSpXomngtmB/APIkds
 Ou8LK98M/V00SSd8I2xbUF+L1BOp/AhlxZDl4jrWEtltxstryEFZrmjNpxhuD24xwg0X
 J4Psa0jEimFejBChHgzLmhRfSKkWdUJwdNAmatqTiavsRFH77MqReG1LQqVRcBl+TiKX
 +vsrc3/OLB8PIcXlULPZ/Q0dZvwE0rYXWMkuy8iHjDk8MRu02LRTANLer3lyEQ+OlWTh
 2Gp9j6kqkbh37JlZxFSUd2jrTaQofBj+6cUhXDm9tVDmmsd8tKy1kVQ2WMZdILWYbubi
 hdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82gBYUg0Q9zvN8BFETtKShYk93y/tqU5T7Ky5uxnMeU=;
 b=kigppRZdwRghFMTO7c81MVl09CFUAsVphc/ilE+4GzVoTj4DPsAEut3zo14Vp9LD4E
 aasPIVMUvPJ8gJJJfsDSm03aBQGhuH/EO4fhzEP5pFpVurO4qp+3uHx9Kn4F59FuUyk9
 bzXhz/qQotNHFW3TMoiIfH0h/ju4OsxkI7PAlTQ5SaoDYMbLbCxw3dldNl1ZWf+u7Kvu
 Mguu9x5WHW/VJzfHaZ1tGe8342bc64sgxWh5Ks2/nND1WqhYnYhuegRklt2L5oMweSBX
 lbv4jH1UyxL9xev8VjIbJTbkDN5bbty7d8Ruc5KidMkL2qLXI0xYE04Kn7bwq+iy1c3I
 kDOQ==
X-Gm-Message-State: APjAAAUrR53uuS9c6gS8Fbf/OMGKPsrTaOyyn7btHf+xk/V12JEunsk0
 ptdDK/zilaqWl9VNCmdVoDfDIaEDdZ/8QUVlceI=
X-Google-Smtp-Source: APXvYqxoll+KHgC6xrLWuid2EkLEBz+V6WvBz4mUTYfA8mc74+i+Ae83DkWhY2syf2npg0O7UQ33kowDHPG3o1uL8hQ=
X-Received: by 2002:a37:a705:: with SMTP id q5mr26543989qke.123.1557833427078; 
 Tue, 14 May 2019 04:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
 <81acd624-8698-a584-f298-7e64ad77752d@huawei.com>
 <CAD14+f0Zia3oAi+QO+wCBrbV_=csp1SWB4BE7yN0h+=paZpg=w@mail.gmail.com>
 <8cd6214c-d15d-d6c6-224e-69ad7936605d@huawei.com>
In-Reply-To: <8cd6214c-d15d-d6c6-224e-69ad7936605d@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Tue, 14 May 2019 20:30:16 +0900
Message-ID: <CAD14+f2G5M7qqEvztd7nC=MNvSbLtkRKzNA89zGdYSb1FgP6LQ@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hQVdh-00GV0M-I6
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: remove sleep_time under gc_urgent
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Tue, May 14, 2019 at 8:19 PM Chao Yu <yuchao0@huawei.com> wrote:
> > I've been using this(with a slightly different code) for years and yet to notice
> > any spikes in lags/slowdowns. Worst scenario, I'd just have to deal with an
> > added split second(100ms max?) delay in screen wake-up.
>
> I'm not sure about why this happened... maybe you need to do some test to
> analyse the root cause of it, filesystem/device fragment? too many undiscard
> space? or non-storage issue?

Um, I'm not sure you understood what I said.
What I meant is that I haven't found any issues with using an approach
like this(gc_urgent with 1ms sleep intervals) for years on various
Android devices.

> I agreed that it should done as soon as possible, but it needs to consider IO
> race in between Apps after screen wake-up and BGGC to avoid potential ANR.

I actually need to check whether vold turns off gc_urgent immediately
after screen turns itself back on.
I don't think we need to take potential ANR in to account *if* vold
stops gc_urgent right after screen-on. What do you think?

> It's userspace strategy, we can change both of them
> (vold_wait_time/gc_urgent_sleep_time) in userspace if current value doesn't make
> any sense.

Even the user can set the tunables themselves, the default should be
sensical imo.
An "urgent" GC that only GCs up-to 2 segments per second doesn't sound
that "urgent" :p

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
