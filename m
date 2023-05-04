Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EA6F62E3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 04:22:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puObv-00017a-R1;
	Thu, 04 May 2023 02:22:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puObu-00017U-Mo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 02:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIt5A+HlZiW+jdP11e9Z3C3Ts4Ae44TDIdRQJ9EtVwU=; b=N/qvhXDaBIsaWCWf87gOJZfBmx
 KqkQpYvm3hYVIbRabV3+s+DoQvmU2m3ZD1NqmmdRsE8wZNQ++l7fX/GlN2c5MjaJ+duSEwM2bwYci
 Nl5Vx9AZVfR44SNcQ/Ndvkzb4aRsbW6Sfuy6Sso0LvFJYrRmO5+OgWvKCt0WDerw0Tow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mIt5A+HlZiW+jdP11e9Z3C3Ts4Ae44TDIdRQJ9EtVwU=; b=JSR+aDAchjysB9cXML2CZW7Rv+
 KPN+uA4DT/spyK1UX1U+Dl9bg2j9EQkk9MDMMKekxNCKLExVUxWn/LFOG6Csk8iDfoz8+GWuzjsma
 wijctQ5ybFhFZV8c0b7q3D6UI4n1J6iDniTBs8LkDCP/w6wr45NLmbnN/S8OFjD4dMkE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puObt-00DVsq-PA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 02:22:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57480615E0;
 Thu,  4 May 2023 02:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75496C433EF;
 Thu,  4 May 2023 02:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683166935;
 bh=zYg+Thhfj2kqapZClkQyeQ4gfvuTkn6TncHltGVj3Mg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EmJwl+6TMhzhxzJNU/dKkD9bblgEI1Rf7ZX+f5QlDfb3wjpY/2NmZcWKBQtcrc9Ac
 yCvi3P6sPxSQUX9j3lfTa8HDL1qhZGSr/zsz43NsaH3htcymRwQP2LcOeVySQLCqHq
 MHKQYBroNYAgRw6bfV/+QWpQS8GTY2w6lcn9GAEvN3qDmhV/1xwOXU3iIkmxl08nDx
 rJXdX+2ZNpQbhlNV6av5RvqsjdBWO1KFdPy9bWQk0QE+vDH4Kc8OCZ2tft1iTg7Oon
 XIJT1PnRDVWYw+CbBhIDebHoz6NtgBTL5GsocG0V69AERRjRSldUtfJl/loIY1ZRkO
 Vjx/u49EJGC2g==
Message-ID: <306ff487-06d2-4ec7-c3c0-65ac066aa0f4@kernel.org>
Date: Thu, 4 May 2023 10:22:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
References: <6596335b-2448-20f7-30ea-42ba40f1af72@kernel.org>
 <20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p7>
 <CGME20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p2>
 <20230504020810epcms2p2511cc27f9824fee69563e2be99284f78@epcms2p2>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230504020810epcms2p2511cc27f9824fee69563e2be99284f78@epcms2p2>
