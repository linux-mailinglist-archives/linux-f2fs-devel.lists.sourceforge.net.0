Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CFCC9FBD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Dec 2025 02:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuqccnwZpqkArpushKnFPW7GjYNJ7XPHfPYLPleOgLA=; b=nEWl2wApP6ftLvHDe65A4EhYkc
	7m9IO638BNwKo/kFUJsBC5uNgbatjSZp7ydMrU7xFctjTmIDnPbJ3bSQwW38I5jk19ozeeRjFFHJK
	lFVTsZF98rWFH8bwfHUjKNEIEUgfTjBgGAzNbqdtcBM2UarzclsTEx4DAl5ySHRxaL1k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vW2qw-0006Ia-LT;
	Thu, 18 Dec 2025 01:30:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1vW2qv-0006IU-5T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Dec 2025 01:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gl+YCH8ZXJWAOOR1Xfpf9/FZBPdmuYYdhdmNdcmF86A=; b=jChD8+fFGITnnLA72hC21loamS
 1EjJiTwYJqjors9Vs8PY4obSK9Elpmg+Kwp1KmRMVnzfrgGDVCRaJu0ZOGs1PU2y0t5O56BomAHnL
 97kVT/yDsSacp9SB+taWLdUzXuOZxl307Io86EFamifLPN5Ahmpwb1x8tVbAR2rCmzHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gl+YCH8ZXJWAOOR1Xfpf9/FZBPdmuYYdhdmNdcmF86A=; b=IFMEr5Vw6D93U7V5Scebt97H4Q
 oaWZXE64Bd3p2DJIZ/afEICFtAMMV/MttNaELwvhXa8ZyvKn7nTaWB49PhBB3Xx0XgrrLbGLpwhUH
 0QaCzy5VjvvsWK0YQkJzs1J/IYXA/0LiN6np+M3hBWWmQlWWjvNdEcCHEuger/BlmhjU=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vW2qu-0002JC-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Dec 2025 01:30:49 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477aa91e75dso124485e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Dec 2025 17:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766021437; x=1766626237; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gl+YCH8ZXJWAOOR1Xfpf9/FZBPdmuYYdhdmNdcmF86A=;
 b=fnhh5Rm7a9rVwfCpKDy+oyWwa1q8gvzqrZelapizX2BehZzFf/i7eygJd29lmnxLvE
 90oDGseJ3QbR28ZYQ9eSveU5B5JtCrZV4LAczwOYGWOSQ+FKyoXoxbrZFtjh11VlF59V
 MUYiyXw/ad3ARVfvMBNfHVChXph8bJRKPBPXl1FiJ56UpAPzxAwp0dW6qr/x+9KW1S4s
 JgYITMmwTfWpCCPhA+JbJBrfYWMLNDFXgXEj5tQlGhwuN0LhPFxAbHlA1mt7hjFJCbSY
 npDq4uBArIb7JhC123ZMlR6mzHT6gg8g/DuvB6uoSNoLDRW7H9lE3ny3yNgEW4kVqYsd
 oQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766021437; x=1766626237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gl+YCH8ZXJWAOOR1Xfpf9/FZBPdmuYYdhdmNdcmF86A=;
 b=VQOC2QvXrHe47/krt+7sxhnpznmZl0XKTlHKcR73I9JKIr43FLIXvzrQIahaM/YLPo
 QXOfDKivRgZw4PfB4l5HoaIgmRP9S6h86W6Zzb/0yyHO0c9EONw78RKnszTEhS6rSh69
 XqxcyqpJcPcoQ5x9y6NGlis6PtmTcl8wRiGCzpnNI5HK8l1qL8RGhr/VzMsu69+RsjQ2
 ZauuhDvn6I/FREfjpWzTUB56L7tcVJyvM4LIoMibKVYoTG32ZsGBrrEHCgEJz/M9wYWk
 ZCYowYrC02DERv4UNYBkhyShuY8u7HauAYseNPraBbvkR6Af1PwvDxB7kRflYn8u+qwR
 pDhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLG7CboTWVozNBOcAmoh/UxfIXTpuKXZ8AIBoob6azxH8lKwE/iLfZN+tlNUrpL1jgvscKqmN5JOyudjJOilaf@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyimPiPt/RZ3xiF4+epIMXGFSO5tToulomld4PsR77FbzYUn93V
 OD+1Gdew9dVD+LK/3z7rLLSyimGlplYDhAjO6dkfRwCFBMpYArqvC3zVRrnnGKjesVHFPUbq14C
 PdHAi2ElmptknUtjGXfJ+6VHnmGQtEQzdaZux
