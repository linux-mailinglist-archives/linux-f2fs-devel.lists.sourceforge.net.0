Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BA7E4F14
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Nov 2023 03:46:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0YaM-00006G-5N;
	Wed, 08 Nov 2023 02:46:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1r0YaK-00006A-R6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Nov 2023 02:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0dj3oJkGhFmW0PQVdBh3/PRKGgG3RUdlu0nDUsZ6Xc0=; b=Hyq5d85esbICwjDX6ThgdnaLrk
 xOmQyqPDtsFOxXQXVGUfFR40154sxc2CZhdXvjBmWOpCfufhdF/HTN5760D+SL8ooCtrzj+cliQpi
 5RD21CDivwSWM1Q3gZ2/xFYXv2SM/aPR0Ouzc4yHEGw2rIrxtnGAjg97rj0mVSYZZHmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0dj3oJkGhFmW0PQVdBh3/PRKGgG3RUdlu0nDUsZ6Xc0=; b=HfPq8BRAkgQ1k47AucukE1wE8i
 9XmzlQWsDv/MkaCBVgLI0AcaHZD4tfK+d/FEKUb32HllcgH1ge5qHqeXtREWx4NDT2L31vE/biSjS
 1hv57EJ+JET2/gLFTHUw4AIlkLm3SSDl5EurggqVcvOSNBo5vnh+D2x456jHhSz7mKVw=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r0YaJ-00DVpp-1p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Nov 2023 02:46:27 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso685381a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Nov 2023 18:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699411580; x=1700016380; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dj3oJkGhFmW0PQVdBh3/PRKGgG3RUdlu0nDUsZ6Xc0=;
 b=j91z3xRZC3ydqMmmuzRbljgI8zFnaWUyczuXBBe8m0ADpjjO5VRRm+WAxH/XGpQyF5
 /ajJni/jJvQnAg8Sovagwx322Yu5LVrbrLGCt0tvdKts39w0et9MxbfovVSJ8y5ZHgwp
 Rv5lW27Jz292Q9AY+rfrm12Aw8K/3ZjNCoQoGUHgS9u7mUj9Ud+nM25K4tJsFGnthcbC
 bqjgu3X8woN7kjN0XN81YzoMnU3P59N0DvpX68pN2bpC/+lnSWi/GPRjCQNmu3kywfX3
 YUAg5Q2wmfsIoofZaAZNJKQuBQc5CsAJnMIlGtygtTyc57xR04ooT30hmCBt6Ob/ajdR
 Avfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699411580; x=1700016380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dj3oJkGhFmW0PQVdBh3/PRKGgG3RUdlu0nDUsZ6Xc0=;
 b=R1K0KIXPLR/8JsoIGUJI2ZfZaBF9el89UNaNzCuafhVQinmALGDn0k1fGI3o+3wbCO
 7+xVqesJE/SzSYzS7sh2EZOLykdidG3HAVEbcGxKlG7FtvHcoHO6C2Y24u7deMTHxoDg
 uEWMWo7a2xUs1k+x1gvDEiIvGWmMocMEBTFQ3dh1O+UaKyZg95stwGu7blKI8NAbe6P2
 QsLtIXfo8Zs37ZWOOUYVbruI2C7r15JCVw/gLBRrYPTOQqXoR7TI2/0wXNIbQKsuTDm4
 Hrs1sqzkGB5Qge1NHyrREWBH85H9NEcErQyz3NPEnrO0E/g+ABT6MdS+xeu55NZTV/vI
 AMOg==
X-Gm-Message-State: AOJu0YyA8IBpr1Nu1dAIAi916ATIEiUSO4lnDLMU52HSRhZes7aO0Pz6
 9o38bdzaOlyByt8kt7zDxb1LTyit0GcKpk0f2+4=
X-Google-Smtp-Source: AGHT+IFj33PnvnqPH/KBUjDg49VNjbJ1PxEOtdO55wqT6gPUPSzHv1aeD1geze2d5vHQ/mH+Q8u6HYob9M+ZmYScYo4=
X-Received: by 2002:aa7:c2ca:0:b0:542:f0af:21e6 with SMTP id
 m10-20020aa7c2ca000000b00542f0af21e6mr571437edp.14.1699411580206; Tue, 07 Nov
 2023 18:46:20 -0800 (PST)
MIME-Version: 1.0
References: <1698888042-17199-1-git-send-email-zhiguo.niu@unisoc.com>
 <fbba559c-59e2-94f1-52d6-94960a13f682@kernel.org>
