Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74DC461C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 12:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJgNbONAJZ1P3WRtp60BfscqAtFfj0GH4p6rgDPt0AE=; b=i389OpIjS4nyfvWe7Pd0OYWTAF
	2leoXxjge3kBLU6/Sy/eMoDHOron9+mH3SF0by8d9F4EacvhWSrl2A/Tfnv9UF8+ZidlolyIyamwN
	ulgiMrz/5vpCG6z+379hKGcdeIdcGE7FYArt2lNXdlGYfWWD2L65eBulT6aKC59vREAo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIPir-0000yJ-S1;
	Mon, 10 Nov 2025 11:06:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akiyks@gmail.com>) id 1vIPip-0000y6-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 11:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xfmy4AOcEcUwtIeGJKyCn0Gi0Omh2sLDXhDiyPjpnMY=; b=e8eLoY/l1yC+fSFUtrbcugocor
 JJ2K7tkLeaXjQ1RrLET4uIpTlTLYfArTts182R/5pOO22G8eJ+rCM1lkEVYMTATQrMuCgqTrpRLXk
 L3acko7yrGu8UZg9r5QI04Ik1cTRW5jo2N4W9sOtXh8cZ84EIozYlTcw4am//60P+FgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xfmy4AOcEcUwtIeGJKyCn0Gi0Omh2sLDXhDiyPjpnMY=; b=JWizQnG5NoKghAL1LLkVO4WGSj
 t0EYWbrNY3KbRGnJPBCxK1tRaCfFUVuUrtIQGtF+gnYizpa9U7CwmCQzfaOKeLOcCDwZKl266lgjw
 8OPUCQTA1Mt6ArtWluJ+HwrmdrASEQcTc4FcdZBAZHFpsos2yjIV2n4ppIrsj95fV5sg=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIPiq-0002iX-2e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 11:06:08 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-297eca3d0a3so19618065ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762772762; x=1763377562; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xfmy4AOcEcUwtIeGJKyCn0Gi0Omh2sLDXhDiyPjpnMY=;
 b=G1ni5bJyDYaVipzrldzzaWLvTbd33xPOZeGe3GJRCInvGuky82Izw7eXT9c8AQxLjZ
 RK0UNYLLy3mBxYycVKQOaHbLKDaHuhRBNvLl5sTHYAaQ9A+q4nq+Kl522LlwaE6G/Q7F
 sT1iG/7J35dLf3F+PGv19YfUPvBEnRw4qB7k+3rJzCwKBD/PIR+fRMEscsOP6RTdSFrP
 KYnFmWyMyAQHLnCLv9LSZFM7K5QWJrFHTa2XPKlT/Uf4nyJau1pLoJAmBkxob01I8Ruz
 WoBoOw5d9qIj0c7XObW2OiUni4CqA+ZRvXruQuy1BPUmoJAcWTtIXE+GT3HVucoOTr5D
 ybkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762772762; x=1763377562;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xfmy4AOcEcUwtIeGJKyCn0Gi0Omh2sLDXhDiyPjpnMY=;
 b=oqmzWl9gpA0r1vbyVHzsGOqmSx9D0dOXRlv7pfhtdAggmeypxjqi/MP4a0WwtEBQCV
 kF2KzzghwyB++kPB3sluVF8X60B5cpzfxmMc3vf8FLGJ5DhVipNH3oC3QF2zC9APPN4b
 UO1bMbr17gFIsGlWfAb5lIVRVO+abfleMqoA2yiSg+eNClPAYj7739Xf+XfynTyJNjJv
 jTvyzdx1C1xdq7E+01c/4IK1nv/suHtjRb+Yjcnt13Gny6wwLB8ELTu2Vo2bdkfnUwsi
 PaZRPNaUgmOuu0KV+gh6h2c8QTCnVF8BW1/iJHuUEeKsgEK6uAiIWnECQkI8zpZT3uCJ
 g6NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/aG+qDuTfgoh1XrALBi9HjhwOW8gIdvcyP6k7URHMLXDlxLg1Y2vmyUluA6TlOvb70qy6GCAcFtQZgz9BAr2L@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyYH/mTgG8bISygoz3iEW2jXtjkUlWDLvtyUVw+nfagN6r1IRtx
 aL2vBvqM7A1xO5NOQQMwQlUjgJuzRpMAsDlgwUbHXkWPAcpKE5opyCUE
