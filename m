Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIjsKLUIAGqaCAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 06:25:25 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAE5027C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 06:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1MgotMhD0RMC5V+/bsPrgDf2wNCq7R16Og2uER1Uus=; b=SSMxUd/Ikke8i8SUTdamnJldlA
	2uEUYlAG0vFqbNEU/MuwJyGR7WbhK1hZGvaN8QZpcebRiT28iMaWJQRBGBSp5pb9n2HIBkrfSyYBr
	2ke9S0fJvwyzrw0OFD1UfKxvba1AEqw2envp75UI9hRhQD+r80JyXPloTEu66IZLFiuw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLvjB-00008P-8K;
	Sun, 10 May 2026 04:25:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1wLvj9-000089-VR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 04:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MxPCgRuQxIoXD3KgGAHemZ9HIJl4MTrnvoYJ3nCKRdU=; b=Z0rUA5tkVh/02nWgr8n6czctPY
 EqvazVC49SEIKntHevs4CXtNNyLphU0tNbY8WOOoP09VYYPW05dxtKqZ1SNLdY40HXFLAJzgIJ2tq
 3+reAoNNyVmDPHCnk5vlnbvMQUpxCRfRIz/S6azyoha+sbupoXlti8je2Fxja3GHoYO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MxPCgRuQxIoXD3KgGAHemZ9HIJl4MTrnvoYJ3nCKRdU=; b=FGYceVfpz4GHnlm74/HVEbCzv8
 xK4hKbBaSbcDxq1JxBjs81lJlYpDZ9fjxAdURY+tIzpHeGneGhWpNs3q+KxQwzI51dIv8tAfk4iVS
 m6dzss693SXFbpm3ZNG/15GO5fQnS8PoBO4zhhex/lI6WnJyK1LQeCKqRBf6KdOaPVLQ=;
