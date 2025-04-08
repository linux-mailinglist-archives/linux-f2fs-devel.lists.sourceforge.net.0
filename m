Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D62A7F4BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Apr 2025 08:11:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u22BP-0008D7-UW;
	Tue, 08 Apr 2025 06:11:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <uplinkr@airmail.cc>) id 1u22BI-0008Cx-27
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 06:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P85rKyz484Wv4syU6FyI6cJZMcpbiNlAxlIZAVtq8oo=; b=i6Z7VmKGdk93Wdvphu0qaBersj
 R+NvZvI5C9vVLwn3i5EdMMTfmKye1pl3lPxVGW6a090AivX8HgVGllSWqmx7Kbbh9rX7DjxeaX8tq
 XfVFA3rDKXYoIz4rCW/LFqBhgyV9hce/HoQzFbKnXkoNvWzGtYz5a01nxOVrC8KcUxHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P85rKyz484Wv4syU6FyI6cJZMcpbiNlAxlIZAVtq8oo=; b=VBaAHu6PCoG6wboqyToojJ1prD
 xz+fqIxcr0iuaYxj8VRAAIfXzTHMMPGWgWKoOR3ziPk7Tgt5sNwIFWledF02aY4SzRfzA48pNJz85
 T77b1s7UkBJFe6hcyXmn957Y04DrRBXGqSCpyrdB0YB35GgM0TZ197MR3oi8MhQPatvQ=;
