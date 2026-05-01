Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H/XDv209Gl8DwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 16:13:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 861474AD25C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 16:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9NktMfz8eCJCpjYl6P8iZHMRlP+KYjoBxtS4Msazhk=; b=JmGiXYbVxzabMLV/wZI+eCg46Y
	NC3A5aUiYXuymdEpuepUeh1T/m9TRRkZ9lIeI5T1E72At45rfHxrCaKRW4xbQiZnsSPWTK7x35K83
	FinSiuundjEwh4va+WDZhla3OqTk7Mw7JUn+ZUZXx7HGJPE3LYoLWUFujcNdlPVrt/4g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIoc5-0005UY-Ox;
	Fri, 01 May 2026 14:13:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wIoc3-0005UG-RN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 14:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/NGKRGLBaFaJfuJoXw3a9FIq2VN82hvsTqHtZVDhcs=; b=AamVqiC24ZOwW6i/pFi1/j2PxP
 /nwSRfQv8V3OYclvsp9wWasIP+tdLt+soDdxAmzbr27aW7mB4P8Q9Rbwj9jopoZdrvfY3qhL1H2bN
 GWkffdTBaJek6ZxZtMSLDBT2X79KQpHRma9LWcsaIsT1VNqUT3Q69BbZjNXh8PFHo1KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l/NGKRGLBaFaJfuJoXw3a9FIq2VN82hvsTqHtZVDhcs=; b=iB3IznKztQP/vpMJlmO2rmEGCx
 JGF5HYQRz8tuiBRDg/xQkJ2ZcTc9Zce7BJ1K3brfNYmRdGRz98FnJt5q0ZFR2dQotfW4U8kIwwTUD
 T95PTK1DX0sOySnJsgtNN9rpthR2GZTF75u0SnbgXGt1F4LVQf9wzDun0nKBc6t3qvqI=;
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wIoc3-0007OU-3U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 14:13:04 +0000
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-95cc96eac66so1114619241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2026 07:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777644772; cv=none;
 d=google.com; s=arc-20240605;
 b=bcNkS5uxjCfQvq0c//4zlDz1qbQoXJw3wRXlpIgdS9L3GJ18AkXfcamaozrSXI5ZGC
 cFFhJgrO/8MshLGfjTVBg3REekN1sTVZIwSF4LmD7cO68tuKhFIHVH1Yc8Yqgwb5vfmY
 5xODz3O+Mdbxmh4kV4ZIemCAMvigkuPOztlL/kF6A/OOm9CDiXdaB+lDf5clWE3J++yD
 x/twLawY6aeGtYqtab5SG8sFl63uzi5OZdKySQ5L0Nj1KpO2LyM5t8ZPX81eK+iOWyl5
 gdtwKlBc3wMmnlue1ezpsc/GM86gTFH73hIdnItZp6ihNuP02jFlEuIxHjvkyeCQizda
 DDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=l/NGKRGLBaFaJfuJoXw3a9FIq2VN82hvsTqHtZVDhcs=;
 fh=DpN65qerMYeNO5Q6pQGt6eduvovD2Bjr+etlqtXKc+E=;
 b=Cixp7tEdD8077IQP3Xbm0IEVudl2M29HMjOJxZuIstBk5ctFlb2dXXVRzDVBtbpUhp
 l/NLUKs7Q46TK+76SsBQ7abeu1RVsA09Ajia8+RPQDFfStpViJFPdeUa7teZMJofHbGd
 8j9mfU9KN+2N7wL1lnv0qpgri5GflPySupUPeq/uB8FXlLxWXNHnoPXxNAB6FB+Xp6Ec
 NJvkweKg2Uxx/9JTKG5BZsEokHUSI7bIy1V8QbaQhGF+PxEe2VY0hNDq1MeaJk0yTCjW
 yW6Ui7TKBRCgKS6ShpQDKfD/npYj+B3h84bv9ujeVs4KfFRTCBAoKhQmRAiuqPMSKU6s
 JBrQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777644772; x=1778249572; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/NGKRGLBaFaJfuJoXw3a9FIq2VN82hvsTqHtZVDhcs=;
 b=eGgVeJlPACIPqduWZNGrRX07DR/7ptTo2aFX2H3Z5lwBIEpw+me93CLNo2w1o5hg6W
 blgOEPw4xJzbo4iUkqjpI5TNiX9itHPR0OAaGVPo3gefzDSA403MmeNy5bp3V61g7qNT
 cE8XI1QUismwlVGCZGfWpBXj8KcOBPM5JdfKpTSn2mis0E3oFcozzxYbiakwsa/Tg/QF
 fE0LpL7cs7mNMgrPJ4UZHDgYBNsAzsMc6kcNEJftsSqhwxUODrYtiI/g5OrysYZC9kdV
 hu/2E3374zptA1ZyXS0oPmKcBESJDu0VNyEh2YCt3ur2pGweqpyUeXhie46F6Wqr2UY1
 RHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777644772; x=1778249572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l/NGKRGLBaFaJfuJoXw3a9FIq2VN82hvsTqHtZVDhcs=;
 b=BaWOllrp9n4avQdCHgzjiO0eApapAlr5oBEC4F6WsWMS9gPcYstLlySTbcc05pbGKA
 9p+TasWmZG7iqQnigpjcykmC0QGyhbpkTDEMa3TEl7NfsVTzAhfktW1kjIHN3P42REZT
 9UYrCvPgGepb3kcFap/Y57XQaEIz6PmHiS5lHhODzqXtXySpwszHecUVbLgk0mqScfIh
 xsW4C5mgvqRMvMbsnW1cQPpUYVVj3nbNJcPseFaYpSBQgFbv15kl15j21DnBXWf8cPu0
 nv8jyumOFpGnKd1o2vcqkSIkexvEsXRGys7CP7G4xQYCevs7yru2J9mKcMIZ+TbLhLYt
 JfRA==
