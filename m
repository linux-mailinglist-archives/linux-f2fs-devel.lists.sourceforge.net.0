Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E152892F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 May 2022 17:50:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqczK-0000bk-Ag; Mon, 16 May 2022 15:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nqczJ-0000bY-CD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 May 2022 15:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=55byWR0gAOXo/FAcUJhhoGa8a1ld89kqJpm97aZow7M=; b=g52WeHRPtZg6BYV96OKCG8mTbl
 MYyaH6Fb7QoQ5N472sDurTG2PjaRR01qWgcM+U3SGeeDrACtF9owaCaM+Eu8VwUWW09+XUH/sXCdr
 13XikC1WhGhZOHkAp6PAHD6haiqeZAyCNzXq1y1aknmn0MYn/XacKk6L23tQPVPUVmr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55byWR0gAOXo/FAcUJhhoGa8a1ld89kqJpm97aZow7M=; b=NBNQLThKchLf7vD5dNop4JcdmX
 mHRJTv9Yfw9Xf0DgqbD7QllDoCBWY0KEUnLw37koVcaJblNduiNKZoN44pEanzBktTwX5bUrqpgjY
 CzW+tDS2QgMFpbTjaNwfZXS/CH12ppwVVVIDAmA+2S5qUYbD3x1EkjmWSeWWZ256OjKI=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqczH-00HPZb-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 May 2022 15:50:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 25D6B1F431E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652716215;
 bh=LKlIdLOO4j50+tfjv98qyF6r1YItkJl+IUV5p+TB/6k=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=B4G8ttqT8x2WWy6RVT7vFYvQ9NokIrgIiydUuOJofiVW5bFY4TYb4QLMF4G47aEUl
 2BT1h8XhlquGJbFlOjQmD3F9eokTq/BWT4LDplYoKAVxOpdbdScJiTYgsU3AoSwI2B
 J2Byk1M1UDnr2ai4E6eSgGUMK9Pq4fxsdx84OZIlVDznfFKqYlIUfat+V1q/IejA97
 KZ9fj1Anjx8JPyozvJgwPNIXA6IVeAp52sMLokMLrbZZB5Thmb0DUZkAkOD9S2pFIC
 bkD3NfN8r0Ff+1JfAmlW4WMSKZIfTpZB5BbZmUB8svVWbsJd32DkV48po2MQMZnmza
 W2Q1OZzMr4byw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20220514175929.44439-1-ebiggers@kernel.org>
Date: Mon, 16 May 2022 11:50:10 -0400
In-Reply-To: <20220514175929.44439-1-ebiggers@kernel.org> (Eric Biggers's
 message of "Sat, 14 May 2022 10:59:29 -0700")
Message-ID: <87r14txyrx.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> writes: > From: Eric
 Biggers
 <ebiggers@google.com> > > Tryng to rename a directory that has all following
 properties fails with > EINVAL and triggers the
 'WARN_ON_ONCE(!fscrypt_has_encryption_key(dir))' > in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nqczH-00HPZb-Hh
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't use casefolded comparison for
 "." and ".."
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
Cc: linux-fscrypt@vger.kernel.org, stable@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> From: Eric Biggers <ebiggers@google.com>
>
> Tryng to rename a directory that has all following properties fails with
> EINVAL and triggers the 'WARN_ON_ONCE(!fscrypt_has_encryption_key(dir))'
> in f2fs_match_ci_name():
>
>     - The directory is casefolded
>     - The directory is encrypted
>     - The directory's encryption key is not yet set up
>     - The parent directory is *not* encrypted
>
> The problem is incorrect handling of the lookup of ".." to get the
> parent reference to update.  fscrypt_setup_filename() treats ".." (and
> ".") specially, as it's never encrypted.  It's passed through as-is, and
> setting up the directory's key is not attempted.  As the name isn't a
> no-key name, f2fs treats it as a "normal" name and attempts a casefolded
> comparison.  That breaks the assumption of the WARN_ON_ONCE() in
> f2fs_match_ci_name() which assumes that for encrypted directories,
> casefolded comparisons only happen when the directory's key is set up.
>
> We could just remove this WARN_ON_ONCE().  However, since casefolding is
> always a no-op on "." and ".." anyway, let's instead just not casefold
> these names.  This results in the standard bytewise comparison.
>
> Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> Cc: <stable@vger.kernel.org> # v5.11+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/dir.c  |  3 ++-
>  fs/f2fs/f2fs.h | 10 +++++-----
>  fs/f2fs/hash.c | 11 ++++++-----
>  3 files changed, 13 insertions(+), 11 deletions(-)

Hi Eric,

This looks good to me:

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
