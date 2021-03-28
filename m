Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D304134BEE2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 22:27:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQc0X-00007Z-FW; Sun, 28 Mar 2021 20:27:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lQc0T-000073-MH; Sun, 28 Mar 2021 20:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGgxsKIZ3ZTl676JeHS4fOQwF1EPR3Hj3EDiz1utvk4=; b=KXyUTZwrY7RbcTPoMEu47nhq7j
 sA/x6W0GRG+b52t1X/m/jWMgboCj3oN0MPdhP4yqIZAoAQ9xq7PJlRJpLkIC2KhLIzZCBk5CfOzGV
 bleQ5lnLr6BYZBtlX9+Fxp1OV2WbmBkHvfrj2tzLDbHxlhVAqJz1+ZASs9b2xJwTiGGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dGgxsKIZ3ZTl676JeHS4fOQwF1EPR3Hj3EDiz1utvk4=; b=UZ5dcpVxs/BBjUxyFT0RsHFAmu
 y7jtYO8bDZVJ+O/hypPc4D4iLfg6ugKR5+Z5bTcUjANQqQ6N54dDD73rtulipC29FONV3sJPxzdda
 8OfEnZ9ph2IYfTym/zWmDbwyG+XnpYTnjPV+ZONFfEAoclfgk25aqqGeMCZ0SJ/dVb6Q=;
Received: from mail-yb1-f169.google.com ([209.85.219.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lQc0L-005gCn-2u; Sun, 28 Mar 2021 20:27:33 +0000
Received: by mail-yb1-f169.google.com with SMTP id o66so11617555ybg.10;
 Sun, 28 Mar 2021 13:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dGgxsKIZ3ZTl676JeHS4fOQwF1EPR3Hj3EDiz1utvk4=;
 b=VS5q4VxiAS87vvfgBnL2SidrpAg/XELlQwKgngDhkEgMRpxGB39RnlEYeY8I7htT/a
 hMrPZobTQbgpX29GLYdNvayQ+u/5sPEV0eCWwm5/pEDHuG6MpZE32jZcGcUOOwcrIT1o
 9XvuWADd2LoVpLMVsJSRTy9SXnxXGV3Smn/hZ/6YBUWEmnMdsm8nxc0MUPOA2dvYf9bD
 ezss+DucD2pifMU8obi+vgXy2JT2m6tjn1x07o1MmzmRSimmgfftTFvin+efdODqMBfN
 ht/DkDR8ADwxGQ8/EvkS+qWY7szaPqsvGZiSUHqYVgVYi3QD/Gl+FVQQd84BU35qZt9n
 uIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dGgxsKIZ3ZTl676JeHS4fOQwF1EPR3Hj3EDiz1utvk4=;
 b=CQrB8MA+0KGH3QgGzEWpSRU7EpfKMtJ4rm2AX1xtT8D3Sk5EtuTdaBg08VJtuDgXPg
 a4I9kRwLVTGIOEtdlYMLWV9DLoko2R47XsjlDAKFez/AA2QcQsxsm6fyQNKDOJWsS82W
 PftL0XKLJ4cmq8BlDorUxrq9zXf4gZdpyoLA8qBBiYZrpkT2vzYcs/kDr5Qz5el/Q+Q7
 bsnQUGQbwdzdmS/9hxyVau7x/Yn9l4ZumVqe1zHy40NyFw+GyNSqHjsRyRD704bOHUeu
 szBUEWcFVMXq7mg4UY1hUSYczTcZauJZFUxb4rtDaTRpqPOH/TtfDUjbcfQ+DrUNgYsu
 6r0w==
X-Gm-Message-State: AOAM530K9P+GKy1ok/SPMHoS6jv2dUUxvM2kt90LQQXSnMBzvNr2D5qN
 Eu1hnN/G5Ami8qFwbbbJbHadq4Oghsbg3EgC2KQ=
X-Google-Smtp-Source: ABdhPJxuAdjTDxc71Oy8C0UVXTHKXzlKnq6zWZH7sSY2imXDYAxH6YgtvPjubmyw3GMWCvW4SZXi9LBHNz2ZwdihP0c=
X-Received: by 2002:a25:2d62:: with SMTP id s34mr30625290ybe.209.1616963239300; 
 Sun, 28 Mar 2021 13:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210326191859.1542272-2-nickrterrell@gmail.com>
 <202103271719.VoxPHugN-lkp@intel.com>
 <20210327214810.ldijpbr2tnkh2gce@spock.localdomain>
In-Reply-To: <20210327214810.ldijpbr2tnkh2gce@spock.localdomain>
From: Nick Terrell <nickrterrell@gmail.com>
Date: Sun, 28 Mar 2021 13:27:08 -0700
Message-ID: <CANr2DbeAXeYRMAa1UjP5kNqniWQvt2nM93ZjmWioEuR4qZxf1g@mail.gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: natalenko.name]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lQc0L-005gCn-2u
Subject: Re: [f2fs-dev] [PATCH v8 1/3] lib: zstd: Add kernel-specific API
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
Cc: squashfs-devel@lists.sourceforge.net,
 Chris Mason <chris.mason@fusionio.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 linux-btrfs@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Mar 27, 2021 at 2:48 PM Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> Hello.
>
> On Sat, Mar 27, 2021 at 05:48:01PM +0800, kernel test robot wrote:
> > >> ERROR: modpost: "ZSTD_maxCLevel" [fs/f2fs/f2fs.ko] undefined!
>
> Since f2fs can be built as a module, the following correction seems to
> be needed:

Thanks Oleksandr! Looks like f2fs has been updated to use
ZSTD_maxCLevel() since the first version of these patches. I'll put up
a new version shortly with the fix, and update my test suite to build
f2fs and other users as modules, so it can catch this.

Best,
Nick

> ```
> diff --git a/lib/zstd/compress/zstd_compress.c b/lib/zstd/compress/zstd_compress.c
> index 9c998052a0e5..584c92c51169 100644
> --- a/lib/zstd/compress/zstd_compress.c
> +++ b/lib/zstd/compress/zstd_compress.c
> @@ -4860,6 +4860,7 @@ size_t ZSTD_endStream(ZSTD_CStream* zcs, ZSTD_outBuffer* output)
>
>  #define ZSTD_MAX_CLEVEL     22
>  int ZSTD_maxCLevel(void) { return ZSTD_MAX_CLEVEL; }
> +EXPORT_SYMBOL(ZSTD_maxCLevel);
>  int ZSTD_minCLevel(void) { return (int)-ZSTD_TARGETLENGTH_MAX; }
>
>  static const ZSTD_compressionParameters ZSTD_defaultCParameters[4][ZSTD_MAX_CLEVEL+1] = {
> ```
>
> Not sure if the same should be done for `ZSTD_minCLevel()` since I don't
> see it being used anywhere else.
>
> --
>   Oleksandr Natalenko (post-factum)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
