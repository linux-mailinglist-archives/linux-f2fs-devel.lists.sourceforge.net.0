Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA8A74253
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 03:32:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txzVy-00017s-Vv;
	Fri, 28 Mar 2025 02:32:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1txzVx-00017f-EQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 02:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BIbhRvZjB+RFYfDjdQ1zEMI1vVgmcRuTUrVSTb+/szQ=; b=TstyYcVhd7L3+RExXszUWz+ZfA
 5BNFLYjBrNnghODwLdXoNKC2HDpxGbzgj3bv7IZki+lkRgPGsr71ISFyO8LxNIjMgNQzlCAQg9zSX
 Z19+YNXuLQraDVw3/azILLohnF7EnOa4cWh7z1kPNAoJB0odL1rPhvUz1EXrTXWywYxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BIbhRvZjB+RFYfDjdQ1zEMI1vVgmcRuTUrVSTb+/szQ=; b=DyVXd4tHz89s/BSPaBo5VQfYG2
 mSMAy0uXE2nNBzdT3WSYpaiaJrs/xFCwTZPx20ltEzJ2gDBSDRpvgbeCKytk1TCOWd71ZXe7HxSL8
 uD+1pzBNbt0EjPPKssDxuURl8tAu2xFl13J2YSZY8IPhOdjT/ZOy0AyOS84YGjEAnRXs=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txzVs-00007z-ID for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 02:32:10 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cfe99f2a7so1202295e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Mar 2025 19:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743129113; x=1743733913; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIbhRvZjB+RFYfDjdQ1zEMI1vVgmcRuTUrVSTb+/szQ=;
 b=T4foGHUQvV/g/M0oxqgnrVPRnAepg+vW5WYNdsYcMckBRIK9EUfi56mtFzH4U8L5kG
 CbnhTYu/M2hPMYAI3aMnJv2lMAOTj8ibt7Fk6gMf6V65KSRO4nojZYM1/W17qk1PJSI7
 JsuT+1FfCKBjdTr3W2FXJ9rcX0DOCLBHGQ3VGT/8ZOccvuc7KpCsTRk0ZbReOiaXAB7J
 bxuYczudS4ROMK42TjagMx6pb9tohBFU7wdWygs66T6KALXRaUTGcYojPFmZJ6QO6E/R
 r6LHtgRB2oi0gxvgHXYrp4gqTEaf//a4YY7vNPI4g2Adx/bVMIhV7jb8K1zveFZDq6L7
 BuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743129113; x=1743733913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIbhRvZjB+RFYfDjdQ1zEMI1vVgmcRuTUrVSTb+/szQ=;
 b=XKYkmvxSD5FrBPb4DUnT0jOTO0WXdFBCIL621A1r9Gc9WJoWAMVZLWl7GbrMjhvdZI
 lsAPYzJUgqF9D6hdICEKRWcLVYS5IUrbDFztFWsqYfmZDdu8XB/0TsAz5kBzlK5WRvfT
 WscwPqSWWYT6Oy4mNTzRj/Vtpu7g7WV+v/gr0cZ9QkMvbZE9wL3u4mitNQatjzRAlq3Z
 ZTvKoYMzU8RjrjqEAQfnVSA98bd/WMkRhOZdQGB5jQT6XmXAST/FbEkqkfFCRSkN5nPs
 +R+Y8CHv1b1T4d57EzM6W/Lp482fZWhH1tHjZc8ph2xeas8oJaLhrJIcDVtK5YdFQbJu
 lORQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJuQNYUexhMDs671RDPYft39AhzIYtqNQgifMGKqnijro5qQ89IU/oN55ZmZuMoQkp1iS3H5h4obq0fFQh7K4M@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyMysxzsCmqLwDtb2uRyJlOBiiXj3jxTyePx0BYlWZKRUIUDp6M
 HnbqOBRj1SW4nYF5JWaRqcTJjCJyhucG+P/SoBOCFYoSoR8j8dBGs/xWOImFeOmczjaD19dNPQK
 HzLdH1LMtg1mpxBbzZ286UvA/rXA=
X-Gm-Gg: ASbGnctHGZt0EfjBp71iek9R0edFnWtJBNmlBH+CBalGyk1UbKThXjudu75acZp22HI
 wFQulJ2yAIN+6d3ZywHaBiKDwlc0cp8TxW/gBNCpXa5tfQ9/V0rsC3WB9NY30/OgTYGd0YHuwIF
 Cl/LmvU49IF7NLfxx60q/OG1FfjvI=
X-Google-Smtp-Source: AGHT+IE8QzVAlfTfUekPHL93gEjiZNeb2ZJi1C05uuwOAC1RciktnQWfP1vyP0x+EEI4/+gktAF1fRaxcIFPgMRD+uE=
X-Received: by 2002:a05:6000:1a86:b0:38f:2ef5:ede9 with SMTP id
 ffacd0b85a97d-39c0b5ec5c8mr591544f8f.12.1743129112559; Thu, 27 Mar 2025
 19:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250327055607.3829954-1-chao@kernel.org>
