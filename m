Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONiHK/EznWlINQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 06:15:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC87181D6F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 06:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhCocUptsyA/CuwiRexHOSBNSjp6h99J3A1/D1rYTw4=; b=KATlcIeoCr/ecOKBnm3tFG2K4C
	61jXyGYXZvBR8bF5UdAuP8JLbJ/q3+ZumZh4Wmj/l4wMRprmjBDYzrCIf/IFurZc4vgIM7NFa8qeC
	FYT3S3Wj+6v/xUuQn2fyrw4x5z5EAZdJQss6CCZ+yeI7WUOfmdD8IZng+GLLWbvNC/Ww=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vuklQ-0005Hr-34;
	Tue, 24 Feb 2026 05:15:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vuklN-0005Hj-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 05:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGJUybjP2Ej8qaUbxgXron1WTlsaxm4dJpywIi0UM8w=; b=lYRfPOAqibAWE2FeT1fEyLNlVg
 QEdu+jJ9U0+kbrCmIAZ0bpmgZM7vW0744glNHSIiS6b8ZFYjzoy1El7j/Kc7Y75+XXGfaq5odWHMp
 WJKic32nsYa+/rfEVlhVE50Ds+N3wWKP1OhXwaqSbp0cKptkKB+gRrECRx7m5vwfQ/Nk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rGJUybjP2Ej8qaUbxgXron1WTlsaxm4dJpywIi0UM8w=; b=i5Xj6ay/yJoqSztUEDBwvdNDFx
 8mSwWXTwW5XEVfPr76gpBrtubfYWNx2PPCsnQioVvjYsVyEwVqtJVAsHpKnrkWjasbxJV9goExWDU
 w1z9KWUdCJn7HJQ5pkO/5eZWQ3CM3us1+XMxMGF1DiLuTFGRlOl3awui4Drjz/NRoI2s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vuklM-0003PG-DF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 05:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6710A40ACA;
 Tue, 24 Feb 2026 04:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189C6C116D0;
 Tue, 24 Feb 2026 04:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771907895;
 bh=I+B5gMJKCaQ2Xo4LXZ6dIbGLLxuGLlSItFKU+LhoEhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CcGgGjvdRNS3tmQxhp3S2kEyfCitYBt279CXtSZLWSg1iJJJkFQljscg3q17kgnKe
 K+yPbke5Q4LwUQjFXesFyQMMcchw7PfbIFCh4c5VDOjboG9D58kQP7tznGooru+tn1
 Mz167QyVOWANoUcOzDxezCYOD6+54vOTDqIOyCW7mERYB3ssUbEaAdX1D6EofqHmx1
 j11Q9XrWss+0qV3+e4iGckDrRsoN1YVl6EZsUo1v6mP+kAsrGUeCISiFTIw9ZZ5Hu1
 ZaIVhSsYBvNeGDz3s4D0HPKYJEpojP22rTPD3Pbw8iZ/WnXzzhGvhyN0Hu8IpDF0jB
 GX/amUNtGzAPA==