X-Gm-Message-State: AOJu0YwgC83rXLwoMtmMzrNmqouqMACxvf54uC3Q5eiedOQQ7qgQNhRt
 ulafNlXmYGWzbRlcDsIOgiK5JQkSYQVbc87sl3wTR+E1Pp//GlDFdX9TFXkgBHyTnIabzznrtn1
 hyoja1ybS8708uFAdb2gJFKtbrQ/3BiZGWkU7
X-Gm-Gg: AeBDievzWs8DjFpX2aA9hXT1dU8nVbnYWwrQi0ccKctQxw35Agt4B6NrqQie2LId1Ms
 5PZs+T01hbyFLA/x4DvLzhf5+P2UT1jCsbxVfxaDMrkPPcI/GAmNv5XBxDk8cnACXLyAbNfofK5
 VzKJqKMk8R74xzNOGSj6FO49OBxKk1Vr+3a6Em48y2Cy6V/w3d4N2ivRpbB/hZBhrM2/qICfvWV
 7DuqZLi1PZsorFSnIu2rqku9Jtapx5zBBFBqFpWfNAOKoFkAh/SSsqpwLtFCjOwfsnyxUb7fdxe
 FPkxF+3Co77cJJZWgyRb0wsBbLeUU4ujI6IR74x4xdKMexQrxdSsbKdtGr7YSIB6uQpbN4M6PGe
 UEQzRmyI=
X-Received: by 2002:a05:6102:6057:b0:611:82b:a584 with SMTP id
 ada2fe7eead31-62ad4b8b5dfmr3701221137.23.1777644772109; Fri, 01 May 2026
 07:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260409134630.3693274-1-jaegeuk@kernel.org>
In-Reply-To: <20260409134630.3693274-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 1 May 2026 07:12:41 -0700
X-Gm-Features: AVHnY4LqLCbYbBpJ03OaniGAK7xOGTYD9wRgI003j7KM55RzHggD3eKMlD8Lnzk
Message-ID: <CACOAw_yB0iymUVEc3aOffn+PVFKu+xJQcQ1KUy00-1A7mQwYZg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 9,
 2026 at 6:48 AM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > [Script] > dd if=/dev/zero of=/mnt/test/test bs=1M count=1024
 > f2fs_io setxattr user.fadvise 1 /mnt/test/test > chmod 0400 [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.51 listed in wl.mailspike.net]
