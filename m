Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Lr8Ex+2kGn5cQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 18:51:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 662A013CA49
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 18:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RppvksSM5fw7/ghvyki3tVvjV3xVt6UNwBAQ0Yi3VqQ=; b=TOrXgwHQZ11I1d5odGWNlaP1X1
	4VYTszVvg4oua2E0/Q17mNNPdH1FlTiCn7bkRUkULq1uH7Be2qnnCUE0uR2nSMgbEpbdZoAp2HpVF
	AzJ8pPq4JGqB0ciwQIOzlTe8tQ9/9IqsF09vZPo/3yk/rfqhzmmiXbE8+N80erRmauKE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrJnX-0007nB-Nm;
	Sat, 14 Feb 2026 17:51:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1vrJnW-0007n3-Gz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 17:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRgdqie2PVm7bx+tOts32ndvLuT/OLdwwKV1cHxPHyg=; b=H+VD/KTK790kA0tUbxKvfHzw1k
 hNYuT0PLYNdZU8m4++H7GaZjJ9Iz1ceSia8OkLL9ip2s1tuwtWyK8TW6vhXzpZ4c2PQ6zG36gwBEA
 /CjOcYBhVEeRsMPxiltekMZqyEsMsOy16OkN5ind0aetB39iBzIkhtS/RYaNxiZmovNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRgdqie2PVm7bx+tOts32ndvLuT/OLdwwKV1cHxPHyg=; b=BwmaCXsfAa6zQ71i9lAOg+OjgE
 xy+0B2JCUKdFC+84DYyV4nyqkJXw1jnPwBhetAs28d0GBSjssQNYtXGGWkE9zhI22eyPmAL9NJ4/z
 9qBor4QX3uiX/1bxg35Aw2tGRf0fsynJFXezriuv/NYxoFxJD8rRZLJraDIhE7AYtOYk=;
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vrJnV-0005Km-Qt for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 17:51:14 +0000
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b8849dc12f6so243131766b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1771091462; x=1771696262;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRgdqie2PVm7bx+tOts32ndvLuT/OLdwwKV1cHxPHyg=;
 b=RAtiwgu7W2PAv6jxe/RIFwegsDzVGJo5Yk1pbeKrsFZLY7XvgTQ2c7n9ic+NiCYV6X
 Uir8XzQIHkuP6AW82JCsv13QX0Lty1wbatAUSqOxlYg3+5T3/WxerE+kfdlospZgX4R5
 W98Z6EOOgScGS3UUppOyMV/jo/mZsdh8QGQVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771091462; x=1771696262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRgdqie2PVm7bx+tOts32ndvLuT/OLdwwKV1cHxPHyg=;
 b=QzgiwnOLdSERwJyouPi5LsIIoW+jtnEdwYfwTsKHD5lIacbVBFo/3JkBo8fomnDxn5
 hI80gRImfdA3RY/ys4W69um2QTuTRV0OIlmqD8nfj0eQa1X3+QD3mO8FAvFspN9SURlr
 JyuvLGMpr/C2+RZLzkmbgtCda9pLx0vdvwJYy6IjI9XScyP6dUuZW81eGDKrtpzAXFBH
 M9I2ztftkmDOULb8VnksfRNFkzNnBD5xL6N2MbsBZsaItBXX5u6YwJdivpTQl0GgXuqp
 /9JNvEnRXp6dOg5C8naZgeJIy63vyWoRF7LxR8d8iNI1IRGfPd9Ul92wfwmp3RGw43/u
 9QtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd5n8nCBB485swL8zLKGQmIWXiZ4/HNK0MtBA6TMFPd4QuDd/oLO14rJDw8xLgkK6F1+SBiJk2Ce6dAN5D8YZ6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyLumu6Nea1fuLh3AkZzehA0ak/is3cDeP+qinPg9+rXwbTNtxu
 5653kMMyjxqLGi62VFI8q1nUuzC83wmMUPvJF5Fs8LfJu4CJtgwvpXcfPuywm/a27MLDx76ytJV
 jSfuUSeA=
X-Gm-Gg: AZuq6aIM3/7IrNlL8+tkJ8FhSU7PmwqdhpF1ktwY8Y83mIeUbqpTJjtvHLG1kne3sBL
 v1cfsejYNggj2mntmvrDPKiCpxe1w+lvppncGWjuvi5+rWO2u6blKxVwG0ub271dO5KIYyYEGdQ
 K3EkyHpY9CApa3+ef5dl4JLBkz2RaAc97P7F7cEDB2+pN1yafit9nLbINRMZEgjDF7LOQAhHEMa
 bNL4ma6eahHJ23WimKSvdj1HP+2E8S1rJZuoxDqzcwYzhUN6ldGwA7M/0J7ok5ftJBo9lpBFQja
 XvvPpK+K2chVt0lCxrmPBWpi7h/rugp3tNs1muDus8CtJyIZ7pW1mDFX1q2TQ0WQ4s015HTBof5
 uIIWFFaXUDyWdXnGI1jvpv7vdo+O+xAgYw1lG+zMSOMLZolSdJuJrJJd1gqtTa+np9UEsTQaBCY
 mgdwrOJr1AA6eLwk8V6PDJqQKitcsY0VYGh9LnuYYG75LAB+fQvbrxRIj2aY2pJWgw8WY625jE