Received: from mail.cock.li ([37.120.193.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u22B1-00056U-12 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 06:11:31 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1744092662; bh=gKxTM98q3OgvWr2W3E/KnNBRVVbC5tdgd2i2q8I+z1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mnXBX75HjMbDitzH5D0qwrfNi1Cz3+OSSONvRx5aLgLDMvV9f1ApiBWsvjxnNtkio
 +rC/sD7nXMXVMIYLZGvYd2ZnIR9yS6maTrG3gRQuTo50F68IfRMR9UwXyNHAsG1eLO
 D/2SbpooUL4D+FurHwTcwGVjp8CIvP2bDWA/2ppAifXaCSvlOdnXPszbD4Ytqcyiiu
 fcRQ3vbRacdfvDWCjujvMHjnh9zLnTT1ZZD0NfrviNpX8mL1KCkkxUYYUdAeC7neSa
 n0ug2LK1mHbfGeGSlShe1eMEtjksjzIAX5sitmGGaVq+tcDOr1bID/wNnbOZDfZsQI
 /6COk4QCWmfLg==
Date: Tue, 08 Apr 2025 09:10:57 +0300
To: Chao Yu <chao@kernel.org>
In-Reply-To: <e47d4582-60fe-4e55-acfd-d7a10737fa40@kernel.org>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <e47d4582-60fe-4e55-acfd-d7a10737fa40@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <f192a85424972b524c1f49fa28a7bd8c@airmail.cc>
X-Sender: uplinkr@airmail.cc
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 I made a typo in the URL earlier. It should be
 https://arter97.com/.f2fs-20250406/fsck.log
 . Could you try it, please? Thanks. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 URIBL_DM_SURBL         Contains an URL listed in the DM SURBL blocklist
 [URIs: airmail.cc]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u22B1-00056U-12
Subject: Re: [f2fs-dev] Resize metadata corruption
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
From: uplinkr--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: uplinkr@airmail.cc
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sCgpJIG1hZGUgYSB0eXBvIGluIHRoZSBVUkwgZWFybGllci4gSXQgc2hvdWxkIGJlIApo
dHRwczovL2FydGVyOTcuY29tLy5mMmZzLTIwMjUwNDA2L2ZzY2subG9nIC4gQ291bGQgeW91IHRy
eSBpdCwgcGxlYXNlPwoKVGhhbmtzLgoKT24gMjAyNS0wNC0wOCAwODo0MywgQ2hhbyBZdSB3cm90
ZToKPiBPbiA0LzYvMjUgMTY6MDQsIHVwbGlua3ItLS0gdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3Jv
dGU6Cj4+IEhlbGxvIGV2ZXJ5b25lLAo+PiAKPj4gSSBhbSBoYXZpbmcgdHJvdWJsZSB3aXRoIEYy
RlMuIFNwZWNpZmljYWxseSwgSSBiZWxpZXZlIG1ldGFkYXRhIGdvdCAKPj4gY29ycnVwdGVkIHdo
ZW4gSSByZXNpemVkIGl0LiBJIGhhdmUgYSA1MTIgR0IgZHJpdmUuIE15IEYyRlMgcGFydGl0aW9u
IAo+PiB3YXMgYXBwcm94aW1hdGVseSBsb2NhdGVkIG9uIDM2OS00OTcgR0IgKDEyOCBHQiBzaXpl
KS4gVXNpbmcKPj4gR1BhcnRlZCwgSSByZXNpemVkIGl0IHRvIDAuNS00OTcgR0IuIFdoaWxlIHRo
ZSBwYXJ0aXRpb24gcmVzaXppbmcgd2VudCAKPj4gdGhyb3VnaCBzdWNjZXNzZnVsbHksIGZpbGVz
eXN0ZW0gcmVzaXppbmcgaW5pdGlhbGx5IGZhaWxlZCB3aXRoICJNb3VudCAKPj4gdW5jbGVhbiBp
bWFnZSB0byByZXBsYXkgbG9nIi4gSSBoYXZlIGRvbmUgdGhhdCBhbmQgcmV0cmllZAo+PiByZXNp
emluZy4KPj4gCj4+IEFmdGVyd2FyZHMsIGhvd2V2ZXIsIGZzY2sgc3RhcnRlZCBnaXZpbmcgb3V0
IGEgbG90IG9mIGVycm9ycywgYXQgb25lIAo+PiBwb2ludCBpdCBhc2tlZCBpZiBJIHdpc2hlZCB0
byByZXN0b3JlIGxvc3QgZGF0YSwgd2hpY2ggSSBhZ3JlZWQgdG8uIAo+PiBMb2dzIHNwZWNpZmll
ZCBhIGxvdCBvZiBteSBmaWxlcyAod2hpY2ggSSBjb3VsZCB0ZWxsIGJ5Cj4+IGZpbGVuYW1lcykg
YW5kIG1pZC13YXkgdGhyb3VnaCB0aGUgcHJvY2VzcywgaXQgc2VnZmF1bHRlZC4gTm93LCB3aGVu
IEkgCj4+IHJ1biBmc2NrLCBubyBmaWxlcyBhcmUgYXNrZWQgdG8gYmUgcmVzdG9yZWQsIGFuZCBp
dCBjb21wbGV0ZXMgCj4+IHN1Y2Nlc3NmdWxseS4gSG93ZXZlciwgd2hlbiBJIGF0dGVtcHQgdG8g
bW91bnQgaXQsIEkgZ2V0IGFuIGVycm9yCj4+IHNheWluZyAiU3RydWN0dXJlIG5lZWRzIGNsZWFu
aW5nIi4KPj4gCj4+IENvdWxkIHNvbWVvbmUgaGVscCBtZSByZXN0b3JlIG15IG1ldGFkYXRhIChh
dCBsZWFzdCwgbG9uZyBlbm91Z2ggdG8gCj4+IGV4dHJhY3QgbXkgZmlsZXMpPyBUaGFua3MuCj4+
IAo+PiBkbWVzZyBsb2dzOgo+PiAKPj4gW8KgwqAgOTYuMTg0MTI3XSBGMkZTLWZzIChudm1lMG4x
cDUpOiBNaXNtYXRjaCB2YWxpZCBibG9ja3MgNzY5IHZzLiA2OAo+PiBbwqDCoCA5Ni4xODgwNTBd
IEYyRlMtZnMgKG52bWUwbjFwNSk6IEZhaWxlZCB0byBpbml0aWFsaXplIEYyRlMgc2VnbWVudCAK
Pj4gbWFuYWdlciAoLTExNykKPj4gCj4+IGZzY2suZjJmcyAtLWRyeS1ydW4gLWQgMyBsb2dzOiAK
Pj4gaHR0cHM6Ly9hcnRlci5jb20vLmYyZnMtMjAyNTA0MDYvZnNjay5sb2cKPiAKPiBIZWxsbywK
PiAKPiBDb3VsZCB5b3UgcGxlYXNlIHVwbG9hZCBmc2NrLmxvZyBpbiBidWd6aWxsYS5rZXJuZWwu
b3JnLCBvciBzb21ld2hlcmUgCj4gZWxzZT8KPiBJIGNhbiBub3QgZG93bmxvYWQgaXQgZnJvbSBh
Ym92ZSBsaW5rIGFkZHJlc3MsIHNvcnJ5Lgo+IAo+IFRoYW5rcywKPiAKPj4gCj4+IAo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
