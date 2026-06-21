Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LysDJ52eN2qlPQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 10:19:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B86AA6F5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 10:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=E1gMyxjy;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=CktusIqJ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=gHH85mB3;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="V8U/DTJN";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qz2Dvd9zDZUr7tuT6fxnhHBj1gUnLTdIGEgs+YXj7s=; b=E1gMyxjykbjb3nXyevkPX1U/uf
	BEwG58qKbeEBOrGdU3NYAiAnTx2pmbfrXBikJCl+35nKXxfiWCniNAHqGakzksE2x99s/Liig0gw9
	+cc8Inv0fKuJQ/zblPiecK+zajo8hQMdN4f+C4AdWvkS2E+7yfAhLbb8J5al5KR8bTtU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbDOn-0004LB-1a;
	Sun, 21 Jun 2026 08:19:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1wbDOl-0004L2-FH
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 08:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kl0RwkmBtgFb4D5/trbkU2TChopX1y1xhO+Py9J8ZPw=; b=CktusIqJGXb/HssJWt4+l0bpj+
 msqa+1T2yHoCe7AEUvIaw1H4HO2Ux/0FnvmTfy/AtSdF1SHPccPpg9PhAtQFPB/GUrUUS14zvKu2y
 plOt1yg/+CsLVMf18rSBVMw2ovxN424Yl9G8mcxgsn5h4CUBJK9BchVWv/e722vWKYPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kl0RwkmBtgFb4D5/trbkU2TChopX1y1xhO+Py9J8ZPw=; b=gHH85mB31vp0FU/4XENCzokFuH
 W+5DWf2xzQkUwfmGsB9wAcCUz+/OOscLQjOteSGFZDt8qg68zVhVM23fuOY5tjngQue2Dh57S08NP
 dKH8iCksq1Gt2UdNmjqoC410Do+Ekh+QF0iP5LPDgKxxnLoWyBCD3YEgFcCdENEO08Ng=;