Received: from mail-yx1-f52.google.com ([74.125.224.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wLvjA-0001tp-C9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 04:25:16 +0000
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-651c7ddf514so3546165d50.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 09 May 2026 21:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778387105; cv=none;
 d=google.com; s=arc-20240605;
 b=OP7PrKNfJm0+SByu7Q0dQHmksrK62c/N6+7ug2kO26/cQtRcZfk17hmzcpIMCd5eov
 QhCE5tOMRAsE4MZwJUkhHn/rwLEY/oQTlucQ7n0ZinfW8aXA2qzBGc+pMEt0GWbWPjkx
 WoVTFaamRdF1VMzCTxGzRCBN9YOnfrNVKVxYY5WkaxoGc1eVKnocpJdXjGq0DEDRR1T6
 7A/cuWZ4p52wqOUeeyZN+4n9oAwDJxIuAREAa6fvMhtGCv6ZaJH3uQZ7tG1faihzRPQX
 rm7WRa27NjpWwtS//LIDiDz1m6fypCRa7K/Jk2AQ96r+5QBoSpgJ/AiVrRkqoiw/Aanb
 3hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MxPCgRuQxIoXD3KgGAHemZ9HIJl4MTrnvoYJ3nCKRdU=;
 fh=XpdkXMLqQRCvz6TSMS8e2CsF5N1uicYrw807i+v9Y3Y=;
 b=fgBC/bm9fSk7aTmLbOBeAaVLBtzvBVIt8zprSKAjacLj25BYPybTQUsknAa6o2nwFE
 dyiE+Enbpj2LOYSmMQZxWokuedX7TIUMCne737tRK2kFpCWTsX3BRIt8zCkz3OuRaykG
 pG/BOwqC06139AJQEllZXj7P/ecoP/TLTzG65n4ww2c5fuWGlPgSQi6BlFsW8o9x/Mpo
 36NclhS7Hm2vig11Jc6rEsnJbMas8zV80z31cWr/V2eNeZYOavnO4d4ctcCGzGwj4gHJ
 y/gN/Mu8LsZwJWVGkHrDJzH8jop8mOSXHl/0UkA1Vo6PovzsPt5Vw/jP/0asz+nKMug7
 w5JA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778387105; x=1778991905; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxPCgRuQxIoXD3KgGAHemZ9HIJl4MTrnvoYJ3nCKRdU=;
 b=M3N/sC7uXDZWJasXwlJIfpRwEbA1vehegObeIWl6tDllhSYL2J8CWeUUQrI24uaZw/
 /RHHtyieuN25zev8+bKluKN9gb9E6Cx7KLEePUWp9sCuTJDfZ+UzA+h+zGpLDtRrayMO
 Ahy9hpPNqDsAxkoz/YNPO1QoCbkAOdHYCYoU4Hjq/U9FTnevkmKnxNPFITjzkl/qJJUO
 jRCCjqe4NUr6rXYRTrKvkbWwlwcUWeyM2Dm+W/JplVMPUiSLWtpHeLRgrkwtfQIdefUm
 XStDnRxp5b3dNEIXkdXNP8Ak7nyh2bII8r1ytXSZrgc3SuLRVQIsh+gVNlcVLPH+fpHw
 v+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778387105; x=1778991905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MxPCgRuQxIoXD3KgGAHemZ9HIJl4MTrnvoYJ3nCKRdU=;
 b=m/XCRmdzK+RLN4k/ymvHmSKLNMWOiGR3nWHa9/HK+rLWkw19B+d5xGL25fIvzJF0qG
 V/AFrV4a/V6f7yiFuAsHoUpQCF8vPCBGo5VhXzEaYrzHYopYAGfLKlchzvMCTTn4ubyY
 oh0E9H9AoMsjsHkyTIr2fVPAgtZiJGkf1FGX9EiahCnoRqJDrK1LV7zO3iH9KkNQvu/C
 TOGlEEZEwE0kLG1fA3ehK3xcmoBQmAwc7SuP3aOwjBqpTt2Fr9zNDCKEbLj+S2/HJ1uf
 PRPe08ZVFMhkP99wtkWxlwU3/+vSqj3ea1D0n9TJbBSDHf+P2K3NR/yN/qZYGINoXwZn
 cacg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8R7EA2gIbZ6XuN5gF9YEPO/N4vu913eM/cLsepFKm2kpN3TXdOFPNCsJ7URiQ362GDib+Qez1+nr/rwK1jsFx@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwTGfOMeaOg4Y5bvt6OxD5rd1OJpgERw9lwvWkf/v58YUVlVmYG
 TzFBwzynKZDO1ADwyBwndfR/T5/EK45HmQf6ffEL1hJgICsTrOR4xV3Njg9sJPZ7GHmRRmmZUYz
 d4mZlvaX6C8MCbh9B7xmP0xnIBzRhs20=
X-Gm-Gg: Acq92OGTbhgkY1DGogkjWuJ6vy6+2a2c+7LhKvPrTAK+NhLNghvDRr8cZyr2TQGtdwV
 dc6xQuDA342HnjEHajaJLzZN6wDZMnYfjTgi9EwljJAaahzA4gpdSKyXZcV2c3HVmgMmzpgKXWx
 yw4Wo6WxRM8RU5WR4ljunR4FYyfFpFQ/WXsZJS7YKyO4cYevGh1TybYdfwfiRlpSYn5/PJggrPV
 Cptza0T1t7WFhlC//wXlsNE+aQV/wYLyomqE/707QFkABRQWHpQ6/6akXMXGRXsQCaJiczJ58Hy
 GPomREjrF+/iiUEXp9ksEzN7hNvUBRfjxPZw/hUIJcJL+VhfDl/v00AvuYgYIHLczVEcWl4gTl9
 JOplQJ0o=
X-Received: by 2002:a05:690c:e3ce:b0:7bd:646c:7f76 with SMTP id
 00721157ae682-7bdf5eeffffmr200949017b3.37.1778387105466; Sat, 09 May 2026
 21:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260509042239.87763-1-kartikey406@gmail.com>
 <adbb350c-ae39-430d-8a2f-84c31150c3a2@kernel.org>
In-Reply-To: <adbb350c-ae39-430d-8a2f-84c31150c3a2@kernel.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 10 May 2026 09:54:53 +0530
X-Gm-Features: AVHnY4LZk7Z5q5BP_p8SfJ4h4jYottD_S4nAFTsG10h4g0hdAWtis5gBoZ70IXM
Message-ID: <CADhLXY7Ko-kiVN+9NDYo7u_NaUMPNpLdmOg4YjyX7BQAM95XwA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 4.1 (++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 9,
 2026 at 3:00 PM Chao Yu wrote: > > > Cc: stable@kernel.org
 > Fixes: xxx > > Otherwise, it looks good to me. > > Thanks, Thanks for the
 review. I have sent patch v2. Thanks 
 Content analysis details:   (4.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kartikey406(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kartikey406(at)gmail.com]
 4.0 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?74.125.224.52>]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [74.125.224.52 listed in wl.mailspike.net]
X-Headers-End: 1wLvjA-0001tp-C9
Subject: Re: [f2fs-dev] [PATCH] f2fs: initialize ino_entry_info before
 checkpoint load
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
Cc: jaegeuk@kernel.org, syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: E8EAE5027C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,eec8f2693d71386bd600];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCAzOjAw4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+Cj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4gRml4ZXM6IHh4eAo+Cj4gT3Ro
ZXJ3aXNlLCBpdCBsb29rcyBnb29kIHRvIG1lLgo+Cj4gVGhhbmtzLAoKClRoYW5rcyBmb3IgdGhl
IHJldmlldy4gSSBoYXZlIHNlbnQgcGF0Y2ggdjIuCgpUaGFua3MKCkRlZXBhbnNodSBLYXJ0aWtl
eQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
