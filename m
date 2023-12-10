Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C174480BD5B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 22:30:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCRNE-0007YU-QJ;
	Sun, 10 Dec 2023 21:30:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@omp.ru>) id 1rCRN4-0007UK-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 21:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxu4gESS+2XK9muUBRONfzRgwBDcOIpV/SbR8/jNC00=; b=Kofovy7GIpqQaGHfTQMGU5ggD2
 4wRuqEc0Bl+lkZypoUk22WFgZkINoA+UlAeRD1oxw/z7Wss1SmIgZhk/ImoTDscQJ6BRfxB5JAp1H
 y9ABvckl3ut+nKBn7ZhIs0VSe3fhbLWUvxPs/gXpVnRQnM+GhYf1LFm4z2Cc0ikRJD7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jxu4gESS+2XK9muUBRONfzRgwBDcOIpV/SbR8/jNC00=; b=bxPkkkj+/+xwzyrdLXtDxWGDNB
 A6Qb2U1A9Git5q41j9AHknqlbVSWtkcN+CPbhchVuWPOZ01HGQgnKJNUFeVsAvbqk0RFYWKSp77VF
 PNHsj9m2T4YQLNe0JEMWgAIlRzzzQvI4R8pVTqeWKRS6b5FR0OenD8ryNapxkN6Q1skk=;
