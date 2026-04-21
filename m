Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ny1NSQ552no5QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 10:45:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 519B6438534
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 10:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgjoE5NHXfQeqAcVDepUFFljTQekWLzHVKAYm+Yn+0w=; b=My6joWNWJa5SX76v4nYNamFIWh
	NT0ttsN1HmM8M2x3VYYDrA7+aVva8rmyjyGBpwnBRfUUpi7RwfrxmPWZHpVeG4VGamlSQfQe6gl6C
	0jmPgQLOE7TxEX5BylB0/i9UXjX9Li7jUWb7pJIu1EpDtuxGGz0VVp6rr7+xJflKGi+Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wF6jK-0000G4-8Q;
	Tue, 21 Apr 2026 08:45:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wF6jE-0000Dm-KY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 08:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E2sUUyzl/czcG49TlhncKVUKZFEb4ZnT0W3kUUQuXsU=; b=YqgzH8WfLHy9jKJsoyZiTs4OWQ
 no5yxBRi9cuAn5x9BgYwBHPQ7CHny5m1t5igTeWPflEyA/y5qJwP9KyrNaMOPcFuFTpLY86gQofrs
 wQLxU26FWiKgQdb13YaIdPYw/KBxz6qJjmH5WyJVxRyKiSFVRywLvf3ETDdLm5yZKqdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E2sUUyzl/czcG49TlhncKVUKZFEb4ZnT0W3kUUQuXsU=; b=lZsjTXat3o2tXvzsV58H3muNHO
 7fWCDZfbZ1kBN1xlWEIoYWiF9IwW2CaHmogFUMRYQIrOG4MEbCqb6ZGWIWcvjXSPWbteF65wzmrwZ
 sU1YLVCRkvHY0MsDYImpYV9XSIrHBIhPdFp5INChYbLaVrw3BHOxk77nkDJziwUQiYa8=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wF6jA-0005dW-M7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 08:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1776761104; bh=E2sUUyzl/czcG49TlhncKVUKZFEb4ZnT0W3kUUQuXsU=;
 h=Message-ID:Date:Subject:From;
 b=CmWYlgz0lKb7PVT4daksKQqNr3aK3y0gXLzGM7a7rewGvpZu3+lfuvxIz6DqpSSsm
 qamr4QM+UzRPLo7OcX40aDiKL5luvjySuJip1EBgc9CQgtnZGyPs3iHS0W02EWVPdZ
 dZT1VSnegosvIYmp/6t85BwwWj2zcNKiXguCG+8c=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69E7390000004791; Tue, 21 Apr 2026 16:44:49 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 7061554456623
