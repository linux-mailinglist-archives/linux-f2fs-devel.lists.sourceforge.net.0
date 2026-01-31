Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMzILBlufWmTSAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jan 2026 03:51:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CEC05C8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jan 2026 03:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yr5zNLmTPR3zGTH4JhAWfHMzOLqcZ49CLMXddYB43u0=; b=gvjPFmiy9wVxp0m5rOD5tRX9Qw
	NigZLZktd2NlrX5E9qw/F3Jg2NGC1s9vvzxhomu8QOrGkYzc1MfHGDaK1QdDouzZvz/4W2chvYtBk
	61VHqOroE9+iBGZWoyv8b+z+0k90e+iNiQZigaU0AMprFo45b7JsnllDGf6rgwIQLL1c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vm14b-0005Eg-FE;
	Sat, 31 Jan 2026 02:50:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1vm14a-0005EZ-1h
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Jan 2026 02:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGrXiWOM5o2ZONTA0HJZyowG2R0Agsy9r5ZCKQoJjAc=; b=DdOogT1szv6Z1dwTqKOF79Tm7N
 G2B4naGijhGVa2gAviWa+dfVhvxqRi6BjY4/Dvz8Vq/5fifyRSOvrVpzuZWyRdZZJMeoNcjOQIov9
 vKtmFH6cgyr0L/wN7Md+NHL/jHk+jG/kHznJppSJbRIkd2tIV5aqsF8ItayQ5xoc/i0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zGrXiWOM5o2ZONTA0HJZyowG2R0Agsy9r5ZCKQoJjAc=; b=WZO3GyGobo+t7znU7t4TE8Z1JJ
 ffu4RK4/tpjrB6Ttde5aeppAJbfkp8Ea4zwvzgVFGIzFj27mOA3DrkLGdOKCu/V0Ox9j4tvUYtE81
 N+xgGszXdJ8z2dzYX11EC3eEB+6bLSsaLH4skmffCVe4+npPOUfKf0ofGNjNa3OpNrng=;
