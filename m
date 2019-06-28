Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE459C9E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 15:10:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgqdj-0005jY-Lx; Fri, 28 Jun 2019 13:10:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arndbergmann@gmail.com>) id 1hgqdi-0005jR-W7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 13:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZGMhlAqLT3yxPYwrXSNZ2bJPTLwblZNG69r1i+sP/0=; b=Fu3zFJFtL4anzJ2FQnwZcZSfBb
 yJLiSYV+EwZtMZYGa8znytNd0gRJY4UnHfIgBbuVJoidWnz6Sg0zX+sjkdEcyLoVFghpTuvPuYE0m
 kFQvDxnZufJtUYPsS+6pFfRfBvRMTlw9ons0hp7nkI3dU3NC9tN3Kwl4UGAPrdoaNpfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZGMhlAqLT3yxPYwrXSNZ2bJPTLwblZNG69r1i+sP/0=; b=dXi7Cuaga4MnTDAucbWBLqOPjn
 xtuTxnMVXfs5Erms/EyR1jRss/5F3aUqubxchEuibhEzRFXmVNCg//Ux16x3pd6OM0cxtahgicGK3
 DGT2VpBOWsS9WywKsSREy27aonzhwy7B30fKbBLFvZKIg2C3P6v+vtu1qjBlBXsV3g8A=;
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hgqdn-00Eynj-53
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 13:10:12 +0000
Received: by mail-qk1-f196.google.com with SMTP id b18so4695655qkc.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Jun 2019 06:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZGMhlAqLT3yxPYwrXSNZ2bJPTLwblZNG69r1i+sP/0=;
 b=lK7hBYDmtp5PZcmclfd3dbdl80o0JwWuM9htLJza6SESyUsCCAvoU7n4FnM7BqfVXU
 GSbrZhsBuNkZv1Nch95mN0gJ4fFLylSvXZ6t6bkFmuxU2YdBPBk3ZK9smO2psOLLbbq1
 zcrZnm/HQbIVDOeAPK3yjg+oFxHO14N7M3XSBygjdgqiAU9gt5oEKMTRw6AKB1ry4Rfq
 EUUK5Ng0zEACNmXZD+RnEGL1UN5PBvb2DWc8y2Sxd8DsjkawZRoecLmTyD/TwID6OfQ1
 y+NLQGAp6P9G4UU2zIglQrUeTRfxzNOONT/LMTekGquZnDXj1z+5KaZ4iUY8myuMf7r7
 m5tQ==
X-Gm-Message-State: APjAAAX9dxAHP16MzejmmOKerWZ5TNRIoUQayI+gdGCXmW8Jh0mB+eMO
 ieK5A+scVjoKltV+z1pgUAXBbboaU6NhZgB9oR0=
X-Google-Smtp-Source: APXvYqz/uy9FWoPgcCIPsrNWdvriun+RHwQE6m09AWuN+ZVT9jYrjc/D3z+9REf7tJBGsduns2vaQgsAWGGQjyJVCuc=
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr8587053qki.286.1561727404146; 
 Fri, 28 Jun 2019 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190628104007.2721479-1-arnd@arndb.de>
 <20190628124422.GA9888@infradead.org>
In-Reply-To: <20190628124422.GA9888@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 28 Jun 2019 15:09:47 +0200
Message-ID: <CAK8P3a1jwPQvX6f+eMZLdnF2ZawDB9obF3hjk2P9RJxDr6HUQA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (arndbergmann[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.196 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1hgqdn-00Eynj-53
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wang Shilong <wangshilong1991@gmail.com>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 28, 2019 at 2:44 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Jun 28, 2019 at 12:39:52PM +0200, Arnd Bergmann wrote:
> > Not all architectures support get_user() with a 64-bit argument:
>
> Which architectures are still missing?  I think we finally need to
> get everyone in line instead of repeatedly working around the lack
> of minor arch support.

I came across this on arm-nommu (which disables
CONFIG_CPU_SPECTRE) during randconfig testing.

I don't see an easy way to add this in there, short of rewriting the
whole __get_user_err() function. Any suggestions?

      Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
