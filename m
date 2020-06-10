Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C266D1F4BF4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2020 05:56:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jirqS-0000gM-5n; Wed, 10 Jun 2020 03:56:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jirqQ-0000g6-MG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jun 2020 03:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LyohQNqu19/pcwWiEv/7VNRgqg1PzPVrbL993SF8gqE=; b=Yza466MHwS+Gb+A48mHaJOcedR
 n96ILxiMGs1U1cW36NDwpHtpOcLMSdbAML9iNAsOr2XJHyZOS11NXdOStxR0Rp2Qg1+DAO3U7QyRj
 LXlsw2xWkmLumgCYMBOS0DYi9o+BHMpUmf2htb7JRIMGy66f9JEk2HrhV53aVrtzIWm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LyohQNqu19/pcwWiEv/7VNRgqg1PzPVrbL993SF8gqE=; b=LdufsYpGogi/v2CW11P/+yWmL/
 wFGPi7Kf8JVXqKmPe43IMMX9bAk3bt7gB0aqEDozfe9RYAzJFCS3AZNZeuzXe/0JZ17tkbbXmexjQ
 3GEQaZwA7ZJdhDyI6E+qwh9zOzaRcpi8l/xDqm9F7CsPxZiI6O5VrOuVHSYk+3ftd6fI=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jirqP-00FIaD-Dc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jun 2020 03:56:06 +0000
Received: by mail-lf1-f68.google.com with SMTP id j12so619857lfh.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Jun 2020 20:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LyohQNqu19/pcwWiEv/7VNRgqg1PzPVrbL993SF8gqE=;
 b=IFp/5CtLi2alU8l/K+OHxs5bHP8Agi8nfUucQLBFC8sB6hUz8dT0I9bHkwblGtmykz
 K4yalvg3vZIre93sHa8v7QUr8UxUJqiBshgM0WQtYVx4RfRzuoAQTlKlwxy352KEY8I8
 YMavy+SnPdZ3z+weUjY26SRZRgOxOSdgjbpw0NxnBRJpXU3vOTRAijEmDoXorScn47Hx
 6b9ObMQ7yPIlWEadXWsdw02VeNVfmW3duX7gTgX5xJcphMUCaT+ptbNik/7P38P7tNZL
 khtoCm91hoPxdcLdyT7yvWRdXVdTmt0F51+q5AU8p26nPqeit/50Zt4QxK1deKcjNyZn
 DbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LyohQNqu19/pcwWiEv/7VNRgqg1PzPVrbL993SF8gqE=;
 b=bj1SF9mb3Rm0pNJjpNkZnlqmKtvnDz5QtJTDUkiwH38RxvDddgvm5XLiYUSHtP/+LZ
 ZrHDBJChDaXnZYJwoan+Sj0Dmc3FqYVxCzFhhQfTx8ttcxdoCVtUdmUkqeKXW/PvuW89
 0A7X8toAOIB/DIuBc4nO+/O9OkhNPmD98FHdLB+KoDBlbEsHHSMv68OrhGDzJyrw8Eg/
 NuG+nc7acKHt99IisesezsUwEb9DdZ268IZ2/Fc+HIdORSgf65kH8Lvyx2yjPhCnTmdd
 CxwVSelXXSwIzcNlQ/zjZB14w3p6l5LBMMDB0RfRSJBww3GKl7mgv39j86fiEZWVOLgm
 +UvQ==
X-Gm-Message-State: AOAM533hSo2bdFRmg1vikDLi4z+d6iNGNldkf36hk4KkgnSVlhgjzwn7
 vFjeMxpQDWHJ9NCn1f9F5G06KSwdrfTfgqmU6yc=
X-Google-Smtp-Source: ABdhPJyFvJC6hVhB4rAaWYb88C7PfzMZEw1pcHZPrgnRLlbqgobGbXETdY9gOPq/Ea1Ul5AxRba/0bqAg20Tq41W1LU=
X-Received: by 2002:a19:fc15:: with SMTP id a21mr550019lfi.121.1591761351353; 
 Tue, 09 Jun 2020 20:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200609060137.143501-1-daeho43@gmail.com>
 <20200609165107.GA228564@gmail.com>
 <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
 <20200610031532.GA6286@sol.localdomain>
