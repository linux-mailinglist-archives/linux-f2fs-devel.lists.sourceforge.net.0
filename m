Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CC904C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 17:38:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyeJ2-0002xB-5i; Fri, 16 Aug 2019 15:38:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hyeJ0-0002x2-SU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 15:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SOiG3+gk0ApjPC44AnnJUG5I5KdyfjMKfnBUmaGTUBU=; b=cK7Tx3V23mZ84DIT5g07UuAGCK
 KmQQO0R5h4IPFceWc8AXm9i7uDLaD6NayPZSg0bd0RcAGL7yMAz/hB3ZLuCTCYXRTLDK2Ww6wmEBb
 EH8ylff05XXhYRINcCGG8oxxvtVy9+mQwacJioCD9DbdaZbspDXPByRTCuHwJ0erZxB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SOiG3+gk0ApjPC44AnnJUG5I5KdyfjMKfnBUmaGTUBU=; b=DGTsMJzDYrgqXkBbhTNed9ZKM1
 Ovkx65Qc+GqX0dCdnCJFwvdLG69Dsgh1/WFGEjKHmg/u9gc7yaMueLBTDHDuZ1Xiu6kbXDeUkB2r3
 ZscR3rR6WUUFyKwNgT/GJGz6ynZ6WfhlJEI3BwZrLTM9JM+pW18NeB0Gtqy8OYOEY4Hc=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hyeIu-005YB1-4C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 15:38:18 +0000
Received: by mail-vs1-f45.google.com with SMTP id i7so3995835vsp.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2019 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SOiG3+gk0ApjPC44AnnJUG5I5KdyfjMKfnBUmaGTUBU=;
 b=KnZfI0PUyuonXxxFhNHVEf0r9MpBFPQugyiC+Q3h/+ox6BpVOHTAABGbF2LBonjQNy
 CtU2g6HRhTrahwt3CJCdxhXcLbv3WMEPVh6veLGqb3yYvtTbOTjo1VdeK70zHMEJ9/+/
 JtbyXSQO0Lor90JAsXsA3+1C4jvxRVnxMfvY/5vTPtjZkP+eKlqJdQY4AOqsDnswasfS
 C50benKAjcUMAS+gzd2/LG0guRKKDsmMWNKk4ZTzOmUWvCt6w393JhmncxRjqWmev2un
 dsVRZTaez4Dh9wFcRj72fH3D4vlCg9LM6+d3t0o7hoybqJnuNXriihz7OAKJEYSb4aEK
 WkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOiG3+gk0ApjPC44AnnJUG5I5KdyfjMKfnBUmaGTUBU=;
 b=YYWHuMiog+46VbEWioQp570A38dNXMdf0YE3EuzlBn0fFRM9mSwdiCQ9NjDI0g09zZ
 f+NZTw8m5Tw1wHGeqbHPxB/OZsM/XV9TV952EPBVz5k5z2vvHLxUiduYrW+UbVZWJXFN
 L+AscCTdCgrQ9yvzexC2GndRO8h8QjEJTV7WFUfOqC1pRxoOW81PT0f3ePnSnPYU0jDq
 v0co3YgzEzsK+fkxeg8JYRkZAXAO2AzZkktgzVCL+CRtmrLeSVJuYILKSp/yUies/2tq
 e7MeXqFiBhDLrxkfVBjpBXowOaIoNbEb5JSpW+ysmBQtnqI+tbxcaycHFXQlRNXZuxQx
 Y7+w==
X-Gm-Message-State: APjAAAWNvl4dNEd1MByaxKgrertqGftCnQKacp5br1WSp95Is5kwOpMy
 Z/is6newY/wtPkA/txMNZaxDGqmmDsqPcxyodeg=
X-Google-Smtp-Source: APXvYqx/HIxRYRNV+PVwo+Sx01/+hdh9D7ccNjFKK/i3cBUQfWUKMNXv5Wy9CvdpFaz5uU2Cnl+TTm0UAa0ArVFX5TA=
X-Received: by 2002:a67:80c8:: with SMTP id b191mr6754890vsd.113.1565969885088; 
 Fri, 16 Aug 2019 08:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f1YGinNQuVKc371vgJGJaaqYWqcaP6WwSuP1mwf-D2Tzw@mail.gmail.com>
 <5696f35e-d91a-801a-d2bb-fbbc188bbf4c@huawei.com>
In-Reply-To: <5696f35e-d91a-801a-d2bb-fbbc188bbf4c@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Sat, 17 Aug 2019 00:37:54 +0900
Message-ID: <CAD14+f3a1Uifebv8cybJOW8FrCnsvbrCCbT+JupxRVu3kpji9w@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.45 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.2 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.45 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyeIu-005YB1-4C
Subject: Re: [f2fs-dev] f2fs: dirty memory increasing during gc_urgent
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

Hi Chao,

On Thu, Aug 15, 2019 at 3:49 PM Chao Yu <yuchao0@huawei.com> wrote:
> I doubt that before triggering urgent GC, system has dirty datas in memory, then
> when you trigger `sync`, GCed data and dirty data were flushed to devices
> together, if we write dirty data with out-place-update model, it may make fragment.
>
> So we can try
> - sync
> - trigger urgent GC
> - sync
> - cat /sys/kernel/debug/f2fs/status to check 'Dirty' field, the value should
> close to zero

It's actually not zero.

Before triggering gc_urgent: 601
After gc_urgent ends and doing a `sync`: 400

And after another 2nd gc_urgent run, it finally becomes 0.

So I'm guessing this wasn't intentional? :P

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
