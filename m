Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B234226782F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Sep 2020 08:20:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kGytH-0000bt-HI; Sat, 12 Sep 2020 06:20:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris.ruehl@gtsys.com.hk>) id 1kGytG-0000bl-85
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Sep 2020 06:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W5f2qTrr94gpYfeOt0I0woVUvi7vm1mkNylmUr9zc7Y=; b=bMYVsbBq0Kg4G5FXtw2eHDMcfD
 TRQOfAIjzWNaLfG43dWRbPTJBJXugpz6x6f9BaAWKpkgA66NWH7Imd6UQlYXa+jNV/+Gs49nJ/xro
 axPkYIr9noMUec+eWTcqNThk/mWE5UpVVViY9f7VMcbJ0hwzIK5B1CQAv5cxMKNO63eI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W5f2qTrr94gpYfeOt0I0woVUvi7vm1mkNylmUr9zc7Y=; b=Uf9u3ag2qVEqPiPkhdB7GxQ9eY
 Aa7w03EdtoDumWa1IIM5P5bTgqG/pnPCpD+PzpbDVWHuo7DPwd9SF5WWEeq3NspDQMZghJ7Nd4UOE
 5UqQhaHriBjW+rHWnkrTwy+Bt3N/3cnyvYbfn9gjNQ/bayRgZAsEc8PHbHPy2ctowblQ=;
Received: from [27.111.83.178] (helo=mail.gtsys.com.hk)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kGytA-005kca-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Sep 2020 06:20:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 2681D20460E7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 14:19:40 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FD8PEO6gknmh
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 14:19:40 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 062DD20460E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 14:19:40 +0800 (HKT)
Received: from [10.128.2.32] (unknown [124.217.188.80])
 by s01.gtsys.com.hk (Postfix) with ESMTPSA id D789DC019F4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 14:19:39 +0800 (HKT)
