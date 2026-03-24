Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAOeItdMwmnvbAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 09:35:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3C304B91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 09:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYp7BxgYOP9iP6bHoMJOZbbC45GocedtTA8/eYcyl8A=; b=X2kiIMnZKT8FgKyuYHvcYmQoIp
	ib5iOujxeLIN3HtGOJz42onbBJ2i8E8OHOSYTqN9g6tuUy96nVlFf9Djv+rgP/3uimZ58BWbaj2pA
	E5VfrsOhnAAgsbFC/UpyOK07hIHyBh/pnciGplPDCSJvUZ1FuOCgxsn4ZzKHx7xPawHs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4xEO-0000ma-9u;
	Tue, 24 Mar 2026 08:35:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4xEH-0000mN-0D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 08:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0EgIly6LY6+xHG2VKkkrMn+aSxHEB24IMVl1Hj0CFyw=; b=NqWR6Om2kCgd4l6ozLmoPH4Bub
 pMiWSBz2Mxol/SEM60w+ywY2E0b2LCigYB1jp4wWBjihM7mXrc9IgnAmXdam2+IELT7X4bORE6mjs
 y964k6vYYATDS+SNyW3PofGzWDVSDMir0jCC15KGZaqXwP+JDoyqHOJw9XjKQt7E/604=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0EgIly6LY6+xHG2VKkkrMn+aSxHEB24IMVl1Hj0CFyw=; b=Dx6mic4UYmk2kxz/P2xrhKNeoL
 ns/OZY1s+aGufmy/10cS4TdJotjxog0Y54Q29j2gaPVvzOoDT6oyyFgCqyJ5zi4iLha+CUOWkUdP3
 G5L1MM1wPclo9+oxKnIp30lBrI8JalhiUkOFKA3PJRmOapG0mw0wcbhq01en4ORILvyY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4xEG-0002ED-Fh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 08:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C02C960120;
 Tue, 24 Mar 2026 08:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8283C19424;
 Tue, 24 Mar 2026 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774341301;
 bh=Vg8/MFukcBDfmDnkyr+bJMxC7k9o5AIySo8ia/puEro=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=R/Q7D26uJWu1ukBum0+veWEjqhnQXdNabVEZtUu5WF8lvbgaxEjpr1WgWMteUiVaB
 7mKlApxO5tCwOSKoDng2naA3Hl3wwr9OrSQln0381UPnbMiuSKA/t1sB8MhaanHsOS
 OrhuuwNbL1nFu6r+UguXWGEu0sJWo90TYxzabhYT/pThs4+mCPkpTokY82vfIaKIr8
 j/YFpVGTIjtfgZkUnET/eb6plS8na/9c2AFkgfxcPtgdjhQG0tZJ6UV+QnUqVskxFc
 HREbZJBhOab4GGOQv0YiX91KGbIjd+Yn4+137xEaFiQFbifaoW+iiu61CK863A1LvX
 lTXwxBqYq70Yg==
Message-ID: <95c41d72-0bcf-46d3-883b-793265cfd8cc@kernel.org>
Date: Tue, 24 Mar 2026 16:34:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
 <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
 <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
 <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
 <3565eb34-944e-44a1-b349-ae54b9745051@sina.com>
 <f4039e35-b84f-4ec8-b9a3-70fcdd9277b2@kernel.org>
 <eb60f2ef-2c74-4c9d-9547-323042be5233@sina.com>
