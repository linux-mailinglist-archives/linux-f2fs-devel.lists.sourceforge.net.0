Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC13567C2D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jul 2022 04:59:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o8vGQ-0001tC-My; Wed, 06 Jul 2022 02:59:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o8vGO-0001t5-Hx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 02:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dpXsLf9WdKewVhg9xD6K1Zo+nxUZNcBo221W1cDLoQc=; b=mbV4ncvG4XbqEbE1vWFYMP0MXI
 H4NoAcytU1j2ToB+nTC8j27ThMMUZt+SdrtIJJrnNbII7aFv/lNstoxUNn+d4eREl6yMo4LmmlIzS
 I1025enBICc/4/VhPtGCD8DQH2UhESb+pMwQEYT0+NqcX4/Va5L4+huDonD8EiK6IbyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dpXsLf9WdKewVhg9xD6K1Zo+nxUZNcBo221W1cDLoQc=; b=Z5A3vs6hctvjR0dpiIiCulP2Ac
 ivT5ObEowuItqkKK2afVYVdOtovgPA8miPQz8fNLFDlFW0y98C/mtmZEzyPjk97Mk/76NRKcMRBYQ
 GtWhC9VXnpwIoloip1dy347HEkFug97Ek+qIsXNzdio8COpTtO24N7lW422v01v1jN3k=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o8vFy-0003sh-6F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 02:59:25 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso8573496pjc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Jul 2022 19:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dpXsLf9WdKewVhg9xD6K1Zo+nxUZNcBo221W1cDLoQc=;
 b=FtDhCpXUiMfqGz2Yf2cOwtSDni4IyVzNAK+bogsD+N57PUGV3ZQxeWzuFztsmjTU0f
 gxvqmsOzSmJVRSd37G2P1J7GwZj1Weo4XQf4H9J7LJHfsR0rP/FZx2YwrDXFuxRF3j4L
 XJ0VtF5faJZsxP45ZigzJD8exEmBbZZtxzhJGLC1Y9JO69dZQBqiyehHMhDBCoRFND/s
 MpH2+hlInx2fOL7ecOqwnnxNYpK/x4dkCZwVD2Dvzqdi0PetbkCzUbVCwHmT51gLtqSZ
 LvjDCSRDaVp1iqmEFvqtYomr/pToL0VH8EvpZUxsGwxzn6H9iONU46UQEv8uyXXf/730
 YS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dpXsLf9WdKewVhg9xD6K1Zo+nxUZNcBo221W1cDLoQc=;
 b=WNvA3oUyqAlHxGxGKpV529cvZcWHH4NpcjDVrTpjEaLXEZCGj3opqnytlWSqpyBebK
 s+751q/oglNK1buPkSlRu1qZV4HwXYd9f3zO4miOv2EDgNHV3vD0r1VIoDrgn0birVpi
 3E8m5E3fdTnVseB5AtyZ7xeG9xjOlC+g6UGJu64u/ZKUCOPxJ5HsWZZCbqx1vy2VeOs5
 Ny71w027cEqxW4YCvaUNUcGWOeCH3xJEv7Jup/sQ314cIeWvZxR3YbALX8fkzZNR2EKq
 IpaNug7gptjRnaY5D5N0vQKeVopWNpKNIEmJtH/zKPtIh3sb2+/ceHUq2NW5T0PfSqmw
 owTg==
X-Gm-Message-State: AJIora8GKawPt+fnNkzUtIy2hZWJuWEWjlyGMpcYVO0al6UlHfh3+Lbt
 3VoeDNzG9EjAz7aPN0PtrNxZFz7OzDmvpw==
X-Google-Smtp-Source: AGRyM1sGkJJ8bUgbP5wOxkOEs7KYNucCBk33uZQwhVwcEX7A9R15TqrihLBVZWCrfD0jWN27QcdIXA==
X-Received: by 2002:a17:90b:4c0a:b0:1ec:d3b2:ed22 with SMTP id
 na10-20020a17090b4c0a00b001ecd3b2ed22mr46600535pjb.2.1657076348690; 
 Tue, 05 Jul 2022 19:59:08 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 n19-20020a635913000000b0040df0c9a1aasm17931301pgb.14.2022.07.05.19.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 19:59:08 -0700 (PDT)
Date: Wed, 6 Jul 2022 10:59:03 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YsT6d1F+dz4vfbRr@liuchao-VM>
References: <20220621064202.1078536-1-chaoliu719@gmail.com>
 <7fb689d9-11ba-a173-8ad4-a328a03298a8@kernel.org>
 <YrPq5N61W9vFGTub@liuchao-VM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrPq5N61W9vFGTub@liuchao-VM>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping. On Thu, Jun 23, 2022 at 12:24:04PM +0800,
 Chao Liu wrote:
 > On Wed, Jun 22, 2022 at 08:50:33PM +0800, Chao Yu wrote: > > On 2022/6/21
 14:42, Chao Liu wrote: > > > From: Chao Liu > > > > > > Files cr [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o8vFy-0003sh-6F
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow compression of files without
 blocks
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
Cc: Chao Liu <liuchao@coolpad.com>, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ping.

On Thu, Jun 23, 2022 at 12:24:04PM +0800, Chao Liu wrote:
> On Wed, Jun 22, 2022 at 08:50:33PM +0800, Chao Yu wrote:
> > On 2022/6/21 14:42, Chao Liu wrote:
> > > From: Chao Liu <liuchao@coolpad.com>
> > >
> > > Files created by truncate have a size but no blocks, so
> >
> > I didn't get it, how can we create file by truncation...
>
> I'm sorry I didn't make it clear. We can create a file
> by passing a FILE parameter that does not exist
> to the user command truncate(1) [1].
>
> How about using truncate(1) instead of truncate
> in the description of the change?
>
> Thanks,
>
> [1] truncate(1): https://man7.org/linux/man-pages/man1/truncate.1.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
