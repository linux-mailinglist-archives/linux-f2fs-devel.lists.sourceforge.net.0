Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D05FA867E9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 18:34:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reerT-00013k-RT;
	Mon, 26 Feb 2024 17:33:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1reerO-00013H-Fy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 17:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HjCc/IhW4VTH60NHsQaSy5PBjw8dYdxVYEZhXVSvdM0=; b=CklRzF3fVz1VAMSlHosbR+KSC4
 fodz/KWKxjLT6qIajccSXMrJE6ZJA3Vf3FiDXdzODo/f2qjwJIBVLgfBad/uMCd7HP6P/uKcEOG3q
 vvBz2DV75B/T2w2r+1Zl4pj2HP9fSntX1kWn3vw6FgeZEviRuWhylBWSRvuL0M6D3GI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HjCc/IhW4VTH60NHsQaSy5PBjw8dYdxVYEZhXVSvdM0=; b=WTZgoRymEGMgRSI28xImOh/MCu
 qRmMEa0hT9K5Zr29qPj/AAnn1CNZ6oM/IwPSIapeikgtow1HrCJe8OO/XZw9dVL9V2ZD9kS4mj4nj
 jcsVvNEgWvAdOYJsUsO3nIw+n1uN1x7RLAw9ubD7lLCQLW4JYjKnDIpYsJnK85X0tamo=;
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1reerO-0003iO-HO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 17:33:51 +0000
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7d2940ad0e1so1937001241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 09:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708968824; x=1709573624; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjCc/IhW4VTH60NHsQaSy5PBjw8dYdxVYEZhXVSvdM0=;
 b=QMUY2w+TkYJ9inRAFZxqFgrdWnod4ZNCX4cMmdA5Ft2ljUp4XuOYLfecF3LtbPqQea
 OIKcEyPzjIXLUTVMssNldiKtBL2nraX8iCroLLsWPYtpaAkdmKJGe9cnRv4K4aCgD+oc
 EShv6+80q3zLH/Hm11pyxtm5/Yg1Zit7XRdTyvcLlZKI0MXVllrdIDyaqMjjKY8HEUD9
 dsMSkIwiYcLG/FmBAR6CDpGBHuxSgIPVv3GRX/+CzofFdiyqpQq5ThAkz2N3wGGKapun
 z6S2z9TufBE6TxSrF0k/sTMr3z5yxhVN9h/nG5a2IufU9DQ2bo8E+vlN8fzKwf/K888n
 VF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708968824; x=1709573624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjCc/IhW4VTH60NHsQaSy5PBjw8dYdxVYEZhXVSvdM0=;
 b=M179okD134QDSl0cA1Sf+jP3x6ecgP5ybM9V8H19VffqH98oSNVjBN8hEC/6AecqL2
 TXoQxim1OZnAxAGi0t0ZRAsjd2SziztrVcU8crIqRrdmnoVT82dC8SZfULpYJ9jDyILN
 UoJqtNjgrAzBJRx6kyZBt7n8sx0uEazX7tvCjwL7+67FeysmCIqsXiZOSt6NPvbALIV/
 t4uLobf+/lGeb/ORBhzrSUgB9XMVPM8xadj/Cxy/VR6S8ONV3/beh2PZvN/pO9p4uwK4
 GYqffjU28FubCuHKE6G5o9ksAVDO7QUHW6IvS1pXDEKmwKM4NTe5BJaqUnU1PbzRv4rC
 xkyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAYb6dev67BEnMWvUrNoySPhDKwzHmtslzMbMIgx1ZXDXFBTlVmPDnNbZRAM7BLGc2FD6wnVbaWVoOVFqJVO+/khUftcQnhfNsqPiRc09qgpkzWdV0LA==
X-Gm-Message-State: AOJu0YwnZe0OMjNxuspBC37KSFz0TczhsWoPgQzfwPa22hNIZpjpbvNC
 hyFrpyRzwZgk7W8mPS9gaCVjFVBwkfNBfugUcaqRUUQxNUgvI/a/s1Pm/oKXSluETQeHCzs72i4
 2lPPrBBAZpyZ0NATDCZaZp96boH/FrwpOMbc=
X-Google-Smtp-Source: AGHT+IE8aT3V9/49fcrreBfpVmvC8OUSrXl4/G0plOnQ6n3oR8khT/JxwxSf/hKKF12BY5k9VgG9CXylUMW6dpExJgg=
X-Received: by 2002:a1f:c607:0:b0:4c8:8025:f451 with SMTP id
 w7-20020a1fc607000000b004c88025f451mr4256308vkf.12.1708968824456; Mon, 26 Feb
 2024 09:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-2-jaegeuk@kernel.org>
 <68e95cb8-9bf5-4849-befc-bbbe8becfd68@kernel.org>
