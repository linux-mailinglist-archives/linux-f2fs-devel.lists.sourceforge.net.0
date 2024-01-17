Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FBC82FE77
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jan 2024 02:40:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPuug-0006X2-KI;
	Wed, 17 Jan 2024 01:40:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rPuue-0006Ww-Nu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 01:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oD8RW8HiVtchtdDZneDcXtHEOUAUQNP+GrQ/AmvTd8g=; b=ZsAPn96WsTVMed/AS7RxhVyXeT
 CZzVZcRts2VTGXHMQ8JQ0zej84wwCQ1ZFsL0dfT1+orqt8HNhzZXeVD1AKql79s52jAMVObc5UOyo
 xz6eoXsdUbwVwRCb4n+egYPLxImS7lYW0dSRNJC6Af5O5LtR3tZzfm2mdInWf1YVzF0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oD8RW8HiVtchtdDZneDcXtHEOUAUQNP+GrQ/AmvTd8g=; b=VR9bup72oyVYeA7906aXNNPuNb
 9RyhxkeXlsXEBqQwbArIUWc9Q/zsr3qU1V/4WoavbKRc0AZfdAmW60/3HIMRk/TwRZ3x8ZAdjgpDe
 BUK5Ngc3ToiznadZZEwYLx17tXX/QhoJvAOEKPeRnGQO0sH+A7N3DkP1MUtPI1IoL6eQ=;
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPuuX-0003TK-1r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 01:40:11 +0000
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-429ca07044eso35857691cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 17:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705455599; x=1706060399; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oD8RW8HiVtchtdDZneDcXtHEOUAUQNP+GrQ/AmvTd8g=;
 b=IPTsJbU/Ms7foLya4+L5aamHIvgRlrHb5f+mgGUCEFyLRN7Bg+wKyhE1mKCAi+i/H2
 MrwScRBgKRq4hXDq8Qqr5OxeX9zB4o9H/iDvSoo/oIpejbssPcHnDnpcZ6TobbY+9vlW
 5xWwQ6i3d3MBtZOs75QPkbTBl/n8Ecck/364lIPsU0KiCPSS0mnhVdEJwsPemzJ7u2H1
 ov+5Ask/z7HHkoQECyMRiW7kAzQxsV9ga/WPS8o1WLlQgKEUfv3jpghlZvc5bBPPnh66
 p4/q7AYq/bxxSGzYTD51A1EK81l9dVFAE6vPT1GPf+PA2SvQWd5md9TtqbsetOMi5hSL
 Ln+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705455599; x=1706060399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oD8RW8HiVtchtdDZneDcXtHEOUAUQNP+GrQ/AmvTd8g=;
 b=Bss2ZfNFxitzm5n+2E3wSAe/BAkOy6jrjkeO7uMNH8SETKt4f4jWx5XLsDmqeKjaeg
 1Mk3x6dwFhK9LYCRSunsgDExAzGETsbkYxYgQhncaiNmJQqxaV4QYdkAQs5GOtBd/Tax
 uEaXFmBWYdvucXpRjV7XgilcQp4lp8ho5QisNbnC1NY8men/F8xoAKEbchaqRhRHvLhA
 ojbeTqMcxTNnsMcHdB9hgwiR4RmN5QsjKZNjQx+3UuxoAFuoaLtgKTAzH9sqghkfOnAp
 q5NS8/HIyiIZrCxWbX/7ryyp3q/7JkoW18ekAh4msPQsAxdS1TO9w60AVqhNpEJa4Mpe
 KUkg==
X-Gm-Message-State: AOJu0Yx1iPULlV4XHZjrLIkXo0i1ghdEzFO1lEWc0M33pJ+BITYHbMPF
 wOhE+kzwW0N34I4FCDLnDNTuj+lecc4QMdqrvnk=
X-Google-Smtp-Source: AGHT+IEjlIE8dNokcrzwTbbsE8uTAXkhjtJANkUcFThRNkiialKh3OBKOeBA5s6j7fuK2rIkm5jidk/roFy1t23ahtc=
X-Received: by 2002:ac8:5e07:0:b0:429:c760:c14b with SMTP id
 h7-20020ac85e07000000b00429c760c14bmr11964798qtx.116.1705455598993; Tue, 16
 Jan 2024 17:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20240116141138.1245-1-qwjhust@gmail.com>
 <CACOAw_yL7fLmjLkK29yEb3hgTqoDO2hntOX5LMHmWjZWWix1ig@mail.gmail.com>
