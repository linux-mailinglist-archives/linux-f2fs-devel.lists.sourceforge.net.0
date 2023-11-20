Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C197F1DB7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 21:03:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5AUg-0006Px-Bd;
	Mon, 20 Nov 2023 20:03:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1r5AUe-0006Pq-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 20:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bt4pvFuDO1h6defOBt353/3Gu2TKhLOMI2PK2iWD2i4=; b=mW23wIqXMEO3Udd391LZQAkMD1
 TZUKS9kfmIZdbQ2wnaxgRipsqJYzyZs3Uhg+BtG2SWzA/nY0fIA3Hkrv8U0POJtIS/NBV5lBbq+PJ
 Tzj7OreFPdJxHx8v/e6dDVMcGFwKa8C4qadysD4mH/TYg12LREm76XLpV/fwhGCVf320=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bt4pvFuDO1h6defOBt353/3Gu2TKhLOMI2PK2iWD2i4=; b=WumftuXL3Q54gmVbQFELp6D2mT
 qqbizMywWLd3PAYM6Rlor6I2RYWcRAVuRVBkvlvVW4ajtXRnKZCwc0vgvpQASD+lDZJc8rvEgQECS
 8vK5ZUAx+/JkdMNuwulDPsodrM/DmV2RLNNPOx4C1qoTthOpiqImnxwtA6T0NetopJQg=;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r5AUb-0004K5-Qt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 20:03:39 +0000
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a013d22effcso30289466b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Nov 2023 12:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1700510611; x=1701115411;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bt4pvFuDO1h6defOBt353/3Gu2TKhLOMI2PK2iWD2i4=;
 b=LTwuSQvn2+v9BNDD1FY1FAunhtddXvThxV7CV+WQDVzEqFNzdHZmAWoU/IFBvs6SCw
 hxI4Qq9jelxqffRuSiLVnsXrP5T//PoYwqJ3MgLmggoELjN2xbWBF0Rxeahhjpae4PzA
 Vkws67ehDwyCOCC+zuSD8fttVWHDcm4FBL56M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700510611; x=1701115411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bt4pvFuDO1h6defOBt353/3Gu2TKhLOMI2PK2iWD2i4=;
 b=LtBJp110idUOuHAY7W1j6YVy5tfQeaRczoK81oAFaoloy7WXK2pKcYxJW5IpzDRHP4
 UXz3wPrLtCNAHBeAHjU65YEk/om4/IY4mNBqPYjwneMZ7Z5T+2JMfmklsputracG1rw6
 yg2TBNC73EWXl23gyAZj5cMeudX8tkm1FVxmg5aHrsJkF2eCs0UHOPH/wgR20rkT1746
 9xp3ToFlChewt6sCo5FEHd+gWxaWa8X1tuCFjXbNWXfCDxaI17GQU6F2Y6RylIpnVsfL
 mUCi6zgpxbbjfQsJzkuHgZGn6VUd/QZKDfJmb4l+tQSDtQBTmJv6ZhBjbMKqteN18KMS
 sSag==
X-Gm-Message-State: AOJu0YwNMc2IeILx1Q66XF8+5MC/gaxNAyCUiuHBnBxOh+/oymXyfzA9
 P4nDVgZ5J1Kw1JfeBSG8hldMfov/0VARyfa5yR+LVA==
X-Google-Smtp-Source: AGHT+IF466fZnBY6ZQMSsWdr/tX5C9tf/CY6S5GjstLAdRZ341HkF9GYPJ36pD3IDJx5gPkAYn0Hew==
X-Received: by 2002:a05:6512:3084:b0:50a:b2d4:76a0 with SMTP id
 z4-20020a056512308400b0050ab2d476a0mr1953351lfd.16.1700503689460; 
 Mon, 20 Nov 2023 10:08:09 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 f24-20020a056402005800b00542db304680sm3735490edu.63.2023.11.20.10.08.08
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 10:08:08 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-548f74348f7so3596a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Nov 2023 10:08:08 -0800 (PST)
X-Received: by 2002:a05:6402:150f:b0:548:7900:2d0c with SMTP id
 f15-20020a056402150f00b0054879002d0cmr100825edw.40.1700503687823; Mon, 20 Nov
 2023 10:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
In-Reply-To: <20231120-nihilismus-verehren-f2b932b799e0@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Nov 2023 10:07:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
Message-ID: <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 20 Nov 2023 at 07:06,
 Christian Brauner <brauner@kernel.org>
 wrote: > > My current understanding is that core dcache stuff is usually
 handled by > Al. And he's got a dcache branches sitting in [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.48 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.48 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5AUb-0004K5-Qt
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 20 Nov 2023 at 07:06, Christian Brauner <brauner@kernel.org> wrote:
>
> My current understanding is that core dcache stuff is usually handled by
> Al. And he's got a dcache branches sitting in his tree.
>
> So this isn't me ignoring you in any way. My hands are tied and so I
> can't sort this out for you easily.

Well, we all know - very much including Al - that Al isn't always the
most responsive person, and tends to have his own ratholes that he
dives deep into.

The good news is that I do know the dcache code pretty well, and while
I really would like Al to deal with any locking issues (because
"pretty well" is not "as well as Al Viro"), for just about any other
issue I'll happily take pulls from you.

I dislike case folding with a passion - it's about the worst design
decision a filesystem can ever do - but the other side of that is that
if you have to have case folding, the last thing you want to do is to
have each filesystem deal with that sh*t-for-brains decision itself.

So moving more support for case folding into the VFS so that the
horrid thing at least gets better support is something I'm perfectly
fine with despite my dislike of it.

Of course, "do it in shared generic code" doesn't tend to really fix
the braindamage, but at least it's now shared braindamage and not
spread out all over. I'm looking at things like
generic_ci_d_compare(), and it hurts to see the mindless "let's do
lookups and compares one utf8 character at a time". What a disgrace.
Somebody either *really* didn't care, or was a Unicode person who
didn't understand the point of UTF-8.

Oh well. I guess people went "this is going to suck anyway, so let's
make sure it *really* sucks".

The patches look fine to me. Al - do you even care about them?

                   Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
