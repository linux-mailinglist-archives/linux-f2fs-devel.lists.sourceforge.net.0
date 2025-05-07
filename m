Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D1CAAD539
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 07:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8ao5Xs8eIpGn6wym1pjXHC+xgllpwZ7sfmt9LTiRKE=; b=do0jF2uqIMBS+5glC2lhXrXZVz
	PJa7q95u/toKxRq3huiBMUFhF03iSut/5hC5U6QVra6hxBtr9OBEb7B+zYt1RQlq28VjGqfBzu1Jq
	xFANy6LkMb1OBuTpoaTDs19IOugG0KVJHH+GAZdm8Ro4lnAvQqrMAFgHbNpNRurfreWA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCXKd-00052Q-7i;
	Wed, 07 May 2025 05:28:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCXKb-00052G-DZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 05:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9kc2aaCmJe6I3+r3NhGQr5MqCt9Xj/3FJUopQKwhmkY=; b=J0OKYBFIna/hxF+7idZ1r1NdKX
 usnsmaDA9vC5xOLMgyBlYgElQq4mGIiVfEswt5Nrc+xkBRPyz8vQ5udA1o5hYP2lTQ3fdva6V1K2F
 n90IAQsB/uwL76n65kvo1SXFcOkbs7E1atXreotk0KqO4eyh1zzN4skDq5gbAtA+SCI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9kc2aaCmJe6I3+r3NhGQr5MqCt9Xj/3FJUopQKwhmkY=; b=iJZwPzgVajElHDRwXNyh5R7zzY
 kZIsRcsGpjtwN3iLWnOFioJ7orpm3jYSjVQENTpXR/IQNbxAt+ASBklkd1dsK1Ut4ZYQl4yLjhZ7Q
 tJR/Hy7nM+G8IILF3J16KlbKa0bhjZUdF/dxZhUt3oWJC2+04CliIzoyPm+DwtsYPAvY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCXKL-0005cu-Oq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 05:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE936629DB;
 Wed,  7 May 2025 05:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340A0C4CEE9;
 Wed,  7 May 2025 05:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746595686;
 bh=76YU7HGqMcxDlrSy8MyBokIuTClDE3SsmVQc5VTZTTQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hcZ1K+i0k/L7kCDAdLGRGXHkm86UUuh5wA962FOKbpVZov7LgpYvNkFTMZxJXQ+Fg
 ONosXOL/rx5uCQM5VtLEi+Wjfq5tX5zTwtgk3/c8XPfaYAWpv3EZcZs+mHSWRRQGLJ
 RlHCvHj1U6BbQPNL5NQ6/2AovFtT5ltp3OwjfJIZYiUvO36qzMT1G9w7izA9tjF0/e
 UQP1Pr/Ltoh3uwAcvojrv4guLhVM32QzVDy/SVIRi2yXGuTNBW12PjaEWJq1qkc1E9
 Q4aQWnSYjxvhGwMoHyWv+6K+DOQVB90ghSBY56NBm1K9T4AWtIe3ANdt3u2Q1F0mvP
 LfMqSf74cGiCQ==
