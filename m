Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKi9Gj7cs2mzbgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 10:43:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61073280AE5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 10:43:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE8NKndfLbQVypVL+YXQHWenOo8cRKZwLkdeIABkigo=; b=e4OBz4Oyal8r8TZNPpxTeBXP0h
	q8TbHDZNJAGMNlgAxfVwSf3LPCAA1Z1UH1D1wjTdsBiTooMclcuPFlmOU/RkWAtG789P0hxejGE6W
	IjMZo3IQ0kO/6h+9lMhT9jah9JG3FlXcWGlRe91Ez2uDhkYNZzDsDa1qJbEVqi71GNfM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0z30-00042N-PA;
	Fri, 13 Mar 2026 09:43:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w0z2q-00041i-C2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 09:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fQqYvAyZbztOSSDmK9/zQzZM0RN0D8xGsni87zxjIjY=; b=Q4fbLpvIyZX0FZnK47vmj7R66H
 tCYf70JKB/xo+up3N3Owu3ZuOWSvkPUFu6TJmjyhQIuDJEFZ85+2M8U1mu6e7gKkAleW8Mlqlm1Hr
 ceO6FShP4+X5njFg8CobG+7eS7gvG+LdrEuQ3WCpV8lIwVYbJDgr81+rbCpoWiMeLnWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fQqYvAyZbztOSSDmK9/zQzZM0RN0D8xGsni87zxjIjY=; b=ePGgkSDlteVIaFixXe4OkeKSFN
 QK9hCZGpAiG254S7gGCpUczSlGRa9cJq+0xfP+fSsbQe45MDzceXiq9InCFj0m4+FxF54d0TL1kPU
 ZvIrn8Tl1abNk1WF80EB/RapX2Kg/18IndOaeQ4Ubx29+gXhZqhbOnkSXWkLfhUGoHhA=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0z2l-0007iX-Iy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 09:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773394975; bh=fQqYvAyZbztOSSDmK9/zQzZM0RN0D8xGsni87zxjIjY=;
 h=Message-ID:Date:Subject:From;
 b=Y0UMTveNoQfEfjAror/kqmkE8xd19sWyTIkR78Otf8HOQM3eCtvfI6KScWwIcUbJv
 9BEPDU8RaIaG7GPtOLGOQrMoVTau3M8cvV9EPqUeEtRTVY7ssujmYepv3KGPWSuUNL
 dVcj38AE2F8R9hBENpeGTkNSvt2UXnecmnvJnsXk=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69B3DC0F000039E4; Fri, 13 Mar 2026 17:42:41 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 3239546684964
