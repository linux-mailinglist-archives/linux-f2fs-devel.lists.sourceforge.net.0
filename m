Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II10GRAAuWkgnAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 08:17:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A292A4AB2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 08:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6tqrmevS5f/hPwDIIakT4nv17exhzaTKA9qaNZqBsY=; b=a6yMU2wHAGMrkOcRAcdDwlhC1R
	Sx/CCnVB/e4fYFLKTGuFsbN46XR0eGW99aAcdxLW1pL8aZLaQEb2sywDTRGOKR9FIXpjXY8hcLKj+
	RoB3oAld2lc1KgCnJN0SLBcoQHFzWWObO6IApWDkBGstxdEAzkmYBFBgBWq3F2hMQ4LY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2Og4-0000M2-Rx;
	Tue, 17 Mar 2026 07:17:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w2Og1-0000Lt-D5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 07:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjvA+KZ1ucNiTeuJKd6R93YWn+V4iTUrxDbtV3VtV9g=; b=hIvuKJbCH4zGvPjI1/qph7IVyL
 gSYRzlGT+vZjq5+mdYENd5bAFrOit/6HMyKsTdlmoBB0uDtHa80P/kZW7lS6QFemNzYTj8xcyHbQW
 rnF41ATlyJRZI3P+LcM0IsSJYnXuCRMk9lgUigK2DLwvxNtOfSgbv+QV5ZIQmtdAYm9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mjvA+KZ1ucNiTeuJKd6R93YWn+V4iTUrxDbtV3VtV9g=; b=kjKTSkrKdkFojKax02HFJxmDB0
 PlcukxXd3sUCsRsouSremH80LJZ/IYRrYcIIG/nWerdy7P1LP5pLs/OAxo3F6JINrnv6FwT3YUX92
 B5YJMQzuVS2E9CUWZ1qruc6oiMeqbG+98eo14vPysdIz6swWwJDo0KiBH2sknIBP9FHI=;
Received: from mail3-166.sinamail.sina.com.cn ([202.108.3.166])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2Og0-0004vL-1s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 07:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773731836; bh=mjvA+KZ1ucNiTeuJKd6R93YWn+V4iTUrxDbtV3VtV9g=;
 h=Message-ID:Date:Subject:From;
 b=Ev+p+jRCZXJ9UKeX2BWw4+bGrZWtAjcyMm77gGjK2AbXQZcQ3vzxcY6VtRbvalOA9
 zQozXkWW6c808h/ZOf7fvErjXqBTHBSsJY4VXNIyibOEkgIDHERewL5y2mIu+WuaxJ
 55KeTbU1Xd/x94CA3PorC/pX/ejeeOyDrIf8nNeE=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 69B8FFEB00007319; Tue, 17 Mar 2026 15:17:03 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 1204586816491
