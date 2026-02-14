Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCOHEXD1kGkCeAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 23:21:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B0613DB4C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 23:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNLxVYicypjnzXwpSr6n5o6fiPxJUnbmtSj12B/Dp7U=; b=Qy0TXqX1PI93kZZA78OHlHi/Jy
	IdSUmCgvkb9VgNRY660L2F5flzNia84vycN/yszpUp+t/uIbDOPFCF+dsGapPBNBJAIft0FTXx6QX
	P4FRZ+V25hqtE/qX7X3uTE1KMuOm01Wu3RTJ+Qb9yTdBmwkgWn82+51+rgev8R3ujMi0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrO11-00072V-P9;
	Sat, 14 Feb 2026 22:21:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1vrO0o-00072H-7W
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 22:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JWQi7XRtc1k2Wo3ssUlb/bYjje86J5o7oD3gW7VZANc=; b=GJ26gXmwSW0GG6uDzxZvaaDoMk
 5nUb2lRTjuvvmvaia5Ld5niqrOMxv0g4UNDZ6O3Tj42yYxgQ1mZ8z/0cDh0leujFD2TrYG7rX7xS/
 19KZSDiewrqhyUZpoZsdSkeah/4Hd9W1iCg0AfFElE7asuQOiv/WdrTw7Y4MKiXevjm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JWQi7XRtc1k2Wo3ssUlb/bYjje86J5o7oD3gW7VZANc=; b=mjjHahdZ+lT2Lx6Ded5VO6HC8K
 BNDd+B+yI9WBnPK4gzUptQmZzItmJkTavM7fJZsqItqMiBVfOXqu75pEkYeFcSJnfIba8wgMTjUMg
 2n8ronbaK3W8VWGLyTPFBMzBCia096ngZxyffrxDs5zfOKk47Ehig5nZFR9niAg98pH4=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vrO0n-0006Ae-H0 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 22:21:14 +0000
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8d7f22d405so227358766b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 14:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1771107662; x=1771712462;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JWQi7XRtc1k2Wo3ssUlb/bYjje86J5o7oD3gW7VZANc=;
 b=V32uXyMfKRiR2j6seDeOYbHphzm92o7t7r6lWMc1PbSv0o+ypOIfzEEpkyiTu1O4/G
 JipQmfVoxhB9nbYpdU0DwNCtq2J8C4/Q0nUtCzuIysaeQA5qUqJL/TXAw15lm2uK2+Py
 yFwU/89Rqd/hPXXkWh52PxbIknl0HZ6sBNRDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771107662; x=1771712462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWQi7XRtc1k2Wo3ssUlb/bYjje86J5o7oD3gW7VZANc=;
 b=qzQBliSShnT5iJxqKBUXS4WW9/alSycrrhsfVSTspBVkKCAvBQnnSmiPHpLfNLUsb4
 Cq7AdsEFSiX9sUI+Hq67czLMkGCtoUbiaH4MdVNxNm5pK196S4dN6EjNhqk5pc2cX1Ud
 CMspK/6rT5dp/CefnoGf1c2RbZoGdmcAEtcoEWDjn7Vq/xSVqc6lrp1RU/SwCeIittL0
 9CBNBN5x9QoeNHKIRObq3QkOS+e49Qy3ywj5GUq2vlW9fAWnP/hh5hnTL1A6hFQrEtXC
 KQOuXUEO7hwzWsKy7z1Vw3buSXBgu55me9md1t6mflYqsGZ6ZMCfChgGgO99Hru332K5
 pEsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsKfg9XPSv7oCRlqwYZvMVTtglg9HNpXFtoPBjqqerRG3vSj468nf/7ObhrO6bC8QQNOczXk1E+v9sBNGO9Qrl@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyg8a3fWay/Rzbio8t9TRcRVDgkL68DbB5JnIzyhw9Jv/yt+WN0
 g6suUjpavfMoaGWACj+QmeVsbNzOVMjXcE6udDfijKXinltvTaSJKxoSqoNyDEj4KhUd0ocZigb
 7sf6Kgl4=
