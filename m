Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BE3AACECD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 22:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uBn15rVm9uMenDA202clVVYZz43KZsDR1EVZ3O/WYk=; b=ZUxl8qlugNFHUI8NbzRhwZ3A98
	Jv0waavmfylsLPjQNd/yC6zAUzYB1UdPAqXJPNKkUwQdHwqF3KoSuoOGXEXfr7ZgvJVCLDy36hnA2
	TCNNkqDyIGNReAFagXdkOgtJqsF1dpayQjcXM3b9j+NKgDZmPPJ6xlbwnlDX91ucz3BY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCOrZ-0001ro-B4;
	Tue, 06 May 2025 20:26:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uCOrY-0001rY-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 20:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlnfEmpHUY8kY2niHLOjtjnv0D8DMZABGlYqrDQFq7A=; b=BTjUSJVUm4bTFCSSk62WXdtq7V
 PWbmWhqfZogXDKp9+HOgNhsua2bHxwgxhTdFAANqnvN6vT8eq0TobBy1UA5AzJpXpj3HxA+bvL2n+
 gNS+WLxZe97rhNTTMKisxRsC545iyKbEGLUlIXoCcP2TZw0KvZAXhPIk8cLOlVS2Idlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IlnfEmpHUY8kY2niHLOjtjnv0D8DMZABGlYqrDQFq7A=; b=kiKBssUdpe1Srp6ynERkrMrjK8
 iOHhpe8hBxkpdYdiVHohHFQIaO/zC92gZ2OfAnbOUjEjyTvOy8ZiTvBH3VEpKHHM+01XTWBNvCzpZ
 7SeV5dRzdBdsOPoXAnfbN9+5x5RVqA5vxQZJpAyauGtYjJ+ZL3C5gEELl9SyH+Ut5bSs=;
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uCOrI-00089Y-I7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 20:26:00 +0000
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4c4d8638e07so1755073137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746563133; x=1747167933; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IlnfEmpHUY8kY2niHLOjtjnv0D8DMZABGlYqrDQFq7A=;
 b=PL1QJPgQ3Bib+9+SEgrTH9iR4c3LMmM7SMQrnQuwQOad+9EsWCknykToiY4RxSlXKu
 lnYSBKg5X+2qkfefj5p+xkZRBizSWP+kC3gthAf3KA9pnZp9YGcOF3gn/LvmghlYDC/l
 HqYH8taNThsSbz8NTzbcn636ya80Ec8FEF+9uygxo8ryDSqDJUZuukMFDOPKCNADzCF3
 tlKs/+oi5a2abjwxDn15e+bjbyarexG4juqUpFR67eUDR++trO8h3nijxvCdOcsw0Lw1
 IbL5W/h79ZMAzKgAfj0NCzglLEsdrDY0p3Z228jiGhmMDkeBXka5WLmHzuQB62qlelb6
 oP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746563133; x=1747167933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IlnfEmpHUY8kY2niHLOjtjnv0D8DMZABGlYqrDQFq7A=;
 b=dP+Z9cQlMfwl7dd0jQidNtXfG6ja+5Dc0JKGeNR1GG7WAKleBh0tlOO6kU7WonX31X
 nyHotu9ra2DYBAEKwKh3YwqNVzInQsDNKb3J+/VbujnItgOVhpfn6fU4sSYTv7yVIK93
 kF43MdFxOsKoI/1FWya+mqDLncVHHiJfxI2As11xBsvefSymIMjaBvYGeinp5K+0Yrkc
 0jNUu6q2NecwyBpmv6YO6voAWLooMz6OfcqzZff6rCp+Gr8lzft/QjcPHoMukMTBUnKw
 eqnsld8JguC4FrvUefMv7RlkEHrwasr6Dvi6ggsY9XBSCB4SrEqb4Oss8SWIVP6G50Xv
 /QSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsu2h/U13dYV/QXpqbTwDdnUMKSgqex+SX3GAnMlc04HAKccDTYM+wYiyRTTjLPgBqRZqgoKDluFYAh6JJKwI9@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx1RMcF5nXPVP+78q75KbbVIEn0u5H7W0cTX7bBMclGsArFaie3
 QCCFsSNI8i67ZM3thzgaBfgqZyoT+zb7QNd6Z55uHI16eGWvJCsC1sBtcKc/cG6AW4Kop1MsIMD
 e+VvcHZkmYxXxAy/EfxGTKUbWSqk=