Content-Language: en-US
In-Reply-To: <eb60f2ef-2c74-4c9d-9547-323042be5233@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/13/26 17:42, Yongpeng Yang wrote: > > On 3/13/26 15:19, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 3/12/2026 7:34 PM, Yongpeng Yang
 wrote: >>> >>> On 3/12/26 18:49, Chao Yu via Linux-f2fs-devel wr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4xEG-0002ED-Fh
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: C3B3C304B91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xMy8yNiAxNzo0MiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiAzLzEzLzI2IDE1
OjE5LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAzLzEyLzIwMjYg
NzozNCBQTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Cj4+PiBPbiAzLzEyLzI2IDE4OjQ5LCBD
aGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IE9uIDIwMjYvMy8xMiAxODo0
MSwgQ2hhbyBZdSB3cm90ZToKPj4+Pj4gT24gMjAyNi8zLzEyIDExOjU2LCBZb25ncGVuZyBZYW5n
IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IE9uIDMvMTIvMjYgMDg6NDksIENoYW8gWXUgdmlhIExpbnV4
LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4+Pj4gT24gMjAyNi8yLzE2IDE5OjI3LCBZb25ncGVuZyBZ
YW5nIHdyb3RlOgo+Pj4+Pj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlh
b21pLmNvbT4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gTmVpdGhlciBGMkZTIG5vciBWRlMgaW52YWxpZGF0
ZXMgdGhlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlLCB3aGljaAo+Pj4+Pj4+PiByZXN1bHRzIGlu
IHJlYWRpbmcgc3RhbGUgbWV0YWRhdGEuIEFuIGV4YW1wbGUgc2NlbmFyaW8gaXMgc2hvd24KPj4+
Pj4+Pj4gYmVsb3c6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRlcm1pbmFsIEHCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFRlcm1pbmFsIEIKPj4+Pj4+Pj4gbW91bnQgL2Rldi92ZGIgL21u
dC9mMmZzCj4+Pj4+Pj4+IHRvdWNoIG14IC8vIGlubyA9IDQKPj4+Pj4+Pj4gc3luYwo+Pj4+Pj4+
PiBkdW1wLmYyZnMgLWkgNCAvZGV2L3ZkYi8vIGJsb2NrIG9uICJbWS9OXSIKPj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHRvdWNoIG14MiAvLyBpbm8gPSA1Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzeW5jCj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bW91
bnQgL21udC9mMmZzCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYiAvLyBibG9j
ayBhZGRyCj4+Pj4+Pj4+IGlzIDAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWZ0ZXIgdW1vdW50LCB0aGUg
YmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUgaXMgbm90IHB1cmdlZCwgY2F1c2luZwo+Pj4+Pj4+PiBg
ZHVtcC5mMmZzIC1pIDUgL2Rldi92ZGJgIHRvIHJlYWQgc3RhbGUgbWV0YWRhdGEgYW5kIHNlZSBp
bm9kZSA1Cj4+Pj4+Pj4+IHdpdGgKPj4+Pj4+Pj4gYmxvY2sgYWRkcmVzcyAwLgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBUaGlzIHBhdGNoIGNhbGxzIGludmFsaWRhdGVfYmRldiBkdXJpbmcgdW1vdW50IHRv
IGludmFsaWRhdGUgdGhlCj4+Pj4+Pj4+IGJsb2NrCj4+Pj4+Pj4+IGRldmljZSBwYWdlIGNhY2hl
LCBwcmV2ZW50aW5nIHN0YWxlIG1ldGFkYXRhIGZyb20gYmVpbmcgcmVhZC4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5j
b20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiDCoMKgwqAgZnMvZjJmcy9zdXBlci5jIHwgNiArKysr
KysKPj4+Pj4+Pj4gwqDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4+Pj4+
Pj4KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+Pj4+Pj4+PiBpbmRleCAxYTc1NTk5N2FmZjUuLjM5ZDNiNTJjZWFjMSAxMDA2NDQKPj4+Pj4+
Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+
Pj4+Pj4+PiBAQCAtMjA5MSw2ICsyMDkxLDEyIEBAIHN0YXRpYyB2b2lkIGYyZnNfcHV0X3N1cGVy
KHN0cnVjdAo+Pj4+Pj4+PiBzdXBlcl9ibG9jayAqc2IpCj4+Pj4+Pj4+IMKgwqDCoCAjaWYgSVNf
RU5BQkxFRChDT05GSUdfVU5JQ09ERSkKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdXRmOF91bmxv
YWQoc2ItPnNfZW5jb2RpbmcpOwo+Pj4+Pj4+PiDCoMKgwqAgI2VuZGlmCj4+Pj4+Pj4+ICvCoMKg
wqAgc3luY19ibG9ja2RldihzYi0+c19iZGV2KTsKPj4+Pj4+Pgo+Pj4+Pj4+IFdlIHdpbGwgY2Fs
bCBzeW5jX2Jsb2NrZGV2IGluIGJlbG93IHBhdGg/Cj4+Pj4+Pj4KPj4+Pj4+PiAtIGtpbGxfZjJm
c19zdXBlcgo+Pj4+Pj4+IMKgwqDCoC0ga2lsbF9ibG9ja19zdXBlcgo+Pj4+Pj4+IMKgwqDCoCAt
IGdlbmVyaWNfc2h1dGRvd25fc3VwZXIKPj4+Pj4+PiDCoMKgwqDCoCAtIHB1dF9zdXBlcgo+Pj4+
Pj4+IMKgwqDCoCAtIHN5bmNfYmxvY2tkZXYKPj4+Pj4+Pgo+Pj4+Pj4+IDE3MjEgdm9pZCBraWxs
X2Jsb2NrX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4+Pj4+Pj4gMTcyMiB7Cj4+Pj4+
Pj4gMTcyM8KgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiA9IHNiLT5z
X2JkZXY7Cj4+Pj4+Pj4gMTcyNAo+Pj4+Pj4+IDE3MjXCoMKgwqDCoMKgwqDCoMKgIGdlbmVyaWNf
c2h1dGRvd25fc3VwZXIoc2IpOwo+Pj4+Pj4+IDE3MjbCoMKgwqDCoMKgwqDCoMKgIGlmIChiZGV2
KSB7Cj4+Pj4+Pj4gMTcyN8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN5bmNfYmxv
Y2tkZXYoYmRldik7Cj4+Pj4+Pj4gMTcyOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJkZXZfZnB1dChzYi0+c19iZGV2X2ZpbGUpOwo+Pj4+Pj4+IDE3MjnCoMKgwqDCoMKgwqDCoMKg
IH0KPj4+Pj4+PiAxNzMwIH0KPj4+Pj4+Pgo+Pj4+Pj4+PiArwqDCoMKgIGludmFsaWRhdGVfYmRl
dihzYi0+c19iZGV2KTsKPj4+Pj4+Cj4+Pj4+PiBUaGlzIHdvcmtzIGZvciBhbiBmMmZzIGluc3Rh
bmNlIG1vdW50ZWQgb24gYSBzaW5nbGUgZGV2aWNlLCBidXQgaXQKPj4+Pj4+IGRvZXMKPj4+Pj4+
IG5vdCB3b3JrIGZvciBtdWx0aS1kZXZpY2UgY29uZmlndXJhdGlvbnMsIGJlY2F1c2UgdGhlIHZm
cyBjYW5ub3QgYmUKPj4+Pj4+IGF3YXJlIG9mIEZERVYoMSkuCj4+Pj4+Cj4+Pj4+IFllYWgsIEkg
bWVhbnQgd2UgY2FuIGF2b2lkIGR1cGxpY2F0ZWQgc3luY19ibG9ja2RldigpIGZvciBtYWluCj4+
Pj4+IGRldmljZSBpbgo+Pj4+PiBmMmZzX3B1dF9zdXBlcigpLgo+Pj4+Pgo+Pj4KPj4+IFRoZSBj
YWxsIHRyYWNlIGNvcnJlc3BvbmRpbmcgdG8gdGhpcyBwYXRjaCBpcyBhcyBmb2xsb3dzOgo+Pj4K
Pj4+IGtpbGxfYmxvY2tfc3VwZXIKPj4+IMKgIC0gZ2VuZXJpY19zaHV0ZG93bl9zdXBlcgo+Pj4g
wqDCoCAtIGYyZnNfcHV0X3N1cGVyCj4+PiDCoMKgwqAgLSBzeW5jX2Jsb2NrZGV2Cj4+PiDCoMKg
wqAgLSBpbnZhbGlkYXRlX2JkZXYKPj4+IMKgIC0gc3luY19ibG9ja2Rldgo+Pj4KPj4+IFRoZXJl
IGlzIGluZGVlZCBhIGR1cGxpY2F0ZWQgY2FsbCB0byBzeW5jX2Jsb2NrZGV2KCkuIEhvd2V2ZXIs
IHNpbmNlIGFsbAo+Pj4gZGF0YSBtdXN0IGJlIHdyaXR0ZW4gdG8gZGlzayBiZWZvcmUgaW52YWxp
ZGF0ZV9iZGV2KCkgaXMgY2FsbGVkLAo+Pj4gZjJmc19wdXRfc3VwZXIoKSBtdXN0IGNhbGwgc3lu
Y19ibG9ja2RldigpLiBCZWNhdXNlIGludmFsaWRhdGVfYmRldigpCj4+PiBoYXMgYWxyZWFkeSBj
bGVhcmVkIHRoZSBwYWdlIGNhY2hlLCB0aGUgc2Vjb25kIGNhbGwgdG8gc3luY19ibG9ja2Rldigp
Cj4+PiDCoCBkb2VzIG5vdGhpbmcuCj4+Pgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgZ3Vlc3Mg
d2UgY2FuIGxlYXZlIHRoZSBkZXZpY2Ugdy8gdXB0b2RhdGUgY2FjaGUsIGluIGNhc2UgaWYKPj4+
Pj4+PiB0aGVyZSBhcmUKPj4+Pj4+PiBtdWx0aXBsZSB1c2VyIG9uIHRoZSBkZXZpY2U/Cj4+Pj4+
Pgo+Pj4+Pj4gVGhlIHBhZ2UgY2FjaGUgb2YgdGhlIGJsb2NrIGRldmljZSBmaWxlIG1heSBjb250
YWluIGRhdGEgdGhhdCBpcyBub3QKPj4+Pj4+IHVwdG9kYXRlLiBGb3IgZXhhbXBsZSwgZGF0YSBt
YXkgZmlyc3QgYmUgcmVhZCBkaXJlY3RseSB0aHJvdWdoIHRoZQo+Pj4+Pj4gYmxvY2sKPj4+Pj4g
wqDCoD4gZGV2aWNlIGZpbGUsIGFuZCB0aGVuIHRoZSBzYW1lIGJsb2NrcyBtYXkgYmUgd3JpdHRl
biB0aHJvdWdoIGYyZnMuCj4+Pj4+IFNpbmNlPiBmMmZzIHdyaXRlcyB0byB0aGUgYmxvY2sgZGV2
aWNlIHZpYSB0aGUgc3VibWl0X2JpbyBwYXRoLCBpdAo+Pj4+PiBkb2VzIG5vdAo+Pj4+Pj4gdXBk
YXRlIHRoZSBwYWdlIGNhY2hlIG9mIHRoZSBibG9jayBkZXZpY2UgZmlsZS4gQXMgYSByZXN1bHQs
IHRoZQo+Pj4+Pj4gZGF0YSBpbgo+Pj4+Pj4gdGhlIGJsb2NrIGRldmljZSBmaWxl4oCZcyBwYWdl
IGNhY2hlIG1heSBiZWNvbWUgc3RhbGUuIFRoZXJlZm9yZSwgdGhlCj4+Pj4+PiBwYWdlCj4+Pj4+
PiBjYWNoZSBtdXN0IGJlIGludmFsaWRhdGVkIGR1cmluZyB1bm1vdW50Lgo+Pj4+Pgo+Pj4+PiBX
ZWxsLCBjYW4gd2UgY2FsbCBpb2N0bChmZCwgQkxLRkxTQlVGKSBmb3IgYWxsIGRldmljZXMgYmVs
b25nIHRvIGYyZnMKPj4+Pj4gaW1nIGxpa2UKPj4+Pj4geW91IGRpZCBpbiAoImYyZnMtdG9vbHM6
IGludmFsaWRhdGUgYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUgYmVmb3JlCj4+Pj4+IHJlYWRpbmcK
Pj4+Pj4gbWV0YWRhdGEiKSwgZG9lcyB0aGF0IGZpeCB0aGUgaXNzdWU/Cj4+Pj4KPj4+PiBPaCwg
eW91IGFscmVhZHkgY2FsbGVkIHRoZSBpb2N0bCBmb3IgYWxsIGRldmljZXMuIERvZXMgdGhhdCBm
aXggdGhlCj4+Pj4gaXNzdWU/Cj4+Pj4KPj4+Cj4+PiBZZXMsIHRoYXQgY2FuIGZpeCB0aGlzIGlz
c3VlLiBGcm9tIGEgc3lzdGVtIHJvYnVzdG5lc3MgcGVyc3BlY3RpdmUsIGJvdGgKPj4+IHRoZSBr
ZXJuZWwgYW5kIGYyZnMtdG9vbHMgc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSB1cHRvZGF0ZSBkYXRh
IGlzIHJlYWQuCj4+PiBUaGVyZWZvcmUsIEkgbWFkZSBjaGFuZ2VzIGluIGJvdGguCj4+Cj4+IFdl
bGwsIEkgdGhpbmsgaXQgd2lsbCBiZSBhIGxpdHRsZSBiaXQgb3ZlcnByb3RlY3RpdmUsIGJlY2F1
c2UgZjJmcyBrZXJuZWwKPj4gbW9kdWxlIGl0c2VsZiBkb2Vzbid0IHN1ZmZlciBhbnkgaXNzdWUs
IGFuZCBkdW1wLmYyZnMgYWxyZWFkeSBoYXMgaXRzCj4+IHdheSB0byBhdm9pZCBhY2Nlc3Npbmcg
c3RhbGUgZGF0YSB3LyB5b3VyIGNoYW5nZS4KPiAKPiBJIG92ZXJsb29rZWQgdGhlIHBlcm1pc3Np
b24gY2hlY2sgaW4gYmxrZGV2X2ZsdXNoYnVmLiBBZnRlciB1bm1vdW50LAo+IG5vbi1yb290IHVz
ZXJzIG1heSBzdGlsbCByZWFkIHN0YWxlIGRhdGEuIFRoZXJlZm9yZSwgaXQgaXMgc3RpbGwKPiBu
ZWNlc3NhcnkgdG8gZW5zdXJlIHRoYXQgdGhlIHBhZ2UgY2FjaGUgaXMgaW52YWxpZGF0ZWQgYWZ0
ZXIgdW5tb3VudC4KPiAKPiBibGtkZXZfaW9jdGwKPiAgLSBibGtkZXZfY29tbW9uX2lvY3RsCj4g
ICAtIGJsa2Rldl9mbHVzaGJ1Zgo+IAo+IHN0YXRpYyBpbnQgYmxrZGV2X2ZsdXNoYnVmKHN0cnVj
dCBibG9ja19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIGNtZCwKPiAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBhcmcpCj4gewo+ICAgICAgICAgaWYgKCFjYXBhYmxlKENBUF9TWVNfQURNSU4p
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVBQ0NFUzsKCldlbGwsIGNhbiB5b3UgZGVzY3Jp
YmUgdGhlIHJhY2UgY2FzZSB0aGF0IG5vbi1yb290IHVzZXIgc3RpbGwgcmVhZCBzdGFsZSBkYXRh
CmluIGNvbW1pdCBtZXNzYWdlPwoKPiAKPiBJIGFsc28gbm90aWNlZCB0aGF0IGJ0cmZzIGhhcyBl
bmNvdW50ZXJlZCBhIHNpbWlsYXIgaXNzdWU6Cj4gaHR0cHM6Ly9tYWlsLWFyY2hpdmUuY29tL2xp
bnV4LWJ0cmZzQHZnZXIua2VybmVsLm9yZy9tc2c1NDE4OC5odG1sCgpBbmQgaW5jbHVkaW5nIHRo
aXMgZXhhbXBsZSBhcyB3ZWxsLgoKVGhhbmtzLAoKPiAKPiBJbiB0aGF0IGRpc2N1c3Npb24sIHRo
ZSBzb2x1dGlvbiB3YXMgdG8gY2FsbCBpbnZhbGlkYXRlX2JkZXYoKSB3aGVuIHRoZQo+IGRldmlj
ZSBpcyBjbG9zZWQuCj4gCj4gVGhhbmtzCj4gWW9uZ3BlbmcsCj4gCj4+Cj4+IFRoYW5rcywKPj4K
Pj4+Cj4+PiBUaGFua3MKPj4+IFlvbmdwZW5nLAo+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4K
Pj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcwo+Pj4+Pj4gWW9uZ3Blbmcs
Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4+Cj4+Pj4+Pj4+ICvCoMKgwqAg
Zm9yIChpID0gMTsgaSA8IHNiaS0+c19uZGV2czsgaSsrKSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBzeW5jX2Jsb2NrZGV2KEZERVYoaSkuYmRldik7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBpbnZhbGlkYXRlX2JkZXYoRkRFVihpKS5iZGV2KTsKPj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+
Pj4+IMKgwqDCoCB9Cj4+Pj4+Pj4+IMKgwqDCoCDCoCBpbnQgZjJmc19zeW5jX2ZzKHN0cnVjdCBz
dXBlcl9ibG9jayAqc2IsIGludCBzeW5jKQo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+Pj4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Pj4+Cj4+Pj4+Cj4+Pj4KPj4+Pgo+
Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4KPj4KPj4KPj4KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