X-Gm-Gg: AY/fxX6XlE0Hg/nrCXOuXrR3gv8p4d+8FNa0iM0SxECB5zj97v/B57kuHdX4pZG0AvL
 dDQ4XhkSxsFQkrizHoxCI4OiQo7N0ifAqLD8FvPmOXoyhrtVaxs9F9O24xN866z1s3JLyCZqcEi
 oUJh3Z+kQePBmXr1TI0ErpVBOHvEyLkiVnn+AcABC8ae41f4mbeyX3+gmjCcMIdcJffYspD1fKN
 PnxXdWf6Ay28kgAIls0KXF0hci+iidhYWMwjjPIXY2qNrgTz8InZXbHF9XKZxc+2PtBjTEz
X-Google-Smtp-Source: AGHT+IF/h1pXfHvZPU9oyMtuNi6sXaoH4IAD/RczTj0acya3J4ZyR3+xtvudT5AdfWEk1e06TBKxiUWniXx3oByv10Y=
X-Received: by 2002:a05:6000:3104:b0:42b:3ad7:fdbb with SMTP id
 ffacd0b85a97d-432468351f2mr317593f8f.3.1766021436617; Wed, 17 Dec 2025
 17:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20251215122830.3495475-1-chao@kernel.org>
 <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
 <83a27ae7-ecc2-4d0d-8fb6-5841ed78b5eb@kernel.org>
 <CAHJ8P3JGz89k9XSjkZquZGgXdXOtWMymG34u9rqR7muAzBSUNA@mail.gmail.com>
 <6483577e-7455-4531-a33f-90b6541d8e42@kernel.org>
In-Reply-To: <6483577e-7455-4531-a33f-90b6541d8e42@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 18 Dec 2025 09:30:24 +0800
X-Gm-Features: AQt7F2qQVC1aQSPtff-ESdqELrV8aw53h2S9RJ48wjT4YatV97SeHVQgEkuMKNw
Message-ID: <CAHJ8P3Kgo+YesOqWr=-=HEBY2u8-r17q6HCzxA=qBWHweVH+mg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年12月17日周三 16:03写道： > > On 12/17/25
    09:46, Zhiguo Niu wrote: > > Chao Yu 于2025年12月16日周二 16:49写道：
    > >> > >> On 12/16/25 09:36, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.54 listed in wl.mailspike.net]
X-Headers-End: 1vW2qu-0002JC-Ea
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to sanity check on nat_entry.nid
 in f2fs_get_node_info()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0MTLmnIgxN+aXpeWRqOS4iSAxNjow
