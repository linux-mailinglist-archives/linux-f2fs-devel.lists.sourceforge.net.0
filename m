Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D04164F6EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 03:04:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6MYq-0005AB-NW;
	Sat, 17 Dec 2022 02:04:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca.boccassi@gmail.com>) id 1p6MYp-0005A4-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 02:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcPbsVl3cOtu0VxF4tk4pBw4lW90yLxGMNm2VAvKhL8=; b=JhKyxtvf/I4Lzqxr3ONse957Se
 TpUFfIqBqDRWj6WYM2iOA+6df9B4suNUEW6jNEk4HIqPWvm40lQNHqh74uUdWRV2WN4hyew6uA2fW
 AuUV+q0+5VNUK/nkF/BOQGEk3etHgXhpVtX2Y06yP6Qh2LsbY8WgSZEtdkU5fQP+i9t8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tcPbsVl3cOtu0VxF4tk4pBw4lW90yLxGMNm2VAvKhL8=; b=RwppaCJa08gY8kKE7kmPUcTGBa
 mqTHOWx8thJk1PqqQLBAn3yikvRaIC1TfAdSsioaMqstAUbKxz5jlqQnmpDOajof4bHnO1/slrQ7s
 QNHvnBYVg2t1EK1pslJjRtxiYJhZLw/cMcoo6l1GwJiLBXJ8YkEYKVVpMQZoM0fcMcYE=;
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p6MYm-001yCf-Vb for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 02:04:23 +0000
Received: by mail-qt1-f181.google.com with SMTP id j16so4216950qtv.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Dec 2022 18:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tcPbsVl3cOtu0VxF4tk4pBw4lW90yLxGMNm2VAvKhL8=;
 b=VgN+fw6LfUNJYGFrgrBtYjCjtuzpruFD4jeUBsDNCjCH2aK+Ag5c8/ubcWHL+P8PDi
 98IxlezhmCc8WAmEnBri8c1vGI+2UX8vCaFwy4d4EfK/kSclbI7DCKaVpH07Dp6OtBuZ
 cGsEPNyvSdn25H0Py2Kooh9uFsc1PyccQrx2jeFSeyahE+WfjB9T3lYNsYdqEho9P8Ps
 Ds3gOb9XcRFFhEeYh8LgmIsZ9eQBE/6W0mE1jXq0S7gjkNcBNDYahcS0JigXhvwLCcp7
 Py0Y5cG6Szt9IxpkG5OM7Jrp5+ZG2sbqQ9la4wDpZ3GwALht5CD7P5jVFNCN+lzZJSg6
 0agw==
X-Gm-Message-State: ANoB5pmvyWOTRu1gA0Z4T58AcJLzb8i4e5jF7AYwNd9E3m7WlhFNSekf
 +i2yRHooYKucE2p0VMvOMw9aS47zed5cXg==
X-Google-Smtp-Source: AA0mqf5GGB/vtNKqfUvFlx1zhPyDNEDj0IR7aEIhy6lVTJ238vqwje3Z7dGLfR1gGEvYUuHOsK4QKw==
X-Received: by 2002:ac8:5a84:0:b0:3a7:e91e:60fd with SMTP id
 c4-20020ac85a84000000b003a7e91e60fdmr66246728qtc.62.1671242655035; 
 Fri, 16 Dec 2022 18:04:15 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05620a424a00b006a6ebde4799sm2663741qko.90.2022.12.16.18.04.13
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 18:04:14 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-3cbdd6c00adso56683007b3.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Dec 2022 18:04:13 -0800 (PST)
X-Received: by 2002:a81:ff06:0:b0:3ab:6ff4:a598 with SMTP id
 k6-20020a81ff06000000b003ab6ff4a598mr7952254ywn.425.1671242653731; Fri, 16
 Dec 2022 18:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20221208033548.122704-1-ebiggers@kernel.org>
 <eea9b4dc9314da2de39b4181a4dac59fda8b0754.camel@debian.org>
 <Y5JPRW+9dt28JpZ7@sol.localdomain>
 <00c7b6b0e2533b2bf007311c2ede64cb92a130db.camel@debian.org>
 <Y5zbNtaadNGPGHQb@sol.localdomain>
In-Reply-To: <Y5zbNtaadNGPGHQb@sol.localdomain>
From: Luca Boccassi <bluca@debian.org>
Date: Sat, 17 Dec 2022 02:04:02 +0000
X-Gmail-Original-Message-ID: <CAMw=ZnQNJjKVAf9xafashv8diab2Xg92M1+wNT3A37RMBVwR2Q@mail.gmail.com>
Message-ID: <CAMw=ZnQNJjKVAf9xafashv8diab2Xg92M1+wNT3A37RMBVwR2Q@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 16 Dec 2022 at 20:55,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > On Thu, Dec 08, 2022 at 09:37:29PM +0000, Luca Boccassi wrote:
 > > > > The second question is easy: because the kernel is th [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [luca.boccassi[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.181 listed in list.dnswl.org]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p6MYm-001yCf-Vb
Subject: Re: [f2fs-dev] [PATCH] fsverity: mark builtin signatures as
 deprecated
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
Cc: Jes Sorensen <jsorensen@meta.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 16 Dec 2022 at 20:55, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Dec 08, 2022 at 09:37:29PM +0000, Luca Boccassi wrote:
> >
> > The second question is easy: because the kernel is the right place for
> > our use case to do this verification and enforcement, exactly like dm-
> > verity does.
>
> Well, dm-verity's in-kernel signature verification support is a fairly new
> feature.  Most users of dm-verity don't use it, and will not be using it.

I'm not sure what you mean by "most users" - systemd has support for
dm-verity signatures all over the place, libcryptsetup/veritysetup
supports them, and even libmount has native first-class mount options
for them.

> > Userspace is largely untrusted, or much lower trust anyway.
>
> Yes, which means the kernel is highly trusted.  Which is why parsing complex
> binary formats, X.509 and PKCS#7, in C code in the kernel is not a great idea...

Maybe, but it's there and it's used for multiple purposes and
userspace relies on it. If you want to add a new alternative and
optional formats I don't think it would be a problem, I certainly
wouldn't mind.

Kind regards,
Luca Boccassi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