X-Headers-End: 1wIoc3-0007OU-3U
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: support xattr(large_folio)
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 861474AD25C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

T24gVGh1LCBBcHIgOSwgMjAyNiBhdCA2OjQ44oCvQU0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYy
ZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToK
Pgo+IFtTY3JpcHRdCj4gZGQgaWY9L2Rldi96ZXJvIG9mPS9tbnQvdGVzdC90ZXN0IGJzPTFNIGNv
dW50PTEwMjQKPiBmMmZzX2lvIHNldHhhdHRyIHVzZXIuZmFkdmlzZSAxIC9tbnQvdGVzdC90ZXN0
Cj4gY2htb2QgMDQwMCAvbW50L3Rlc3QvdGVzdAo+IHN5bmMgLWYgL21udC90ZXN0L3Rlc3QKPiBl
Y2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKPiBmMmZzX2lvIHJlYWQgMSAwIDEwMDAw
MCBtbWFwIDAgMSAvbW50L3Rlc3QvdGVzdAo+IGYyZnNfaW8gZ2V0X2ZhZHZpc2UgL21udC90ZXN0
L3Rlc3QKPgo+IFtPdXRwdXRdCj4gMTAyNCswIHJlY29yZHMgaW4KPiAxMDI0KzAgcmVjb3JkcyBv
dXQKPiAxMDczNzQxODI0IGJ5dGVzICgxLjEgR0IsIDEuMCBHaUIpIGNvcGllZCwgMC41MjA3MTIg
cywgMi4xIEdCL3MKPiBzZXR4YXR0ciAvbW50L3Rlc3QvdGVzdCBDUkVBVEU6IG5hbWU6IHVzZXIu
ZmFkdmlzZSwgdmFsdWU6IDE6IHJldD0wCj4gUmVhZCA0MDk2MDAwMDAgYnl0ZXMgdG90YWxfdGlt
ZSA9IDEwNjc1NyB1cywgQlcgPSA0Mjg2IE1CL3MsIElPIHRpbWUgPSA5NTU3NyB1cywgbWxvY2sg
dGltZSA9IDExMTczIHVzLCBwcmludCAxIGJ5dGVzOgo+IDAwMDAwMDAwIDogMDAKPiBmYWR2aXNl
PTB4MSwgYWR2aXNlX3R5cGU6IGxhcmdlZm9saW8KPgo+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsg
S2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIHRvb2xzL2YyZnNfaW8vZjJmc19pby5j
IHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgdG9vbHMvZjJmc19pby9m
MmZzX2lvLmggfCAgNiArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90b29scy9mMmZzX2lv
L2YyZnNfaW8uYwo+IGluZGV4IDY4MGMwNjIxODM5NC4uOGI5ZjllZjIyZWVmIDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lv
LmMKPiBAQCAtMjA4NCw2ICsyMDg0LDcgQEAgc3RhdGljIHZvaWQgZG9fc2V0eGF0dHIoaW50IGFy
Z2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiAgICAgICAgIGlu
dCByZXQsIGxlbjsKPiAgICAgICAgIGNoYXIgKnZhbHVlOwo+ICAgICAgICAgdW5zaWduZWQgY2hh
ciB0bXA7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgdG1wX3U7Cj4KPiAgICAgICAgIGlmIChhcmdj
ICE9IDQpIHsKPiAgICAgICAgICAgICAgICAgZnB1dHMoIkV4Y2VzcyBhcmd1bWVudHNcblxuIiwg
c3RkZXJyKTsKPiBAQCAtMjA5NSw2ICsyMDk2LDEwIEBAIHN0YXRpYyB2b2lkIGRvX3NldHhhdHRy
KGludCBhcmdjLCBjaGFyICoqYXJndiwgY29uc3Qgc3RydWN0IGNtZF9kZXNjICpjbWQpCj4gICAg
ICAgICAgICAgICAgIHRtcCA9IHN0cnRvdWwoYXJndlsyXSwgTlVMTCwgMCk7Cj4gICAgICAgICAg
ICAgICAgIHZhbHVlID0gKGNoYXIgKikmdG1wOwo+ICAgICAgICAgICAgICAgICBsZW4gPSAxOwo+
ICsgICAgICAgfSBlbHNlIGlmICghc3RyY21wKGFyZ3ZbMV0sIEYyRlNfVVNFUl9GQURWSVNFX05B
TUUpKSB7Cj4gKyAgICAgICAgICAgICAgIHRtcF91ID0gc3RydG91bChhcmd2WzJdLCBOVUxMLCAw
KTsKPiArICAgICAgICAgICAgICAgdmFsdWUgPSAoY2hhciAqKSZ0bXBfdTsKPiArICAgICAgICAg
ICAgICAgbGVuID0gc2l6ZW9mKHVuc2lnbmVkIGludCk7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAg
ICAgICAgICAgICAgICB2YWx1ZSA9IGFyZ3ZbMl07Cj4gICAgICAgICAgICAgICAgIGxlbiA9IHN0
cmxlbih2YWx1ZSk7Cj4gQEAgLTIyMTcsNiArMjIyMiwzMiBAQCBzdGF0aWMgdm9pZCBkb19nZXRf
YWR2aXNlKGludCBhcmdjLCBjaGFyICoqYXJndiwgY29uc3Qgc3RydWN0IGNtZF9kZXNjICpjbWQp
Cj4gICAgICAgICBwcmludGYoIlxuIik7Cj4gIH0KPgo+ICsjZGVmaW5lIGdldF9mYWR2aXNlX2Rl
c2MgImdldF9mYWR2aXNlIgo+ICsjZGVmaW5lIGdldF9mYWR2aXNlX2hlbHAgImYyZnNfaW8gZ2V0
X2ZhZHZpc2UgW2ZpbGVfcGF0aF1cblxuIgo+ICsKPiArc3RhdGljIHZvaWQgZG9fZ2V0X2ZhZHZp
c2UoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiAr
ewo+ICsgICAgICAgaW50IHJldDsKPiArICAgICAgIHVuc2lnbmVkIGludCB2YWx1ZTsKPiArCj4g
KyAgICAgICBpZiAoYXJnYyAhPSAyKSB7Cj4gKyAgICAgICAgICAgICAgIGZwdXRzKCJFeGNlc3Mg
YXJndW1lbnRzXG5cbiIsIHN0ZGVycik7Cj4gKyAgICAgICAgICAgICAgIGZwdXRzKGNtZC0+Y21k
X2hlbHAsIHN0ZGVycik7Cj4gKyAgICAgICAgICAgICAgIGV4aXQoMSk7Cj4gKyAgICAgICB9Cj4g
Kwo+ICsgICAgICAgcmV0ID0gZ2V0eGF0dHIoYXJndlsxXSwgRjJGU19VU0VSX0ZBRFZJU0VfTkFN
RSwgJnZhbHVlLCBzaXplb2YodmFsdWUpKTsKPiArICAgICAgIGlmIChyZXQgIT0gc2l6ZW9mKHZh
bHVlKSkgewo+ICsgICAgICAgICAgICAgICBwZXJyb3IoImdldHhhdHRyIik7Cj4gKyAgICAgICAg
ICAgICAgIGV4aXQoMSk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcHJpbnRmKCJmYWR2aXNl
PTB4JXgsIGFkdmlzZV90eXBlOiAiLCB2YWx1ZSk7Cj4gKyAgICAgICBpZiAodmFsdWUgJiAoMSA8
PCBGMkZTX1hBVFRSX0ZBRFZfTEFSR0VGT0xJTykpCj4gKyAgICAgICAgICAgICAgIHByaW50Zigi
bGFyZ2Vmb2xpbyIpOwo+ICsgICAgICAgcHJpbnRmKCJcbiIpOwo+ICt9Cj4gKwo+ICAjZGVmaW5l
IGZ0cnVuY2F0ZV9kZXNjICJmdHJ1bmNhdGUgYSBmaWxlIgo+ICAjZGVmaW5lIGZ0cnVuY2F0ZV9o
ZWxwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAiZjJmc19pbyBmdHJ1bmNh
dGUgW2xlbmd0aF0gW2ZpbGVfcGF0aF1cblxuIiAgIFwKPiBAQCAtMjYyNiw2ICsyNjU3LDcgQEAg
Y29uc3Qgc3RydWN0IGNtZF9kZXNjIGNtZF9saXN0W10gPSB7Cj4gICAgICAgICBDTUQocmVtb3Zl
eGF0dHIpLAo+ICAgICAgICAgQ01EKGxzZWVrKSwKPiAgICAgICAgIENNRChnZXRfYWR2aXNlKSwK
PiArICAgICAgIENNRChnZXRfZmFkdmlzZSksCj4gICAgICAgICBDTUQoaW9wcmlvKSwKPiAgICAg
ICAgIENNRChmdHJ1bmNhdGUpLAo+ICAgICAgICAgQ01EKHRlc3RfY3JlYXRlX3BlcmYpLAo+IGRp
ZmYgLS1naXQgYS90b29scy9mMmZzX2lvL2YyZnNfaW8uaCBiL3Rvb2xzL2YyZnNfaW8vZjJmc19p
by5oCj4gaW5kZXggYjBkNDA5OTZmMzAyLi41Mzk5NjRmYzI3ZDMgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvZjJmc19pby9mMmZzX2lvLmgKPiArKysgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uaAo+IEBA
IC0xODYsNiArMTg2LDcgQEAgc3RydWN0IGZzdmVyaXR5X2VuYWJsZV9hcmcgewo+ICAjZGVmaW5l
IEYyRlNfSU9DX0ZTU0VUWEFUVFIgICAgICAgICAgICBGU19JT0NfRlNTRVRYQVRUUgo+Cj4gICNk
ZWZpbmUgRjJGU19TWVNURU1fQURWSVNFX05BTUUgICAgICAgICJzeXN0ZW0uYWR2aXNlIgo+ICsj
ZGVmaW5lIEYyRlNfVVNFUl9GQURWSVNFX05BTUUgInVzZXIuZmFkdmlzZSIKPiAgI2RlZmluZSBG
QURWSVNFX0NPTERfQklUICAgICAgIDB4MDEKPiAgI2RlZmluZSBGQURWSVNFX0xPU1RfUElOT19C
SVQgIDB4MDIKPiAgI2RlZmluZSBGQURWSVNFX0VOQ1JZUFRfQklUICAgIDB4MDQKPiBAQCAtMTk1
LDYgKzE5NiwxMSBAQCBzdHJ1Y3QgZnN2ZXJpdHlfZW5hYmxlX2FyZyB7Cj4gICNkZWZpbmUgRkFE
VklTRV9WRVJJVFlfQklUICAgICAweDQwCj4gICNkZWZpbmUgRkFEVklTRV9UUlVOQ19CSVQgICAg
ICAweDgwCj4KPiArLyogdXNlZCBmb3IgRjJGU19VU0VSX0ZBRFZJU0VfTkFNRSAqLwo+ICtlbnVt
IHsKPiArICAgICAgIEYyRlNfWEFUVFJfRkFEVl9MQVJHRUZPTElPLAo+ICt9Owo+ICsKPiAgLyog
dXNlZCBmb3IgRjJGU19JT0NfSU9fUFJJTyAqLwo+ICBlbnVtIHsKPiAgICAgICAgIEYyRlNfSU9Q
UklPX1dSSVRFID0gMSwgIC8qIGhpZ2ggd3JpdGUgcHJpb3JpdHkgKi8KPiAtLQo+IDIuNTMuMC4x
MjEzLmdkOWExNDk5NGRlLWdvb2cKPgo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KClRoYW5rcywKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
