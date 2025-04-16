Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C85A8AFDB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Apr 2025 07:52:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4vgl-0008Pu-HO;
	Wed, 16 Apr 2025 05:51:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4vgj-0008Pk-BA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Apr 2025 05:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+i8QJ8FyOCtuE1FfGe19TVP8yZaAsc5ADIKnRnH4a4=; b=A3F1zzdaQ5OJbc3gJTjtSzSRY9
 wlun73zV4NHYxeQARapx4ibclPaYqIMZUb522XVJth0nkPBwM7LsdM7xeOloQtcgimOiNRuTpyLh6
 iIXZMItUlFBhRGqM6DTF5fPSd8WTfFLI0Kz8LvcjvOnixPVpOoCsZF6T0lP+7ySSBOR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E+i8QJ8FyOCtuE1FfGe19TVP8yZaAsc5ADIKnRnH4a4=; b=TWHO10VIrMHkO+QpKl7c1VeoOV
 dTBDSkl5njm/uiSTIU5+YuRoaxrX1kSKMjBRKHGqdDbBZA9SJSZyAfkB07Cl8N6RZum0lE19ZQj6L
 JVsAim/htT6Ei9PUW0jgWxyX1/bTKa9v1uoKoh2Y9Jqma5m5RE9hu5HOWt3XFBRQihMg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4vgT-0006kI-IT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Apr 2025 05:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 03D1B44F1A;
 Wed, 16 Apr 2025 05:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70461C4CEE2;
 Wed, 16 Apr 2025 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744782695;
 bh=1saGkjXHyyML+Fj3WZzIMCM0quhvwkyjT4aHq4bj12A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fy3u9ZpSLQtONfw4JvdiEMj7RZEAdn8HnbN5MRUyijobzrwTjfYxmI45RLmmTzhRX
 tKI14WbeG8QyzeWIFeS16sO5kjvlJsQwPps/XnheoN0tUBk4/FhUH+W1GRLV3jKdub
 1OnZuK889sqka2WYEytkfvVd+QjQ+tP9yyURwXn9odauLz71TNwU1HB4GAi7VB/ZH6
 Qe81vHYYW1Z5qNPmI1eFjxwY33iYbFQ9AsySAmORjU1E2V3q3mc0K9GuE1PF9gSWEZ
 /BqT0Z+s1VMea5THUOJIK56eYwb6l2zFCf7W4gXedLne0UZpggu7OF1rSgvigm5xeB
 BMpEbFyWC+bDw==
