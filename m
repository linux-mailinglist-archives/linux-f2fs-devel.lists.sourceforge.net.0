Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 855BA856EA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 21:39:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raiVy-0007Yd-1V;
	Thu, 15 Feb 2024 20:39:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1raiVv-0007YJ-Pg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KP8/sXQUg6d+/tAlWscHgJtEUS3CFlZkJ/dGjgcRmF8=; b=jJ7ozi/VTQlZKi+JjAYqd/6379
 yek6hUVhbxHp/VR82S1464K91Y1+zoKvW/fEqjHxdY/Ly3fs+HjGRji7WPYgaAiYTRUFJ1Yf6gyLE
 rK0CCSjssEZHlL9Djk+jO+ZXEPWlSjaUHk4wvur1BhKOUFF0EgcJA4LzL3U8DYR+92wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KP8/sXQUg6d+/tAlWscHgJtEUS3CFlZkJ/dGjgcRmF8=; b=Nh5EA0U6CHxMP15eNxPSbKDEEp
 B7PeuVkfUlxedxxul2zWjE2/PZaiYqsgZ+aMc+j2TKLp4E2TX0hrTewnotPL79ZDsPeZ61H+deTHx
 39ntBAxLAzseb+FsZ0TkRruKvKK8z9rWWycnHvnf/FZ9UyCwUk+1u8KCekh8FZS2r0UM=;
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1raiVv-0003hX-7v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:39:24 +0000
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-4c02478c8efso408921e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Feb 2024 12:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708029558; x=1708634358; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KP8/sXQUg6d+/tAlWscHgJtEUS3CFlZkJ/dGjgcRmF8=;
 b=MRff3CK298xh9JZ+i+E9vQI+a5IE3ERjj0wX9C9jSJUttQfr9AwLPaSDwbvOtklhYS
 mjediRbcFagsOBywvHY9LMfBKlOx0xDb3EHuUq0OirgiOzJ40V5rNEkrLHfAP0zVSBuO
 c2TKg8PTPY/0ytWpF78CRuOkxS6AFnhSKqwKeR+aRqOazUQbVWaEX+hOtC7PsakdQ7JO
 BBQVachntSfIg9JUWo38bnRtf5vmuxLoxWfg5/9S6VZyrNrSeUGFvwR6Xq8Web7D62sw
 4ZNFMVL6hjE0SCPdwzMAx4mdd12jFQQjFwGm82QnHPQoZgM0fbj5FbU1+PbHqxtvlpvk
 ygWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708029558; x=1708634358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KP8/sXQUg6d+/tAlWscHgJtEUS3CFlZkJ/dGjgcRmF8=;
 b=jgJ9A04CPIbBPJPHWwII9ZEOLfXeRkGo17bgffYHBsDIPhtlhHzR4hrSq5dHPBTn7o
 BCbuiE1/UOwZvKzgybpatuVzNc8CCDK4XmhxZgUPWnkgyvYWfu5jbCyByo1e48fTrTIh
 t8Jo86hCDSM7RbirzWu+1VdjVTb2BBXNgSdpg12jbED9APNEdRWEwX8EEw6yyUWPh4qE
 SmmTOPCsNpbVQReY4Gt5Gb4jz8npGtqfjTMHwF+poeW5TNxU0posYrwEuB1No5vIsZ2W
 NaX2KiZMRAtUaUN2jFM6rEQz4+sceZXeNHvKWkn9V+VY7GK2pD40fXnPDexyb1JDKsT3
 FeKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrZ3HcwjA+jQKghVLF2JMVUmL4TIjQ0oFLn0xDIKf17VGzwA0dFGKPO/koJSZZftvyuoKJB7qn/22XL/XW1BliNfEzv0L1sLzCiWsZ7iQE3SdJbpRrrw==
X-Gm-Message-State: AOJu0YyUnHADhpGWGnxVZF67hVUVRmZBEjeG5v+qwoyWqBSbDX4IPjgz
 51AoIWGZvzvcynRyCFSH3jB2ujAQ2OJuzZUYlgxz6vioDt0NqlLBJPhNB6AJ6EM4OMUcsol664x
 RUZaxy9/cGbWBtd8oqC08QfMolFwLc45y
X-Google-Smtp-Source: AGHT+IGZeFq7SGMN9pvV+zTmQwR7jHhUTJ7ig1DtH3MAruI0U2O4Ew2wALWOgV5FjRM6w/Nx6JO01FVY6D241zI5kaw=
X-Received: by 2002:a1f:dd04:0:b0:4c0:309b:2755 with SMTP id
 u4-20020a1fdd04000000b004c0309b2755mr2533048vkg.3.1708029557760; Thu, 15 Feb
 2024 12:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20240215201053.2364270-1-daeho43@gmail.com>
 <Zc51zeFF3DrUXMem@google.com>
