Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLQ3OefdqGmVyAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:35:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C276209E40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13BVhuiFI4lXCSIs+VHpJFUw4A0l73bKBASb3yR8FhM=; b=ADQ3YV1NngLxdojW3+CamPNBI/
	/0RhSjOFSm6VsOMdohmBe6UP7YAYyz1adF31OcwHCZ2HSFlkXPA9TLLNn4vqpsac28PrjPVYFOabF
	pwtsMPl1JsofRrALxzghmKK6dd6N4hBGqBgWUdUMyZCtiaoXS2BYtx0eAi3j4hQSrSWc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxxcW-0004Bz-61;
	Thu, 05 Mar 2026 01:35:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1vxxcL-0004Bh-5y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EXWwKJSlvAuJjmKo2KqZ1sVw9tjIqLWlHE5ul2PZ78A=; b=mZFlzKhdIUjcnx718lVQDno1oB
 89oA5Yn6Dc87xjkLXf9Z8iRDH8qdRxS11U25vePZGLbnWf896Mj7pXsUgSk/ZnHJPGLs3bLSDIsST
 givQwZXbkZVQkXjZKsnXqwTxqHCSC+CQJdBfr12Lc9kL32Ueho3y7P3gOUuR52iqlV+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EXWwKJSlvAuJjmKo2KqZ1sVw9tjIqLWlHE5ul2PZ78A=; b=Z5EUI19Ga+wqZlKUA9P6ynjlOL
 PuibDFPKMVKvTlHYXji1ihGLfnxbuTjjPzJVDjN3Y9nV/KNN/cz0CIIurQN+6KrdsTteM7n1KfxkA
 4jjySQTHaYlGZWp9GQcAACxKsfvqo0V31Jd7bijHLclUEK8bhkcCKOtqRXXiCtktuAlI=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.123])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1vxxcF-0002F4-4y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:35:04 +0000
X-CSE-ConnectionGUID: sQ4cxOcXT1aukHkLkizIAw==
X-CSE-MsgGUID: C0SOwWu1Q7W2rCGTQWSigw==
X-IronPort-AV: E=Sophos;i="6.21,325,1763395200"; d="scan'208";a="168647797"
To: Chao Yu <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
Thread-Topic: [External Mail]Re: [PATCH] f2fs: avoid reading already updated
 pages during GC
Thread-Index: AQHcmY23caLNamfKiEKqYJHeIVOJHbWd5lmAgADcmIA=
Date: Thu, 5 Mar 2026 01:19:16 +0000
Message-ID: <d0ea280a-184f-4e0c-a5a8-37b4f54304b0@xiaomi.com>
References: <20260209063121.117451-1-huangjianan@xiaomi.com>
 <36d15a4f-d2ca-4294-aa87-4f52dbf84574@kernel.org>
In-Reply-To: <36d15a4f-d2ca-4294-aa87-4f52dbf84574@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.8.163]
Content-ID: <4F99CC4667D7B74388C4B2DEF1E0AB77@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/4/2026 8:09 PM, Chao Yu wrote: > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请
    > 将邮件转发给misec@xiaomi.com进行反馈 > > On [...] 
 
 Content analysis details:   (0.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [207.226.244.123 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxxcF-0002F4-4y
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH] f2fs: avoid reading
 already updated pages during GC
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
From: =?utf-8?B?6buE5L2z55S3?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6buE5L2z55S3?= <huangjianan@xiaomi.com>
Cc: =?utf-8?B?55ub5YuH?= <shengyong1@xiaomi.com>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 3C276209E40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:wanghui33@xiaomi.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:replyto,xiaomi.com:email,xiaomi.com:mid,syzkaller.appspot.com:url];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[huangjianan@xiaomi.com]
X-Rspamd-Action: no action