Message-ID: <8ee817b1-df95-46ee-9207-3b5d13b4e90f@kernel.org>
Date: Wed, 16 Apr 2025 13:51:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <20250414111141.735081-1-chao@kernel.org>
 <CAD14+f0fFTOqjNL3pwi+Ucx2dR2UDhrF15-HgwbaM=Zid5Ge=Q@mail.gmail.com>
 <a51be7d3-ba69-4361-9d01-ea58df86b89c@kernel.org>
 <CAD14+f38jfkMUsoAdVU45fmvbAqdBD4tveXx0ireSX7nr3ZD1Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f38jfkMUsoAdVU45fmvbAqdBD4tveXx0ireSX7nr3ZD1Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/16/25 11:40,
 Juhyung Park wrote: > Just checked gparted's source code: >
 https://github.com/GNOME/gparted/blob/GPARTED_1_7_0/src/f2fs.cc#L135
 > > Seems unlikely. :/ Alright, seems still we need another testcase for
 reproducing. :( 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4vgT-0006kI-IT
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: fix to always change metadata
 for expand resize
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: uplinkr@airmail.cc, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8xNi8yNSAxMTo0MCwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+IEp1c3QgY2hlY2tlZCBncGFy
dGVkJ3Mgc291cmNlIGNvZGU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL0dOT01FL2dwYXJ0ZWQvYmxv
Yi9HUEFSVEVEXzFfN18wL3NyYy9mMmZzLmNjI0wxMzUKPiAKPiBTZWVtcyB1bmxpa2VseS4gOi8K
CkFscmlnaHQsIHNlZW1zIHN0aWxsIHdlIG5lZWQgYW5vdGhlciB0ZXN0Y2FzZSBmb3IgcmVwcm9k
dWNpbmcuIDooCgpUaGFua3MsCgo+IAo+IE9uIFR1ZSwgQXByIDE1LCAyMDI1IGF0IDg6MzTigK9Q
TSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiA0LzE2LzI1IDAzOjI4
LCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4+PiBIbS4KPj4+Cj4+PiBXb3VsZCB0aGlzIGJlIHdoYXQg
QHVwbGlua3IgbWlnaHQgaGF2ZSBlbmNvdW50ZXJlZD8KPj4KPj4gTWF5YmUsIDopCj4+Cj4+IEB1
cGxpbmtyLCBwcmV2aW91c2x5LCBpZiB5b3UgdXNlZCAnLXMnIHBhcmFtZXRlciB3aGlsZSBleHBh
bmQtcmVzaXppbmcsCj4+IHRoYXQgY291bGQgYmUgdGhlIHJlYXNvbiBpdCBjb3JydXB0ZWQgeW91
ciBwYXJ0aXRpb24uCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBPbiBNb24sIEFwciAxNCwgMjAy
NSBhdCA0OjEz4oCvQU0gQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbAo+Pj4gPGxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPj4+Pgo+Pj4+IHcvIGJlbG93
IHRlc3RjYXNlLCByZXNpemUgd2lsbCBnZW5lcmF0ZSBhIGNvcnJ1cHRlZCBpbWFnZSB3aGljaAo+
Pj4+IGNvbnRhaW5zIGluY29uc2lzdGVudCBtZXRhZGF0YToKPj4+Pgo+Pj4+IHRvdWNoIGltZwo+
Pj4+IHRydW5jYXRlIC1zICQoKDUxMioxMDI0KjEwMjQqMTAyNCkpIGltZwo+Pj4+IG1rZnMuZjJm
cyAtZiBpbWcgJCgoMjU2KjEwMjQqMTAyNCkpCj4+Pj4gcmVzaXplLmYyZnMgLXMgaW1nIC10ICQo
KDEwMjQqMTAyNCoxMDI0KSkKPj4+PiBtb3VudCBpbWcgL21udC9mMmZzCj4+Pj4KPj4+PiBbICAg
MzEuNzI1MjAwXSBGMkZTLWZzIChsb29wMCk6IFdyb25nIGJpdG1hcCBzaXplOiBzaXQ6IDE5Miwg
c2l0X2Jsa19jbnQ6NDc2Mgo+Pj4+IFsgICAzMS43Mjg0NDFdIEYyRlMtZnMgKGxvb3AwKTogRmFp
bGVkIHRvIGdldCB2YWxpZCBGMkZTIGNoZWNrcG9pbnQKPj4+Pgo+Pj4+IFRoZSByb290IGNhdXNl
IGlzIHNhZmUgbW9kZSAodmlhIC1zIG9wdGlvbikgaXMgbm90IGNvbXBhdGlibGUKPj4+PiB3LyBl
eHBhbmQgcmVzaXplLCBkdWUgdG8gaW4gc2FmZSBtb2RlLCB3ZSB3aWxsIGtlZXAgYWxsIHBhcmFt
ZXRlcnMKPj4+PiByZWxhdGVkIHRvIE5BVCwgU0lULCBTU0EgYXJlYSwgZS5nLiBzaXRfYml0bWFw
X3NpemUsIGhvd2V2ZXIsIHdlCj4+Pj4gd2lsbCB1cGRhdGUgc2VnbWVudF9jb3VudF9tYWluIGFj
Y29yZGluZyBuZXcgcGFydGl0aW9uIHNpemUsIHJlc3VsdAo+Pj4+IGluIHRoZXJlIGlzIG5vIGVu
b3VnaCBzaXRfYml0bWFwIGFuZCBTSVQgYmxvY2tzIHRvIGFkZHJlc3MgdGhlCj4+Pj4gZW50aXJl
IGJsb2NrIGFkZHJlc3Mgb2YgbmV3IHBhcnRpdGlvbi4KPj4+Pgo+Pj4+IEFkZGluZyBhIGNoZWNr
IGNvbmRpdGlvbiB0byBhdm9pZCBleHBhbmRpbmcgcGFydGl0aW9uIGluIHNhZmUKPj4+PiBtb2Rl
LCBhbmQgY2hhbmdlIG1hbnVhbCBhY2NvcmRpbmdseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAgZnNjay9yZXNpemUuYyAg
ICAgfCAxMiArKysrKysrKy0tLS0KPj4+PiAgbWFuL3Jlc2l6ZS5mMmZzLjggfCAgMiArLQo+Pj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9mc2NrL3Jlc2l6ZS5jIGIvZnNjay9yZXNpemUuYwo+Pj4+IGluZGV4
IDFhYjdkNzUuLjU4OTE0ZWMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnNjay9yZXNpemUuYwo+Pj4+ICsr
KyBiL2ZzY2svcmVzaXplLmMKPj4+PiBAQCAtNzU2LDE4ICs3NTYsMjIgQEAgaW50IGYyZnNfcmVz
aXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+Pgo+Pj4+ICAgICAgICAgLyogbWF5IGRp
ZmZlcmVudCBzZWN0b3Igc2l6ZSAqLwo+Pj4+ICAgICAgICAgaWYgKChjLnRhcmdldF9zZWN0b3Jz
ICogYy5zZWN0b3Jfc2l6ZSA+Pgo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGdldF9zYihs
b2dfYmxvY2tzaXplKSkgPCBnZXRfc2IoYmxvY2tfY291bnQpKQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGdldF9zYihsb2dfYmxvY2tzaXplKSkgPCBnZXRfc2IoYmxvY2tfY291bnQpKSB7
Cj4+Pj4gICAgICAgICAgICAgICAgIGlmICghYy5zYWZlX3Jlc2l6ZSkgewo+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEFTU0VSVF9NU0coIk5vdGhpbmcgdG8gcmVzaXplLCBub3cgb25seSBz
dXBwb3J0cyByZXNpemluZyB3aXRoIHNhZmUgcmVzaXplIGZsYWdcbiIpOwo+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPj4+PiAgICAgICAgICAgICAgICAgfSBlbHNlIHsK
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZjJmc19yZXNpemVfc2hyaW5rKHNi
aSk7Cj4+Pj4gICAgICAgICAgICAgICAgIH0KPj4+PiAtICAgICAgIGVsc2UgaWYgKCgoYy50YXJn
ZXRfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPj4+PiArICAgICAgIH0gZWxzZSBpZiAoKChj
LnRhcmdldF9zZWN0b3JzICogYy5zZWN0b3Jfc2l6ZSA+Pgo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGdldF9zYihsb2dfYmxvY2tzaXplKSkgPiBnZXRfc2IoYmxvY2tfY291bnQpKSB8fAo+
Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGMuaWdub3JlX2Vycm9yKQo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGMuaWdub3JlX2Vycm9yKSB7Cj4+Pj4gKyAgICAgICAgICAgICAgIGlm
IChjLnNhZmVfcmVzaXplKSB7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgQVNTRVJUX01T
RygiRXhwYW5kaW5nIHJlc2l6ZSBkb2Vzbid0IHN1cHBvcnQgc2FmZSByZXNpemUgZmxhZyIpOwo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPj4+PiArICAgICAgICAgICAg
ICAgfQo+Pj4+ICAgICAgICAgICAgICAgICByZXR1cm4gZjJmc19yZXNpemVfZ3JvdyhzYmkpOwo+
Pj4+IC0gICAgICAgZWxzZSB7Cj4+Pj4gKyAgICAgICB9IGVsc2Ugewo+Pj4+ICAgICAgICAgICAg
ICAgICBNU0coMCwgIk5vdGhpbmcgdG8gcmVzaXplLlxuIik7Cj4+Pj4gICAgICAgICAgICAgICAg
IHJldHVybiAwOwo+Pj4+ICAgICAgICAgfQo+Pj4+IGRpZmYgLS1naXQgYS9tYW4vcmVzaXplLmYy
ZnMuOCBiL21hbi9yZXNpemUuZjJmcy44Cj4+Pj4gaW5kZXggYmRkYTRmZC4uNWI2ZGFmNSAxMDA2
NDQKPj4+PiAtLS0gYS9tYW4vcmVzaXplLmYyZnMuOAo+Pj4+ICsrKyBiL21hbi9yZXNpemUuZjJm
cy44Cj4+Pj4gQEAgLTY5LDcgKzY5LDcgQEAgU2tpcCBjYXV0aW9uIGRpYWxvZ3VlIGFuZCByZXNp
emUgcGFydGl0aW9uIGRpcmVjdGx5Lgo+Pj4+ICBTcGVjaWZ5IHN1cHBvcnQgd3JpdGUgaGludC4K
Pj4+PiAgLlRQCj4+Pj4gIC5CSSBcLXMKPj4+PiAtRW5hYmxlIHNhZmUgcmVzaXplLgo+Pj4+ICtF
bmFibGUgc2FmZSByZXNpemUsIGl0IGNhbiBvbmx5IGJlIHVzZWQgdy8gc2hyaW5rIHJlc2l6ZS4K
Pj4+PiAgLlRQCj4+Pj4gIC5CSSBcLVYKPj4+PiAgUHJpbnQgdGhlIHZlcnNpb24gbnVtYmVyIGFu
ZCBleGl0Lgo+Pj4+IC0tCj4+Pj4gMi40OS4wCj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo+PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
