Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WACgL53V5WnWoQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 09:28:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD333427BDC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 09:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bzya5q2vbdm6/4waJG9GGjhwvJa+bNBxTLmn6HC9Ms=; b=DyS1A4phfXuqLUcgDhylZ0LXIo
	lIAFMwbexlbDkRIVNEgujQ/LCvCCjiASD0yi7c4mhBBbP4Ul9KrD8EXeTN1fQWf73hanZLoLTDhsf
	cSLKob0m8GuVy19cfZXO78LP3NagyfafOBpvbrgkZT9J1xs/d409KjHbqZiNHcnxXjPM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wEj3K-0008BS-5b;
	Mon, 20 Apr 2026 07:28:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wEj3I-0008BK-PV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 07:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cwZWj7c8a8tpynce5Tqe8QoH8FDsg5C1yhx3uCCCQbE=; b=KVs9f1xw1+tO+GKwefxj9lpEFR
 ofxnwm3z6HD/75J9HAGOGpbHBR6+UuG5Qpczmp/H7V05LmIPl262Hy+jlXKMlyYjkhnkcWxhRgYNE
 MCYnJAqu4epmK/cIp8GbobIvBSUgpC3QWeUslOwaIhfJqxspEyVCMIz5+p+Xvbx6Sk3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cwZWj7c8a8tpynce5Tqe8QoH8FDsg5C1yhx3uCCCQbE=; b=DjdXhSbBVUqekz53EKPeqZErMC
 VOEerNXMWa5nJ6KvWP0kO72aQh7LHEiBSrHklpIZ9ExPn1IX5z0r6UJfI39oWSgGxEXmDnrgKvcxn
 NrLAh/MI1Tucg54D/eOARw/aNBrXKvDHL74oeTafI4IX0uJ12pAC0fGVI5YjKY20nwb8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEj3F-0000oV-GK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 07:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F07660103;
 Mon, 20 Apr 2026 07:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B24C19425;
 Mon, 20 Apr 2026 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776670082;
 bh=VfNyN8J1po7I2Oq4NzVRZ4dNXszSRW8MHbghJgGs+hc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YnlqKjnt9dP4wxw0fwrfPouQSCd/9z2n4zWVJzx5ACvwnrwJaWv6XR60Cxj0XLsjQ
 YnCYOxtFfY5CLzD6cN+gkRS9B210EgJgqZFyu76Y6JxGcAYODDkHDZQuBQ13B1DC5K
 H6d+Ty0IqKQirsOpBChCYd9lksPkOlBP23v2rdb5VOKCRvMs/1U+S45uwSBbo5bEs7
 GlZKnlxiB8Qo/e3pkUS9qOSjHanwhzeIJ/ROpUF1Nillfn1Y7d5IvfDCGbJpA+uUhM
 zQ9WI0tfQq+ztI5ORPyqj9wrkbUIDUwQgRxiWSjVUAADshEsFmHTPKcIId8NeYA9E2
 453ycE+9TAw+w==
Message-ID: <bedd1951-681b-4364-80c9-c7fe6886c992@kernel.org>
Date: Mon, 20 Apr 2026 15:28:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
 <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
 <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
 <a643b967-cb05-4de5-96f2-f1b783c9758d@sina.com>