Received: from mx01.omp.ru ([90.154.21.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1rCRN2-0001hR-Ei
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 21:29:53 +0000
Received: from [192.168.1.104] (178.176.74.216) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 11 Dec
 2023 00:14:16 +0300
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20231025202019.5228-1-s.shtylyov@omp.ru>
 <e2167506-2b0a-a0f5-c0e9-0e8b6139c69e@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5769c4fa-3112-3582-00a0-2b17757d8cab@omp.ru>
Date: Mon, 11 Dec 2023 00:14:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e2167506-2b0a-a0f5-c0e9-0e8b6139c69e@kernel.org>
Content-Language: en-US
X-Originating-IP: [178.176.74.216]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 12/10/2023 20:52:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181999 [Dec 10 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 6 0.3.6 62f5a4619c57459c9a142aa1486ed27913162963
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.216 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.216 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; omp.ru:7.1.1;
 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.74.216
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/10/2023 20:58:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/10/2023 7:07:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello! Sorry for replying a month later than I should -- I
 got distracted by the other Svace reports... It took a significant part of
 the weekend to swap this stuff back in... :-/ On 11/7/23 6:29 PM, Chao Yu
 wrote: [...] >> In check_swap_activate(), if the *while* loop exits early
 (0- or 1-page >> long swap file), an overflow happens while calculating the
 value of the >> span p [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [178.176.74.216 listed in zen.spamhaus.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rCRN2-0001hR-Ei
Subject: Re: [f2fs-dev] [PATCH] f2fs: data: fix possible overflow in
 check_swap_activate()
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8hCgogICBTb3JyeSBmb3IgcmVwbHlpbmcgYSBtb250aCBsYXRlciB0aGFuIEkgc2hvdWxk
IC0tIEkgZ290IGRpc3RyYWN0ZWQgYnkgdGhlCm90aGVyIFN2YWNlIHJlcG9ydHMuLi4gSXQgdG9v
ayBhIHNpZ25pZmljYW50IHBhcnQgb2YgdGhlIHdlZWtlbmQgdG8gc3dhcCB0aGlzCnN0dWZmIGJh
Y2sgaW4uLi4gOi0vCgpPbiAxMS83LzIzIDY6MjkgUE0sIENoYW8gWXUgd3JvdGU6ClsuLi5dCj4+
IEluIGNoZWNrX3N3YXBfYWN0aXZhdGUoKSwgaWYgdGhlICp3aGlsZSogbG9vcCBleGl0cyBlYXJs
eSAoMC0gb3IgMS1wYWdlCj4+IGxvbmcgc3dhcCBmaWxlKSwgYW4gb3ZlcmZsb3cgaGFwcGVucyB3
aGlsZSBjYWxjdWxhdGluZyB0aGUgdmFsdWUgb2YgdGhlCj4+IHNwYW4gcGFyYW1ldGVyIGFzIHRo
ZSBsb3dlc3RfcGJsb2NrIHZhcmlhYmxlIGVuZHMgdXAgYmVpbmcgZ3JlYXRlciB0aGFuCj4+IHRo
ZSBoaWdoZXN0X3BibG9jayB2YXJpYWJsZS4gTGV0J3Mgc2V0ICpzcGFuIHRvIDAgaW4gdGhpcyBj
YXNlLi4uCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgb2YgcmV0dXJuaW5nIC1FSU5WQUwgZm9yIHN1
Y2ggY2FzZT8gSSBhc3N1bWUgdGhpcyBpcyBhCj4gY29ybmVyIGNhc2UuCgogICBJIGRvbid0IGtu
b3cgdGhlIGNvZGUgd2VsbCBlbm91Z2ggYnV0IEkgZ290IHRoZSBpbXByZXNzaW9uIHRoYXQgaWZm
CndlIGhhdmUgYSBmaWxlIGNvbnRhaW5pbmcgYSBzaW5nbGUgcGFnZSwgd2UnZCBoYXZlIG9uZSBz
dWNjZXNzZnVsIGNhbGwKb2YgYWRkX3N3YXBfZXh0ZW50KCkuIEFtIEkgbWlzc2luZyBzb21ldGhp
bmc/Cgo+PiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcu
b3JnKSB3aXRoIHRoZSBTVkFDRSBzdGF0aWMKPj4gYW5hbHlzaXMgdG9vbC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogU2VyZ2V5IFNodHlseW92IDxzLnNodHlseW92QG9tcC5ydT4KPj4gLS0tCj4+IFRo
aXMgcGF0Y2ggaXMgYWdhaW5zdCB0aGUgJ21hc3RlcicgYnJhbmNoIG9mIEphZWdldWsgS2ltJ3Mg
RjJGUyByZXBvLi4uCj4+Cj4+IMKgIGZzL2YyZnMvZGF0YS5jIHwgNSArKysrLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGluZGV4IDkxNmUzMTdhYzky
NS4uMzQyY2IwZDUwNTZkIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysgYi9m
cy9mMmZzL2RhdGEuYwo+PiBAQCAtNDA0Nyw3ICs0MDQ3LDEwIEBAIHN0YXRpYyBpbnQgY2hlY2tf
c3dhcF9hY3RpdmF0ZShzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2lzLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgY3VyX2xibG9jayArPSBucl9wYmxvY2tzOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqDC
oMKgwqDCoCByZXQgPSBucl9leHRlbnRzOwo+PiAtwqDCoMKgICpzcGFuID0gMSArIGhpZ2hlc3Rf
cGJsb2NrIC0gbG93ZXN0X3BibG9jazsKPj4gK8KgwqDCoCBpZiAobG93ZXN0X3BibG9jayA8PSBo
aWdoZXN0X3BibG9jaykKPiAKPiBpZiAodW5saWtlbHkoaGlnZXN0X3BibG9jayA8IGxvd2VzdF9w
YmxvY2spKQoKICAgV2VsbCwgR3JlZyBLSCBzYXlzIHdlIHNob3VsZG4ndCB1c2UgdW5saWtlbHko
KSB1bmxlc3Mgd2UgY2FuIHByb3ZlCnRoYXQgaXQgaW5kZWVkIGltcHJvdmVzIHRoaW5ncy4uLgoK
PiDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+IAo+ICpzcGFuID0gMSArIGhpZ2hlc3RfcGJsb2Nr
IC0gbG93ZXN0X3BibG9jazsKPiAKPiBUaGFua3MsCj4gCj4+ICvCoMKgwqDCoMKgwqDCoCAqc3Bh
biA9IDEgKyBoaWdoZXN0X3BibG9jayAtIGxvd2VzdF9wYmxvY2s7Cj4+ICvCoMKgwqAgZWxzZQo+
PiArwqDCoMKgwqDCoMKgwqAgKnNwYW4gPSAwOwo+PiDCoMKgwqDCoMKgIGlmIChjdXJfbGJsb2Nr
ID09IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjdXJfbGJsb2NrID0gMTvCoMKgwqAgLyogZm9y
Y2UgRW1wdHkgbWVzc2FnZSAqLwo+PiDCoMKgwqDCoMKgIHNpcy0+bWF4ID0gY3VyX2xibG9jazsK
Ck1CUiwgU2VyZ2V5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
