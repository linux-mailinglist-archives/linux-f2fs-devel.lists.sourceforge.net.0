Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A596B3C562
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Aug 2025 00:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWGDoWcomQu49C+PEbvkKmAkqCaWpOkCK02Cr9yYg8w=; b=YTioGQ784L+DmGBvAU1eRUapBp
	T/Loq7P20F7dbXYS67L5c/vBeWX7Z28zMtofkHYDf5UvjYx2LXN3xD34pFK6XVQsfB7yNrbNWPRbf
	BrxkZORt7DJWJyz9fyGsfa6O/iRfz0iGJpyMltDVu7mi7c+O/Kr3aIXsXpVRM5tQcwmg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1us7vZ-0005OI-3o;
	Fri, 29 Aug 2025 22:50:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1us7vX-0005OB-V9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 22:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0lefTQnohYQB/+OCIX/Ack65rHqDEmkusNMfujbY6lA=; b=U3OJPsu6L4VZjacxkyABfvL+iA
 RJl2YETPE64PpOm2sGwjW2CbAk840km211hgJM/aUdKaKffdy5NqSZcrmgfcTgtgv+jlqgbtZNZGz
 5IiogzXxv6pQR4vjSzHjElLsbUk/PQGHDGf7o5bO9ez7bf5cGMmn5L6AtaUlqbVm9Fgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0lefTQnohYQB/+OCIX/Ack65rHqDEmkusNMfujbY6lA=; b=WB4jw4KM1xAB10H8lmauoNLhdo
 scQcn8i970BgOA84oAK8sEhJYKUchutGcRdKtBgDjLSlT7CTE8WWQ/ciI6Y/qfjrEYdajXYVUsayK
 9yAwcIR0b3oZQacDJY8lo8rpkMwA9/JELZCjezgM9mLFVDCRlJh0licStox/iu28lr/I=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1us7vX-0000eF-Hv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 22:50:35 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4B13540AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1756506676; bh=0lefTQnohYQB/+OCIX/Ack65rHqDEmkusNMfujbY6lA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CHxokGkAPVRXN+AXoS/eyrFGvlTkSfyi5AdUkx64MiLSdaoio1eocKkHn3/++W2EU
 eU125JjKLuKHmLCbfuCFsrXgSCgMj9NmKYn4KbGj6y2j5iOuFLyA8lt5Q+d1jA/WRL
 14v2e5TZcG4KaAXVF5uM/spj/MAV1CB0wroIr+wT5AD2USNldv9yybVHwS04LGUB8A
 uSAPwG7iY9Spntt81C4Qa9kqbrRI1pABggx8EPHUDDrx4HjWBAKDkckJlWFlHK6GlI
 XTkqC0aA5nNfDeemBMpoc4ttQckDG86PnfkTDXc6QPquLscSIGdoc/av5hkrgJdZqU
 Keasv2qGlmWig==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 4B13540AE2;
 Fri, 29 Aug 2025 22:31:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux F2FS
 <linux-f2fs-devel@lists.sourceforge.net>
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
Date: Fri, 29 Aug 2025 16:31:15 -0600
Message-ID: <87qzwt3glo.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Bagas Sanjaya <bagasdotme@gmail.com> writes: > Hi, > > Here
 are documentation formatting cleanup for f2fs. This also includes > docs
 retitle at the end of series ([6/6]) as a bonus. > > This series is based
 on docs-next tree. > > Enjoy! > > Baga [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1us7vX-0000eF-Hv
Subject: Re: [f2fs-dev] [PATCH 0/6] f2fs: documentation formatting cleanup
 and improvements
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
Cc: Daeho Jeong <daehojeong@google.com>, Yangtao Li <frank.li@vivo.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> Here are documentation formatting cleanup for f2fs. This also includes
> docs retitle at the end of series ([6/6]) as a bonus.
>
> This series is based on docs-next tree.
>
> Enjoy!
>
> Bagas Sanjaya (6):
>   Documentation: f2fs: Separate errors mode subtable
>   Documentation: f2fs: Format compression level subtable
>   Documentation: f2fs: Span write hint table section rows
>   Documentation: f2fs: Wrap snippets in literal code blocks
>   Documentation: f2fs: Indent compression_mode option list
>   Documentation: f2fs: Reword title
>
>  Documentation/filesystems/f2fs.rst | 88 +++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 38 deletions(-)

Jaegeuk, are you going to pick this up, or would you like me to?

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
