Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EBE210ACD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 14:13:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqbc2-0001Ob-Gc; Wed, 01 Jul 2020 12:13:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jqbc1-0001OL-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 12:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tw287Wj0rT1y9xvMzyezmJaiA3ZqkKxDAyWTdh35zE4=; b=fdjc8NMZyXG5CWmO4372CwTcvy
 v2Bfywbl2PqDdciGGX61OMVNNoT3BxXEaGEweAOVQRJnbD+XHQtHzSVhSBL/QVREAlZ3Skf8ywoUb
 1zlopKMTD+jX94gMnkEIIJJVv7Vs+N1KYOhviZRsJaDYMr32l5tb68g6/QJGY84U22PM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tw287Wj0rT1y9xvMzyezmJaiA3ZqkKxDAyWTdh35zE4=; b=FKX4bM0TTaiEu6h01kukiY7O/t
 55vs7IS9Jg8vKZ9nWXl1TejER9A6g0wDIQxmrxBzP108BePfCGewYweNsrVmIn86xOvlYW2cSpViK
 Yz6qHDf4kZN4n7m32tTdI/F8PqMTHE0j/a0f8WyAgHrc55TIH0RG8B+3XwxNGoEI7gY4=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqbbv-0041JX-Dy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 12:13:13 +0000
Received: by mail-lj1-f196.google.com with SMTP id f8so14350566ljc.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2020 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tw287Wj0rT1y9xvMzyezmJaiA3ZqkKxDAyWTdh35zE4=;
 b=Bf4KuVgW2Z1nRKgLhIqnAuqFliXvxBoha2MFFMx7oO4y8XkA4sEdlo24lbzb8N6cs3
 Fc58y165gRsxDj2Cw1MqvdgVEP2VXjf/I5UT7OQs1lKr1HoKmG5WJ0uFb1rwENQ2wTd6
 KKUcQ0p7ZTjrkUyRkWKDGF6rqxsPL7xbmTjGaItHCKABOXEHck1bknQqKW1Dfdn6+mFh
 GfkNcOHgMx3yzTEMm3+pwp8Un+zUQBxFsImqJV7AxrfYdCL4EhB3IkSRyGptxlisqdSI
 AHGzIRLmFFK8BJfTZVhQaEMSRE4A5Ko6N4Gphjd7vw+Yt8O19vL5cTSJE+JRQcg9c4Ec
 60TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tw287Wj0rT1y9xvMzyezmJaiA3ZqkKxDAyWTdh35zE4=;
 b=jgQ3WZNh5AZ1KymyKQYVCkifVMZ4pP65EU0LAChQ9gl7L19rwst1n/L7Vif2Qz6LB3
 c3vjJ6tE5CGSFx2LQdjAj2hUtmsuMEgAk8YOM0PLyPrtzi2W+/2+L2nJh32gDtlbwCNg
 TNZXdMkFe4oHPAdTBcbPXeXbhfDFCVTKpwE7LVY+xmEYMWvM7bBevVVxkbmb7WHJ+oZ2
 iaUZlOzsUnf4NZaXo85Qu6sDw6Vz5WhpXIpZLAA1aS+CjZtG0y1QL5cU+iw0DfZBaseq
 MJBoBzY5UD0OtlcLGYeauHt0Wv/7SvjMnuSAiEzokjhK8PyDPzZ3etYYQZMaYWnQEqzs
 XEbQ==
X-Gm-Message-State: AOAM5328yuq6ZlwJhucMJHh+bOi7Cs/JG27GBUoXKUE5z+bxI2Bv1HE8
 C33EvDSMpd+spVGaMWoaPfjhhTxIf9q9VJ9DhDQ=
X-Google-Smtp-Source: ABdhPJwg3vMtPToOU5TYqQME1BrTFI3j2TIB5/PPj9tmTMadGWyspXda4m2zF4s9f8NmW9eW+wsZCqMdlsEacTBI8oI=
X-Received: by 2002:a2e:8e68:: with SMTP id t8mr6540812ljk.335.1593605580788; 
 Wed, 01 Jul 2020 05:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200630005625.2405062-1-daeho43@gmail.com>
 <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
 <CACOAw_wQx5wjdWDX_WFebNS42t=wBuSh_k7oQ4v7abBv80SZXw@mail.gmail.com>
 <9d1afacc-6033-2bae-d55d-909d50f1904b@huawei.com>
In-Reply-To: <9d1afacc-6033-2bae-d55d-909d50f1904b@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 1 Jul 2020 21:12:49 +0900
Message-ID: <CACOAw_zFLgeoomdHhRmzYMtCocTugW5AVxb2wZnoRAC9+hR9Gw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqbbv-0041JX-Dy
Subject: Re: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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

> On 2020/7/1 15:04, Daeho Jeong wrote:
> > Actually, I want to keep the mount number remaining to the same
> > number, even if it's re-mounted.
>
> Then once there is f2fs umounter, the order will be incorrect...

Actually, we prepared this patch for a strictly controlled system like
Android to easily access the sysfs node for a specific partition like
userdata partition using a specific number.
In this system, we don't worry about another unexpected f2fs umounter
interfering in between unmounting and mounting a partition.

When we are under the condition that we can keep track of how many
times the userdata partition has been re-mounted, we might as well use
the original partition name like "/sys/fs/f2fs/dm-9".
This is for when we couldn't do that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
