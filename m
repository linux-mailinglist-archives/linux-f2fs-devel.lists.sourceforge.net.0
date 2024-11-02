Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FE9B9E84
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 10:59:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7Aul-0007LU-Tu;
	Sat, 02 Nov 2024 09:59:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t7Auj-0007LM-TA
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 09:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=; b=UEUPlYGlTKueBQ4aPV8xqrNkCA
 s3V4LImehVdktH/XXrDm76Q+MJC6t3N3TL8QpYH+cd1nux5GzVWMd431UNCmyR1duN9+0t24hkuQS
 s8zLfkr9yercBAt73JBfYq+a2cvuqBnQ/KKCyugOC+bFv95H2zIyGQPGinafzgEnjuMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=; b=kSPvMCpg1J4qH6ab4Rrv7P0fCE
 L0Cl2yX3qVqgruWbFomRycARZ6b2pgqwyDSYwyqfCq2xx7mRyu3g95nI5aO0HjkYPJKs5vdojauXS
 1DfPOXxG7To43zEwFDQ2jfrfaLXF+ujjXb0usmlbiDq1JUPj9OQTiRmSmY0sAYyLnAkE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7Auj-0003tP-9q for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 09:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9234A5C286A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  2 Nov 2024 09:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD81C4CED5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  2 Nov 2024 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730541554;
 bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pTAZ258u/Bm55mgKfduPxcJ4+l7utIbI96FN3uHiYroZBZHAbnvfCZty3m5Rr2XH+
 F9H9kpY23mllFcm03reDqSDwYlj6z0PqW6iPcayBoJoKDOej6utxzDbE1LxiDgLJej
 urb0cE+UNWmcsBfRHpQmITbawEzxNGoWVLCC3Y8Sm8pFGBsK9d4GCjck+Inw9773Iv
 K9VihTfRaPahcmoyEauQixFxZyTUMGJWDTOfYvXPoPOgSsyaIxQpyV/cg9HQXOUiLk
 wu2j/IQnCytheMbmA1fvWXZkbzI7ui/5dw0pO/X8IJ8Hh4LoxB9jvG2GJ0onELclPL
 6WJfZCxg2RXng==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso1544461fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 Nov 2024 02:59:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHkQk2hyRGl3wphTZFW+lyRhqvzCefn1T+CCTjBkikYYWC3O+k05GBD/tb7ke2140OQ00vSFVWZJSpUuZsQbmH@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxuUBwVHJZpqIgJDyN2+JDALs++SmRzhmfL2/wTLzGKcQbJcM1y
 78dJ3JHNO+Sk3EambYFV5YgVpk+RR7krKpfAOc4jfPzfvgD7oEaqdf/CLQTzxgDK+QYzk2U3Mht
 uzjZsybXZjqojToyYdXdO+DUVUaE=
X-Google-Smtp-Source: AGHT+IEqeG8VCff0uhjP4V5ORLaNGD6KRrpJIJXC1kxDqwtW+gAEc3mfRLYGB8V+37TlYDdzVpYd4mw53pqQuHqGPG8=
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fedb7c7ad4mr47293611fa.19.1730541552417; Sat, 02 Nov 2024
 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
In-Reply-To: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
Date: Sat, 2 Nov 2024 10:58:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 2 Nov 2024 at 10:45,
 Herbert Xu <herbert@gondor.apana.org.au>
 wrote: > > Eric Biggers <ebiggers@kernel.org> wrote: > > > > While testing
 this patchset I notice that none of the crypto API driv [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7Auj-0003tP-9q
Subject: Re: [f2fs-dev] [PATCH v2 04/18] crypto: crc32 - don't unnecessarily
 register arch algorithms
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
From: Ard Biesheuvel via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, 2 Nov 2024 at 10:45, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > While testing this patchset I notice that none of the crypto API drivers for
> > crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> > system that uses those algorithms (such as ext4) just uses the library APIs now.
> > That makes the "check /proc/crypto" trick stop working anyway.
>
> What's stopping us from removing them altogether?
>

At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
sha) via the shash API.

There are some other remaining uses of crc32c using shash or sync
ahash where the algo is hardcoded (NVMe, infiniband) so I imagine
those might be candidates for conversion as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