In-Reply-To: <Zc51zeFF3DrUXMem@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 15 Feb 2024 12:39:06 -0800
Message-ID: <CACOAw_z99UEofyh2PjRe8UfaqGBxwaGd392jHN42JM-bzLZnHw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Feb 15, 2024 at 12:36 PM Jaegeuk Kim wrote: > >
   On 02/15, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Added lseek command
    to support lseek() for SEEK_DATA and SEEK_HOLE. > > > > Sig [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.172 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1raiVv-0003hX-7v
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add lseek command to execute lseek()
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMTI6MzbigK9QTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAyLzE1LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZy
b206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gQWRkZWQgbHNl
ZWsgY29tbWFuZCB0byBzdXBwb3J0IGxzZWVrKCkgZm9yIFNFRUtfREFUQSBhbmQgU0VFS19IT0xF
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5j
b20+Cj4gPiAtLS0KPiA+ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8IDM4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90
b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+ID4gaW5kZXggZTdkMjg2YS4uYjVjNWI5NyAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gPiArKysgYi90b29scy9mMmZzX2lv
L2YyZnNfaW8uYwo+ID4gQEAgLTE2MzAsNiArMTYzMCw0MyBAQCBzdGF0aWMgdm9pZCBkb19yZW1v
dmV4YXR0cihpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21k
KQo+ID4gICAgICAgZXhpdCgwKTsKPiA+ICB9Cj4gPgo+ID4gKyNkZWZpbmUgbHNlZWtfZGVzYyAi
ZG8gbHNlZWsgZm9yIFNFRUtfREFUQSBvciBTRUVLX0hPTEUgZm9yIGEgZmlsZSIKPiA+ICsjZGVm
aW5lIGxzZWVrX2hlbHAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsi
ZjJmc19pbyBsc2VlayBbd2hlbmNlXSBbb2Zmc2V0XSBbZmlsZV9wYXRoXVxuXG4iICAgIFwKPiA+
ICsiRG8gbHNlZWsgZmlsZSBkYXRhIGluIGZpbGVfcGF0aFxuIiAgICAgICAgICAgICAgICAgIFwK
PiA+ICsid2hlbmNlIGNhbiBiZVxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPgo+IENhbiB3ZSBhbHNvIGhhdmUgYWxsIHRoZSBvdGhlciBvcHRpb25zIGFzIHdlbGw/CgpT
b3VuZHMgZ29vZC4KCj4KPiA+ICsiICBkYXRhICAgICA6IFNFRUtfREFUQSwgcmV0dXJuIHRoZSBm
aWxlIG9mZnNldCB0byB0aGUgbmV4dCBkYXRhIGxvY2F0aW9uIGZyb20gb2Zmc2V0XG4iXAo+ID4g
KyIgIGhvbGUgICAgIDogU0VFS19IT0xFLCByZXR1cm4gdGhlIGZpbGUgb2Zmc2V0IHRvIHRoZSBu
ZXh0IGhvbGUgZnJvbSBvZmZzZXRcbiIKPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBkb19sc2Vlayhp
bnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4gK3sK
PiA+ICsgICAgIGludCBmZCwgd2hlbmNlOwo+ID4gKyAgICAgb2ZmX3Qgb2Zmc2V0LCByZXQ7Cj4g
PiArCj4gPiArICAgICBpZiAoYXJnYyAhPSA0KSB7Cj4gPiArICAgICAgICAgICAgIGZwdXRzKCJF
eGNlc3MgYXJndW1lbnRzXG5cbiIsIHN0ZGVycik7Cj4gPiArICAgICAgICAgICAgIGZwdXRzKGNt
ZC0+Y21kX2hlbHAsIHN0ZGVycik7Cj4gPiArICAgICAgICAgICAgIGV4aXQoMSk7Cj4gPiArICAg
ICB9Cj4gPiArCj4gPiArICAgICBvZmZzZXQgPSBhdG9pKGFyZ3ZbMl0pOwo+ID4gKwo+ID4gKyAg
ICAgaWYgKCFzdHJjbXAoYXJndlsxXSwgImRhdGEiKSkKPiA+ICsgICAgICAgICAgICAgd2hlbmNl
ID0gU0VFS19EQVRBOwo+ID4gKyAgICAgZWxzZSBpZiAoIXN0cmNtcChhcmd2WzFdLCAiaG9sZSIp
KQo+ID4gKyAgICAgICAgICAgICB3aGVuY2UgPSBTRUVLX0hPTEU7Cj4gPiArICAgICBlbHNlCj4g
PiArICAgICAgICAgICAgIGRpZSgiV3Jvbmcgd2hlbmNlIHR5cGUiKTsKPiA+ICsKPiA+ICsgICAg
IGZkID0geG9wZW4oYXJndlszXSwgT19SRE9OTFksIDApOwo+ID4gKwo+ID4gKyAgICAgcmV0ID0g
bHNlZWsoZmQsIG9mZnNldCwgd2hlbmNlKTsKPiA+ICsgICAgIGlmIChyZXQgPCAwKQo+ID4gKyAg
ICAgICAgICAgICBkaWVfZXJybm8oImxzZWVrIGZhaWxlZCIpOwo+ID4gKyAgICAgcHJpbnRmKCJy
ZXR1cm5lZCBvZmZzZXQ9JWxkXG4iLCByZXQpOwo+ID4gKyAgICAgZXhpdCgwKTsKPiA+ICt9Cj4g
PiArCj4gPiAgI2RlZmluZSBDTURfSElEREVOICAgMHgwMDAxCj4gPiAgI2RlZmluZSBDTUQobmFt
ZSkgeyAjbmFtZSwgZG9fIyNuYW1lLCBuYW1lIyNfZGVzYywgbmFtZSMjX2hlbHAsIDAgfQo+ID4g
ICNkZWZpbmUgX0NNRChuYW1lKSB7ICNuYW1lLCBkb18jI25hbWUsIE5VTEwsIE5VTEwsIENNRF9I
SURERU4gfQo+ID4gQEAgLTE2NzEsNiArMTcwOCw3IEBAIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyBj
bWRfbGlzdFtdID0gewo+ID4gICAgICAgQ01EKGxpc3R4YXR0ciksCj4gPiAgICAgICBDTUQoc2V0
eGF0dHIpLAo+ID4gICAgICAgQ01EKHJlbW92ZXhhdHRyKSwKPiA+ICsgICAgIENNRChsc2Vlayks
Cj4gPiAgICAgICB7IE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIDAgfQo+ID4gIH07Cj4gPgo+ID4g
LS0KPiA+IDIuNDMuMC42ODcuZzM4YWE2NTU5YjAtZ29vZwo+ID4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
