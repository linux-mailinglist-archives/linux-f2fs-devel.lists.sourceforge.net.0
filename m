Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEDCA72A98
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 08:30:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txhh2-00066L-DW;
	Thu, 27 Mar 2025 07:30:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txhh0-00066F-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 07:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P80asywtDrOE8fclpKyAP5P0vQ86qHIbCxzT1qVrf1o=; b=joTnzflACW58mR9jCTwtOV/H7h
 IDLadDrqfEZ5XPiXRzSdr2oIFcLGI45mKP5qnhjMZ40B6wWoDI7WL+H+T+4EjI7dPJySMMBlmQQGX
 bVegJwqn0ZUdfsgO55Hj7gKyiRouwfQJoUmlqMIuz7tPYq/KpvIsEo/Kj9mjSXaexFhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P80asywtDrOE8fclpKyAP5P0vQ86qHIbCxzT1qVrf1o=; b=RXx5jG8qwZqR3zodDQnud1fmL/
 cIcI9hQy7qXONo+Krb7ZrqNxa+wrkBQCsc1Xt9ZAdWrBkbAAWYo/Ry9hfhLI68ApGj9nI0D54YpAB
 k7P6IX2forwx40cLVj9YG6mZNi3sfp4FFOtOFFAZZMpsWJdXLI+sp3PT/ShWMm6XcwRg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txhgp-0008ET-Uw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 07:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3B40BA41C34;
 Thu, 27 Mar 2025 07:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51429C4CEDD;
 Thu, 27 Mar 2025 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743060600;
 bh=ksooDKwMUuHkTaFWvqhnbrlEK7O5z3878QbVilW3idE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TbZAiMcvd2wbBHxnjiQsvrzz5OkyWyRHZYpacKEBBLv/MpCQt7jAWcRYcjyTUTRkh
 o3N029NmzTm84jm8m2l7vh79xaSLkO+H1S7ZjxTJZR/rjlSNyQk4LvVhRskRMPVysF
 NDfAGiJ/vGrwTYJqZI4GbFLuru9ZXW/SY475QpMUXNKe7GocguQzB3RUcCLWsETv3b
 tYjrjzzPRvndtRDRinyg9xFkgXST1Q4HqhuAB9YaIsgldMy+jX6I5mfN4AnyOdePrE
 sZQ456U8RwCbvA3a5jOrozx4sOwTHkKqJw0TQhxuSilJmwY8vaBJlyOIGgTo2Rpnto
 vL38ziYlcNRSg==
Message-ID: <deb42999-df89-471b-a161-e33b97f96b74@kernel.org>
Date: Thu, 27 Mar 2025 15:29:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung@sk.com" <yohan.joung@sk.com>, Yohan Joung
 <jyh429@gmail.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "daeho43@gmail.com" <daeho43@gmail.com>
References: <20250326141428.280-1-yohan.joung@sk.com>
 <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
 <2d95428375bd4a5592516bb6cefe4592@sk.com>
Content-Language: en-US
In-Reply-To: <2d95428375bd4a5592516bb6cefe4592@sk.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/27/25 14:43, yohan.joung@sk.com wrote: >> From: Chao
 Yu <chao@kernel.org> >> Sent: Thursday, March 27, 2025 3:02 PM >> To: Yohan
 Joung <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gmail.com >> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txhgp-0008ET-Uw
