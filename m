Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0C96FC9F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 22:23:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smfUW-0001Bk-HE;
	Fri, 06 Sep 2024 20:23:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1smfUU-0001Bd-JM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 20:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A++Z791gkjq6QACDFHzJLpLm7CT3//vqJgMU5AApAas=; b=Il8/fRUS4RYsWwC/xs7mjWR0g0
 6fpAQGt+dp75JAQNYIm95Xeo9gXdITDWcCYwIy67E9Y3l7+hnaDz/or6r1C4swSt7UlPAdrAezaSa
 z92LsO3Z27ll0jwecMIVqXa3C/JlywN3CnGW9JTYKaLnnNjmtN1hr1RSdrxjAw/Twftc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A++Z791gkjq6QACDFHzJLpLm7CT3//vqJgMU5AApAas=; b=aEs5GElPNc6+2xKZe5LQRZO770
 /FNBTT0m+GiZ/g2t68L8+JGnDUR1VB1kdhbkwXUzLuDpnux1uVCMoHxKbXZXMAjxbBoJUdxOXmIVG
 LPWWJ7H19XfhIlwRiSqu3VljQEPZVlgKOo0NxPM5v3BgfTzStN0PN1JEywQ0lwsbdmGc=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1smfUT-0003pi-88 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 20:23:33 +0000
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-49bbed1dad5so715652137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Sep 2024 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725654202; x=1726259002; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A++Z791gkjq6QACDFHzJLpLm7CT3//vqJgMU5AApAas=;
 b=BeK3BRgbZKLuVgS8ijCqf0ex/Az+3c6JJ4H3rog4KNPcQbKcqxX6qaPenn0+F1mD/o
 WgFWRf3ohpESA8nSDltmYPEvb5+3Fc14UuTOkqvABWPY3aurl5nZsG440iUydYxjTMaM
 DnyWLGzd4iEEkkpf7hzCWiEt7YrbBVhMP7bIDdKh+ejaBTFpZv4CDwmbWmuGuJdkAeSr
 4WtD6xDjYltEQR3/OHO1LincgAFTkbG0FD1df6vNbGnXfFqSQyvlXmvuNuOlTAjWGpvC
 xiXZjjenqW7kVGeHtwJKxOPYTEMuuW7fhAdjAzsd0gacN1ZTa/ijKyzounk7u5kZUMxU
 QNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725654202; x=1726259002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A++Z791gkjq6QACDFHzJLpLm7CT3//vqJgMU5AApAas=;
 b=B09x3Gpvdu58EIqBwr1zL82ictSo9F9Z34ZZJDYLA1ZM7IxUJEAxNBYCuxLi4PKQsc
 AOn77PjlQNLboJ3va+MaPYnczhOPlNY+zBvuMge5s7+bpU6GHJq5pLmlEtKp52iQmtCP
 Z2PfrKvarwk0XuIVjOVXt8DpcQqhZsr6Dl5oVArllK+AFn09HFQKBhweM17fscczQlA3
 dbB4jNP51erY5c94e6biL8ilTseXpGvdxbCFOnwGRr7n8rmgKJ9eluPdFQyXJj4N4n13
 iM26xTZR7zx7hygJnkK0Q8Q/Lndif2D9LLPlClFFUCW4jth9+8sarAiPUXDoW/RK7AYF
 LyHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Eid4Mo6k24eHa0XQikY5yatU0ypCwLMkWJNu21wj5MRYg2KPQRpPtMdfbh8GBRG8Z2MZgSATwxv+iHEFsbBa@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxqdV6vNLchacm+h7XDsXO8WIgQ7bXMFmWyaxrXcrUu+v+9y9Sz
 eZTBS3qPf5lggeyWc8OXaKnZtOHHPacmB7w6ZC8m7XVb+DK//JDd4/M+ETtthPeWmmDQaDzEzpR
 D82lFw93JiQ5peprf51HPxy9wUeY=
X-Google-Smtp-Source: AGHT+IGFEDLHyafKDrN6fpuRLiKotM6Jf0bh+gYC99xcBWlyl5uETSjcE8noSLRFUgpdtqWo+5Zh/bpk8kjcNhuiRxw=
X-Received: by 2002:a05:6102:509e:b0:498:d12b:4774 with SMTP id
 ada2fe7eead31-49beccf629cmr569574137.7.1725654202146; Fri, 06 Sep 2024
 13:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-2-daeho43@gmail.com>
 <501416af-b08c-448b-881d-0915575e22f5@kernel.org>
