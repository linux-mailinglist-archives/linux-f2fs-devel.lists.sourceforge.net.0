Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2E4E44F3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Mar 2022 18:23:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWiE5-00079B-E5; Tue, 22 Mar 2022 17:23:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nWiE3-000794-1n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 17:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UI6IdkHO1Ce++v4SaLpwOnJOwU7d+FJPmUdI5pUTRyE=; b=YBSlVsYXwunt/SV31WX+0lVAlk
 J2206qFmvK6XCW538kspipIWsTqUo2Tjb9/FtvxXuwFLQTLBqHFB6pm5h/zMZUj8+SWd0/e1inUxd
 j6mk4H3CUXwyb7QS/4fVwJScZzPTt+G8JomBuRSpSk8nfc3gGC56UvBDR615guaEt9FU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UI6IdkHO1Ce++v4SaLpwOnJOwU7d+FJPmUdI5pUTRyE=; b=XjhKY4UY3pJi9GW1kWOtRoxRzy
 CPXDbMa/1vr4yLslz/5BFB4CclQVDtZzXxubJCSh5z22GPANESCmr+ovT+vT17Ta5cbACiraausu6
 Ujb3k2rEtCG0HGOF9IzrFf1MKNXTQIqyoZia/z80Yb4hM6A0NFZPrZvt/YCO2ttXCVDM=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nWiE0-0007jD-IO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 17:23:17 +0000
Received: by mail-lj1-f180.google.com with SMTP id q5so24865650ljb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UI6IdkHO1Ce++v4SaLpwOnJOwU7d+FJPmUdI5pUTRyE=;
 b=ODOcxjgtnTokJhq+iwqHbWCzeAZBV5BHLUnl+SfPcnQbCPUA32VYdzSgQPu+R0V5Oc
 LOX36yzr/Ok6oTqeCrrsPc9enhp/AEQ4fLBbhY9IM+kEdjwZ0kheWb9v+kvXcu2eaHu4
 49yhuMftUCepZufEyK9CKXp+4gagEX4g0EloY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UI6IdkHO1Ce++v4SaLpwOnJOwU7d+FJPmUdI5pUTRyE=;
 b=oR8E5kGGFkjdWnfPP4Wqr7Q8uWq/UHueZSbm/9nyfsLo1SnlfTUf4ywNy9RtZefOaG
 JdcELkS1EnleBNX+83Vl+HmhNHmqznUXXE0l3QzYY/jUrqfso9sb+72JZeMIBIxD7391
 9jD75fDv4LuQBGETUZlGJFIlx+NA4Mw+m/QjJr3Re7xQxOjcb/fPB/Atj070Ab7eoK0Z
 h7X2sDEG0ab+rwllR/kpGfC13K60l8x1AH11PTlJdbrkzWbW9s2bMU459/WLprnBVGGr
 9lzj9Ohrb4kwD8I0RtehgUqViMQkqs7jly5qANzIis3yKnXH8gTr/hSH+a3T8UnGb1oZ
 lJFw==
X-Gm-Message-State: AOAM533NzPc8cQQ9U901zPXeUP0neBMDTFn6Pu37u57qYHbzt0ezNDAw
 Z4er7i8szYgJApL7NbiVYfvewBxZ1Sdq/GgM4kE=
X-Google-Smtp-Source: ABdhPJzQACetAlzQCl9RSLIvObxVhW+CI3K1Ad+v2F56AzKTY+6K7HoP2uyjPMf/+Nb+BfvMrVEJgw==
X-Received: by 2002:a2e:9692:0:b0:247:e508:714e with SMTP id
 q18-20020a2e9692000000b00247e508714emr19854946lji.375.1647969788657; 
 Tue, 22 Mar 2022 10:23:08 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05651233c600b0044a3365f6f9sm587969lfg.145.2022.03.22.10.23.07
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 10:23:07 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id q14so11609653ljc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 10:23:07 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr19288283lji.152.1647969787311; Tue, 22
 Mar 2022 10:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <YjjihIZuvZpUjaSs@google.com>
In-Reply-To: <YjjihIZuvZpUjaSs@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Mar 2022 10:22:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
Message-ID: <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Waiman Long <longman@redhat.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 21,
 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > In this cycle, f2fs has some performance improvements for Android
 workloads such > as using read-unfair rwsems [...] I've pulled this, but
 that read-unfair rwsem code looks incredibly dodgy. Doing your own locking
 is always a bad sign, and it ahs traditionally come back to bite us pretty
 much every time. At least it [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.180 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nWiE0-0007jD-IO
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> In this cycle, f2fs has some performance improvements for Android workloads such
> as using read-unfair rwsems [...]

I've pulled this, but that read-unfair rwsem code looks incredibly
dodgy. Doing your own locking is always a bad sign, and it ahs
traditionally come back to bite us pretty much every time. At least it
uses real lock primitives, just in a really odd way.

The whole notion of making an rwsem unfair to readers sounds really
really odd.  I mean, the whole and only _point_ of an rwsem is to
allow concurrent readers, and traditionally if it's unfair it's unfair
to _writers_ because that tends to be better for throughput (but
unfairness can cause horrible latency).

So it smells like there's something bad going on in f2fs.

That said, I'm adding Waiman to the cc here in case he would have
ideas at least for a cleaner interface. Our rw_semaphores are
explicitly trying to be fair, because unfairness (the other way) was
such a big problem.

I'm wondering it the optimistic read lock stealing is bothering f2fs?

               Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