X-Gm-Gg: AZuq6aJhLfLKRZzkW7SUq5KXc+W7A6yMt4vZCG98YP0cUzfaC9EVEEVy7zXUWsxjkD6
 Zp59eGPtVgV5tCG1lfWtFP5fVHQ6PPf+ELNdYzSiAxycV617LZqdnH9N7ar6zskoGUJ9H+0uKNG
 tFKfM1O6oDUnlIMh2IER0PBMiwsS5FdmkkqQ8xszNjb9LWqN2Brv8ZXUm6Q62mhGBItILu5wMjF
 PNPFOZdmUQrnMdpp8G1tTOOQelIiP9UvVjdCqJtbmOPxah0pe5OK9K08NrXsarbTXUSQK/eRBlj
 mKtgPpMELj+xq+odu4RfWlLLkCpyrUUhk4V+4/bFzZ2Nt2HHlqnPJq0R5P5tf9PT5bk614acSTG
 53qFZqnedmsUo5g7XjoVe/sSOLkMAjKc0HHuhTweVzRRb2QqPryWecyrvRioSSIrwC3mZqrAH5G
 mZXWecHsw/1OS31dLlK2qBTyT60vkAqoHOrraNtzZaa8Gq8a2m2E/Eq1cQm4oxJ36uxzjxeccH
X-Received: by 2002:a17:906:6a1e:b0:b88:510a:59b3 with SMTP id
 a640c23a62f3a-b8fb44deec3mr380716966b.48.1771107661823; 
 Sat, 14 Feb 2026 14:21:01 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7691f0esm106505166b.60.2026.02.14.14.21.01
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Feb 2026 14:21:01 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b883c8dfb00so369474566b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 14:21:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSPcitrqvMURcve0HvkmFcRtNf407/nveGF2h56a23zm1ed3PXXQmNBVwaOP0P9aYt80ZJ1KhvYJVpDy+EmSKV@lists.sourceforge.net
X-Received: by 2002:a17:906:f593:b0:b88:68b6:e578 with SMTP id
 a640c23a62f3a-b8fb4214745mr337427966b.25.1771107661112; Sat, 14 Feb 2026
 14:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20260214211830.15437-1-ebiggers@kernel.org>
 <20260214211830.15437-2-ebiggers@kernel.org>
 <20260214215008.GA15997@quark>
In-Reply-To: <20260214215008.GA15997@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 14:20:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgFNdEJXtoJzkektG3=Tqmk=vNp-J2nWnFicxnHNG2Ndg@mail.gmail.com>
X-Gm-Features: AaiRm528B7N9YxtufVXSjYAah-YQlAO1sSDZ7nzbSQ5JrbU2aWa4vm7YMBox5W0
Message-ID: <CAHk-=wgFNdEJXtoJzkektG3=Tqmk=vNp-J2nWnFicxnHNG2Ndg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 14 Feb 2026 at 13:50,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > Let me know if you'd prefer that we verified the whole folio here
 > instead. This looks good to me. And hopefully some day that "rpages" becomes
 "rfolio" (and this can all go away and it becomes fsverity_verify_folio()
 and simpler). 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vrO0n-0006Ae-H0
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use fsverity_verify_blocks()
 instead of fsverity_verify_page()
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
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linux-foundation.org:s=google];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linux-foundation.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 85B0613DB4C
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 at 13:50, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Let me know if you'd prefer that we verified the whole folio here
> instead.

This looks good to me.

And hopefully some day that "rpages" becomes "rfolio" (and this can
all go away and it becomes fsverity_verify_folio() and simpler).

It does look like the "cluster size" thing could maybe be made to
simply be the size of one folio for those things, and then being a
single folio of size "PAGE_SIZE << i_log_cluster_size" might simplify
other code too.

Then instead of walking multiple pages, you'd always have exactly one
folio (just different sizes depending on cluster size).

But that's just from a very quick look, and I might mis-understand the
code I saw...

                      Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
