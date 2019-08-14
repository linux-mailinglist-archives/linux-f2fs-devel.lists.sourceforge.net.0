Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C658D5C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 16:15:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxu3k-0000sg-FX; Wed, 14 Aug 2019 14:15:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hxu3j-0000sU-90
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 14:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NFmLcgDO1gDFN9df2j062MJdjVty2Ma9cSLuV1bLQ8=; b=PhKEIdMUY+41RLgOC5mIBveABN
 jlzIAMp8XEQyNQvtGYJCc98f/TR5pfeJ2AuigsxJmOH9kQMsE9kz3aB80ByF7JXKzN8hdm9M2E91W
 32kJLxzeFCG4P+tx3cmp3vko5DZdCLE6BPofLXAvIqHV/IBxk+UnsEw6rtsBonzNaBAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0NFmLcgDO1gDFN9df2j062MJdjVty2Ma9cSLuV1bLQ8=; b=E
 f75vbEkDzOzQHHFSPZAsktNeuS7WheiX15Fip/N3oRDIkrdzJucz1STmjQmuP/K7/uIt2QQLTEH7L
 lPLHk5U9YdXC2lCQwolyiOSetLsUlr4VFR/qb9kuxzgVy9l8ywnNtW3/KBxlZxRsb/vg+DvpsYZxL
 UUoBj09cpjyJkqEU=;
Received: from mail-vs1-f54.google.com ([209.85.217.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxu3i-005ylQ-2I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 14:15:27 +0000
Received: by mail-vs1-f54.google.com with SMTP id i7so8218491vsp.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0NFmLcgDO1gDFN9df2j062MJdjVty2Ma9cSLuV1bLQ8=;
 b=cieztrNnY9MaOLBvaTgMtpkOmNrmsytFhJnM40dt4vdsw/YRfVSMwiLkbeDP888Wr3
 +9xLKQJedFBluqICNxOM4nBq0ZSv+JbrAhlLCHfLOxuZp78ynr++XIBB9q4w1YopewZC
 WQ27uyz75Eqc4ZWSzTvYcYzDK2pmdC07fSN7FIUnfa/qxi0DjA5SMeNzpASp0qa+4MQ/
 K5SxiLaHXxIEgJK18t5FHdPfcIzJQRaO9fSCd1f5tEZEeLrAeh3hx60Mfcw8Me+qB3dx
 VohHBVan4o5NxExX3dwPA5FlbAENMJh1bEZ0Bn/OTZAYcev4wnevZmzILZaeUih0Deh8
 XU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0NFmLcgDO1gDFN9df2j062MJdjVty2Ma9cSLuV1bLQ8=;
 b=OV+50PytXzaXBTtAkGbzNuAXhfJVrtrKQ+onZvtIjFs+wbg3dwd1rQdBzflPS819Z7
 pOBSmzHt4mCgySVFc6QkD36JXS6+HV6/a4Avnb8JJjnTlEwGYfz1Z/wWgmDrzJZ9Zk/v
 JtYhoSBwZs+BhHuO4y25KDD2/z0dejk2DGyeFAJCyNiQEVAsvfs7iskIUnpuKtAPav9I
 pCE9Cb0ra+3cvrE65WO9XY/O9EMwdGN8TFB8aZq+VvKeffwtvUJPyHWy+Y40hAxym3ZM
 0bnixnf7rGc7uv5joELIu+L42SeEouWVkrYkH4RUvLsyccxf7/nxJ8UfZTBm6nbYfKWX
 xumg==
X-Gm-Message-State: APjAAAXvjQTKAY7IibE0JJMUC+Hwxhu9uPTL0jCJ0jDaZV4KuqwWwjuK
 LeVZXl3EArv5NjJfVZ7Y/8o5IEBRScxBCy2U4RjH71OT
X-Google-Smtp-Source: APXvYqxB5sa4X+WHz4gzIiEgXvts9QvztrdSvBx+aPzNv4k6OVMdDwlmnWkWRr+rtJIs9e62RjkA3+AT32pWGNj7HWo=
X-Received: by 2002:a67:80c8:: with SMTP id
 b191mr31212339vsd.113.1565792119645; 
 Wed, 14 Aug 2019 07:15:19 -0700 (PDT)
MIME-Version: 1.0
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 14 Aug 2019 23:15:09 +0900
Message-ID: <CAD14+f1YGinNQuVKc371vgJGJaaqYWqcaP6WwSuP1mwf-D2Tzw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 1.6 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hxu3i-005ylQ-2I
Subject: [f2fs-dev] f2fs: dirty memory increasing during gc_urgent
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi.

I'm reporting some strangeness with gc_urgent.

When running gc_urgent, I can see that dirty memory written in
/proc/meminfo continuously getting increased until GC cannot find any
more segments to clean.

I thought FG_GC are flushed.

And after GC ends, if I do `sync` and run gc_urgent again, it easily
runs thousands of times more.

Is this an expected behavior?

I would much prefer gc_urgent cleaning everything up at first run,
without having to sync at the end and running gc_urgent again.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
