Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B69693ECF01
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 09:11:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFWmU-0005MF-M7; Mon, 16 Aug 2021 07:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mFWmS-0005Lw-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 07:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K1MP/CLQ5UxOhTtXkR4NWOKZQUDna/VXaqmZ5Y18D+Y=; b=S4v8JQX5LkK5X7GYP3os51B5Ho
 GC4Vgd73wCv2a8NJeM6WZzAJm/81Dr/mGH3Xb0aSqrH8zuzHOm3lPx6ydZu9lqsjdyst2ZswNHpl8
 8z/2KQTNnyswhYOiAZCHDrVGN6fNzJwnE+2qRI51b73ALyRWJqyLbMbi1K+XqEkV2KpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K1MP/CLQ5UxOhTtXkR4NWOKZQUDna/VXaqmZ5Y18D+Y=; b=hHqJq9FqkhJrucuCIud1Y1RaIK
 3vauX7gM/vmsa/nDhgULBtrv8tuxhYCvsdIltcDFuRNFN30006wReJTiN4WnRicBoB5FWiLB5DX69
 dF23lJxM05F9+Prz0iG0nCzesN93UxwV808DAaBXjoVDb5skVtl0qlm/URvqh6vZtmLs=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mFWmR-00021R-SS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 07:11:32 +0000
Received: by mail-lj1-f180.google.com with SMTP id y6so8912691lje.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Aug 2021 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1MP/CLQ5UxOhTtXkR4NWOKZQUDna/VXaqmZ5Y18D+Y=;
 b=dv4s8wYRv2UexG5fYe/L9LefRe2lJY2AlCbdse1UgIPHE5tFl4/+9gzjG1+20V78Y7
 XFuieXknWYc1tLKwQXAjEVv8RK65X5Bx7FaNsk3UjQjpq09Z85GgcDa/pr0hg3Od1IkP
 LDHM3JNzHl/+mrYSlGA+TPbiptx+ajmIft7bM9Z4UvHqp5BUP6WzRSQvWXpcrgHK6Nw2
 /JZ55NGMyfaG2OLnF/pE3tthDNGGbeTg+oLJULUAvNt5iR+KNZrmzUgfh9NPTeET5VG4
 hhuXfsSwd9VG1coXJBUPPJoh/K7/pMYw0p4l736zMLNx5S2BrUZb+bRxIQe0D4/055Fu
 UNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1MP/CLQ5UxOhTtXkR4NWOKZQUDna/VXaqmZ5Y18D+Y=;
 b=rlL+YwyywXuuT5BRbxHs2jbViUVPQd71I1gvlaodyv6Wy3St9FNBJtsluMt/HMAq+1
 tqdXWy0q1iqOKXo0qDUoJcoOZ+2L/o4Nt3hX5lRiAC7k+45lW+E9hiUv2xnbhXX0cn/2
 f05zLQXc8jUiIuHU43i7YX/PxCxv9HVFIGy2d1ZpNj7FBlttC2Gv3v10EQeIKPvDkmRX
 7dumk9q0h6uGKC3u2rejBSF4NkX+Q5SWehQ/hsjXbMwAz6gYubYgWGVD2I/0J7g8a93k
 hZhbPODCcRNHpKehKR9VQdiG1ctvrVPg3zMVClHeknFq7W1Ou/BGjzuqbhykaRc6+cp1
 FOSg==
X-Gm-Message-State: AOAM532rok35YZfgZkw7kPTbRPFAtfMnxmx95Wa4xsxjXBZHur9bh38K
 VCZYHBVnn/asZ2eiilpkurc/3LKhO3Pd6On2+3U=
X-Google-Smtp-Source: ABdhPJxzchjcXdTB0dGFPYdZFPWFClqWlEArFtzNwGoDEFnWTpe3bAsEm+C54IrQR9MnM1ahgquwwvVdQmKX83Wh9sg=
X-Received: by 2002:a2e:2d01:: with SMTP id t1mr11200831ljt.400.1629097885325; 
 Mon, 16 Aug 2021 00:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210809185449.2565768-1-daeho43@gmail.com>
 <425daf77-8020-26ce-dc9f-019d9a881b78@kernel.org>
 <CACOAw_xTh_HZizaVzDNjnVswu_OQwOjzEWRNxouGtM9E5qj6Pg@mail.gmail.com>
 <071534dd-cf10-38d3-b83b-c833f9c0a70a@kernel.org>
 <CACOAw_ye4y-njHbewXsvVr3gTT4URsw7VH4HM_D_g=zntwjtdA@mail.gmail.com>
 <dc21e445-126d-ef74-3d09-c5a71782ed2a@kernel.org>
In-Reply-To: <dc21e445-126d-ef74-3d09-c5a71782ed2a@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 16 Aug 2021 00:11:14 -0700
Message-ID: <CACOAw_x1F6Uu3p9RA8S7XBXnEYsnjPFY0JSG_VqBLrUjqAGeCA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.180 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.180 listed in wl.mailspike.net]
X-Headers-End: 1mFWmR-00021R-SS
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce blk_alloc_mode mount
 option
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

I agree with you. But still I think "fragment" mode should work even
in low free space conditions.
Otherwise, it will be seeking the free blocks again and again like a busy loop.
Or we can change the block allocation way into adaptive mode under low
free space even staying in "fragment" mode.

If we can handle this, we might use "fragment" mode for both
simulating after fragmentation and making the filesystem fragmented.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