X-Gm-Gg: ASbGncvYB8PYsYYB9d8mYGSwXmEga4lWW48UT9lEgamEjY6r1zsGIZNF0vPTbUBp1sS
 GUzATi+4tY/0T7dCEXdxb4BQ+28GQsY8bP1pTRRbebpOcIDoRvHh2u0F/rMMJ1TC77gLRRx3Nnr
 C0jEBOrLYy/AkfnPHzHxDgQ2jMrxzZ1gj7AlSxXnQziJVIYZiq/y1549Xpgi/qXPGC8nZbk1I/p
 vSgHRkyvhkzkOtSgnPtT2hXvUZJsCOccc1llxihC91RJ04762R8Ny0ll+7T05AVObGMGVaMbW9P
 MUL3iLUwz31gvQDgJ1ohJD4w8ft/sH7b8laMad7yi1QFLThoXAvQRhlC3srcI5Ftpfe4+2aXyxc
 lgwwrlG3OV3L9rmrJ79vNJSc9oAl0TRoX4smuPHNRFbsO3cwO3thHlEOImCQeqEc4BlfRSAncTf
 kt1vncb1JHGMVkyTf5AmcuchE4vZraJhDvEWWA3K9KxUg6ZiMy74peueGX
X-Google-Smtp-Source: AGHT+IETPwSFvBF+h3mhcNuk9Nh0peDzqVVkcPzV5KFTzK6WG3YF7+uplP0h/hnB4Bk+hLoz7SyK6A==
X-Received: by 2002:a17:902:f683:b0:297:e69d:86ac with SMTP id
 d9443c01a7336-297e69d86cemr114937165ad.39.1762772762130; 
 Mon, 10 Nov 2025 03:06:02 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c6f797sm142617225ad.56.2025.11.10.03.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 03:06:01 -0800 (PST)
Message-ID: <bf2cb310-5546-46f9-b77f-0603f0cafe04@gmail.com>
Date: Mon, 10 Nov 2025 20:05:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20251109095416.2428351-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251109095416.2428351-1-nogunix@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Sun, 9 Nov 2025 18:54:16 +0900,
 Masaharu Noguchi wrote:
 > Sphinx LaTeX builder fails with the following error when it tries to >
 turn the ASCII tables in f2fs.rst into nested longtables: > > Markup [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [akiyks(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIPiq-0002iX-2e
Subject: Re: [f2fs-dev] [PATCH v2] Documentation: f2fs: wrap tables in
 literal code blocks
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Sun,  9 Nov 2025 18:54:16 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.
> 
> Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
> builder already handles these nested tables. I still want to fix the
> current documentation because Sphinx 8.3 is not released yet, and the
> LaTeX build on the stable 8.2.x series (which also requires
> "docutils<0.22" for now) remains broken without this change.

I expected 8.3.0 would be released soon ...

With this change applied, in PDF output, due to the limited column width
available there, most of the nested literal tables are wrapped around
and hard to read.

But fixing latex builder's fatal error is much more important. So,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

> 
> Link: https://lore.kernel.org/lkml/20251011172415.114599-1-nogunix@gmail.com/
> Changes in v2:
>  - wrap the compression level table in a literal block and add the
>    missing blank lines so docutils no longer warns about malformed
>    tables
>  - consistently use ``.. code-block:: none`` for the other ASCII tables
>    that previously triggered the LaTeX error
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
>  1 file changed, 61 insertions(+), 54 deletions(-)
> 
[...]



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
