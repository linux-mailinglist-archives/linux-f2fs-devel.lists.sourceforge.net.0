Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCVRIKDdkGnodQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 21:40:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01D13D281
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 21:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHldTDUKm6ay1/runGAVTuxl7D2KcroB4JmCVRPqM5g=; b=DtnnAAcuL9vykTxi24De42OTpn
	vyPcZ/5hoBLXOZx1CuFWg79bcNamnTVOXXFf9/7pGSaiFA9YkZwBUN5+Sot9hXqKKp1b8HVwAXWVx
	0NuQRFBMoSQZEhNnMgcO+3bVth/wCjAYiJuQABKSvpDgrDI4NBQ+GYeOj69lkinxALp8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrMQd-0007ej-EI;
	Sat, 14 Feb 2026 20:39:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1vrMQb-0007eW-FC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 20:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xobni0Kui4RUZeyiNPg7YdinYh9j2rSDgpyUC3GHngQ=; b=RmDpM6cv98L61zEsxnQ8kzGNjV
 Y8eHicMmJqmHlyNAwrxezi5OS38x21Mih9cr8Xr7jN7lb8b1Q2fh6Dg0DlFgBjE+dxUluMdA9oCE1
 DMtDnNmB0CXMRW+MGcjFKXmHsRtn/+WqDgiOQipe2T2HQwQS3GWtG9MasM3rCWr331Vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xobni0Kui4RUZeyiNPg7YdinYh9j2rSDgpyUC3GHngQ=; b=PqIYhygTmWvT78er0G8DY3wK9W
 z1TaJPrHthqSVHzOmnps9UCkDNrJ6B4oZJ2lfBRifS95kB5CL8N3qc5K+AyUrmoM3yOXx5XR6AxEK
 o+s6hAh0kp2AawgbMxKEtO1U2qjvHXvsxByFmW+PMmKczyto7DfAb0T36Vh4Fi6qtIrU=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vrMQb-0003Bp-LF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 20:39:46 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8845cb5862so263110166b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 12:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1771101579; x=1771706379;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xobni0Kui4RUZeyiNPg7YdinYh9j2rSDgpyUC3GHngQ=;
 b=ei/7tovLyuey9wPnpj0GU6pxn4P2aKl71PotkajAmvCgGgNU1QMtfaIW7XH5iuwfky
 Q+hn44eX5H0OVIzUUrLnQy+iMEH5/0QcDFnVXerPfjgWI8e9DuSKqqUbJ9tWEz71ccAY
 KIcRvJ52hTheeQpezsgBK4KKhfbYpl/vSDT/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771101579; x=1771706379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xobni0Kui4RUZeyiNPg7YdinYh9j2rSDgpyUC3GHngQ=;
 b=aTNemrAUEmF1gjR4rALjgpOFBtzK9a8mMXG/NwaA/jOaBYP2F2NdB+7VQtyaeitCdT
 AFYNDglLyuRjwwm3f5I0IMNm2OyYVHxO7gYq6YC7QRkWt0eZp9RbGFO0ydbPuc5+lUoJ
 nQHC8hBzOYALLxaoQNrJjujY/CHBTe6KO01rCgp59UHHRXfjWxz/oMCiQJd0y1GOgEP7
 kNA+plYbOpCV/v/MvsJxcgereHpb6aE99jwCNy+CPuikHHrAdpBcdQGWc9+XA/dbKEOw
 8lE/t5uSz8PGcO62GI9jrnLqPtn1deh5N0y5CsqseDPJE1/XKz3qDBqnV/CLWibqN9Yr
 91fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjyusQ5i3P54yOse6Kl1q9EV9fGyVdncITTJzkIThfvIVEuVaeT9x+41dRKaYbgdniWE/i9Z514g5pLre+aW9j@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxreW2OMWG3+t7hf0lBQYUeNG967mrtQHyTLXTlUs7K120m2rjj
 KRZKBOjAJbQsKbVppH2JKTrEs2VjE/JkoEppUahRqjUXMw+pAkKVjgFM7/eAqipcHBJe9+x4gBu
 OqwnFbAE=
