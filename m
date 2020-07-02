Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8ED211A9B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 05:29:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqpuc-0008Id-C2; Thu, 02 Jul 2020 03:29:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jqpub-0008IW-81
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 03:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Wq3JslNYELazNdYN3d5ZECSZKjYJO3aCNgBZjhaXHs=; b=chGYC4jd5zYZVLndnjAIVafcfb
 x8eqj/aw/dm2kUxDX5R9r+Tgl4JVRalltlXbojTN7foZXwx5xR/btAxVSvydPpP4tvbzc5Lqztggo
 hzCLOEucU1hC3Re41F47AoakQaEJcYPeufe4AidxXzU8hBLUMB4Mhz2QhvxUZ2rqs29k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Wq3JslNYELazNdYN3d5ZECSZKjYJO3aCNgBZjhaXHs=; b=f8zdmMqfodhXvPaGbRtveJ10ZA
 NqQbL6x4EmAxJLPqbwt0xm90t1Fr4c9xDPkaZ2QD2Rsb74+2eOS3urRPXZFRxuA9cy38EQtFonuL1
 2kZ/IBOgllADEdFSafFYLEaBqBM+by475fjZja4KDBZbwSFRpheibPsi4NMJ/zv+Ha5c=;
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqpuT-004Z8V-8A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 03:29:21 +0000
Received: by mail-ej1-f67.google.com with SMTP id l12so27358278ejn.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2020 20:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Wq3JslNYELazNdYN3d5ZECSZKjYJO3aCNgBZjhaXHs=;
 b=a+NSgxP/5gbvzac+43dVkFV5N+udyBau5Vkq6Lcge/c5HgfzTS9QLkOqp8f8Ez9Ptg
 yRrsq+VueZHeBR272Iii/zwYUNXw9tnSmXG3vYqbglGSHBG7wZnbaKq4EyUjanLwchdy
 hGH9r2jlHTDVCe6bUigP16w8kx/A2qtlOpKSbCKe+BStuwD/Iri9kvtE6BAVuvpvx7BG
 BAmDkHEkyV3WLkdTrDDis2cQ4G4Zxdd7RkemgTt4Kwd09dAd5KMcLGNZIaxkoSmYrq7s
 9H8y7v21oAbb8nTL2Kv6WBacixIh7vCw/yspZCiVTfo6f1LnvRAY60a/8QMmtqQXBs2D
 2zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Wq3JslNYELazNdYN3d5ZECSZKjYJO3aCNgBZjhaXHs=;
 b=WOLELvYvKsst93vgdKpBAZhimrO6ebZN9txqPspDONu3E1sZTpTijZzOmjNhrDmaR2
 aWDV7/7dLoExwXpNtfS7GUAkRKwBTyc8WNMFIyChDYVDKsVo0N13NAOEeis33GpqCcTg
 7MOnbEo3c9Eev8zaBFga7zpRIUaH5O5UI0ZxG/oXZQ0IhJnoMrJh3TawHN5ZMpXv+Lb5
 JTt0NV1IPqoGeRn5sdVLqclGZ3Eij+p1h94BJc03/Oet5ntoDpavr+zWJJNluAgWOMjl
 IiLFa5h7lBx33xFZRPDX9gdacJk+V7cn9i+9EtHl0R+fRlm5WMgxBjYM1wiNuFvHzPtk
 TVhg==
X-Gm-Message-State: AOAM532qtUIpu7JY+xxheYqe0AE3KrnCCAoQ/nzhG/wWuprGTihUCGRA
 pI1OXWiSQWhNSK5HmBn1ZKJKQrcJ9mnOUNHv8j1mqXGzZF8=
X-Google-Smtp-Source: ABdhPJy2Laxw28vFX8lT2vyBhVquCB1WCXcvESu05xt5Bw9Cxwd2GJcKH+uqynNYXl1pbCaAhCnjajzc6yYMAIbqW6s=
X-Received: by 2002:a17:906:5006:: with SMTP id
 s6mr24861034ejj.294.1593658852847; 
 Wed, 01 Jul 2020 20:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eZfsO0ZN_79oaFpooJ32WNZwwyaS4GBb+W6jR=buU-VczAA@mail.gmail.com>
 <20200701091622.GA5411@xiangao.remote.csb>
 <20200701160808.GA1704717@google.com>
In-Reply-To: <20200701160808.GA1704717@google.com>
From: lampahome <pahome.chen@mirlab.org>
Date: Thu, 2 Jul 2020 11:00:40 +0800
Message-ID: <CAB3eZftaTi9QCgbPfQ7dQdPCPJg+mN+4+pSO+Rt3VUVD4KPqVw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.67 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqpuT-004Z8V-8A
Subject: Re: [f2fs-dev] Fwd: Any tools of f2fs to inspect infos?
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
Cc: linux-fsdevel@vger.kernel.org, Gao Xiang <hsiangkao@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> # cat /sys/kernel/debug/f2fs/status ?
That's good, I saw info I need

And I also found a f2fs-tools which contains dump.f2fs
dump.f2fs -a will dump SSA info.

How to read the SSA entry info from the dumped file named dump_ssa?
It looks like:
segno: 0, Current Node

[0: d93][1: d95]...etc
[10: da2]...etc
...etc

Take [0: d93] for example, 0 means the first segment and d93 means what?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
