Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOrnNDw6smnMJwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 04:59:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5226CE96
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 04:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlrtKIKf23PRf1tA1kLKKCoOG0wmZaJg/HVCnOhkepA=; b=I8Gitkl850vkUCSWi1ZlLmdOwd
	X8hB+aBztPVso6xXHEPhnIkyfKgLDvYDXoZVeoDoUL/2tkB+U3A0jrLOi2B+skUgnilen2C//Ua+X
	ayfuQYXPBamAYrqTorj+K/FULrjzVeVNxp9bugTUM7bczk4foNuMB4j6RAZ3EzzOmnzg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0XD5-0002Ti-7P;
	Thu, 12 Mar 2026 03:59:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w0XD3-0002Ta-NM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 03:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REjxmGkmc6dzLojR0jOUF/65DdY89mWz+rBqrb2TWJw=; b=Gt5Y0wIk7hfh9ImVdOBRcBnYAd
 YLDeP4wrakYU5hXY9l5W43YGL9OLfmnWlMvTxpO3xRne8rnaxXmLWPeMC7lSe0wCWBP3QDDb34cM6
 SYXtdsTi8iGwl+sKesXlzuW8w+wF0ATKM01Z+WGnDSLK6ZQAuBU49tK1Jn87KTRBSO6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=REjxmGkmc6dzLojR0jOUF/65DdY89mWz+rBqrb2TWJw=; b=OkxygzUsMpsUfgZPLI2Vb344qU
 LrLsmY9aPXmVfXCDAqLiLcRw+wIguhegYJ58Fy+1rP43Slj64rAovzcZzaHnDNb3FKRz55nyScNvN
 LUslnASELdyzkze2HcOor/jUQbR6G938zvtpylS4XtwWQfonuX+QBjNy+JOnP1w/e/MI=;
Received: from mail3-164.sinamail.sina.com.cn ([202.108.3.164])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0XD2-0001m8-PH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 03:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773287980; bh=REjxmGkmc6dzLojR0jOUF/65DdY89mWz+rBqrb2TWJw=;
 h=Message-ID:Date:Subject:From;
 b=Eh9bv5nFE5WDJhv8uQ/qu54S+Ch8zrdTt1zqSsQSUxCiJ7eykm/Wg1Rbrlxk0aebt
 lvMHX+GXE7yOB1I9pCIZCvIkn3TowFFqZbzRuIqGN7KS7JI49ixBkLu0ahPHR+MhLZ
 iQ1bCYt2TcFU/zTIqv6SABxMRYJGNhF6E9smujxw=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69B23A230000264E; Thu, 12 Mar 2026 11:59:32 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9249534456700
