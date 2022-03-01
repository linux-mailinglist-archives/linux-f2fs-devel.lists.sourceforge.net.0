Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236C4C9368
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 19:40:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP7QR-00065D-4u; Tue, 01 Mar 2022 18:40:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <keescook@chromium.org>) id 1nP7QP-000657-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 18:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=; b=PF91I/UXk5waEqFGU4fFMpji+d
 gBl0B35FCQZ4eqVG0K6+bjOCUnsuGi6y2ki+j4Xrfb7qiiIY4hpLzfjTpyf6vRq4Tpsx8gig0FbGy
 YmsRcixtmaURd2dYjbJmVkpgokDVU9ys4MwQFH1xukcz4NyZR7nAHg1j4JmzULjb5v/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=; b=HJ8OR7y61q3UJXqhhXiwzK6Crx
 c7i5OHns6QKnKYY538bLNb0rZBIg3f6WpAtsCpZz5dYNChz7veDK2eR7k9qPwgPAhC/fGwCnowVGW
 ZqlXonwuIQ13tMaWcGV0kcMI/Gwe7irIWgytsCGBoBfxhFdkiIwYlUpPoacT8VSipkWc=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nP7QJ-0003mr-V5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 18:40:39 +0000
Received: by mail-pl1-f171.google.com with SMTP id c9so14212912pll.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Mar 2022 10:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=;
 b=O9Pc4FRhQaHO8JwtvKmEa7P/p93QhIWPziYnJxBP3SmXkKfXwbS/+UXcAcizlZe2qE
 5++D1AzgFSiNA6GVcHz58RghXwcZj0T+stAg2S8I6BdGwjnEpqEP1SHJlTJIwhdk7I/A
 Km+JuAoSqO/aabb7J1BxN3aslickTdbOZI2Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=;
 b=7f9t+Kg43NWvEBqfWlatqbeAqwrwXyz2rpBBGOfvftmNSf11OH95PSzquO4J72zItD
 VFlwJvwNCV5CdgRCfesogslN/UulHkTmEev8RSVbZYUp98/YPHivtDrV5Cx8hPCRcm7U
 Pmd3o1VdDfra/8zSskbzIpHE26qvCd1Co5mwxmPmI8x2RSZ++P5UCVfNO+5yraujAuXG
 HCiz5P/mTZ+FyNazLDHaLFL9F3x85BNcEdn0OZk5m0/ad52TrAcTZDZFPoLxG0qX/5c6
 KLNBmOHMWNspNpNSjNbnbRyg56bL8g/eF2dLAwdysOrJCu1tpsEJz1ZeBp7LRPWfDfd4
 YmUw==
X-Gm-Message-State: AOAM533FVu0EE0il0rkpy70bU47K4ks3AW85VN2Y3dtQa3bCayMW2jLI
 z57Xe3SjfRAC9bstHFNt7AtkHZftT+TLgQ==
X-Google-Smtp-Source: ABdhPJwl/oZl7jTR8Xbiy0diMdVywUoBtjuUV8iCsVjT5dJdX8x+nPRIiFjmEv3Xm0s1V2wXWPjOfA==
X-Received: by 2002:a62:d156:0:b0:4cd:fd21:e406 with SMTP id
 t22-20020a62d156000000b004cdfd21e406mr28741951pfl.44.1646158448831; 
 Tue, 01 Mar 2022 10:14:08 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm2540095pjb.46.2022.03.01.10.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:14:08 -0800 (PST)
Date: Tue, 1 Mar 2022 10:14:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <202203011008.AA0B5A2D@keescook>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
 <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 28, 2022 at 04:45:11PM -0800,
 Linus Torvalds wrote:
 > Really. The "-Wshadow doesn't work on the kernel" is not some new > issue,
 because you have to do completely insane things to the sour [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nP7QJ-0003mr-V5
Subject: Re: [f2fs-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Matthew Wilcox <willy@infradead.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 28, 2022 at 04:45:11PM -0800, Linus Torvalds wrote:
> Really. The "-Wshadow doesn't work on the kernel" is not some new
> issue, because you have to do completely insane things to the source
> code to enable it.

The first big glitch with -Wshadow was with shadowed global variables.
GCC 4.8 fixed that, but it still yells about shadowed functions. What
_almost_ works is -Wshadow=local. At first glace, all the warnings
look solvable, but then one will eventually discover __wait_event()
and associated macros that mix when and how deeply it intentionally
shadows variables. :)

Another way to try to catch misused shadow variables is
-Wunused-but-set-varible, but it, too, has tons of false positives.

I tried to capture some of the rationale and research here:
https://github.com/KSPP/linux/issues/152

-- 
Kees Cook


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