Subject: Re: [f2fs-dev] [External Mail] Re: [PATCH] f2fs: prevent the
 current section from being selected as a victim during garbage collection
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
Cc: "pilhyun.kim@sk.com" <pilhyun.kim@sk.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8yNy8yNSAxNDo0MywgeW9oYW4uam91bmdAc2suY29tIHdyb3RlOgo+PiBGcm9tOiBDaGFv
IFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAz
OjAyIFBNCj4+IFRvOiBZb2hhbiBKb3VuZyA8anloNDI5QGdtYWlsLmNvbT47IGphZWdldWtAa2Vy
bmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQo+PiBrZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyDsoJXsmpTtlZwoSk9VTkcgWU9IQU4pIE1vYmlsZSBBRSA8eW9oYW4uam91bmdA
c2suY29tPgo+PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJl
dmVudCB0aGUgY3VycmVudCBzZWN0aW9uCj4+IGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0
aW0gZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbgo+Pgo+PiBPbiAzLzI2LzI1IDIyOjE0LCBZb2hh
biBKb3VuZyB3cm90ZToKPj4+IFdoZW4gc2VsZWN0aW5nIGEgdmljdGltIHVzaW5nIG5leHRfdmlj
dGltX3NlZyBpbiBhIGxhcmdlIHNlY3Rpb24sIHRoZQo+Pj4gc2VsZWN0ZWQgc2VjdGlvbiBtaWdo
dCBhbHJlYWR5IGhhdmUgYmVlbiBjbGVhcmVkIGFuZCBkZXNpZ25hdGVkIGFzIHRoZQo+Pj4gbmV3
IGN1cnJlbnQgc2VjdGlvbiwgbWFraW5nIGl0IGFjdGl2ZWx5IGluIHVzZS4KPj4+IFRoaXMgYmVo
YXZpb3IgY2F1c2VzIGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgU0lUIGFuZCBTU0EuCj4+Cj4+
IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIgaXNzdWU/Cj4gCj4gVGhpcyBpcyBhbiBpc3N1ZSB0aGF0
IGFyaXNlcyB3aGVuIGRpdmlkaW5nIAo+IGEgbGFyZ2Ugc2VjdGlvbiBpbnRvIHNlZ21lbnRzIGZv
ciBnYXJiYWdlIGNvbGxlY3Rpb24uCj4gY2F1c2VkIGJ5IHRoZSBiYWNrZ3JvdW5kIEdDIChnYXJi
YWdlIGNvbGxlY3Rpb24pIHRocmVhZCBpbiBsYXJnZSBzZWN0aW9uCj4gZjJmc19nYyh2aWN0aW1f
c2VjdGlvbikgLT4gZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRzKHZpY3RpbV9zZWN0aW9uKS0+
IAo+IGN1cnNlYyh2aWN0aW1fc2VjdGlvbikgLT4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbiBieSBu
ZXh0X3ZpY3RpbV9zZWcpCgpJIGRpZG4ndCBnZXQgaXQsIHdoeSBmMmZzX2dldF92aWN0aW0oKSB3
aWxsIHJldHVybiBzZWN0aW9uIHdoaWNoIGlzIHVzZWQKYnkgY3Vyc2VnPyBJdCBzaG91bGQgYmUg
YXZvaWRlZCBieSBjaGVja2luZyB3LyBzZWNfdXNhZ2VfY2hlY2soKS4KCk9yIHdlIG1pc3NlZCB0
byBjaGVjayBnY2luZyBzZWN0aW9uIHdoaWNoIG5leHRfdmljdGltX3NlZyBwb2ludHMgdG8KZHVy
aW5nIGdldF9uZXdfc2VnbWVudCgpPwoKQ2FuIHRoaXMgaGFwcGVuPwoKZS5nLgotIGJnZ2Mgc2Vs
ZWN0cyBzZWMgIzAKLSBuZXh0X3ZpY3RpbV9zZWc6IHNlZyAjMAotIG1pZ3JhdGUgc2VnICMwIGFu
ZCBzdG9wCi0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzEKLSBjaGVja3BvaW50LCBzZXQgc2VjICMw
IGZyZWUgaWYgc2VjICMwIGhhcyBubyB2YWxpZCBibG9ja3MKLSBhbGxvY2F0ZSBzZWcgIzAgaW4g
c2VjICMwIGZvciBjdXJzZWcKLSBjdXJzZWcgbW92ZXMgdG8gc2VnICMxIGFmdGVyIGFsbG9jYXRp
b24KLSBiZ2djIHRyaWVzIHRvIG1pZ3JhdGUgc2VnICMxCgpUaGFua3MsCgo+IAo+IEJlY2F1c2Ug
dGhlIGNhbGwgc3RhY2sgaXMgZGlmZmVyZW50LCAKPiBJIHRoaW5rIHRoYXQgaW4gb3JkZXIgdG8g
aGFuZGxlIGV2ZXJ5dGhpbmcgYXQgb25jZSwgCj4gd2UgbmVlZCB0byBhZGRyZXNzIGl0IHdpdGhp
biBkb19nYXJiYWdlX2NvbGxlY3QsIAo+IG9yIG90aGVyd2lzZSBpbmNsdWRlIGl0IG9uIGJvdGgg
c2lkZXMuIFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IFszMDE0Ni4zMzc0NzFdWyBUMTMwMF0gRjJG
Uy1mcyAoZG0tNTQpOiBJbmNvbnNpc3RlbnQgc2VnbWVudCAoNzA5NjEpIHR5cGUgWzAsIDFdIGlu
IFNTQSBhbmQgU0lUCj4gWzMwMTQ2LjM0NjE1MV1bIFQxMzAwXSBDYWxsIHRyYWNlOgo+IFszMDE0
Ni4zNDYxNTJdWyBUMTMwMF0gIGR1bXBfYmFja3RyYWNlKzB4ZTgvMHgxMGMKPiBbMzAxNDYuMzQ2
MTU3XVsgVDEzMDBdICBzaG93X3N0YWNrKzB4MTgvMHgyOAo+IFszMDE0Ni4zNDYxNThdWyBUMTMw
MF0gIGR1bXBfc3RhY2tfbHZsKzB4NTAvMHg2Ywo+IFszMDE0Ni4zNDYxNjFdWyBUMTMwMF0gIGR1
bXBfc3RhY2srMHgxOC8weDI4Cj4gWzMwMTQ2LjM0NjE2Ml1bIFQxMzAwXSAgZjJmc19zdG9wX2No
ZWNrcG9pbnQrMHgxYy8weDNjCj4gWzMwMTQ2LjM0NjE2NV1bIFQxMzAwXSAgZG9fZ2FyYmFnZV9j
b2xsZWN0KzB4NDFjLzB4MjcxYwo+IFszMDE0Ni4zNDYxNjddWyBUMTMwMF0gIGYyZnNfZ2MrMHgy
N2MvMHg4MjgKPiBbMzAxNDYuMzQ2MTY4XVsgVDEzMDBdICBnY190aHJlYWRfZnVuYysweDI5MC8w
eDg4Ywo+IFszMDE0Ni4zNDYxNjldWyBUMTMwMF0gIGt0aHJlYWQrMHgxMWMvMHgxNjQKPiBbMzAx
NDYuMzQ2MTcyXVsgVDEzMDBdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMAo+IAo+IHN0cnVjdCBj
dXJzZWdfaW5mbyA6IDB4ZmZmZmZmODAzZjk1ZTgwMCB7Cj4gCXNlZ25vICAgICAgICA6IDB4MTE1
MzEgOiA3MDk2MQo+IH0KPiAKPiBzdHJ1Y3QgZjJmc19zYl9pbmZvIDogMHhmZmZmZmY4ODExZDEy
MDAwIHsKPiAJbmV4dF92aWN0aW1fc2VnWzBdIDogMHgxMTUzMSA6IDcwOTYxCj4gfQo+IAo+Pgo+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjUwMzI1MDgwNjQ2
LjMyOTE5NDctMi0KPj4gY2hhb0BrZXJuZWwub3JnCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBZb2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPgo+Pj4gLS0tCj4+
PiAgZnMvZjJmcy9nYy5jIHwgNCArKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMgaW5k
ZXgKPj4+IDJiOGY5MjM5YmVkZS4uNGI1ZDE4ZTM5NWViIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJm
cy9nYy5jCj4+PiArKysgYi9mcy9mMmZzL2djLmMKPj4+IEBAIC0xOTI2LDYgKzE5MjYsMTAgQEAg
aW50IGYyZnNfZ2Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QKPj4gZjJmc19nY19j
b250cm9sICpnY19jb250cm9sKQo+Pj4gIAkJZ290byBzdG9wOwo+Pj4gIAl9Cj4+Pgo+Pj4gKwlp
ZiAoX19pc19sYXJnZV9zZWN0aW9uKHNiaSkgJiYKPj4+ICsJCQlJU19DVVJTRUMoc2JpLCBHRVRf
U0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pKSkKPj4+ICsJCWdvdG8gc3RvcDsKPj4+ICsKPj4+ICAJ
c2VnX2ZyZWVkID0gZG9fZ2FyYmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBnY190
eXBlLAo+Pj4gIAkJCQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsCj4+PiAgCQkJ
CWdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