X-Gm-Gg: AZuq6aKdSgBdFgaWIzaXRjBIE7ZUSDUr7ZeJqJoTYPsi5k/arIy/2/M3XepPJhZjfCQ
 606PwRkIwT5JE1YW2NEsHlrb8rrTvSzAYmE2vjf/iTLih9vMZFDXY05pOs6TFJkdbBS/St+40Yu
 mPUJoxUO107ybQf8IOSNxg/UL/NvIrQmccNyeZ0tJsGZvH8afm+INr7GWEGyz+0ed0ntQz9woQm
 iu7Iglj3wGcYjJZQTXv0wsG/XI+zqsNqgcEIasC0v66H2rVRK30JH1ud+GxCbz8XIdebpuNkwaR
 ri5bDQp+hFWQaFEh5c9jryTamdhRQgbfpYbZxgwBbs1CJLh5SnGvkoQm4P8XNsMAwU8Dpd1RsQi
 kyXleC20od2AAF1ARvUiuwUZe0hZpifk20Jcf/YDbkyoVnqPR2TersOZI0Z/q41v/gAHx8OthGa
 CzfI65acmSqtbnz5vKIgA5RmoQTBL6NTZni3BdRTtJCx//nUdLle4AioGL53HqPhoQ5ujlIn+8
X-Received: by 2002:a17:907:1c9f:b0:b88:9760:2df9 with SMTP id
 a640c23a62f3a-b8fb4147096mr305185166b.11.1771101578962; 
 Sat, 14 Feb 2026 12:39:38 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc76c7015sm95471566b.66.2026.02.14.12.39.38
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Feb 2026 12:39:38 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-65a26c220b6so2765678a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 12:39:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8X5FN5WrVlvREBpwi1mgpGJoZf+QjfYZal5zC3Xbks53OSQw+1eSNIAjgFg435a9tKnLOwqUwCT8WyshQI9zp@lists.sourceforge.net
X-Received: by 2002:a17:907:3d52:b0:b88:16dd:d835 with SMTP id
 a640c23a62f3a-b8fb4149eaamr307827166b.1.1771101578249; Sat, 14 Feb 2026
 12:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20260214203311.9759-1-ebiggers@kernel.org>
 <20260214203311.9759-2-ebiggers@kernel.org>
In-Reply-To: <20260214203311.9759-2-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 12:39:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
X-Gm-Features: AaiRm52N7qTCMNkbWXl0IrwYY7YFxDkuplThSymslcU1mI1J-WYgkUTlm-Kk_bI
Message-ID: <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 14 Feb 2026 at 12:33,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > - if (fsverity_verify_page(dic->vi,
 rpage)) > + if (fsverity_verify_blocks(dic->vi, 
 page_folio(rpage), > + PAGE_SIZE, 0)) This really is very wrong. It may be
 equivalent to the old code, but the old code was *also* wrong. 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
X-Headers-End: 1vrMQb-0003Bp-LF
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use fsverity_verify_blocks()
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: BB01D13D281
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 at 12:33, Eric Biggers <ebiggers@kernel.org> wrote:
>
> -               if (fsverity_verify_page(dic->vi, rpage))
> +               if (fsverity_verify_blocks(dic->vi, page_folio(rpage),
> +                                          PAGE_SIZE, 0))

This really is very wrong. It may be equivalent to the old code, but
the old code was *also* wrong.

If you use "page_folio()", you need to do the proper offsetting of the
page inside the folio, unless the filesystem is purely using the old
legacy "folio is the same as page", which is simply not true in f2fs.

It might be true in this particular case, but considering that it was
*NOT* true in another case I fixed up, I really don't want to see this
same mistake done over and over again.

So either it's the whole folio, in which case PAGE_SIZE is wrong.

Or it really is PAGE_SIZE, in which case you need to use the proper
offset within the folio.

Don't take the old buggy garbage that was fsverity_verify_page() and
repeat the bug when you remove it.

                Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
