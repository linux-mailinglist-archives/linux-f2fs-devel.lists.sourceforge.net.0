Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A471041C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 06:44:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q22q2-00084C-Mr;
	Thu, 25 May 2023 04:44:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rtresidd@electromag.com.au>) id 1q22pu-000840-OO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 04:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hCXskjMkJrov37RUtEYmqX1PhopMODuX7ggCzT54Zho=; b=Xy3D3y9VficU/Dmyrs2622T6sr
 a+l8RFMKoFEfZkVz3BLfWSm3BKXTdLLIcyut2BWpDI64rSNWRgukNZXaj5LA5TYCx79YtY2ZKrPZ/
 c7cCJK4g56rK5zqXhQRn1/rMrHhTDWoJuOvOQa/cAIx34aa/x50pFhzKShELxBAsifmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hCXskjMkJrov37RUtEYmqX1PhopMODuX7ggCzT54Zho=; b=Wz53g1oW1MCXV+gpnFQJKCgpQ7
 CeIr63iNS0hqFNc0lySTkEneEqSBAPWg6cun7dXaC7OaTZ0XUPyhDWt85U0LOZjI8WKpuFtHG4iA2
 7FTQTMqL0bfq01t2AcXewvsmeo7glWOsR4Z6JZV0TILMxLXscF17Zaqo/KS2v3Y71m/8=;
Received: from anchovy1.45ru.net.au ([203.30.46.145])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q22pp-0000Wh-Vn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 04:44:26 +0000
Received: (qmail 32032 invoked by uid 5089); 25 May 2023 04:44:13 -0000
Received: by simscan 1.2.0 ppid: 31800, pid: 31803, t: 0.8970s
 scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on anchovy1
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=6.0 tests=ALL_TRUSTED=-1,AWL=0.177,
 NICE_REPLY_A=-0.089,T_SCC_BODY_TEXT_LINE=-0.01 autolearn=disabled
 version=3.4.5
Received: from unknown (HELO ?192.168.2.4?)
 (rtresidd@electromag.com.au@203.59.235.95)
 by anchovy3.45ru.net.au with ESMTPA; 25 May 2023 04:44:11 -0000
Message-ID: <24d05132-8069-0703-3d1b-01de9456bd02@electromag.com.au>
Date: Thu, 25 May 2023 12:44:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <8be01849-02ae-0829-b8f0-c9eb7f3f4065@electromag.com.au>
 <ZGV6pOc80ITHlxXG@google.com>