T24gMy80LzIwMjYgODowOSBQTSwgQ2hhbyBZdSB3cm90ZToNCj4gW+WklumDqOmCruS7tl0g5q2k
6YKu5Lu25p2l5rqQ5LqO5bCP57Gz5YWs5Y+45aSW6YOo77yM6K+36LCo5oWO5aSE55CG44CC6Iul
5a+56YKu5Lu25a6J5YWo5oCn5a2Y55aR77yM6K+3IA0KPiDlsIbpgq7ku7bovazlj5Hnu5ltaXNl
Y0B4aWFvbWkuY29t6L+b6KGM5Y+N6aaIDQo+IA0KPiBPbiAyMDI2LzIvOSAxNDozMSwgSmlhbmFu
IEh1YW5nIHdyb3RlOg0KPj4gV2UgZm91bmQgdGhlIGZvbGxvd2luZyBpc3N1ZSBkdXJpbmcgZnV6
eiB0ZXN0aW5nOg0KPj4NCj4+IHBhZ2U6IHJlZmNvdW50OjMgbWFwY291bnQ6MCBtYXBwaW5nOjAw
MDAwMDAwYjZlODljNjUgaW5kZXg6MHgxOGIyZGMgDQo+PiBwZm46MHgxNjFiYTkNCj4+IG1lbWNn
OmY4ZmZmZjgwMGUyNjljMDANCj4+IGFvcHM6ZjJmc19tZXRhX2FvcHMgaW5vOjINCj4+IGZsYWdz
OiAweDUyODgwMDAwMDAwMDgwYTkobG9ja2VkfHdhaXRlcnN8dXB0b2RhdGV8bHJ1fHByaXZhdGV8
em9uZT0xfCANCj4+IGthc2FudGFnPTB4NGEpDQo+PiByYXc6IDUyODgwMDAwMDAwMDgwYTkgZmZm
ZmZmZmVjNmUxNzU4OCBmZmZmZmZmZWMwY2NjMDg4IGE3ZmZmZjgwNjcwNjM2MTgNCj4+IHJhdzog
MDAwMDAwMDAwMDE4YjJkYyAwMDAwMDAwMDAwMDAwMDA5IDAwMDAwMDAzZmZmZmZmZmYgZjhmZmZm
ODAwZTI2OWMwMA0KPj4gcGFnZSBkdW1wZWQgYmVjYXVzZTogVk1fQlVHX09OX0ZPTElPKGZvbGlv
X3Rlc3RfdXB0b2RhdGUoZm9saW8pKQ0KPj4gcGFnZV9vd25lciB0cmFja3MgdGhlIHBhZ2UgYXMg
YWxsb2NhdGVkDQo+PiDCoCBwb3N0X2FsbG9jX2hvb2srMHg1OGMvMHg1ZWMNCj4+IMKgIHByZXBf
bmV3X3BhZ2UrMHgzNC8weDI4NA0KPj4gwqAgZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCsweDJkY2Mv
MHgyZThjDQo+PiDCoCBfX2FsbG9jX3BhZ2VzX25vcHJvZisweDI4MC8weDc2Yw0KPj4gwqAgX19m
b2xpb19hbGxvY19ub3Byb2YrMHgxOC8weGFjDQo+PiDCoCBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKzB4
NmJjLzB4ZGM0DQo+PiDCoCBwYWdlY2FjaGVfZ2V0X3BhZ2UrMHgzYy8weDEwNA0KPj4gwqAgZG9f
Z2FyYmFnZV9jb2xsZWN0KzB4NWM3OC8weDc3YTQNCj4+IMKgIGYyZnNfZ2MrMHhkNzQvMHgyNWYw
DQo+PiDCoCBnY190aHJlYWRfZnVuYysweGIyOC8weDI5MzANCj4+IMKgIGt0aHJlYWQrMHg0NjQv
MHg1ZDgNCj4+IMKgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwDQo+PiAtLS0tLS0tLS0tLS1bIGN1
dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4+IGtlcm5lbCBCVUcgYXQgbW0vZmlsZW1hcC5jOjE1NjMh
DQo+PiDCoCBmb2xpb19lbmRfcmVhZCsweDE0MC8weDE2OA0KPj4gwqAgZjJmc19maW5pc2hfcmVh
ZF9iaW8rMHg1YzQvMHhiODANCj4+IMKgIGYyZnNfcmVhZF9lbmRfaW8rMHg2NGMvMHg3MDgNCj4+
IMKgIGJpb19lbmRpbysweDg1Yy8weDhjMA0KPj4gwqAgYmxrX3VwZGF0ZV9yZXF1ZXN0KzB4Njkw
LzB4MTI3Yw0KPj4gwqAgc2NzaV9lbmRfcmVxdWVzdCsweDljLzB4YjhjDQo+PiDCoCBzY3NpX2lv
X2NvbXBsZXRpb24rMHhmMC8weDI1MA0KPj4gwqAgc2NzaV9maW5pc2hfY29tbWFuZCsweDQzMC8w
eDQ1Yw0KPj4gwqAgc2NzaV9jb21wbGV0ZSsweDE3OC8weDZkNA0KPj4gwqAgYmxrX21xX2NvbXBs
ZXRlX3JlcXVlc3QrMHhjYy8weDEwNA0KPj4gwqAgc2NzaV9kb25lX2ludGVybmFsKzB4MjE0LzB4
NDU0DQo+PiDCoCBzY3NpX2RvbmUrMHgyNC8weDM0DQo+Pg0KPj4gd2hpY2ggaXMgc2ltaWxhciB0
byB0aGUgcHJvYmxlbSByZXBvcnRlZCBieSBzeXpib3Q6DQo+PiBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS9idWc/ZXh0aWQ9MzY4Njc1ODY2MGY5ODBiNDAyZGMNCj4+DQo+PiBUaGlzIGNh
c2UgaXMgY29uc2lzdGVudCB3aXRoIHRoZSBkZXNjcmlwdGlvbiBpbiBjb21taXQgOWJmMWEzZg0K
Pj4gKCJmMmZzOiBhdm9pZCBHQyBjYXVzaW5nIGVuY3J5cHRlZCBmaWxlIGNvcnJ1cHRlZCIpOg0K
Pj4gUGFnZSAxIGlzIG1vdmVkIGZyb20gYmxrYWRkciBBIHRvIGJsa2FkZHIgQiBieSBtb3ZlX2Rh
dGFfYmxvY2ssIGFuZCBhZnRlcg0KPj4gYmVpbmcgd3JpdHRlbiBpdCBpcyBtYXJrZWQgYXMgdXB0
b2RhdGUuIFRoZW4sIFBhZ2UgMSBpcyBtb3ZlZCBmcm9tIA0KPj4gYmxrYWRkcg0KPj4gQiB0byBi
bGthZGRyIEMsIFZNX0JVR19PTl9GT0xJTyB3YXMgdHJpZ2dlcmVkIGluIHRoZSBlbmRpbyBpbml0
aWF0ZWQgYnkNCj4+IHJhX2RhdGFfYmxvY2suDQo+Pg0KPj4gVGhlcmUgaXMgbm8gbmVlZCB0byBy
ZWFkIFBhZ2UgMSBhZ2FpbiBmcm9tIGJsa2FkZHIgQiwgc2luY2UgaXQgaGFzIA0KPj4gYWxyZWFk
eQ0KPj4gYmVlbiB1cGRhdGVkLiBUaGVyZWZvcmUsIGF2b2lkIGluaXRpYXRpbmcgSS9PIGluIHRo
aXMgY2FzZS4NCj4+DQo+PiBGaXhlczogNmFhNThkOGFkMjBhICgiZjJmczogcmVhZGFoZWFkIGVu
Y3J5cHRlZCBibG9jayBkdXJpbmcgR0MiKQ0KPj4gU2lnbmVkLW9mZi1ieTogSmlhbmFuIEh1YW5n
IDxodWFuZ2ppYW5hbkB4aWFvbWkuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8
c2hlbmd5b25nMUB4aWFvbWkuY29tPg0KPj4gLS0tDQo+PiDCoCBmcy9mMmZzL2djLmMgfCA1ICsr
KystDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYw0KPj4gaW5k
ZXggNjAzNzg2MTRiYzU0Li5jMTg0YWU2YTYxNmUgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL2dj
LmMNCj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYw0KPj4gQEAgLTEyMjgsNyArMTIyOCw3IEBAIHN0YXRp
YyBpbnQgcmFfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCANCj4+IHBnb2ZmX3QgaW5k
ZXgpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZW5jcnlwdGVkX3BhZ2UgPSBOVUxM
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmluX2xpc3QgPSAwLA0KPj4gwqDCoMKg
wqDCoCB9Ow0KPj4gLcKgwqDCoMKgIGludCBlcnI7DQo+PiArwqDCoMKgwqAgaW50IGVyciA9IDA7
DQo+Pg0KPj4gwqDCoMKgwqDCoCBmb2xpbyA9IGYyZnNfZ3JhYl9jYWNoZV9mb2xpbyhtYXBwaW5n
LCBpbmRleCwgdHJ1ZSk7DQo+PiDCoMKgwqDCoMKgIGlmIChJU19FUlIoZm9saW8pKQ0KPj4gQEAg
LTEyNzksNiArMTI3OSw5IEBAIHN0YXRpYyBpbnQgcmFfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCANCj4+IHBnb2ZmX3QgaW5kZXgpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIHB1dF9mb2xpbzsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4NCj4+ICvCoMKgwqDCoCBpZiAo
Zm9saW9fdGVzdF91cHRvZGF0ZShlZm9saW8pKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIHB1dF9lbmNyeXB0ZWRfcGFnZTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgZmlvLmVuY3J5
cHRlZF9wYWdlID0gJmVmb2xpby0+cGFnZTsNCj4gDQo+IFNob3VsZCByZWxvY2F0ZSBjaGFuZ2Vz
IGhlcmUsIG90aGVyd2lzZSwgZmlvLmVuY3J5cHRlZF9wYWdlIHdpbGwgYmUgdXNlZCANCj4gYmVm
b3JlDQo+IGluaXRpYWxpemF0aW9uLg0KDQpVcGRhdGVkIGluIHYyLg0KDQpUaGFua3MsDQoNCj4g
DQo+IDEyOTnCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiAxMzAwIHB1dF9lbmNyeXB0ZWRf
cGFnZToNCj4gMTMwMcKgwqDCoMKgwqDCoMKgwqAgZjJmc19wdXRfcGFnZShmaW8uZW5jcnlwdGVk
X3BhZ2UsIHRydWUpOw0KPiAxMzAyIHB1dF9mb2xpbzoNCj4gMTMwM8KgwqDCoMKgwqDCoMKgwqAg
ZjJmc19mb2xpb19wdXQoZm9saW8sIHRydWUpOw0KPiAxMzA0wqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gZXJyOw0KPiANCj4gVGhhbmtzLA0KPiANCj4+DQo+PiDCoMKgwqDCoMKgIGVyciA9IGYyZnNf
c3VibWl0X3BhZ2VfYmlvKCZmaW8pOw0KPiANCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
