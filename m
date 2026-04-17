Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAadCjw14mm13QAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 15:27:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F441BA00
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 15:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10QAszGJcmf5jD6xVISyVHMBkJNpggkxmzzmF/qOv5Y=; b=aVXXe19mNWIqWSejH5PNx8qTIA
	avhRow1VaGxuJbfkLHPlg+TT6iErglff6YtRO891lPYDDoVVNaKMkPj88+HwN4qyMoH8xmEg6aDn0
	e3E54hnwo/K8CcHmxBJbSdPmOoq+1mTEX96HMIOqkf2/xDwQl6AwYqG3EX4kO3wTqmlM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDjDq-0006XX-Lk;
	Fri, 17 Apr 2026 13:27:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wDjDp-0006XJ-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 13:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+O9I/As2wXd554PDOyLC79OK/LQa94BQasISuolRP8=; b=gf2G9SY30Q+eoZ1pqY4tKJJfJB
 OZTe7ktO2LjR8P3rF1sYNNY4s1Bd7VTKpBly6ypQchKB/wlPm6Bxe6UqBZX6m/iKah5P3L1/3R+J7
 d23d+IkdlFjJzR/iZRCgvuSjEiFP0KW9EgDy+ZT2z313g06Dj/QWXnURdCDdcDeUmzxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z+O9I/As2wXd554PDOyLC79OK/LQa94BQasISuolRP8=; b=XRFkDRkeC1Pgwsg3GzxUTHKxi0
 psejbEtO5WTO2ksuZYfMIlPgSNBDF5m2/pRPaFAQIpY8CS4sCiBRAV5H7CHsNzANucfMhJP/PgJ0u
 xtRxQpdUOL1rl9aybx84I4G/jK7qJPtGM7+OrH9YJ7FwNojB/8LsrM0ShZpAOBvfAfaQ=;
Received: from mail3-165.sinamail.sina.com.cn ([202.108.3.165])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDjDn-0004H4-OZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 13:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1776432419; bh=Z+O9I/As2wXd554PDOyLC79OK/LQa94BQasISuolRP8=;
 h=Message-ID:Date:Subject:From;
 b=NFcL30xN1kUzfvD3DkO6f8AL9wjJXzM9teJr1ps0dwR2xhBP2FquH2Okd0FHuLkep
 aDu/UN5STv+JcdtTXpTNZqlCVX3D/4UwkVcFiGYIBM2oxfYpizMqtkB/8pQmDrvD0p
 vH7IGNQYylaPxS/G8/WbUFQNuD0R/P4Sd+SVFVbs=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69E23511000004F3; Fri, 17 Apr 2026 21:26:43 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 167296685210
