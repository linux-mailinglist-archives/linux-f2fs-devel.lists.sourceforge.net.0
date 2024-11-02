Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD969B9F2C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 12:09:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7C06-0000La-3E;
	Sat, 02 Nov 2024 11:09:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <herbert@gondor.apana.org.au>) id 1t7C01-0000LL-Fn
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 11:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=; b=PEIU/2OnxKX3xMf4N5hAMfN7kf
 o1dA6wYLRv5aKN/keEzuEJazQDNz9Q0l3Gd0Tc3cwE5Jf1WBjEwAUCdxZw0NAngXO6BToFilHzWDz
 ypaWiPDxolwwQKztrsCB08lAHno99Z1/aGwEKfIuk8Jhj2ffkcdBMY4kzyqYCGQo6cl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=; b=OGRt143HuSIutTL4SWdA0JS2pZ
 KAXteCw5pOd4p4N8GZTvkx0/66cJUnJZ6dcd7stK+cXpc/GuUtX/VjjULyceztN2MxiiheLwFNGi3
 rK8XTNWk922eMeh+rq28hJoI/74qWsV8XVmYnOmMVCxq8zaRfJE3x604s+fphM0J/Sqw=;
Received: from abb.hmeau.com ([144.6.53.87])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7C00-0007qb-NU for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 11:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=; b=ZL/lvV/0NG+jnrygJ/ulUipBlK
 qP9nNwqVQWNXM6Mo4bBB3wTvXS6oRzgEKSHf55UXhXhzl6CQWDcLaKiJVFPLfJWGDYzgQucVtLoXu
 EdgtwDpESedu90LNlQ/3ESKbF6ZllB13v5NTAUox4RYWGiwG0gPbhcB9nhH9k15mZ/+NFfBDzBZhT
 ZXkVWdsMEUU+MuBkn0bvppo0elNwSfGET6JHSBcIK+uM55LY9FOpzK7dAKO7wfzB9TVAXeFIWaCKY
 of25XbcMJoe7WP1/TZrB8M9THZkyGx/lpgRJ1Zogfa/NIqKJhYAzvuJg9eOUYUwS6oN1RCWC7zQ1Z
 rIC9NpXA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1t7Bzn-00DyOZ-3A; Sat, 02 Nov 2024 19:08:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 02 Nov 2024 19:08:43 +0800
Date: Sat, 2 Nov 2024 19:08:43 +0800
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 02, 2024 at 12:05:01PM +0100,
 Ard Biesheuvel wrote:
 > > The only issue resulting from *not* taking this patch is that btrfs >
 may misidentify the CRC32 implementation as being 'slow' and t [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t7C00-0007qb-NU
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
From: Herbert Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Herbert Xu <herbert@gondor.apana.org.au>
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

On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
>
> The only issue resulting from *not* taking this patch is that btrfs
> may misidentify the CRC32 implementation as being 'slow' and take an
> alternative code path, which does not necessarily result in worse
> performance.

If we were removing crc32* (or at least crc32*-arch) from the Crypto
API then these patches would be redundant.  But if we're keeping them
because btrfs uses them then we should definitely make crc32*-arch
do the right thing.  IOW they should not be registered if they're
the same as crc32*-generic.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
