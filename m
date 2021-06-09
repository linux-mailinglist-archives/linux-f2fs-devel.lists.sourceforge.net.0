Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAC3A0A31
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jun 2021 04:46:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqoEL-0000aP-2O; Wed, 09 Jun 2021 02:46:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <satyaprateek2357@gmail.com>) id 1lqoEK-0000aI-5q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 02:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=szkL7ncrfM2hy/BvMWM0s5Huh4IFZhuvbwx23L8o1dE=; b=aY8OT7E8d+Z/6G9OxhNZbD3Ya3
 0fQZYo+zRx9++GP2qykkT3sf5qoWwZBlCpADxhkG+QXrvVsOug+hJ67BqGmhFwcNUI2lSang1XwIW
 KW3BkqhIRq0zJXwo9bCIrCLQKSy0eJxWMy+Ih80mrm77p68NKrxB/84bu40ETgGLirX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=szkL7ncrfM2hy/BvMWM0s5Huh4IFZhuvbwx23L8o1dE=; b=awTdWo4jShyMH/+8quNxXICh3S
 q73aPbS8k+9u6/DgUNL5+dLQXecofJR9RwWSPT6aPfqpfdasGs1cCCMkzB0KfKlmWg/uA76RSa6gG
 OIEj/AUuEVOrBl5D1iQNb7VB7Z/+EQOsvOaKmkgzcxD9bqysyOVO8ZPfdwIgAmV1VE3s=;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lqoEH-001bIY-2p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 02:46:09 +0000
Received: by mail-oi1-f171.google.com with SMTP id a21so23729763oiw.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Jun 2021 19:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=szkL7ncrfM2hy/BvMWM0s5Huh4IFZhuvbwx23L8o1dE=;
 b=kRNocKu1gPoPbfo4iolUj+fUN0EREEirmiGidoFnX3OlcUGENGem6uJtuermuHDLWl
 6NTwsp+KT6DHNDCsSdJIcjSB2O3cYDLvKnx7AjE8sFF4f1TPUY83x51r4OB1Iv+CelCy
 REVQJkeVw8tUSiE2z/fkU4vtmyD/SdARACmZusH5g6vo3dKMJE9v7ybhtX1wBtzkXzlI
 ChJVBvgn3wklKGiXtJglbRGRQ48pfXa6RDTfcqZetBdcx2dXTrFfnvJqssiamvm+Da55
 R0dgapnLGDX/4EoCRPOZ5CcVkixn0ZJbf8wKGM+o0TrgUfzpX/WgytOvdxlIqmnNqqr5
 9ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=szkL7ncrfM2hy/BvMWM0s5Huh4IFZhuvbwx23L8o1dE=;
 b=XmHOYNkf566/YW0TvJF61XyE2+w1PPBTL8JkCqJsSVHnVHjyZ7pviHwbjIe+hW+gKY
 yL970O5YMMGNN6gOxtP4Rg2bVhY2KLaTLHb00YsxsA3J2Ooy+mL9pPqqpIQxMrwPFFx/
 ZGOt23Pdey/NHjf+iAF84K15c15kqzX66Y0Fj4segiGa1M+3V8db6IExqSLHgv7vPuT3
 8H0v4jXNl8cmcVfYCeBYlv5GP/VK4HdVhM6cbXAAf7NnuEVt7OxjPnuQOhqaD6WEo3Xs
 I+On0sxjO1S2A3U/YmVOtVOgX0BPuxD91e300S9P7mUSuPGK5MWTlMN0XEPWrbthRUfy
 lxuA==
X-Gm-Message-State: AOAM531wm3HwdNDGE3qoZSD/6JAcemZnZmslULkRYsgVyR6wf/zSsGxS
 akxccbmyPsUmCFuvDfFGneQ=
X-Google-Smtp-Source: ABdhPJwZLlD+UF6khW8UPly7po2FnFZ1ZDLO7TRTFA1MvABfjVFHSawElsb+ga6K3tgio2dxAtVyTg==
X-Received: by 2002:a05:6808:14d0:: with SMTP id
 f16mr4819978oiw.156.1623206759340; 
 Tue, 08 Jun 2021 19:45:59 -0700 (PDT)
Received: from fractal ([2600:1700:1151:2380:53e3:3a03:bcf3:da13])
 by smtp.gmail.com with ESMTPSA id d136sm444959oib.4.2021.06.08.19.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 19:45:58 -0700 (PDT)
Date: Tue, 8 Jun 2021 19:45:56 -0700
From: Satya Tangirala <satyaprateek2357@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20210609024556.GA11153@fractal>
References: <20210121230336.1373726-1-satyat@google.com>
 <CAF2Aj3jbEnnG1-bHARSt6xF12VKttg7Bt52gV=bEQUkaspDC9w@mail.gmail.com>
 <YK09eG0xm9dphL/1@google.com> <20210526080224.GI4005783@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526080224.GI4005783@dell>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (satyaprateek2357[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (satyaprateek2357[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lqoEH-001bIY-2p
Subject: Re: [f2fs-dev] [PATCH v8 0/8] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 26, 2021 at 09:02:24AM +0100, Lee Jones wrote:
> On Tue, 25 May 2021, Satya Tangirala wrote:
> 65;6200;1c
> > On Tue, May 25, 2021 at 01:57:28PM +0100, Lee Jones wrote:
> > > On Thu, 21 Jan 2021 at 23:06, Satya Tangirala <satyat@google.com> wrote:
> > > 
> > > > This patch series adds support for direct I/O with fscrypt using
> > > > blk-crypto.
> > > >
> > > 
> > > Is there an update on this set please?
> > > 
> > > I can't seem to find any reviews or follow-up since v8 was posted back in
> > > January.
> > > 
> > This patchset relies on the block layer fixes patchset here
> > https://lore.kernel.org/linux-block/20210325212609.492188-1-satyat@google.com/
> > That said, I haven't been able to actively work on both the patchsets
> > for a while, but I'll send out updates for both patchsets over the
> > next week or so.
> 
> Thanks Satya, I'd appreciate that.
FYI I sent out an updated patch series last week at
https://lore.kernel.org/linux-fscrypt/20210604210908.2105870-1-satyat@google.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