In-Reply-To: <CACOAw_yL7fLmjLkK29yEb3hgTqoDO2hntOX5LMHmWjZWWix1ig@mail.gmail.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Wed, 17 Jan 2024 09:39:48 +0800
Message-ID: <CAGFpFsSSg+Xs9TAw8qOadUxj8kYfyc+h3cCu_UJsxXUzMu50vQ@mail.gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello Daeho, I don't think moving just the "out" label will
    work. If a fio is zone end and in_list = 1, that fio is missed without being
    judged. On Wed, Jan 17, 2024 at 5:58 AM Daeho Jeong wrote: > > On Tue,
   Jan 16, 2024 at 6:13 AM Wenjie Qi wrote: > > > > BUG: kernel NULL pointer
    dereference, address: 0000000000000014 > > RIP: 0010:f2 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPuuX-0003TK-1r
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8gRGFlaG8sCkkgZG9uJ3QgdGhpbmsgbW92aW5nIGp1c3QgdGhlICJvdXQiIGxhYmVsIHdp
bGwgd29yay4KSWYgYSBmaW8gaXMgem9uZSBlbmQgYW5kIGluX2xpc3QgPSAxLCB0aGF0IGZpbyBp
cyBtaXNzZWQgd2l0aG91dCBiZWluZyBqdWRnZWQuCgpPbiBXZWQsIEphbiAxNywgMjAyNCBhdCA1
OjU44oCvQU0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1
ZSwgSmFuIDE2LCAyMDI0IGF0IDY6MTPigK9BTSBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFk
ZHJlc3M6IDAwMDAwMDAwMDAwMDAwMTQKPiA+IFJJUDogMDAxMDpmMmZzX3N1Ym1pdF9wYWdlX3dy
aXRlKzB4NmNmLzB4NzgwIFtmMmZzXQo+ID4gQ2FsbCBUcmFjZToKPiA+IDxUQVNLPgo+ID4gPyBz
aG93X3JlZ3MrMHg2ZS8weDgwCj4gPiA/IF9fZGllKzB4MjkvMHg3MAo+ID4gPyBwYWdlX2ZhdWx0
X29vcHMrMHgxNTQvMHg0YTAKPiA+ID8gcHJiX3JlYWRfdmFsaWQrMHgyMC8weDMwCj4gPiA/IF9f
aXJxX3dvcmtfcXVldWVfbG9jYWwrMHgzOS8weGQwCj4gPiA/IGlycV93b3JrX3F1ZXVlKzB4MzYv
MHg3MAo+ID4gPyBkb191c2VyX2FkZHJfZmF1bHQrMHgzMTQvMHg2YzAKPiA+ID8gZXhjX3BhZ2Vf
ZmF1bHQrMHg3ZC8weDE5MAo+ID4gPyBhc21fZXhjX3BhZ2VfZmF1bHQrMHgyYi8weDMwCj4gPiA/
IGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUrMHg2Y2YvMHg3ODAgW2YyZnNdCj4gPiA/IGYyZnNfc3Vi
bWl0X3BhZ2Vfd3JpdGUrMHg3MzYvMHg3ODAgW2YyZnNdCj4gPiBkb193cml0ZV9wYWdlKzB4NTAv
MHgxNzAgW2YyZnNdCj4gPiBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGErMHg2MS8weGIwIFtmMmZz
XQo+ID4gZjJmc19kb193cml0ZV9kYXRhX3BhZ2UrMHgzZjgvMHg2NjAgW2YyZnNdCj4gPiBmMmZz
X3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg1YmIvMHg3YTAgW2YyZnNdCj4gPiBmMmZzX3dyaXRl
X2NhY2hlX3BhZ2VzKzB4M2RhLzB4YmUwIFtmMmZzXQo+ID4gLi4uCj4gPiBJdCBpcyBwb3NzaWJs
ZSB0aGF0IG90aGVyIHRocmVhZHMgaGF2ZSBhZGRlZCB0aGlzIGZpbyB0byBpby0+YmlvCj4gPiBh
bmQgc3VibWl0dGVkIHRoZSBpby0+YmlvIGJlZm9yZSBlbnRlcmluZyBmMmZzX3N1Ym1pdF9wYWdl
X3dyaXRlKCkuCj4gPiBBdCB0aGlzIHBvaW50IGlvLT5iaW8gPSBOVUxMLgo+ID4gSWYgaXNfZW5k
X3pvbmVfYmxrYWRkcihzYmksIGZpby0+bmV3X2Jsa2FkZHIpIG9mIHRoaXMgZmlvIGlzIHRydWUs
Cj4gPiB0aGVuIGFuIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBlcnJvciBvY2N1cnMgYXQgYmlv
X2dldChpby0+YmlvKS4KPiA+IFRoZSBvcmlnaW5hbCBjb2RlIGZvciBkZXRlcm1pbmluZyB6b25l
IGVuZCB3YXMgYWZ0ZXIgIm91dDoiLAo+ID4gd2hpY2ggd291bGQgaGF2ZSBtaXNzZWQgc29tZSBm
aW8gd2hvIGlzIHpvbmUgZW5kLiBJJ3ZlIG1vdmVkCj4gPiAgdGhpcyBjb2RlIGJlZm9yZSAic2tp
cDoiIHRvIG1ha2Ugc3VyZSBpdCdzIGRvbmUgZm9yIGVhY2ggZmlvLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlbmppZSBRaSA8cXdqaHVzdEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZz
L2RhdGEuYyB8IDggKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2Zz
L2YyZnMvZGF0YS5jCj4gPiBpbmRleCBkY2U4ZGVmZGY0YzcuLjRmNDQ1OTA2ZGI4YiAxMDA2NDQK
PiA+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4gQEAg
LTEwODAsMTAgKzEwODAsNiBAQCB2b2lkIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoc3RydWN0IGYy
ZnNfaW9faW5mbyAqZmlvKQo+ID4gICAgICAgICBpby0+bGFzdF9ibG9ja19pbl9iaW8gPSBmaW8t
Pm5ld19ibGthZGRyOwo+ID4KPiA+ICAgICAgICAgdHJhY2VfZjJmc19zdWJtaXRfcGFnZV93cml0
ZShmaW8tPnBhZ2UsIGZpbyk7Cj4gPiAtc2tpcDoKPiA+IC0gICAgICAgaWYgKGZpby0+aW5fbGlz
dCkKPiA+IC0gICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gPiAtb3V0Ogo+ID4gICNpZmRlZiBD
T05GSUdfQkxLX0RFVl9aT05FRAo+ID4gICAgICAgICBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQo
c2JpKSAmJiBidHlwZSA8IE1FVEEgJiYKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2Vu
ZF96b25lX2Jsa2FkZHIoc2JpLCBmaW8tPm5ld19ibGthZGRyKSkgewo+ID4gQEAgLTEwOTYsNiAr
MTA5MiwxMCBAQCB2b2lkIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoc3RydWN0IGYyZnNfaW9faW5m
byAqZmlvKQo+ID4gICAgICAgICAgICAgICAgIF9fc3VibWl0X21lcmdlZF9iaW8oaW8pOwo+ID4g
ICAgICAgICB9Cj4gPiAgI2VuZGlmCj4gPiArc2tpcDoKPiA+ICsgICAgICAgaWYgKGZpby0+aW5f
bGlzdCkKPiA+ICsgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gPiArb3V0Ogo+Cj4gSG93IGFi
b3V0IG1vdmluZyBvbmx5IHRoZSAib3V0IiBsYWJlbCBpbnN0ZWFkIG9mIHRoZSB3aG9sZSBibG9j
ayBmcm9tCj4gInNraXAiIHRvICJvdXQiPwo+Cj4gPiAgICAgICAgIGlmIChpc19zYmlfZmxhZ19z
ZXQoc2JpLCBTQklfSVNfU0hVVERPV04pIHx8Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICFmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPiA+ICAgICAgICAgICAgICAg
ICBfX3N1Ym1pdF9tZXJnZWRfYmlvKGlvKTsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPgo+ID4K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
