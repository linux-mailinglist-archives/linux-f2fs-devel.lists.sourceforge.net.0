Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOSYJbhvu2mjkAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 04:38:32 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB122C59C2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 04:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMym8wQfKWAR666urTCFIjbsGF1/TNNQPyrB0hgwvzs=; b=H0NG8u17f+vXRgHkpokHNcuVMZ
	+FqQg76y55JFSSfk7Vyd4lygtHqaZV0pn3Vqd1q+CBnOFicRvkOzekC6z2msCopJDk6YRzjAAh9+e
	fka2iEViGLqfpOmw692ThNZAl8iDlwjz3BQ6SHICqnN8DnbqAhOptVH1eQr/IFT7RP0Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w34DL-0007UW-V8;
	Thu, 19 Mar 2026 03:38:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w34DJ-0007UP-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 03:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIR3or3A0Fbz8P98ibuMKJ/qntsYllP+88NT1v5aUh8=; b=VOQHGYFWFm7GfMhlyS4dl2Rdm3
 NrhxxHILvIecL+IeG6DJ836Vk1cRmy22XI35uupU9Hd9izln9GksA6cSGXkPX8Bu5SmoKjfUc0Dos
 TOKGxfz4+gaAamAX2Chm1JgWxe1iAlzQ1OD/fEtQQu5CWI3Y9LbqbGvP6Lft9tfaBmu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mIR3or3A0Fbz8P98ibuMKJ/qntsYllP+88NT1v5aUh8=; b=Y+rM+giQ9ZWdqTt5d9sUGW+MCc
 MCZ4eCIefBTb0KJtw3E1shVyaCPF1WlZIRQxgDplxQSOqQ/DqAcBtj3es9PL0tKddW7bV7TQg9FKB
 gUiTMILBIfBJrUWnW1nWW0CddCqfu2vrI0rziOZf+PH+eHRDZe7fpslOwehgrZU5sFXk=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w34DI-0001o2-5x for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 03:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773891504; bh=mIR3or3A0Fbz8P98ibuMKJ/qntsYllP+88NT1v5aUh8=;
 h=Message-ID:Date:Subject:From;
 b=VJ8s4CzjI7l7jevBFvC0bPNay2M8gXZ2cXfFjZxcs6or/dZAfqpqXNZKJLGLWB4O7
 zTrbaPqyRzouWGcyHpqzEJSvKfJwfsGxHblcRp670+OtyA6t/4END30Avk1wwgYbpT
 xJ4Ycd8DfFv1YYSrDYJKWBG7YliAhT8MltCIhGBk=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69BB6FA500004120; Thu, 19 Mar 2026 11:38:15 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 3994454456693