In-Reply-To: <ZGV6pOc80ITHlxXG@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 18/05/2023 9:08 am, Jaegeuk Kim wrote: > Hi, > > Could
 you please consider v6.3.3 which has some fixes? > > Thanks, Hi Kim Sorry
 about the slow reply. Had to get a UART issue out of the way before I could
 test this at 6.3.3 Indeed things seem to be ok again. So can close this issue.
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [203.30.46.145 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.30.46.145 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q22pp-0000Wh-Vn
Subject: Re: [f2fs-dev] Kernel warnings 6.3.1
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
From: Richard Tresidder via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Richard Tresidder <rtresidd@electromag.com.au>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTgvMDUvMjAyMyA5OjA4IGFtLCBKYWVnZXVrIEtpbSB3cm90ZToKCj4gSGksCj4KPiBDb3Vs
ZCB5b3UgcGxlYXNlIGNvbnNpZGVyIHY2LjMuMyB3aGljaCBoYXMgc29tZSBmaXhlcz8KPgo+IFRo
YW5rcywKCkhpIEtpbQogICAgICBTb3JyeSBhYm91dCB0aGUgc2xvdyByZXBseS4gSGFkIHRvIGdl
dCBhIFVBUlQgaXNzdWUgb3V0IG9mIHRoZSB3YXkgYmVmb3JlIEkgY291bGQgdGVzdCB0aGlzIGF0
IDYuMy4zCkluZGVlZCB0aGluZ3Mgc2VlbSB0byBiZSBvayBhZ2Fpbi4KU28gY2FuIGNsb3NlIHRo
aXMgaXNzdWUuCgpDaGVlcnMKICAgIFJpY2hhcmQgVHJlc2lkZGVyCgogICAgIAoKPiBPbiAwNS8x
MiwgUmljaGFyZCBUcmVzaWRkZXIgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IEhpCj4+
ICDCoMKgIFdlJ3JlIHVwZ3JhZGluZyBvdXIgc3lzdGVtcyBmcm9tIHVzaW5nIGEgNS4xLjcgYmFz
ZWQga2VybmVsIHRvIGEgNi4zLjEKPj4gYmFzZWQga2VybmVsLgo+PiBJJ20gZXhwZXJpZW5jaW5n
IHNvbWUgd2FybmluZ3MgcG9wcGluZyBvdXQgb2NjYXNpb25hbGx5IGZyb20gdGhlIGYyZnMgZHJp
dmVyCj4+Cj4+ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPj4gW8KgIDEzNy4yMjUz
NzZdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDMyIGF0IGZzL2YyZnMvZXh0ZW50X2NhY2hlLmM6NzU1
Cj4+IF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKzB4NDI0LzB4NzYwCj4+ICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKPj4KPj4gYW5kIGEgdHJhY2U6Cj4+ICoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKPj4gW8KgIDQ2MC4yMDYwMTZdIC0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLQo+PiBbwqAgNDYwLjIwODM0MF0gV0FSTklORzogQ1BVOiAwIFBJRDog
MTU0IGF0IGZzL2YyZnMvZXh0ZW50X2NhY2hlLmM6NzU1Cj4+IF9fdXBkYXRlX2V4dGVudF90cmVl
X3JhbmdlKzB4NDI0LzB4NzYwCj4+IFvCoCA0NjAuMjEzMTgzXSBNb2R1bGVzIGxpbmtlZCBpbjoK
Pj4gW8KgIDQ2MC4yMTMyMDBdIENQVTogMCBQSUQ6IDE1NCBDb21tOiBrd29ya2VyL3U0OjUgVGFp
bnRlZDogRwo+PiBXwqDCoMKgwqDCoMKgwqDCoMKgIDYuMy4xLTAwMjU2LWc2MDE2NDQ5OGQ4NmIt
ZGlydHkgIzcKPj4gW8KgIDQ2MC4yMTMyMTZdIEhhcmR3YXJlIG5hbWU6IEFsdGVyYSBTT0NGUEdB
Cj4+IFvCoCA0NjAuMjEzMjI2XSBXb3JrcXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4gKGZsdXNo
LTE3OTowKQo+PiBbwqAgNDYwLjIxMzI3MV3CoCB1bndpbmRfYmFja3RyYWNlIGZyb20gc2hvd19z
dGFjaysweDE4LzB4MWMKPj4gW8KgIDQ2MC4yMTMzMDZdwqAgc2hvd19zdGFjayBmcm9tIGR1bXBf
c3RhY2tfbHZsKzB4NDAvMHg0Ywo+PiBbwqAgNDYwLjIxMzMzNV3CoCBkdW1wX3N0YWNrX2x2bCBm
cm9tIF9fd2FybisweDg0LzB4MTVjCj4+IFvCoCA0NjAuMjEzMzY1XcKgIF9fd2FybiBmcm9tIHdh
cm5fc2xvd3BhdGhfZm10KzB4YzQvMHgxYzAKPj4gW8KgIDQ2MC4yMTMzOTFdwqAgd2Fybl9zbG93
cGF0aF9mbXQgZnJvbQo+PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSsweDQyNC8weDc2MAo+
PiBbwqAgNDYwLjIxMzQxOF3CoCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSBmcm9tCj4+IF9f
dXBkYXRlX2V4dGVudF9jYWNoZSsweDI0NC8weDQ0NAo+PiBbwqAgNDYwLjIxMzQ0MF3CoCBfX3Vw
ZGF0ZV9leHRlbnRfY2FjaGUgZnJvbQo+PiBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGErMHg4MC8w
eGVjCj4+IFvCoCA0NjAuMjEzNDYxXcKgIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSBmcm9tCj4+
IGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlKzB4NGU0LzB4NzAwCj4+IFvCoCA0NjAuMjEzNDg3XcKg
IGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlIGZyb20KPj4gZjJmc193cml0ZV9zaW5nbGVfZGF0YV9w
YWdlKzB4NTI0LzB4NzIwCj4+IFvCoCA0NjAuMjEzNTEzXcKgIGYyZnNfd3JpdGVfc2luZ2xlX2Rh
dGFfcGFnZSBmcm9tCj4+IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMrMHgyNGMvMHg1OTAKPj4gW8Kg
IDQ2MC4yMTM1MzldwqAgZjJmc193cml0ZV9jYWNoZV9wYWdlcyBmcm9tCj4+IGYyZnNfd3JpdGVf
ZGF0YV9wYWdlcysweDIzOC8weDM4OAo+PiBbwqAgNDYwLjIxMzU2M13CoCBmMmZzX3dyaXRlX2Rh
dGFfcGFnZXMgZnJvbSBkb193cml0ZXBhZ2VzKzB4ODAvMHgxYTQKPj4gW8KgIDQ2MC4yMTM1OTdd
wqAgZG9fd3JpdGVwYWdlcyBmcm9tIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDRjLzB4NGNj
Cj4+IFvCoCA0NjAuMjEzNjI5XcKgIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSBmcm9tCj4+IHdy
aXRlYmFja19zYl9pbm9kZXMrMHgxZjgvMHg0Y2MKPj4gW8KgIDQ2MC4yMTM2NThdwqAgd3JpdGVi
YWNrX3NiX2lub2RlcyBmcm9tIF9fd3JpdGViYWNrX2lub2Rlc193YisweDQwLzB4ZTAKPj4gW8Kg
IDQ2MC4yMTM2ODZdwqAgX193cml0ZWJhY2tfaW5vZGVzX3diIGZyb20gd2Jfd3JpdGViYWNrKzB4
MjUwLzB4M2FjCj4+IFvCoCA0NjAuMjEzNzEzXcKgIHdiX3dyaXRlYmFjayBmcm9tIHdiX3dvcmtm
bisweDJkNC8weDVhYwo+PiBbwqAgNDYwLjIxMzc0MV3CoCB3Yl93b3JrZm4gZnJvbSBwcm9jZXNz
X29uZV93b3JrKzB4MWUwLzB4NTFjCj4+IFvCoCA0NjAuMjEzNzc2XcKgIHByb2Nlc3Nfb25lX3dv
cmsgZnJvbSB3b3JrZXJfdGhyZWFkKzB4NjAvMHg1MTgKPj4gW8KgIDQ2MC4yMTM4MDZdwqAgd29y
a2VyX3RocmVhZCBmcm9tIGt0aHJlYWQrMHhmNC8weDEyNAo+PiBbwqAgNDYwLjIxMzgzNl3CoCBr
dGhyZWFkIGZyb20gcmV0X2Zyb21fZm9yaysweDE0LzB4MmMKPj4gW8KgIDQ2MC4yMTM4NTZdIEV4
Y2VwdGlvbiBzdGFjaygweGYwY2M1ZmIwIHRvIDB4ZjBjYzVmZjgpCj4+IFvCoCA0NjAuMjEzODY4
XSA1ZmEwOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwMDAwMDAwMCAwMDAwMDAwMAo+PiAwMDAwMDAwMCAwMDAw
MDAwMAo+PiBbwqAgNDYwLjIxMzg3OV0gNWZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKPj4gMDAwMDAwMDAgMDAwMDAwMDAKPj4gW8KgIDQ2
MC4yMTM4OTBdIDVmZTA6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAw
MDEzIDAwMDAwMDAwCj4+IFvCoCA0NjAuMjEzODk5XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAw
MDAwMDAwIF0tLS0KPj4gKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+Pgo+PiBUaGlz
IGlzIGFmdGVyIHBlcmZvcm1pbmcgYSBmb3JtYXQgb24gdGhlIGRldmljZSBpbiBzeXN0ZW0gdG8g
bWFrZSBzdXJlIHRoZQo+PiBmaWxlc3lzdGVtIHdhcyB1cCB0byB0aGUgc2FtZSBrZXJuZWwgcmV2
aXNpb24uCj4+IEhvdyBjb25jZXJuZWQgc2hvdWxkIHdlIGJlPwo+Pgo+PiBOb3RlIHByaW9yIHRv
IHRoZSBmb3JtYXQgd2Ugd2VyZSBnZXR0aW5nIGEgTE9UIG9yIGVycm9ycywgc29tZSBsaWtlIGFi
b3ZlCj4+IGFuZCBvdGhlcnMgd2l0aCBhIGRpZmZlcmVudCBzaWduYXR1cmU6Cj4+Cj4+ICoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioKPj4gW8KgIDE2Ny42NzUxMDddIFdBUk5JTkc6IENQ
VTogMCBQSUQ6IDMyIGF0IGZzL2YyZnMvZXh0ZW50X2NhY2hlLmM6MjQ4Cj4+IF9faW5zZXJ0X2V4
dGVudF90cmVlKzB4MTVjLzB4MTc0Cj4+ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
Pj4KPj4gVGhhdCBvbmUgcmVzdWx0ZWQgaW4gdGhlIGVudGlyZSBzeXN0ZW0gY29taW5nIHRvIGEg
YSBoYWx0Li4KPj4KPj4gQ2hlZXJzCj4+ICDCoMKgIFJpY2hhcmQgVAo+Pgo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