Content-Language: en-US
In-Reply-To: <a643b967-cb05-4de5-96f2-f1b783c9758d@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/19/2026 12:29 AM, Yongpeng Yang wrote: > > On 4/18/26
 8:51 AM, Chao Yu via Linux-f2fs-devel wrote: >> On 4/17/26 21:26, Yongpeng
 Yang wrote: >>> >>> On 4/17/26 17:00, Chao Yu via Linux-f2fs-devel [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wEj3F-0000oV-GK
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: CD333427BDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8xOS8yMDI2IDEyOjI5IEFNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IAo+IE9uIDQvMTgv
MjYgODo1MSBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24gNC8x
Ny8yNiAyMToyNiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Cj4+PiBPbiA0LzE3LzI2IDE3OjAw
LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IE9uIDQvMy8yNiAyMjo0
MCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Cj4+Pj4+IGYyZnNfZGVzdHJveV9leHRlbnRfbm9kZSgp
IGRvZXMgbm90IHNldCBGSV9OT19FWFRFTlQgYmVmb3JlIGNsZWFyaW5nCj4+Pj4+IGV4dGVudCBu
b2Rlcy4gV2hlbiBjYWxsZWQgZnJvbSBmMmZzX2Ryb3BfaW5vZGUoKSB3aXRoIElfU1lOQyBzZXQs
Cj4+Pj4+IGNvbmN1cnJlbnQga3dvcmtlciB3cml0ZWJhY2sgY2FuIGluc2VydCBuZXcgZXh0ZW50
IG5vZGVzIGludG8gdGhlIHNhbWUKPj4+Pj4gZXh0ZW50IHRyZWUsIHJhY2luZyB3aXRoIHRoZSBk
ZXN0cm95IGFuZCB0cmlnZ2VyaW5nIGYyZnNfYnVnX29uKCkgaW4KPj4+Pj4gX19kZXN0cm95X2V4
dGVudF9ub2RlKCkuIFRoZSBzY2VuYXJpbyBpcyBhcyBmb2xsb3dzOgo+Pj4+Pgo+Pj4+PiBkcm9w
IGlub2RlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHdyaXRlYmFjawo+Pj4+PiAgwqDCoCAtIGlwdXQKPj4+Pj4gIMKgwqDCoCAtIGYyZnNfZHJv
cF9pbm9kZcKgIC8vIElfU1lOQyBzZXQKPj4+Pj4gIMKgwqDCoMKgIC0gZjJmc19kZXN0cm95X2V4
dGVudF9ub2RlCj4+Pj4+ICDCoMKgwqDCoMKgIC0gX19kZXN0cm95X2V4dGVudF9ub2RlCj4+Pj4+
ICDCoMKgwqDCoMKgwqAgLSB3aGlsZSAobm9kZV9jbnQpIHsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCB3cml0ZV9sb2NrKCZldC0+bG9jaykKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Zy
ZWVfZXh0ZW50X3RyZWUKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJmV0
LT5sb2NrKQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX3dyaXRlYmFja19zaW5n
bGVfaW5vZGUKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX291dHBsYWNl
X3dyaXRlX2RhdGEKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtCj4+Pj4+IGYy
ZnNfdXBkYXRlX3JlYWRfZXh0ZW50X2NhY2hlCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtCj4+Pj4+IF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlCj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEZJX05PX0VYVEVOVCBub3Qgc2V0LAo+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBpbnNlcnQgbmV3IGV4dGVudCBub2Rl
Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIH0gLy8gbm9kZV9jbnQgPT0gMCwgZXhpdCB3aGlsZQo+
Pj4+PiAgwqDCoMKgwqDCoMKgIC0gZjJmc19idWdfb24obm9kZV9jbnQpwqAgLy8gbm9kZV9jbnQg
PiAwCj4+Pj4+Cj4+Pj4+IEFkZGl0aW9uYWxseSwgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uo
KSBvbmx5IGNoZWNrcyBGSV9OT19FWFRFTlQgZm9yCj4+Pj4+IEVYX1JFQUQgdHlwZSwgbGVhdmlu
ZyBFWF9CTE9DS19BR0UgdXBkYXRlcyBjb21wbGV0ZWx5IHVucHJvdGVjdGVkLgo+Pj4+Pgo+Pj4+
PiBUaGlzIHBhdGNoIHNldCBGSV9OT19FWFRFTlQgdW5kZXIgZXQtPmxvY2sgaW4gX19kZXN0cm95
X2V4dGVudF9ub2RlKCksCj4+Pj4+IGNvbnNpc3RlbnQgd2l0aCBvdGhlciBjYWxsZXJzIChfX3Vw
ZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSBhbmQKPj4+Pj4gX19kcm9wX2V4dGVudF90cmVlKSBhbmQg
Y2hlY2sgRklfTk9fRVhURU5UIGZvciBib3RoIEVYX1JFQUQgYW5kCj4+Pj4+IEVYX0JMT0NLX0FH
RSB0cmVlLgo+Pj4+Cj4+Pj4gSSBzdWZmZXJlZCBiZWxvdyB0ZXN0IGZhaWx1cmUsIHRoZW4gSSBi
aXNlY3QgdG8gdGhpcyBjaGFuZ2UuCj4+Pj4KPj4+PiAgwqDCoMKgwqAgZ2VuZXJpYy80NzXCoCA4
NHMgLi4uIFtmYWlsZWQsIGV4aXQgc3RhdHVzIDFdLSBvdXRwdXQgbWlzbWF0Y2gKPj4+PiAoc2Vl
IC8KPj4+PiBzaGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzQ3NS5vdXQuYmFkKQo+
Pj4+ICDCoMKgwqDCoCAtLS0gdGVzdHMvZ2VuZXJpYy80NzUub3V0wqDCoCAyMDI1LTAxLTEyIDIx
OjU3OjQwLjI3OTQ0MDY2NCArMDgwMAo+Pj4+ICDCoMKgwqDCoCArKysgL3NoYXJlL2dpdC9mc3Rl
c3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQgMjAyNi0wNC0xNwo+Pj4+IDEyOjA4OjI4
LjAwMDAwMDAwMCArMDgwMAo+Pj4+ICDCoMKgwqDCoCBAQCAtMSwyICsxLDYgQEAKPj4+PiAgwqDC
oMKgwqDCoCBRQSBvdXRwdXQgY3JlYXRlZCBieSA0NzUKPj4+PiAgwqDCoMKgwqDCoCBTaWxlbmNl
IGlzIGdvbGRlbi4KPj4+PiAgwqDCoMKgwqAgK21vdW50OiAvbW50L3NjcmF0Y2hfZjJmczogbW91
bnQgc3lzdGVtIGNhbGwgZmFpbGVkOiBTdHJ1Y3R1cmUKPj4+PiBuZWVkcwo+Pj4+IGNsZWFuaW5n
Lgo+Pj4+ICDCoMKgwqDCoCArwqDCoMKgwqDCoMKgIGRtZXNnKDEpIG1heSBoYXZlIG1vcmUgaW5m
b3JtYXRpb24gYWZ0ZXIgZmFpbGVkIG1vdW50Cj4+Pj4gc3lzdGVtCj4+Pj4gY2FsbC4KPj4+PiAg
wqDCoMKgwqAgK21vdW50IGZhaWxlZAo+Pj4+ICDCoMKgwqDCoCArKHNlZSAvc2hhcmUvZ2l0L2Zz
dGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy80NzUuZnVsbCBmb3IgZGV0YWlscykKPj4+PiAgwqDCoMKg
wqAgLi4uCj4+Pj4gIMKgwqDCoMKgIChSdW4gJ2RpZmYgLXUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Rl
c3RzL2dlbmVyaWMvNDc1Lm91dCAvc2hhcmUvZ2l0Lwo+Pj4+IGZzdGVzdHMvcmVzdWx0cy8vZ2Vu
ZXJpYy80NzUub3V0LmJhZCfCoCB0byBzZWUgdGhlIGVudGlyZSBkaWZmKQo+Pj4+Cj4+Pj4KPj4+
PiAgwqDCoMKgwqAgZ2VuZXJpYy8zODjCoCA3M3MgLi4uIFtmYWlsZWQsIGV4aXQgc3RhdHVzIDFd
LSBvdXRwdXQgbWlzbWF0Y2gKPj4+PiAoc2VlIC8KPj4+PiBzaGFyZS9naXQvZnN0ZXN0cy9yZXN1
bHRzLy9nZW5lcmljLzM4OC5vdXQuYmFkKQo+Pj4+ICDCoMKgwqDCoCAtLS0gdGVzdHMvZ2VuZXJp
Yy8zODgub3V0wqDCoCAyMDI1LTAxLTEyIDIxOjU3OjQwLjI3NTQ0MDYwMiArMDgwMAo+Pj4+ICDC
oMKgwqDCoCArKysgL3NoYXJlL2dpdC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvMzg4Lm91dC5i
YWQgMjAyNi0wNC0xNwo+Pj4+IDExOjU4OjA1LjAwMDAwMDAwMCArMDgwMAo+Pj4+ICDCoMKgwqDC
oCBAQCAtMSwyICsxLDYgQEAKPj4+PiAgwqDCoMKgwqDCoCBRQSBvdXRwdXQgY3JlYXRlZCBieSAz
ODgKPj4+PiAgwqDCoMKgwqDCoCBTaWxlbmNlIGlzIGdvbGRlbi4KPj4+PiAgwqDCoMKgwqAgK21v
dW50OiAvbW50L3NjcmF0Y2hfZjJmczogbW91bnQgc3lzdGVtIGNhbGwgZmFpbGVkOiBTdHJ1Y3R1
cmUKPj4+PiBuZWVkcwo+Pj4+IGNsZWFuaW5nLgo+Pj4+ICDCoMKgwqDCoCArwqDCoMKgwqDCoMKg
IGRtZXNnKDEpIG1heSBoYXZlIG1vcmUgaW5mb3JtYXRpb24gYWZ0ZXIgZmFpbGVkIG1vdW50Cj4+
Pj4gc3lzdGVtCj4+Pj4gY2FsbC4KPj4+PiAgwqDCoMKgwqAgK2N5Y2xlIG1vdW50IGZhaWxlZAo+
Pj4+ICDCoMKgwqDCoCArKHNlZSAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8z
ODguZnVsbCBmb3IgZGV0YWlscykKPj4+PiAgwqDCoMKgwqAgLi4uCj4+Pj4gIMKgwqDCoMKgIChS
dW4gJ2RpZmYgLXUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Rlc3RzL2dlbmVyaWMvMzg4Lm91dCAvc2hh
cmUvZ2l0Lwo+Pj4+IGZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCfCoCB0byBz
ZWUgdGhlIGVudGlyZSBkaWZmKQo+Pj4+Cj4+Pj4KPj4+PiAgwqDCoMKgwqAgRjJGUy1mcyAoZG0t
MCk6IHNhbml0eV9jaGVja19leHRlbnRfY2FjaGU6IGlub2RlIChpbm89MTc2MSkgZXh0ZW50Cj4+
Pj4gaW5mbyBbMjIwMDU3LCA1NywgNl0gaXMgaW5jb3JyZWN0LCBydW4gZnNjayB0byBmaXgKPj4+
Pgo+Pj4+IEkgc3VzcGVjdCB3ZSBtYXkgbWlzcyBhbnkgZXh0ZW50IHVwZGF0ZXMgYWZ0ZXIgd2Ug
c2V0IEZJX05PX0VYVEVOVCBpbgo+Pj4+IF9fZGVzdHJveV9leHRlbnRfbm9kZSgpLCByZXN1bHQg
aW4gZmFpbGluZyBpbgo+Pj4+IHNhbml0eV9jaGVja19leHRlbnRfY2FjaGUoKS4KPj4+Pgo+Pj4+
IENhbiB3ZSBqdXN0IHJlbG9jYXRlIGYyZnNfYnVnX29uKG5vZGVfY250KSByYXRoZXIgdGhhbiBj
b21wbGljYXRlZAo+Pj4+IGNoYW5nZT8KPj4+PiBUaG91Z2h0cz8KPj4+Cj4+PiBPaCwgSSBvdmVy
bG9va2VkIGxhcmdlc3QgZXh0ZW50LiBIb3cgYWJvdXQgcmVsb2NhdGUKPj4+IGYyZnNfYnVnX29u
KG5vZGVfY250KSB0byBfX2Rlc3Ryb3lfZXh0ZW50X3RyZWU/Cj4+Pgo+Pj4gc3RhdGljIHZvaWQg
X19kZXN0cm95X2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGVudW0gZXh0ZW50X3R5
cGUKPj4+IHR5cGUpCj4+Pgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgLyogZnJlZSBhbGwgZXh0ZW50
IGluZm8gYmVsb25nIHRvIHRoaXMgZXh0ZW50IHRyZWUgKi8KPj4+ICDCoMKgwqDCoMKgwqDCoMKg
IG5vZGVfY250ID0gX19kZXN0cm95X2V4dGVudF9ub2RlKGlub2RlLCB0eXBlKTsKPj4+ICvCoMKg
wqDCoMKgwqAgZjJmc19idWdfb24oc2JpLCBhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSk7Cj4+
Cj4+ICAgwqDCoMKgwqAvKiBmcmVlIGFsbCBleHRlbnQgaW5mbyBiZWxvbmcgdG8gdGhpcyBleHRl
bnQgdHJlZSAqLwo+PiAgIMKgwqDCoMKgbm9kZV9jbnQgPSBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUo
aW5vZGUsIHR5cGUpOwo+Pgo+PiAgIMKgwqDCoMKgLyogZGVsZXRlIGV4dGVudCB0cmVlIGVudHJ5
IGluIHJhZGl4IHRyZWUgKi8KPj4gICDCoMKgwqDCoG11dGV4X2xvY2soJmV0aS0+ZXh0ZW50X3Ry
ZWVfbG9jayk7Cj4+ICAgwqDCoMKgwqBmMmZzX2J1Z19vbihzYmksIGF0b21pY19yZWFkKCZldC0+
bm9kZV9jbnQpKTvCoCA8LS0tCj4+Cj4+IE9oLCBpdCBoYXMgYWxyZWFkeSBjaGVja2VkIG5vZGVf
Y250LCBzbywgbWF5YmUgd2UgY2FuIGp1c3QgcmVtb3ZlIHRoZQo+PiBjaGVjayBpbgo+PiBfX2Rl
c3Ryb3lfZXh0ZW50X25vZGUoKT8KPiAKPiBZZXMuIEJUVywgaXMgaXQgY29ycmVjdCB0byByZW1v
dmUgdGhlIGNhbGwgdG8gZjJmc19kZXN0cm95X2V4dGVudF9ub2RlKCkKPiBpbiBmMmZzX2Ryb3Bf
aW5vZGUoKT8gSXQgc2VlbXMgdGhpcyBjYWxsIGlzIHVubmVjZXNzYXJ5LCBzaW5jZQo+IGYyZnNf
ZXZpY3RfaW5vZGUoKSB3aWxsIGV2ZW50dWFsbHkgZGVsZXRlIGFsbCBleHRlbnQgbm9kZXMgcHJv
cGVybHkuCgpJIHRoaW5rIGl0J3MgZmluZSB0byBrZWVwIGl0IGFjY29yZGluZyB0byBvcmlnaW5h
bCBpbnRlbnRpb24gImRlc3Ryb3kKZXh0ZW50X3RyZWUgZm9yIHRoZSB0cnVuY2F0aW9uIGNhc2Ui
IGludHJvZHVjZWQgZnJvbSAzZTcyZjcyMTM5MGQKKCJmMmZzOiB1c2UgZXh0ZW50X2NhY2hlIGJ5
IGRlZmF1bHQiKS4gSXQgaGVscHMgdGhlIHBlcmZvcm1hbmNlIHcvCmluIGJhdGNoIGV4dGVudCBu
b2RlIHJlbGVhc2UuCgpUaGFua3MsCgo+IAo+IFRoYW5rcwo+IFlvbmdwZW5nLAo+IAo+Pgo+PiBU
aGFua3MsCj4+Cj4+Cj4+Pgo+Pj4gVGhhbmtzCj4+PiBZb25ncGVuZywKPj4+Cj4+Pj4KPj4+PiBU
aGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gRml4ZXM6IDNmYzVkNWExODJmNiAoImYyZnM6IGZpeCB0
byBzaHJpbmsgcmVhZCBleHRlbnQgbm9kZSBpbiBiYXRjaGVzIikKPj4+Pj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgwqDCoCBmcy9mMmZzL2V4dGVudF9j
YWNoZS5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KPj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+PiBp
bmRleCAwZWQ4NGNjMDY1YTcuLjg3MTY5ZmQyOWQ4OSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJm
cy9leHRlbnRfY2FjaGUuYwo+Pj4+PiArKysgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+
IEBAIC0xMTksOSArMTE5LDEwIEBAIHN0YXRpYyBib29sIF9fbWF5X2V4dGVudF90cmVlKHN0cnVj
dCBpbm9kZQo+Pj4+PiAqaW5vZGUsIGVudW0gZXh0ZW50X3R5cGUgdHlwZSkKPj4+Pj4gIMKgwqDC
oMKgwqDCoCBpZiAoIV9faW5pdF9tYXlfZXh0ZW50X3RyZWUoaW5vZGUsIHR5cGUpKQo+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+PiAgwqDCoCArwqDCoMKgIGlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4gKwo+Pj4+PiAgwqDCoMKgwqDCoMKgIGlmICh0eXBl
ID09IEVYX1JFQUQpIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3Nl
dChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGZhbHNlOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdf
c2V0KGlub2RlLCBGSV9DT01QUkVTU0VEX0ZJTEUpICYmCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhZjJmc19zYl9oYXNfcmVhZG9ubHkoRjJGU19JX1NCKGlu
b2RlKSkpCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsK
Pj4+Pj4gQEAgLTY0NCw2ICs2NDUsOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fZGVzdHJveV9l
eHRlbnRfbm9kZShzdHJ1Y3QKPj4+Pj4gaW5vZGUgKmlub2RlLAo+Pj4+PiAgwqDCoCDCoMKgwqDC
oMKgIHdoaWxlIChhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSkgewo+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKCFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7Cj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub2RlX2NudCArPSBfX2ZyZWVfZXh0ZW50X3RyZWUo
c2JpLCBldCwgbnJfc2hyaW5rKTsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3Vu
bG9jaygmZXQtPmxvY2spOwo+Pj4+PiAgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gQEAgLTY4OCwxMiAr
NjkxLDEyIEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdAo+
Pj4+PiBpbm9kZSAqaW5vZGUsCj4+Pj4+ICDCoMKgIMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQt
PmxvY2spOwo+Pj4+PiAgwqDCoCAtwqDCoMKgIGlmICh0eXBlID09IEVYX1JFQUQpIHsKPj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5U
KSkgewo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJmV0LT5sb2Nr
KTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgfQo+Pj4+PiArwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9f
RVhURU5UKSkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiAgwqDC
oCArwqDCoMKgIGlmICh0eXBlID09IEVYX1JFQUQpIHsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHByZXYgPSBldC0+bGFyZ2VzdDsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5s
ZW4gPSAwOwo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Cj4+
Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