X-SMAIL-UIID: 4BFF589EB4254D5499F25897E8D522D9-20260313-174241-1
Message-ID: <eb60f2ef-2c74-4c9d-9547-323042be5233@sina.com>
Date: Fri, 13 Mar 2026 17:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
 <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
 <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
 <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
 <3565eb34-944e-44a1-b349-ae54b9745051@sina.com>
 <f4039e35-b84f-4ec8-b9a3-70fcdd9277b2@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <f4039e35-b84f-4ec8-b9a3-70fcdd9277b2@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/13/26 15:19, Chao Yu via Linux-f2fs-devel wrote: > On
 3/12/2026 7:34 PM, Yongpeng Yang wrote: >> >> On 3/12/26 18:49, Chao Yu via
 Linux-f2fs-devel wrote: >>> On 2026/3/12 18:41, Chao Yu wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w0z2l-0007iX-Iy
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate block device page cache on
 umount
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,sina.com:mid,mail-archive.com:url]
X-Rspamd-Queue-Id: 61073280AE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDMvMTMvMjYgMTU6MTksIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMy8xMi8yMDI2IDc6MzQgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Cj4+IE9uIDMvMTIv
MjYgMTg6NDksIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBPbiAyMDI2
LzMvMTIgMTg6NDEsIENoYW8gWXUgd3JvdGU6Cj4+Pj4gT24gMjAyNi8zLzEyIDExOjU2LCBZb25n
cGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiAzLzEyLzI2IDA4OjQ5LCBDaGFvIFl1IHZp
YSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+Pj4gT24gMjAyNi8yLzE2IDE5OjI3LCBZb25n
cGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVu
Z0B4aWFvbWkuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gTmVpdGhlciBGMkZTIG5vciBWRlMgaW52YWxp
ZGF0ZXMgdGhlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlLCB3aGljaAo+Pj4+Pj4+IHJlc3VsdHMg
aW4gcmVhZGluZyBzdGFsZSBtZXRhZGF0YS4gQW4gZXhhbXBsZSBzY2VuYXJpbyBpcyBzaG93bgo+
Pj4+Pj4+IGJlbG93Ogo+Pj4+Pj4+Cj4+Pj4+Pj4gVGVybWluYWwgQcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVGVybWluYWwgQgo+Pj4+Pj4+IG1vdW50IC9kZXYvdmRiIC9tbnQv
ZjJmcwo+Pj4+Pj4+IHRvdWNoIG14IC8vIGlubyA9IDQKPj4+Pj4+PiBzeW5jCj4+Pj4+Pj4gZHVt
cC5mMmZzIC1pIDQgL2Rldi92ZGIvLyBibG9jayBvbiAiW1kvTl0iCj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRvdWNo
IG14MiAvLyBpbm8gPSA1Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN5bmMKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW1vdW50IC9tbnQv
ZjJmcwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYiAvLyBibG9jayBhZGRyCj4+
Pj4+Pj4gaXMgMAo+Pj4+Pj4+Cj4+Pj4+Pj4gQWZ0ZXIgdW1vdW50LCB0aGUgYmxvY2sgZGV2aWNl
IHBhZ2UgY2FjaGUgaXMgbm90IHB1cmdlZCwgY2F1c2luZwo+Pj4+Pj4+IGBkdW1wLmYyZnMgLWkg
NSAvZGV2L3ZkYmAgdG8gcmVhZCBzdGFsZSBtZXRhZGF0YSBhbmQgc2VlIGlub2RlIDUKPj4+Pj4+
PiB3aXRoCj4+Pj4+Pj4gYmxvY2sgYWRkcmVzcyAwLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBwYXRj
aCBjYWxscyBpbnZhbGlkYXRlX2JkZXYgZHVyaW5nIHVtb3VudCB0byBpbnZhbGlkYXRlIHRoZQo+
Pj4+Pj4+IGJsb2NrCj4+Pj4+Pj4gZGV2aWNlIHBhZ2UgY2FjaGUsIHByZXZlbnRpbmcgc3RhbGUg
bWV0YWRhdGEgZnJvbSBiZWluZyByZWFkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
WW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+
Pj4gwqDCoMKgIGZzL2YyZnMvc3VwZXIuYyB8IDYgKysrKysrCj4+Pj4+Pj4gwqDCoMKgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+PiBpbmRleCAxYTc1NTk5N2Fm
ZjUuLjM5ZDNiNTJjZWFjMSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4+
Pj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+PiBAQCAtMjA5MSw2ICsyMDkxLDEyIEBA
IHN0YXRpYyB2b2lkIGYyZnNfcHV0X3N1cGVyKHN0cnVjdAo+Pj4+Pj4+IHN1cGVyX2Jsb2NrICpz
YikKPj4+Pj4+PiDCoMKgwqAgI2lmIElTX0VOQUJMRUQoQ09ORklHX1VOSUNPREUpCj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqAgdXRmOF91bmxvYWQoc2ItPnNfZW5jb2RpbmcpOwo+Pj4+Pj4+IMKgwqDC
oCAjZW5kaWYKPj4+Pj4+PiArwqDCoMKgIHN5bmNfYmxvY2tkZXYoc2ItPnNfYmRldik7Cj4+Pj4+
Pgo+Pj4+Pj4gV2Ugd2lsbCBjYWxsIHN5bmNfYmxvY2tkZXYgaW4gYmVsb3cgcGF0aD8KPj4+Pj4+
Cj4+Pj4+PiAtIGtpbGxfZjJmc19zdXBlcgo+Pj4+Pj4gwqDCoMKgLSBraWxsX2Jsb2NrX3N1cGVy
Cj4+Pj4+PiDCoMKgwqAgLSBnZW5lcmljX3NodXRkb3duX3N1cGVyCj4+Pj4+PiDCoMKgwqDCoCAt
IHB1dF9zdXBlcgo+Pj4+Pj4gwqDCoMKgIC0gc3luY19ibG9ja2Rldgo+Pj4+Pj4KPj4+Pj4+IDE3
MjEgdm9pZCBraWxsX2Jsb2NrX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4+Pj4+PiAx
NzIyIHsKPj4+Pj4+IDE3MjPCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJk
ZXYgPSBzYi0+c19iZGV2Owo+Pj4+Pj4gMTcyNAo+Pj4+Pj4gMTcyNcKgwqDCoMKgwqDCoMKgwqAg
Z2VuZXJpY19zaHV0ZG93bl9zdXBlcihzYik7Cj4+Pj4+PiAxNzI2wqDCoMKgwqDCoMKgwqDCoCBp
ZiAoYmRldikgewo+Pj4+Pj4gMTcyN8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN5
bmNfYmxvY2tkZXYoYmRldik7Cj4+Pj4+PiAxNzI4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYmRldl9mcHV0KHNiLT5zX2JkZXZfZmlsZSk7Cj4+Pj4+PiAxNzI5wqDCoMKgwqDCoMKg
wqDCoCB9Cj4+Pj4+PiAxNzMwIH0KPj4+Pj4+Cj4+Pj4+Pj4gK8KgwqDCoCBpbnZhbGlkYXRlX2Jk
ZXYoc2ItPnNfYmRldik7Cj4+Pj4+Cj4+Pj4+IFRoaXMgd29ya3MgZm9yIGFuIGYyZnMgaW5zdGFu
Y2UgbW91bnRlZCBvbiBhIHNpbmdsZSBkZXZpY2UsIGJ1dCBpdAo+Pj4+PiBkb2VzCj4+Pj4+IG5v
dCB3b3JrIGZvciBtdWx0aS1kZXZpY2UgY29uZmlndXJhdGlvbnMsIGJlY2F1c2UgdGhlIHZmcyBj
YW5ub3QgYmUKPj4+Pj4gYXdhcmUgb2YgRkRFVigxKS4KPj4+Pgo+Pj4+IFllYWgsIEkgbWVhbnQg
d2UgY2FuIGF2b2lkIGR1cGxpY2F0ZWQgc3luY19ibG9ja2RldigpIGZvciBtYWluCj4+Pj4gZGV2
aWNlIGluCj4+Pj4gZjJmc19wdXRfc3VwZXIoKS4KPj4+Pgo+Pgo+PiBUaGUgY2FsbCB0cmFjZSBj
b3JyZXNwb25kaW5nIHRvIHRoaXMgcGF0Y2ggaXMgYXMgZm9sbG93czoKPj4KPj4ga2lsbF9ibG9j
a19zdXBlcgo+PiDCoCAtIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIKPj4gwqDCoCAtIGYyZnNfcHV0
X3N1cGVyCj4+IMKgwqDCoCAtIHN5bmNfYmxvY2tkZXYKPj4gwqDCoMKgIC0gaW52YWxpZGF0ZV9i
ZGV2Cj4+IMKgIC0gc3luY19ibG9ja2Rldgo+Pgo+PiBUaGVyZSBpcyBpbmRlZWQgYSBkdXBsaWNh
dGVkIGNhbGwgdG8gc3luY19ibG9ja2RldigpLiBIb3dldmVyLCBzaW5jZSBhbGwKPj4gZGF0YSBt
dXN0IGJlIHdyaXR0ZW4gdG8gZGlzayBiZWZvcmUgaW52YWxpZGF0ZV9iZGV2KCkgaXMgY2FsbGVk
LAo+PiBmMmZzX3B1dF9zdXBlcigpIG11c3QgY2FsbCBzeW5jX2Jsb2NrZGV2KCkuIEJlY2F1c2Ug
aW52YWxpZGF0ZV9iZGV2KCkKPj4gaGFzIGFscmVhZHkgY2xlYXJlZCB0aGUgcGFnZSBjYWNoZSwg
dGhlIHNlY29uZCBjYWxsIHRvIHN5bmNfYmxvY2tkZXYoKQo+PiDCoCBkb2VzIG5vdGhpbmcuCj4+
Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSSBndWVzcyB3ZSBjYW4gbGVhdmUgdGhlIGRldmljZSB3LyB1
cHRvZGF0ZSBjYWNoZSwgaW4gY2FzZSBpZgo+Pj4+Pj4gdGhlcmUgYXJlCj4+Pj4+PiBtdWx0aXBs
ZSB1c2VyIG9uIHRoZSBkZXZpY2U/Cj4+Pj4+Cj4+Pj4+IFRoZSBwYWdlIGNhY2hlIG9mIHRoZSBi
bG9jayBkZXZpY2UgZmlsZSBtYXkgY29udGFpbiBkYXRhIHRoYXQgaXMgbm90Cj4+Pj4+IHVwdG9k
YXRlLiBGb3IgZXhhbXBsZSwgZGF0YSBtYXkgZmlyc3QgYmUgcmVhZCBkaXJlY3RseSB0aHJvdWdo
IHRoZQo+Pj4+PiBibG9jawo+Pj4+IMKgwqA+IGRldmljZSBmaWxlLCBhbmQgdGhlbiB0aGUgc2Ft
ZSBibG9ja3MgbWF5IGJlIHdyaXR0ZW4gdGhyb3VnaCBmMmZzLgo+Pj4+IFNpbmNlPiBmMmZzIHdy
aXRlcyB0byB0aGUgYmxvY2sgZGV2aWNlIHZpYSB0aGUgc3VibWl0X2JpbyBwYXRoLCBpdAo+Pj4+
IGRvZXMgbm90Cj4+Pj4+IHVwZGF0ZSB0aGUgcGFnZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNl
IGZpbGUuIEFzIGEgcmVzdWx0LCB0aGUKPj4+Pj4gZGF0YSBpbgo+Pj4+PiB0aGUgYmxvY2sgZGV2
aWNlIGZpbGXigJlzIHBhZ2UgY2FjaGUgbWF5IGJlY29tZSBzdGFsZS4gVGhlcmVmb3JlLCB0aGUK
Pj4+Pj4gcGFnZQo+Pj4+PiBjYWNoZSBtdXN0IGJlIGludmFsaWRhdGVkIGR1cmluZyB1bm1vdW50
Lgo+Pj4+Cj4+Pj4gV2VsbCwgY2FuIHdlIGNhbGwgaW9jdGwoZmQsIEJMS0ZMU0JVRikgZm9yIGFs
bCBkZXZpY2VzIGJlbG9uZyB0byBmMmZzCj4+Pj4gaW1nIGxpa2UKPj4+PiB5b3UgZGlkIGluICgi
ZjJmcy10b29sczogaW52YWxpZGF0ZSBibG9jayBkZXZpY2UgcGFnZSBjYWNoZSBiZWZvcmUKPj4+
PiByZWFkaW5nCj4+Pj4gbWV0YWRhdGEiKSwgZG9lcyB0aGF0IGZpeCB0aGUgaXNzdWU/Cj4+Pgo+
Pj4gT2gsIHlvdSBhbHJlYWR5IGNhbGxlZCB0aGUgaW9jdGwgZm9yIGFsbCBkZXZpY2VzLiBEb2Vz
IHRoYXQgZml4IHRoZQo+Pj4gaXNzdWU/Cj4+Pgo+Pgo+PiBZZXMsIHRoYXQgY2FuIGZpeCB0aGlz
IGlzc3VlLiBGcm9tIGEgc3lzdGVtIHJvYnVzdG5lc3MgcGVyc3BlY3RpdmUsIGJvdGgKPj4gdGhl
IGtlcm5lbCBhbmQgZjJmcy10b29scyBzaG91bGQgZW5zdXJlIHRoYXQgdGhlIHVwdG9kYXRlIGRh
dGEgaXMgcmVhZC4KPj4gVGhlcmVmb3JlLCBJIG1hZGUgY2hhbmdlcyBpbiBib3RoLgo+IAo+IFdl
bGwsIEkgdGhpbmsgaXQgd2lsbCBiZSBhIGxpdHRsZSBiaXQgb3ZlcnByb3RlY3RpdmUsIGJlY2F1
c2UgZjJmcyBrZXJuZWwKPiBtb2R1bGUgaXRzZWxmIGRvZXNuJ3Qgc3VmZmVyIGFueSBpc3N1ZSwg
YW5kIGR1bXAuZjJmcyBhbHJlYWR5IGhhcyBpdHMKPiB3YXkgdG8gYXZvaWQgYWNjZXNzaW5nIHN0
YWxlIGRhdGEgdy8geW91ciBjaGFuZ2UuCgpJIG92ZXJsb29rZWQgdGhlIHBlcm1pc3Npb24gY2hl
Y2sgaW4gYmxrZGV2X2ZsdXNoYnVmLiBBZnRlciB1bm1vdW50LApub24tcm9vdCB1c2VycyBtYXkg
c3RpbGwgcmVhZCBzdGFsZSBkYXRhLiBUaGVyZWZvcmUsIGl0IGlzIHN0aWxsCm5lY2Vzc2FyeSB0
byBlbnN1cmUgdGhhdCB0aGUgcGFnZSBjYWNoZSBpcyBpbnZhbGlkYXRlZCBhZnRlciB1bm1vdW50
LgoKYmxrZGV2X2lvY3RsCiAtIGJsa2Rldl9jb21tb25faW9jdGwKICAtIGJsa2Rldl9mbHVzaGJ1
ZgoKc3RhdGljIGludCBibGtkZXZfZmx1c2hidWYoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwg
dW5zaWduZWQgY21kLAogICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmcpCnsKICAgICAg
ICBpZiAoIWNhcGFibGUoQ0FQX1NZU19BRE1JTikpCiAgICAgICAgICAgICAgICByZXR1cm4gLUVB
Q0NFUzsKCkkgYWxzbyBub3RpY2VkIHRoYXQgYnRyZnMgaGFzIGVuY291bnRlcmVkIGEgc2ltaWxh
ciBpc3N1ZToKaHR0cHM6Ly9tYWlsLWFyY2hpdmUuY29tL2xpbnV4LWJ0cmZzQHZnZXIua2VybmVs
Lm9yZy9tc2c1NDE4OC5odG1sCgpJbiB0aGF0IGRpc2N1c3Npb24sIHRoZSBzb2x1dGlvbiB3YXMg
dG8gY2FsbCBpbnZhbGlkYXRlX2JkZXYoKSB3aGVuIHRoZQpkZXZpY2UgaXMgY2xvc2VkLgoKVGhh
bmtzCllvbmdwZW5nLAoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+IFRoYW5rcwo+PiBZb25ncGVuZywK
Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gVGhh
bmtzCj4+Pj4+IFlvbmdwZW5nLAo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+
Pj4+Pj4gK8KgwqDCoCBmb3IgKGkgPSAxOyBpIDwgc2JpLT5zX25kZXZzOyBpKyspIHsKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgc3luY19ibG9ja2RldihGREVWKGkpLmJkZXYpOwo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBpbnZhbGlkYXRlX2JkZXYoRkRFVihpKS5iZGV2KTsKPj4+Pj4+PiArwqDC
oMKgIH0KPj4+Pj4+PiDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoCDCoCBpbnQgZjJmc19zeW5jX2Zz
KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCBzeW5jKQo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+PiBMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4+Pgo+Pj4+Cj4+Pgo+Pj4KPj4+
Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
