Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJhxB3DvMGrjYwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 08:38:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7C68C930
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 08:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="m2Dwqv/F";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=L1rFJZsh;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=YrYBL9TL;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=BBA5pnhI;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1Fuhm50vOol715J+aeAX5tvdFAaV/W2Z160LsT4wf0=; b=m2Dwqv/FFmj4s8mthIFmy8TtN5
	mIKGYYqAMboMLwq2k4Pn8S61ZBMSD/FAOQWuaU+IPL9kZzwmNtBgSv2H93nbiXLrwh1YRRfCyNf3X
	tLeeMtgzosskdAxTtBJq4X62MZcbw3dEyK6zfVMmuUOLr+BGpN5O5xiYcNDum1A0eTV4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZNRN-0000il-RJ;
	Tue, 16 Jun 2026 06:38:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wZNRM-0000if-BY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 06:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6tcKWuXhWofAlg8AVkGUCDHGe9uzi6YKkWeHb3OnPk=; b=L1rFJZshFFAzTnVK1/J52omPe2
 dPezEosNM+rrv1Gtww2pwL6XyYid+jIFtdFoGxiUj8tQNHXLSF0WQfGY6oKEUL/aujI3q66wF/T9e
 RNqEc60m7hcmNsQTYQn1rRzo79UZi3spOAIo6LtNEuXmc+vZnN6W5Yx/u8yzr7Rd12sQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q6tcKWuXhWofAlg8AVkGUCDHGe9uzi6YKkWeHb3OnPk=; b=YrYBL9TLXKeIf880tMwtyzosx5
 yMg/R/JmTPyA892Bbdc1irr4uNXNHTNN+uDsyHV39mMhkvnIdSiWh6kvHtLVdC9pZpL4fPU7CbKQg
 5bR1bacxdJJ4wz2cyUaJtXq25Jid5/HxXqYKxKbNfEFr+P5bEk1+1dJNGUq8iheKoX8s=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZNRL-0001m6-HY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 06:38:28 +0000
Received: by mail-lf1-f66.google.com with SMTP id
 2adb3069b0e04-5aa6c66e6c5so2730024e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 23:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781591896; cv=none;
 d=google.com; s=arc-20240605;
 b=GdNI6v6SnfL0oZLCAWYWExIXtbR5RVRaw+eSu8JOHWZ8QXPVHTQOubyX68Cmnh31+S
 utLOzttBFKrzts5j7MAFBL63C23wjC5sxZ1F/dGdbkQBM7MCi8HvApyDPbwlhLqRwg7H
 yMb/58HMwSK4kVG0HBiU92nbvVAKM7z1DMNm6YHyzhYVPgQdvdiBq8CR1sCp5ZrD3oIi
 n7v6SYbRwry/9S4Kfo+zXSytxsKTiNigXz9aZqSUWkdSwtUAIFXaoj9TsuCkewr1LFHT
 kctNB77WJncPUHWA77iLfnzBTYTFtGoFKPx3KsnrbtS05GOCrgcb/HSwHfTnkARslyfr
 Vy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Q6tcKWuXhWofAlg8AVkGUCDHGe9uzi6YKkWeHb3OnPk=;
 fh=7Nit4oH5DFHgk6Jb7fSavscCcTiy0oZqfMML9mCCRco=;
 b=bYAZG3xR1h7d0HMOMgakny6MIfzsW5MEvCnvEYOMBLZA3/d1eOWu4kPSk9Ie96tIBM
 jxu67IWTiiY0oYjmfaDKukzck88ZKy7DR5mYKcWjEhybXHPkxcVSw0g2ZPOyE0qcKGSa
 BFP75NrAbMJiD5iaiNSqxUc54yaWbZIiW3PWVfoMnLyPoj2M8hDZ2JGLkS3ypuemNu8J
 u+MyInU8YVjGKQA4/EkwlR6EUgMrapUZjiji6EcGagROKZhXSkJbdoymWyNki/uZgGBI
 BqwLs60ZuueYoaMlWr1CiDm8lFMZnnObzS0Gg3hdDTqQ5Q9k0fO1tTeiwRxgPTyAA07s
 1j/w==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781591896; x=1782196696; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6tcKWuXhWofAlg8AVkGUCDHGe9uzi6YKkWeHb3OnPk=;
 b=BBA5pnhI4VcIF1xo1bqL7m1Kc07firCdUf/sYlLtgfmAJePrCz/8zeEtJXgIzht51R
 5/TVOmhrFvjMwntVpeB7hbd3pdNWiE9SiWePDDSk7c+l0Z5MxRqxtXkz1nxMOYJwGMaa
 UqZQJlm66tai1zMGz9SaXlP4Ul6IpdBUmdWTriqOpmb6zyZevXD6yU9EjN43daTb475j
 n+HPbmvO/AH3u05zwQenZ+OwHnWKPj5+XkQW2URdPafoTpzRYDeSpUyw4r7WZnwzaAwu
 slIvtXohf7vMTPnDDQJuDdZgZGaUe1N2WWPxb4LMoGKXGTXLp+cHI1ywE0TQ1n9UUnZv
 pkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781591896; x=1782196696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6tcKWuXhWofAlg8AVkGUCDHGe9uzi6YKkWeHb3OnPk=;
 b=CA3R4NJt2nsR9zGRx1G9zoZJqZmqz1H4IXnK3sPrc2Ut7kZTeZ1iOjztn/4rmqCd7D
 wcadVAiX7BowAiEp5pbjJWiMag1Uh7h1jth+hShWp6/aL0+SgVvarY/8NVQmAc0N2J0t
 ot1wIE/CxaTVt2a4pkoVGrZWAbZqqInm8pWPkAm+Hyd28U1btYioCMF/+3gQABQh7kW2
 eDOtDm6cUOp0ACEHUwPE3Gw2lV/0OVJR9cF8jsJsGYw1fSfjsKNQTutxMZPf9rMngs2u
 tYU/63cg6HjX6DKKB+yDhXHZA/MLJ33j+cIuf68VQ61StALwbSP4y9M8/ZHFiMy3PUmZ
 p9ZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GzKB6etJZpN8+TKAraekOCZaN7VJC2iQwpaNJTXe6Fyb91LIi60yMFmer2JrWmsvP/p78DCGC3zTWdPWyVC4W@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx2E6GH1OZ7pbnSv5448t71UsYshc/mAbBUHCO1RPsQQKFW7NWg
 jR8kREbEY84u0qo3pjnoqkgxvbCs8SSG/wKkeYeQMOOX5HEgBhq8aSJVa6vZrLMCsGngKY5j5jI
 FMYXsHV4pUh7JMKGDaQ1bCBOE2pC8gfI=
