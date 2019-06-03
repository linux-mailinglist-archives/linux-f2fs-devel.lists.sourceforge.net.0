Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFD3336F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2019 17:24:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXooj-0007dD-OH; Mon, 03 Jun 2019 15:24:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hXooi-0007d6-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 15:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OpLOP+yNY8/Xf/Jff87IxnoykVmFLiGYy8omPmcZ4vc=; b=Dkt98jd93AwQZKOieaI77jfno
 KWHiba3GTKPToGckFFBzlFT4qSwClCYV+YnwxN5Fu+OFIJLvtORre3y/7oGfcILAkQ90jzqqXfaP1
 6WGV+dfFUTlwzOMKS4TyZKVyUL1aq33o9ihZD0l4GjNQY1jWeDdLZ9k/N48+NUlF9SZ6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OpLOP+yNY8/Xf/Jff87IxnoykVmFLiGYy8omPmcZ4vc=; b=Jbz8lJmTo0BVh+iL3CGDVtr68Z
 V4Rb3jCLZk8ySrJ5CO1JO/0QOD1YsMd0LplF/21LOPqh7AdZRrNvVjgFWcGdVY0XWFWsZMjpEFDJI
 /WJ3qLEa2BEuyO8E3HJMoMfWx5UmIL2i2Wirbas6mRdrhZ5m52if2vQ6ul9ZZ7hcPYGk=;
Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hXoog-003hp1-Is
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 15:24:08 +0000
Received: by mail-qk1-f195.google.com with SMTP id c11so647298qkk.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Jun 2019 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OpLOP+yNY8/Xf/Jff87IxnoykVmFLiGYy8omPmcZ4vc=;
 b=TiUhgJY8MMNQ10IK3lCPTvtZRPuMjlwFgXSo0dM9oRIyBkHMeJV9FHCvWmlbWspAEM
 6SEhhi9wxYrNIt9ex100SWxbthnW/xHasTRo+0TQpAtDT/Ew/JrJVWnl6T9Vn1E8zAzQ
 CGmQSepfsl9aOtd3xUSb3fw0t2WfpVyTc/L6HtiTxbtV+Apntp15Eh97iFTbY/Oz+Ei3
 V24zTojWOiV5BaliX6iKEXlwTC2EsamMxgamDQu+LEZLJE1cbElZmqlFkz+py98KxzTg
 ev1hdgaDCDRtRxNBuAQ1ZbYyxKe/SGEsKHDlssWgwwZEa6X1Z72zpGpUl1ppAFhXTh4I
 2nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OpLOP+yNY8/Xf/Jff87IxnoykVmFLiGYy8omPmcZ4vc=;
 b=AF+gdoB5HpcO3lSr913FRgNG3sL89sY4y/VKXcEU7bsa1ApB5big4aDxudTRn6vmYB
 aJWpiGAa2xZphScTTZ56XQIxnUnGm7LYfZvhmjHuwebu90K3JT7pf0TOUCpeHgQ8KWiV
 bs1a7nQe83PAVlDZpELNTIocekvuHrbGjJ2C8Xf/Jwc1sn2OalSVo7MWsl3FP8Bz+qvS
 JbK4sw7TUTWokt0ZVzlLq9pVhYuqkNQ6OUccPZAesxCR5eXa9FXa7lO5Z3lqrHVYvZNC
 vl4SDHulLXh8mOFHBqsRIYU3lvIKKbuWWjfHhFepnyietdtBa76HJZPRwNxW9BKk1PoE
 DJeA==
X-Gm-Message-State: APjAAAU0RiSQLd7oNY8WbWkaVUqHu8w6loS/ilQYyRPCMvqjoje1H4HO
 fzdIyhtU0sShRkFGdPHjGV9xk63D9kaEHDlV8qLIRdmt
X-Google-Smtp-Source: APXvYqztzz7+EbEAJ/mG8shhnHA0qpF2WWFzUS3ZtkUyYKXhC3oYFOcpWCwXUCmF4Qa0cIu35+yLqjgySpaZtz1uDsE=
X-Received: by 2002:a37:a5d5:: with SMTP id
 o204mr22171204qke.155.1559575439817; 
 Mon, 03 Jun 2019 08:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190514093340.40217-1-yuchao0@huawei.com>
 <20190514093340.40217-2-yuchao0@huawei.com>
 <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
 <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
 <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
 <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
 <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
In-Reply-To: <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Tue, 4 Jun 2019 00:23:48 +0900
Message-ID: <CAD14+f2XWeWvYXTjKbReJa7uZROvnp_-V419sBkpmWFp5L5BtA@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.195 listed in list.dnswl.org]
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hXoog-003hp1-Is
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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

Hi Jaegeuk and Chao,

A little update I thought I might share.

Just went through migrating my laptop to another SSD and I've setup
f2fs from the beginning with mkfs -i from the master branch.
No issue as of yet and the kernel is working fine as expected :)

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
