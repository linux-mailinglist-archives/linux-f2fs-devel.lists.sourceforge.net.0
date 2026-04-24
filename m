Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFTEAuY762mMKAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Apr 2026 11:46:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A345C6E7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Apr 2026 11:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDRB2b61GZZPk+mpTazoU6zLKwYxjw+JqaDR5a3rNIg=; b=TtWPR+3rF2bdLuxClrkMcUVh4v
	X9b/D4q6C7K6C7ODW+wswOejj9yslRW8mSxbbdyYfXXv4PWdeUcKRtBbtqorT1TUw7fx6pN42aaQt
	zOiQdTJ8m0CsY1HWc4JgnlVviYv/Ay72N9AvemlcxqKF4nWE7fLiJOcVdYR4c3JZofmI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGD6l-0002oI-R6;
	Fri, 24 Apr 2026 09:45:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wGD6j-0002o5-S8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Apr 2026 09:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=59EqtpJy4/2gF4KeCUUvmFmLqxMdJYSoXzV/Rf0zN6Q=; b=IV9E5UUCMiOO4IptRyKvYVaGDI
 JZhYFPjkx/3BdydVL5OL0f1IvjtuMej8lANv/dbwOSDs6EQRulbUmE1azmAmJ6NNULRH4TIOleZN6
 R6fNryAQTLEpx7GusbQoW/b43VUdxSW/x1uCAyRPp/WOM78fJDnxpJtofmFBz6xtKWOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=59EqtpJy4/2gF4KeCUUvmFmLqxMdJYSoXzV/Rf0zN6Q=; b=gUipwv3bkBXZ7iWYjjYGGKUySw
 /9K4scifuqZxTt6IPfzd9QGNYysMeUJQkiYtmTV3K950gIqDFtCFRZ+CWaaSyYNwRpjaQhPWsMFBL
 u1raq24XX9S1WzG53DJA79Me394G1liyebPmskVXtIg0Ju9ABzLFFFykHHT/775fvBwY=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wGD6f-0003Gc-RO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Apr 2026 09:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1777023953; bh=59EqtpJy4/2gF4KeCUUvmFmLqxMdJYSoXzV/Rf0zN6Q=;
 h=Message-ID:Date:Subject:From;
 b=Fq9BF9a29Q+cE+rtWu/uRoe7iev4GZb8ZPWbdrsrSjwK1775ZspF3UyF8NOhjEMZu
 oj7AmEtB40Ga7wYDfeM3nOuyf5qX7pIyw0gwdoblqGNwAwpCfyW8GNfFe0IwfO36GO
 4iEmcdGFJRskAO0eLGwYpcsxBL6plgB8m6bZTRr8=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69EB3BC100002ABD; Fri, 24 Apr 2026 17:45:39 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4387756685161
X-SMAIL-UIID: 1CEC3BD731DF4B128E69BBDA3B45E8C9-20260424-174539-1
Message-ID: <8f3dee76-6094-421f-bb32-a059815b405c@sina.com>
Date: Fri, 24 Apr 2026 17:45:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260422073525.2063784-2-monty_pavel@sina.com>
 <206a897a-2860-40b5-bbb8-829954d7e568@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <206a897a-2860-40b5-bbb8-829954d7e568@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/22/26 20:33, Chao Yu via Linux-f2fs-devel wrote: > On
 4/22/2026 3:35 PM, Yongpeng Yang wrote: >> From: yangyongpeng >> >> When
 __destroy_extent_node() sets the inode flag FI_NO_EXTENT, it does [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wGD6f-0003Gc-RO
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix incorrect FI_NO_EXTENT handling in
 __destroy_extent_node()
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
X-Rspamd-Queue-Id: 894A345C6E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,sina.com:mid]

