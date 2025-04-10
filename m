Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C563DA83A14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 09:01:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2luP-0005go-Rs;
	Thu, 10 Apr 2025 07:01:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u2luO-0005gf-Ae
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 07:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nCkoKU/Z6QVbeJO4jWZ0m5UvJwb2/42vSCKFYYF2ZK0=; b=PJEHN3bBquINbfIFzIhxn5zVrP
 2I5O0obxIZn+0J+9udJY+gi5LYPVibDI53uo5ftjeSf53GMHJI8KeIedsU8Fzwm1JETLPXyUN6XtL
 c8U4FC4nSR3ulvWgjY3V+0vY7nqip5PZJNz2t/4ndGYquHLSmy8BZ6Sa8TgwNYkWxyTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nCkoKU/Z6QVbeJO4jWZ0m5UvJwb2/42vSCKFYYF2ZK0=; b=EhjcGo/2PkapeZPUf0oaVE8anB
 4YNR1Pa+ZE7ZoYMtBMndjEe9B7XenyXr8Z0d809DGqZ7pcPG91noqoHuE1S36sOi0XDd6Gcwj4sJl
 osu0M0XCx4Wv3HX6IwMtu/GEwE3P9mRHjBRSzoZ7G4anxLArZ2rEZC97R6xv2k1ZhJ0c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2lu8-0001vU-Tm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 07:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AC1CA44EA4;
 Thu, 10 Apr 2025 07:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760C9C4CEE3;
 Thu, 10 Apr 2025 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744268442;
 bh=25oGsqyFGYmGQ5XMUT26G3f5LH47a9jVlTF/jxaHuKQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sloNtURfvg+8jSg4lT4VNLwqaRWyEfiEs+U0dKhhSYLMRpt/CJvrgLqi9NRXR7P6n
 iDI6d9bwH/abxzb56ebGbNIOmfJBF++RoeED2Vew/GOFWmJJWs20GfYUF4n9OviJlR
 ++mxpBEnfOW6QvGy0FQ7Yv75k28dXIFAitL/m7drC595AtsBwTwbTeoSZCCqsItcTL
 9O1Mr6/qs2H+JjTc3nUMLKIoeABpWdB2/Gglx7Qv+5wV6CRHOp+B7xPGN85iW81wJe
 PWckRRaBzJXLMp7Hp4qJz93FnfwVs6Fh0s2Mux7o1Rd4Whpc+4gUYbDqUWIL+HbcOG
 HaffPEkml+K9g==