Message-ID: <8ea8f5bd-0622-40c8-b0b5-e387948e9e3b@kernel.org>
Date: Wed, 7 May 2025 13:28:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250415093822.1100476-1-chao@kernel.org>
 <20250507050833.f72gsjv4xc4fdhuf@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250507050833.f72gsjv4xc4fdhuf@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 13:08, Zorro Lang wrote: > On Tue, Apr 15, 2025
 at 05:38:22PM +0800, Chao Yu wrote: >> As Han Qi reported in bugzilla [1],
 commit 5c26d2f1d3f5 ("unicode: Don't >> special case ignorable code [...]
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCXKL-0005cu-Oq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/012: test red heart lookup
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS83LzI1IDEzOjA4LCBab3JybyBMYW5nIHdyb3RlOgo+IE9uIFR1ZSwgQXByIDE1LCAyMDI1
IGF0IDA1OjM4OjIyUE0gKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4+IEFzIEhhbiBRaSByZXBvcnRl
ZCBpbiBidWd6aWxsYSBbMV0sIGNvbW1pdCA1YzI2ZDJmMWQzZjUgKCJ1bmljb2RlOiBEb24ndAo+
PiBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9pbnRzIikgY2hhbmdlcyBsb2dpYyB0byBo
YW5kbGUgaWdub3JhYmxlCj4+IGNvZGUgcG9pbnRzLCB3aGVuIHdlIGhhbmRsZSBmaWxlbmFtZSB3
aGljaCBoYXMgc3BlY2lhbCB1bmljb2RlIGNoYXJhY3Rvcgo+PiBsaWtlIHJlZCBoZWFydCDinaTv
uI8sIHV0ZjhfY2FzZWZvbGQoKSBtYXkgcmV0dXJuIGRpZmZlcmVudCBsZW5ndGggdGhhbiBpbiB0
aGUKPj4gcGFzdCwgcmVzdWx0IGluIHRoYXQgZjJmcyBjYWNsdWF0ZXMgaGFzaCBjb2RlIGluY29y
cmVjbHR5LCBldmVudHVhbGx5LAo+PiBmaWxlbmFtZSB3LyBzcGVjaWFsIHVuaWNvZGUgY2hhcmFj
dG9yIHdpbGwgbm90IGJlIGZvdW5kIHcvIHRoZSB3cm9uZyBoYXNoCj4+IGNvZGUuCj4+Cj4+IGYy
ZnMgaGFzIGludHJvZHVjZXMgYSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIHcvIGNvbW1pdCA5MWI1
ODdiYTc5ZTEKPj4gKCJmMmZzOiBJbnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMi
KSwgb25jZSBoYXNoLWJhc2VkIGxvb2t1cAo+PiBmYWlscywgaXQgdHJpZXMgbGluZWFyIGxvb2t1
cCBhcyBhIGZhbGxiYWNrLgo+Pgo+PiBUaGlzIHBhdGNoIGNhbiBoZWxwIHRvIGNoZWNrIHdoZXRo
ZXIgbGluZWFyIGxvb2t1cCBmYWxsYmFjayB3b3JrcyB3ZWxsCj4+IG9yIG5vdC4KPj4KPj4gRmly
c3RseSwgd2UgdXNlIGJlbG93IHRlc3RjYXNlIHRvIGNoZWNrIGhvdyBoYXNoIGNvZGUgY2hhbmdl
czoKPj4KPj4gbWtmcy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0ZjggL2Rldi92ZGEKPj4gbW91
bnQgL2Rldi92ZGEgL21udC9mMmZzCj4+IG1rZGlyIC9tbnQvZjJmcy9kaXIvCj4+IGYyZnNfaW8g
c2V0ZmxhZ3MgY2FzZWZvbGQgL21udC9mMmZzL2Rpcgo+PiB0b3VjaCAvbW50L2YyZnMvZGlyLyQn
XHUyNzY0XHVmZTBmJwo+PiB1bW91bnQgL21udC9mMmZzCj4+IGR1bXAuZjJmcyAtaSA0IC1kIDMg
L2Rldi92ZGEKPj4gZHVtcC5mMmZzIC1iICRibGthZGRyX29mX2RpciAtZCAzIC9kZXYvdmRhCj4+
Cj4+IHcvbyAoInVuaWNvZGU6IERvbid0IHNwZWNpYWwgY2FzZSBpZ25vcmFibGUgY29kZSBwb2lu
dHMiKQo+PiBbZHVtcF9kaXJlbnQ6IDk5MV0gYml0bWFwIHBvc1sweDJdIG5hbWVb4p2k77iPXSBs
ZW5bMHg2XSBoYXNoWzB4MTlkZDcxMzJdIGlub1sweDVdIHR5cGVbMHgxXQo+PiBbZHVtcF9kaXJl
bnQ6IDk5OF0gbmFtZShoZXgpWzB4ZTIgMHg5ZCAweGE0IDB4ZWYgMHhiOCAweDhmIDB4MF0KPj4K
Pj4gdy8gKCJ1bmljb2RlOiBEb24ndCBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9pbnRz
IikKPj4gW2R1bXBfZGlyZW50OiA5OTFdIGJpdG1hcCBwb3NbMHgyXSBuYW1lW+KdpO+4j10gbGVu
WzB4Nl0gaGFzaFsweDlhMmVhMDY4XSBpbm9bMHg1XSB0eXBlWzB4MV0KPj4gW2R1bXBfZGlyZW50
OiA5OThdIG5hbWUoaGV4KVsweGUyIDB4OWQgMHhhNCAweGVmIDB4YjggMHg4ZiAweDBdCj4+Cj4+
IENvcnJlY3QgaGFzaCBjb2RlOgkweDE5ZGQ3MTMyCj4+IFdyb25nIGhhc2ggY29kZToJMHg5YTJl
YTA2OAo+Pgo+PiBTbywgd2UgY2FuIHRlc3QgYXMgYmVsb3c6Cj4+Cj4+IDEuIGNyZWF0ZSBmaWxl
IHcvIHJlZCBoZWFydCBhcyBpdHMgZmlsZW5hbWUKPj4gMi4gaW5qZWN0IHdyb25nIGhhc2ggY29k
ZSB0byB0aGUgZmlsZQo+PiAzLiBkaXNhYmxlIGxpbmVhciBsb29rdXAsIGV4cGVjdCBsb29rdXAg
ZmFpbHVyZQo+PiA0LiBlbmFibGUgbGluZWFyIGxvb2t1cCwgZXhwZWN0IGxvb2t1cCBzdWNjZWVk
Cj4+Cj4+IFsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIx
OTU4Ngo+Pgo+PiBDYzogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPj4gQ2M6IERh
bmllbCBMZWUgPGNodWxsZWVAZ29vZ2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPiAKPiBTb3JyeSBmb3IgdGhpcyBsYXRlIHJldmlldywg
dGhpcyB2ZXJzc2lvbiBsb29rcyBnb29kIHRvIG1lLCBqdXN0IG9uZSByZXZpZXcgcG9pbnQKPiBh
cyBiZWxvdyAuLgo+IAo+PiB2MjoKPj4gLSB0dW5lIGxpbmVhcl9sb29rdXAgZmVhdHVyZSBiZWZv
cmUgZmF1bHQgaW5qZWN0aW9uCj4+IC0gY2hlY2sgc3RhdHVzIGFmdGVyIHR1bmluZyBsaW5lYXJf
bG9va3VwIGZlYXR1cmUKPj4gLSBjbGVhbiB1cCBjb2Rlcwo+PiAgdGVzdHMvZjJmcy8wMTIgICAg
IHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAg
dGVzdHMvZjJmcy8wMTIub3V0IHwgIDIgKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0
aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RzL2YyZnMvMDEyCj4+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8wMTIub3V0Cj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9m
MmZzLzAxMiBiL3Rlc3RzL2YyZnMvMDEyCj4+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4+IGluZGV4
IDAwMDAwMDAwLi4zOGE2M2YyZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3Rlc3RzL2YyZnMv
MDEyCj4+IEBAIC0wLDAgKzEsNzMgQEAKPj4gKyMhIC9iaW4vYmFzaAo+PiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAo+PiArIyBDb3B5cmlnaHQgKGMpIDIwMjUgQ2hhbyBZdS4g
IEFsbCBSaWdodHMgUmVzZXJ2ZWQuCj4+ICsjCj4+ICsjIEZTIFFBIFRlc3QgTm8uIGYyZnMvMDEy
Cj4+ICsjCj4+ICsjIFRoaXMgdGVzdGNhc2UgY2hlY2tzIHdoZXRoZXIgbGluZWFyIGxvb2t1cCBm
YWxsYmFjayB3b3JrcyB3ZWxsCj4+ICsjIG9yIG5vdCBhcyBiZWxvdzoKPj4gKyMgMS5jcmVhdGUg
ZmlsZSB3LyByZWQgaGVhcnQgYXMgaXRzIGZpbGVuYW1lCj4+ICsjIDIuaW5qZWN0IHdyb25nIGhh
c2ggY29kZSB0byB0aGUgZmlsZQo+PiArIyAzLmRpc2FibGUgbGluZWFyIGxvb2t1cCwgZXhwZWN0
IGxvb2t1cCBmYWlsdXJlCj4+ICsjIDQuZW5hYmxlIGxpbmVhciBsb29rdXAsIGV4cGVjdCBsb29r
dXAgc3VjY2VlZAo+PiArIwo+PiArLiAuL2NvbW1vbi9wcmVhbWJsZQo+PiArX2JlZ2luX2ZzdGVz
dCBhdXRvIHF1aWNrIGNhc2Vmb2xkCj4+ICsKPj4gK19maXhlZF9ieV9rZXJuZWxfY29tbWl0IDkx
YjU4N2JhNzllMSBcCj4+ICsJImYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBkZW50
cmllcyIKPj4gKwo+PiArZXhwb3J0IExDX0FMTD1DLlVURi04Cj4+ICtfcmVxdWlyZV9zY3JhdGNo
Cj4+ICtfcmVxdWlyZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBmMmZzX2lvCj4+ICtfcmVxdWly
ZV9jb21tYW5kICIkRjJGU19JTkpFQ1RfUFJPRyIgaW5qZWN0LmYyZnMKPj4gKwo+PiArY2hlY2tf
bG9va3VwKCkKPj4gK3sKPj4gKwlsb2NhbCBub2xpbmVhcl9sb29rdXA9JDEKPj4gKwlsb2NhbCBk
aXI9JFNDUkFUQ0hfTU5UL2Rpcgo+PiArCSMgcmVkIGhlYXJ0IGNoYXJhY3RvciBpbiB1bmljb2Rl
IGZvcm1hdAo+PiArCWxvY2FsIHJlZGhlYXJ0PSRkaXIvJCdcdTI3NjRcdWZlMGYnCj4+ICsKPj4g
Kwlfc2NyYXRjaF9ta2ZzIC1PIGNhc2Vmb2xkIC1DIHV0ZjggPj4gJHNlcXJlcy5mdWxsCj4+ICsJ
X3NjcmF0Y2hfbW91bnQKPj4gKwo+PiArCW1rZGlyICRkaXIKPj4gKwkkRjJGU19JT19QUk9HIHNl
dGZsYWdzIGNhc2Vmb2xkICRkaXIgPj4gJHNlcXJlcy5mdWxsCj4+ICsJdG91Y2ggJHJlZGhlYXJ0
Cj4+ICsJaW5vPWBzdGF0IC1jICclaScgJHJlZGhlYXJ0YAo+PiArCV9zY3JhdGNoX3VubW91bnQK
Pj4gKwo+PiArCSMgc2hvdWxkIHR1bmUgbm9saW5lYXJfbG9va3VwIGZlYXR1cmUgYmVmb3JlIGZh
dWx0IGluamVjdGlvbgo+PiArCSRGMkZTX0ZTQ0tfUFJPRyAtLW5vbGluZWFyLWxvb2t1cD0kbm9s
aW5lYXJfbG9va3VwICRTQ1JBVENIX0RFViA+PiAkc2VxcmVzLmZ1bGwKPj4gKwo+PiArCSMgY2hl
Y2sgd2hldGhlciBsaW5lYXJfbG9va3VwIGlzIGNoYW5nZWQgYXMgZXhwZWN0ZWQKPj4gKwlpZiBb
ICRub2xpbmVhcl9sb29rdXAgPT0gIjEiIF07IHRoZW4KPj4gKwkJJEYyRlNfRlNDS19QUk9HICRT
Q1JBVENIX0RFViB8IGdyZXAgLXEgImxpbmVhcl9sb29rdXAgXFtkaXNhYmxlXF0iIHx8CVwKPj4g
KwkJCQkJX2ZhaWwgImxpbmVhcl9sb29rdXAgaXMgbm90IGRpc2FibGVkIgo+PiArCWVsc2UKPj4g
KwkJJEYyRlNfRlNDS19QUk9HICRTQ1JBVENIX0RFViB8IGdyZXAgLXEgImxpbmVhcl9sb29rdXAg
XFtlbmFibGVcXSIgfHwJXAo+PiArCQkJCQlfZmFpbCAibGluZWFyX2xvb2t1cCBpcyBub3QgZW5h
YmxlZCIKPj4gKwlmaQo+PiArCj4+ICsJJEYyRlNfSU5KRUNUX1BST0cgLS1kZW50IC0tbWIgZF9o
YXNoIC0tbmlkICRpbm8gLS12YWwgMHg5YTJlYTA2OCAkU0NSQVRDSF9ERVYgPj4gJHNlcXJlcy5m
dWxsCj4+ICsKPj4gKwlfc2NyYXRjaF9tb3VudAo+PiArCWlmIFsgJG5vbGluZWFyX2xvb2t1cCA9
PSAiMSIgXTsgdGhlbgo+PiArCQlbIC1mICRyZWRoZWFydCBdICYmIF9mYWlsICJyZWQgaGVhcnQg
ZmlsZSBzaG91bGQgbm90IGV4aXN0Igo+PiArCWVsc2UKPj4gKwkJWyAtZiAkcmVkaGVhcnQgXSB8
fCBfZmFpbCAicmVkIGhlYXJ0IGZpbGUgc2hvdWxkIGV4aXN0Igo+PiArCWZpCj4+ICsJX3NjcmF0
Y2hfdW5tb3VudAo+PiArCj4+ICsJIyB0byBhdm9pZCBfY2hlY2tfZmlsZXN5c3RlbXMgZmFpbHVy
ZSBpbiB0aGUgZW5kIG9mIHRlc3QKPj4gKwlfcmVwYWlyX3NjcmF0Y2hfZnMgPj4gJHNlcXJlcy5m
dWxsCj4gCj4gSWYgeW91IHdhbnQgdG8gbWFrZSBzdXJlICJmc2NrLmYyZnMgY2FuIHJlcGFpciBh
Ym92ZSBjb3JydXB0aW9uIiwgdGhlbiB0aGlzIGNvbW1lbnQgaXNuJ3QgcmlnaHQuCj4gSWYgeW91
IGp1c3Qgd2FudCB0byBhdm9pZCBfY2hlY2tfZmlsZXN5c3RlbXMgZmFpbHVyZSwgeW91IGNhbiBy
ZXBsYWNlIF9yZXF1aXJlX3NjcmF0Y2ggd2l0aAo+IF9yZXF1aXJlX3NjcmF0Y2hfbm9jaGVjaywg
dGhlbiByZW1vdmUgdGhpcyBsaW5lLgoKQWgsIGxldCBtZSB1c2UgX3JlcXVpcmVfc2NyYXRjaF9u
b2NoZWNrIGluc3RlYWQsIHRoYW5rcy4gOikKClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IFpvcnJv
Cj4gCj4+ICt9Cj4+ICsKPj4gK2NoZWNrX2xvb2t1cCAxCj4+ICtjaGVja19sb29rdXAgMAo+PiAr
Cj4+ICtlY2hvICJTaWxlbmNlIGlzIGdvbGRlbiIKPj4gKwo+PiArc3RhdHVzPTAKPj4gK2V4aXQK
Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDEyLm91dCBiL3Rlc3RzL2YyZnMvMDEyLm91dAo+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMC4uM2FmZWNhMmYKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi90ZXN0cy9mMmZzLzAxMi5vdXQKPj4gQEAgLTAsMCArMSwyIEBA
Cj4+ICtRQSBvdXRwdXQgY3JlYXRlZCBieSAwMTIKPj4gK1NpbGVuY2UgaXMgZ29sZGVuCj4+IC0t
IAo+PiAyLjQ5LjAKPj4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