In-Reply-To: <20200610031532.GA6286@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 10 Jun 2020 12:55:40 +0900
Message-ID: <CACOAw_wErOPC=Kf3UU8nFGhWRy84ZnCeJbsyPhSCcXv51B_XxQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jirqP-00FIaD-Dc
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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

PiA+Cj4gPiBUbyBwcmV2ZW50IHRoZSBmaWxlIGRhdGEgZnJvbSBnYXJiYWdlIGNvbGxlY3Rpbmcs
IHRoZSB1c2VyIG5lZWRzIHRvCj4gPiB1c2UgcGluZmlsZSBpb2N0bCBhbmQgZmFsbG9jYXRlIHN5
c3RlbSBjYWxsIGFmdGVyIGNyZWF0aW5nIHRoZSBmaWxlLgo+ID4gVGhlIHNlcXVlbmNlIGlzIGxp
a2UgYmVsb3cuCj4gPiAxLiBjcmVhdGUgYW4gZW1wdHkgZmlsZQo+ID4gMi4gcGluZmlsZQo+ID4g
My4gZmFsbG9jYXRlKCkKPgo+IElzIHRoYXQgcGVyc2lzdGVudD8gIFNvIHRoZSBmaWxlIHdpbGwg
bmV2ZXIgYmUgbW92ZWQgYWZ0ZXJ3YXJkcz8KPgo+IElzIHRoZXJlIGEgcGxhY2Ugd2hlcmUgdGhp
cyBpcyAob3Igc2hvdWxkIGJlKSBkb2N1bWVudGVkPwoKWWVzLCB0aGlzIGlzIHBlcnNpc3RlbnQu
IEYyRlNfSU9DX1NFVF9QSU5fRklMRSBpb2N0bCBpcyB0byBwcmV2ZW50CmZpbGUgZGF0YSBmcm9t
IG1vdmluZyBhbmQgYmVpbmcgZ2FyYmFnZSBjb2xsZWN0ZWQsIGFuZCBmdXJ0aGVyIHVwZGF0ZQp0
byB0aGUgZmlsZSB3aWxsIGJlIGhhbmRsZWQgaW4gaW4tcGxhY2UgdXBkYXRlIG1hbm5lci4KSSBk
b24ndCBzZWUgYW55IGRvY3VtZW50IG9uIHRoaXMsIGJ1dCB5b3UgY2FuIGZpbmQgdGhlIGJlbG93
IGluCkRvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5yc3QKCkhvd2V2ZXIsIG9uY2UgRjJG
UyByZWNlaXZlcyBpb2N0bChmZCwgRjJGU19JT0NfU0VUX1BJTl9GSUxFKSBpbiBwcmlvciB0bwpm
YWxsb2NhdGUoZmQsIERFRkFVTFRfTU9ERSksIGl0IGFsbG9jYXRlcyBvbi1kaXNrIGJsb2NrcyBh
ZGRyZXNzZXMgaGF2aW5nCnplcm8gb3IgcmFuZG9tIGRhdGEsIHdoaWNoIGlzIHVzZWZ1bCB0byB0
aGUgYmVsb3cgc2NlbmFyaW8gd2hlcmU6CgogMS4gY3JlYXRlKGZkKQogMi4gaW9jdGwoZmQsIEYy
RlNfSU9DX1NFVF9QSU5fRklMRSkKIDMuIGZhbGxvY2F0ZShmZCwgMCwgMCwgc2l6ZSkKIDQuIGFk
ZHJlc3MgPSBmaWJtYXAoZmQsIG9mZnNldCkKIDUuIG9wZW4oYmxrZGV2KQogNi4gd3JpdGUoYmxr
ZGV2LCBhZGRyZXNzKQoKPiBSaWdodCwgdGhlIGZyZWV6aW5nIGNoZWNrIGlzIGFjdHVhbGx5IHN0
aWxsIG5lY2Vzc2FyeS4gIEJ1dCBnZXR0aW5nIHdyaXRlIGFjY2Vzcwo+IHRvIHRoZSBtb3VudCBp
cyBub3QgbmVjZXNzYXJ5LiAgSSB0aGluayB5b3Ugc2hvdWxkIHVzZSBmaWxlX3N0YXJ0X3dyaXRl
KCkgYW5kCj4gZmlsZV9lbmRfd3JpdGUoKSwgbGlrZSB2ZnNfd3JpdGUoKSBkb2VzLgoKWWVzLCBh
Z3JlZWQuCgoyMDIw64WEIDbsm5QgMTDsnbwgKOyImCkg7Jik7ZuEIDEyOjE1LCBFcmljIEJpZ2dl
cnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IE9uIFdlZCwgSnVuIDEw
LCAyMDIwIGF0IDExOjA1OjQ2QU0gKzA5MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPiA+IEFk
ZGVkIGEgbmV3IGlvY3RsIHRvIHNlbmQgZGlzY2FyZCBjb21tYW5kcyBvci9hbmQgemVybyBvdXQK
PiA+ID4gPiB0byB3aG9sZSBkYXRhIGFyZWEgb2YgYSByZWd1bGFyIGZpbGUgZm9yIHNlY3VyaXR5
IHJlYXNvbi4KPiA+ID4KPiA+ID4gV2l0aCB0aGlzIGlvY3RsIGF2YWlsYWJsZSwgd2hhdCBpcyB0
aGUgZXhhY3QgcHJvY2VkdXJlIHRvIHdyaXRlIGFuZCB0aGVuIGxhdGVyCj4gPiA+IHNlY3VyZWx5
IGVyYXNlIGEgZmlsZSBvbiBmMmZzPyAgSW4gcGFydGljdWxhciwgaG93IGNhbiB0aGUgdXNlciBw
cmV2ZW50IGYyZnMKPiA+ID4gZnJvbSBtYWtpbmcgbXVsdGlwbGUgY29waWVzIG9mIGZpbGUgZGF0
YSBibG9ja3MgYXMgcGFydCBvZiBnYXJiYWdlIGNvbGxlY3Rpb24/Cj4gPiA+Cj4gPgo+ID4gVG8g
cHJldmVudCB0aGUgZmlsZSBkYXRhIGZyb20gZ2FyYmFnZSBjb2xsZWN0aW5nLCB0aGUgdXNlciBu
ZWVkcyB0bwo+ID4gdXNlIHBpbmZpbGUgaW9jdGwgYW5kIGZhbGxvY2F0ZSBzeXN0ZW0gY2FsbCBh
ZnRlciBjcmVhdGluZyB0aGUgZmlsZS4KPiA+IFRoZSBzZXF1ZW5jZSBpcyBsaWtlIGJlbG93Lgo+
ID4gMS4gY3JlYXRlIGFuIGVtcHR5IGZpbGUKPiA+IDIuIHBpbmZpbGUKPiA+IDMuIGZhbGxvY2F0
ZSgpCj4KPiBJcyB0aGF0IHBlcnNpc3RlbnQ/ICBTbyB0aGUgZmlsZSB3aWxsIG5ldmVyIGJlIG1v
dmVkIGFmdGVyd2FyZHM/Cj4KPiBJcyB0aGVyZSBhIHBsYWNlIHdoZXJlIHRoaXMgaXMgKG9yIHNo
b3VsZCBiZSkgZG9jdW1lbnRlZD8KPgo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBpZiAoZjJmc19y
ZWFkb25seShzYmktPnNiKSkKPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiAtRVJPRlM7Cj4g
PiA+Cj4gPiA+IElzbid0IHRoaXMgcmVkdW5kYW50IHdpdGggbW50X3dhbnRfd3JpdGVfZmlsZSgp
Pwo+ID4gPgo+ID4gPiBBbHNvLCBzaG91bGRuJ3Qgd3JpdGUgYWNjZXNzIHRvIHRoZSBmaWxlIGJl
IHJlcXVpcmVkLCBpLmUuCj4gPiA+IChmaWxwLT5mX21vZGUgJiBGTU9ERV9XUklURSk/ICBUaGVu
IHRoZSBmMmZzX3JlYWRvbmx5KCkgYW5kCj4gPiA+IG1udF93YW50X3dyaXRlX2ZpbGUoKSBjaGVj
a3Mgd291bGQgYmUgdW5uZWNlc3NhcnkuCj4gPiA+Cj4gPgo+ID4gVXNpbmcgRk1PREVfV1JJVEUg
aXMgbW9yZSBwcm9wZXIgZm9yIHRoaXMgY2FzZSwgc2luY2Ugd2UncmUgZ29pbmcgdG8KPiA+IG1v
ZGlmeSB0aGUgZGF0YS4gQnV0IEkgdGhpbmsgbW50X3dhbnRfd3JpdGVfZmlsZSgpIGlzIHN0aWxs
IHJlcXVpcmVkCj4gPiB0byBwcmV2ZW50IHRoZSBmaWxlc3lzdGVtIGZyb20gZnJlZXppbmcgb3Ig
c29tZXRoaW5nIGVsc2UuCj4KPiBSaWdodCwgdGhlIGZyZWV6aW5nIGNoZWNrIGlzIGFjdHVhbGx5
IHN0aWxsIG5lY2Vzc2FyeS4gIEJ1dCBnZXR0aW5nIHdyaXRlIGFjY2Vzcwo+IHRvIHRoZSBtb3Vu
dCBpcyBub3QgbmVjZXNzYXJ5LiAgSSB0aGluayB5b3Ugc2hvdWxkIHVzZSBmaWxlX3N0YXJ0X3dy
aXRlKCkgYW5kCj4gZmlsZV9lbmRfd3JpdGUoKSwgbGlrZSB2ZnNfd3JpdGUoKSBkb2VzLgo+Cj4g
PiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGlmIChnZXRfdXNlcihmbGFncywgKHUzMiBfX3Vz
ZXIgKilhcmcpKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPiA+ID4g
KyAgICAgaWYgKCEoZmxhZ3MgJiBGMkZTX1RSSU1fRklMRV9NQVNLKSkKPiA+ID4gPiArICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPgo+ID4gPiBOZWVkIHRvIHJlamVjdCB1bmtub3du
IGZsYWdzOgo+ID4gPgo+ID4gPiAgICAgICAgIGlmIChmbGFncyAmIH5GMkZTX1RSSU1fRklMRV9N
QVNLKQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPgo+ID4gSSBuZWVk
ZWQgYSBkaWZmZXJlbnQgdGhpbmcgaGVyZS4gVGhpcyB3YXMgdG8gY2hlY2sgbmVpdGhlciBkaXNj
YXJkIG5vcgo+ID4gemVyb2luZyBvdXQgYXJlIG5vdCBoZXJlLiBCdXQgd2Ugc3RpbGwgbmVlZCB0
byBjaGVjayB1bmtub3duIGZsYWdzLAo+ID4gdG9vLgo+ID4gVGhlIGJlbG93IG1pZ2h0IGJlIGJl
dHRlci4KPiA+IGlmICghZmxhZ3MgfHwgZmxhZ3MgJiB+RjJGU19UUklNX0ZJTEVfTUFTSykKPiA+
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IFN1cmUsIGJ1dCBwbGVhc2UgcHV0IHBhcmVudGhl
c2VzIGFyb3VuZCB0aGUgc2Vjb25kIGNsYXVzZToKPgo+ICAgICAgICAgaWYgKGZsYWdzID09IDAg
fHwgKGZsYWdzICYgfkYyRlNfVFJJTV9GSUxFX01BU0spKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPgo+IC0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