Received: from mail-qv1-f47.google.com ([209.85.219.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vm14Z-0002ux-Io for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Jan 2026 02:50:55 +0000
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-88888d80590so41774856d6.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jan 2026 18:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769827844; cv=none;
 d=google.com; s=arc-20240605;
 b=ZFK5+EyDYBDqfPkIgXII5j1G9zGps3oKPUyU519mBKgXFTFdP6GjXdG7v2GoAVOD9f
 06BhYsAbmh7vFk3fsxsfu+siS0OZatEQH/bwDRMD6iuYymumwcWrru8T872yEeqrp1XE
 gV8RZNQVVFhPXnfd5hHlrV2595a8hAtJz6OGcuIuUKWZiodsLYMoeLh3tsFJBJpEHNYR
 tI0DGN1O+Uk9izxxc83HcYACQ2SpPOGv/m99CHeP1TgDiFSpQSyL9n65kwYEWw3nR5Sk
 gYnP/JTUUVhIORpvHPGIPeGkSAC5D/yXAPoIz7JZn4QcvAscmljr1xZBcwGNiBEejKe/
 e/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zGrXiWOM5o2ZONTA0HJZyowG2R0Agsy9r5ZCKQoJjAc=;
 fh=mTbffWfP7Btjzu5/7/mM/14LFATAwmeZVRTtSju1/Oo=;
 b=C0wkI59UkCYO1MZKEh8pBrS8HBK4aK/Uj3g3GKzxJm8c00DLJXF37WI8HFOjaprgvB
 7g2BEGvmBa0qSZwZx/fAb4kkIEOvrLA0+vSDMtigAFts6DrjiHGp7AJLiWC6Sp38Zbgf
 FU/aX/pM487/Ef4DZZr+T4X2IoTYhPb7pBA5I/N3A9N52lAOLbp0mTZ/tJo/m41wwHWm
 9BjXI4BLGycdqcmp6GiDypCfNk803v2USm4VHH3X5MECSayyCRi0yGUXprSbQWSeps7p
 AqvMxDCaGbfwAb0SYsCKxZ/cUnn989gBwxuaOpt5w0L7D+LPJU0p3Tz8rliDYkxDTMyL
 eiDw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769827844; x=1770432644; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGrXiWOM5o2ZONTA0HJZyowG2R0Agsy9r5ZCKQoJjAc=;
 b=AhbN4/xBwXKdnt2/xqFeqodBAPHdTNkQ2+TbKrdWtoIeYnI2w6O2I8nmI6S1yp1kpz
 hRHN9XbPGVRkXm7YHP59Yte4dC6aT72fuUmBTXuPzqzfRnrDn9KhmKcIf3eKKJ/pBJ1s
 sjll9VlV2v3Nu2wVt2M6kIho2eNTc796ficTa1O41MO2JRhHnR87nc1Uz3Qz2bQMZWCF
 OmPd5BEQnmBcGD1gldIBCXa8MPD50myoiT2JbQjQ/XpAg8tjExSxv9+6/9f3t6aT+h+B
 4y4nMXiFtLq+wCXs9IibWBIuBmN2vEWKAaxeCQfNkA3Z9RDBSYKH7QoSz5wN5efVus/t
 NaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769827844; x=1770432644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zGrXiWOM5o2ZONTA0HJZyowG2R0Agsy9r5ZCKQoJjAc=;
 b=EONDQqD9YQVKEdOZz6cgJkm2ukbLS5BEBYGHwGGPgdXV/Dc6xBNfMfOgxfiEqM6ts3
 /TCa28TqbASMewMQajuGQ4J+lvzrR04bGFdwcD52a1q0MhyZwGH0S8PMUe1Z68V/tAfe
 GfRdjzrwx/qUmQREcEREYycMS+PYWdUVKTT26+zbLqJpeMdAAb+3n/HKV884HbXtSpUO
 h8VyRvXXaWoDHE0GS6P7vAf5Yx7X7IrwmB5K+Pgycn8nBWozFqLtHI7xpNFiQZzv55Om
 R9TBXQvjjwJa1YCeGZnbfMbyiRRHNEo8al8kjljGdDiC9gqEk2f2CXw5ZsQOjn/D4O4c
 su3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOvg/XjhodYg6g7YMABER1eOCa65M/WvZ0Xa3FXnA+y1OgzPaJXs9sJRKY6IE9LDrQ5HVqLiW93KPKrul0xU/S@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwXcSytvQI4wtZf9NKBKX0g2nU883Ck0j7KJpod66d9Kx4Uj1cO
 GN2k9+dpPjHhf7F52Sp31FBeg/xu3LRcYjgRIlfhKda/2FX2LM97YQi8uJhDsezw1Wj3Vp5/Xk+
 k4/a7uWxF4OBcFLIdYFlEbNWO4ojMefJLycZRb9ZBww==
X-Gm-Gg: AZuq6aIxvVSfGizYtogY6oTOAti3hDifIVFrWXI/2WYy0L9D2n680yjG1PZ8JRsWm4P
 U2WwZBvRgu0weqCLE4T0rmmxG7/kfLp917v8QBnNsaiw/5bmtVKWz+MQ1meax7VNp5yrWqVtez9
 PONhabMOcmuVSg7+t0dF86nptf9m2q1zJmz5mOhALxrPn/3+kt2R1+oyts3bDvrGkQRK8EHKGvm
 cEiBJHXZ4qU2Rs58rUySF2PpXwPb8MzSpkgI77EliiQmyBAfJvQrD7sDakTsfJw3W8x9Ulp2ZAR
 vm595qJj
X-Received: by 2002:a05:6214:2aaa:b0:894:6c73:7e79 with SMTP id
 6a1803df08f44-894e9f85c7emr83516616d6.18.1769827844343; Fri, 30 Jan 2026
 18:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20260130132809.59707-1-chao@kernel.org>
In-Reply-To: <20260130132809.59707-1-chao@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 31 Jan 2026 10:50:33 +0800
X-Gm-Features: AZwV_Qgz_FXRSPV3ASPq3vCpEDi76HSBwkEOXp11qyhLpoC0s9G-PmiB2aoNz1U
Message-ID: <CAGsJ_4yGBt4Rt=njP=cY++DbEDAWKSyDuuXOC2pXGoJGCvJYFw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 31,
 2026 at 10:27 AM Chao Yu wrote: > > If userspace
 thread has held f2fs rw semaphore, due to its low priority, > it could be
 runnable or preempted state for long time, during the time, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.47 listed in wl.mailspike.net]
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
X-Headers-End: 1vm14Z-0002ux-Io
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix lock priority inversion issue
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[21cnbao@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[21cnbao@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F28CEC05C8
X-Rspamd-Action: no action

T24gU2F0LCBKYW4gMzEsIDIwMjYgYXQgMTA6MjfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gSWYgdXNlcnNwYWNlIHRocmVhZCBoYXMgaGVsZCBmMmZzIHJ3IHNlbWFw
aG9yZSwgZHVlIHRvIGl0cyBsb3cgcHJpb3JpdHksCj4gaXQgY291bGQgYmUgcnVubmFibGUgb3Ig
cHJlZW1wdGVkIHN0YXRlIGZvciBsb25nIHRpbWUsIGR1cmluZyB0aGUgdGltZSwKPiBpdCB3aWxs
IGJsb2NrIGhpZ2ggcHJpb3JpdHkgdGhyZWFkIHdoaWNoIGlzIHRyeWluZyB0byBncmFiIHRoZSBz
YW1lIHJ3Cj4gc2VtYXBob3JlLCBlLmcuIGNwX3J3c2VtLCBpb19yd3NlbS4uLgo+Cj4gVG8gZml4
IHN1Y2ggaXNzdWUsIGxldCdzIGRldGVjdCB0aHJlYWQncyBwcmlvcml0eSB3aGVuIGl0IHRyaWVz
IHRvIGdyYWIKPiBmMmZzX3J3c2VtIGxvY2ssIGlmIHRoZSBwcmlvcml0eSBpcyBsb3dlciB0aGFu
IGEgcHJpb3JpdHkgdGhyZXNob2xkLCBsZXQncwo+IHVwbGlmdCB0aGUgcHJpb3JpdHkgYmVmb3Jl
IGl0IGVudGVycyBpbnRvIGNyaXRpY2FsIHJlZ2lvbiBvZiBsb2NrLCBhbmQKPiByZXN0b3JlIHRo
ZSBwcmlvcml0eSBhZnRlciBpdCBsZWF2ZXMgZnJvbSBjcml0aWNhbCByZWdpb24uCgpIaSBDaGFv
LAoKSXMgdGhpcyBldmVuIHBvc3NpYmxlIGlmIGNhbl9uaWNlKCkgcmV0dXJucyBmYWxzZSwgZm9y
IGV4YW1wbGUgZHVlIHRvCm1pc3NpbmcgQ0FQX1NZU19OSUNFPwoKUHJveHkgZXhlY3V0aW9uIFsx
XSBpcyBjdXJyZW50bHkgdW5kZXIgZGV2ZWxvcG1lbnQgdG8gYWRkcmVzcyBnZW5lcmFsCnByaW9y
aXR5IGludmVyc2lvbjsgaG9wZWZ1bGx5LCBpdCB3aWxsIHJlc29sdmUgdGhpcyBpc3N1ZS4KClsx
XSBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTgvY29udHJpYnV0aW9ucy8xODg3L2F0dGFjaG1l
bnRzLzE0MDIvMzA3NC9MUENfJTIwUHJveHklMjBFeGVjJTIwZGVlcCUyMGRpdmUlMjBvdXRsaW5l
LnBkZgoKVGhhbmtzCkJhcnJ5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