X-Spam-Score: -9.7 (---------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/5/4 10:08, Daejun Park wrote: > Thank you for reviewing
    the patch. > >> --------- Original Message --------- >> Sender : Chao Yu <chao@kernel.org>
    >> Date : 2023-05-04 10:43 (GMT+9) >> Title [...] 
 
 Content analysis details:   (-9.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puObt-00DVsq-PA
Subject: Re: [f2fs-dev] (2) [PATCH v4] f2fs: add async reset zone command
 support
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy81LzQgMTA6MDgsIERhZWp1biBQYXJrIHdyb3RlOgo+IFRoYW5rIHlvdSBmb3IgcmV2
aWV3aW5nIHRoZSBwYXRjaC4KPiAKPj4gLS0tLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0t
LS0tCj4+IFNlbmRlciA6IENoYW8gWXXCoDxjaGFvQGtlcm5lbC5vcmc+Cj4+IERhdGUgOiAyMDIz
LTA1LTA0IDEwOjQzIChHTVQrOSkKPj4gVGl0bGUgOiBSZTogW1BBVENIIHY0XSBmMmZzOiBhZGQg
YXN5bmMgcmVzZXQgem9uZSBjb21tYW5kIHN1cHBvcnQKPj4gVG8gOiDrsJXrjIDspIA8ZGFlanVu
Ny5wYXJrQHNhbXN1bmcuY29tPiwgamFlZ2V1a0BrZXJuZWwub3JnPGphZWdldWtAa2VybmVsLm9y
Zz4sIHJvc3RlZHRAZ29vZG1pcy5vcmc8cm9zdGVkdEBnb29kbWlzLm9yZz4sIG1oaXJhbWF0QGtl
cm5lbC5vcmc8bWhpcmFtYXRAa2VybmVsLm9yZz4sIGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0PGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiwgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwg
bGludXgtdHJhY2Uta2VybmVsQHZnZXIua2VybmVsLm9yZzxsaW51eC10cmFjZS1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnPgo+PiBDQyA6IOq5gOyEne2ZmDxzdWtrYS5raW1Ac2Ftc3VuZy5jb20+LCDs
hqHsmqnquLg8eW9uZ2dpbC5zb25nQHNhbXN1bmcuY29tPiwg6rmA67KU7IiYPGJlb21zdTcua2lt
QHNhbXN1bmcuY29tPgo+PiAgIAo+PiBPbiAyMDIzLzUvMiAxMjoxNiwgRGFlanVuIFBhcmsgd3Jv
dGU6Cj4+PiBDaGFuZ2Vsb2c6Cj4+Pgo+Pj4gdjMgLT4gdjQKPj4+IEZpeGVkIGJ1aWxkIGVycm9y
IGNhdXNlZCBieSB1bnVzZWQgZnVuY3Rpb24uCj4+Pgo+Pj4gdjIgLT4gdjMKPj4+IE1vZGlmaWVk
IGFyZ3VtZW50cyB0byBiZSBjb3JyZWN0IGZvciBmdHJhY2UgcGFyYW1ldGVyLgo+Pj4gQ2hhbmdl
ZCBfX3N1Ym1pdF96b25lX3Jlc2V0X2NtZCB0byB2b2lkIHJldHVybi4KPj4+IFJlZmFjdG9yZWQg
dGhlIGYyZnNfd2FpdF9kaXNjYXJkX2JpbyBmdW5jdGlvbi4KPj4+IEZpeGVkIGNvZGUgdGhhdCB3
YXMgcHJldmlvdXNseSBpbmNvcnJlY3RseSBtZXJnZWQuCj4+Pgo+Pj4gdjEgLT4gdjIKPj4+IENo
YW5nZWQgdG8gYXBwbHkgdGhlIG9wdGlvbmFsIGFzeW5jIHJlc2V0IHdyaXRlIHBvaW50ZXIgYnkg
ZGVmYXVsdC4KPj4+Cj4+PiBUaGlzIHBhdGNoIGVuYWJsZXMgc3VibWl0IHJlc2V0IHpvbmUgY29t
bWFuZCBhc3luY2hvcm5vdXNseS4gSXQgaGVscHMKPj4+IGRlY3JlYXNlIGF2ZXJhZ2UgbGF0ZW5j
eSBvZiB3cml0ZSBJT3MgaW4gaGlnaCB1dGlsaXphdGlvbiBzY2VuYXJpbyBieQo+Pj4gZmFzdGVy
IGNoZWNrcG9pbnRpbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlanVuIFBhcmsgPGRhZWp1
bjcucGFya0BzYW1zdW5nLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGZzL2YyZnMvc2VnbWVudC5jIMKg
IMKgIMKgIMKgIMKgIHwgODMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+
Pj4gIMKgIGluY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCB8IDE4ICsrKysrKystCj4+PiAgwqAg
MiBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+PiBp
bmRleCA2ZGI0MTBmMWJiOGMuLmVjN2E4ZGU3MTE5OCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMv
c2VnbWVudC5jCj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gQEAgLTExOTYsNiArMTE5
Niw0NCBAQCBzdGF0aWMgdm9pZCBfX2luaXRfZGlzY2FyZF9wb2xpY3koc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLAo+Pj4gIMKgIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2Rpc2NhcmRfdHJlZV9yYW5n
ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGJs
b2NrX3QgbHN0YXJ0LAo+Pj4gIMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBibG9ja190IHN0YXJ0LCBibG9ja190IGxlbik7Cj4+PiArCj4+PiArI2lm
ZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+PiArc3RhdGljIHZvaWQgX19zdWJtaXRfem9uZV9y
ZXNldF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgZGlzY2FyZF9jbWQgKmRj
LCBibGtfb3BmX3QgZmxhZywKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IGxpc3RfaGVhZCAqd2FpdF9saXN0LAo+Pj4gKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1bnNpZ25lZCBp
bnQgKmlzc3VlZCkKPj4+ICt7Cj4+PiArIMKgIMKgIMKgIMKgc3RydWN0IGRpc2NhcmRfY21kX2Nv
bnRyb2wgKmRjYyA9IFNNX0koc2JpKS0+ZGNjX2luZm87Cj4+PiArIMKgIMKgIMKgIMKgc3RydWN0
IGJsb2NrX2RldmljZSAqYmRldiA9IGRjLT5iZGV2Owo+Pj4gKyDCoCDCoCDCoCDCoHN0cnVjdCBi
aW8gKmJpbyA9IGJpb19hbGxvYyhiZGV2LCAwLCBSRVFfT1BfWk9ORV9SRVNFVCB8IGZsYWcsIEdG
UF9OT0ZTKTsKPj4+ICsgwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4gKwo+Pj4g
KyDCoCDCoCDCoCDCoHRyYWNlX2YyZnNfaXNzdWVfcmVzZXRfem9uZShiZGV2LCBkYy0+ZGkuc3Rh
cnQpOwo+Pj4gKwo+Pj4gKyDCoCDCoCDCoCDCoHNwaW5fbG9ja19pcnFzYXZlKCZkYy0+bG9jaywg
ZmxhZ3MpOwo+Pj4gKyDCoCDCoCDCoCDCoGRjLT5zdGF0ZSA9IERfU1VCTUlUOwo+Pj4gKyDCoCDC
oCDCoCDCoGRjLT5iaW9fcmVmKys7Cj4+PiArIMKgIMKgIMKgIMKgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmZGMtPmxvY2ssIGZsYWdzKTsKPj4+ICsKPj4+ICsgwqAgwqAgwqAgwqBpZiAoaXNzdWVk
KQo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgqaXNzdWVkKSsrOwo+Pj4gKwo+Pj4gKyDC
oCDCoCDCoCDCoGF0b21pY19pbmMoJmRjYy0+cXVldWVkX2Rpc2NhcmQpOwo+Pj4gKyDCoCDCoCDC
oCDCoGRjLT5xdWV1ZWQrKzsKPj4+ICsgwqAgwqAgwqAgwqBsaXN0X21vdmVfdGFpbCgmZGMtPmxp
c3QsIHdhaXRfbGlzdCk7Cj4+PiArCj4+PiArIMKgIMKgIMKgIMKgLyogc2FuaXR5IGNoZWNrIG9u
IGRpc2NhcmQgcmFuZ2UgKi8KPj4+ICsgwqAgwqAgwqAgwqBfX2NoZWNrX3NpdF9iaXRtYXAoc2Jp
LCBkYy0+ZGkubHN0YXJ0LCBkYy0+ZGkubHN0YXJ0ICsgZGMtPmRpLmxlbik7Cj4+PiArCj4+PiAr
IMKgIMKgIMKgIMKgYmlvLT5iaV9pdGVyLmJpX3NlY3RvciA9IFNFQ1RPUl9GUk9NX0JMT0NLKGRj
LT5kaS5zdGFydCk7Cj4+PiArIMKgIMKgIMKgIMKgYmlvLT5iaV9wcml2YXRlID0gZGM7Cj4+PiAr
IMKgIMKgIMKgIMKgYmlvLT5iaV9lbmRfaW8gPSBmMmZzX3N1Ym1pdF9kaXNjYXJkX2VuZGlvOwo+
Pj4gKyDCoCDCoCDCoCDCoHN1Ym1pdF9iaW8oYmlvKTsKPj4KPj4gSG93IGFib3V0IGFjY291bnRp
bmcgaW9zdGF0IGluZm8gZm9yIHpvbmUgcmVzZXQgY29tbWFuZD8KPj4KPj4gZjJmc191cGRhdGVf
aW9zdGF0KHNiaSwgTlVMTCwgRlNfWk9ORV9SRVNFVF9JTywgbGVuICogRjJGU19CTEtTSVpFKTsK
PiAKPiBTdXJlLCBJIHdpbGwgZG8uCj4gICAKPj4+ICsKPj4+ICsgwqAgwqAgwqAgwqBhdG9taWNf
aW5jKCZkY2MtPmlzc3VlZF9kaXNjYXJkKTsKPj4+ICt9Cj4+PiArI2VuZGlmCj4+PiArCj4+PiAg
wqAgLyogdGhpcyBmdW5jdGlvbiBpcyBjb3BpZWQgZnJvbSBibGtkZXZfaXNzdWVfZGlzY2FyZCBm
cm9tIGJsb2NrL2Jsay1saWIuYyAqLwo+Pj4gIMKgIHN0YXRpYyBpbnQgX19zdWJtaXRfZGlzY2Fy
ZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gIMKgIMKgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZGlzY2FyZF9wb2xpY3kgKmRw
b2xpY3ksCj4+PiBAQCAtMTIxNyw2ICsxMjU1LDEzIEBAIHN0YXRpYyBpbnQgX19zdWJtaXRfZGlz
Y2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gIMKgIMKgwqAgwqAgwqAgwqBp
ZiAoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX05FRURfRlNDSykpCj4+PiAgwqAgwqDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOwo+Pj4gICAgCj4+PiArI2lmZGVmIENPTkZJR19CTEtf
REVWX1pPTkVECj4+PiArIMKgIMKgIMKgIMKgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkg
JiYgYmRldl9pc196b25lZChiZGV2KSkgewo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9f
c3VibWl0X3pvbmVfcmVzZXRfY21kKHNiaSwgZGMsIGZsYWcsIHdhaXRfbGlzdCwgaXNzdWVkKTsK
Pj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gMDsKPj4+ICsgwqAgwqAgwqAgwqB9
Cj4+PiArI2VuZGlmCj4+PiArCj4+PiAgwqAgwqDCoCDCoCDCoCDCoHRyYWNlX2YyZnNfaXNzdWVf
ZGlzY2FyZChiZGV2LCBkYy0+ZGkuc3RhcnQsIGRjLT5kaS5sZW4pOwo+Pj4gICAgCj4+PiAgwqAg
wqDCoCDCoCDCoCDCoGxzdGFydCA9IGRjLT5kaS5sc3RhcnQ7Cj4+PiBAQCAtMTQ2MSw2ICsxNTA2
LDE5IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2Rpc2NhcmRfdHJlZV9yYW5nZShzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4+PiAgwqAgwqDCoCDCoCDCoCDCoH0KPj4+ICDCoCB9Cj4+PiAgICAK
Pj4+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPj4+ICtzdGF0aWMgdm9pZCBfX3F1ZXVl
X3pvbmVfcmVzZXRfY21kKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBibG9ja190IGJsa3N0YXJ0
LCBibG9ja190IGxibGtzdGFydCwKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBibG9ja190
IGJsa2xlbikKPj4+ICt7Cj4+PiArIMKgIMKgIMKgIMKgdHJhY2VfZjJmc19xdWV1ZV9yZXNldF96
b25lKGJkZXYsIGJsa3N0YXJ0KTsKPj4+ICsKPj4+ICsgwqAgwqAgwqAgwqBtdXRleF9sb2NrKCZT
TV9JKHNiaSktPmRjY19pbmZvLT5jbWRfbG9jayk7Cj4+PiArIMKgIMKgIMKgIMKgX19pbnNlcnRf
ZGlzY2FyZF9jbWQoc2JpLCBiZGV2LCBsYmxrc3RhcnQsIGJsa3N0YXJ0LCBibGtsZW4pOwo+Pj4g
KyDCoCDCoCDCoCDCoG11dGV4X3VubG9jaygmU01fSShzYmkpLT5kY2NfaW5mby0+Y21kX2xvY2sp
Owo+Pj4gK30KPj4+ICsjZW5kaWYKPj4+ICsKPj4+ICDCoCBzdGF0aWMgdm9pZCBfX3F1ZXVlX2Rp
c2NhcmRfY21kKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICDCoCDCoMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgYmxvY2tfdCBibGtzdGFydCwg
YmxvY2tfdCBibGtsZW4pCj4+PiAgwqAgewo+Pj4gQEAgLTE3MjQsNiArMTc4MiwxOSBAQCBzdGF0
aWMgdm9pZCBmMmZzX3dhaXRfZGlzY2FyZF9iaW8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBi
bG9ja190IGJsa2FkZHIpCj4+PiAgICAKPj4+ICDCoCDCoMKgIMKgIMKgIMKgbXV0ZXhfbG9jaygm
ZGNjLT5jbWRfbG9jayk7Cj4+PiAgwqAgwqDCoCDCoCDCoCDCoGRjID0gX19sb29rdXBfZGlzY2Fy
ZF9jbWQoc2JpLCBibGthZGRyKTsKPj4+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPj4+
ICsgwqAgwqAgwqAgwqBpZiAoZGMgJiYgZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBiZGV2
X2lzX3pvbmVkKGRjLT5iZGV2KSkgewo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIGZv
cmNlIHN1Ym1pdCB6b25lIHJlc2V0ICovCj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYg
KGRjLT5zdGF0ZSA9PSBEX1BSRVApCj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgX19zdWJtaXRfem9uZV9yZXNldF9jbWQoc2JpLCBkYywgUkVRX1NZTkMsCj4+PiArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmRjYy0+d2FpdF9saXN0LCBOVUxMKTsKPj4+ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBkYy0+cmVmKys7Cj4+Cj4+IElJVUMsIHNob3VsZCBiZT8KPj4KPj4gZWxzZQo+PiAg
IMKgIMKgIMKgIMKgZGMtPnJlZisrOwo+Pgo+PiBUaGFua3MsCj4gCj4gSW4gY2FzZSBvZiBkaXNj
YXJkLCB3ZSBjYW4gZGVsZXRlIGEgcGVuZGluZyBkaXNjYXJkIHZpYSBfX3B1bmNoX2Rpc2NhcmRf
Y21kKCkuCj4gSG93ZXZlciwgd2UgY2Fubm90IHJlbW92ZSB0aGUgcGVuZGluZyB6b25lIHJlc2V0
IGNvbW1hbmQuCj4gQW5kLCB3ZSBzaG91bGQgYWx3YXlzIHdhaXQgZm9yIHRoZSBjb21wbGV0aW9u
IG9mIHRoZSB6b25lIHJlc2V0IGNvbW1hbmQsCj4gc28gSSBpbmNyZWFzZWQgdGhlIHJlZmVyZW5j
ZSBjb3VudGVyLgoKT2gsIEkgbWlzc2VkIHRoYXQgd2UgYWx3YXlzIGNhbGwgX193YWl0X29uZV9k
aXNjYXJkX2JpbygpIGZvciB6b25lIHJlc2V0IGNhc2UsCnRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9uIGFueXdheS4KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IERhZWp1bgo+IAo+ICAgCj4+PiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbXV0ZXhfdW5sb2NrKCZkY2MtPmNtZF9sb2NrKTsKPj4+
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiB3YWl0IHpvbmUgcmVzZXQgKi8KPj4+ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBfX3dhaXRfb25lX2Rpc2NhcmRfYmlvKHNiaSwgZGMpOwo+Pj4g
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjsKPj4+ICsgwqAgwqAgwqAgwqB9Cj4+PiAr
I2VuZGlmCj4+PiAgwqAgwqDCoCDCoCDCoCDCoGlmIChkYykgewo+Pj4gIMKgIMKgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAoZGMtPnN0YXRlID09IERfUFJFUCkgewo+Pj4gIMKgIMKgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX3B1bmNoX2Rpc2NhcmRfY21kKHNiaSwgZGMs
IGJsa2FkZHIpOwo+Pj4gQEAgLTE4NzYsOSArMTk0NywxNSBAQCBzdGF0aWMgaW50IF9fZjJmc19p
c3N1ZV9kaXNjYXJkX3pvbmUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gIMKgIMKgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYmxrc3RhcnQsIGJs
a2xlbik7Cj4+PiAgwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVy
biAtRUlPOwo+Pj4gIMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Cj4+PiAtIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdHJhY2VfZjJmc19pc3N1ZV9yZXNldF96b25lKGJkZXYsIGJsa3N0YXJ0
KTsKPj4+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gYmxrZGV2X3pvbmVfbWdtdChi
ZGV2LCBSRVFfT1BfWk9ORV9SRVNFVCwKPj4+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZWN0b3IsIG5yX3NlY3RzLCBHRlBfTk9G
Uyk7Cj4+PiArCj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHVubGlrZWx5KGlzX3Ni
aV9mbGFnX3NldChzYmksIFNCSV9QT1JfRE9JTkcpKSkgewo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRyYWNlX2YyZnNfaXNzdWVfcmVzZXRfem9uZShiZGV2LCBibGtz
dGFydCk7Cj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIGJs
a2Rldl96b25lX21nbXQoYmRldiwgUkVRX09QX1pPTkVfUkVTRVQsCj4+PiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc2VjdG9yLCBucl9zZWN0cywgR0ZQX05PRlMpOwo+Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH0KPj4+ICsKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX3F1ZXVlX3pvbmVfcmVz
ZXRfY21kKHNiaSwgYmRldiwgYmxrc3RhcnQsIGxibGtzdGFydCwgYmxrbGVuKTsKPj4+ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gMDsKPj4+ICDCoCDCoMKgIMKgIMKgIMKgfQo+Pj4g
ICAgCj4+PiAgwqAgwqDCoCDCoCDCoCDCoC8qIEZvciBjb252ZW50aW9uYWwgem9uZXMsIHVzZSBy
ZWd1bGFyIGRpc2NhcmQgaWYgc3VwcG9ydGVkICovCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS90
cmFjZS9ldmVudHMvZjJmcy5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oCj4+PiBpbmRl
eCA5OWNiYzU5NDllM2MuLmVlMTQ3N2RlODMyNCAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvdHJh
Y2UvZXZlbnRzL2YyZnMuaAo+Pj4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oCj4+
PiBAQCAtMTUxMiw3ICsxNTEyLDcgQEAgREVGSU5FX0VWRU5UKGYyZnNfZGlzY2FyZCwgZjJmc19y
ZW1vdmVfZGlzY2FyZCwKPj4+ICDCoCDCoMKgIMKgIMKgIMKgVFBfQVJHUyhkZXYsIGJsa3N0YXJ0
LCBibGtsZW4pCj4+PiAgwqAgKTsKPj4+ICAgIAo+Pj4gLVRSQUNFX0VWRU5UKGYyZnNfaXNzdWVf
cmVzZXRfem9uZSwKPj4+ICtERUNMQVJFX0VWRU5UX0NMQVNTKGYyZnNfcmVzZXRfem9uZSwKPj4+
ICAgIAo+Pj4gIMKgIMKgwqAgwqAgwqAgwqBUUF9QUk9UTyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpk
ZXYsIGJsb2NrX3QgYmxrc3RhcnQpLAo+Pj4gICAgCj4+PiBAQCAtMTUyOCwxMSArMTUyOCwyNSBA
QCBUUkFDRV9FVkVOVChmMmZzX2lzc3VlX3Jlc2V0X3pvbmUsCj4+PiAgwqAgwqDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoF9fZW50cnktPmJsa3N0YXJ0ID0gYmxrc3RhcnQ7Cj4+PiAgwqAgwqDCoCDC
oCDCoCDCoCksCj4+PiAgICAKPj4+IC0gwqAgwqAgwqAgwqBUUF9wcmludGsoImRldiA9ICglZCwl
ZCksIHJlc2V0IHpvbmUgYXQgYmxvY2sgPSAweCVsbHgiLAo+Pj4gKyDCoCDCoCDCoCDCoFRQX3By
aW50aygiZGV2ID0gKCVkLCVkKSwgem9uZSBhdCBibG9jayA9IDB4JWxseCIsCj4+PiAgwqAgwqDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNob3dfZGV2KF9fZW50cnktPmRldiksCj4+PiAgwqAgwqDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCh1bnNpZ25lZCBsb25nIGxvbmcpX19lbnRyeS0+Ymxrc3Rh
cnQpCj4+PiAgwqAgKTsKPj4+ICAgIAo+Pj4gK0RFRklORV9FVkVOVChmMmZzX3Jlc2V0X3pvbmUs
IGYyZnNfcXVldWVfcmVzZXRfem9uZSwKPj4+ICsKPj4+ICsgwqAgwqAgwqAgwqBUUF9QUk9UTyhz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpkZXYsIGJsb2NrX3QgYmxrc3RhcnQpLAo+Pj4gKwo+Pj4gKyDC
oCDCoCDCoCDCoFRQX0FSR1MoZGV2LCBibGtzdGFydCkKPj4+ICspOwo+Pj4gKwo+Pj4gK0RFRklO
RV9FVkVOVChmMmZzX3Jlc2V0X3pvbmUsIGYyZnNfaXNzdWVfcmVzZXRfem9uZSwKPj4+ICsKPj4+
ICsgwqAgwqAgwqAgwqBUUF9QUk9UTyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpkZXYsIGJsb2NrX3Qg
Ymxrc3RhcnQpLAo+Pj4gKwo+Pj4gKyDCoCDCoCDCoCDCoFRQX0FSR1MoZGV2LCBibGtzdGFydCkK
Pj4+ICspOwo+Pj4gKwo+Pj4gIMKgIFRSQUNFX0VWRU5UKGYyZnNfaXNzdWVfZmx1c2gsCj4+PiAg
ICAKPj4+ICDCoCDCoMKgIMKgIMKgIMKgVFBfUFJPVE8oc3RydWN0IGJsb2NrX2RldmljZSAqZGV2
LCB1bnNpZ25lZCBpbnQgbm9iYXJyaWVyLAo+Pgo+PiAgIAo+PiAgIAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