X-Gm-Gg: Acq92OGpcNyRJzyjj512tx0WfKasQblUBFwvphvUDYb/qMOaR8PCb4kQ6jKYJRzy/uj
 XdEcrqY+jhOcvNSS51N0ZTtVnbu0EIZQmDXC2YD4fPn+Uwqlnc4HNhEUCjhL9h9aCIrwHukiH//
 GACU981kN9ctD71k0vueagpguLS009+D/yz/H9G22zDgZpul+BjzqMFTPkTcdgux103qRypfeVp
 JdVowNYdct+SmB+6EEjmdvWxSFSKMnz0izwtCi9ti6+F6YzB2ODuVcBD2kSvuuScyOIirC/yEF1
 L4X7DuYs8SQl4VRmDwKoEP32Of/x5yDMfEYh+RMceuXHOCaSUGBYoDZV/2BMjWy3xP/6bQnpkil
 pXQ==
X-Received: by 2002:a05:6512:611:20b0:5aa:7770:8fc2 with SMTP id
 2adb3069b0e04-5ad427a8c27mr552489e87.32.1781591896007; Mon, 15 Jun 2026
 23:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260530143307.3596771-1-rollkingzzc@gmail.com>
 <ajAlYb5mZzNnKaHl@google.com>
In-Reply-To: <ajAlYb5mZzNnKaHl@google.com>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Tue, 16 Jun 2026 14:38:03 +0800
X-Gm-Features: AVVi8CeevYOuI_Iaukffpb3ZRVUc1UgOtwZrBP2rTJyFbu29BfNcihkHoVd4l9A
Message-ID: <CAB7XQsFi2kbKrEUqGz2h5oLEsnrB=7PC3qQa60-WuWfoTZahRQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, > What about dequeuing all the pending work items
 and stop getting more work > when shutdown was called? Thanks for the review.
 Yes, that makes sense. 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
X-Headers-End: 1wZNRL-0001m6-HY
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: protect published gc_thread during
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 2045gemini@gmail.com, Gao Xiang <xiang@kernel.org>, zerocling0077@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:2045gemini@gmail.com,m:xiang@kernel.org,m:zerocling0077@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49A7C68C930

Hi Jaegeuk,

> What about dequeuing all the pending work items and stop getting more work
> when shutdown was called?

Thanks for the review. Yes, that makes sense.

I will update v5 to dequeue the pending work items and stop queueing new
work once shutdown has been called.

Best Regards,
Zhang Cen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