X-SMAIL-UIID: 5C524A06982C4DD1A6AE6495D6EFA55B-20260417-212643-1
Message-ID: <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
Date: Fri, 17 Apr 2026 21:26:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/17/26 17:00, Chao Yu via Linux-f2fs-devel wrote: > On
 4/3/26 22:40,
 Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> f2fs_destroy_extent_node()
 does not set FI_NO_EXTENT before clearing >> ex [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.165 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wDjDn-0004H4-OZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix node_cnt race between extent node
 destroy and writeback
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 5C4F441BA00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMTcvMjYgMTc6MDAsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gNC8zLzI2IDIyOjQwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZb25ncGVuZyBZ
YW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gZjJmc19kZXN0cm95X2V4dGVudF9u
b2RlKCkgZG9lcyBub3Qgc2V0IEZJX05PX0VYVEVOVCBiZWZvcmUgY2xlYXJpbmcKPj4gZXh0ZW50
IG5vZGVzLiBXaGVuIGNhbGxlZCBmcm9tIGYyZnNfZHJvcF9pbm9kZSgpIHdpdGggSV9TWU5DIHNl
dCwKPj4gY29uY3VycmVudCBrd29ya2VyIHdyaXRlYmFjayBjYW4gaW5zZXJ0IG5ldyBleHRlbnQg
bm9kZXMgaW50byB0aGUgc2FtZQo+PiBleHRlbnQgdHJlZSwgcmFjaW5nIHdpdGggdGhlIGRlc3Ry
b3kgYW5kIHRyaWdnZXJpbmcgZjJmc19idWdfb24oKSBpbgo+PiBfX2Rlc3Ryb3lfZXh0ZW50X25v
ZGUoKS4gVGhlIHNjZW5hcmlvIGlzIGFzIGZvbGxvd3M6Cj4+Cj4+IGRyb3AgaW5vZGXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGViYWNr
Cj4+IMKgIC0gaXB1dAo+PiDCoMKgIC0gZjJmc19kcm9wX2lub2RlwqAgLy8gSV9TWU5DIHNldAo+
PiDCoMKgwqAgLSBmMmZzX2Rlc3Ryb3lfZXh0ZW50X25vZGUKPj4gwqDCoMKgwqAgLSBfX2Rlc3Ry
b3lfZXh0ZW50X25vZGUKPj4gwqDCoMKgwqDCoCAtIHdoaWxlIChub2RlX2NudCkgewo+PiDCoMKg
wqDCoMKgwqDCoMKgIHdyaXRlX2xvY2soJmV0LT5sb2NrKQo+PiDCoMKgwqDCoMKgwqDCoMKgIF9f
ZnJlZV9leHRlbnRfdHJlZQo+PiDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxv
Y2spCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGUK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gX191cGRhdGVfZXh0ZW50X3RyZWVfcmFu
Z2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gRklfTk9fRVhURU5UIG5vdCBz
ZXQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGluc2VydCBuZXcgZXh0ZW50
IG5vZGUKPj4gwqDCoMKgwqDCoMKgwqAgfSAvLyBub2RlX2NudCA9PSAwLCBleGl0IHdoaWxlCj4+
IMKgwqDCoMKgwqAgLSBmMmZzX2J1Z19vbihub2RlX2NudCnCoCAvLyBub2RlX2NudCA+IDAKPj4K
Pj4gQWRkaXRpb25hbGx5LCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSgpIG9ubHkgY2hlY2tz
IEZJX05PX0VYVEVOVCBmb3IKPj4gRVhfUkVBRCB0eXBlLCBsZWF2aW5nIEVYX0JMT0NLX0FHRSB1
cGRhdGVzIGNvbXBsZXRlbHkgdW5wcm90ZWN0ZWQuCj4+Cj4+IFRoaXMgcGF0Y2ggc2V0IEZJX05P
X0VYVEVOVCB1bmRlciBldC0+bG9jayBpbiBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoKSwKPj4gY29u
c2lzdGVudCB3aXRoIG90aGVyIGNhbGxlcnMgKF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlIGFu
ZAo+PiBfX2Ryb3BfZXh0ZW50X3RyZWUpIGFuZCBjaGVjayBGSV9OT19FWFRFTlQgZm9yIGJvdGgg
RVhfUkVBRCBhbmQKPj4gRVhfQkxPQ0tfQUdFIHRyZWUuCj4gCj4gSSBzdWZmZXJlZCBiZWxvdyB0
ZXN0IGZhaWx1cmUsIHRoZW4gSSBiaXNlY3QgdG8gdGhpcyBjaGFuZ2UuCj4gCj4gwqDCoMKgIGdl
bmVyaWMvNDc1wqAgODRzIC4uLiBbZmFpbGVkLCBleGl0IHN0YXR1cyAxXS0gb3V0cHV0IG1pc21h
dGNoIChzZWUgLwo+IHNoYXJlL2dpdC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5i
YWQpCj4gwqDCoMKgIC0tLSB0ZXN0cy9nZW5lcmljLzQ3NS5vdXTCoMKgIDIwMjUtMDEtMTIgMjE6
NTc6NDAuMjc5NDQwNjY0ICswODAwCj4gwqDCoMKgICsrKyAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVz
dWx0cy8vZ2VuZXJpYy80NzUub3V0LmJhZCAyMDI2LTA0LTE3Cj4gMTI6MDg6MjguMDAwMDAwMDAw
ICswODAwCj4gwqDCoMKgIEBAIC0xLDIgKzEsNiBAQAo+IMKgwqDCoMKgIFFBIG91dHB1dCBjcmVh
dGVkIGJ5IDQ3NQo+IMKgwqDCoMKgIFNpbGVuY2UgaXMgZ29sZGVuLgo+IMKgwqDCoCArbW91bnQ6
IC9tbnQvc2NyYXRjaF9mMmZzOiBtb3VudCBzeXN0ZW0gY2FsbCBmYWlsZWQ6IFN0cnVjdHVyZSBu
ZWVkcwo+IGNsZWFuaW5nLgo+IMKgwqDCoCArwqDCoMKgwqDCoMKgIGRtZXNnKDEpIG1heSBoYXZl
IG1vcmUgaW5mb3JtYXRpb24gYWZ0ZXIgZmFpbGVkIG1vdW50IHN5c3RlbQo+IGNhbGwuCj4gwqDC
oMKgICttb3VudCBmYWlsZWQKPiDCoMKgwqAgKyhzZWUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Jlc3Vs
dHMvL2dlbmVyaWMvNDc1LmZ1bGwgZm9yIGRldGFpbHMpCj4gwqDCoMKgIC4uLgo+IMKgwqDCoCAo
UnVuICdkaWZmIC11IC9zaGFyZS9naXQvZnN0ZXN0cy90ZXN0cy9nZW5lcmljLzQ3NS5vdXQgL3No
YXJlL2dpdC8KPiBmc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQnwqAgdG8gc2Vl
IHRoZSBlbnRpcmUgZGlmZikKPiAKPiAKPiDCoMKgwqAgZ2VuZXJpYy8zODjCoCA3M3MgLi4uIFtm
YWlsZWQsIGV4aXQgc3RhdHVzIDFdLSBvdXRwdXQgbWlzbWF0Y2ggKHNlZSAvCj4gc2hhcmUvZ2l0
L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCkKPiDCoMKgwqAgLS0tIHRlc3Rz
L2dlbmVyaWMvMzg4Lm91dMKgwqAgMjAyNS0wMS0xMiAyMTo1Nzo0MC4yNzU0NDA2MDIgKzA4MDAK
PiDCoMKgwqAgKysrIC9zaGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzM4OC5vdXQu
YmFkIDIwMjYtMDQtMTcKPiAxMTo1ODowNS4wMDAwMDAwMDAgKzA4MDAKPiDCoMKgwqAgQEAgLTEs
MiArMSw2IEBACj4gwqDCoMKgwqAgUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMzg4Cj4gwqDCoMKgwqAg
U2lsZW5jZSBpcyBnb2xkZW4uCj4gwqDCoMKgICttb3VudDogL21udC9zY3JhdGNoX2YyZnM6IG1v
dW50IHN5c3RlbSBjYWxsIGZhaWxlZDogU3RydWN0dXJlIG5lZWRzCj4gY2xlYW5pbmcuCj4gwqDC
oMKgICvCoMKgwqDCoMKgwqAgZG1lc2coMSkgbWF5IGhhdmUgbW9yZSBpbmZvcm1hdGlvbiBhZnRl
ciBmYWlsZWQgbW91bnQgc3lzdGVtCj4gY2FsbC4KPiDCoMKgwqAgK2N5Y2xlIG1vdW50IGZhaWxl
ZAo+IMKgwqDCoCArKHNlZSAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgu
ZnVsbCBmb3IgZGV0YWlscykKPiDCoMKgwqAgLi4uCj4gwqDCoMKgIChSdW4gJ2RpZmYgLXUgL3No
YXJlL2dpdC9mc3Rlc3RzL3Rlc3RzL2dlbmVyaWMvMzg4Lm91dCAvc2hhcmUvZ2l0Lwo+IGZzdGVz
dHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCfCoCB0byBzZWUgdGhlIGVudGlyZSBkaWZm
KQo+IAo+IAo+IMKgwqDCoCBGMkZTLWZzIChkbS0wKTogc2FuaXR5X2NoZWNrX2V4dGVudF9jYWNo
ZTogaW5vZGUgKGlubz0xNzYxKSBleHRlbnQKPiBpbmZvIFsyMjAwNTcsIDU3LCA2XSBpcyBpbmNv
cnJlY3QsIHJ1biBmc2NrIHRvIGZpeAo+IAo+IEkgc3VzcGVjdCB3ZSBtYXkgbWlzcyBhbnkgZXh0
ZW50IHVwZGF0ZXMgYWZ0ZXIgd2Ugc2V0IEZJX05PX0VYVEVOVCBpbgo+IF9fZGVzdHJveV9leHRl
bnRfbm9kZSgpLCByZXN1bHQgaW4gZmFpbGluZyBpbiBzYW5pdHlfY2hlY2tfZXh0ZW50X2NhY2hl
KCkuCj4gCj4gQ2FuIHdlIGp1c3QgcmVsb2NhdGUgZjJmc19idWdfb24obm9kZV9jbnQpIHJhdGhl
ciB0aGFuIGNvbXBsaWNhdGVkIGNoYW5nZT8KPiBUaG91Z2h0cz8KCk9oLCBJIG92ZXJsb29rZWQg
bGFyZ2VzdCBleHRlbnQuIEhvdyBhYm91dCByZWxvY2F0ZQpmMmZzX2J1Z19vbihub2RlX2NudCkg
dG8gX19kZXN0cm95X2V4dGVudF90cmVlPwoKc3RhdGljIHZvaWQgX19kZXN0cm95X2V4dGVudF90
cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGVudW0gZXh0ZW50X3R5cGUKdHlwZSkKCiAgICAgICAg
LyogZnJlZSBhbGwgZXh0ZW50IGluZm8gYmVsb25nIHRvIHRoaXMgZXh0ZW50IHRyZWUgKi8KICAg
ICAgICBub2RlX2NudCA9IF9fZGVzdHJveV9leHRlbnRfbm9kZShpbm9kZSwgdHlwZSk7CisgICAg
ICAgZjJmc19idWdfb24oc2JpLCBhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSk7CgpUaGFua3MK
WW9uZ3BlbmcsCgo+IAo+IFRoYW5rcywKPiAKPj4KPj4gRml4ZXM6IDNmYzVkNWExODJmNiAoImYy
ZnM6IGZpeCB0byBzaHJpbmsgcmVhZCBleHRlbnQgbm9kZSBpbiBiYXRjaGVzIikKPj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2V4dGVudF9jYWNoZS5j
IHwgMTcgKysrKysrKysrKy0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4dGVudF9j
YWNoZS5jIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+PiBpbmRleCAwZWQ4NGNjMDY1YTcuLjg3
MTY5ZmQyOWQ4OSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+PiArKysg
Yi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+IEBAIC0xMTksOSArMTE5LDEwIEBAIHN0YXRpYyBi
b29sIF9fbWF5X2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZQo+PiAqaW5vZGUsIGVudW0gZXh0ZW50
X3R5cGUgdHlwZSkKPj4gwqDCoMKgwqDCoCBpZiAoIV9faW5pdF9tYXlfZXh0ZW50X3RyZWUoaW5v
ZGUsIHR5cGUpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+PiDCoCArwqDC
oMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4gKwo+PiDCoMKgwqDCoMKgIGlmICh0eXBlID09IEVY
X1JFQUQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwg
RklfTk9fRVhURU5UKSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9DT01Q
UkVTU0VEX0ZJTEUpICYmCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAh
ZjJmc19zYl9oYXNfcmVhZG9ubHkoRjJGU19JX1NCKGlub2RlKSkpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4gQEAgLTY0NCw2ICs2NDUsOCBAQCBzdGF0aWMg
dW5zaWduZWQgaW50IF9fZGVzdHJveV9leHRlbnRfbm9kZShzdHJ1Y3QKPj4gaW5vZGUgKmlub2Rl
LAo+PiDCoCDCoMKgwqDCoMKgIHdoaWxlIChhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSkgewo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKCFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBub2RlX2NudCArPSBfX2ZyZWVfZXh0ZW50X3RyZWUoc2Jp
LCBldCwgbnJfc2hyaW5rKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQt
PmxvY2spOwo+PiDCoMKgwqDCoMKgIH0KPj4gQEAgLTY4OCwxMiArNjkxLDEyIEBAIHN0YXRpYyB2
b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdAo+PiBpbm9kZSAqaW5vZGUsCj4+
IMKgIMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+PiDCoCAtwqDCoMKgIGlmICh0
eXBlID09IEVYX1JFQUQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3Nl
dChpbm9kZSwgRklfTk9fRVhURU5UKSkgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0
ZV91bmxvY2soJmV0LT5sb2NrKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+
PiAtwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9k
ZSwgRklfTk9fRVhURU5UKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZldC0+
bG9jayk7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqAgfQo+PiDCoCArwqDC
oMKgIGlmICh0eXBlID09IEVYX1JFQUQpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByZXYgPSBl
dC0+bGFyZ2VzdDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5sZW4gPSAwOwo+PiDCoCAKPiAK
PiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