X-Gm-Gg: ASbGncudpWWqxb0FGT6LgtHwABzCVsX/tSWl7vCe8TjR45QYg6dZGDyyWa0n9aqgOEl
 lpLK+X+wjGyfSxVJiZ4DCcpBtdaIyRNjqh8gbboSaO4R1VjYeQcLmTIZ5FXPJE/jmOY7AKbaNEt
 mwTM0EC078rI9CaK2SMjvKvKXZICCwLG0pccsRrbn4aMScMlF5
X-Google-Smtp-Source: AGHT+IHUvIzlPkIU7lOI+Feh/5YuaNt7AJXOfDBPYz1qRlXtoG5cae2jMdSP6YFru2DlNtUqWV0P5rbJ9Ps2z7xhNgU=
X-Received: by 2002:a05:6102:80a2:b0:4c1:9780:3830 with SMTP id
 ada2fe7eead31-4dc738d3f53mr925470137.23.1746563133428; Tue, 06 May 2025
 13:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250506070210.539539-1-chao@kernel.org>
In-Reply-To: <20250506070210.539539-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 6 May 2025 13:25:21 -0700
X-Gm-Features: ATxdqUFE0T50OHEB5NC2BsFQavHycvybb8rxlNatv2Iuqz594NYNiCR7SYQk1pc
Message-ID: <CACOAw_xzP+dfhhFsOLTOagU-QPeUUOzSpyZLO7dArvAe4F8H8g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, May 6, 2025 at 12:05 AM Chao Yu via Linux-f2fs-devel
    wrote: > > This is a regression testcase to check whether we will handle
   database > inode dirty status correctly: > 1. mount f2fs image [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.47 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.47 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1uCOrI-00089Y-I7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/013: test to check potential
 corruption on atomic_write file
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
 Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXkgNiwgMjAyNSBhdCAxMjowNeKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IFRoaXMgaXMgYSByZWdyZXNzaW9uIHRlc3RjYXNlIHRvIGNoZWNrIHdoZXRoZXIgd2Ugd2lsbCBo
YW5kbGUgZGF0YWJhc2UKPiBpbm9kZSBkaXJ0eSBzdGF0dXMgY29ycmVjdGx5Ogo+IDEuIG1vdW50
IGYyZnMgaW1hZ2Ugdy8gdGltZW91dCBmYXVsdCBpbmplY3Rpb24gb3B0aW9uCj4gMi4gY3JlYXRl
IGEgcmVndWxhciBmaWxlLCBhbmQgd3JpdGUgZGF0YSBpbnRvIHRoZSBmaWxlCj4gMy4gc3RhcnQg
dHJhbnNhY3Rpb24gb24gdGhlIGZpbGUgKHZpYSBGMkZTX0lPQ19TVEFSVF9BVE9NSUNfV1JJVEUp
Cj4gNC4gd3JpdGUgdHJhbnNhY3Rpb24gZGF0YSB0byB0aGUgZmlsZQo+IDUuIGNvbW1pdCBhbmQg
ZW5kIHRoZSB0cmFuc2FjdGlvbiAodmlhIEYyRlNfSU9DX0NPTU1JVF9BVE9NSUNfV1JJVEUpCj4g
Ni4gbWVhbndoaWxlIGxvb3AgY2FsbCBmc3luYyBpbiBwYXJhbGxlbAo+IEJlZm9yZSBmMDk4YWVi
YTA0YzkgKCJmMmZzOiBmaXggdG8gYXZvaWQgYXRvbWljaXR5IGNvcnJ1cHRpb24gb2YgYXRvbWlj
Cj4gZmlsZSIpLCBkYXRhYmFzZSBmaWxlIG1heSBiZWNvbWUgY29ycnVwdGVkIGFmdGVyIGF0b21p
YyB3cml0ZSB3aGlsZQo+IHRoZXJlIGlzIGNvbmN1cnJlbnQgZGlydHkgaW5vZGUgZmx1c2ggaW4g
YmFja2dyb3VuZC4KPgo+IENjOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IENj
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiB2MjoKPiAtIGZpeCBkZXNjcmlwdGlvbiBv
ZiB0ZXN0IHN0ZXBzCj4gLSBhZGQgbWlzc2luZyAiX3JlcXVpcmVfa2VybmVsX2NvbmZpZyBDT05G
SUdfRjJGU19GQVVMVF9JTkpFQ1RJT04iCj4gLSBhZGQgbWlzc2luZyAiX3JlcXVpcmVfY29tbWFu
ZCAiJEYyRlNfSU9fUFJPRyIgZjJmc19pbyIKPiAtIHB1dCBjb3JyZWN0IGZpbGVzaXplIGluIHRo
ZSBnb2xkZW4gb3V0cHV0Cj4gIHRlc3RzL2YyZnMvMDEzICAgICB8IDcxICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgdGVzdHMvZjJmcy8wMTMub3V0IHwg
IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDc1NSB0ZXN0cy9mMmZzLzAxMwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8w
MTMub3V0Cj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMTMgYi90ZXN0cy9mMmZzLzAxMwo+
IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gaW5kZXggMDAwMDAwMDAuLjRjZjU2ODQwCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3Rlc3RzL2YyZnMvMDEzCj4gQEAgLTAsMCArMSw3MSBAQAo+ICsjISAv
YmluL2Jhc2gKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsjIENvcHly
aWdodCAoYykgMjAyNSBDaGFvIFl1LiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC4KPiArIwo+ICsjIEZT
IFFBIFRlc3QgTm8uIGYyZnMvMDEzCj4gKyMKPiArIyBUaGlzIGlzIGEgcmVncmVzc2lvbiB0ZXN0
Y2FzZSB0byBjaGVjayB3aGV0aGVyIHdlIHdpbGwgaGFuZGxlIGRhdGFiYXNlCj4gKyMgaW5vZGUg
ZGlydHkgc3RhdHVzIGNvcnJlY3RseToKPiArIyAxLiBtb3VudCBmMmZzIGltYWdlIHcvIHRpbWVv
dXQgZmF1bHQgaW5qZWN0aW9uIG9wdGlvbgo+ICsjIDIuIGNyZWF0ZSBhIHJlZ3VsYXIgZmlsZSwg
YW5kIHdyaXRlIGRhdGEgaW50byB0aGUgZmlsZQo+ICsjIDMuIHN0YXJ0IHRyYW5zYWN0aW9uIG9u
IHRoZSBmaWxlICh2aWEgRjJGU19JT0NfU1RBUlRfQVRPTUlDX1dSSVRFKQo+ICsjIDQuIHdyaXRl
IHRyYW5zYWN0aW9uIGRhdGEgdG8gdGhlIGZpbGUKPiArIyA1LiBjb21taXQgYW5kIGVuZCB0aGUg
dHJhbnNhY3Rpb24gKHZpYSBGMkZTX0lPQ19DT01NSVRfQVRPTUlDX1dSSVRFKQo+ICsjIDYuIG1l
YW53aGlsZSBsb29wIGNhbGwgZnN5bmMgaW4gcGFyYWxsZWwKPiArIyBCZWZvcmUgZjA5OGFlYmEw
NGM5ICgiZjJmczogZml4IHRvIGF2b2lkIGF0b21pY2l0eSBjb3JydXB0aW9uIG9mIGF0b21pYwo+
ICsjIGZpbGUiKSwgZGF0YWJhc2UgZmlsZSBtYXkgYmVjb21lIGNvcnJ1cHRlZCBhZnRlciBhdG9t
aWMgd3JpdGUgd2hpbGUKPiArIyB0aGVyZSBpcyBjb25jdXJyZW50IGRpcnR5IGlub2RlIGZsdXNo
IGluIGJhY2tncm91bmQuCj4gKyMKPiArLiAuL2NvbW1vbi9wcmVhbWJsZQo+ICtfYmVnaW5fZnN0
ZXN0IGF1dG8gcXVpY2sKPiArX3JlcXVpcmVfa2VybmVsX2NvbmZpZyBDT05GSUdfRjJGU19GQVVM
VF9JTkpFQ1RJT04KPiArX3JlcXVpcmVfY29tbWFuZCAiJEYyRlNfSU9fUFJPRyIgZjJmc19pbwo+
ICsKPiArX2NsZWFudXAoKQo+ICt7Cj4gKyAgICAgICBbIC1uICIkYXRvbWljX3dyaXRlX3BpZCIg
XSAmJiBraWxsIC05ICRhdG9taWNfd3JpdGVfcGlkCj4gKyAgICAgICB3YWl0Cj4gKyAgICAgICBj
ZCAvCj4gKyAgICAgICBybSAtciAtZiAkdG1wLioKPiArfQo+ICsKPiArX2ZpeGVkX2J5X2tlcm5l
bF9jb21taXQgZjA5OGFlYmEwNGM5IFwKPiArICAgICAgICJmMmZzOiBmaXggdG8gYXZvaWQgYXRv
bWljaXR5IGNvcnJ1cHRpb24gb2YgYXRvbWljIGZpbGUiCj4gKwo+ICtfcmVxdWlyZV9zY3JhdGNo
Cj4gKwo+ICtfc2NyYXRjaF9ta2ZzID4+ICRzZXFyZXMuZnVsbAo+ICsjIG5vdGUgdGhhdCBpdCBy
ZWxpcyBvbiBGQVVMVF9USU1FT1VUIGZhdWx0IGluamVjdGlvbiBzdXBwb3J0IGluIGYyZnMKCnJl
bGlzIC0+IHJlbGllcwoKPiArX3NjcmF0Y2hfbW91bnQgIi1vIGZhdWx0X2luamVjdGlvbj0xLGZh
dWx0X3R5cGU9NDE5NDMwNCIgPj4gJHNlcXJlcy5mdWxsCj4gKwo+ICtkYmZpbGU9JFNDUkFUQ0hf
TU5UL2ZpbGUuZGIKPiArCj4gKyMgaW5pdGlhbGl6ZSBkYXRhYmFzZSBmaWxlCj4gKyRYRlNfSU9f
UFJPRyAtYyAicHdyaXRlIDAgNGsiIC1jICJmc3luYyIgLWYgJGRiZmlsZSA+PiAkc2VxcmVzLmZ1
bGwKPiArCj4gKyMgc3luYyBmaWxlc3lzdGVtIHRvIGNsZWFyIGRpcnR5IGlub2RlCj4gK3N5bmMK
PiArCj4gKyMgc3RhcnQgYXRvbWljX3dyaXRlIG9uIHNyYy5kYiBkYXRhYmFzZSBmaWxlIGFuZCBj
b21taXQgdHJhbnNhY3Rpb24KPiArJEYyRlNfSU9fUFJPRyB3cml0ZSAxIDAgMiB6ZXJvIGF0b21p
Y19jb21taXQgJGRiZmlsZSA+PiAkc2VxcmVzLmZ1bGwgJgoKSSB0aGluayB3ZSBtaWdodCBoYXZl
IHNvbWUgdGltaW5nIGlzc3VlcyBoZXJlIGxpa2UgYmFja2dyb3VuZCBmMmZzX2lvCmVuZHMgZWFy
bGllciB0aGFuIGZvcmVncm91bmQgZnN5bmMoKSBsb29wLgoKPiArYXRvbWljX3dyaXRlX3BpZD0k
IQo+ICsKPiArIyBjYWxsIGZzeW5jIHRvIGZsdXNoIGRpcnR5IGlub2RlIG9mIGRhdGFiYXNlIGZp
bGUgaW4gcGFyYWxsZWwKPiArZm9yICgoaj0wO2o8MTAwMDtqKyspKSBkbwo+ICsgICAgICAgJEYy
RlNfSU9fUFJPRyBmc3luYyAkZGJmaWxlID4+ICRzZXFyZXMuZnVsbAo+ICtkb25lCj4gKwo+ICt3
YWl0ICRhdG9taWNfd3JpdGVfcGlkCj4gK3Vuc2V0IGF0b21pY193cml0ZV9waWQKPiArCj4gKyMg
Zmx1c2ggZGlydHkgZGF0YSBhbmQgZHJvcCBjYWNoZQo+ICtzeW5jCj4gK2VjaG8gMyA+IC9wcm9j
L3N5cy92bS9kcm9wX2NhY2hlcwo+ICsKPiArc3RhdCAkZGJmaWxlIC1jICVzCj4gKwo+ICtybSAk
ZGJmaWxlCj4gK3N5bmMKPiArCj4gK3N0YXR1cz0wCj4gK2V4aXQKPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvZjJmcy8wMTMub3V0IGIvdGVzdHMvZjJmcy8wMTMub3V0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMC4uZDkyNzFmNzUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdGVz
dHMvZjJmcy8wMTMub3V0Cj4gQEAgLTAsMCArMSwyIEBACj4gK1FBIG91dHB1dCBjcmVhdGVkIGJ5
IDAxMwo+ICs4MTkyCj4gLS0KPiAyLjQ5LjAKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
