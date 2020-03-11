Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDFE181FB8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 18:41:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC5Mf-00058Z-T9; Wed, 11 Mar 2020 17:41:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <torvalds@linuxfoundation.org>) id 1jC5Me-00058Q-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 17:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QCN3ckDZYTgKsnmWN3MWB/SQ8UiGeh+NLtW3p106h1c=; b=GZ+wrT1wYg+CQ6eKyYYoLCR8pg
 Olsb4unvP0Cg1fwNZ2MOC7nn3Yq+AVP4a8Ld9a4A5I3iGAqpHO913S54JCmhpraIeuj29+SmTAsv5
 GuI5+o2lhBcMH2p4QFRY/8AO8krYzWImoOZW8evWiCG31vLt8UYlf763kqZDVOOUm/MQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QCN3ckDZYTgKsnmWN3MWB/SQ8UiGeh+NLtW3p106h1c=; b=AHSZfXcaBCoCS+fvbRK2l21IwB
 zOpjYDZQhgXQo6d7D1Yxt7zTbol3jOmO58EQjpSpnYdq4ycDMKkcQydtrK3nNcNR+AwiLp9vxtDaI
 Ll1RgJKj1A1vYAAiEm9MdfrywScq5C3RSAPQfzQjgw+EZ5H47y6ycQLWbeGyLbB+41mc=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jC5MX-008cHM-MF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 17:41:52 +0000
Received: by mail-lf1-f68.google.com with SMTP id j17so2448913lfe.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2020 10:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCN3ckDZYTgKsnmWN3MWB/SQ8UiGeh+NLtW3p106h1c=;
 b=YSCkVqVocKNnlqDlgiECoEadYMt16n+8MdHbaK6Gz4V/6O09UsUL+qmuweL0ZNYT2i
 Sr+AidQV9hb4/BL4It5d/F0SRAJZtYfVSGXINNlDJSfUWwK0NTXRvpGwgZRmxC5/f8Gy
 rsjNb5cScHJ2Hv2E8KQjB7u3AijuPnYd/xZas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCN3ckDZYTgKsnmWN3MWB/SQ8UiGeh+NLtW3p106h1c=;
 b=dmSbR94T+dUeC5tnJeL8qApPN3GoFHnmh79IS5746VcT9pW14WMEy19ENEZmfS7AEx
 eWqOB2QNDrUyT5BiRXJqVbN2mo6ZFLTmuDB29WASEyEYng0W/LDjGjZ9BlfvWNEh7j3/
 RkHxTJA2xxDWk1TdkgjgJXisM0V/lalQp8wQ1JqYvpfdK+9Z532hyFlC3aTjwuEmm+xD
 UtmBW5d5Qyx9LQQQW2AbaISUMLdC2yc7UpMFjsnowcHc4gk2CWwLoJqwWeXMob+VsM6q
 3Aerx1+eipFmrePjkUGp5Kqp1GBzGT+18F4RNi6oNBIm1zC8FWmUz268+VP8dKgQZInr
 FTRg==
X-Gm-Message-State: ANhLgQ2v5z4jHxdVn0avB+CeEH7VaqU6oM2UcdGNMdBk97Hg9Yx0S0fg
 hu/h3rzoFveNJR6ziUbvJoDQ0Q32fwA=
X-Google-Smtp-Source: ADFU+vtj5z1VdngNqfcLed8u/WsHkW/23E5Ao69iIPEpMD0RyN8VOyuStTlM2jBFpQBxMHNwDE/n9g==
X-Received: by 2002:a19:ac42:: with SMTP id r2mr2815721lfc.38.1583948498263;
 Wed, 11 Mar 2020 10:41:38 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id w9sm2016790lfk.4.2020.03.11.10.41.37
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 10:41:37 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id e18so3276686ljn.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2020 10:41:37 -0700 (PDT)
X-Received: by 2002:a2e:5850:: with SMTP id x16mr2584551ljd.209.1583948497068; 
 Wed, 11 Mar 2020 10:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200311162735.GA152176@google.com>
 <CAHk-=wjES_Si7rUtu_EuYu4PDz4OGdA4BWhYGJ=zOoJiELiykw@mail.gmail.com>
 <20200311173513.GA261045@google.com>
In-Reply-To: <20200311173513.GA261045@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Mar 2020 10:41:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVpnOo9MyOpHxAyuv0ZBGCsW2tMmOtwb+6CX-taKRtKQ@mail.gmail.com>
Message-ID: <CAHk-=wiVpnOo9MyOpHxAyuv0ZBGCsW2tMmOtwb+6CX-taKRtKQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jC5MX-008cHM-MF
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.6-rc6
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 11, 2020 at 10:35 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> I actually merged the last three patches which were introduced yesterday.
>
> Others were merged over a week ago.

No, three were done just before you sent the pull request, and then
seven others were done yesterday.

Yes, the rest were a week ago.

But basically, by rc6, I want to get the warm and fuzzies that the
code has been tested, seen review, and isn't some last-minute
addition.

               Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