In-Reply-To: <501416af-b08c-448b-881d-0915575e22f5@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 6 Sep 2024 13:23:11 -0700
Message-ID: <CACOAw_wgTOAQGJ3vbvp_Dqi_J0ZEsqWRFny-iczpyMD=kpxG-w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Sep 5, 2024 at 7:56 PM Chao Yu wrote: > > On 2024/8/30
    5:52, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Now we do readahead
    for a full section by not considering > > migration_gran [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1smfUT-0003pi-88
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: read summary blocks with the
 correct amount for migration_granularity
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

T24gVGh1LCBTZXAgNSwgMjAyNCBhdCA3OjU24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvOC8zMCA1OjUyLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZy
b206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gTm93IHdlIGRv
IHJlYWRhaGVhZCBmb3IgYSBmdWxsIHNlY3Rpb24gYnkgbm90IGNvbnNpZGVyaW5nCj4gPiBtaWdy
YXRpb25fZ3JhbnVsYXJpdHkgYW5kIGl0IHRyaWdnZXJzIHVubmVjZXNzYXJ5IHJlYWQuIFNvLCBt
YWtlIGl0IHJlYWQKPiA+IHdpdGggdGhlIGNvcnJlY3QgYW1vdW50Lgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICAg
ZnMvZjJmcy9nYy5jIHwgMzMgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4gPiBpbmRleCA0NmUz
YmMyNmI3OGEuLmI1ZDNmZDQwYjE3YSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ID4g
KysrIGIvZnMvZjJmcy9nYy5jCj4gPiBAQCAtMTcwOCwyNCArMTcwOCwzMyBAQCBzdGF0aWMgaW50
IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiAgICAgICBz
dHJ1Y3QgYmxrX3BsdWcgcGx1ZzsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBzZWdubyA9IHN0YXJ0
X3NlZ25vOwo+ID4gICAgICAgdW5zaWduZWQgaW50IGVuZF9zZWdubyA9IHN0YXJ0X3NlZ25vICsg
U0VHU19QRVJfU0VDKHNiaSk7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgc2VjX2VuZF9zZWdubzsK
PiA+ICAgICAgIGludCBzZWdfZnJlZWQgPSAwLCBtaWdyYXRlZCA9IDA7Cj4gPiAgICAgICB1bnNp
Z25lZCBjaGFyIHR5cGUgPSBJU19EQVRBU0VHKGdldF9zZWdfZW50cnkoc2JpLCBzZWdubyktPnR5
cGUpID8KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
VU1fVFlQRV9EQVRBIDogU1VNX1RZUEVfTk9ERTsKPiA+ICAgICAgIHVuc2lnbmVkIGNoYXIgZGF0
YV90eXBlID0gKHR5cGUgPT0gU1VNX1RZUEVfREFUQSkgPyBEQVRBIDogTk9ERTsKPiA+ICAgICAg
IGludCBzdWJtaXR0ZWQgPSAwOwo+ID4KPiA+IC0gICAgIGlmIChfX2lzX2xhcmdlX3NlY3Rpb24o
c2JpKSkKPiA+IC0gICAgICAgICAgICAgZW5kX3NlZ25vID0gcm91bmRkb3duKGVuZF9zZWdubywg
U0VHU19QRVJfU0VDKHNiaSkpOwo+ID4gKyAgICAgaWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkp
KSB7Cj4gPiArICAgICAgICAgICAgIHNlY19lbmRfc2Vnbm8gPSByb3VuZGRvd24oZW5kX3NlZ25v
LCBTRUdTX1BFUl9TRUMoc2JpKSk7Cj4gPgo+ID4gLSAgICAgLyoKPiA+IC0gICAgICAqIHpvbmUt
Y2FwYWNpdHkgY2FuIGJlIGxlc3MgdGhhbiB6b25lLXNpemUgaW4gem9uZWQgZGV2aWNlcywKPiA+
IC0gICAgICAqIHJlc3VsdGluZyBpbiBsZXNzIHRoYW4gZXhwZWN0ZWQgdXNhYmxlIHNlZ21lbnRz
IGluIHRoZSB6b25lLAo+ID4gLSAgICAgICogY2FsY3VsYXRlIHRoZSBlbmQgc2Vnbm8gaW4gdGhl
IHpvbmUgd2hpY2ggY2FuIGJlIGdhcmJhZ2UgY29sbGVjdGVkCj4gPiAtICAgICAgKi8KPiA+IC0g
ICAgIGlmIChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+ID4gLSAgICAgICAgICAgICBlbmRf
c2Vnbm8gLT0gU0VHU19QRVJfU0VDKHNiaSkgLQo+ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAg
ICAgICAgICAgICAgKiB6b25lLWNhcGFjaXR5IGNhbiBiZSBsZXNzIHRoYW4gem9uZS1zaXplIGlu
IHpvbmVkIGRldmljZXMsCj4gPiArICAgICAgICAgICAgICAqIHJlc3VsdGluZyBpbiBsZXNzIHRo
YW4gZXhwZWN0ZWQgdXNhYmxlIHNlZ21lbnRzIGluIHRoZSB6b25lLAo+ID4gKyAgICAgICAgICAg
ICAgKiBjYWxjdWxhdGUgdGhlIGVuZCBzZWdubyBpbiB0aGUgem9uZSB3aGljaCBjYW4gYmUgZ2Fy
YmFnZQo+ID4gKyAgICAgICAgICAgICAgKiBjb2xsZWN0ZWQKPiA+ICsgICAgICAgICAgICAgICov
Cj4gPiArICAgICAgICAgICAgIGlmIChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHNlY19lbmRfc2Vnbm8gLT0gU0VHU19QRVJfU0VDKHNiaSkgLQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3VzYWJsZV9zZWdz
X2luX3NlYyhzYmksIHNlZ25vKTsKPiA+Cj4gPiArICAgICAgICAgICAgIGlmIChnY190eXBlID09
IEJHX0dDKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVuZF9zZWdubyA9IHN0YXJ0X3NlZ25v
ICsgc2JpLT5taWdyYXRpb25fZ3JhbnVsYXJpdHk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGlm
IChlbmRfc2Vnbm8gPiBzZWNfZW5kX3NlZ25vKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVu
ZF9zZWdubyA9IHNlY19lbmRfc2Vnbm87Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICBzYW5p
dHlfY2hlY2tfc2VnX3R5cGUoc2JpLCBnZXRfc2VnX2VudHJ5KHNiaSwgc2Vnbm8pLT50eXBlKTsK
PiA+Cj4gPiAgICAgICAvKiByZWFkYWhlYWQgbXVsdGkgc3NhIGJsb2NrcyB0aG9zZSBoYXZlIGNv
bnRpZ3VvdXMgYWRkcmVzcyAqLwo+ID4gQEAgLTE3NjIsOSArMTc3MSw2IEBAIHN0YXRpYyBpbnQg
ZG9fZ2FyYmFnZV9jb2xsZWN0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Cj4gPiAgICAg
ICAgICAgICAgIGlmIChnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIGZhbHNlKSA9PSAwKQo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZnJlZWQ7Cj4gPiAtICAgICAgICAgICAgIGlm
IChnY190eXBlID09IEJHX0dDICYmIF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYmCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtaWdyYXRlZCA+PSBzYmktPm1pZ3JhdGlvbl9ncmFu
dWxhcml0eSkKPgo+IEl0IHNlZW1zIHdlIGNoYW5nZSB0aGUgbG9naWMgZnJvbSBtaWdyYXRpbmcg
Im1pZ3JhdGlvbl9ncmFudWxhcml0eSIgc2VnbWVudHMgd2hpY2gKPiBoYXMgdmFsaWQgYmxvY2tz
IHRvIHNjYW5uaW5nICJtaWdyYXRpb25fZ3JhbnVsYXJpdHkiIHNlZ21lbnRzIGFuZCB0cnkgbWln
cmF0aW5nCj4gdmFsaWQgYmxvY2tzIGluIHRob3NlIHNlZ21lbnRzLgo+Cj4gSUlVQywgd2hlbiBi
YWNrZ3JvdW5kIEdDIHJlY3ljbGUgc3BhcnNlIHpvbmUsIGl0IHdpbGwgdGFrZSBnYyB0aHJlYWQg
bW9yZSByb3VuZCwKPiBpdCBzZWVtcyBsb3cgZWZmaWNpZW50LiBIb3cgZG8geW91IHRoaW5rIG9m
IGtlZXBpbmcgcHJldmlvdXMgaW1wbGVtZW50YXRpb24/CgpJIGdvdCB5b3VyIHBvaW50LiBIb3dl
dmVyLCB3aXRoIHpvbmVkIGRldmljZXMgaGF2aW5nIDFHQiBzZWN0aW9ucywgcGVyCmV2ZXJ5IHJv
dW5kLCB3ZSBzaG91bGQKdG91Y2ggYWxtb3N0IDJNQiBzaXplIG9mIHNzYSBibG9jayBwYWdlcywg
ZXZlbiB0aG91Z2ggd2UgZGlkbid0IG5lZWQKdG8gZG8gaXQuIE1heWJlLCB3ZSBjYW4gaW50cm9k
dWNlCmFub3RoZXIgc3lzZnMgbm9kZSBsaWtlIG1pZ3JhdGlvbl93aW5kb3dfbGltaXQsIHdoaWNo
IGNhbiBiZSBzZXQgYXMKZG91YmxlIGFzIG1pZ3JhdGlvbl9ncmFudWFsaXR5IGJ5IGRlZmF1bHQs
CmxpbWl0aW5nIHRoZSBzaXplIG9mIHNjYW5uaW5nLgoKPgo+IFRoYW5rcywKPgo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gc2tpcDsKPiA+ICAgICAgICAgICAgICAgaWYgKCFQYWdlVXB0
b2RhdGUoc3VtX3BhZ2UpIHx8IHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBza2lwOwo+ID4KPiA+IEBAIC0xODAzLDcgKzE4MDksOCBA
QCBzdGF0aWMgaW50IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
Cj4gPgo+ID4gICAgICAgICAgICAgICBpZiAoX19pc19sYXJnZV9zZWN0aW9uKHNiaSkpCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV0gPQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHNlZ25vICsgMSA8IGVuZF9zZWdubykgPyBz
ZWdubyArIDEgOiBOVUxMX1NFR05POwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KHNlZ25vICsgMSA8IHNlY19lbmRfc2Vnbm8pID8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2Vnbm8gKyAxIDogTlVMTF9TRUdOTzsKPiA+ICAgc2tpcDoKPiA+ICAg
ICAgICAgICAgICAgZjJmc19wdXRfcGFnZShzdW1fcGFnZSwgMCk7Cj4gPiAgICAgICB9Cj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