Message-ID: <193b95bc-4148-43eb-9a7a-d501ae5d95c6@kernel.org>
Date: Thu, 10 Apr 2025 15:00:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
 <CAD14+f3CQr2FgUc8Ut6=O0gOd6cAmYyadSNBt9SVnishdzc4kQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f3CQr2FgUc8Ut6=O0gOd6cAmYyadSNBt9SVnishdzc4kQ@mail.gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 4/10/25 13:57, Juhyung Park wrote: > Hi Chao, > > On Wed,
    Apr 9, 2025 at 10:52 PM Chao Yu <chao@kernel.org> wrote: >> >> On 4/6/25
    16:30, Juhyung Park wrote: >>> Hi all, >>> >>> I also encountere [...] 
 
 Content analysis details:   (-0.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: arter97.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [172.234.252.31 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2lu8-0001vU-Tm
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8xMC8yNSAxMzo1NywgSnVoeXVuZyBQYXJrIHdyb3RlOgo+IEhpIENoYW8sCj4gCj4gT24g
V2VkLCBBcHIgOSwgMjAyNSBhdCAxMDo1MuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Cj4+IE9uIDQvNi8yNSAxNjozMCwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+Pj4gSGkg
YWxsLAo+Pj4KPj4+IEkgYWxzbyBlbmNvdW50ZXJlZCBzb21ldGhpbmcgc2ltaWxhciBhIHdoaWxl
IGJhY2sgd2l0aCByZXNpemluZyBidXQKPj4+IGRpZG4ndCByZXBvcnQgaXQgYW5kIGp1c3QgbWFu
dWFsbHkgbWlncmF0ZWQgdGhlIGZpbGVzLgo+Pgo+PiBIaSBKdWh5dW5nLAo+Pgo+PiBEaWQgeW91
IGRldmVsb3AgYW4gaW5kaXZpZHVhbCB0b29sIHRvIG1pZ3JhdGUgc3BlY2lmaWVkIGlub2RlIHRv
IHRhcmdldAo+PiBibG9jayBhZGRyZXNzPwo+IAo+IE5vcGUuIEFuZCBuZWl0aGVyIGRpZCBAdXBs
aW5rciB1c2UgYW55IGN1c3RvbSB0b29scyB0byBtZXNzIGFyb3VuZCB0aGUKPiBmMmZzIHBhcnRp
dGlvbi4KCk9oLCBzbyBob3cgZGlkIHlvdSBtaWdyYXRlIGZpbGVzIG1hbnVhbGx5PwoKPiAKPj4K
Pj4+IEkgYXNzaXN0ZWQgaGltIHRvIGVuc3VyZSB1c2luZyB0aGUgbGF0ZXN0IGtlcm5lbC9mMmZz
LXRvb2xzLCBidXQgaGlzCj4+PiBtZXRhZGF0YSBzZWVtcyBwcmV0dHkgYmFkIHJpZ2h0IG5vdyBh
bmQgSSBzdWdnZXN0ZWQgaGltIHRvIGFzayB0aGUKPj4+IG1haWxpbmcgbGlzdCBkaXJlY3RseS4K
Pj4KPj4gSSBjaGVja2VkIHRoZSBsb2csIEkgZ3Vlc3MgaXQgYWN0dWFsbHkgc2VlbXMgcHJldHR5
IGJhZC4uLiBJIGd1ZXNzIHdlCj4+IG5lZWQgdG8gZmluZCBvdXQgdGhvc2UgZmlsZSB3aGljaCBo
YXMgbm90IGJlZW4gbWlncmF0ZWQgY29ycmVjdGx5LCBhbmQKPj4gdHJ5IHRvIGNvcnJlY3QgdGhl
bSwgbWF5IGJlIHcvIGEgbmV3IHRvb2wuCj4gCj4gWWVhaCwgaGF2aW5nIGZzY2suZjJmcyBzZWdm
YXVsdCBtaWQtd2F5IHBvc3QgcmVzaXplIHdvbid0IGhlbHAgZWl0aGVyLgo+IAo+Pgo+PiBUbyBK
YWVnZXVrLCBhbnkgdGhvdWdodHMgYWJvdXQgdGhpcyBwcm9ibGVtPwo+Pgo+Pj4KPj4+IFRoZSBV
UkwgdGhlcmUgc2hvdWxkIGJlIGh0dHBzOi8vYXJ0ZXI5Ny5jb20vLmYyZnMtMjAyNTA0MDYvZnNj
ay5sb2cgLAo+Pj4gYSBsaXR0bGUgdHlwbyB0aGVyZS4KPj4KPj4gVGhhbmtzLCBJIGRpZG4ndCBu
b3RpY2UgdGhpcyBwcmV2aW91c2x5Lgo+Pgo+Pj4KPj4+IENhbiB3ZSBoYXZlIHNvbWUgc29ydCBv
ZiBDSS9hdXRvbWF0ZWQgdGVzdGluZyBmb3IgdGhlIHJlc2l6aW5nIGFzIHdlbGw/Cj4+Cj4+IEFn
cmVlZCwgd2lsbCB3b3JrIG9uIHNvbWUgdGVzdGNhc2VzIGZvciByZXNpemUuZjJmcyB3aGVuIEkg
Z2V0IHNvbWUgZnJlZQo+PiBzbG90cy4KPiAKPiBTaG91bGQgd2UgbWFyayB0aGlzIGV4cGVyaW1l
bnRhbCBmb3IgdGhlIHRpbWUgYmVpbmc/CgpBZ3JlZWQuCgpUaGFua3MsCgo+IAo+IFRoYW5rcy4K
PiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRoYW5rcy4KPj4+Cj4+PiBPbiBTdW4sIEFwciA2
LCAyMDI1IGF0IDE6MjbigK9BTSB1cGxpbmtyLS0tIHZpYSBMaW51eC1mMmZzLWRldmVsCj4+PiA8
bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3RlOgo+Pj4+Cj4+Pj4g
SGVsbG8gZXZlcnlvbmUsCj4+Pj4KPj4+PiBJIGFtIGhhdmluZyB0cm91YmxlIHdpdGggRjJGUy4g
U3BlY2lmaWNhbGx5LCBJIGJlbGlldmUgbWV0YWRhdGEgZ290Cj4+Pj4gY29ycnVwdGVkIHdoZW4g
SSByZXNpemVkIGl0LiBJIGhhdmUgYSA1MTIgR0IgZHJpdmUuIE15IEYyRlMgcGFydGl0aW9uCj4+
Pj4gd2FzIGFwcHJveGltYXRlbHkgbG9jYXRlZCBvbiAzNjktNDk3IEdCICgxMjggR0Igc2l6ZSku
IFVzaW5nIEdQYXJ0ZWQsIEkKPj4+PiByZXNpemVkIGl0IHRvIDAuNS00OTcgR0IuIFdoaWxlIHRo
ZSBwYXJ0aXRpb24gcmVzaXppbmcgd2VudCB0aHJvdWdoCj4+Pj4gc3VjY2Vzc2Z1bGx5LCBmaWxl
c3lzdGVtIHJlc2l6aW5nIGluaXRpYWxseSBmYWlsZWQgd2l0aCAiTW91bnQgdW5jbGVhbgo+Pj4+
IGltYWdlIHRvIHJlcGxheSBsb2ciLiBJIGhhdmUgZG9uZSB0aGF0IGFuZCByZXRyaWVkIHJlc2l6
aW5nLgo+Pj4+Cj4+Pj4gQWZ0ZXJ3YXJkcywgaG93ZXZlciwgZnNjayBzdGFydGVkIGdpdmluZyBv
dXQgYSBsb3Qgb2YgZXJyb3JzLCBhdCBvbmUKPj4+PiBwb2ludCBpdCBhc2tlZCBpZiBJIHdpc2hl
ZCB0byByZXN0b3JlIGxvc3QgZGF0YSwgd2hpY2ggSSBhZ3JlZWQgdG8uIExvZ3MKPj4+PiBzcGVj
aWZpZWQgYSBsb3Qgb2YgbXkgZmlsZXMgKHdoaWNoIEkgY291bGQgdGVsbCBieSBmaWxlbmFtZXMp
IGFuZAo+Pj4+IG1pZC13YXkgdGhyb3VnaCB0aGUgcHJvY2VzcywgaXQgc2VnZmF1bHRlZC4gTm93
LCB3aGVuIEkgcnVuIGZzY2ssIG5vCj4+Pj4gZmlsZXMgYXJlIGFza2VkIHRvIGJlIHJlc3RvcmVk
LCBhbmQgaXQgY29tcGxldGVzIHN1Y2Nlc3NmdWxseS4gSG93ZXZlciwKPj4+PiB3aGVuIEkgYXR0
ZW1wdCB0byBtb3VudCBpdCwgSSBnZXQgYW4gZXJyb3Igc2F5aW5nICJTdHJ1Y3R1cmUgbmVlZHMK
Pj4+PiBjbGVhbmluZyIuCj4+Pj4KPj4+PiBDb3VsZCBzb21lb25lIGhlbHAgbWUgcmVzdG9yZSBt
eSBtZXRhZGF0YSAoYXQgbGVhc3QsIGxvbmcgZW5vdWdoIHRvCj4+Pj4gZXh0cmFjdCBteSBmaWxl
cyk/IFRoYW5rcy4KPj4+Pgo+Pj4+IGRtZXNnIGxvZ3M6Cj4+Pj4KPj4+PiBbICAgOTYuMTg0MTI3
XSBGMkZTLWZzIChudm1lMG4xcDUpOiBNaXNtYXRjaCB2YWxpZCBibG9ja3MgNzY5IHZzLiA2OAo+
Pj4+IFsgICA5Ni4xODgwNTBdIEYyRlMtZnMgKG52bWUwbjFwNSk6IEZhaWxlZCB0byBpbml0aWFs
aXplIEYyRlMgc2VnbWVudAo+Pj4+IG1hbmFnZXIgKC0xMTcpCj4+Pj4KPj4+PiBmc2NrLmYyZnMg
LS1kcnktcnVuIC1kIDMgbG9nczogaHR0cHM6Ly9hcnRlci5jb20vLmYyZnMtMjAyNTA0MDYvZnNj
ay5sb2cKPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4KPj4+Cj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