In-Reply-To: <fbba559c-59e2-94f1-52d6-94960a13f682@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 8 Nov 2023 10:46:08 +0800
Message-ID: <CAHJ8P3JAHOSav7YmZeTDUzbEYgzo_ja5eEadtXAnE4Ufj9isqg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Chao, On Tue, Nov 7, 2023 at 10:53 PM Chao Yu wrote:
    > > On 2023/11/2 9:20, Zhiguo Niu wrote: > > Because the length of task'name
    in task_struct can not exceed > > 16 characters, f2fs some thread'name c
   [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.48 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r0YaJ-00DVpp-1p
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix thread name cannot be fully
 displayed
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBDaGFvLAoKT24gVHVlLCBOb3YgNywgMjAyMyBhdCAxMDo1M+KAr1BNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMDIzLzExLzIgOToyMCwgWmhpZ3VvIE5pdSB3
cm90ZToKPiA+IEJlY2F1c2UgdGhlIGxlbmd0aCBvZiB0YXNrJ25hbWUgaW4gdGFza19zdHJ1Y3Qg
Y2FuIG5vdCBleGNlZWQKPiA+IDE2IGNoYXJhY3RlcnMsIGYyZnMgc29tZSB0aHJlYWQnbmFtZSBj
YW5ub3QgYmUgZnVsbHkgZGlzcGxheWVkLAo+ID4gaW5jbHVkaW5nIGltcG9ydGFudCBkZXZpY2Ug
bnVtYmVyIGluZm9ybWF0aW9uLgo+ID4gSWYgdGhlcmUgYXJlIG1vcmUgdGhhbiBvbmUgcGFydGl0
aW9uIHVzaW5nIHRoZSBmMmZzIGZpbGUgc3lzdGVtLAo+ID4gaXQgaXMgdmVyeSBpbmNvbnZlbmll
bnQgdG8gbWF0Y2ggcGFydGl0aW9ucyBhbmQgdGhlaXIgdGhyZWFkcy4KPiA+Cj4gPiBUaGUgZm9s
bG93aW5nIGV4YW1wbGVzIHNob3cgdGhhdCA0IHBhcnRpdGlvbnMgYWxsIHVzZSBmMmZzIGZpbGUg
c3lzdGVtCj4gPiBQSUQ6IDQwMCAgICBUQVNLOiBmZmZmZmY4MGYxMjBjOWMwICBDUFU6IDIgICBD
T01NQU5EOiAiZjJmc19kaXNjYXJkLTI1Igo+ID4gUElEOiAzOTIgICAgVEFTSzogZmZmZmZmODBm
NmI3NTg4MCAgQ1BVOiAzICAgQ09NTUFORDogImYyZnNfZGlzY2FyZC0yNSIKPiA+IFBJRDogNDAw
ICAgIFRBU0s6IGZmZmZmZjgwZjEyMGM5YzAgIENQVTogMiAgIENPTU1BTkQ6ICJmMmZzX2Rpc2Nh
cmQtMjUiCj4gPiBQSUQ6IDM5MiAgICBUQVNLOiBmZmZmZmY4MGY2Yjc1ODgwICBDUFU6IDMgICBD
T01NQU5EOiAiZjJmc19kaXNjYXJkLTI1Igo+ID4gUElEOiA1MTAgICAgVEFTSzogZmZmZmZmODBk
ZDYyYzljMCAgQ1BVOiAwICAgQ09NTUFORDogImYyZnNfY2twdC0yNTQ6NCIKPiA+IFBJRDogMjU1
ICAgIFRBU0s6IGZmZmZmZjgwZjIyNjgwMDAgIENQVTogMyAgIENPTU1BTkQ6ICJmMmZzX2NrcHQt
MjU5OjQiCj4gPiBQSUQ6IDM5OCAgICBUQVNLOiBmZmZmZmY4MGYxMjBhYzQwICBDUFU6IDIgICBD
T01NQU5EOiAiZjJmc19ja3B0LTI1OTo0Igo+ID4gUElEOiAzOTAgICAgVEFTSzogZmZmZmZmODBm
NmI3Njc0MCAgQ1BVOiAzICAgQ09NTUFORDogImYyZnNfY2twdC0yNTk6NCIKPiA+IFBJRDogNTEx
ICAgIFRBU0s6IGZmZmZmZjgwZGQ2MjlkODAgIENQVTogMyAgIENPTU1BTkQ6ICJmMmZzX2ZsdXNo
LTI1NDoiCj4gPiBQSUQ6IDM5OSAgICBUQVNLOiBmZmZmZmY4MGYxMjBiYjAwICBDUFU6IDIgICBD
T01NQU5EOiAiZjJmc19mbHVzaC0yNTk6Igo+ID4gUElEOiAzOTEgICAgVEFTSzogZmZmZmZmODBm
NmI3MDAwMCAgQ1BVOiAzICAgQ09NTUFORDogImYyZnNfZmx1c2gtMjU5OiIKPiA+IFBJRDogMjU2
ICAgIFRBU0s6IGZmZmZmZjgwZjIyNmQ4ODAgIENQVTogNiAgIENPTU1BTkQ6ICJmMmZzX2ZsdXNo
LTI1OToiCj4gPgo+ID4gV2UgY2FuIHVzZSB0aGUgbmFtZSBmb3JtYXQgc3VjaCBhcyBmMmZzX2dj
LXh4eCwgYXMgc2F3IGluIGRldmljZToKPiA+IFBJRDogMjYwICAgIFRBU0s6IGZmZmZmZjgwZjhj
MmU3NDAgIENQVTogMyAgIENPTU1BTkQ6ICJmMmZzX2djLTI1OTo0NCIKPiA+IFBJRDogNDIwICAg
IFRBU0s6IGZmZmZmZjgwZjY1MDU4ODAgIENQVTogMiAgIENPTU1BTkQ6ICJmMmZzX2djLTI1OTo0
MSIKPiA+IFBJRDogMzkzICAgIFRBU0s6IGZmZmZmZjgwZjZiNzJjNDAgIENQVTogMSAgIENPTU1B
TkQ6ICJmMmZzX2djLTI1OTo0MAo+ID4gUElEOiA1MTMgICAgVEFTSzogZmZmZmZmODBkZDYyZTc0
MCAgQ1BVOiAxICAgQ09NTUFORDogImYyZnNfZ2MtMjU0OjQwIgo+Cj4gQ2FuIHlvdSBwbGVhc2Ug
Y2hlY2sgY29tbWVudHMgaW4gYmVsb3cgbGluaz8KPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWYyZnMtZGV2ZWwvOGVhYWQ5ZDAtMWQ1OS0zZWNiLWJhYjQtOTA0ZWQyMjM4NWY0QGtl
cm5lbC5vcmcvCj4KVGhhbmtzIGZvciB5b3VyIHNoYXJlIGFuZCBJIGdvdCBpdC4KPiBUaGFua3Ms
Cj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5j
b20+Cj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9jaGVja3BvaW50LmMgfCAyICstCj4gPiAgIGZzL2Yy
ZnMvc2VnbWVudC5jICAgIHwgNCArKy0tCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNr
cG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gPiBpbmRleCBiMDU5N2E1Li5mNmE1NDI0
IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMv
Y2hlY2twb2ludC5jCj4gPiBAQCAtMTg5Myw3ICsxODkzLDcgQEAgaW50IGYyZnNfc3RhcnRfY2tw
dF90aHJlYWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+Cj4gPiAgICAgICBjcHJjLT5mMmZzX2lzc3VlX2NrcHQgPSBrdGhyZWFkX3J1bihp
c3N1ZV9jaGVja3BvaW50X3RocmVhZCwgc2JpLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICJm
MmZzX2NrcHQtJXU6JXUiLCBNQUpPUihkZXYpLCBNSU5PUihkZXYpKTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAiZjJmc19jcC0ldToldSIsIE1BSk9SKGRldiksIE1JTk9SKGRldikpOwo+ID4g
ICAgICAgaWYgKElTX0VSUihjcHJjLT5mMmZzX2lzc3VlX2NrcHQpKSB7Cj4gPiAgICAgICAgICAg
ICAgIGludCBlcnIgPSBQVFJfRVJSKGNwcmMtPmYyZnNfaXNzdWVfY2twdCk7Cj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IGluZGV4
IGQwNWI0MTYuLmIyOTA3MTMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4g
KysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IEBAIC02NzcsNyArNjc3LDcgQEAgaW50IGYyZnNf
Y3JlYXRlX2ZsdXNoX2NtZF9jb250cm9sKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Cj4g
PiAgIGluaXRfdGhyZWFkOgo+ID4gICAgICAgZmNjLT5mMmZzX2lzc3VlX2ZsdXNoID0ga3RocmVh
ZF9ydW4oaXNzdWVfZmx1c2hfdGhyZWFkLCBzYmksCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiZjJmc19mbHVzaC0ldToldSIsIE1BSk9SKGRldiksIE1JTk9SKGRldikpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImYyZnNfZmgtJXU6JXUiLCBNQUpPUihkZXYp
LCBNSU5PUihkZXYpKTsKPiA+ICAgICAgIGlmIChJU19FUlIoZmNjLT5mMmZzX2lzc3VlX2ZsdXNo
KSkgewo+ID4gICAgICAgICAgICAgICBpbnQgZXJyID0gUFRSX0VSUihmY2MtPmYyZnNfaXNzdWVf
Zmx1c2gpOwo+ID4KPiA+IEBAIC0yMjQ4LDcgKzIyNDgsNyBAQCBpbnQgZjJmc19zdGFydF9kaXNj
YXJkX3RocmVhZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gPiAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ID4KPiA+ICAgICAgIGRjYy0+ZjJmc19pc3N1ZV9kaXNjYXJkID0ga3RocmVhZF9y
dW4oaXNzdWVfZGlzY2FyZF90aHJlYWQsIHNiaSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJmMmZzX2Rpc2NhcmQtJXU6JXUiLCBNQUpPUihkZXYpLCBNSU5PUihkZXYpKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmMmZzX2RjLSV1OiV1IiwgTUFKT1IoZGV2
KSwgTUlOT1IoZGV2KSk7Cj4gPiAgICAgICBpZiAoSVNfRVJSKGRjYy0+ZjJmc19pc3N1ZV9kaXNj
YXJkKSkgewo+ID4gICAgICAgICAgICAgICBlcnIgPSBQVFJfRVJSKGRjYy0+ZjJmc19pc3N1ZV9k
aXNjYXJkKTsKPiA+ICAgICAgICAgICAgICAgZGNjLT5mMmZzX2lzc3VlX2Rpc2NhcmQgPSBOVUxM
OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