X-SMAIL-UIID: 363ED1C54E7D49C7898FF01356C99AC9-20260421-164449-1
Message-ID: <252cb446-e313-417b-b780-85dcdcf34a87@sina.com>
Date: Tue, 21 Apr 2026 16:44:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
 <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
 <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
 <a643b967-cb05-4de5-96f2-f1b783c9758d@sina.com>
 <bedd1951-681b-4364-80c9-c7fe6886c992@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <bedd1951-681b-4364-80c9-c7fe6886c992@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/20/26 15:28, Chao Yu via Linux-f2fs-devel wrote: > On
 4/19/2026 12:29 AM, Yongpeng Yang wrote: >> >> On 4/18/26 8:51 AM, Chao Yu
 via Linux-f2fs-devel wrote: >>> On 4/17/26 21:26, Yongpeng Yang w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.19 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wF6jA-0005dW-M7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 519B6438534
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMjAvMjYgMTU6MjgsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gNC8xOS8yMDI2IDEyOjI5IEFNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiA0LzE4
LzI2IDg6NTEgQU0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBPbiA0
LzE3LzI2IDIxOjI2LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gNC8xNy8yNiAx
NzowMCwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+Pj4gT24gNC8zLzI2
IDIyOjQwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8
eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gZjJmc19kZXN0cm95X2V4dGVu
dF9ub2RlKCkgZG9lcyBub3Qgc2V0IEZJX05PX0VYVEVOVCBiZWZvcmUgY2xlYXJpbmcKPj4+Pj4+
IGV4dGVudCBub2Rlcy4gV2hlbiBjYWxsZWQgZnJvbSBmMmZzX2Ryb3BfaW5vZGUoKSB3aXRoIElf
U1lOQyBzZXQsCj4+Pj4+PiBjb25jdXJyZW50IGt3b3JrZXIgd3JpdGViYWNrIGNhbiBpbnNlcnQg
bmV3IGV4dGVudCBub2RlcyBpbnRvIHRoZQo+Pj4+Pj4gc2FtZQo+Pj4+Pj4gZXh0ZW50IHRyZWUs
IHJhY2luZyB3aXRoIHRoZSBkZXN0cm95IGFuZCB0cmlnZ2VyaW5nIGYyZnNfYnVnX29uKCkgaW4K
Pj4+Pj4+IF9fZGVzdHJveV9leHRlbnRfbm9kZSgpLiBUaGUgc2NlbmFyaW8gaXMgYXMgZm9sbG93
czoKPj4+Pj4+Cj4+Pj4+PiBkcm9wIGlub2RlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlYmFjawo+Pj4+Pj4gwqDCoMKgIC0gaXB1dAo+
Pj4+Pj4gwqDCoMKgwqAgLSBmMmZzX2Ryb3BfaW5vZGXCoCAvLyBJX1NZTkMgc2V0Cj4+Pj4+PiDC
oMKgwqDCoMKgIC0gZjJmc19kZXN0cm95X2V4dGVudF9ub2RlCj4+Pj4+PiDCoMKgwqDCoMKgwqAg
LSBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC0gd2hpbGUgKG5v
ZGVfY250KSB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZldC0+bG9j
aykKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnJlZV9leHRlbnRfdHJlZQo+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZldC0+bG9jaykKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUKPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YQo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLQo+Pj4+Pj4gZjJmc191cGRhdGVfcmVh
ZF9leHRlbnRfY2FjaGUKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLQo+
Pj4+Pj4gX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvLyBGSV9OT19FWFRFTlQgbm90Cj4+Pj4+PiBzZXQsCj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gaW5zZXJ0IG5ldyBleHRlbnQKPj4+
Pj4+IG5vZGUKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IC8vIG5vZGVfY250ID09IDAsIGV4
aXQgd2hpbGUKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC0gZjJmc19idWdfb24obm9kZV9jbnQpwqAg
Ly8gbm9kZV9jbnQgPiAwCj4+Pj4+Pgo+Pj4+Pj4gQWRkaXRpb25hbGx5LCBfX3VwZGF0ZV9leHRl
bnRfdHJlZV9yYW5nZSgpIG9ubHkgY2hlY2tzCj4+Pj4+PiBGSV9OT19FWFRFTlQgZm9yCj4+Pj4+
PiBFWF9SRUFEIHR5cGUsIGxlYXZpbmcgRVhfQkxPQ0tfQUdFIHVwZGF0ZXMgY29tcGxldGVseSB1
bnByb3RlY3RlZC4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIHBhdGNoIHNldCBGSV9OT19FWFRFTlQgdW5k
ZXIgZXQtPmxvY2sgaW4KPj4+Pj4+IF9fZGVzdHJveV9leHRlbnRfbm9kZSgpLAo+Pj4+Pj4gY29u
c2lzdGVudCB3aXRoIG90aGVyIGNhbGxlcnMgKF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlIGFu
ZAo+Pj4+Pj4gX19kcm9wX2V4dGVudF90cmVlKSBhbmQgY2hlY2sgRklfTk9fRVhURU5UIGZvciBi
b3RoIEVYX1JFQUQgYW5kCj4+Pj4+PiBFWF9CTE9DS19BR0UgdHJlZS4KPj4+Pj4KPj4+Pj4gSSBz
dWZmZXJlZCBiZWxvdyB0ZXN0IGZhaWx1cmUsIHRoZW4gSSBiaXNlY3QgdG8gdGhpcyBjaGFuZ2Uu
Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqAgZ2VuZXJpYy80NzXCoCA4NHMgLi4uIFtmYWlsZWQsIGV4
aXQgc3RhdHVzIDFdLSBvdXRwdXQgbWlzbWF0Y2gKPj4+Pj4gKHNlZSAvCj4+Pj4+IHNoYXJlL2dp
dC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQpCj4+Pj4+IMKgwqDCoMKgwqAg
LS0tIHRlc3RzL2dlbmVyaWMvNDc1Lm91dMKgwqAgMjAyNS0wMS0xMiAyMTo1Nzo0MC4yNzk0NDA2
NjQgKzA4MDAKPj4+Pj4gwqDCoMKgwqDCoCArKysgL3NoYXJlL2dpdC9mc3Rlc3RzL3Jlc3VsdHMv
L2dlbmVyaWMvNDc1Lm91dC5iYWQgMjAyNi0wNC0xNwo+Pj4+PiAxMjowODoyOC4wMDAwMDAwMDAg
KzA4MDAKPj4+Pj4gwqDCoMKgwqDCoCBAQCAtMSwyICsxLDYgQEAKPj4+Pj4gwqDCoMKgwqDCoMKg
IFFBIG91dHB1dCBjcmVhdGVkIGJ5IDQ3NQo+Pj4+PiDCoMKgwqDCoMKgwqAgU2lsZW5jZSBpcyBn
b2xkZW4uCj4+Pj4+IMKgwqDCoMKgwqAgK21vdW50OiAvbW50L3NjcmF0Y2hfZjJmczogbW91bnQg
c3lzdGVtIGNhbGwgZmFpbGVkOiBTdHJ1Y3R1cmUKPj4+Pj4gbmVlZHMKPj4+Pj4gY2xlYW5pbmcu
Cj4+Pj4+IMKgwqDCoMKgwqAgK8KgwqDCoMKgwqDCoCBkbWVzZygxKSBtYXkgaGF2ZSBtb3JlIGlu
Zm9ybWF0aW9uIGFmdGVyIGZhaWxlZCBtb3VudAo+Pj4+PiBzeXN0ZW0KPj4+Pj4gY2FsbC4KPj4+
Pj4gwqDCoMKgwqDCoCArbW91bnQgZmFpbGVkCj4+Pj4+IMKgwqDCoMKgwqAgKyhzZWUgL3NoYXJl
L2dpdC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1LmZ1bGwgZm9yIGRldGFpbHMpCj4+Pj4+
IMKgwqDCoMKgwqAgLi4uCj4+Pj4+IMKgwqDCoMKgwqAgKFJ1biAnZGlmZiAtdSAvc2hhcmUvZ2l0
L2ZzdGVzdHMvdGVzdHMvZ2VuZXJpYy80NzUub3V0IC8KPj4+Pj4gc2hhcmUvZ2l0Lwo+Pj4+PiBm
c3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQnwqAgdG8gc2VlIHRoZSBlbnRpcmUg
ZGlmZikKPj4+Pj4KPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoCBnZW5lcmljLzM4OMKgIDczcyAuLi4g
W2ZhaWxlZCwgZXhpdCBzdGF0dXMgMV0tIG91dHB1dCBtaXNtYXRjaAo+Pj4+PiAoc2VlIC8KPj4+
Pj4gc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCkKPj4+Pj4g
wqDCoMKgwqDCoCAtLS0gdGVzdHMvZ2VuZXJpYy8zODgub3V0wqDCoCAyMDI1LTAxLTEyIDIxOjU3
OjQwLjI3NTQ0MDYwMiArMDgwMAo+Pj4+PiDCoMKgwqDCoMKgICsrKyAvc2hhcmUvZ2l0L2ZzdGVz
dHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCAyMDI2LTA0LTE3Cj4+Pj4+IDExOjU4OjA1
LjAwMDAwMDAwMCArMDgwMAo+Pj4+PiDCoMKgwqDCoMKgIEBAIC0xLDIgKzEsNiBAQAo+Pj4+PiDC
oMKgwqDCoMKgwqAgUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMzg4Cj4+Pj4+IMKgwqDCoMKgwqDCoCBT
aWxlbmNlIGlzIGdvbGRlbi4KPj4+Pj4gwqDCoMKgwqDCoCArbW91bnQ6IC9tbnQvc2NyYXRjaF9m
MmZzOiBtb3VudCBzeXN0ZW0gY2FsbCBmYWlsZWQ6IFN0cnVjdHVyZQo+Pj4+PiBuZWVkcwo+Pj4+
PiBjbGVhbmluZy4KPj4+Pj4gwqDCoMKgwqDCoCArwqDCoMKgwqDCoMKgIGRtZXNnKDEpIG1heSBo
YXZlIG1vcmUgaW5mb3JtYXRpb24gYWZ0ZXIgZmFpbGVkIG1vdW50Cj4+Pj4+IHN5c3RlbQo+Pj4+
PiBjYWxsLgo+Pj4+PiDCoMKgwqDCoMKgICtjeWNsZSBtb3VudCBmYWlsZWQKPj4+Pj4gwqDCoMKg
wqDCoCArKHNlZSAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODguZnVsbCBm
b3IgZGV0YWlscykKPj4+Pj4gwqDCoMKgwqDCoCAuLi4KPj4+Pj4gwqDCoMKgwqDCoCAoUnVuICdk
aWZmIC11IC9zaGFyZS9naXQvZnN0ZXN0cy90ZXN0cy9nZW5lcmljLzM4OC5vdXQgLwo+Pj4+PiBz
aGFyZS9naXQvCj4+Pj4+IGZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCfCoCB0
byBzZWUgdGhlIGVudGlyZSBkaWZmKQo+Pj4+Pgo+Pj4+Pgo+Pj4+PiDCoMKgwqDCoMKgIEYyRlMt
ZnMgKGRtLTApOiBzYW5pdHlfY2hlY2tfZXh0ZW50X2NhY2hlOiBpbm9kZSAoaW5vPTE3NjEpCj4+
Pj4+IGV4dGVudAo+Pj4+PiBpbmZvIFsyMjAwNTcsIDU3LCA2XSBpcyBpbmNvcnJlY3QsIHJ1biBm
c2NrIHRvIGZpeAo+Pj4+Pgo+Pj4+PiBJIHN1c3BlY3Qgd2UgbWF5IG1pc3MgYW55IGV4dGVudCB1
cGRhdGVzIGFmdGVyIHdlIHNldCBGSV9OT19FWFRFTlQgaW4KPj4+Pj4gX19kZXN0cm95X2V4dGVu
dF9ub2RlKCksIHJlc3VsdCBpbiBmYWlsaW5nIGluCj4+Pj4+IHNhbml0eV9jaGVja19leHRlbnRf
Y2FjaGUoKS4KPj4+Pj4KPj4+Pj4gQ2FuIHdlIGp1c3QgcmVsb2NhdGUgZjJmc19idWdfb24obm9k
ZV9jbnQpIHJhdGhlciB0aGFuIGNvbXBsaWNhdGVkCj4+Pj4+IGNoYW5nZT8KPj4+Pj4gVGhvdWdo
dHM/Cj4+Pj4KPj4+PiBPaCwgSSBvdmVybG9va2VkIGxhcmdlc3QgZXh0ZW50LiBIb3cgYWJvdXQg
cmVsb2NhdGUKPj4+PiBmMmZzX2J1Z19vbihub2RlX2NudCkgdG8gX19kZXN0cm95X2V4dGVudF90
cmVlPwo+Pj4+Cj4+Pj4gc3RhdGljIHZvaWQgX19kZXN0cm95X2V4dGVudF90cmVlKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGVudW0gZXh0ZW50X3R5cGUKPj4+PiB0eXBlKQo+Pj4+Cj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIGZyZWUgYWxsIGV4dGVudCBpbmZvIGJlbG9uZyB0byB0aGlzIGV4dGVu
dCB0cmVlICovCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGVfY250ID0gX19kZXN0cm95X2V4
dGVudF9ub2RlKGlub2RlLCB0eXBlKTsKPj4+PiArwqDCoMKgwqDCoMKgIGYyZnNfYnVnX29uKHNi
aSwgYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpOwo+Pj4KPj4+IMKgIMKgwqDCoMKgLyogZnJl
ZSBhbGwgZXh0ZW50IGluZm8gYmVsb25nIHRvIHRoaXMgZXh0ZW50IHRyZWUgKi8KPj4+IMKgIMKg
wqDCoMKgbm9kZV9jbnQgPSBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoaW5vZGUsIHR5cGUpOwo+Pj4K
Pj4+IMKgIMKgwqDCoMKgLyogZGVsZXRlIGV4dGVudCB0cmVlIGVudHJ5IGluIHJhZGl4IHRyZWUg
Ki8KPj4+IMKgIMKgwqDCoMKgbXV0ZXhfbG9jaygmZXRpLT5leHRlbnRfdHJlZV9sb2NrKTsKPj4+
IMKgIMKgwqDCoMKgZjJmc19idWdfb24oc2JpLCBhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSk7
wqAgPC0tLQo+Pj4KPj4+IE9oLCBpdCBoYXMgYWxyZWFkeSBjaGVja2VkIG5vZGVfY250LCBzbywg
bWF5YmUgd2UgY2FuIGp1c3QgcmVtb3ZlIHRoZQo+Pj4gY2hlY2sgaW4KPj4+IF9fZGVzdHJveV9l
eHRlbnRfbm9kZSgpPwo+Pgo+PiBZZXMuIEJUVywgaXMgaXQgY29ycmVjdCB0byByZW1vdmUgdGhl
IGNhbGwgdG8gZjJmc19kZXN0cm95X2V4dGVudF9ub2RlKCkKPj4gaW4gZjJmc19kcm9wX2lub2Rl
KCk/IEl0IHNlZW1zIHRoaXMgY2FsbCBpcyB1bm5lY2Vzc2FyeSwgc2luY2UKPj4gZjJmc19ldmlj
dF9pbm9kZSgpIHdpbGwgZXZlbnR1YWxseSBkZWxldGUgYWxsIGV4dGVudCBub2RlcyBwcm9wZXJs
eS4KPiAKPiBJIHRoaW5rIGl0J3MgZmluZSB0byBrZWVwIGl0IGFjY29yZGluZyB0byBvcmlnaW5h
bCBpbnRlbnRpb24gImRlc3Ryb3kKPiBleHRlbnRfdHJlZSBmb3IgdGhlIHRydW5jYXRpb24gY2Fz
ZSIgaW50cm9kdWNlZCBmcm9tIDNlNzJmNzIxMzkwZAo+ICgiZjJmczogdXNlIGV4dGVudF9jYWNo
ZSBieSBkZWZhdWx0IikuIEl0IGhlbHBzIHRoZSBwZXJmb3JtYW5jZSB3Lwo+IGluIGJhdGNoIGV4
dGVudCBub2RlIHJlbGVhc2UuCgpPaCwgSSBzZWUuIFRoaXMgcGF0Y2ggaGFzIGFscmVhZHkgYmVl
biBtZXJnZWQgaW50byB0aGUgZGV2IGJyYW5jaC4gV2hpY2gKb2YgdGhlIGZvbGxvd2luZyBhcHBy
b2FjaGVzIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGU/CjEuIERyb3AgdGhlIGN1cnJlbnQgcGF0
Y2ggZnJvbSB0aGUgZGV2IGJyYW5jaCwgdGhlbiBzdWJtaXQgYSBwYXRjaCB0bwpyZW1vdmUgdGhl
IGYyZnNfYnVnX29uKCkgaW4gX19kZXN0cm95X2V4dGVudF9ub2RlLgoyLiBTZW5kIHR3byBwYXRj
aGVzOiB0aGUgZmlyc3QgcmV2ZXJ0cyB0aGUgY2hhbmdlLCBhbmQgdGhlIHNlY29uZApyZW1vdmVz
IHRoZSBmMmZzX2J1Z19vbigpIGluIF9fZGVzdHJveV9leHRlbnRfbm9kZSgpLgoKVGhhbmtzCllv
bmdwZW5nLAoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+IFRoYW5rcwo+PiBZb25ncGVuZywKPj4KPj4+
Cj4+PiBUaGFua3MsCj4+Pgo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+IFlvbmdwZW5nLAo+Pj4+
Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczogM2ZjNWQ1YTE4
MmY2ICgiZjJmczogZml4IHRvIHNocmluayByZWFkIGV4dGVudCBub2RlIGluCj4+Pj4+PiBiYXRj
aGVzIikKPj4+Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+IC0tLQo+
Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgfCAxNyArKysrKysrKysrLS0tLS0t
LQo+Pj4+Pj4gwqDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5j
IGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+Pj4gaW5kZXggMGVkODRjYzA2NWE3Li44NzE2
OWZkMjlkODkgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+
PiArKysgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+PiBAQCAtMTE5LDkgKzExOSwxMCBA
QCBzdGF0aWMgYm9vbCBfX21heV9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUKPj4+Pj4+ICppbm9k
ZSwgZW51bSBleHRlbnRfdHlwZSB0eXBlKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKCFfX2lu
aXRfbWF5X2V4dGVudF90cmVlKGlub2RlLCB0eXBlKSkKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+Pj4gwqDCoMKgICvCoMKgwqAgaWYgKGlzX2lub2RlX2Zs
YWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsKPj4+Pj4+ICsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmICh0eXBlID09IEVYX1JF
QUQpIHsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUs
IEZJX05PX0VYVEVOVCkpCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfQ09NUFJFU1NFRF9GSUxFKSAmJgo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAhZjJmc19zYl9oYXNfcmVhZG9ubHkoRjJGU19JX1NCKGlub2Rl
KSkpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+
Pj4+Pj4gQEAgLTY0NCw2ICs2NDUsOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fZGVzdHJveV9l
eHRlbnRfbm9kZShzdHJ1Y3QKPj4+Pj4+IGlub2RlICppbm9kZSwKPj4+Pj4+IMKgwqDCoCDCoMKg
wqDCoMKgIHdoaWxlIChhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSkgewo+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKCFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19FWFRF
TlQpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub2RlX2NudCArPSBfX2ZyZWVfZXh0
ZW50X3RyZWUoc2JpLCBldCwgbnJfc2hyaW5rKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+
PiBAQCAtNjg4LDEyICs2OTEsMTIgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVf
cmFuZ2Uoc3RydWN0Cj4+Pj4+PiBpbm9kZSAqaW5vZGUsCj4+Pj4+PiDCoMKgwqAgwqDCoMKgwqDC
oCB3cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4+Pj4+PiDCoMKgwqAgLcKgwqDCoCBpZiAodHlwZSA9
PSBFWF9SRUFEKSB7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0
KGlub2RlLCBGSV9OT19FWFRFTlQpKSB7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
cml0ZV91bmxvY2soJmV0LT5sb2NrKTsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+PiArwqDCoMKgIGlmIChpc19pbm9k
ZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsK
Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4gwqDCoMKgICvCoMKgwqAgaWYgKHR5cGUgPT0gRVhfUkVB
RCkgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmV2ID0gZXQtPmxhcmdlc3Q7Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5sZW4gPSAwOwo+Pj4+Pgo+Pj4+Pgo+Pj4+
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