Date: Tue, 24 Feb 2026 04:38:13 +0000
To: Yongpeng Yang <monty_pavel@sina.com>
Message-ID: <aZ0rNWT8kvhVlID5@google.com>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <20260203133635.3942502-5-monty_pavel@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203133635.3942502-5-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/03,
 Yongpeng Yang wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
 > > f2fs_fiemap() calls f2fs_map_blocks() to obtain the block mapping a >
 file, and then merges contiguous mappings into [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vuklM-0003PG-DF
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: BFC87181D6F
X-Rspamd-Action: no action

T24gMDIvMDMsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4gCj4gZjJmc19maWVtYXAoKSBjYWxscyBmMmZzX21hcF9i
bG9ja3MoKSB0byBvYnRhaW4gdGhlIGJsb2NrIG1hcHBpbmcgYQo+IGZpbGUsIGFuZCB0aGVuIG1l
cmdlcyBjb250aWd1b3VzIG1hcHBpbmdzIGludG8gZXh0ZW50cy4gSWYgdGhlIG1hcHBpbmcKPiBp
cyBmb3VuZCBpbiB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIG5vZGUgYmxvY2tzIGRvIG5vdCBuZWVk
IHRvIGJlIHJlYWQuCj4gSG93ZXZlciwgaW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpbywgYSBjb250
aWd1b3VzIGV4dGVudCBjYW4gYmUgc3BsaXQKPiBpbnRvIHR3byBleHRlbnRzOgo+IAo+IHJvb3RA
dm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD00ICYm
IHN5bmMKPiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9
MU0gY291bnQ9MiBzZWVrPTIgY29udj1ub3RydW5jICYmIHN5bmMKPiByb290QHZtOi9tbnQvZjJm
cyMgZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzICMgZHJvcCAyTX40TSBleHRlbnQg
Y2FjaGUKPiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9
MU0gY291bnQ9MiBzZWVrPTAgY29udj1ub3RydW5jICYmIHN5bmMKPiByb290QHZtOi9tbnQvZjJm
cyMgZjJmc19pbyBmaWVtYXAgMCAxMDI0IGRhdGEuNE0KPiBGaWVtYXA6IG9mZnNldCA9IDAgbGVu
ID0gMTAyNAo+IGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAg
ICAgIGZsYWdzCj4gMAkwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDY0MDAwMDAgMDAwMDAwMDAw
MDIwMDAwMCAwMDAwMTAwMAo+IDEJMDAwMDAwMDAwMDIwMDAwMCAwMDAwMDAwMDA2NjAwMDAwIDAw
MDAwMDAwMDAyMDAwMDAgMDAwMDEwMDEKPiAKPiBBbHRob3VnaCB0aGUgcGh5c2ljYWwgYWRkcmVz
c2VzIG9mIHRoZSByYW5nZXMgMO+9njJNQiBhbmQgMk3vvZ40TUIgYXJlCj4gY29udGlndW91cywg
dGhlIG1hcHBpbmcgZm9yIHRoZSAyTe+9njRNQiByYW5nZSBpcyBub3QgcHJlc2VudCBpbiBtZW1v
cnkuCj4gV2hlbiB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIGZvciB0aGUgMO+9njJNQiByYW5nZSBh
cmUgdXBkYXRlZCwgbm8gbWVyZ2UKPiBoYXBwZW5zIGJlY2F1c2UgdGhlIGFkamFjZW50IG1hcHBp
bmcgaXMgbWlzc2luZyBmcm9tIHRoZSBpbi1tZW1vcnkKPiBjYWNoZS4gQXMgYSByZXN1bHQsIGZp
ZW1hcCByZXBvcnRzIHR3byBzZXBhcmF0ZSBleHRlbnRzIGluc3RlYWQgb2YgYQo+IHNpbmdsZSBj
b250aWd1b3VzIG9uZS4KPiAKPiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IHRoZSByZWFkIGV4dGVu
dCBjYWNoZSBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCBhbGwKPiBibG9ja3Mgb2YgYW4gZXh0ZW50
IGFyZSBwcmVzZW50IGluIG1lbW9yeS4gVGhlcmVmb3JlLCB3aGVuIHRoZSBleHRlbnQKPiBsZW5n
dGggcmV0dXJuZWQgYnkgZjJmc19tYXBfYmxvY2tzX2NhY2hlZCgpIGlzIHNtYWxsZXIgdGhhbiBt
YXhibG9ja3MsCj4gdGhlIHJlbWFpbmluZyBtYXBwaW5ncyBhcmUgcmV0cmlldmVkIHZpYSBmMmZz
X2dldF9kbm9kZV9vZl9kYXRhKCkgdG8KPiBlbnN1cmUgY29ycmVjdCBmaWVtYXAgZXh0ZW50IGJv
dW5kYXJ5IGhhbmRsaW5nLgo+IAo+IEZpeGVzOiBjZDhmYzUyMjZiZWYgKCJmMmZzOiByZW1vdmUg
dGhlIGNyZWF0ZSBhcmd1bWVudCB0byBmMmZzX21hcF9ibG9ja3MiKQo+IFNpZ25lZC1vZmYtYnk6
IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+IC0tLQo+ICBmcy9mMmZz
L2RhdGEuYyB8IDE0ICsrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBi
L2ZzL2YyZnMvZGF0YS5jCj4gaW5kZXggNDJmMTVmZDljNjhlLi5lZWRhZGNjZjg2YmIgMTAwNjQ0
Cj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+IEBAIC0xNjIz
LDggKzE2MjMsMTggQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBz
dHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+ICAJbGZzX2Rpb193cml0ZSA9
IChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJiBmMmZzX2xmc19tb2RlKHNiaSkgJiYKPiAg
CQkJCW1hcC0+bV9tYXlfY3JlYXRlKTsKPiAgCj4gLQlpZiAoIW1hcC0+bV9tYXlfY3JlYXRlICYm
IGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoaW5vZGUsIG1hcCwgZmxhZykpCj4gLQkJZ290byBvdXQ7
Cj4gKwlpZiAoIW1hcC0+bV9tYXlfY3JlYXRlKSB7Cj4gKwkJaWYgKGYyZnNfbWFwX2Jsb2Nrc19j
YWNoZWQoaW5vZGUsIG1hcCwgZmxhZykpIHsKPiArCQkJaWYgKG1hcC0+bV9sZW4gPT0gbWF4Ymxv
Y2tzKQo+ICsJCQkJZ290byBvdXQ7Cj4gKwkJCWVsc2Ugewo+ICsJCQkJcGdvZnMgPQkocGdvZmZf
dCltYXAtPm1fbGJsayArIG1hcC0+bV9sZW47Cj4gKwkJCQllbmQgPSBtYXAtPm1fbGJsayArIG1h
eGJsb2NrczsKPiArCQkJCW9mcyA9IG1hcC0+bV9sZW47Cj4gKwkJCQlnb3RvIG5leHRfZG5vZGU7
Cj4gKwkJCX0KPiArCQl9Cj4gKwl9CgpUaGlzIHBhdGNoIG1ha2VzIGEgc3lzdGVtIHBhbmljLgoK
PiAgCj4gIAltYXAtPm1fYmRldiA9IGlub2RlLT5pX3NiLT5zX2JkZXY7Cj4gIAltYXAtPm1fbXVs
dGlkZXZfZGlvID0KPiAtLSAKPiAyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
