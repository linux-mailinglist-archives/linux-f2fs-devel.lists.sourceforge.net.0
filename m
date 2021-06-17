Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 338BA3ABFAC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jun 2021 01:46:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lu1iG-0004sQ-Fe; Thu, 17 Jun 2021 23:46:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lu1iF-0004sJ-5D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 23:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1JlPaMBOTWYB5bJn3+xN5JHSceBA4fdc+3UlRuLH06w=; b=ja60hXxEFX0vRRWak+KSEigYQf
 Nj4AZY9uT4lNfKhdSnmFCZI/aXD3pn32pqo6MnaEQtRP3kVRgn0lUuUqqj9YuYDBbebNDXdgzFhpV
 0NXDEh/g7/TL1nq81t9uyZt5UJ+npLM20vJPsxviGI93uKi4vTBHk8eJ3mVMhADU2EPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1JlPaMBOTWYB5bJn3+xN5JHSceBA4fdc+3UlRuLH06w=; b=PxOFJWn8GaMBejgBBT2fZgDZK3
 ZNc0xGV394AsdST5GqfNy3PW0y0dbY0vwiEsgHuv2qG76yYU7BeqnHrBoa6qbTYxI2SvO8O+u2/5O
 fS4icWrdZ2Bzy+BmAchlvqsYCehFXBw5HPXpGqnduYGz5b0FFIBnrYKlBnr3SmVDIDNU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lu1iC-0006r4-PL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 23:46:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD21F61249;
 Thu, 17 Jun 2021 23:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623973571;
 bh=7mwg/crOE8MOnomtr0YZnpCv5QvULpNitjVriKwsW+g=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=Y9w9+2Wt22IZeBPapZ4RWDINw7zb5sx7a4NFoPwq/KsnVxnKRHgcyM+/+dYrWQkrx
 VNf5lLtkQc8YnBEdJG701rIUAR4WVakrxhePeG1rBtrkIRUmbJtC2N0IsihJl2sfoJ
 vtR4Yif6l0olOalVCmhvZVTqiD8mC//mPdvFPuFjofC0Ll3rj5aRo0yhxOGDSrw9GN
 0HNZ7G9q6U08ePB34V8bwD/eL0tqSR2RE/x9UvOJopoEz1QILrbtMN3UX9OdakRHPo
 7e9prZEZaUIQC1vqCl2GhnIQ4eklZwKHokFZCalfnQ8AKf9s6DSf2Jta9uQQNQfQAG
 E+JwssEvzL1YA==
To: Sun Ke <sunke32@huawei.com>
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <d95c4ac2-50a2-4f08-3940-ac0597266280@huawei.com>
 <258b1228-2a8a-e4c1-cf6c-695f49c0cca0@kernel.org>
 <963534d2-5a42-c4c6-8bc6-013f120ecffd@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <6d94d6c5-ca25-8c65-7e8a-b4c9c9b851dc@kernel.org>
