Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5PDKOsSFOGrddAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 02:45:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3346ABDE9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 02:45:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=MUmIa8pq;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=UChR3pO6;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hKGb0DwM;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=b8KtE5xo;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0i34ypJ0cWLQNcdNzHoz8LA5S1wMkrdg0XXAJLMB7o=; b=MUmIa8pqrDei0ajzm9xfyYSLdp
	RDVokuPJa8PPjeRw1lpGqdQ2A0G6Ukrka2/J4De5oHf0G4WEcSE2BBQ1g/pBiUT1BfgfWfSuASzqi
	+ESMkeTAPleFjE4/pOA+BiTdhmmtGP3E4LgdhR1H+BxiVJ+REsgUeOCzS9KZ8G+zAM3U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbSnO-0005mV-B3;
	Mon, 22 Jun 2026 00:45:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbSnN-0005mN-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 00:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SMKjncjir7r8cfs3mgF7MY4Ybv2WrsNKWnAzW3gkxiA=; b=UChR3pO6TGHkiA2besz6JMg6p/
 73fNfLl0LyWzbc6Czdc647I54w6oqdet2uctHVOvdD25xtBEM3w1BFw9jwQzG9ZsO2BmkYyL9Uo8s
 iN5IFvKFjtQUkEtkOwlnlzgu9KuXCYl99qkZftmA7L5/5WIBpjlZuXIWv+MnwI92SoTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SMKjncjir7r8cfs3mgF7MY4Ybv2WrsNKWnAzW3gkxiA=; b=hKGb0DwMWFHxnh+/S3wVlW/RKB
 8EDoJIzeB183QdKSpgMW9TaS+xyn7JL77AQawXengPKON7LTT7lwzaYnpjWx7ebzPkDFMkYH8ck/s
 AZnDwM734BYR6uJKYoudLXEUVHY3oHlD03fletpKIgByMQb7lS0Hc155nHVEDtqTXQ10=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbSnL-0000ml-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 00:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 11D49401CD;
 Mon, 22 Jun 2026 00:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DC81F000E9;
 Mon, 22 Jun 2026 00:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782089138;
 bh=SMKjncjir7r8cfs3mgF7MY4Ybv2WrsNKWnAzW3gkxiA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=b8KtE5xox4L5rlYpgpWw//O/mR4IK2dVjfA7/fqK4QEGWbSspDErfIgTsoMSG7cV4
 b2uKnAt0S+zDBDWQD9060fuKKqBNaLtLZKzgUcvfRIV/mjaZhVJZ9qak2rhZRAFsj/
 ouKR8uoJqTHTuaXbXnIGbgZm9LjV8wt5kCwk0BuRBKZSXsvbBK1JQ0Z5XcvraI4DLu
 qTS8COUgCEHAPIs9Ui6Lt6NTTSgpgs7LY3V1pncGDPGXjdeTP6OTgerZJwKGsRW2rH
 QFgJzFoxI1u5fr6JEv+3kGJ2DokbRDAuc3Tp0Fr3N8PUh0lIjLYRZFsC4NfkNEfwYe
 TD+GjFyl4MWQg==
Message-ID: <7cad39b2-b822-4c0a-81c0-03e37b8334ef@kernel.org>
Date: Mon, 22 Jun 2026 08:45:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
 <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
 <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <462ef62b-d83c-463f-8f44-4843ac179c2f@kernel.org>
 <SEZPR02MB56622CEC6B0C1B8E320262DE99E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB56622CEC6B0C1B8E320262DE99E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/22/26 00:07, Yongpeng Yang wrote: > > On 6/20/26 2:15
 PM, Chao Yu via Linux-f2fs-devel wrote: >> On 6/19/26 22:38, Yongpeng Yang
 wrote: >>> >>> On 6/15/26 8:05 PM, Chao Yu via Linux-f2fs-devel wr [...] 
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
X-Headers-End: 1wbSnL-0000ml-TJ
Subject: Re: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent
 instead of dropping it entirely on overlap
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C3346ABDE9

