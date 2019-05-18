Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1FE224C2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 May 2019 22:09:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hS5eF-0007bL-8W; Sat, 18 May 2019 20:09:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hS5eD-0007b9-UM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 May 2019 20:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/XcmRw9sth/1Tuk8S9d864Bw2ys0K0bkil1EB3JbkyM=; b=Bi4FptS1ATYVFjuU17rcA/SLD/
 DGCTXG6DGYVeMFsmptcdOl+EzTQcJmJHqdlLqlPxhasUwqTAGwK2TcD7hFbsZLshzibtevi5+JDjx
 z4xlrWnSwo7/OyxuMvvGSqQQQZFUGIV3PcJOZGSrk6eGabgVzZNZK+fINV6QRwPoa0Q0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/XcmRw9sth/1Tuk8S9d864Bw2ys0K0bkil1EB3JbkyM=; b=C/9V6jdiP/6uKiRimj3hGLzdZP
 bKI/RQydmrHAetjYr0VCqRXBgnn7H4rkSMGl0zWgk2YGVzrd+qzj1ytqmEcNmhiKrkPqIKzTNUNa/
 lY7gfLg7em8xZBeA4TvLMseRT9r+FYIXO8BQsHeY6XYEjGRJV1QtXMD1jKLtq6ZllW9c=;
Received: from mail-qt1-f193.google.com ([209.85.160.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hS5eC-006hrU-6p
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 May 2019 20:09:37 +0000
Received: by mail-qt1-f193.google.com with SMTP id t1so11900373qtc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 May 2019 13:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/XcmRw9sth/1Tuk8S9d864Bw2ys0K0bkil1EB3JbkyM=;
 b=eZkv3upxE1JXLv8INp7a9c8G8N2maPK1Q6GiaSCp3G71L50FaLhBebelex3osGmyjW
 Do7P6A+Ab6a1hd0FSaooi3qsdd+v2stPcDIyZIK1D65jXznm8CBBSM4UchD94CyjlRrO
 VV3eNUeKH9ZLf7ChOr6GmqjnXrLURA13A6W1RRE+h6+1Ctpr/PVrE1YB3x6Az3lhUNCK
 n8rDfg7yvX1wnBf5aSA+sZuBteeTDIrCq1/kl1I/2jWlXJaZU4mElRAJkeqtgql3JyDf
 SoQWPglq8G9CiWYCE1Eb408myPl8acUN3xCgK3/xdSwEcm/UCTzvWiAe+vpr3CdntN8t
 rhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XcmRw9sth/1Tuk8S9d864Bw2ys0K0bkil1EB3JbkyM=;
 b=Fol5cDsEiNjuDluf0/b1byWMGb0S0qN2lsnLAReXSb3Judthwyvbd5zIgjGnuNzdaa
 9DIwD5usLc5i6PVR0f/n8qUyW8kF3RC6iOctOCQgSyBAl9PnoZJS6NpEKfCrPC87fKt+
 BcaXg+Kej8fM7wnDSlj02dvZFtoGV1teygI6v7gUBTNaBOAXToE/OqdKy04CEHAjtjY+
 QXlYs7ZuCVWPsUvGpx6RZ/qHmaofLzhMAWUob5m4eJdNN8fjTAp442T5+6f0ZDc/V69V
 BWavHt1dv8wnGqu+BF2wuVXBf6wW3iproz6buVrLhOnDUAuvHmw7IGvRzZKxALzTcMCT
 nFZg==
X-Gm-Message-State: APjAAAXzQctG6n683Sl9qnmdu6Alz29RNOLfnHZvFu0V4IcgOWC5wjRr
 1ZUAiBISYvmPd3xo4mqcwixwQlvzETWx+2/N8Zw=
X-Google-Smtp-Source: APXvYqzeMHFhXDK2xZ8rHilHU7CQ2ZQzWBK00cLF5nwems5z/9LxpYzyZQJSTUl/W6NaELjX4qK0pbEdvo0BpjzeKFI=
X-Received: by 2002:ac8:6941:: with SMTP id n1mr27250041qtr.122.1558210170019; 
 Sat, 18 May 2019 13:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190514093340.40217-1-yuchao0@huawei.com>
 <20190514093340.40217-2-yuchao0@huawei.com>
 <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
In-Reply-To: <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Sun, 19 May 2019 05:09:19 +0900
Message-ID: <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.193 listed in list.dnswl.org]
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arter97.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hS5eC-006hrU-6p
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hey Chao,

Sorry for the late reply.

On Wed, May 15, 2019 at 6:23 PM Chao Yu <yuchao0@huawei.com> wrote:
> So I doubt that sit version bitmap is corrupted, could you add below log and
> reproduce this issue?

Just done it. The logs are at http://arter97.com/f2fs/v3__/

Thanks :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