M+WGmemBk++8mgo+Cj4gT24gMTIvMTcvMjUgMDk6NDYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjXlubQxMuaciDE25pel5ZGo5LqMIDE2OjQ5
5YaZ6YGT77yaCj4gPj4KPiA+PiBPbiAxMi8xNi8yNSAwOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gPj4+IOS6jjIwMjXlubQxMuaciDE15pel5ZGo5LiAIDIwOjM0
5YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gSW4gb3JkZXIgdG8gYXZvaWQgbG9hZGluZyBjb3JydXB0
ZWQgbmF0IGVudHJ5IGZyb20gZGlzay4KPiA+Pj4+Cj4gPj4+PiBDYzogc3RhYmxlQGtlcm5lbC5v
cmcKPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+Pj4+
IC0tLQo+ID4+Pj4gIGZzL2YyZnMvbm9kZS5jIHwgOSArKysrKy0tLS0KPiA+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4gPj4+PiBpbmRleCBj
ZTQ3MWUwMzM3NzQuLjEzYzg4ZGZkNzkwZCAxMDA2NDQKPiA+Pj4+IC0tLSBhL2ZzL2YyZnMvbm9k
ZS5jCj4gPj4+PiArKysgYi9mcy9mMmZzL25vZGUuYwo+ID4+Pj4gQEAgLTYzMCwxNCArNjMwLDE1
IEBAIGludCBmMmZzX2dldF9ub2RlX2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRf
dCBuaWQsCj4gPj4+PiAgICAgICAgIG5vZGVfaW5mb19mcm9tX3Jhd19uYXQobmksICZuZSk7Cj4g
Pj4+PiAgICAgICAgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPiA+Pj4+ICBzYW5pdHlf
Y2hlY2s6Cj4gPj4+PiAtICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+Ymxr
X2FkZHIpICYmCj4gPj4+PiArICAgICAgIGlmICh1bmxpa2VseShuaS0+bmlkICE9IG5pZCB8fAo+
ID4+PiBIaSBDaGFvLAo+ID4+PiAobmktPm5pZD09bmlkKSBzaG91bGQgYmUgYWx3YXlzIHRydWU/
IGJlY2F1c2UgdGhlIGNvZGU6Cj4gPj4+Cj4gPj4+IG5pLT5mbGFnID0gMDsKPiA+Pj4gbmktPm5p
ZCA9IG5pZDsKPiA+Pj4gcmV0cnk6Cj4gPj4+IG9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4g
Pj4KPiA+PiBaaGlndW8sCj4gPj4KPiA+PiBPaCwgSSBtYXkgbWlzc2VkIHNvbWV0aGluZywgbGV0
J3MgaWdub3JlIHRoaXMgcGF0Y2guCj4gPj4KPiA+Pj4KPiA+Pj4+ICsgICAgICAgICAgICAgICAo
X19pc192YWxpZF9kYXRhX2Jsa2FkZHIobmktPmJsa19hZGRyKSAmJgo+ID4+PiBidHcsIElzIGl0
IHBvc3NpYmxlIHRvIGRldGVjdCB0aGF0IHNvbWUgdmFsaWQgTmlkIGVudHJpZXMgY29udGFpbgo+
ID4+PiBpbmNvcnJlY3QgY29udGVudD8KPiA+Pj4gc3VjaCBhcyAgaW5vL2Jsb2NrX2FkZHI9TlVM
TF9BRERSIGluIG5pZD00IGVudHJ5Pwo+ID4+Cj4gPj4gU29tZXRoaW5nIGxpa2UgdGhpcz8KPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPj4g
aW5kZXggNjVjYTFhNWVhYTg4Li5jNDU4ZGY5MmJiMGQgMTAwNjQ0Cj4gPj4gLS0tIGEvZnMvZjJm
cy9mMmZzLmgKPiA+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+ID4+IEBAIC00OTI4LDE2ICs0OTI4
LDE2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19qb3VybmFsbGVkX3F1b3RhKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSkKPiA+PiAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+PiAgfQo+ID4+Cj4g
Pj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX3F1b3RhX2ZpbGUoc3RydWN0IGlub2RlICppbm9k
ZSkKPiA+PiArc3RhdGljIGlubGluZSBib29sIGYyZnNfcXVvdGFfZmlsZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIG5pZF90IGlubykKPiA+PiAgewo+ID4+ICAjaWZkZWYgQ09ORklHX1FVT1RB
Cj4gPj4gICAgICAgICBpbnQgaTsKPiA+Pgo+ID4+IC0gICAgICAgaWYgKCFmMmZzX3NiX2hhc19x
dW90YV9pbm8oRjJGU19JX1NCKGlub2RlKSkpCj4gPj4gKyAgICAgICBpZiAoIWYyZnNfc2JfaGFz
X3F1b3RhX2lubyhzYmkpKQo+ID4+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPj4K
PiA+PiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBNQVhRVU9UQVM7IGkrKykgewo+ID4+IC0gICAg
ICAgICAgICAgICBpZiAoZjJmc19xZl9pbm8oRjJGU19JX1NCKGlub2RlKS0+c2IsIGkpID09IGlu
b2RlLT5pX2lubykKPiA+PiArICAgICAgICAgICAgICAgaWYgKGYyZnNfcWZfaW5vKHNiaS0+c2Is
IGkpID09IGlubykKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
PiAgICAgICAgIH0KPiA+PiAgI2VuZGlmCj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUu
YyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4+IGluZGV4IDkyMWZiMDJjMGY0OS4uZDEyNzBiMjVhZDdk
IDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvaW5v
ZGUuYwo+ID4+IEBAIC02MjEsNyArNjIxLDcgQEAgbWFrZV9ub3c6Cj4gPj4gICAgICAgICAgICAg
ICAgIGlub2RlLT5pX2ZvcCA9ICZmMmZzX2ZpbGVfb3BlcmF0aW9uczsKPiA+PiAgICAgICAgICAg
ICAgICAgaW5vZGUtPmlfbWFwcGluZy0+YV9vcHMgPSAmZjJmc19kYmxvY2tfYW9wczsKPiA+PiAg
ICAgICAgICAgICAgICAgaWYgKElTX0lNTVVUQUJMRShpbm9kZSkgJiYgIWYyZnNfY29tcHJlc3Nl
ZF9maWxlKGlub2RlKSAmJgo+ID4+IC0gICAgICAgICAgICAgICAgICAgIWYyZnNfcXVvdGFfZmls
ZShpbm9kZSkpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAhZjJmc19xdW90YV9maWxlKHNiaSwg
aW5vZGUtPmlfaW5vKSkKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBtYXBwaW5nX3NldF9m
b2xpb19taW5fb3JkZXIoaW5vZGUtPmlfbWFwcGluZywgMCk7Cj4gPj4gICAgICAgICB9IGVsc2Ug
aWYgKFNfSVNESVIoaW5vZGUtPmlfbW9kZSkpIHsKPiA+PiAgICAgICAgICAgICAgICAgaW5vZGUt
Pmlfb3AgPSAmZjJmc19kaXJfaW5vZGVfb3BlcmF0aW9uczsKPiA+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+ID4+IGluZGV4IDdmZWVhZDU5NWJhNS4uMTA0
NDhlMTE1ZWEwIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4gPj4gKysrIGIvZnMv
ZjJmcy9ub2RlLmMKPiA+PiBAQCAtNjQzLDYgKzY0MywxNyBAQCBzYW5pdHlfY2hlY2s6Cj4gPj4g
ICAgICAgICAgICAgICAgIHJldHVybiAtRUZTQ09SUlVQVEVEOwo+ID4+ICAgICAgICAgfQo+ID4+
Cj4gPiBIaSBDaGFvCj4gPj4gKyAgICAgICBpZiAodW5saWtlbHkoZjJmc19xdW90YV9maWxlKHNi
aSwgbmktPm5pZCkgJiYKPiA+PiArICAgICAgICAgICAgICAgX19pc192YWxpZF9kYXRhX2Jsa2Fk
ZHIobmktPmJsa19hZGRyKSkpIHsKPiA+ICBfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+Ymxr
X2FkZHIpIC0tPiAhCj4gPiBfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+YmxrX2FkZHIpPz8K
Pgo+IFpoaWd1bywKPgo+IE9oLCB5ZXMuCj4KPiA+PiArICAgICAgICAgICAgICAgc2V0X3NiaV9m
bGFnKHNiaSwgU0JJX05FRURfRlNDSyk7Cj4gPj4gKyAgICAgICAgICAgICAgIGYyZnNfZXJyX3Jh
dGVsaW1pdGVkKHNiaSwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAiZjJmc19nZXRfbm9k
ZV9pbmZvIG9mICVwUzogaW5jb25zaXN0ZW50IG5hdCBlbnRyeSBmcm9tIHFmX2lubywgIgo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgICJpbm86JXUsIG5pZDoldSwgYmxrYWRkcjoldSwgdmVy
OiV1LCBmbGFnOiV1IiwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBfX2J1aWx0aW5fcmV0
dXJuX2FkZHJlc3MoMCksCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbmktPmlubywgbmkt
Pm5pZCwgbmktPmJsa19hZGRyLCBuaS0+dmVyc2lvbiwgbmktPmZsYWcpOwo+ID4+ICsgICAgICAg
ICAgICAgICBmMmZzX2hhbmRsZV9lcnJvcihzYmksIEVSUk9SX0lOQ09OU0lTVEVOVF9OQVQpOwo+
ID4+ICsgICAgICAgfQo+ID4+ICsKPiA+IEkgdGhpbmsgdGhpcyBpcyBvayBmb3IgcXVvdGEgZmls
ZSwKPiA+IGFuZCBUaGlzIGlzIG5vdCBlYXN5IHRvIGFwcGx5IHRvIGFsbCBjb21tb24gY2FzZXMo
IG5pZCBlbnRyeSBub3Qgb25seQo+ID4gZm9yIHF1b3RhKSwgcmlnaHQ/IF5eCj4KPiBZZXMsIEkg
Z3Vlc3MgcGFydGlhbCBvZiB0aGVtIG1heSBiZSBjb21tb24gY2FzZSwgd2hpY2ggbWF5IGhhcHBl
biBpbiByYWNlCj4gY29uZGl0aW9uLCBlLmcuIHRydW5jYXRlIHZzIHJlYWQuCkhpIENoYW8sClRo
YW5rcyBmb3IgdGhpcyBleHBsYWluYXRpb24sIHNvCkNvdWxkIHlvdSByZXNlbmQgdGhpcyBvZmZp
Y2lhbCBwYXRjaD8KVGhhbmtzIQo+IFRoYW5rcywKPgo+ID4gVGhhbmtzIQo+ID4+ICAgICAgICAg
LyogY2FjaGUgbmF0IGVudHJ5ICovCj4gPj4gICAgICAgICBpZiAobmVlZF9jYWNoZSkKPiA+PiAg
ICAgICAgICAgICAgICAgY2FjaGVfbmF0X2VudHJ5KHNiaSwgbmlkLCAmbmUpOwo+ID4+Cj4gPj4g
VGhhbmtzLAo+ID4+Cj4gPj4+IFRoYW5rcwo+ID4+Pj4gICAgICAgICAgICAgICAgICFmMmZzX2lz
X3ZhbGlkX2Jsa2FkZHIoc2JpLCBuaS0+YmxrX2FkZHIsCj4gPj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSB7Cj4gPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFO
Q0UpKSkpIHsKPiA+Pj4+ICAgICAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfTkVF
RF9GU0NLKTsKPiA+Pj4+ICAgICAgICAgICAgICAgICBmMmZzX2Vycl9yYXRlbGltaXRlZChzYmks
Cj4gPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAiZjJmc19nZXRfbm9kZV9pbmZvIG9mICVw
UzogaW5jb25zaXN0ZW50IG5hdCBlbnRyeSwgIgo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgImYyZnNfZ2V0X25vZGVfaW5mbyBvZiAlcFM6IG5pZDoldSwgaW5jb25zaXN0ZW50IG5hdCBl
bnRyeSwgIgo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgImlubzoldSwgbmlkOiV1LCBi
bGthZGRyOiV1LCB2ZXI6JXUsIGZsYWc6JXUiLAo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLAo+ID4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCBuaWQsCj4gPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICBuaS0+aW5vLCBuaS0+bmlkLCBuaS0+YmxrX2FkZHIsIG5pLT52ZXJzaW9u
LCBuaS0+ZmxhZyk7Cj4gPj4+PiAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2Jp
LCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPiA+Pj4+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVGU0NPUlJVUFRFRDsKPiA+Pj4+IC0tCj4gPj4+PiAyLjQ5LjAKPiA+Pj4+Cj4gPj4+Pgo+ID4+
Pj4KPiA+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+Pj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+Pgo+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