T24gNi8yMi8yNiAwMDowNywgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA2LzIwLzI2IDI6
MTUgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDYvMTkvMjYg
MjI6MzgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pgo+Pj4gT24gNi8xNS8yNiA4OjA1IFBNLCBD
aGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IE9uIDYvMTIvMjYgMTk6NTgs
IFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25n
cGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pgo+Pj4+PiBQcmV2aW91c2x5LCB3aGVuIGFuIGV4dGVudCBi
ZWluZyBpbnNlcnRlZCBvdmVybGFwcyB3aXRoIHRoZSBsYXJnZXN0Cj4+Pj4+IGV4dGVudCwgdGhl
IGxhcmdlc3QgZXh0ZW50IGlzIGRyb3BwZWQgZW50aXJlbHkuIFRoaXMgd2FzIGRvbmUgdG8gaGFu
ZGxlCj4+Pj4KPj4+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3NlZCBhbnl0aGluZywgSSBy
ZW1lbWJlciB0aGF0IHdlIHdpbGwgYWRkIGxhcmdlc3QKPj4+PiBleHRlbnQgaW4gYmVsb3cgcGF0
aD8KPj4+Pgo+Pj4+IC0gX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UKPj4+PiDCoCAtIF9faW5z
ZXJ0X2V4dGVudF90cmVlCj4+Pj4gwqDCoCAtIF9fdHJ5X3VwZGF0ZV9sYXJnZXN0X2V4dGVudCA6
IHVwZGF0ZSBsYXJnZXN0IHcvIHJpZ2h0IGV4dGVudAo+Pj4+IMKgIC0gX190cnlfdXBkYXRlX2xh
cmdlc3RfZXh0ZW50IDogdXBkYXRlIGxhcmdlc3Qgdy8gbGVmdCBleHRlbnQKPj4+Cj4+PiBUaGUg
bGFyZ2VzdCBleHRlbnQgbWlnaHQgbm90IHJlc2lkZSBpbiB0aGUgZXh0ZW50IHRyZWUuIElmCj4+
PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSBpbnZva2VzIF9fZHJvcF9sYXJnZXN0X2V4dGVu
dCwgdGhlIGxlbmd0aCBvZgo+Pgo+PiBJIG1lYW50IF9fdXBkYXRlX2V4dGVudF90cmVlX3Jhbmdl
IGludm9rZXMgX19kcm9wX2xhcmdlc3RfZXh0ZW50IHRvIGRyb3AKPj4gbGFyZ2VzdCBmaXJzdCwg
YW5kIHRoZW4sIGl0IHRyaWVzIHRvIHVwZGF0ZSBsYXJnZXN0IGV4dGVudCB3LyBsYXJnZXItc2l6
ZQo+PiBvbmUgb2Ygc2VwYXJhdGVkIHR3byBleHRlbnRzLgo+Pgo+Pj4gdGhlIGxhcmdlc3QgZXh0
ZW50IHdpbGwgaGF2ZSBiZWVuIHNldCB0byB6ZXJvLiBBcyBhIHJlc3VsdCwgdGhlIGxhcmdlc3QK
Pj4+IGV4dGVudCB1cGRhdGVkIGluc2lkZSBfX3RyeV91cGRhdGVfbGFyZ2VzdF9leHRlbnQgY2Fu
IGVuZCB1cCBzbWFsbGVyCj4+PiB0aGFuIHRoZSBsYXJnZXN0IGV4dGVudCBvYnRhaW5lZCBhZnRl
ciBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50IGNvbXBsZXRlcwo+Pj4gaXRzIHB1bmNoIG9wZXJhdGlv
bi4KPj4KPj4gSSBkaWRuJ3QgZ2V0IGl0LCBjYW4geW91IGdpdmUgYW4gZXhhbXBsZSBmb3IgdGhp
cz8KPiAKPiBUaGUgb25seSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHB1bmNoIGFuZCBkcm9wIGFyaXNl
cyB3aGVuIHRoZSBsYXJnZXN0Cj4gZXh0ZW50IGlzIG5vdCBwcmVzZW50IGluIHRoZSBleHRlbnQg
dHJlZS4KPiAKPiBCZWZvcmUgdGhpcyBwYXRjaChleHRlbnQgZm9ybWF0IFtmb2ZzLCBsZW4sIGJs
a10pCj4gMS4gaW5pdGFsIHN0YXRlCj4gIMKgwqDCoCBsYXJnZXN0IGV4dGVudDogWzAsIDEwMjQs
IDEwXSwgZXh0ZW50IHRyZWU6IGVtcHR5CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXl5eXl4KCkl0J3Mgbm90IGVtcHR5IHcvbyBwYXRjaCAyLzUu
CgpUaGFua3MsCgo+IDIuIGluc2VydCBbNTExLCAxLCAxMDAwMF0KPiAgwqDCoMKgIGxhcmdlc3Qg
ZXh0ZW50OiBbNTExLCAxLCAxMDAwMF0sIGV4dGVudCB0cmVlOiBbNTExLCAxLCAxMDAwMF0KPiAK
PiBBZnRlciB0aGlzIHBhdGNoOgo+IDEuIGluaXRhbCBzdGF0ZQo+ICDCoMKgwqAgbGFyZ2VzdCBl
eHRlbnQ6IFswLCAxMDI0LCAxMF0sIGV4dGVudCB0cmVlOiBlbXB0eQo+IDIuIGluc2VydCBbNTEx
LCAxLCAxMDAwMF0KPiAgwqDCoMKgIGxhcmdlc3QgZXh0ZW50OiBbNTEyLCA1MTIsIDUyMl0sIGV4
dGVudCB0cmVlOiBbNTExLCAxLCAxMDAwMF0KPiAKPiBUaGFua3MKPiBZb25ncGVuZywKPiAKPj4K
Pj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRoYW5rcwo+Pj4gWW9uZ3BlbmcsCj4+Pgo+Pj4+Cj4+Pj4g
VGhhbmtzLAo+Pj4+Cj4+Pj4+IHRoZSBjYXNlIHdoZXJlIHRoZSBsYXJnZXN0IGV4dGVudCBpcyBu
b3QgaW4gbWVtb3J5LCBhdm9pZGluZwo+Pj4+PiBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhlIGxh
cmdlc3QgZXh0ZW50IGFuZCB0aGUgZXh0ZW50IHRyZWUuCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2gg
Y2hhbmdlcyB0aGUgc2VtYW50aWNzIG9mIF9fZHJvcF9sYXJnZXN0X2V4dGVudCAocmVuYW1lZCB0
bwo+Pj4+PiBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50KTogaW5zdGVhZCBvZiBkaXNjYXJkaW5nIHRo
ZSBlbnRpcmUgbGFyZ2VzdAo+Pj4+PiBleHRlbnQgd2hlbiBhbnkgb3ZlcmxhcCBpcyBkZXRlY3Rl
ZCwga2VlcCB0aGUgbGFyZ2VyIHJlbWFpbmluZyBwb3J0aW9uCj4+Pj4+IChsZWZ0IG9yIHJpZ2h0
KSBhZnRlciB0aGUgcHVuY2guIFRoaXMgcHJlc2VydmVzIGV4dGVudCBjYWNoZSBjb3ZlcmFnZQo+
Pj4+PiBmb3IgdHJ1bmNhdGUgYW5kIG92ZXJ3cml0ZSBvcGVyYXRpb25zIHRoYXQgb25seSBwYXJ0
aWFsbHkgb3ZlcmxhcCB0aGUKPj4+Pj4gbGFyZ2VzdCBleHRlbnQuCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+PiAt
LS0KPj4+Pj4gwqAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDMxICsrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4dGVudF9j
YWNoZS5jIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+PiBpbmRleCBmOGQ5NGRiNjBkYzYu
LjgyZDg0YzRlOThiMiAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+
Pj4+PiArKysgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+IEBAIC0zOTcsMTQgKzM5Nywz
MSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fZnJlZV9leHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIGNvdW50Owo+Pj4+PiDCoCB9Cj4+
Pj4+IC1zdGF0aWMgdm9pZCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoc3RydWN0IGV4dGVudF90cmVl
ICpldCwKPj4+Pj4gK3N0YXRpYyB2b2lkIF9fcHVuY2hfbGFyZ2VzdF9leHRlbnQoc3RydWN0IGV4
dGVudF90cmVlICpldCwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBnb2ZmX3QgZm9mcywgdW5zaWduZWQgaW50IGxlbikKPj4+Pj4gwqAgewo+Pj4+PiAt
wqDCoMKgIGlmIChmb2ZzIDwgKHBnb2ZmX3QpZXQtPmxhcmdlc3QuZm9mcyArIGV0LT5sYXJnZXN0
LmxlbiAmJgo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2ZzICsgbGVuID4gZXQtPmxh
cmdlc3QuZm9mcykgewo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gMDsK
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0X3VwZGF0ZWQgPSB0cnVlOwo+Pj4+PiAr
wqDCoMKgIHVuc2lnbmVkIGludCBsYXJnZXN0X2VuZCwgcHVuY2hfZW5kOwo+Pj4+PiArwqDCoMKg
IHVuc2lnbmVkIGludCBsZWZ0X2xlbiwgcmlnaHRfbGVuOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAg
aWYgKGZvZnMgPj0gKHBnb2ZmX3QpZXQtPmxhcmdlc3QuZm9mcyArIGV0LT5sYXJnZXN0LmxlbiB8
fAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2ZzICsgbGVuIDw9IGV0LT5sYXJnZXN0
LmZvZnMpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDC
oCAvKiBQdW5jaCBbZm9mcywgZm9mcyArIGxlbikgZnJvbSBsYXJnZXN0IGV4dGVudC4gKi8KPj4+
Pj4gK8KgwqDCoCBsYXJnZXN0X2VuZCA9IGV0LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5s
ZW47Cj4+Pj4+ICvCoMKgwqAgcHVuY2hfZW5kID0gZm9mcyArIGxlbjsKPj4+Pj4gKwo+Pj4+PiAr
wqDCoMKgIGxlZnRfbGVuID0gZm9mcyA+IGV0LT5sYXJnZXN0LmZvZnMgPyBmb2ZzIC0gZXQtPmxh
cmdlc3QuZm9mcyA6IDA7Cj4+Pj4+ICvCoMKgwqAgcmlnaHRfbGVuID0gbGFyZ2VzdF9lbmQgPiBw
dW5jaF9lbmQgPyBsYXJnZXN0X2VuZCAtIHB1bmNoX2VuZCA6IDA7Cj4+Pj4+ICsKPj4+Pj4gK8Kg
wqDCoCBpZiAobGVmdF9sZW4gPj0gcmlnaHRfbGVuKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBl
dC0+bGFyZ2VzdC5sZW4gPSBsZWZ0X2xlbjsKPj4+Pj4gK8KgwqDCoCB9IGVsc2Ugewo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QuYmxrICs9IHB1bmNoX2VuZCAtIGV0LT5sYXJnZXN0
LmZvZnM7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdC5mb2ZzID0gcHVuY2hfZW5k
Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gcmlnaHRfbGVuOwo+Pj4+
PiDCoMKgwqDCoMKgIH0KPj4+Pj4gK8KgwqDCoCBldC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1ZTsK
Pj4+Pj4gwqAgfQo+Pj4+PiDCoCB2b2lkIGYyZnNfaW5pdF9yZWFkX2V4dGVudF90cmVlKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmb2xpbyAqaWZvbGlvKQo+Pj4+PiBAQCAtNjgwLDEwICs2
OTcsMTAgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uoc3RydWN0IGlu
b2RlICppbm9kZSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5sZW4gPSAwOwo+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBkcm9wIGxhcmdl
c3QgZXh0ZW50IGJlZm9yZSBsb29rdXAsIGluIGNhc2UgaXQncyBhbHJlYWR5Cj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogcHVuY2ggbGFyZ2VzdCBleHRlbnQgYmVmb3JlIGxvb2t1cCwgaW4gY2Fz
ZSBpdCdzIGFscmVhZHkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBiZWVuIHNocnVuayBm
cm9tIGV4dGVudCB0cmVlCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoZXQsIGZvZnMsIGxlbik7Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50KGV0LCBmb2ZzLCBsZW4pOwo+Pj4+
PiDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoMKgwqDCoCBpZiAoZXQtPmxhcmdlc3QubGVuICE9IDAg
JiYKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+PiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pgo+Pgo+Pgo+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
