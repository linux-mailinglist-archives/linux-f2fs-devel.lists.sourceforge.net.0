Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2B4E457E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Mar 2022 18:51:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWif2-0000RX-Jb; Tue, 22 Mar 2022 17:51:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nWif0-0000RM-L4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 17:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVTkoL6IvScupcc82uGKxY6t/dEoMhywmokb0M6nLRQ=; b=Y6fLd8cdFG0mv0Qp1S1s3ahAEJ
 nim/GhFqZmLz/gMWQWOoZ3S548gED+/eAIKLePrj7w/6xTOqXVjs7qXwEGufFOlVNUTL+BbaIANkE
 Cq9TUxsVE0JCTreNDnSxgktOEeiTxM/WUWoHnulwQb4p0+iTTHpfjjTZpvjG5F3IPMuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xVTkoL6IvScupcc82uGKxY6t/dEoMhywmokb0M6nLRQ=; b=ltnrulLwJs/x4oyF4QMvvLo7Kk
 eYSYtWwAjJsA62J4C2Pxib1Brt/sROAD7PmfPP0Jws+j9CT11vBJi8Rmbr6lygi1INiFulTMfwmVN
 GJOe1R95mADT/uxlJdExO8FzGVpQX6rt0BeUZjABjQEoJvi0v5GUu5gDNS4/0uTx1J2E=;
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nWiep-008lDL-MS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 17:51:08 +0000
Received: by mail-lj1-f179.google.com with SMTP id bn33so25011242ljb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 10:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVTkoL6IvScupcc82uGKxY6t/dEoMhywmokb0M6nLRQ=;
 b=SxzIsWJtVeaoBw1JvaNfWaX6iOJGZ1awG+smm6ZI3+2778B8fIRobefB0fFKcM4q6y
 2r4/TVzojriOvGIybdvH82leIyhyqc+uKQhIoA5t/IeWmMqoqy0YAgzr+NxHjUuOLxlx
 Q2wcsmI+T+V32+6FiBPcrXt1ViZUuv3r4KJS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVTkoL6IvScupcc82uGKxY6t/dEoMhywmokb0M6nLRQ=;
 b=2hLOPz6KpIvyMtzOl3kl03TKNRsJMt9g+r4xRpROp9WhyNEc8QRBkNLeD6usxHd8VK
 90KdjjN5lrUeeJGCEg8vpI5fdFAP1+mR9OblNoWivlwmERg7jWr+bQFeAzJTX3F6SCJv
 iFQGiBtuKkpSMzJ6Jv0Er9O/HcyY1Qmx4VLodJckESm8cON76n0J8fNaGj8rlp3UJk4r
 NFh8eQ4Wn/aWmfC0F+9KzSlJQBwU+kOHP2ilgk1b6Z7vsyLDYJb2o8v0uWyMIVs17Iue
 5ZrWCV32rCS/0BLjlrOtiPWptGRwOc2e9HEmHxX9D0Rj0LOmvKQbe/O9ICrO8ywj80hF
 WYHQ==
X-Gm-Message-State: AOAM530/I+5vP8nG37EN72g4JYVSGfBvm9sh4/tQidW2OTK43U5Hy6u1
 VW9+GfUr0ncnAfHW5om9AsMqN3vRHnNO/YGWMAM=
X-Google-Smtp-Source: ABdhPJy6LFE3y/2dx2eoF7jbqIAyvSVffU9WMVa64MwvsEYoQk2BWRoilEkeAjLFh+RmeAkdbblJuQ==
X-Received: by 2002:a05:651c:1783:b0:249:43a8:b6f9 with SMTP id
 bn3-20020a05651c178300b0024943a8b6f9mr19033043ljb.273.1647971452802; 
 Tue, 22 Mar 2022 10:50:52 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 w22-20020a2e9996000000b00249824260f8sm864915lji.25.2022.03.22.10.50.51
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 10:50:52 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id q14so11716418ljc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 10:50:51 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr20114422lji.291.1647971451760; Tue, 22
 Mar 2022 10:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
In-Reply-To: <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Mar 2022 10:50:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
Message-ID: <CAHk-=wi=Xsekgj7zfw_vpOM673CG24vznmz-yx9G05rWSAAYXg@mail.gmail.com>
To: Waiman Long <longman@redhat.com>, Tim Murray <timmurray@google.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 22,
 2022 at 10:37 AM Waiman Long <longman@redhat.com>
 wrote: > > AFAICS, the read-unfair rwsem code is created to resolve a potential
 > lock starvation problem that they found on linux-5.1 [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.179 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.179 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nWiep-008lDL-MS
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.18
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 22, 2022 at 10:37 AM Waiman Long <longman@redhat.com> wrote:
>
> AFAICS, the read-unfair rwsem code is created to resolve a potential
> lock starvation problem that they found on linux-5.10.y stable tree. I
> believe I have fixed that in the v5.11 kernel, see commit 2f06f702925
> ("locking/rwsem: Prevent potential lock starvation").

Ahh.

Adding Tim Murray to the cc, since he was the source of that odd
reader-unfair thing.

I really *really* dislike people thinking they can do locking
primitives, because history has taught us that they are wrong.

Even when people get the semantics and memory ordering right (which is
not always the case, but at least the f2fs code uses real lock
primitives - just oddly - and should thus be ok), it invariably tends
to be a sign of something else being very wrong.

And I can easily believe that in this case it's due to a rmsem issue
that was already fixed long long ago as per Waiman.

Can people please test with the actual modern rwsem code and with the
odd reader-unfair locks disabled?

            Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
