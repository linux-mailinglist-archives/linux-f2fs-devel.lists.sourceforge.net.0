Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sIcKO8POQ2pEiwoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 16:12:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6526E5442
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 16:12:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="a21C7/Fp";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=j62LwA3M;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=lTTSFSDP;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=bl6DaQk8;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t+TaGNxEuYsvz1MTYw7vqd/eMzWnGJ0b+6Z2AynoJo=; b=a21C7/FpssqJVjfht9wZjs283o
	V/UJWYqbTCxf4re8WfkgSTugEPJY2/Oz1FnmsIjmxIpOGUPEgf65JGKJM/SlgWFO3GqjJJUJ99yu2
	C0RJhzy+LS982q261UF/S5qbzL1pK5fy2uS7+35hz8vUr1GFjp5Ve7j6v0rykgpNh+tw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weZBz-00070f-NM;
	Tue, 30 Jun 2026 14:12:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1weZBy-00070S-Re
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 14:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YD5CEwIQopM2kgC6zkE0XMqqb0eBnpAwZfHsuJQVL5w=; b=j62LwA3M8CApcGvt9PeDLBOZ8T
 8Oibsll7DkfC858dAKyp+WWUquAImgyJi2+h94Z069MLOZdv6yrLo+xEpQRx9YsejjifsBzR1i9jl
 RTHcApZO6VhlPgXbh8pJ+gQFwHRM8+wqe0/3oTNURIjSUPmfpyt8q/qdudLikUx18E94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YD5CEwIQopM2kgC6zkE0XMqqb0eBnpAwZfHsuJQVL5w=; b=lTTSFSDPKpCDdKYJh022Qa9li9
 z6lp+qB8R5GBmj65tmtRqrSTbue+DrlBXvlNg7zG6Bux/Yt30p4g1moU00ZobRAGk175ND9QxGXl5
 5xWDgErB2OjjmB4Sl6okHKazJ7o5gbU49jjBS7LOU3abPsmHvtHZY4tg6BPRrfp2nL8w=;
