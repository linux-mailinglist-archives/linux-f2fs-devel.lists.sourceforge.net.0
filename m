Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7A2766BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Sep 2020 05:06:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLHaS-0005tn-Hl; Thu, 24 Sep 2020 03:06:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kLHaP-0005tY-Ql; Thu, 24 Sep 2020 03:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u+AMXhkc8gQOOArFCuMtLDRMg0ycafzPZM+2quzOAFg=; b=gJBhIXbP4uVRfcZt843pVxpBVY
 RmS2c2DHzXCOtgMBU5GndNcaTRuiB8I5gns8OwTBavEOvqv4lXJNrfFyEvtldzjNeaGoxUdrSlmVO
 q6prLdZVWzHHKJ9M3+BW247Ga7ExOKZ9WOpIolw1yoFzQazdTjYLNuROtzSxJ2dyeErE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+AMXhkc8gQOOArFCuMtLDRMg0ycafzPZM+2quzOAFg=; b=KFzKIgAFOesq/IbxB5kSFyJTtE
 tFTKFdVzfzH54UnQfZRuSMWn8CbrXNN3LoP5cUsc4Y+5tURp7lWebPVIzdUMbxNVDRbUfz1Z5Xzkw
 yPDxhTxtKsxm5K22Mg1tPjEgTmzVbPPoWwPtdUx4p58yQyOHv73xUDYc3ika7RHAtaZI=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLHaG-005Syj-Tw; Thu, 24 Sep 2020 03:06:21 +0000
Received: by mail-wr1-f66.google.com with SMTP id c18so2075063wrm.9;
 Wed, 23 Sep 2020 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+AMXhkc8gQOOArFCuMtLDRMg0ycafzPZM+2quzOAFg=;
 b=KS+yIFZUeS/PUDTUKGGTQsqHupnyMwA3s1N/ks81eixFP5uVUzK0y/63T5cNr327Xx
 6LoIbWbD/nyUdI0AvFgGz4uRQKOIfztyhwGOK6Ay2O+VA4d5ihkNjpm6Uv3OoSQdf0KF
 K9b40mOtqTjqllMcCikNhed+QaCG7keqm67Bzd5+uZZq4zbv6+USoQ2ysqGaRFOev7wk
 dk7ARQDWHpeumc9maX1arMdJDZx9hflMaO/lygxJz6cMjctMMqLj5Nn/leFYnL2sYmrY
 2nrnP911NBgl9V4aPQQKn7ZCQpcKXoqGBZbdbA2Qz9I+K8qMyWgYmwONaWvXck28s0g2
 6TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+AMXhkc8gQOOArFCuMtLDRMg0ycafzPZM+2quzOAFg=;
 b=tZxmw2ssievAbFEc9RO04M9wa1Y7MQBSIn7cGS3d+duem0zZ3lzAcT+VxEbsJv/RWY
 yqhgOTmCCSfxOWcLw3WJ2NC4wkN5K9At+QwbqthE4Y/Izt3P0+L7b/MhONG+MYlCa/r7
 OG5yRIxKl2XEF3tQwoxNmnIU1SBXbVS4Fdbv9WF931TVXtj4IRZBNbYcpXidBxq/O5iN
 nfIlzGgMQDn58qC6HSuTxfR0x1w5jWKQGykqfkqJvK3c8Q4LhkW9TkVnoy7wVOikz26Y
 HI9iyweHln/IFNAvH06G6JiuvVYf4kBSSwPmikQaa9JQ3KTrX1nI+DvA7oTzCEgcQ7/s
 T66A==
X-Gm-Message-State: AOAM5337EcA99datfoKxhsVAdn/r9DVtsYLJOKETdJDUBnBkqkk2jBZH
 7h6qK3jDXKhKZOpBBoskQRpJDenRCO15YcpKo/8=