Ck9uIDQvMjIvMjYgMjA6MzMsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gNC8yMi8yMDI2IDM6MzUgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IHlhbmd5
b25ncGVuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Cj4+IFdoZW4gX19kZXN0cm95X2V4
dGVudF9ub2RlKCkgc2V0cyB0aGUgaW5vZGUgZmxhZyBGSV9OT19FWFRFTlQsIGl0IGRvZXMKPj4g
bm90IHJlc2V0IHRoZSBsZW5ndGggb2YgdGhlIGxhcmdlc3QgZXh0ZW50IHRvIDAgYW5kIHVwZGF0
ZSB0aGUgaW5vZGUKPj4gZm9saW8uIFNpbmNlIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGV4dGVudCB0
cmVlIGFyZSBkaXNhbGxvd2VkIGFmdGVyd2FyZCwKPj4gdGhlIGNhY2hlZCBsYXJnZXN0IGV4dGVu
dCBtYXkgYmVjb21lIHN0YWxlLiBUaGlzIGNhbiB0cmlnZ2VyIHRoZQo+PiBmb2xsb3dpbmcgZXJy
b3IgaW4geGZzdGVzdHMgZ2VuZXJpYy8zODg6Cj4+Cj4+IEYyRlMtZnMgKGRtLTApOiBzYW5pdHlf
Y2hlY2tfZXh0ZW50X2NhY2hlOiBpbm9kZSAoaW5vPTE3NjEpIGV4dGVudAo+PiBpbmZvIFsyMjAw
NTcsIDU3LCA2XSBpcyBpbmNvcnJlY3QsIHJ1biBmc2NrIHRvIGZpeAo+Pgo+PiBJbiB0aGUgZjJm
c19kcm9wX2lub2RlIHBhdGgsIF9fZGVzdHJveV9leHRlbnRfbm9kZSgpIGRvZXMgbm90IG5lZWQg
dG8KPj4gZ3VhcmFudGVlIHRoYXQgZXQtPm5vZGVfY250IGlzIDAsIGJlY2F1c2UgY29uY3VycmVu
Y3kgd2l0aCB3cml0ZWJhY2sKPj4gaXMgZXhwZWN0ZWQgaW4gdGhpcyBwYXRoLCBhbmQgd3JpdGVi
YWNrIG1heSB1cGRhdGUgdGhlIGV4dGVudCBjYWNoZS4KPj4KPj4gVGhpcyBwYXRjaCB1cGRhdGVz
IF9fZGVzdHJveV9leHRlbnRfbm9kZSgpIHRvIGF2b2lkIHNldHRpbmcgdGhlIGlub2RlCj4+IGZs
YWcgRklfTk9fRVhURU5ULCBhbmQgdG8gcmVtb3ZlIHRoZSBjaGVjayB6ZXJvIG9mIGV0LT5ub2Rl
X2NudC4KPj4KPj4gRml4ZXM6IGVkNzhhZWViZWYwNSAoImYyZnM6IGZpeCBub2RlX2NudCByYWNl
IGJldHdlZW4gZXh0ZW50IG5vZGUKPj4gZGVzdHJveSBhbmQgd3JpdGViYWNrIikKPj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gUmVwb3J0ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KPj4gU3VnZ2VzdGVkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IFNpZ25l
ZC1vZmYtYnk6IHlhbmd5b25ncGVuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+IC0tLQo+
PiDCoCBmcy9mMmZzL2V4dGVudF9jYWNoZS5jIHwgNCAtLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUu
YyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4gaW5kZXggODcxNjlmZDI5ZDg5Li4zYWRiZWFk
Mjc5NTMgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4gKysrIGIvZnMv
ZjJmcy9leHRlbnRfY2FjaGUuYwo+PiBAQCAtNjQ1LDE0ICs2NDUsMTAgQEAgc3RhdGljIHVuc2ln
bmVkIGludCBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoc3RydWN0Cj4+IGlub2RlICppbm9kZSwKPj4g
wqAgwqDCoMKgwqDCoCB3aGlsZSAoYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPj4gLcKgwqDCoMKgwqDCoMKg
IGlmICghaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX05PX0VYVEVOVCkpCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19FWFRFTlQpOwo+IAo+
IFdlJ2QgYmV0dGVyIHJldmVydCBhbGwgY2hhbmdlIGxpbmVzIGluICJmMmZzOiBmaXggbm9kZV9j
bnQgcmFjZSBiZXR3ZWVuCj4gZXh0ZW50IG5vZGUgZGVzdHJveSBhbmQgd3JpdGViYWNrIj8KClRo
ZSBvdGhlcnMgYWxsIGNoZWNrIHdoZXRoZXIgRklfTk9fRVhURU5UIGlzIHNldC4gV2hlbiBpdCBp
cyBzZXQsCmluc2VydGluZyBhbiBhZ2UgZXh0ZW50IGlzIGRpc2FsbG93ZWQsIHNvIG5vdGhpbmcg
d2FzIHJlbW92ZWQuCgpUaGFua3MKWW9uZ3BlbmcsCgo+IAo+IFRoYW5rcywKPiAKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIG5vZGVfY250ICs9IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0LCBucl9z
aHJpbmspOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7Cj4+
IMKgwqDCoMKgwqAgfQo+PiDCoCAtwqDCoMKgIGYyZnNfYnVnX29uKHNiaSwgYXRvbWljX3JlYWQo
JmV0LT5ub2RlX2NudCkpOwo+PiAtCj4+IMKgwqDCoMKgwqAgcmV0dXJuIG5vZGVfY250Owo+PiDC
oCB9Cj4+IMKgIAo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