In-Reply-To: <68e95cb8-9bf5-4849-befc-bbbe8becfd68@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 26 Feb 2024 09:33:33 -0800
Message-ID: <CACOAw_yXZM6MsPpMYWeDSsOgehGSR3=OQc3aOjfMSF8xvn3RpQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Feb 25, 2024 at 6:49 PM Chao Yu wrote: > > On 2024/2/24
    4:55, Jaegeuk Kim wrote: > > Even if the roll forward recovery stopped due
    to any error, we have to fix > > the write pointers in or [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.42 listed in wl.mailspike.net]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1reerO-0003iO-HO
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs: fix write pointers all the time
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBGZWIgMjUsIDIwMjQgYXQgNjo0OeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzIvMjQgNDo1NSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiBF
dmVuIGlmIHRoZSByb2xsIGZvcndhcmQgcmVjb3Zlcnkgc3RvcHBlZCBkdWUgdG8gYW55IGVycm9y
LCB3ZSBoYXZlIHRvIGZpeAo+ID4gdGhlIHdyaXRlIHBvaW50ZXJzIGluIG9yZGVyIHRvIG1vdW50
IHRoZSBkaXNrIGZyb20gdGhlIHByZXZpb3VzIGNoZWNrcG9pbnQuCj4KPiBKYWVnZXVrLAo+Cj4g
SUlVQywgd2UgbWF5IGxvc3Qgd2FybSBub2RlIGNoYWluIG9uY2Ugd2UgYWxsb2NhdGUgbmV3IHNl
Y3Rpb24gZm9yIGFsbCBsb2dzLAo+IHNob3VsZCB3ZSBnaXZlIHNvbWUgbm90aWZpY2F0aW9uIGlu
IGxvZyB0byBpbmRpY2F0ZSBzdWNoIGNvbmRpdGlvbiB0aGF0Cj4gZmlsZXN5c3RlbSBkb2Vzbid0
IHByb2Nlc3MgYSBmdWxsIHJlY292ZXJ5IGZsb3c/Cj4KPiBUaGFua3MsCj4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAg
IGZzL2YyZnMvcmVjb3ZlcnkuYyB8IDIgKy0KPiA+ICAgZnMvZjJmcy9zdXBlci5jICAgIHwgMiAr
LQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9yZWNvdmVyeS5jIGIvZnMvZjJmcy9yZWNvdmVy
eS5jCj4gPiBpbmRleCBiM2JhZWM2NjZhZmUuLjhiYmVjYjVmOTMyMyAxMDA2NDQKPiA+IC0tLSBh
L2ZzL2YyZnMvcmVjb3ZlcnkuYwo+ID4gKysrIGIvZnMvZjJmcy9yZWNvdmVyeS5jCj4gPiBAQCAt
OTEzLDcgKzkxMyw3IEBAIGludCBmMmZzX3JlY292ZXJfZnN5bmNfZGF0YShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIGJvb2wgY2hlY2tfb25seSkKPiA+ICAgICAgICAqIGFuZCB0aGUgZjJmcyBp
cyBub3QgcmVhZCBvbmx5LCBjaGVjayBhbmQgZml4IHpvbmVkIGJsb2NrIGRldmljZXMnCj4gPiAg
ICAgICAgKiB3cml0ZSBwb2ludGVyIGNvbnNpc3RlbmN5Lgo+ID4gICAgICAgICovCj4gPiAtICAg
ICBpZiAoIWVyciAmJiBmaXhfY3Vyc2VnX3dyaXRlX3BvaW50ZXIgJiYgIWYyZnNfcmVhZG9ubHko
c2JpLT5zYikgJiYKPiA+ICsgICAgIGlmIChmaXhfY3Vyc2VnX3dyaXRlX3BvaW50ZXIgJiYgIWYy
ZnNfcmVhZG9ubHkoc2JpLT5zYikgJiYKPiA+ICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3Ni
X2hhc19ibGt6b25lZChzYmkpKSB7Cj4gPiAgICAgICAgICAgICAgIGVyciA9IGYyZnNfZml4X2N1
cnNlZ193cml0ZV9wb2ludGVyKHNiaSk7CgpXZSBtaWdodCBvdmVyd3JpdGUgdGhlIHByZXZpb3Vz
IGVyciB2YWx1ZSBoZXJlIHdpdGggYSBuZXcgZXJyIGZyb20KZjJmc19maXhfY3Vyc2VnX3dyaXRl
X3BvaW50ZXIoKS4KCj4gPiAgICAgICAgICAgICAgIGlmICghZXJyKQo+ID4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4gaW5kZXggMmU0MTE0MmQwN2Mw
Li40ZDAzY2UxMTA5YWQgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+ICsrKyBi
L2ZzL2YyZnMvc3VwZXIuYwo+ID4gQEAgLTQ2NzMsNyArNDY3Myw3IEBAIHN0YXRpYyBpbnQgZjJm
c19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHZvaWQgKmRhdGEsIGludCBzaWxl
bnQpCj4gPiAgICAgICAgKiBJZiB0aGUgZjJmcyBpcyBub3QgcmVhZG9ubHkgYW5kIGZzeW5jIGRh
dGEgcmVjb3Zlcnkgc3VjY2VlZHMsCj4gPiAgICAgICAgKiBjaGVjayB6b25lZCBibG9jayBkZXZp
Y2VzJyB3cml0ZSBwb2ludGVyIGNvbnNpc3RlbmN5Lgo+ID4gICAgICAgICovCj4gPiAtICAgICBp
ZiAoIWVyciAmJiAhZjJmc19yZWFkb25seShzYikgJiYgZjJmc19zYl9oYXNfYmxrem9uZWQoc2Jp
KSkgewo+ID4gKyAgICAgaWYgKCFmMmZzX3JlYWRvbmx5KHNiKSAmJiBmMmZzX3NiX2hhc19ibGt6
b25lZChzYmkpKSB7Cj4gPiAgICAgICAgICAgICAgIGVyciA9IGYyZnNfY2hlY2tfd3JpdGVfcG9p
bnRlcihzYmkpOwoKZGl0dG8KCj4gPiAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBmcmVlX21ldGE7Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