X-Google-Smtp-Source: ABdhPJzvlLf/ESS96Z0UOO6R+IKLhoTuNhlPNNMBLXe0ODwve4RRV/DbrSW1+Y9zuttOdAXJF44gEkp5NmSJlJxn2/o=
X-Received: by 2002:adf:80e4:: with SMTP id 91mr2546542wrl.223.1600916766170; 
 Wed, 23 Sep 2020 20:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200923224206.68968-4-nickrterrell@gmail.com>
 <202009241007.ZmzDeiuB%lkp@intel.com>
In-Reply-To: <202009241007.ZmzDeiuB%lkp@intel.com>
From: Nick Terrell <nickrterrell@gmail.com>
Date: Wed, 23 Sep 2020 20:05:55 -0700
Message-ID: <CANr2Dbd1DXb66_Gf9aAB7PCn6=yz_Or5_JWZtm_cHndYrO+28A@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: githubusercontent.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kLHaG-005Syj-Tw
Subject: Re: [f2fs-dev] [PATCH v3 3/9] lib: zstd: Upgrade to latest upstream
 zstd version 1.4.6
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
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 23, 2020 at 7:28 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Nick,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on kdave/for-next]
> [also build test ERROR on f2fs/dev-test linus/master v5.9-rc6 next-20200923]
> [cannot apply to cryptodev/master crypto/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Nick-Terrell/Update-to-zstd-1-4-6/20200924-064102
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
> config: h8300-randconfig-p002-20200923 (attached as .config)
> compiler: h8300-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=h8300
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    h8300-linux-ld: lib/zstd/common/entropy_common.o: in function `MEM_swap32':
> >> lib/zstd/common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/common/fse_decompress.o: in function `MEM_swap32':
> >> lib/zstd/common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/common/fse_decompress.o:lib/zstd/common/mem.h:179: more undefined references to `__bswapsi2' follow
>    h8300-linux-ld: lib/zstd/compress/zstd_compress.o: in function `MEM_swap64':
> >> lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/compress/zstd_compress.o: in function `MEM_swap32':
> >> lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/compress/zstd_compress.o:lib/zstd/compress/../common/mem.h:179: more undefined references to `__bswapsi2' follow
>    h8300-linux-ld: lib/zstd/compress/zstd_double_fast.o: in function `MEM_swap64':
> >> lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/compress/zstd_double_fast.o:lib/zstd/compress/../common/mem.h:192: more undefined references to `__bswapdi2' follow
>    h8300-linux-ld: lib/zstd/compress/zstd_opt.o: in function `MEM_swap32':
> >> lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/compress/zstd_opt.o: in function `MEM_swap64':
> >> lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
> >> h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/compress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/compress/zstd_opt.o:lib/zstd/compress/../common/mem.h:192: more undefined references to `__bswapdi2' follow
>    h8300-linux-ld: lib/zstd/decompress/huf_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/huf_decompress.o:lib/zstd/decompress/../common/mem.h:179: more undefined references to `__bswapsi2' follow
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap64':
>    lib/zstd/decompress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o:lib/zstd/decompress/../common/mem.h:179: more undefined references to `__bswapsi2' follow
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap64':
>    lib/zstd/decompress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap64':
>    lib/zstd/decompress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap64':
>    lib/zstd/decompress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap64':
>    lib/zstd/decompress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o:lib/zstd/decompress/../common/mem.h:179: more undefined references to `__bswapsi2' follow
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap64':
>    lib/zstd/decompress/../common/mem.h:192: undefined reference to `__bswapdi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress_block.o: in function `MEM_swap32':
>    lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/../common/mem.h:179: undefined reference to `__bswapsi2'
>    h8300-linux-ld: lib/zstd/decompress/zstd_decompress_block.o:lib/zstd/decompress/../common/mem.h:179: more undefined references to `__bswapsi2' follow

Looks like I need to fix these. It looks like I should use the swab*()
functions from include/linux/swab.h. I'll put up a v4 shortly.

> cppcheck warnings: (new ones prefixed by >>)
>
> >> lib/zstd/decompress/zstd_ddict.c:147:32: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
>        if (!customMem.customAlloc ^ !customMem.customFree) return NULL;
>                                   ^

This one is a bit silly, but I will fix it.

> >> lib/zstd/common/zstd_deps.h:131:0: warning: syntax error [syntaxError]
>
>    ^
> >> lib/zstd/compress/zstd_ldm.c:571:0: warning: Array 'rep[3]' accessed at index 3, which is out of bounds. [arrayIndexOutOfBounds]
>        ZSTD_blockCompressor const blockCompressor =
>    ^

This seems like a false positive.

> >> lib/zstd/common/zstd_deps.h:131:0: warning: syntax error [syntaxError]
>
>    ^
> >> lib/zstd/decompress/zstd_decompress.c:133:32: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
>        if (!customMem.customAlloc ^ !customMem.customFree) return NULL;
>                                   ^
> >> lib/zstd/decompress/zstd_decompress.c:1751:28: warning: Variable 'zds->inPos' is reassigned a value before the old one has been used. [redundantAssignment]
>                    zds->inPos = 0;   /* input is consumed */
>                               ^
>    lib/zstd/decompress/zstd_decompress.c:1747:28: note: Variable 'zds->inPos' is reassigned a value before the old one has been used.
>                    zds->inPos += loadedSize;
>                               ^
>    lib/zstd/decompress/zstd_decompress.c:1751:28: note: Variable 'zds->inPos' is reassigned a value before the old one has been used.
>                    zds->inPos = 0;   /* input is consumed */
>                               ^

This is a false positive. It is incorrectly analyzing the control flow.

> >> lib/zstd/common/zstd_deps.h:131:0: warning: syntax error [syntaxError]
>
>    ^
> >> lib/zstd/compress/zstd_compress.c:84:32: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
>        if (!customMem.customAlloc ^ !customMem.customFree) return NULL;
>                                   ^
>    lib/zstd/compress/zstd_compress.c:200:32: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
>        if (!customMem.customAlloc ^ !customMem.customFree) return NULL;
>                                   ^
>    lib/zstd/compress/zstd_compress.c:3345:32: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
>        if (!customMem.customAlloc ^ !customMem.customFree) return NULL;
>                                   ^
> >> lib/zstd/common/zstd_internal.h:401:27: warning: Array 'DeBruijnClz[32]' accessed at index 509099, which is out of bounds. [arrayIndexOutOfBounds]
>            return DeBruijnClz[(v * 0x07C4ACDDU) >> 27];
>                              ^

This is a false positive. v is a 32-bit integer, so the index must be
less than 2^(32-27) = 32, which is the size of the array.

>    lib/zstd/compress/zstd_compress.c:3494:40: note: Assignment 'limitedSrcSize=(uint32_t)(pledgedSrcSize<524288U?pledgedSrcSize:524288U)', assigned value is 524288
>                U32 const limitedSrcSize = (U32)MIN(pledgedSrcSize, 1U << 19);
>                                           ^
>    lib/zstd/compress/zstd_compress.c:3495:90: note: Calling function 'ZSTD_highbit32', 1st argument 'limitedSrcSize-1' value is 524287
>                U32 const limitedSrcLog = limitedSrcSize > 1 ? ZSTD_highbit32(limitedSrcSize - 1) + 1 : 1;
>                                                                                             ^
>    lib/zstd/common/zstd_internal.h:395:17: note: Assignment 'v=val', assigned value is 524287
>            U32 v = val;
>                    ^
>    lib/zstd/common/zstd_internal.h:396:0: note: Assignment 'v=v|(v>>1)', assigned value is 524287
>            v |= v >> 1;
>    ^
>    lib/zstd/common/zstd_internal.h:397:0: note: Assignment 'v=v|(v>>2)', assigned value is 524287
>            v |= v >> 2;
>    ^
>    lib/zstd/common/zstd_internal.h:398:0: note: Assignment 'v=v|(v>>4)', assigned value is 524287
>            v |= v >> 4;
>    ^
>    lib/zstd/common/zstd_internal.h:399:0: note: Assignment 'v=v|(v>>8)', assigned value is 524287
>            v |= v >> 8;
>    ^
>    lib/zstd/common/zstd_internal.h:400:0: note: Assignment 'v=v|(v>>16)', assigned value is 524287
>            v |= v >> 16;
>    ^
>    lib/zstd/common/zstd_internal.h:401:27: note: Array index out of bounds
>            return DeBruijnClz[(v * 0x07C4ACDDU) >> 27];
>                              ^
> >> lib/zstd/common/zstd_deps.h:131:0: warning: syntax error [syntaxError]
>
>    ^
> >> lib/zstd/compress/zstd_lazy.c:663:74: warning: Overflow in pointer arithmetic, NULL pointer is subtracted. [nullPointerArithmetic]
>        const U32 dictAndPrefixLength = (U32)((ip - prefixLowest) + (dictEnd - dictLowest));
>                                                                             ^
>    lib/zstd/compress/zstd_lazy.c:658:70: note: Assignment 'dictEnd=dictMode==ZSTD_dictMatchState?dms->window.nextSrc:NULL', assigned value is 0
>        const BYTE* const dictEnd      = dictMode == ZSTD_dictMatchState ?
>                                                                         ^
>    lib/zstd/compress/zstd_lazy.c:663:74: note: Null pointer subtraction
>        const U32 dictAndPrefixLength = (U32)((ip - prefixLowest) + (dictEnd - dictLowest));
>                                                                             ^
> >> lib/zstd/common/zstd_deps.h:131:0: warning: syntax error [syntaxError]
>
>    ^
> >> lib/zstd/compress/zstd_double_fast.c:97:75: warning: Overflow in pointer arithmetic, NULL pointer is subtracted. [nullPointerArithmetic]
>        const U32 dictAndPrefixLength  = (U32)((ip - prefixLowest) + (dictEnd - dictStart));
>                                                                              ^
>    lib/zstd/compress/zstd_double_fast.c:88:70: note: Assignment 'dictEnd=dictMode==ZSTD_dictMatchState?dms->window.nextSrc:NULL', assigned value is 0
>        const BYTE* const dictEnd      = dictMode == ZSTD_dictMatchState ?
>                                                                         ^
>    lib/zstd/compress/zstd_double_fast.c:97:75: note: Null pointer subtraction
>        const U32 dictAndPrefixLength  = (U32)((ip - prefixLowest) + (dictEnd - dictStart));
>                                                                              ^

Seems like another false positive.

> >> lib/zstd/common/zstd_deps.h:131:0: warning: syntax error [syntaxError]
>
>    ^
>
> # https://github.com/0day-ci/linux/commit/400786d3b08436113bcb3c9c16a97eefc31317c1
> git remote add linux-review https://github.com/0day-ci/linux
> git fetch --no-tags linux-review Nick-Terrell/Update-to-zstd-1-4-6/20200924-064102
> git checkout 400786d3b08436113bcb3c9c16a97eefc31317c1
> vim +179 lib/zstd/common/mem.h
>
>    173
>    174
>    175  MEM_STATIC U32 MEM_swap32(U32 in)
>    176  {
>    177  #if (defined (__GNUC__) && (__GNUC__ * 100 + __GNUC_MINOR__ >= 403)) \
>    178    || (defined(__clang__) && __has_builtin(__builtin_bswap32))
>  > 179      return __builtin_bswap32(in);
>    180  #else
>    181      return  ((in << 24) & 0xff000000 ) |
>    182              ((in <<  8) & 0x00ff0000 ) |
>    183              ((in >>  8) & 0x0000ff00 ) |
>    184              ((in >> 24) & 0x000000ff );
>    185  #endif
>    186  }
>    187
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
