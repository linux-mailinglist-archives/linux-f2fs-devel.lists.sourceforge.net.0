Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3396AA87528
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 03:07:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u48I3-00046k-Lz;
	Mon, 14 Apr 2025 01:07:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1u48I2-00046d-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 01:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aM+qkOKFn9m1WW0pYdIeIZioh7YCppARd+sUbzRK+u8=; b=Avl/8IYqzsxLWNiY58nqSUU9Nw
 qHg8AnWKHU4tF92AffDlpAEL1Hnm5S6m3g1uqPC70AfSkPJyS+q+Gq0oprmG9ikUdlG8KqWnsUGUW
 Rpl0uAURYbcj3vNnoy8B1FulAnKFrpKpfss5yzE9TfRxVGRIh85M13dA/zHR5mIiabdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aM+qkOKFn9m1WW0pYdIeIZioh7YCppARd+sUbzRK+u8=; b=Kf/+3AV1MfAC8Qyazk6MpidgoV
 RuvKtDfLZEG/Vh9SXitmLjX+UXDtAbiZkSaUWtRbPERBpLc+TufI980SsJ5ZmZ8speTcXjmwPU70a
 74dUQl4GZtpmBsr7S7BMRwJGKl8fRlYgGduC2Ff79yOlbOB9Jt75WCCB0TMvUSp3RSq4=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u48Hm-0005Ss-Ui for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 01:07:10 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf7c2c351so3778255e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 13 Apr 2025 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744592803; x=1745197603; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aM+qkOKFn9m1WW0pYdIeIZioh7YCppARd+sUbzRK+u8=;
 b=JMqpak2QOCKDTNIYN2MSkX7LKowXV1Fv4KoCEBLh1gvrV25bmCVxF+n9U0FOGZlbUw
 prHan+3f9MwKx4ffhRPAEYAxFkklWuzjxDCjGLbx/WHCqkEW0gh8cNzr8svaw/nXY+Ye
 8YvrA+VzJdB2XoxopoCrrYGXxcWvxwaN50AoGvZnppJVPJlnQ89Fb/JMgapg0TqpGrsd
 exnqghlCV4dQyxlXrq8ZCVyJBPH3GFznRmzjquqtxyY0r1MhTnqnzryTskjJfyHrjo5m
 l/LtjyROJwqSberNBKKY9N+SY7VaAa08Li1ca96pgV0HFuXdAbZl9ped/GbY9pUIcVJk
 hcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744592803; x=1745197603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aM+qkOKFn9m1WW0pYdIeIZioh7YCppARd+sUbzRK+u8=;
 b=UoTz1YJ/+0ZGLNIIWBMOk0CL8gXR0EQ538VP2mBE1lScC+CGlLqK/tL7z7qQzSYa4X
 KxfYnoeIk/5JJOxEB7yp0I/OxFT19AH+WIkmQwrMS6eg7T8fwjY0MblG4TNy/BztGBZm
 ERdUWptBUTBBZC5t+a2VnoIjApbfc5rs3pGveiUXU5hBeddfEmpViG75Nxvo43rrcwj2
 2U8zKH+te5Mb3MIjAE35d9+Ny7HF1I6eBNhiZDDRNZ5blCzPZDmmaGqaP2B2tyGcayx5
 NOyYB7u+ru6ew2YD4hS+xkQ+Xh5+QaVtMl6oU3TXhDeTkOrKJKQrjjBsoaaWB+sT2Mdd
 1hxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV9OF0di5vs9nEMvjwf6r1WanaxZmSwX0FqcEL81EiIqCdgUN97MIXwp4zAENfn0FSYBaYkgm0BbYGMssdRRp9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyiiJoyf/mgvRpGBk2p2VoAoPG5tIu9dGffWqhYxTeJBtCTgBow
 rgJHWwIYfAS9FhBSHaI3jZw7p40DhFWqCixjI5ZhMWdyrLDB5XE+vNegA9wpbVmP5xDP+5KYdwf
 THuORQ7w6OOQS/UjTcM7CigVwmyw=