X-Received: by 2002:a17:906:6a1e:b0:b87:63a8:8849 with SMTP id
 a640c23a62f3a-b8fb4501385mr340388666b.46.1771091461823; 
 Sat, 14 Feb 2026 09:51:01 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d95bsm86709966b.7.2026.02.14.09.51.00
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Feb 2026 09:51:00 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8849dc12f6so243129266b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 09:51:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWR74VFAFUP/Ap/cB/1mG/JIk4USHbU/l8XL6X35/6tgz4x7OCxeHMEOewwDG5Fxp0DgFoWEF+Axxx85p12T0/f@lists.sourceforge.net
X-Received: by 2002:a17:906:f58b:b0:b76:f57f:a2c3 with SMTP id
 a640c23a62f3a-b8fb41797e5mr289195266b.12.1771091460239; Sat, 14 Feb 2026
 09:51:00 -0800 (PST)
MIME-Version: 1.0
References: <aY_h1URe0wsXKl84@google.com>
In-Reply-To: <aY_h1URe0wsXKl84@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 09:50:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWPQdT+Gs=mHNaCfuVahCxU6eubBQ4cVwXkW9s5nMRuA@mail.gmail.com>
X-Gm-Features: AaiRm53pQrad9EyJNVy-D9itBuuvXMunPY7e9wqU9InyvOl1272fKacaWoX_s2Q
Message-ID: <CAHk-=wiWPQdT+Gs=mHNaCfuVahCxU6eubBQ4cVwXkW9s5nMRuA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Ts'o" <tytso@mit.edu>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [ Note: added fsverity people ] On Fri, 13 Feb 2026 at 18:45,
 Jaegeuk Kim <jaegeuk@kernel.org> wrote: > >
 git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-7.0-rc1 So I have pulled this, but as part of going over my
 conflict resolution with the fsverity changes, I'm a bit unhappy. 
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
 [209.85.218.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vrJnV-0005Km-Qt
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 7.0-rc1
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linux-foundation.org:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linux-foundation.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 662A013CA49
X-Rspamd-Action: no action

[ Note: added fsverity people ]

On Fri, 13 Feb 2026 at 18:45, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.0-rc1

So I have pulled this, but as part of going over my conflict
resolution with the fsverity changes, I'm a bit unhappy.

I'm not unhappy about the f2fs thing in particular - I'm unhappy about
the fsverity integration side.

In particular, f2fs uses fsverity_verify_page() by doing

    fsverity_verify_page(folio_file_page(folio,index))

which looks fine, and now wants that

    struct fsverity_info *vi

and that was part of my conflict resolution.

But then I looked at what fsverity_verify_page() does, and that is just broken.

Because fsverity_verify_page() looks like this:

        return fsverity_verify_blocks(vi, page_folio(page), PAGE_SIZE, 0);

and that's garbage.

We just turned the folio into a page, and now it turns it back into a
folio - but importantly it *loses* the index of the page inside the
folio while doing so!

In other words, fsverity_verify_page() does *not* work on large
folios. It only works when a folio is a page.

And I can't just use "fsverity_verify_folio()", because that verifies
the *whole* folio, not just the sub-page.

So my resolution was to just fix this thing and make it use
!fsverity_verify_blocks() directly, using the page offset within a
folio explicitly.

But I don't actually *really* know this code at all, and I can't
verify my resolution, and I'm unhappy with how subtle that
fsverity_verify_page() thing is.

I was initially going to just fix fsverity_verify_page() to actually
take the page offset into account properly, but it turns out that
there aren't very many other users.

Anyway, I *think* fsverity_verify_page() should be either fixed or
removed. The fix would be something like this:

-       return fsverity_verify_blocks(vi, page_folio(page), PAGE_SIZE, 0);
+       struct folio *folio = page_folio(page);
+       unsigned int offset = folio_page_idx(folio, page) * PAGE_SIZE;
+       return fsverity_verify_blocks(vi, folio, PAGE_SIZE, offset);

but I didn't do that. Instead I did a hack-job in fs/f2fs/data.c,
which also involved changing a

    fsverity_verify_page(vi, &folio->page)

into a

    fsverity_verify_folio(vi, folio)

instead, because it really looked to me like it should be the whole
folio regardless of whether it was a large folio (broken before) or
not (working if so).

It's entirely possible that this code only deals with small page-sized
folios, in which case it doesn't matter. But that
f2fs_read_data_large_folio() code is definitely about multi-page
folios.

There's another fsverity_verify_page() use in fs/f2fs/compress.c. and
I didn't touch that one. The code doesn't use folios at all, so maybe
it only triggers for page == folio. I don't know, and that's when I
just started going "Somebody who knows this code needs to fix this".

Anyway, I think that fsverity_verify_page() case should be removed
too, and then the subtly broken function can just be deleted entirely
instead of being fixed.

Comments? Did I mess something up? Am I just being confused?

Regardless, please verify my merge resolution, and please do
*something* about that fsverity_verify_page() situation.

            Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