X-SMAIL-UIID: D426FFE098954F9CA7E0F714C0078806-20260312-115932-1
Message-ID: <7ca74873-72c1-487e-8276-ceb6f2a9faef@sina.com>
Date: Thu, 12 Mar 2026 11:59:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112841.67508-2-monty_pavel@sina.com>
 <daa86ab7-fa33-4c31-92b0-0ec0492aa33d@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <daa86ab7-fa33-4c31-92b0-0ec0492aa33d@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/26 09:06, Chao Yu via Linux-f2fs-devel wrote: > On
 2026/2/16 19:28, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> After
 the device is mounted, f2fs updates on-disk metadata without >> up [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w0XD2-0001m8-PH
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: invalidate block device page
 cache before reading metadata
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid]
X-Rspamd-Queue-Id: ACC5226CE96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xMi8yNiAwOTowNiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBP
biAyMDI2LzIvMTYgMTk6MjgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBBZnRlciB0aGUgZGV2aWNlIGlz
IG1vdW50ZWQsIGYyZnMgdXBkYXRlcyBvbi1kaXNrIG1ldGFkYXRhIHdpdGhvdXQKPj4gdXBkYXRp
bmcgdGhlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlLiBBcyBhIHJlc3VsdCwgZjJmcy10b29scyBt
YXkgcmVhZAo+PiBzdGFsZSBtZXRhZGF0YSBmcm9tIHRoZSBwYWdlIGNhY2hlLgo+Pgo+PiBGb3Ig
ZXhhbXBsZToKPj4gbW91bnQgL2Rldi92ZGIgL21udC9mMmZzCj4+IHRvdWNoIG14IC8vIGlubyA9
IDQKPj4gc3luYwo+PiBkdW1wLmYyZnMgLWkgNCAvZGV2L3ZkYgo+PiB0b3VjaCBteDIgLy8gaW5v
ID0gNQo+PiBzeW5jCj4+IGR1bXAuZjJmcyAtaSA1IC9kZXYvdmRiIC8vIGJsb2NrIGFkZHIgaXMg
MAo+IAo+IEFjdHVhbGx5LCBpdCB3aWxsIGJlIGJldHRlciB0byB3YWl0IGZvciAvbW50L2YyZnMg
YmVpbmcgdW1vdW50ZWQgZmlyc3QKPiBhbmQgdGhlbgo+IGNhbGwgZHVtcC5mMmZzLCBhcyBpZiB0
aGVyZSBhcmUgdHdvIHVzZXJzIG9uIHRoZSBkZXZpY2UsIHdlIGNhbiBub3QKPiBndWFyYW50ZWUK
PiBkdW1wLmYyZnMgY2FuIGFsd2F5cyBmbHVzaCBhbmQgY2xlYW4gdXAgYWxsIGNhY2hlIHdoaWxl
IGFub3RoZXIgdXNlcgo+IGNvbnRpbnVlCj4gdG8gdXBkYXRlIHRoZSBkYXRhIHZpYSAvbW50L2Yy
ZnMgbW91bnQgcG9pbnQuCgpJZiB0aGUga2VybmVsIGd1YXJhbnRlZXMgdGhhdCB0aGVyZSBpcyBu
byBub24tdXB0b2RhdGUgZGF0YSBpbiB0aGUgYmxvY2sKZGV2aWNlIHBhZ2UgY2FjaGUgYWZ0ZXIg
dW5tb3VudCwgdGhpcyBpb2N0bCBkb2VzIG5vdCBuZWVkIHRvIGJlCmV4ZWN1dGVkLiBUaGUgbWFp
biBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMgdG8gbWFrZSBpdCBwb3NzaWJsZSB0bwppbnNwZWN0
IHRoZSBtZXRhZGF0YSBvZiBhIG1vdW50ZWQgZjJmcyBpbnN0YW5jZSBhcyBtdWNoIGFzIHBvc3Np
YmxlLCBpbgpvcmRlciB0byBhc3Npc3Qgd2l0aCBkZWJ1Z2dpbmcgYW5kIGFuYWx5c2lzLCBlc3Bl
Y2lhbGx5IGluIGFkYiBzaGVsbC4KU28sIHdlIGRvbid0IG5lZWQgdG8gY2hlY2sgdGhlIHJldHVy
biB2YWx1ZSBvZiBpb2N0bC4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+
PiBTaW5jZSBgZHVtcC5mMmZzIC1pIDQgL2Rldi92ZGJgIGhhcyBhbHJlYWR5IHBvcHVsYXRlZCB0
aGUgbWV0YWRhdGEgYXJlYQo+PiBpbnRvIHRoZSBibG9jayBkZXZpY2UgcGFnZSBjYWNoZSwgdGhl
IGNhY2hlZCBwYWdlcyByZW1haW4gcmVzaWRlbnQgaW4KPj4gbWVtb3J5LiBBZnRlciBjcmVhdGlu
ZyBteDIsIHRoZSBwYWdlIGNhY2hlIGlzIG5vdCB1cGRhdGVkIGFjY29yZGluZ2x5Lgo+PiBUaGVy
ZWZvcmUsIGBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYmAgcmVhZHMgc3RhbGUgbWV0YWRhdGEsIGFu
ZCB0aGUKPj4gcGh5c2ljYWwgYmxvY2sgYWRkcmVzcyBvZiBpbm9kZSA1IGlzIGluY29ycmVjdGx5
IHJlcG9ydGVkIGFzIDAuCj4+Cj4+IFRoaXMgcGF0Y2ggaXNzdWVzIGEgQkxLRkxTQlVGIGlvY3Rs
IHRvIHRoZSBibG9jayBkZXZpY2UgYmVmb3JlIHJlYWRpbmcKPj4gbWV0YWRhdGEuIFRoZSBrZXJu
ZWwgdGhlbiBpbnZhbGlkYXRlcyB0aGUgYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUsCj4+IGVuc3Vy
aW5nIHRoYXQgc3Vic2VxdWVudCByZWFkcyBmZXRjaCB1cHRvZGF0ZSBtZXRhZGF0YSBmcm9tIGRp
c2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFv
bWkuY29tPgo+PiAtLS0KPj4gwqAgbGliL2xpYmYyZnMuYyB8IDEgKwo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2xpYi9saWJmMmZzLmMgYi9s
aWIvbGliZjJmcy5jCj4+IGluZGV4IDFhNDk2YjcuLjMxYjU5MjQgMTAwNjQ0Cj4+IC0tLSBhL2xp
Yi9saWJmMmZzLmMKPj4gKysrIGIvbGliL2xpYmYyZnMuYwo+PiBAQCAtMTAyNyw2ICsxMDI3LDcg
QEAgaW50IGdldF9kZXZpY2VfaW5mbyhpbnQgaSkKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDC
oMKgwqAgZGV2LT5mZCA9IGZkOwo+PiArwqDCoMKgIGlvY3RsKGZkLCBCTEtGTFNCVUYpOwo+PiDC
oCDCoMKgwqDCoMKgIGlmIChjLnNwYXJzZV9tb2RlICYmIGkgPT0gMCkgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGYyZnNfaW5pdF9zcGFyc2VfZmlsZSgpKSB7Cj4gCj4gCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