X-Gm-Gg: ASbGnctudkkOWIR/gtFFp8hdqxFv5R5XXjOMocmlSjr84CpK3+YrjlCqOjnGl4eX2pF
 AqU/3HHdwyRIFj+u2D8xETfyv+Dk11Ene6nJc5wYXSzDzdPnq1uEcPy1QFS1HCo9I7f9neRtHAC
 Gl0IjmD2SMCbjooigKtlikjEY=
X-Google-Smtp-Source: AGHT+IEau7VLjYPkYjfPWv+erEtc5Y78aHeXL+gKN2tcwP6aLna9fdO6tQyY+JL1Sx/jkSaUvhKP1g/LjxMnqljBTtw=
X-Received: by 2002:a05:6000:420d:b0:391:2a9a:47a6 with SMTP id
 ffacd0b85a97d-39ec22e9df0mr2857752f8f.4.1744592802819; Sun, 13 Apr 2025
 18:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250407020727.1810288-1-chao@kernel.org>
 <CAHJ8P3+p9ExSyCxhBT0EUsVD15-v==4rhyQ8nXYXWwMEBEKvFA@mail.gmail.com>
 <895fb0f9-244d-4251-afb5-6ad9fef28d7a@kernel.org>
In-Reply-To: <895fb0f9-244d-4251-afb5-6ad9fef28d7a@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 14 Apr 2025 09:06:31 +0800
X-Gm-Features: ATxdqUGkiOiOouXplDnldLwTpa0151uC3aiqfYGM5lvuS_ClDSyyTO4sh9ywn5Q
Message-ID: <CAHJ8P3JZ5=xTht342fFFWL8qJv1xmzZ=RrsDS+QtbD=mUkkENw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年4月11日周五 18:32写道： > > On 2025/4/11
    10:07, Zhiguo Niu wrote: > > Chao Yu via Linux-f2fs-devel > > 于2025年4月7日周一
    10:11写道： > >> > >> Support a new opti [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.44 listed in sa-accredit.habeas.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.44 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1u48Hm-0005Ss-Ui
Subject: Re: [f2fs-dev] [PATCH v2 3/3] fsck.f2fs: support to tune linear
 lookup feature
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NOaciDEx5pel5ZGo5LqUIDE4OjMy
5YaZ6YGT77yaCj4KPiBPbiAyMDI1LzQvMTEgMTA6MDcsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldD4KPiA+IOS6jjIwMjXlubQ05pyIN+aXpeWRqOS4gCAxMDoxMeWGmemBk++8mgo+
ID4+Cj4gPj4gU3VwcG9ydCBhIG5ldyBvcHRpb24gLS1ub2xpbmVhci1sb29rdXA9WCBmb3IgZnNj
ay5mMmZzIHRvIHR1bmUKPiA+PiBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIGNvbmRpdGlvbmFsbHks
IFg9MTogZGlzYWJsZSBsaW5lYXIgbG9va3VwLAo+ID4+IFg9MDogZW5hYmxlIGxpbmVhciBsb29r
dXAuCj4gPj4KPiA+PiBUaGlzIGNhbiBoZWxwIHRvIDEpIGFkZCBhIHJlZ3Jlc3Npb24gdGVzdGNh
c2UgdG8gY2hlY2sga2VybmVsCj4gPj4gd2hldGhlciBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIGhh
cyBmaXhlZCB1bmljb2RlIHJlZCBoZWFydCBsb29rdXAKPiA+PiBpc3N1ZSwgMikgb25jZSB1bmlj
b2RlIGJ1ZyBoYXMgYmVlbiBmaXhlZCwgd2UgY2FuIHVzZSB0aGlzIG9wdGlvbgo+ID4+IHRvIGRp
c2FibGUgbGluZWFyIGxvb2t1cCBmb3IgcGVyZm9ybWFuY2UgcmVjb3ZlcnkuCj4gPj4KPiA+PiBD
YzogRGFuaWVsIExlZSA8Y2h1bGxlZUBnb29nbGUuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+PiAtLS0KPiA+PiB2MjoKPiA+PiAtIGFkZCBkZXNj
cmlwdGlvbiBpbiBmc2NrIG1hbnVhbAo+ID4+ICAgZnNjay9mc2NrLmMgICAgICAgfCAyNiArKysr
KysrKysrKysrKysrKysrKysrKysrLQo+ID4+ICAgZnNjay9mc2NrLmggICAgICAgfCAgMSArCj4g
Pj4gICBmc2NrL21haW4uYyAgICAgICB8IDEwICsrKysrKysrKysKPiA+PiAgIGluY2x1ZGUvZjJm
c19mcy5oIHwgIDggKysrKysrLS0KPiA+PiAgIG1hbi9mc2NrLmYyZnMuOCAgIHwgIDMgKysrCj4g
Pj4gICA1IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnNjay9mc2NrLmMgYi9mc2NrL2ZzY2suYwo+ID4+IGluZGV4
IDgxNTVjYmQuLjA1OWJhNjEgMTAwNjQ0Cj4gPj4gLS0tIGEvZnNjay9mc2NrLmMKPiA+PiArKysg
Yi9mc2NrL2ZzY2suYwo+ID4+IEBAIC0yMzU3LDYgKzIzNTcsMzAgQEAgaW50IGZzY2tfY2hrX3F1
b3RhX2ZpbGVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+PiAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4+ICAgfQo+ID4+Cj4gPj4gK3ZvaWQgZnNja191cGRhdGVfc2JfZmxhZ3Moc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4+ICt7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgZjJmc19zdXBl
cl9ibG9jayAqc2IgPSBGMkZTX1JBV19TVVBFUihzYmkpOwo+ID4+ICsgICAgICAgdTE2IGZsYWdz
ID0gZ2V0X3NiKHNfZW5jb2RpbmdfZmxhZ3MpOwo+ID4+ICsKPiA+PiArICAgICAgIGlmIChjLm5v
bGluZWFyX2xvb2t1cCkgewo+ID4+ICsgICAgICAgICAgICAgICBpZiAoIShmbGFncyAmIEYyRlNf
RU5DX05PX0NPTVBBVF9GQUxMQkFDS19GTCkpIHsKPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICBmbGFncyB8PSBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkw7Cj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgc2V0X3NiKHNfZW5jb2RpbmdfZmxhZ3MsIGZsYWdzKTsKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICBjLmZpeF9vbiA9IDE7Cj4gPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYy5pbnZhbGlkX3NiIHw9IFNCX0VOQ09ERV9GTEFHOwo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIERCRygwLCAiQ2FzZWZvbGQ6IGVuYWJsZSBub2xpbmVhciBsb29rdXBcbiIpOwo+
ID4+ICsgICAgICAgICAgICAgICB9Cj4gPj4gKyAgICAgICB9IGVsc2Ugewo+ID4+ICsgICAgICAg
ICAgICAgICBpZiAoZmxhZ3MgJiBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwpIHsKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICBmbGFncyAmPSB+RjJGU19FTkNfTk9fQ09NUEFUX0ZB
TExCQUNLX0ZMOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHNldF9zYihzX2VuY29kaW5n
X2ZsYWdzLCBmbGFncyk7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYy5maXhfb24gPSAx
Owo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGMuaW52YWxpZF9zYiB8PSBTQl9FTkNPREVf
RkxBRzsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBEQkcoMCwgIkNhc2Vmb2xkOiBkaXNh
YmxlIG5vbGluZWFyIGxvb2t1cFxuIik7Cj4gPj4gKyAgICAgICAgICAgICAgIH0KPiA+PiArICAg
ICAgIH0KPiA+PiArfQo+ID4+ICsKPiA+PiAgIGludCBmc2NrX2Noa19tZXRhKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSkKPiA+PiAgIHsKPiA+PiAgICAgICAgICBzdHJ1Y3QgZjJmc19mc2NrICpm
c2NrID0gRjJGU19GU0NLKHNiaSk7Cj4gPj4gQEAgLTM3NzAsNyArMzc5NCw3IEBAIGludCBmc2Nr
X3ZlcmlmeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPj4gICAgICAgICAgICAgICAgICBp
ZiAoYy5pbnZhbGlkX3NiICYgU0JfRlNfRVJST1JTKQo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBtZW1zZXQoc2ItPnNfZXJyb3JzLCAwLCBNQVhfRjJGU19FUlJPUlMpOwo+ID4+Cj4gPj4g
LSAgICAgICAgICAgICAgIGlmIChjLmludmFsaWRfc2IgJiBTQl9ORUVEX0ZJWCkKPiA+PiArICAg
ICAgICAgICAgICAgaWYgKGMuaW52YWxpZF9zYiAmIChTQl9ORUVEX0ZJWCB8IFNCX0VOQ09ERV9G
TEFHKSkKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdXBkYXRlX3N1cGVyYmxvY2soc2Is
IFNCX01BU0tfQUxMKTsKPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICAgLyogdG8gcmV0dXJuIEZT
Q0tfRVJST1JfQ09SUkVDVEVEICovCj4gPj4gZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5oIGIvZnNj
ay9mc2NrLmgKPiA+PiBpbmRleCBiNTgxZDNlLi40MGNiNmQ5IDEwMDY0NAo+ID4+IC0tLSBhL2Zz
Y2svZnNjay5oCj4gPj4gKysrIGIvZnNjay9mc2NrLmgKPiA+PiBAQCAtMTg4LDYgKzE4OCw3IEBA
IGV4dGVybiBpbnQgZnNja19jaGtfZGVudHJ5X2JsayhzdHJ1Y3QgZjJmc19zYl9pbmZvICosIGlu
dCwKPiA+PiAgIGludCBmc2NrX2Noa19pbmxpbmVfZGVudHJpZXMoc3RydWN0IGYyZnNfc2JfaW5m
byAqLCBzdHJ1Y3QgZjJmc19ub2RlICosCj4gPj4gICAgICAgICAgICAgICAgICBzdHJ1Y3QgY2hp
bGRfaW5mbyAqKTsKPiA+PiAgIHZvaWQgZnNja19jaGtfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpOwo+ID4+ICt2b2lkIGZzY2tfdXBkYXRlX3NiX2ZsYWdzKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSk7Cj4gPj4gICBpbnQgZnNja19jaGtfbWV0YShzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpOwo+ID4+ICAgdm9pZCBmc2NrX2Noa19hbmRfZml4X3dyaXRlX3BvaW50ZXJzKHN0
cnVjdCBmMmZzX3NiX2luZm8gKik7Cj4gPj4gICBpbnQgZnNja19jaGtfY3Vyc2VnX2luZm8oc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqKTsKPiA+PiBkaWZmIC0tZ2l0IGEvZnNjay9tYWluLmMgYi9mc2Nr
L21haW4uYwo+ID4+IGluZGV4IDQ3YmE2YzkuLjUyNGRiYjEgMTAwNjQ0Cj4gPj4gLS0tIGEvZnNj
ay9tYWluLmMKPiA+PiArKysgYi9mc2NrL21haW4uYwo+ID4+IEBAIC05MSw2ICs5MSw3IEBAIHZv
aWQgZnNja191c2FnZSgpCj4gPj4gICAgICAgICAgTVNHKDAsICIgIC0tbm8ta2VybmVsLWNoZWNr
IHNraXBzIGRldGVjdGluZyBrZXJuZWwgY2hhbmdlXG4iKTsKPiA+PiAgICAgICAgICBNU0coMCwg
IiAgLS1rZXJuZWwtY2hlY2sgY2hlY2tzIGtlcm5lbCBjaGFuZ2VcbiIpOwo+ID4+ICAgICAgICAg
IE1TRygwLCAiICAtLWRlYnVnLWNhY2hlIHRvIGRlYnVnIGNhY2hlIHdoZW4gLWMgaXMgdXNlZFxu
Iik7Cj4gPj4gKyAgICAgICBNU0coMCwgIiAgLS1ub2xpbmVhci1sb29rdXA9WCBYPTE6IGRpc2Fi
bGUgbGluZWFyIGxvb2t1cCwgWD0wOiBlbmFibGUgbGluZWFyIGxvb2t1cFxuIik7Cj4gPj4gICAg
ICAgICAgZXhpdCgxKTsKPiA+PiAgIH0KPiA+Pgo+ID4+IEBAIC0yNjMsNiArMjY0LDcgQEAgdm9p
ZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiA+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgeyJuby1rZXJuZWwtY2hlY2siLCBub19hcmd1bWVudCwgMCwgMn0s
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHsia2VybmVsLWNoZWNrIiwgbm9fYXJndW1l
bnQsIDAsIDN9LAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICB7ImRlYnVnLWNhY2hlIiwg
bm9fYXJndW1lbnQsIDAsIDR9LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIHsibm9saW5l
YXItbG9va3VwIiwgcmVxdWlyZWRfYXJndW1lbnQsIDAsIDV9LAo+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICB7MCwgMCwgMCwgMH0KPiA+PiAgICAgICAgICAgICAgICAgIH07Cj4gPj4KPiA+
PiBAQCAtMjg3LDYgKzI4OSwxMiBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywg
Y2hhciAqYXJndltdKQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlIDQ6Cj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5jYWNoZV9jb25maWcuZGJnX2VuID0g
dHJ1ZTsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBjYXNlIDU6Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoIW9wdGFyZyB8fCAhc3RyY21wKG9wdGFyZywgIjAiKSkKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5ub2xpbmVhcl9sb29rdXAgPSAw
Owo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLm5vbGluZWFyX2xvb2t1cCA9IDE7Cj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+IEhpIENoYW8KPiA+
IEkgYWxzbyBlbmNvdW50ZXJlZCB0aGUgc2FtZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHByb2Js
ZW0gaW4gQW5kcm9pZAo+ID4gZGV2aWNlIGFzIGtlcm5lbCBjb21taXQKPiA+IDUxZGM0OTFhMDg1
NSgiZjJmczogc3VwcG9ydCB0byBkaXNhYmxlIGxpbmVhciBsb29rdXAgZmFsbGJhY2siKSBzaG93
bi4KPiA+Cj4gPiBzbyBiZWNhdXNlIHdlIGFsc28gbmVlZCB0byB1cGRhdGUgdGhpcyBjb21taXQg
YWJvdXQgZnNjayB0byBhdm9pZAo+ID4gcGVyZm9ybWFuY2UgcmVncmVzc2lvbnMuCj4gPiBJcyBp
dCBhcHByb3ByaWF0ZSB0byBzZXQgdGhpcyBwYXJhbWV0ZXIgIGRpc2FibGUgbGluZWFyX2xvb2t1
cCBieQo+ID4gZGVmYXVsdCDvvIhjLm5vbGluZWFyX2xvb2t1cCA9IDHvvIk/Cj4gPiBUaGlzIGFs
c28gZml0cyBtb3N0IG9mIHRoZSBzY2VuYXJpb3MuCj4gPiBJZiBvdGhlciB1c2VycyB3YW50IHRv
IGVuYWJsZSB0aGlzIGZlYXR1cmUsIHRoZXkgY2FuIGNvbnRyb2wgaXQKPiA+IHRocm91Z2ggcGFy
YW1ldGVycy4KPgo+IFpoaWd1bywKPgo+IFRoZXJlIGFyZSB0d28gY29uZGl0aW9ucyB1c2VyIHdp
bGwgbG9zdCB0aGVpciBmaWxlIHdoaWNoIGhhcyBzcGVjaWZpZWQKPiBjaGFyYWN0b3JzLCBsaWtl
IHJlZCBoZWFydCDinaTvuI8uCj4KPiBjYXNlICMxCj4gLSBjcmVhdGUgZmlsZSBuYW1lZCByZWRf
aGVhcnQg4p2k77iPCj4gLSBhcHBseSA1YzI2ZDJmMWQzZjUgKCJ1bmljb2RlOiBEb24ndCBzcGVj
aWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9pbnRzIikKPiAtIHN0YXQgcmVkX2hlYXJ0IOKdpO+4
jyAtLT4gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Cj4gY2FzZSAjMgo+IC0gYXBwbHkgNWMy
NmQyZjFkM2Y1ICgidW5pY29kZTogRG9uJ3Qgc3BlY2lhbCBjYXNlIGlnbm9yYWJsZSBjb2RlIHBv
aW50cyIpCj4gLSBjcmVhdGUgZmlsZSBuYW1lZCByZWRfaGVhcnQg4p2k77iPCj4gLSByZXZlcnQg
NWMyNmQyZjFkM2Y1ICgidW5pY29kZTogRG9uJ3Qgc3BlY2lhbCBjYXNlIGlnbm9yYWJsZSBjb2Rl
IHBvaW50cyIpCj4gLSBzdGF0IHJlZF9oZWFydCDinaTvuI8gLS0+IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKPgo+IElmIHlvdSBkb2VzIG5vdCBtYXRjaGVkIGFueSBvZiBhYm92ZSBjYXNlcywg
SSBndWVzcyBpdCdzIGZpbmUgZm9yIHlvdSB0bwo+IGRpc2FibGUgbGluZWFyIGZhbGxiYWNrLgpI
aSBDaGFvLApZZXMsIEkgZGlkIG5vdCBlbmNvdW50ZXIgYW55IG9mIGFib3ZlIGNhc2VzLiBUaGFu
ayB5b3UgZm9yIHlvdXIKZGV0YWlsZWQgZXhwbGFuYXRpb24KPgo+IEkgcHJlZmVyIHRvIHdhaXQg
Zm9yIHRoZSBmb3JtYWwgZml4IGZvciBzcGVjaWZpZWQgdW5pY29kZSBjaGFyYWN0b3IKPiBoYW5k
bGluZywgYW5kIHRoZW4gZGlzYWJsZSBsaW5lYXIgZmFsbGJhY2ssIGFzIEkgZG9uJ3Qga25vdyB0
aGUgY29uZGl0aW9uCj4gb2Ygb3VyIHVzZXIuCkdvdCBpdC4gdGhhbmtzIQo+Cj4gPiB0aGFua3Mh
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2EnOgo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGMuYXV0b19maXggPSAxOwo+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogQXV0b21hdGljIGZpeCBtb2RlIGVuYWJs
ZWQuXG4iKTsKPiA+PiBAQCAtOTkwLDYgKzk5OCw4IEBAIHN0YXRpYyBpbnQgZG9fZnNjayhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNf
RlRfRElSLCBUWVBFX0lOT0RFLCAmYmxrX2NudCwgJmNiYywgJmNoaWxkKTsKPiA+PiAgICAgICAg
ICBmc2NrX2Noa19xdW90YV9maWxlcyhzYmkpOwo+ID4+Cj4gPj4gKyAgICAgICBmc2NrX3VwZGF0
ZV9zYl9mbGFncyhzYmkpOwo+ID4+ICsKPiA+PiAgICAgICAgICByZXQgPSBmc2NrX3ZlcmlmeShz
YmkpOwo+ID4+ICAgICAgICAgIGZzY2tfZnJlZShzYmkpOwo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+PiBpbmRleCBmMjA2OTk0
Li43ZTNmMjViIDEwMDY0NAo+ID4+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5oCj4gPj4gKysrIGIv
aW5jbHVkZS9mMmZzX2ZzLmgKPiA+PiBAQCAtNjgyLDcgKzY4Miw4IEBAIGVudW0gewo+ID4+ICAg
I2RlZmluZSBJU19ERVZJQ0VfQUxJQVNJTkcoZmkpICgoZmkpLT5pX2ZsYWdzICYgY3B1X3RvX2xl
MzIoRjJGU19ERVZJQ0VfQUxJQVNfRkwpKQo+ID4+Cj4gPj4gICAjZGVmaW5lIEYyRlNfRU5DX1VU
RjhfMTJfMSAgICAgMQo+ID4+IC0jZGVmaW5lIEYyRlNfRU5DX1NUUklDVF9NT0RFX0ZMICAgICAg
ICAoMSA8PCAwKQo+ID4+ICsjZGVmaW5lIEYyRlNfRU5DX1NUUklDVF9NT0RFX0ZMICAgICAgICAg
ICAgICAgICgxIDw8IDApCj4gPj4gKyNkZWZpbmUgRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNL
X0ZMICgxIDw8IDEpCj4gPj4KPiA+PiAgIC8qIFRoaXMgZmxhZyBpcyB1c2VkIGJ5IG5vZGUgYW5k
IG1ldGEgaW5vZGVzLCBhbmQgYnkgcmVjb3ZlcnkgKi8KPiA+PiAgICNkZWZpbmUgR0ZQX0YyRlNf
WkVSTyAgKEdGUF9OT0ZTIHwgX19HRlBfWkVSTykKPiA+PiBAQCAtMTQ2Nyw3ICsxNDY4LDkgQEAg
ZW51bSB7Cj4gPj4gICAjZGVmaW5lIFNCX0FCTk9STUFMX1NUT1AgICAgICAgMHgyICAgICAvKiBz
X3N0b3BfcmVhc29uIGlzIHNldCBleGNlcHQgc2h1dGRvd24gKi8KPiA+PiAgICNkZWZpbmUgU0Jf
RlNfRVJST1JTICAgICAgICAgICAweDQgICAgIC8qIHNfZXJyb3MgaXMgc2V0ICovCj4gPj4gICAj
ZGVmaW5lIFNCX0lOVkFMSUQgICAgICAgICAgICAgMHg4ICAgICAvKiBzYiBpcyBpbnZhbGlkICov
Cj4gPj4gLSNkZWZpbmUgU0JfTkVFRF9GSVggKFNCX0FCTk9STUFMX1NUT1AgfCBTQl9GU19FUlJP
UlMgfCBTQl9JTlZBTElEKQo+ID4+ICsjZGVmaW5lIFNCX0VOQ09ERV9GTEFHICAgICAgICAgMHgx
NiAgICAvKiBlbmNvZGVfZmxhZyAqLwo+ID4+ICsjZGVmaW5lIFNCX05FRURfRklYICAgICAgICAg
ICAgKFNCX0FCTk9STUFMX1NUT1AgfCBTQl9GU19FUlJPUlMgfCAgICAgIFwKPiA+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFNCX0lOVkFMSUQgfCBTQl9FTkNPREVfRkxBRykKPiA+
Pgo+ID4+ICAgI2RlZmluZSBNQVhfQ0FDSEVfU1VNUyAgICAgICAgICAgICAgICAgOAo+ID4+Cj4g
Pj4gQEAgLTE1NDEsNiArMTU0NCw3IEBAIHN0cnVjdCBmMmZzX2NvbmZpZ3VyYXRpb24gewo+ID4+
ICAgICAgICAgIGludCBwcmVzZXJ2ZV9saW1pdHM7ICAgICAgICAgICAgLyogcHJlc2VydmUgcXVv
dGEgbGltaXRzICovCj4gPj4gICAgICAgICAgaW50IGxhcmdlX25hdF9iaXRtYXA7Cj4gPj4gICAg
ICAgICAgaW50IGZpeF9jaGtzdW07ICAgICAgICAgICAgICAgICAvKiBmaXggb2xkIGNwLmNoa3N1
bSBwb3NpdGlvbiAqLwo+ID4+ICsgICAgICAgaW50IG5vbGluZWFyX2xvb2t1cDsgICAgICAgICAg
ICAvKiBkaXNhYmxlIGxpbmVhciBsb29rdXAgKi8KPiA+PiAgICAgICAgICB1bnNpZ25lZCBpbnQg
ZmVhdHVyZTsgICAgICAgICAgICAgICAgICAgLyogZGVmaW5lZCBmZWF0dXJlcyAqLwo+ID4+ICAg
ICAgICAgIHVuc2lnbmVkIGludCBkaXNhYmxlZF9mZWF0dXJlOyAgLyogZGlzYWJsZWQgZmVhdHVy
ZSwgdXNlZCBmb3IgQW5kcm9pZCBvbmx5ICovCj4gPj4gICAgICAgICAgdW5zaWduZWQgaW50IHF1
b3RhX2JpdHM7ICAgICAgICAvKiBxdW90YSBiaXRzICovCj4gPj4gZGlmZiAtLWdpdCBhL21hbi9m
c2NrLmYyZnMuOCBiL21hbi9mc2NrLmYyZnMuOAo+ID4+IGluZGV4IGUzOWE4NDYuLjYwNmUyODgg
MTAwNjQ0Cj4gPj4gLS0tIGEvbWFuL2ZzY2suZjJmcy44Cj4gPj4gKysrIGIvbWFuL2ZzY2suZjJm
cy44Cj4gPj4gQEAgLTY3LDYgKzY3LDkgQEAgRW5hYmxlIHRvIHNob3cgZXZlcnkgZGlyZWN0b3J5
IGVudHJpZXMgaW4gdGhlIHBhcnRpdGlvbi4KPiA+PiAgIFNwZWNpZnkgdGhlIGxldmVsIG9mIGRl
YnVnZ2luZyBvcHRpb25zLgo+ID4+ICAgVGhlIGRlZmF1bHQgbnVtYmVyIGlzIDAsIHdoaWNoIHNo
b3dzIGJhc2ljIGRlYnVnZ2luZyBtZXNzYWdlcy4KPiA+PiAgIC5UUAo+ID4+ICsuQkkgXC0tbm9s
aW5lYXItbG9va3VwCj4gPj4gK1R1bmUgbGluZWFyIGxvb2t1cCBmYWxsYmFjaywgbXVzdCBzcGVj
aWZ5IGFuIGFyZ3VtZW50LCAwOiBlbmFibGUgbGluZWFyIGxvb2t1cCwgMTogZGlzYWJsZSBsaW5l
YXIgbG9va3VwLgo+ID4+ICsuVFAKPiA+PiAgIC5TSCBBVVRIT1IKPiA+PiAgIEluaXRpYWwgY2hl
Y2tpbmcgY29kZSB3YXMgd3JpdHRlbiBieSBCeW91bmcgR2V1biBLaW0gPGJnYmcua2ltQHNhbXN1
bmcuY29tPi4KPiA+PiAgIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IHJld29ya2Vk
IG1vc3QgcGFydHMgb2YgdGhlIGNvZGVzIHRvIHN1cHBvcnQKPiA+PiAtLQo+ID4+IDIuNDkuMAo+
ID4+Cj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