Date: Fri, 18 Jun 2021 07:46:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <963534d2-5a42-c4c6-8bc6-013f120ecffd@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lu1iC-0006r4-PL
Subject: Re: [f2fs-dev] [PATCH] common/rc: f2fs do not support metadata
 journaling
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
Cc: guan@eryu.me, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS82LzE3IDExOjQ1LCBTdW4gS2Ugd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjEvNi8xNiAy
MDozNiwgQ2hhbyBZdSDlhpnpgZM6Cj4+IE9uIDIwMjEvNi8xNSAxMToyNSwgU3VuIEtlIHdyb3Rl
Ogo+Pj4KPj4+Cj4+PiDlnKggMjAyMS82LzExIDE5OjIyLCBTdW4gS2Ug5YaZ6YGTOgo+Pj4+IElu
IGdlbmVyaWMvNTAsIHRvdWNoIDEwMCBmaWxlcywgZ28gZG93biB0aGUgZnMgaW1tZWRpYXRlbHks
IFRoZW4gdW1vdW50Cj4+Pj4gYW5kIHNldCB0aGUgZGlzayByZWFkaS1vbmx5LiBUcnkgdG8gbW91
bnQgaXQgYWdhaW4gd2l0aG91dCBcLW8KPj4+PiBub3JlY292ZXJ5XCwgaXQgc2hvdWxkIGZhaWws
IGJlY2F1c2UgaXQgY2FuIG5vdCByZWNvdmVyeSBvbiBhIHJlYWQtb25seQo+Pj4+IGRldmljZS4g
QnV0IGYyZnMgbW91bnQgc3VjY2Vzc2Z1bGx5IGFuZCB0aGUgdGVzdCBmYWlsLgo+Pj4+Cj4+Pj4g
ZjJmcyBzZWVtcyBkbyBub3Qgc3VwcG9ydCBtZXRhZGF0YSBqb3VybmFsaW5nLgo+Pgo+PiBJdCBs
b29rcyBub3QgY29ycmVjdC4KPj4KPj4gRllJLAo+Pgo+PiBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMS8zLzIzLzc1Cj4+Cj4+IFRoYW5rcywKPiBZb3VyIHBhdGNoIHNob3VsZCBmaXggdGhpcyBi
dWcsIGJ1dCBpdCBzdGlsbCBmYWlsIGluIDUuMTMuMC1yYzUuCgpJdCdzIGR1ZSB0byB0aGF0IHBh
dGNoIHdhcyBub3QgbWVyZ2VkLCBwbGVhc2UgY2hlY2sgZGV0YWlscyBpbiB0aGF0IHRocmVhZC4K
ClRoYW5rcywKCj4gCj4gW3Jvb3RAbG9jYWxob3N0IHhmc3Rlc3RzLWRldl0jIC4vY2hlY2sgdGVz
dHMvZ2VuZXJpYy8wNTAKPiBGU1RZUMKgwqDCoMKgwqDCoMKgwqAgLS0gZjJmcwo+IFBMQVRGT1JN
wqDCoMKgwqDCoCAtLSBMaW51eC94ODZfNjQgbG9jYWxob3N0IDUuMTMuMC1yYzUgIzIgU01QIFdl
ZCBKdW4gMTYgMjA6MzY6NTQgQ1NUIDIwMjEKPiBNS0ZTX09QVElPTlPCoCAtLSAvZGV2L3NkYgo+
IE1PVU5UX09QVElPTlMgLS0gLW8gYWNsLHVzZXJfeGF0dHIgL2Rldi9zZGIgL3RtcC9zY3JhdGNo
Cj4gCj4gZ2VuZXJpYy8wNTAgM3MgLi4uIC0gb3V0cHV0IG1pc21hdGNoIChzZWUgL3Jvb3Qvd29y
ay94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCkKPiAgwqDCoMKgIC0t
LSB0ZXN0cy9nZW5lcmljLzA1MC5vdXTCoMKgwqAgMjAyMS0wNS0zMSAxNTozNzo0MC4wMDAwMDAw
MDAgKzA4MDAKPiAgwqDCoMKgICsrKyAvcm9vdC93b3JrL3hmc3Rlc3RzLWRldi9yZXN1bHRzLy9n
ZW5lcmljLzA1MC5vdXQuYmFkwqDCoMKgIDIwMjEtMDYtMTcgMTE6NDA6MjYuMTA3MDAwMDAwICsw
ODAwCj4gIMKgwqDCoCBAQCAtMTMsOSArMTMsNyBAQAo+ICDCoMKgwqDCoCBzZXR0aW5nIGRldmlj
ZSByZWFkLW9ubHkKPiAgwqDCoMKgwqAgbW91bnRpbmcgZmlsZXN5c3RlbSB0aGF0IG5lZWRzIHJl
Y292ZXJ5IG9uIGEgcmVhZC1vbmx5IGRldmljZToKPiAgwqDCoMKgwqAgbW91bnQ6IGRldmljZSB3
cml0ZS1wcm90ZWN0ZWQsIG1vdW50aW5nIHJlYWQtb25seQo+ICDCoMKgwqAgLW1vdW50OiBjYW5u
b3QgbW91bnQgZGV2aWNlIHJlYWQtb25seQo+ICDCoMKgwqDCoCB1bm1vdW50aW5nIHJlYWQtb25s
eSBmaWxlc3lzdGVtCj4gIMKgwqDCoCAtdW1vdW50OiBTQ1JBVENIX0RFVjogbm90IG1vdW50ZWQK
PiAgwqDCoMKgwqAgbW91bnRpbmcgZmlsZXN5c3RlbSB3aXRoIC1vIG5vcmVjb3Zlcnkgb24gYSBy
ZWFkLW9ubHkgZGV2aWNlOgo+ICDCoMKgwqAgLi4uCj4gIMKgwqDCoCAoUnVuICdkaWZmIC11IC9y
b290L3dvcmsveGZzdGVzdHMtZGV2L3Rlc3RzL2dlbmVyaWMvMDUwLm91dCAvcm9vdC93b3JrL3hm
c3Rlc3RzLWRldi9yZXN1bHRzLy9nZW5lcmljLzA1MC5vdXQuYmFkJ8KgIHRvIHNlZSB0aGUgZW50
aXJlIGRpZmYpCj4gUmFuOiBnZW5lcmljLzA1MAo+IEZhaWx1cmVzOiBnZW5lcmljLzA1MAo+IEZh
aWxlZCAxIG9mIDEgdGVzdHMKPiAKPiBUaGFua3MsCj4gU3VuIEtlCj4+Cj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBTdW4gS2UgPHN1bmtlMzJAaHVhd2VpLmNvbT4KPj4+PiAtLS0KPj4+Pgo+Pj4+
IEkgYW0gbm90IHZlcnkgc3VyZSBpZiBmMmZzIGRvIG5vdCBzdXBwb3J0IG1ldGFkYXRhIGpvdXJu
YWxpbmcuCj4+Pj4KPj4+PiAjIyMKPj4+PiBiZWZvcmUgY2hhbmdlCj4+Pj4gIyMjCj4+Pj4gW3Jv
b3RAbG9jYWxob3N0IHhmc3Rlc3RzLWRldl0jIC4vY2hlY2sgdGVzdHMvZ2VuZXJpYy8wNTAKPj4+
PiBGU1RZUMKgwqDCoMKgwqDCoMKgwqAgLS0gZjJmcwo+Pj4+IFBMQVRGT1JNwqDCoMKgwqDCoCAt
LSBMaW51eC94ODZfNjQgbG9jYWxob3N0IDUuMTIuMC1yYzUtbmV4dC0yMDIxMDMzMCAjOCBTTVAg
VHVlIEp1biA4IDExOjA5OjM3IENTVCAyMDIxCj4+Pj4gTUtGU19PUFRJT05TwqAgLS0gL2Rldi9z
ZGIKPj4+PiBNT1VOVF9PUFRJT05TIC0tIC1vIGFjbCx1c2VyX3hhdHRyIC9kZXYvc2RiIC90bXAv
c2NyYXRjaAo+Pj4+Cj4+Pj4gZ2VuZXJpYy8wNTAgNHMgLi4uIC0gb3V0cHV0IG1pc21hdGNoIChz
ZWUgL3Jvb3Qvd29yay94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCkK
Pj4+PiDCoMKgwqDCoCAtLS0gdGVzdHMvZ2VuZXJpYy8wNTAub3V0wqDCoCAyMDIxLTA1LTMxIDE1
OjM3OjQwLjAwMDAwMDAwMCArMDgwMAo+Pj4+IMKgwqDCoMKgICsrKyAvcm9vdC93b3JrL3hmc3Rl
c3RzLWRldi9yZXN1bHRzLy9nZW5lcmljLzA1MC5vdXQuYmFkIDIwMjEtMDYtMTEgMTY6NDg6MTku
OTkzMDAwMDAwICswODAwCj4+Pj4gwqDCoMKgwqAgQEAgLTEzLDkgKzEzLDcgQEAKPj4+PiDCoMKg
wqDCoMKgIHNldHRpbmcgZGV2aWNlIHJlYWQtb25seQo+Pj4+IMKgwqDCoMKgwqAgbW91bnRpbmcg
ZmlsZXN5c3RlbSB0aGF0IG5lZWRzIHJlY292ZXJ5IG9uIGEgcmVhZC1vbmx5IGRldmljZToKPj4+
PiDCoMKgwqDCoMKgIG1vdW50OiBkZXZpY2Ugd3JpdGUtcHJvdGVjdGVkLCBtb3VudGluZyByZWFk
LW9ubHkKPj4+PiDCoMKgwqDCoCAtbW91bnQ6IGNhbm5vdCBtb3VudCBkZXZpY2UgcmVhZC1vbmx5
Cj4+Pj4gwqDCoMKgwqDCoCB1bm1vdW50aW5nIHJlYWQtb25seSBmaWxlc3lzdGVtCj4+Pj4gwqDC
oMKgwqAgLXVtb3VudDogU0NSQVRDSF9ERVY6IG5vdCBtb3VudGVkCj4+Pj4gwqDCoMKgwqDCoCBt
b3VudGluZyBmaWxlc3lzdGVtIHdpdGggLW8gbm9yZWNvdmVyeSBvbiBhIHJlYWQtb25seSBkZXZp
Y2U6Cj4+Pj4gwqDCoMKgwqAgLi4uCj4+Pj4gwqDCoMKgwqAgKFJ1biAnZGlmZiAtdSAvcm9vdC93
b3JrL3hmc3Rlc3RzLWRldi90ZXN0cy9nZW5lcmljLzA1MC5vdXQgL3Jvb3Qvd29yay94ZnN0ZXN0
cy1kZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCfCoCB0byBzZWUgdGhlIGVudGlyZSBk
aWZmKQo+Pj4+IFJhbjogZ2VuZXJpYy8wNTAKPj4+PiBGYWlsdXJlczogZ2VuZXJpYy8wNTAKPj4+
PiBGYWlsZWQgMSBvZiAxIHRlc3RzCj4+Pj4KPj4+PiAjIyMKPj4+PiBhZnRlciBjaGFuZ2UKPj4+
PiAjIyMKPj4+PiBbcm9vdEBsb2NhbGhvc3QgeGZzdGVzdHMtZGV2XSMgLi9jaGVjayB0ZXN0cy9n
ZW5lcmljLzA1MAo+Pj4+IEZTVFlQwqDCoMKgwqDCoMKgwqDCoCAtLSBmMmZzCj4+Pj4gUExBVEZP
Uk3CoMKgwqDCoMKgIC0tIExpbnV4L3g4Nl82NCBsb2NhbGhvc3QgNS4xMi4wLXJjNS1uZXh0LTIw
MjEwMzMwICM4IFNNUCBUdWUgSnVuIDggMTE6MDk6MzcgQ1NUIDIwMjEKPj4+PiBNS0ZTX09QVElP
TlPCoCAtLSAvZGV2L3NkYgo+Pj4+IE1PVU5UX09QVElPTlMgLS0gLW8gYWNsLHVzZXJfeGF0dHIg
L2Rldi9zZGIgL3RtcC9zY3JhdGNoCj4+Pj4KPj4+PiBnZW5lcmljLzA1MCA0cyAuLi7CoCA0cwo+
Pj4+IFJhbjogZ2VuZXJpYy8wNTAKPj4+PiBQYXNzZWQgYWxsIDEgdGVzdHMKPj4+Pgo+Pj4+Cj4+
Pj4KPj4+PiDCoCBjb21tb24vcmMgfCAyICstCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvY29tbW9uL3Jj
IGIvY29tbW9uL3JjCj4+Pj4gaW5kZXggYTBhYTczMDAuLjQyOGI4YjgwIDEwMDY0NAo+Pj4+IC0t
LSBhL2NvbW1vbi9yYwo+Pj4+ICsrKyBiL2NvbW1vbi9yYwo+Pj4+IEBAIC0zNTQzLDcgKzM1NDMs
NyBAQCBfaGFzX21ldGFkYXRhX2pvdXJuYWxpbmcoKQo+Pj4+IMKgwqDCoMKgwqAgZmkKPj4+PiDC
oMKgwqDCoMKgIGNhc2UgIiRGU1RZUCIgaW4KPj4+PiAtwqDCoMKgIGV4dDJ8dmZhdHxtc2Rvc3x1
ZGZ8ZXhmYXR8dG1wZnMpCj4+Pj4gK8KgwqDCoCBleHQyfHZmYXR8bXNkb3N8dWRmfGV4ZmF0fHRt
cGZzfGYyZnMpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gIiRGU1RZUCBkb2VzIG5vdCBz
dXBwb3J0IG1ldGFkYXRhIGpvdXJuYWxpbmciCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAxCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIDs7Cj4+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo+PiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