To: linux-f2fs-devel@lists.sourceforge.net
References: <b278baec-65df-312e-5d26-89dc1ea25c86@gtsys.com.hk>
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <fbd0fa14-f7a8-f6ff-abd4-37310228f694@gtsys.com.hk>
Date: Sat, 12 Sep 2020 14:19:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b278baec-65df-312e-5d26-89dc1ea25c86@gtsys.com.hk>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kGytA-005kca-Hb
Subject: Re: [f2fs-dev] F2fs failed on fresh installation 1st boot
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VXBkYXRlCk9uIDEyLzkvMjAyMCAxMjoyMCBwbSwgQ2hyaXMgUnVlaGwgd3JvdGU6Cj4gSGksCj4g
Cj4gd2UgZW5jb3VudGVyIHJhbmRvbSBjcmFzaCBvbiBuZXcgaW5zdGFsbGVkIHBhcnRpdGlvbiBh
dAo+IGZpcnN0IGJvb3QuCj4gS2VybmVsOiA0LjkuMjM1Cj4gS2VybmVsOiA1LjQuNjQgKGJsb3cp
Cj4gZjJmcy10b29sczogMS40LjAKPiAKPiBbwqDCoMKgIDEuNTIwODI5XSBtbWMxOiBuZXcgRERS
IE1NQyBjYXJkIGF0IGFkZHJlc3MgMDAwMQo+IAo+IFvCoMKgwqAgMS41MjYyMjNdIG1tY2JsazE6
IG1tYzE6MDAwMSBERzQwMDggNy4yOCBHaUIKPiAKPiBbwqDCoMKgIDEuNTMxMDM3XSBtbWNibGsx
Ym9vdDA6IG1tYzE6MDAwMSBERzQwMDggcGFydGl0aW9uIDEgNC4wMCBNaUIKPiAKPiBbwqDCoMKg
IDEuNTM3MjQ0XSBtbWNibGsxYm9vdDE6IG1tYzE6MDAwMSBERzQwMDggcGFydGl0aW9uIDIgNC4w
MCBNaUIKPiAKPiBbwqDCoMKgIDEuNTQzNDE2XSBtbWNibGsxcnBtYjogbW1jMTowMDAxIERHNDAw
OCBwYXJ0aXRpb24gMyA0LjAwIE1pQiwgY2hhcmRldiAoMjQ3OjApCj4gW8KgwqDCoCAxLjU1NDQ0
NV3CoCBtbWNibGsxOiBwMSBwMgo+IAo+IFvCoMKgwqAgMS41NzIzMjNdIEYyRlMtZnMgKG1tY2Js
azFwMik6IE1pc21hdGNoIHZhbGlkIGJsb2NrcyA1MTIgdnMuIDUwOAo+IAo+IFvCoMKgwqAgMS41
Nzg1NTJdIEYyRlMtZnMgKG1tY2JsazFwMik6IEZhaWxlZCB0byBpbml0aWFsaXplIEYyRlMgc2Vn
bWVudCBtYW5hZ2VyIAo+ICgtMTE3KQo+IFvCoMKgwqAgMS41ODYzNzRdIFZGUzogQ2Fubm90IG9w
ZW4gcm9vdCBkZXZpY2UgIm1tY2JsazFwMiIgb3IgdW5rbm93bi1ibG9jaygxNzksMik6IAo+IGVy
cm9yIC0xMTcKPiBbwqDCoMKgIDEuNTk0NDk2XSBQbGVhc2UgYXBwZW5kIGEgY29ycmVjdCAicm9v
dD0iIGJvb3Qgb3B0aW9uOyBoZXJlIGFyZSB0aGUgCj4gYXZhaWxhYmxlIHBhcnRpdGlvbnM6Cj4g
Cj4gSSByZWJvb3QgaW50byB0aGUgaW5zdGFsbGF0aW9uIFNEQ2FyZCBhbmQgcnVuIHRoZSBmc2Nr
LmYyZnMgd2l0aCBubyBlcnJvcnMKPiAKPiByb290QGJhODFiYThiNjEyNTp+IyBmc2NrLmYyZnMg
L2Rldi9tbWNibGsxcDIKPiBJbmZvOiBTZWdtZW50cyBwZXIgc2VjdGlvbiA9IDEKPiBJbmZvOiBT
ZWN0aW9ucyBwZXIgem9uZSA9IDEKPiBJbmZvOiBzZWN0b3Igc2l6ZSA9IDUxMgo+IEluZm86IHRv
dGFsIHNlY3RvcnMgPSA3NTIwMDAwICgzNjcxIE1CKQo+IEluZm86IE1LRlMgdmVyc2lvbgo+ICDC
oCAiTGludXggdmVyc2lvbiA1LjQuNjQgKHh4eCkgKGdjYyB2ZXJzaW9uIDguMy4wIChEZWJpYW4g
OC4zLjAtMikpICM3NCBTTVAgU2F0IAo+IFNlcCAxMiAxMDo1NjoyNCBIS1QgMjAyMCIKPiBJbmZv
OiBGU0NLIHZlcnNpb24KPiAgwqAgZnJvbSAiTGludXggdmVyc2lvbiA1LjQuNjQgKHh4eCkgKGdj
YyB2ZXJzaW9uIDguMy4wIChEZWJpYW4gOC4zLjAtMikpICM3NCBTTVAgCj4gU2F0IFNlcCAxMiAx
MDo1NjoyNCBIS1QgMjAyMCIKPiAgwqDCoMKgIHRvICJMaW51eCB2ZXJzaW9uIDUuNC42NCAoeHh4
KSAoZ2NjIHZlcnNpb24gOC4zLjAgKERlYmlhbiA4LjMuMC0yKSkgIzc0IFNNUCAKPiBTYXQgU2Vw
IDEyIDEwOjU2OjI0IEhLVCAyMDIwIgo+IEluZm86IHN1cGVyYmxvY2sgZmVhdHVyZXMgPSAwIDoK
PiBJbmZvOiBzdXBlcmJsb2NrIGVuY3J5cHQgbGV2ZWwgPSAwLCBzYWx0ID0gMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAKPiBJbmZvOiB0b3RhbCBGUyBzZWN0b3JzID0gNzUyMDAwMCAo
MzY3MSBNQikKPiBJbmZvOiBDS1BUIHZlcnNpb24gPSAxNGY5ODdiNwo+IEluZm86IENoZWNrZWQg
dmFsaWQgbmF0X2JpdHMgaW4gY2hlY2twb2ludAo+IEluZm86IGNoZWNrcG9pbnQgc3RhdGUgPSAx
YzUgOsKgIHRyaW1tZWQgbmF0X2JpdHMgY3JjIGNvbXBhY3RlZF9zdW1tYXJ5IHVubW91bnQKPiAK
PiBbRlNDS10gVW5yZWFjaGFibGUgbmF0IGVudHJpZXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXSBbMHgwXQo+IFtGU0NLXSBTSVQgdmFsaWQgYmxv
Y2sgYml0bWFwIGNoZWNraW5nwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXQo+
IFtGU0NLXSBIYXJkIGxpbmsgY2hlY2tpbmcgZm9yIHJlZ3VsYXIgZmlsZcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgW09rLi5dIFsweDddCj4gW0ZTQ0tdIHZhbGlkX2Jsb2NrX2NvdW50IG1hdGNoaW5n
IHdpdGggQ1DCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dIFsweDFjMjlmXQo+IFtGU0NL
XSB2YWxpZF9ub2RlX2NvdW50IG1hdGNoaW5nIHdpdGggQ1AgKGRlIGxvb2t1cCnCoCBbT2suLl0g
WzB4NTk2Yl0KPiBbRlNDS10gdmFsaWRfbm9kZV9jb3VudCBtYXRjaGluZyB3aXRoIENQIChuYXQg
bG9va3VwKSBbT2suLl0gWzB4NTk2Yl0KPiBbRlNDS10gdmFsaWRfaW5vZGVfY291bnQgbWF0Y2hl
ZCB3aXRoIENQwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dIFsweDU5NTNdCj4gW0ZT
Q0tdIGZyZWUgc2VnbWVudF9jb3VudCBtYXRjaGVkIHdpdGggQ1DCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgW09rLi5dIFsweDYyNV0KPiBbRlNDS10gbmV4dCBibG9jayBvZmZzZXQgaXMgZnJlZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbT2suLl0KPiBbRlNDS10g
Zml4aW5nIFNJVCB0eXBlcwo+IFtGU0NLXSBvdGhlciBjb3JydXB0ZWQgYnVnc8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dCj4gCj4gRG9u
ZTogNS41OTI3MjQgc2Vjcwo+IAo+IFJlZ2FyZHMKPiBDaHJpcwo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwKCkNPTkZJR19ISU1FTSBpcyBub3Qgc2V0CkNPTkZJR19QUkVFTVBUX05PTkUgaXMgc2V0LgoK
UHJvYmxlbSBub3Qgc2VlbiB3aGVuIHNldApDT05GSUdfUFJFRU1QVAoKSWYgdGhhdCBoZWxwIHRv
IHBvaW50IHRvIHRoZSBidWcuCgotQ2hyaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