X-SMAIL-UIID: C268E07691034FF3A121B9B9482E2D2C-20260317-151703-1
Message-ID: <e08a5d4b-7108-4289-9eff-6366e7bee75a@sina.com>
Date: Tue, 17 Mar 2026 15:16:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260315181321.4063984-2-monty_pavel@sina.com>
 <20260315181321.4063984-4-monty_pavel@sina.com>
 <deec2af1-77ac-4b93-9b82-914035505f29@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <deec2af1-77ac-4b93-9b82-914035505f29@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/17/26 10:12, Chao Yu via Linux-f2fs-devel wrote: > On
 2026/3/16 02:14, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> During
 FGGC node block migration, fsck may incorrectly treat the >> migr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.166 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w2Og0-0004vL-1s
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: fix fsck inconsistency caused
 by FGGC of node block
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,sina.com:mid,vm:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: D0A292A4AB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xNy8yNiAxMDoxMiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBP
biAyMDI2LzMvMTYgMDI6MTQsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBEdXJpbmcgRkdHQyBub2RlIGJs
b2NrIG1pZ3JhdGlvbiwgZnNjayBtYXkgaW5jb3JyZWN0bHkgdHJlYXQgdGhlCj4+IG1pZ3JhdGVk
IG5vZGUgYmxvY2sgYXMgZnN5bmMtd3JpdHRlbiBkYXRhLgo+Pgo+PiBUaGUgcmVwcm9kdWN0aW9u
IHNjZW5hcmlvOgo+PiByb290QHZtOi9tbnQvZjJmcyMgc2VxIDEgMjA0OCB8IHhhcmdzIC1uIDEg
Li90ZXN0X3N5bmMgLy8gd3JpdGUgaW5saW5lCj4+IGlub2RlIGFuZCBzeW5jCj4+IHJvb3RAdm06
L21udC9mMmZzIyBybSAtZiAxCj4+IHJvb3RAdm06L21udC9mMmZzIyBzeW5jCj4+IHJvb3RAdm06
L21udC9mMmZzIyBmMmZzX2lvIGdjX3JhbmdlIC8vIG1vdmUgZGF0YSBibG9jayBpbiBzeW5jIG1v
ZGUKPj4gYW5kIG5vdCB3cml0ZSBDUAo+PiDCoMKgIFNQTywgImZzY2sgLS1kcnktcnVuIiBmaW5k
IGlub2RlIGhhcyBhbHJlYWR5IGNoZWNrcG9pbnRlZCBidXQgc3RpbGwKPj4gwqDCoCB3aXRoIERF
TlRfQklUX1NISUZUIHNldAo+Pgo+PiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IEdDIGRvZXMgbm90
IGNsZWFyIHRoZSBkZW50cnkgbWFyayBhbmQgZnN5bmMgbWFyawo+PiBkdXJpbmcgbm9kZSBibG9j
ayBtaWdyYXRpb24sIGxlYWRpbmcgZnNjayB0byBtaXNpbnRlcnByZXQgdGhlbSBhcwo+PiB1c2Vy
LWlzc3VlZCBmc3luYyB3cml0ZXMuCj4+Cj4+IEluIEJHR0MgbW9kZSwgbm9kZSBibG9jayBtaWdy
YXRpb24gaXMgaGFuZGxlZCBieSBmMmZzX3N5bmNfbm9kZV9wYWdlcygpLAo+PiB3aGljaCBndWFy
YW50ZWVzIHRoZSBkZW50cnkgYW5kIGZzeW5jIG1hcmtzIGFyZSBjbGVhcmVkIGJlZm9yZSB3cml0
aW5nLgo+PiBUaGlzIHBhdGNoIGVuc3VyZXMgdGhlIHNhbWUgbWFyayBjbGVhcmluZyBiZWhhdmlv
ciBmb3IgRkdHQyBtb2RlIG5vZGUKPj4gYmxvY2sgbWlncmF0aW9uLgo+Pgo+PiBGaXhlczogZGEw
MTFjYzBkYThjICgiZjJmczogbW92ZSBub2RlIHBhZ2VzIG9ubHkgaW4gdmljdGltIHNlY3Rpb24K
Pj4gZHVyaW5nIEdDIikKPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdw
ZW5nQHhpYW9taS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL25vZGUuYyB8IDIgKysKPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+PiBpbmRleCAxMmI5NDNlYWU0ZDkuLmZlOTdhNTRh
MjViNyAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4gKysrIGIvZnMvZjJmcy9ub2Rl
LmMKPj4gQEAgLTE4NzEsNiArMTg3MSw4IEBAIGludCBmMmZzX3dyaXRlX3NpbmdsZV9ub2RlX2Zv
bGlvKHN0cnVjdCBmb2xpbwo+PiAqbm9kZV9mb2xpbywgaW50IHN5bmNfbW9kZSwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZvbGlvOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgK8KgwqDC
oCBzZXRfZnN5bmNfbWFyayhub2RlX2ZvbGlvLCAwKTsKPj4gK8KgwqDCoCBzZXRfZGVudHJ5X21h
cmsobm9kZV9mb2xpbywgMCk7Cj4gCj4gT2gsIHdlIHdpbGwgc2V0IGZzeW5jfGRlbnRyeSBtYXJr
IGluc2lkZSBfX3dyaXRlX25vZGVfZm9saW8oKSwgYW55Cj4gY29uZmxpY3Qgdy8gcmVzZXQgZmxv
dyBhYm92ZT8gSU1PLCB3ZSdkIGJldHRlciBvbmx5IHNldCBvciByZXNldAo+IGZzeW5jfGRlbnRy
eSBtYXJrIGluIHNhbWUgcGxhY2UuCgpJdCB3b3VsZCBiZSBjbGVhcmVyIHRvIGhhbmRsZSBzZXQv
Y2xlYXIgdGhlIGZzeW5jfGRlbnRyeSBtYXJrcyBlbnRpcmVseQp3aXRoaW4gX193cml0ZV9ub2Rl
X2ZvbGlvLiBUaGlzIHdvdWxkIHJlcXVpcmUgYWRkaW5nIGEgcGFyYW1ldGVyIHRvCl9fd3JpdGVf
bm9kZV9mb2xpbyB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBjYWxsZXIgbmVlZCB0byBzZXQgZnN5
bmMgbWFyay4KCj4gCj4gSSBkaWRuJ3QgbG9vayBpbnRvIHRoZSBkZXRhaWxzLCBjYW4geW91IHBs
ZWFzZSB0YWtlIGEgbG9vaz8KCkN1cnJlbnQgZGV2LXRlc3QgYnJhbmNoIGltcGxlbWVudGF0aW9u
77yaCjEuIGNsZWFyaW5nIHRoZSBmc3luY3xkZW50cnkgbWFya3MKQ2xlYXJpbmcgdGhlIGZzeW5j
fGRlbnRyeSBkZXBlbmRzIG9uIHRoZSBjYWxsIHBhdGgsIGFuZCBpcyBkb25lCnVuY29uZGl0aW9u
YWxseSBleGNlcHQgZm9yIEZHR0MuIEF0IHByZXNlbnQsIHRoZSBmb2xpbyBpcyBhbHdheXMgbG9j
a2VkCndoZW4gY2xlYXJpbmcgdGhlIGZzeW5jfGRlbnRyeS4gVGhlIGNoZWNrL2NsZWFyIG9mIHRo
ZSBmc3luY3xkZW50cnkKbWFya3MgaW4gX193cml0ZV9ub2RlX2ZvbGlvIGlzIGFsc28gcGVyZm9y
bWVkIHVuZGVyIHRoZSBmb2xpb19sb2NrLgoKX193cml0ZV9ub2RlX2ZvbGlvJ3MgY2FsbCBwYXRo
OgphLiBub2RlIGZvbGlvIHdyaXRlYmFjazogZjJmc193cml0ZV9ub2RlX3BhZ2VzLT5mMmZzX3N5
bmNfbm9kZV9wYWdlcwpiLiB3cml0ZSBDUDogYmxvY2tfb3BlcmF0aW9ucy0+LT5mMmZzX3N5bmNf
bm9kZV9wYWdlcwpjLiBmc3luYzogZjJmc19zeW5jX2ZpbGUtPmYyZnNfZG9fc3luY19maWxlLT5m
MmZzX2ZzeW5jX25vZGVfcGFnZXMKZC4gYXRvbWljIHdyaXRlIGNvbW1pdDogZjJmc19pb2NfY29t
bWl0X2F0b21pY193cml0ZS0+ZjJmc19kb19zeW5jX2ZpbGUKLT4gZjJmc19mc3luY19ub2RlX3Bh
Z2VzCmUuIEZHR0M6IGdjX25vZGVfc2VnbWVudC0+ZjJmc19tb3ZlX25vZGVfZm9saW8KCjIuIHNl
dHRpbmcgdGhlIGZzeW5jfGRlbnRyeSBtYXJrcwpPbmx5IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyBz
ZXRzIHRoZSBmc3luYyBtYXJrLCBhbmQgaXQgZG9lcyBzbyB3aXRoIHRoZQpmb2xpbyBsb2NrZWQs
IHNvIHRoZXJlIGlzIG5vIGNvbmN1cnJlbmN5IGlzc3VlLiBUaGUgc2V0dGluZyBvZiB0aGUKZGVu
dHJ5IG1hcmsgaXMgaGFuZGxlZCB3aXRoaW4gX193cml0ZV9ub2RlX2ZvbGlvLCB3aXRoIGJvdGgg
dGhlCmZvbGlvX2xvY2sgYW5kIHNiaS0+bm9kZV93cml0ZSBsb2NrIGhlbGQuCgpUaGVyZWZvcmUs
IHRoZSBjdXJyZW50IGNoYW5nZXMgZG8gbm90IGludHJvZHVjZSBhbnkgaW5jb25zaXN0ZW5jaWVz
IGluCnRoZSBmc3luY3xkZW50cnkgbWFya3MsIGFuZCBlbnN1cmUgdGhhdCB0aGUgZGVudHJ5fGZz
eW5jIG1hcmtzIGFyZSBvbmx5CnNldCBjb25kaXRpb25hbGx5IGluIHRoZSBmc3luYyBhbmQgYXRv
bWljIGNhbGwgcGF0aHMuCgpJIHdpbGwgbW92ZSB0aGUgc2V0L2NsZWFyIG9mIHRoZSBmc3luY3xk
ZW50cnkgbWFya3MgaW50bwpfX3dyaXRlX25vZGVfZm9saW8gdG8gbWFrZSB0aGUgbG9naWMgY2xl
YXJlciBpbiB2NCBwYXRjaC4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gVGhhbmtzLAo+IAo+IFRo
YW5rcywKPiAKPj4gwqDCoMKgwqDCoCBpZiAoIV9fd3JpdGVfbm9kZV9mb2xpbyhub2RlX2ZvbGlv
LCBmYWxzZSwgTlVMTCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmd2Jj
LCBmYWxzZSwgRlNfR0NfTk9ERV9JTywgTlVMTCkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIg
PSAtRUFHQUlOOwo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