Received: from mail-lr2-f3.google.com ([74.125.230.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weZBx-0003qd-Ix for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 14:12:03 +0000
Received: by mail-lr2-f3.google.com with SMTP id
 38308e7fff4ca-39af167f87eso14117061fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2026 07:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782828715; cv=none;
 d=google.com; s=arc-20260327;
 b=qZs9xt1P48HKeqfI2WnApfFAw4a3kFVjD+ciV9jA3eTyx8WKhXqoxCM5jK8ltIqEq/
 D0PYFensC403OTAZmvUrUUlUN6PTgguQyuQhfkhlGz5WrYmMNkzrQHQ4Rls7gWNBNwDX
 IErESb4RLI5AYv8myaD1WDQ+svZJvKa6OZdRZkinqX50es9k+mUBRZqlzCkZUqkaQ5VM
 P+Et6eCcBuhkfOVgWfJvTbdYaRHH/pKL3Pd+5Sw8/VyOGu7xVa1Kz5Ra4WVfgDwSzBDq
 0b6Tdob1iao0OU5UjJIK7je2P/3Dis36MNA36FQ81ReTNsAdz4H/gtn9EgqKT13CXFs+
 j98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YD5CEwIQopM2kgC6zkE0XMqqb0eBnpAwZfHsuJQVL5w=;
 fh=7J+iNAb82Y+e2hNcw9M+ALj5MMQorYGSyNEjjjL7nJI=;
 b=pPgZLVT7z/rlNWhPqFgGxuyKosP0UIDZhbWxdShrFpWhCUE2jlSXO4P8mnqBq2IsQ6
 Nazwz3Zfo1hrk20jALM1ykI6riLfT5YgSPBF2zmvkmL7ZmiixyUZZ7uUfbEsTdyBCtz8
 qiK/umZJ/7B+f0GSuAkhy/gWWGMWjZ+Qrbe3EO1PmoskRZPGUE2dCDxHk69XKvHUcLQh
 B2BrmpLStGZGNELggGePWdqtCECukowU99EJ5iS0MG7RCqga2TAU+Qm/NPS5ZZ2ANlDt
 YGL6u1k5dDHhiIsZAH4AiCiHo7gWyQqjCfeE1nn4MrI66b6MxpAu2fa6JubpqZGTaq0b
 UA1A==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782828715; x=1783433515; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YD5CEwIQopM2kgC6zkE0XMqqb0eBnpAwZfHsuJQVL5w=;
 b=bl6DaQk8kl6y3sx5sG3FAJ26zh6+nEBTNVVlvfr0QxcDuPP9dcw2aM0+DasXSgCM/7
 j3iye+QVyVhPFqLa4EZ34YnEmniF1ztAlkq32YEDBPEBfCoAU0TWMWw9S+RzPCCpErbw
 JvS8gmRAvew+PxojlXvpJozJMzd7cXaVkBNRCVgPS97eSCq2vZjXKPyBDvD2+pbWDFnX
 8jQws7y9mqzqqw/8OSltUiSejuxtq8C/l8hOuEDYAtzkw7DRs0h/EPOq2pldPVc8pQqD
 IHEHGuO1awafuDPilNhkyNHZCC2DY8j0MUtOzeCPSVxcCRuLM/2uE0pRfA5sRFYipxjH
 Hepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782828715; x=1783433515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YD5CEwIQopM2kgC6zkE0XMqqb0eBnpAwZfHsuJQVL5w=;
 b=k0wqbPky3Q7S3pd7F3Dv7y4nEZ1E86B0z+hZGFl4zltYynRNL7tHL1guBbashkkYDh
 o4nQgU6qlZb4ASB6lBNIkzc/dq2SXZfgtpPQhduwE77Gjl+jfRUQOFDHeb006lA+eczM
 taumuGv+A2GG/qaPu/OlND3jCYR2gBIyP+gFml2aAQIJfXf9iPzCNMD90hs8cvxpi9rJ
 o49D8i7oDqyWnnwp3fJeeypmeoahedQf+rXThIq7bxROVC5dprULXTyitNZV2q4vucds
 eo703zGTit0n/zJSr619xnXrriub8ImmQdzKnRzvsvdmfgi4Wnjf7+uvue5Y1kDeKtS7
 POjQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RovbIQNX4MuijG+CVTaIgdiIFvLfsxP7p00j/k/AFJxG4wOMKPuqtPta1X94aGtn3INuwiekpeZNT+940FEmi/3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxwodsGP7FB+97M4NZjJQHiwn5dV/DFsgW9IVEOoNmDsHjIvVqA
 zCKrLhDEIBC0dMuxL08qywv0g+u3ZT2dATCNzNGcPsv2cPnygIcTIVQn6EUxZqCbPPF9eyyW/zF
 sF8WMOCFz5x2C29eoFRqsN3tiPuT9KGc=
X-Gm-Gg: AfdE7cnk7thEPzDerhE91AR7YV6en9nzqwNCnouJvbsKmVCrtD3J05U7gY9BKOAoXUy
 FJ3VxJYkAep+j2N1tqkcEt78sJyLkoWK+adKpbRMc8qZ8meMmK7GsvRd+YaAR3T5CluvZRnlxea
 juK4z7MS/qHsDH7WwHMjJepbDh1U9gx9xVQR3Hvg72U7ay++ZHksnRifNG/LBlR/17hsNX77Bqx
 qDGrm/7Zo2OYwdy5rnIhQtdu+VAf1GDZITroGN+77Cv7a1v05MaYlaCBjgkdCbna4/NsmugzEMc
 ENRXFev9CHU7/9h7tAfEprZzrBcqcb0Kd37R8VZDA5mydXySGc+o0Xgy
X-Received: by 2002:a05:651c:b28:b0:394:1192:5e1f with SMTP id
 38308e7fff4ca-39b1ddfa095mr7964081fa.22.1782828714939; Tue, 30 Jun 2026
 07:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260630045919.1671833-1-rollkingzzc@gmail.com>
 <07babbcd-a1d4-4b03-987e-bdd7ed933c33@kernel.org>
In-Reply-To: <07babbcd-a1d4-4b03-987e-bdd7ed933c33@kernel.org>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Tue, 30 Jun 2026 22:11:42 +0800
X-Gm-Features: AVVi8CfIW1mpLF_KerOc72XZ4LWPT8dc7gOaK_XWGg4-iFdNlKbnuaGIIYLJF5Q
Message-ID: <CAB7XQsETc1290AVo95JFzV6NEMr_Fyb5VrNWzH-5sF1Ldk+MvQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Chao Thanks a lot for your patient review and detailed
 suggestions. > How about introduce f2fs_update_gc_task()? > > attach w/
 f2fs_update_gc_task(, 
 task), deattch w/ f2fs_update_gc_task(, NULL)? 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [74.125.230.67 listed in wl.mailspike.net]
X-Headers-End: 1weZBx-0003qd-Ix
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: protect gc task pointer during
 teardown
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C6526E5442

Hi, Chao

Thanks a lot for your patient review and detailed suggestions.

> How about introduce f2fs_update_gc_task()?
>
> attach w/ f2fs_update_gc_task(, task), deattch w/ f2fs_update_gc_task(, NULL)?

I will introduce f2fs_update_gc_task(gc_th, task). The start path uses
f2fs_update_gc_task(gc_th, task), and the stop path uses
f2fs_update_gc_task(gc_th, NULL).

> +     if (READ_ONCE(gc_th->f2fs_gc_task))
> +             return 0;
>
> Why we need to check this?

Thanks, this check is unnecessary. I removed it.

> -     task = xchg(&gc_th->f2fs_gc_task, NULL);
>
> I don't see this line in anywhere.

Sorry, this came from my local prerequisite tree, I will rebase the
change onto right commit.

> +             if (!f2fs_cp_error(sbi) && READ_ONCE(gc_th->f2fs_gc_task)) {
>
> It's a corner case, I guess we can skip to check cp_error.

Agreed. I removed the added f2fs_cp_error() check and kept only the
f2fs_gc_task recheck after prepare_to_wait().

> Can we do like this?
>
> __sbi_store()
>
> spin_lock
> check f2fs_gc_task
> set_user_nice
> spin_unlock

Yes, will updated it this way.

I'll send v7 soon.

Thanks again.

Best regards,
Zhang Cen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