X-SMAIL-UIID: 2F383B1ECD7A46C099F16CBD9790F9E8-20260319-113815-1
Message-ID: <7959c00b-9510-4781-8234-9d040cf55f75@sina.com>
Date: Thu, 19 Mar 2026 11:38:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yongpeng Yang
 <yangyongpeng@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net,
 Chao Yu <chao@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <20260203133635.3942502-5-monty_pavel@sina.com> <aZ0rNWT8kvhVlID5@google.com>
 <d6fbea59-1212-4426-898e-e9f436bd5972@sina.com> <aaHvFu7NRb00Px05@google.com>
 <aaIBhhaSJxJxy4Dv@google.com>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <aaIBhhaSJxJxy4Dv@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/28/26 04:41, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > On 02/27, Jaegeuk Kim via Linux-f2fs-devel wrote: >> On 02/27, Yongpeng
 Yang wrote: >>> On 2/24/26 12:38, Jaegeuk Kim via Linux-f2fs-devel w [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.19 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w34DI-0001o2-5x
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: fix fiemap boundary handling when
 read extent cache is incomplete
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
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:chao@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,sina.com:mid,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 5BB122C59C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMi8yOC8yNiAwNDo0MSwgSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6
Cj4gT24gMDIvMjcsIEphZWdldWsgS2ltIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBP
biAwMi8yNywgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+IE9uIDIvMjQvMjYgMTI6MzgsIEphZWdl
dWsgS2ltIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IE9uIDAyLzAzLCBZb25ncGVu
ZyBZYW5nIHdyb3RlOgo+Pj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlh
b21pLmNvbT4KPj4+Pj4KPj4+Pj4gZjJmc19maWVtYXAoKSBjYWxscyBmMmZzX21hcF9ibG9ja3Mo
KSB0byBvYnRhaW4gdGhlIGJsb2NrIG1hcHBpbmcgYQo+Pj4+PiBmaWxlLCBhbmQgdGhlbiBtZXJn
ZXMgY29udGlndW91cyBtYXBwaW5ncyBpbnRvIGV4dGVudHMuIElmIHRoZSBtYXBwaW5nCj4+Pj4+
IGlzIGZvdW5kIGluIHRoZSByZWFkIGV4dGVudCBjYWNoZSwgbm9kZSBibG9ja3MgZG8gbm90IG5l
ZWQgdG8gYmUgcmVhZC4KPj4+Pj4gSG93ZXZlciwgaW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpbywg
YSBjb250aWd1b3VzIGV4dGVudCBjYW4gYmUgc3BsaXQKPj4+Pj4gaW50byB0d28gZXh0ZW50czoK
Pj4+Pj4KPj4+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRN
IGJzPTFNIGNvdW50PTQgJiYgc3luYwo+Pj4+PiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rl
di96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTIgY29udj1ub3RydW5jICYmIHN5
bmMKPj4+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2Nh
Y2hlcyAjIGRyb3AgMk1+NE0gZXh0ZW50IGNhY2hlCj4+Pj4+IHJvb3RAdm06L21udC9mMmZzIyBk
ZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5vdHJ1
bmMgJiYgc3luYwo+Pj4+PiByb290QHZtOi9tbnQvZjJmcyMgZjJmc19pbyBmaWVtYXAgMCAxMDI0
IGRhdGEuNE0KPj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDEwMjQKPj4+Pj4gbG9naWNh
bCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPj4+Pj4g
MAkwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDY0MDAwMDAgMDAwMDAwMDAwMDIwMDAwMCAwMDAw
MTAwMAo+Pj4+PiAxCTAwMDAwMDAwMDAyMDAwMDAgMDAwMDAwMDAwNjYwMDAwMCAwMDAwMDAwMDAw
MjAwMDAwIDAwMDAxMDAxCj4+Pj4+Cj4+Pj4+IEFsdGhvdWdoIHRoZSBwaHlzaWNhbCBhZGRyZXNz
ZXMgb2YgdGhlIHJhbmdlcyAw772eMk1CIGFuZCAyTe+9njRNQiBhcmUKPj4+Pj4gY29udGlndW91
cywgdGhlIG1hcHBpbmcgZm9yIHRoZSAyTe+9njRNQiByYW5nZSBpcyBub3QgcHJlc2VudCBpbiBt
ZW1vcnkuCj4+Pj4+IFdoZW4gdGhlIHBoeXNpY2FsIGFkZHJlc3NlcyBmb3IgdGhlIDDvvZ4yTUIg
cmFuZ2UgYXJlIHVwZGF0ZWQsIG5vIG1lcmdlCj4+Pj4+IGhhcHBlbnMgYmVjYXVzZSB0aGUgYWRq
YWNlbnQgbWFwcGluZyBpcyBtaXNzaW5nIGZyb20gdGhlIGluLW1lbW9yeQo+Pj4+PiBjYWNoZS4g
QXMgYSByZXN1bHQsIGZpZW1hcCByZXBvcnRzIHR3byBzZXBhcmF0ZSBleHRlbnRzIGluc3RlYWQg
b2YgYQo+Pj4+PiBzaW5nbGUgY29udGlndW91cyBvbmUuCj4+Pj4+Cj4+Pj4+IFRoZSByb290IGNh
dXNlIGlzIHRoYXQgdGhlIHJlYWQgZXh0ZW50IGNhY2hlIGRvZXMgbm90IGd1YXJhbnRlZSB0aGF0
IGFsbAo+Pj4+PiBibG9ja3Mgb2YgYW4gZXh0ZW50IGFyZSBwcmVzZW50IGluIG1lbW9yeS4gVGhl
cmVmb3JlLCB3aGVuIHRoZSBleHRlbnQKPj4+Pj4gbGVuZ3RoIHJldHVybmVkIGJ5IGYyZnNfbWFw
X2Jsb2Nrc19jYWNoZWQoKSBpcyBzbWFsbGVyIHRoYW4gbWF4YmxvY2tzLAo+Pj4+PiB0aGUgcmVt
YWluaW5nIG1hcHBpbmdzIGFyZSByZXRyaWV2ZWQgdmlhIGYyZnNfZ2V0X2Rub2RlX29mX2RhdGEo
KSB0bwo+Pj4+PiBlbnN1cmUgY29ycmVjdCBmaWVtYXAgZXh0ZW50IGJvdW5kYXJ5IGhhbmRsaW5n
Lgo+Pj4+Pgo+Pj4+PiBGaXhlczogY2Q4ZmM1MjI2YmVmICgiZjJmczogcmVtb3ZlIHRoZSBjcmVh
dGUgYXJndW1lbnQgdG8gZjJmc19tYXBfYmxvY2tzIikKPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9u
Z3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgZnMv
ZjJmcy9kYXRhLmMgfCAxNCArKysrKysrKysrKystLQo+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+IGluZGV4IDQyZjE1ZmQ5YzY4ZS4u
ZWVkYWRjY2Y4NmJiIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+PiArKysg
Yi9mcy9mMmZzL2RhdGEuYwo+Pj4+PiBAQCAtMTYyMyw4ICsxNjIzLDE4IEBAIGludCBmMmZzX21h
cF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFw
LCBpbnQgZmxhZykKPj4+Pj4gIAlsZnNfZGlvX3dyaXRlID0gKGZsYWcgPT0gRjJGU19HRVRfQkxP
Q0tfRElPICYmIGYyZnNfbGZzX21vZGUoc2JpKSAmJgo+Pj4+PiAgCQkJCW1hcC0+bV9tYXlfY3Jl
YXRlKTsKPj4+Pj4gIAo+Pj4+PiAtCWlmICghbWFwLT5tX21heV9jcmVhdGUgJiYgZjJmc19tYXBf
YmxvY2tzX2NhY2hlZChpbm9kZSwgbWFwLCBmbGFnKSkKPj4+Pj4gLQkJZ290byBvdXQ7Cj4+Pj4+
ICsJaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSkgewo+Pj4+PiArCQlpZiAoZjJmc19tYXBfYmxvY2tz
X2NhY2hlZChpbm9kZSwgbWFwLCBmbGFnKSkgewo+Pj4+PiArCQkJaWYgKG1hcC0+bV9sZW4gPT0g
bWF4YmxvY2tzKQo+Pj4+PiArCQkJCWdvdG8gb3V0Owo+Pj4+PiArCQkJZWxzZSB7Cj4+Pj4+ICsJ
CQkJcGdvZnMgPQkocGdvZmZfdCltYXAtPm1fbGJsayArIG1hcC0+bV9sZW47Cj4+Pj4+ICsJCQkJ
ZW5kID0gbWFwLT5tX2xibGsgKyBtYXhibG9ja3M7Cj4+Pj4+ICsJCQkJb2ZzID0gbWFwLT5tX2xl
bjsKPj4+Pj4gKwkJCQlnb3RvIG5leHRfZG5vZGU7Cj4+Pj4+ICsJCQl9Cj4+Pj4+ICsJCX0KPj4+
Pj4gKwl9Cj4+Pj4KPj4+PiBUaGlzIHBhdGNoIG1ha2VzIGEgc3lzdGVtIHBhbmljLgo+Pj4KPj4+
IEkgaGF2ZSBkb25lIHNvbWUgdGVzdGluZyBhbmQgb25seSBvYnNlcnZlZCB0aGUgcGFuaWMgaW4g
dGhlCj4+PiBmMmZzX3dyaXRlX2VuZF9pbygpIHBhdGguIFN5emJvdCBoYXMgYWxzbyByZXBvcnRl
ZCBpdDoKPj4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD02ZTRjYjFj
YWM1ZWZjOTZlYTBjYQo+Pj4gTXkgcHJvcG9zZWQgZml4IGlzIGhlcmU6Cj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMjcwNzMwNTIuMzk0MDk1OC0yLW1vbnR5X3BhdmVsQHNp
bmEuY29tLwo+Pj4KPj4+IElzIHRoaXMgdGhlIHNhbWUgaXNzdWU/Cj4+Cj4+IFllYWgsIEkgdGhp
bmsgc28uCj4gCj4gQWN0dWFsbHksIG5vdC4KPiAKPiBbMzE1ODY4LjA2ODgxMV0gQlVHOiBrZXJu
ZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDA4Cj4g
WzMxNTg2OC4wNzQ2MjNdIFJJUDogMDAxMDpmMmZzX21hcF9ibG9ja3MrMHhiNzAvMHgxNDgwIFtm
MmZzXQo+IFszMTU4NjguMjAxMzk0XSBDYWxsIFRyYWNlOgo+IFszMTU4NjguMjAyNjg5XSAgPFRB
U0s+Cj4gWzMxNTg2OC4yMDM4MDldICA/IHhhX2xvYWQrMHg2Yy8weGEwCj4gWzMxNTg2OC4yMDU0
MzFdICBmMmZzX21wYWdlX3JlYWRwYWdlcysweDIyYi8weGY4MCBbZjJmc10KPiBbMzE1ODY4LjIw
ODkwMl0gID8gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCsweDNmZi8weDE3OTAKPiBbMzE1ODY4LjIx
MTM3NF0gID8gZGVidWdfc21wX3Byb2Nlc3Nvcl9pZCsweDE3LzB4MjAKPiBbMzE1ODY4LjIxMzYy
N10gIGYyZnNfcmVhZGFoZWFkKzB4YmMvMHgxMTAgW2YyZnNdCj4gWzMxNTg2OC4yMTU4MDldICBy
ZWFkX3BhZ2VzKzB4NjAvMHgyMDAKPiBbMzE1ODY4LjIxNzQ3OF0gIHBhZ2VfY2FjaGVfcmFfdW5i
b3VuZGVkKzB4MTg3LzB4MjYwCj4gWzMxNTg2OC4yMjAyNzFdICBkb19wYWdlX2NhY2hlX3JhLmlz
cmEuMCsweDYyLzB4ODAKPiBbMzE1ODY4LjIyMjUwN10gIHBhZ2VfY2FjaGVfc3luY19yYSsweDY5
LzB4MjUwCj4gWzMxNTg2OC4yMjQ0OTFdICBmaWxlbWFwX2dldF9wYWdlcysweDE0ZS8weDc0MAo+
IFszMTU4NjguMjI2NTU1XSAgZmlsZW1hcF9yZWFkKzB4ZmUvMHg0NTAKPiBbMzE1ODY4LjIyODQ4
OF0gID8gZGVidWdfc21wX3Byb2Nlc3Nvcl9pZCsweDE3LzB4MjAKPiBbMzE1ODY4LjIzMjg5Nl0g
ID8gZnByZWdzX2Fzc2VydF9zdGF0ZV9jb25zaXN0ZW50KzB4MzgvMHg2MAo+IFszMTU4NjguMjM1
NDIxXSAgPyBmc2NyeXB0X2Rpb19zdXBwb3J0ZWQrMHgzNy8weGEwCj4gWzMxNTg2OC4yMzg1ODdd
ICA/IGYyZnNfZm9yY2VfYnVmZmVyZWRfaW8rMHgyNC8weGQwIFtmMmZzXQo+IFszMTU4NjguMjQx
ODE5XSAgZjJmc19maWxlX3JlYWRfaXRlcisweDI0NC8weDQ3MCBbZjJmc10KPiBbMzE1ODY4LjI0
NjE5OF0gID8gZjJmc19sbHNlZWsrMHgxN2MvMHg2ZjAgW2YyZnNdCj4gWzMxNTg2OC4yNDg2NjZd
ICB2ZnNfcmVhZCsweDI1OC8weDM1MAo+IFszMTU4NjguMjUxNDg5XSAga3N5c19yZWFkKzB4Njkv
MHhlMAo+IFszMTU4NjguMjUzMzA0XSAgX194NjRfc3lzX3JlYWQrMHgxOS8weDIwCj4gWzMxNTg2
OC4yNTU5NjFdICB4NjRfc3lzX2NhbGwrMHgyMDAwLzB4MjEyMAo+IFszMTU4NjguMjU5MTc4XSAg
ZG9fc3lzY2FsbF82NCsweGQzLzB4NzYwCj4gWzMxNTg2OC4yNjA5MzBdICA/IGRlYnVnX3NtcF9w
cm9jZXNzb3JfaWQrMHgxNy8weDIwCj4gWzMxNTg2OC4yNjQ5MDBdICA/IGZwcmVnc19hc3NlcnRf
c3RhdGVfY29uc2lzdGVudCsweDM4LzB4NjAKPiBbMzE1ODY4LjI2ODMyOV0gID8gZG9fc3lzY2Fs
bF82NCsweDEwYy8weDc2MAo+IFszMTU4NjguMjczMjE2XSAgPyBrbWVtX2NhY2hlX2ZyZWUrMHgx
NGEvMHgzNTAKPiBbMzE1ODY4LjI3NjE1Nl0gID8gX3Jhd19zcGluX3VubG9jaysweDE5LzB4NDAK
PiBbMzE1ODY4LjI3ODE0N10gID8gX19mcHV0KzB4MTk5LzB4MmIwCj4gWzMxNTg2OC4yNzk4NzNd
ICA/IGZwdXRfY2xvc2Vfc3luYysweDNmLzB4YzAKPiBbMzE1ODY4LjI4MTc1Nl0gID8gZGVidWdf
c21wX3Byb2Nlc3Nvcl9pZCsweDE3LzB4MjAKPiBbMzE1ODY4LjI4NTYwMl0gID8gZnByZWdzX2Fz
c2VydF9zdGF0ZV9jb25zaXN0ZW50KzB4MzgvMHg2MAo+IFszMTU4NjguMjg4MjE4XSAgPyBkb19z
eXNjYWxsXzY0KzB4MTBjLzB4NzYwCj4gWzMxNTg2OC4yOTEyOTVdICA/IGRlYnVnX3NtcF9wcm9j
ZXNzb3JfaWQrMHgxNy8weDIwCj4gWzMxNTg2OC4yOTM1MTRdICA/IGZwcmVnc19hc3NlcnRfc3Rh
dGVfY29uc2lzdGVudCsweDM4LzB4NjAKPiBbMzE1ODY4LjI5NTkyNF0gID8gZG9fc3lzY2FsbF82
NCsweDNjZi8weDc2MAo+IFszMTU4NjguMjk4Njg5XSAgPyBjbGVhcl9iaGJfbG9vcCsweDMwLzB4
ODAKPiBbMzE1ODY4LjMwMDUwNF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2
LzB4N2UKPiBbMzE1ODY4LjMwMjgxMl0gUklQOiAwMDMzOjB4N2Y1MGVkNTFhN2ExCj4gCgpJIHJl
cHJvZHVjZWQgdGhpcyBpc3N1ZS4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB3aGVuIGYyZnNfbWFw
X2Jsb2NrcygpCi0+ZjJmc19tYXBfYmxvY2tzX2NhY2hlZCgpIGhpdHMgdGhlIHJlYWQgZXh0ZW50
IGNhY2hlLCBtYXAKLT5tX211bHRpZGV2X2RpbyBpcyBub3QgdXBkYXRlZC4gTWVhbndoaWxlLCB0
aGUgZjJmc19tcGFnZV9yZWFkcGFnZXMoKQpjYWxsIHBhdGggZG9lcyBub3QgaW5pdGlhbGl6ZSBp
dCBlaXRoZXIuIEFzIGEgcmVzdWx0LCBvbiBhIHNpbmdsZS1kZXZpY2UKbW91bnQsIG1hcC0+bV9t
dWx0aWRldl9kaW8gbWF5IGJlIGxlZnQgYXMgbm9uLXplcm8sIGNhdXNpbmcKZjJmc19tYXBfYmxv
Y2tzKCktPm1hcF9pc19tZXJnZWFibGUoKSB0byBhY2Nlc3MgRkRFVihiaWR4KS5iZGV2LCB3aGlj
aApjYW4gbGVhZCB0byBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4KCkknbGwgZml4IHRoaXMg
aW4gdjIgcGF0Y2guCgpUaGFua3MKWW9uZ3BlbmcsCgo+Pgo+Pj4KPj4+IFRoYW5rcwo+Pj4gWW9u
Z3BlbmcsCj4+Pgo+Pj4+Cj4+Pj4+ICAKPj4+Pj4gIAltYXAtPm1fYmRldiA9IGlub2RlLT5pX3Ni
LT5zX2JkZXY7Cj4+Pj4+ICAJbWFwLT5tX211bHRpZGV2X2RpbyA9Cj4+Pj4+IC0tIAo+Pj4+PiAy
LjQzLjAKPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