In-Reply-To: <20250327055607.3829954-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 28 Mar 2025 10:31:41 +0800
X-Gm-Features: AQ5f1Jrfrr6XYlIRsZrzxyOK-R7Jzo36qzZK1SU--NLoA-QHUlkQ_GxrZEhaVBY
Message-ID: <CAHJ8P3LWvrJzrFNht7hzDEM3NBXpzDzGnHyKPjKk8rnUTRFQLQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年3月27日周四 13:59写道：
    > > 1. After we start atomic write in a database file, before committing
   > all data, we'd better not set inode w/ vfs dirty stat [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.41 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.41 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1txzVs-00007z-ID
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set atomic write status more
 clear
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQz5pyIMjfml6Xlkajlm5sgMTM6NTnlhpnpgZPvvJoKPgo+
IDEuIEFmdGVyIHdlIHN0YXJ0IGF0b21pYyB3cml0ZSBpbiBhIGRhdGFiYXNlIGZpbGUsIGJlZm9y
ZSBjb21taXR0aW5nCj4gYWxsIGRhdGEsIHdlJ2QgYmV0dGVyIG5vdCBzZXQgaW5vZGUgdy8gdmZz
IGRpcnR5IHN0YXR1cyB0byBhdm9pZAo+IHJlZHVuZGFudCB1cGRhdGVzLCBpbnN0ZWFkLCB3ZSBv
bmx5IHNldCBpbm9kZSB3LyBhdG9taWMgZGlydHkgc3RhdHVzLgo+Cj4gMi4gQWZ0ZXIgd2UgY29t
bWl0IGFsbCBkYXRhLCBiZWZvcmUgY29tbWl0dGluZyBtZXRhZGF0YSwgd2UgbmVlZCB0bwo+IGNs
ZWFyIGF0b21pYyBkaXJ0eSBzdGF0dXMsIGFuZCBzZXQgdmZzIGRpcnR5IHN0YXR1cyB0byBhbGxv
dyB2ZnMgZmx1c2gKPiBkaXJ0eSBpbm9kZS4KPgo+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+IFJlcG9ydGVkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNv
Yy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKSGkgQ2hh
bywKaXQgaXMgbW9yZSBjbGVhciBhbmQgSSB1bmRlcnN0YW5kLCB0aGFua3MgYSBsb3QuClJldmll
d2VkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gLS0tCj4gIGZzL2Yy
ZnMvaW5vZGUuYyAgIHwgNCArKystCj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgNiArKysrKysKPiAg
ZnMvZjJmcy9zdXBlci5jICAgfCA0ICsrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBi
L2ZzL2YyZnMvaW5vZGUuYwo+IGluZGV4IDVjODYzNGVhZWY3Yi4uZjU5OTFlODc1MWI5IDEwMDY0
NAo+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+IEBAIC0z
NCw3ICszNCw5IEBAIHZvaWQgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoc3RydWN0IGlub2Rl
ICppbm9kZSwgYm9vbCBzeW5jKQo+ICAgICAgICAgaWYgKGYyZnNfaW5vZGVfZGlydGllZChpbm9k
ZSwgc3luYykpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+IC0gICAgICAgaWYgKGYyZnNf
aXNfYXRvbWljX2ZpbGUoaW5vZGUpKQo+ICsgICAgICAgLyogb25seSBhdG9taWMgZmlsZSB3LyBG
SV9BVE9NSUNfQ09NTUlUVEVEIGNhbiBiZSBzZXQgdmZzIGRpcnR5ICovCj4gKyAgICAgICBpZiAo
ZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkgJiYKPiArICAgICAgICAgICAgICAgICAgICAgICAh
aXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm47Cj4KPiAgICAgICAgIG1hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSk7
Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBp
bmRleCBkYzM2MGI0YjA1NjkuLjdjMTEzYjQ0NmY2MyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3Nl
Z21lbnQuYwo+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gQEAgLTM3Niw3ICszNzYsMTMgQEAg
c3RhdGljIGludCBfX2YyZnNfY29tbWl0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2Rl
KQo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgc2JpLT5jb21taXR0ZWRfYXRv
bWljX2Jsb2NrICs9IGZpLT5hdG9taWNfd3JpdGVfY250Owo+ICAgICAgICAgICAgICAgICBzZXRf
aW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4gKwo+ICsgICAgICAgICAg
ICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBpbm9kZSBtYXkgaGFzIG5vIEZJX0FUT01JQ19E
SVJUSUVEIGZsYWcgZHVlIHRvIG5vIHdyaXRlCj4gKyAgICAgICAgICAgICAgICAqIGJlZm9yZSBj
b21taXQuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAgICBpZiAoaXNfaW5v
ZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIC8qIGNsZWFyIGF0b21pYyBkaXJ0eSBzdGF0dXMgYW5kIHNldCB2ZnMgZGlydHkg
c3RhdHVzICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9k
ZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfbWFy
a19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPiAgICAgICAgICAgICAgICAgfQo+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiBpbmRleCA5YTQy
YTEzMjNmNDIuLmE1Y2M5ZjZlZTE2YSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiAr
KysgYi9mcy9mMmZzL3N1cGVyLmMKPiBAQCAtMTUzMiw3ICsxNTMyLDkgQEAgaW50IGYyZnNfaW5v
ZGVfZGlydGllZChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29sIHN5bmMpCj4gICAgICAgICB9Cj4g
ICAgICAgICBzcGluX3VubG9jaygmc2JpLT5pbm9kZV9sb2NrW0RJUlRZX01FVEFdKTsKPgo+IC0g
ICAgICAgaWYgKCFyZXQgJiYgZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpCj4gKyAgICAgICAv
KiBpZiBhdG9taWMgd3JpdGUgaXMgbm90IGNvbW1pdHRlZCwgc2V0IGlub2RlIHcvIGF0b21pYyBk
aXJ0eSAqLwo+ICsgICAgICAgaWYgKCFyZXQgJiYgZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkg
JiYKPiArICAgICAgICAgICAgICAgICAgICAgICAhaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJ
X0FUT01JQ19DT01NSVRURUQpKQo+ICAgICAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9k
ZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi40
OS4wCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