Received: from mail-yx1-f54.google.com ([74.125.224.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wbDOk-0003hF-Cq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 08:19:23 +0000
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-662bb8b1f93so3265670d50.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Jun 2026 01:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782029952; cv=none;
 d=google.com; s=arc-20240605;
 b=BL2c0+9/RqVEPLI7pqv+P+DcThzV9KjOCt/uSnsKG1U8zWOMzq66QfEXeKe/0iwG5Q
 LzPVEymbNEoPYpVQIZBhihoQeEMO/GOV8SUQGqcKl1gwdiDqt2l3nRE/VhX39pLA+VfV
 otK1kFFywQueIfDEw/ns5INjVaiLrg7r0Nm9l5/+QBOhwDzlN8VbQpojsTa99dTzaedB
 gNadJSCt5K7dWnI7Rg45cdk8uS0WR4UprpsW5GxsO5nm7aMCMy3h+pTJ4rcGMpR4z1ft
 aa63WmTLe52IHVcHjYJBurKUbU4RSRONscLYCvzWY/BXUoqA0CKUT6C3hroN+UL/tCLV
 je4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Kl0RwkmBtgFb4D5/trbkU2TChopX1y1xhO+Py9J8ZPw=;
 fh=V12v0R7USkWGcz4J8UPBZnO1JuIOlIJ9LsxsiQfqbaE=;
 b=YFhWtUlrGZtJNTNMzxVLddE7z44PSLiY226qUVFD6qS9rw10u0Bvc9YbzYtC5cc39Y
 dQq9Mb2hSImJ1hriL1heGF3XJ++SV49iTeVuqFmto24UQPel+pybz4DB/NNleJMviqDa
 SxPHCagb7+ZjdzCu6XJHUqDYYbHIwlXD2dIXGvdFwEZaLMCAbuh7D0vs8i1FuibRvZ5H
 WeLLFNK3ObtDdZoXnT8sag1Y68UBYbyThkDKz3ZKgOUe7+KQ8MbMksHvjZwo8hhZRnmp
 BrSysbBnH4Dc85xaXHOWTP1nfhGZOQK40QkP2Gp5Pkg3NjDnyr+lsKUpEkemN5KEUI4G
 Vpxw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782029951; x=1782634751; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kl0RwkmBtgFb4D5/trbkU2TChopX1y1xhO+Py9J8ZPw=;
 b=V8U/DTJNfmr9uk6I+8tTq5/NkLM/mOir+RDGh19UaQ7bbME9NrsyNZtjRwDk9I1t+Y
 EcRGZvLtwJYhjYK0EXvZ1kigL5aY4op5rCYjR9QGqhmzyTwQ6XY8amBLoSWCiomg3Ww2
 FyYsa2pjmGeTa6ewgrUindgTyUuZD2XMe1NtLZ0Xywj+KRIMwbRb264KOwmzPM1cjagE
 KJDUr2tgzDGt5neOfecYHZ9SADP/h9+6/NI4u1JSfnCEPVjgXGhC/nL/YYGMlg5qU/YR
 1497moTruzV3GEXRN5cdtGyD/HEwaG302wSd2Cmu1IuAhcMzH56Y3MbaNGU9nnuocPHY
 8MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782029952; x=1782634752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kl0RwkmBtgFb4D5/trbkU2TChopX1y1xhO+Py9J8ZPw=;
 b=sJbCDwlQdoKHIlHj/NzhPcF0wXPIYyPo4/3tJeR7UEEKsL0CYboGZ4DbPxgl1zidgx
 YzcgONRh/U0fS8PGCQBm0k3jFbn/zvbv1OKrS2sSASvprE4rWDMf/7avd66aeyL+HRHa
 AdCwTZiXI1AD4y7R4Nk+GHCV6QeJ/pWu2vaVyJWdcTePFpu7ADWEHzBpm8PSXv5LIabM
 t0kynrkaHOOcRo/HLASmdoCtyKyMMDoNJvWfmK51MghN6NMDWBTJ2ucK/ckC0cmrgKaF
 s5ZalV2qvqOv5TmtQCy94r4DEbAdkdxG3t4fCd2r7n6C5najmADB5skVKw87Sc37UNgI
 +yyQ==
X-Gm-Message-State: AOJu0Yz4u1FXnIIkgbkWLH+5t1M6XnEC3IshEFo9WKmxWvtNKNs6cIjd
 N/xFtbhEPZwdwhoRKrRZukAvcOuINHF62Z1T2szC3o9mUBJIcExblp7A+ZcyG9gFrU8DZJiC5/D
 adna3lqYCK9MDLp+BTNl3yhz8lF7wlsk=
X-Gm-Gg: AfdE7ckz7+IIed/mTuu4gYFwyw5bPui+0874eDbBe/okcFHkdx4ra/ETQEVNQYy+n/d
 7rJnVUzQAkC//GPdbepOuTwDf1Ge+8k1+H3JJnvtJKt10i6RYZmE3owBPaRSRmZr0v3Osc8zrI4
 Fy0Uxr1my3G4LxCACjwTu8ZF60B1p12J+aMgxprbxK/7ZgAdydBtERNb9lVeKd6/qHGysfbC+Qr
 TXO28HguvTY/SZgT2wbbgYnWiQXYIIYOKHKqqoV8yKEyz6deg2cxMN7VZopkoAd3Mh9/gYBZVe/
 8PirOamQ7ijOhpA2ffjSwkm9cx/sxIjDTa4MGwRWysmddxBm3yr9VXGQwuxeGg==
X-Received: by 2002:a05:690e:140d:b0:662:ee81:7c8b with SMTP id
 956f58d0204a3-663033ade28mr7830646d50.50.1782029951559; Sun, 21 Jun 2026
 01:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260510042336.94751-1-kartikey406@gmail.com>
In-Reply-To: <20260510042336.94751-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 21 Jun 2026 13:48:59 +0530
X-Gm-Features: AVVi8CdklumBH0Qp0Hzi4XVZe_rK_yfiZT1tOZF49krh_SjBp5barwWPiKML-I4
Message-ID: <CADhLXY57Oi+5+1PNb3ywnfVFV3iCHd-OFmpBS0=ooq0nFuKxiA@mail.gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, May 10, 2026 at 9:53 AM Deepanshu Kartikey wrote:
 > > When f2fs_get_valid_checkpoint() fails during mount (e.g. due to an >
 invalid checkpoint CRC on a malformed image), f2fs_fill_super() ta [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kartikey406(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kartikey406(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [74.125.224.54 listed in wl.mailspike.net]
X-Headers-End: 1wbDOk-0003hF-Cq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: initialize ino_entry_info before
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
Cc: stable@kernel.org, syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:stable@kernel.org,m:syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,eec8f2693d71386bd600];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,mail.gmail.com:mid,syzkaller.appspot.com:url,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C24B86AA6F5

T24gU3VuLCBNYXkgMTAsIDIwMjYgYXQgOTo1M+KAr0FNIERlZXBhbnNodSBLYXJ0aWtleQo8a2Fy
dGlrZXk0MDZAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gZjJmc19nZXRfdmFsaWRfY2hlY2tw
b2ludCgpIGZhaWxzIGR1cmluZyBtb3VudCAoZS5nLiBkdWUgdG8gYW4KPiBpbnZhbGlkIGNoZWNr
cG9pbnQgQ1JDIG9uIGEgbWFsZm9ybWVkIGltYWdlKSwgZjJmc19maWxsX3N1cGVyKCkgdGFrZXMK
PiBhbiBlcnJvciBwYXRoIHRoYXQgZXZlbnR1YWxseSBjYWxscyBpcHV0KCkgb24gdGhlIHJvb3Qg
aW5vZGUuIFRoaXMKPiBpbnZva2VzIGYyZnNfZHJvcF9pbm9kZSgpIC0+IGYyZnNfZXhpc3Rfd3Jp
dHRlbl9kYXRhKCksIHdoaWNoIGFjcXVpcmVzCj4gc2JpLT5pbVtdLT5pbm9fbG9jay4gSG93ZXZl
ciwgZjJmc19pbml0X2lub19lbnRyeV9pbmZvKCkgaGFzIG5vdCBydW4KPiB5ZXQgYXQgdGhpcyBw
b2ludCwgc28gdGhlIHNwaW5sb2NrIGlzIHVuaW5pdGlhbGl6ZWQgYW5kIGxvY2tkZXAKPiBjb21w
bGFpbnM6Cj4KPiAgIEYyRlMtZnMgKGxvb3AwKTogaW52YWxpZCBjcmMgdmFsdWUKPiAgIEYyRlMt
ZnMgKGxvb3AwKTogRmFpbGVkIHRvIGdldCB2YWxpZCBGMkZTIGNoZWNrcG9pbnQKPiAgIElORk86
IHRyeWluZyB0byByZWdpc3RlciBub24tc3RhdGljIGtleS4KPiAgIFRoZSBjb2RlIGlzIGZpbmUg
YnV0IG5lZWRzIGxvY2tkZXAgYW5ub3RhdGlvbiwgb3IgbWF5YmUKPiAgIHlvdSBkaWRuJ3QgaW5p
dGlhbGl6ZSB0aGlzIG9iamVjdCBiZWZvcmUgdXNlPwo+ICAgLi4uCj4gICAgZjJmc19leGlzdF93
cml0dGVuX2RhdGErMHg1My8weDkwIGZzL2YyZnMvY2hlY2twb2ludC5jOjc4Nwo+ICAgIGYyZnNf
ZHJvcF9pbm9kZSsweGRhLzB4YmYwIGZzL2YyZnMvc3VwZXIuYzoxODUyCj4gICAgaXB1dCsweDY1
MS8weGU4MCBmcy9pbm9kZS5jOjIwMDkKPiAgICBmMmZzX2ZpbGxfc3VwZXIrMHg2MDQ3LzB4Nzg1
MCBmcy9mMmZzL3N1cGVyLmM6NTQ2MQo+Cj4gTW92ZSBmMmZzX2luaXRfaW5vX2VudHJ5X2luZm8o
KSB0byBiZWZvcmUgZjJmc19nZXRfdmFsaWRfY2hlY2twb2ludCgpCj4gc28gdGhhdCBzYmktPmlt
W10gaXMgYWx3YXlzIGZ1bGx5IGluaXRpYWxpemVkIGJlZm9yZSBhbnkgZXJyb3IgcGF0aAo+IGNh
biB0cmlnZ2VyIGlwdXQoKSAtPiBmMmZzX2Ryb3BfaW5vZGUoKS4gVGhlIGluaXQgZnVuY3Rpb24g
b25seQo+IGRlcGVuZHMgb24gcmF3IHN1cGVyYmxvY2sgZmllbGRzIChCTEtTX1BFUl9TRUcsIEYy
RlNfQ1BfUEFDS1MsCj4gTlJfQ1VSU0VHX1BFUlNJU1RfVFlQRSwgX19jcF9wYXlsb2FkKSwgd2hp
Y2ggYXJlIHBvcHVsYXRlZCB3ZWxsCj4gYmVmb3JlIGNoZWNrcG9pbnQgbG9hZCwgc28gdGhlIG1v
dmUgaXMgc2FmZS4KPgo+IEZpeGVzOiAzMDYzYzgwNzc2ZTMgKCJmMmZzOiBhbm90aGVyIHdheSB0
byBzZXQgbGFyZ2UgZm9saW8gYnkgcmVtZW1iZXJpbmcgaW5vZGUgbnVtYmVyIikKPiBDYzogc3Rh
YmxlQGtlcm5lbC5vcmcKPiBSZXBvcnRlZC1ieTogc3l6Ym90K2VlYzhmMjY5M2Q3MTM4NmJkNjAw
QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL2J1Zz9leHRpZD1lZWM4ZjI2OTNkNzEzODZiZDYwMAo+IFRlc3RlZC1ieTogc3l6
Ym90K2VlYzhmMjY5M2Q3MTM4NmJkNjAwQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBTaWdu
ZWQtb2ZmLWJ5OiBEZWVwYW5zaHUgS2FydGlrZXkgPGthcnRpa2V5NDA2QGdtYWlsLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIEFkZCBGaXhlczogdGFnIChzdWdnZXN0ZWQgYnkgQ2hh
byBZdSkKPiAgLSBBZGQgQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4gLS0tCj4gIGZzL2YyZnMvc3Vw
ZXIuYyB8IDkgKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9z
dXBlci5jCj4gaW5kZXggYzZhZmRiZDZlMWNkLi42YTIzMWE1YjBkNjIgMTAwNjQ0Cj4gLS0tIGEv
ZnMvZjJmcy9zdXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTUxNDAsNiArNTE0
MCwxMyBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNi
LCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9wYWdl
X2FycmF5X2NhY2hlOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogSW5p
dGlhbGl6ZSBpbm8gZW50cnkgaW5mbyBlYXJseSBzbyBmMmZzX2Ryb3BfaW5vZGUgLT4KPiArICAg
ICAgICAqIGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhIGNhbiBzYWZlbHkgdGFrZSBpbS0+aW5vX2xv
Y2sgaWYgbW91bnQKPiArICAgICAgICAqIGZhaWxzIGFmdGVyIHRoaXMgcG9pbnQgYW5kIHRyaWdn
ZXJzIGlwdXQgb24gY2xlYW51cC4KPiArICAgICAgICAqLwo+ICsgICAgICAgZjJmc19pbml0X2lu
b19lbnRyeV9pbmZvKHNiaSk7Cj4gKwo+ICAgICAgICAgZXJyID0gZjJmc19nZXRfdmFsaWRfY2hl
Y2twb2ludChzYmkpOwo+ICAgICAgICAgaWYgKGVycikgewo+ICAgICAgICAgICAgICAgICBmMmZz
X2VycihzYmksICJGYWlsZWQgdG8gZ2V0IHZhbGlkIEYyRlMgY2hlY2twb2ludCIpOwo+IEBAIC01
MTg0LDggKzUxOTEsNiBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4KPiAgICAgICAgIGYyZnNfaW5pdF9l
eHRlbnRfY2FjaGVfaW5mbyhzYmkpOwo+Cj4gLSAgICAgICBmMmZzX2luaXRfaW5vX2VudHJ5X2lu
Zm8oc2JpKTsKPiAtCj4gICAgICAgICBmMmZzX2luaXRfZnN5bmNfbm9kZV9pbmZvKHNiaSk7Cj4K
PiAgICAgICAgIC8qIHNldHVwIGNoZWNrcG9pbnQgcmVxdWVzdCBjb250cm9sIGFuZCBzdGFydCBj
aGVja3BvaW50IGlzc3VlIHRocmVhZCAqLwo+IC0tCj4gMi40My4wCj4KCkhpIENoYW8sCgpQbGVh
c2UgbGV0IG1lIGtub3cgdGhlIHN0YXR1cyBvZiB0aGlzIHBhdGNoLiBUaGlzIGlzIGFscmVhZHkg
IlJldmlld2VkLWJ5OiIgeW91LgoKUGxlYXNlIGxldCBtZSBrbm93IGlmIGFueXRoaW5nIG5lZWRl
ZCBmcm9tIG15IHNpZGUuCgpUaGFua3MKCkRlZXBhbnNodSBLYXJ0aWtleQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
