Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C36757296
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jul 2023 05:57:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLbpv-0001i2-SU;
	Tue, 18 Jul 2023 03:57:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qLbps-0001hm-Hi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 03:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2E4oazSGi41SXrOazAsM5bXZ6GmMoenYi/kxDPRQlAI=; b=fDUDNj0X7BM9s00Lf41Z4ul08N
 d2mQ6GagOF9r13oUetTibZ6iDdsmObunuI9ECCwPFQ23lrzZd8Fj3kPsqIPT8GI/dZyO4+1UQsdB8
 OWqcMeSimrcay57rnPmp0+7eSYBFG28wwutIhENlQBK/wKEFH/+LdJ63Fr9HM1E7ZxWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2E4oazSGi41SXrOazAsM5bXZ6GmMoenYi/kxDPRQlAI=; b=cTuQINNmcWjG1YF2VCGXetTJ7R
 bHJ/CONJ0CJQSVa1IVhLy4E8snH4EtVSJuHrkEUZeM/ltbkXvOHRUifA1AnziH+BF2CPCqOqMjcI0
 lIJXFDJSHPDRbVVbJLHAo78QjHbPj79MisQ/pXkczDT4DTDZiAQXiCv3be0MwtxtkynQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLbpq-00BQAI-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 03:57:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DAB1A61416
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jul 2023 03:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B2DC433C7;
 Tue, 18 Jul 2023 03:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689652628;
 bh=NYrYHBhUhSrGSV8daixGuOC87c6t5hd72Ghpf6rRueo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=LU4U46ReOyGBloy747KuT7hUNDtCzoXoXxV0OWSqVQ3DIPuvIlO8fv5JOsx65MscZ
 D4cb3MIkWuLC2rLuUXKMd8bvmxqTCQAch8VmtZDxp8p8yNaFVOb0jrN9XxmHnDIDd8
 2q63OL7dbvCTE7kmRUQ5HEgqA7CU3FJBmmz5wj4Uuy8E6Z+Ei6H4hZxxPCGUUtMdFF
 97PlVbNjshZs8swggXUExkhebz3W2vrY87Iz7PsmU9CDFWD66fAIqGDcJk2F2uH7Y2
 pM0ZpXXVXpYAJ8OXTBQzsg4Sd4jca3BTJwpcULdgKAFUe8j/uKrzrvQUKa40gEmi0d
 /Hgnq4q2ddimQ==
Message-ID: <e84a88a6-ff2f-1c52-ffb7-8e34a14590b5@kernel.org>
Date: Tue, 18 Jul 2023 11:57:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
 <ZInmkgjDnAUD5Nk0@google.com>
 <50d5fa8c-4fe9-8a03-be78-0b5383e55b62@kernel.org>
 <ZKP6EJ5dZ4f4wScp@google.com>
 <65143701-4c19-ab66-1500-abd1162639cd@kernel.org>
 <ZKWovWZDiHjMavtB@google.com>
 <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
 <ZK2FT9CUjxXvQ2K5@google.com>
 <330c96f7-fbad-dd17-6368-f1378b3b5375@kernel.org>
 <ZK7M6EkLkV8UbqUl@google.com>
 <87acf602-1587-0615-909d-6e60c66c3cda@kernel.org>
In-Reply-To: <87acf602-1587-0615-909d-6e60c66c3cda@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Comments? On 2023/7/13 9:31, Chao Yu wrote: > On 2023/7/12
 23:55, Jaegeuk Kim wrote: >> On 07/12, Chao Yu wrote: >>> On 2023/7/12 0:37,
 Jaegeuk Kim wrote: >>>> On 07/06, Chao Yu wrote: >>>>> On 2023/7/6 1:30,
 J [...] Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLbpq-00BQAI-G4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not issue small discard commands
 during checkpoint
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q29tbWVudHM/CgpPbiAyMDIzLzcvMTMgOTozMSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIzLzcv
MTIgMjM6NTUsIEphZWdldWsgS2ltIHdyb3RlOgo+PiBPbiAwNy8xMiwgQ2hhbyBZdSB3cm90ZToK
Pj4+IE9uIDIwMjMvNy8xMiAwOjM3LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+PiBPbiAwNy8wNiwg
Q2hhbyBZdSB3cm90ZToKPj4+Pj4gT24gMjAyMy83LzYgMTozMCwgSmFlZ2V1ayBLaW0gd3JvdGU6
Cj4+Pj4+PiBPbiAwNy8wNCwgQ2hhbyBZdSB3cm90ZToKPj4+Pj4+PiBPbiAyMDIzLzcvNCAxODo1
MywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA3LzAzLCBDaGFvIFl1IHdyb3RlOgo+
Pj4+Pj4+Pj4gT24gMjAyMy82LzE1IDA6MTAsIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+Pj4+Pj4+
IElmIHRoZXJlJ3JlIGh1Z2UgIyBvZiBzbWFsbCBkaXNjYXJkcywgdGhpcyB3aWxsIGluY3JlYXNl
IGNoZWNrcG9pbnQgbGF0ZW5jeQo+Pj4+Pj4+Pj4+IGluc2FuZWx5LiBMZXQncyBpc3N1ZSBzbWFs
bCBkaXNjYXJkcyBvbmx5IGJ5IHRyaW0uCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+Pj4+Pj4+Pj4+IC0tLQo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoCBDaGFuZ2UgbG9nIGZyb20gdjE6Cj4+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgIC0gbW92ZSB0aGUgc2tpcCBsb2dpYyB0byBhdm9pZCBkYW5nbGluZyBv
YmplY3RzCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgIGZzL2YyZnMvc2VnbWVudC5j
IHwgMiArLQo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+Pj4+Pj4+IGluZGV4IDhjN2Fm
OGI0ZmM0Ny4uMDQ1N2Q2MjAwMTFmIDEwMDY0NAo+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jCj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4+Pj4+PiBAQCAt
MjE5Myw3ICsyMTkzLDcgQEAgdm9pZCBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHMoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbGVuID0gbmV4dF9wb3MgLSBjdXJfcG9zOwo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgfHwK
Pj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChmb3JjZSAmJiBsZW4g
PCBjcGMtPnRyaW1fbWlubGVuKSkKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIWZvcmNlIHx8IGxlbiA8IGNwYy0+dHJpbV9taW5sZW4pCj4+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2tpcDsK
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTb3JyeSBmb3IgbGF0ZSByZXBseS4KPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBXZSBoYXZlIGEgY29uZmlndXJhdGlvbiBmb3Igc3VjaCBjYXNlLCB3aGF0IGRvIHlvdSB0
aGluayBvZiBzZXR0aW5nCj4+Pj4+Pj4+PiBtYXhfc21hbGxfZGlzY2FyZHMgdG8gemVybz8gb3Ro
ZXJ3aXNlLCB3LyBhYm92ZSBjaGFuZ2UsIG1heF9zbWFsbF9kaXNjYXJkcwo+Pj4+Pj4+Pj4gbG9n
aWMgbWF5IGJlIGJyb2tlbj8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBXaGF0OsKgwqDCoMKgwqDCoMKg
wqDCoMKgIC9zeXMvZnMvZjJmcy88ZGlzaz4vbWF4X3NtYWxsX2Rpc2NhcmRzCj4+Pj4+Pj4+PiBE
YXRlOsKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vdmVtYmVyIDIwMTMKPj4+Pj4+Pj4+IENvbnRhY3Q6
wqDCoMKgwqDCoMKgwqAgIkphZWdldWsgS2ltIiA8amFlZ2V1ay5raW1Ac2Ftc3VuZy5jb20+Cj4+
Pj4+Pj4+PiBEZXNjcmlwdGlvbjrCoMKgwqAgQ29udHJvbHMgdGhlIGlzc3VlIHJhdGUgb2YgZGlz
Y2FyZCBjb21tYW5kcyB0aGF0IGNvbnNpc3Qgb2Ygc21hbGwKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsb2NrcyBsZXNzIHRoYW4gMk1CLiBUaGUgY2Fu
ZGlkYXRlcyB0byBiZSBkaXNjYXJkZWQgYXJlIGNhY2hlZCB1bnRpbAo+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hlY2twb2ludCBpcyB0cmlnZ2VyZWQs
IGFuZCBpc3N1ZWQgZHVyaW5nIHRoZSBjaGVja3BvaW50Lgo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQnkgZGVmYXVsdCwgaXQgaXMgZGlzYWJsZWQgd2l0
aCAwLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9yLCBpZiB3ZSBwcmVmZXIgdG8gZGlzYWJsZSBzbWFs
bF9kaXNjYXJkcyBieSBkZWZhdWx0LCB3aGF0IGFib3V0IGJlbG93IGNoYW5nZToKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gSSB0aGluayBzbWFsbF9kaXNjYXJkcyBpcyBmaW5lLCBidXQgbmVlZCB0byBhdm9p
ZCBsb25nIGNoZWNrcG9pbnQgbGF0ZW5jeSBvbmx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBkaWRuJ3Qg
Z2V0IHlvdSwgZG8geW91IG1lYW4gd2UgY2FuIHN0aWxsIGlzc3VlIHNtYWxsIGRpc2NhcmQgYnkK
Pj4+Pj4+PiBmc3RyaW0sIHNvIHNtYWxsX2Rpc2NhcmRzIGZ1bmN0aW9uYWxpdHkgaXMgZmluZT8K
Pj4+Pj4+Cj4+Pj4+PiBZb3UgZ290IHRoZSBwb2ludC4KPj4+Pj4KPj4+Pj4gV2VsbCwgYWN0dWFs
bHksIHdoYXQgSSBtZWFuIGlzIG1heF9zbWFsbF9kaXNjYXJkcyBzeXNmcyBlbnRyeSdzIGZ1bmN0
aW9uYWxpdHkKPj4+Pj4gaXMgYnJva2VuLiBOb3csIHRoZSBlbnRyeSBjYW4gbm90IGJlIHVzZWQg
dG8gY29udHJvbCBudW1iZXIgb2Ygc21hbGwgZGlzY2FyZHMKPj4+Pj4gY29tbWl0dGVkIGJ5IGNo
ZWNrcG9pbnQuCj4+Pj4KPj4+PiBDb3VsZCB5b3UgZGVzY3JiaWUgdGhpcyBwcm9ibGVtIGZpcnN0
Pwo+Pj4KPj4+IE9oLCBhbHJpZ2h0LCBhY3R1YWxseSwgSSd2ZSBkZXNjcmliZWQgdGhpcyBwcm9i
bGVtIGxpdGVyYWxseSwgYnV0IG1heWJlIGl0J3Mgbm90Cj4+PiBjbGVhciwgbGV0IG1lIGdpdmUg
c29tZSBleGFtcGxlcyBhcyBiZWxvdzoKPj4+Cj4+PiBlY2hvIDAgPiAvc3lzL2ZzL2YyZnMvdmRi
L21heF9zbWFsbF9kaXNjYXJkcwo+Pj4geGZzX2lvIC1mIC9tbnQvZjJmcy9maWxlIC1jICJwd3Jp
dGUgMCAybSIgLWMgImZzeW5jIgo+Pj4geGZzX2lvIC9tbnQvZjJmcy9maWxlIC1jICJmcHVuY2gg
MCA0ayIKPj4+IHN5bmMKPj4+IGNhdCAvcHJvYy9mcy9mMmZzL3ZkYi9kaXNjYXJkX3BsaXN0X2lu
Zm8gfGhlYWQgLTIKPj4+Cj4+PiBlY2hvIDEwMCA+IC9zeXMvZnMvZjJmcy92ZGIvbWF4X3NtYWxs
X2Rpc2NhcmRzCj4+PiBybSAvbW50L2YyZnMvZmlsZQo+Pj4geGZzX2lvIC1mIC9tbnQvZjJmcy9m
aWxlIC1jICJwd3JpdGUgMCAybSIgLWMgImZzeW5jIgo+Pj4geGZzX2lvIC9tbnQvZjJmcy9maWxl
IC1jICJmcHVuY2ggMCA0ayIKPj4+IHN5bmMKPj4+IGNhdCAvcHJvYy9mcy9mMmZzL3ZkYi9kaXNj
YXJkX3BsaXN0X2luZm8gfGhlYWQgLTIKPj4+Cj4+PiBCZWZvcmUgdGhlIHBhdGNoOgo+Pj4KPj4+
IERpc2NhcmQgcGVuZCBsaXN0KFNob3cgZGlhY3JkX2NtZCBjb3VudCBvbiBlYWNoIGVudHJ5LCAu
Om5vdCBleGlzdCk6Cj4+PiDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLsKg
wqDCoMKgwqDCoCAuwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLsKgwqDCoMKgwqDCoCAuwqDC
oMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLgo+Pj4KPj4+IERpc2NhcmQgcGVuZCBsaXN0KFNob3cg
ZGlhY3JkX2NtZCBjb3VudCBvbiBlYWNoIGVudHJ5LCAuOm5vdCBleGlzdCk6Cj4+PiDCoMKgIDDC
oMKgwqDCoMKgwqDCoMKgIDPCoMKgwqDCoMKgwqAgMcKgwqDCoMKgwqDCoCAuwqDCoMKgwqDCoMKg
IC7CoMKgwqDCoMKgwqAgLsKgwqDCoMKgwqDCoCAuwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAg
Lgo+Pj4KPj4+IEFmdGVyIHRoZSBwYXRjaDoKPj4+IERpc2NhcmQgcGVuZCBsaXN0KFNob3cgZGlh
Y3JkX2NtZCBjb3VudCBvbiBlYWNoIGVudHJ5LCAuOm5vdCBleGlzdCk6Cj4+PiDCoMKgIDDCoMKg
wqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLsKgwqDCoMKgwqDCoCAuwqDCoMKgwqDCoMKgIC7C
oMKgwqDCoMKgwqAgLsKgwqDCoMKgwqDCoCAuwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLgo+
Pj4KPj4+IERpc2NhcmQgcGVuZCBsaXN0KFNob3cgZGlhY3JkX2NtZCBjb3VudCBvbiBlYWNoIGVu
dHJ5LCAuOm5vdCBleGlzdCk6Cj4+PiDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKg
wqAgLsKgwqDCoMKgwqDCoCAuwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLsKgwqDCoMKgwqDC
oCAuwqDCoMKgwqDCoMKgIC7CoMKgwqDCoMKgwqAgLgo+Pj4KPj4+IFNvLCBub3cgbWF4X3NtYWxs
X2Rpc2NhcmRzIGNhbiBub3QgYmUgdXNlZCB0byBjb250cm9sIHNtYWxsIGRpc2NhcmQgbnVtYmVy
Cj4+PiBjYWNoZWQgYnkgY2hlY2twb2ludC4KPiAKPiBMZXQgbWUgZXhwbGFpbiBtb3JlOgo+IAo+
IFByZXZpb3VzbHksIHdlIGhhdmUgdHdvIG1lY2hhbmlzbXMgdG8gY2FjaGUgJiBzdWJtaXQgc21h
bGwgZGlzY2FyZHM6Cj4gCj4gYSkgc2V0IG1heCBzbWFsbCBkaXNjYXJkIG51bWJlciBpbiAvc3lz
L2ZzL2YyZnMvdmRiL21heF9zbWFsbF9kaXNjYXJkcywgYW5kIGNoZWNrcG9pbnQKPiB3aWxsIGNh
Y2hlIHNtYWxsIGRpc2NhcmQgY2FuZGlkYXRlcyB3LyBjb25maWd1cmVkIG1heGltdW0gbnVtYmVy
Lgo+IAo+IGIpIGNhbGwgRklUUklNIGlvY3RsLCBhbHNvLCBjaGVja3BvaW50IGluIGYyZnNfdHJp
bV9mcygpIHdpbGwgY2FjaGUgc21hbGwgZGlzY2FyZAo+IGNhbmRpZGF0ZXMgdy8gY29uZmlndXJl
ZCBkaXNjYXJkIGdyYW51bGFyaXR5LCBidXQgdy9vIGxpbWl0YXRpb24gb2YgbnVtYmVyLiBGU1RS
SU0KPiBpbnRlcmZhY2UgaXMgYXN5bmNocm9uaXplZCwgc28gaXQgd29uJ3Qgc3VibWl0IGRpc2Nh
cmQgZGlyZWN0bHkuCj4gCj4gRmluYWxseSwgZGlzY2FyZCB0aHJlYWQgd2lsbCBzdWJtaXQgdGhl
bSBpbiBiYWNrZ3JvdW5kIHBlcmlvZGljYWxseS4KPiAKPiBTbyB3aGF0IEkgbWVhbiBpcyB0aGUg
bWVjaGFuaXNtIGEpIGlzIGJyb2tlbiwgc2luY2Ugbm8gbWF0dGVyIGhvdyB3ZSBjb25maWd1cmUg
dGhlCj4gc3lzZnMgZW50cnkgL3N5cy9mcy9mMmZzL3ZkYi9tYXhfc21hbGxfZGlzY2FyZHMsIGNo
ZWNrcG9pbnQgd2lsbCBub3QgY2FjaGUgc21hbGwKPiBkaXNjYXJkIGNhbmRpZGF0ZXMgYW55IG1v
cmUuCj4gCj4gU28sIGl0IG5lZWRzIHRvIGZpeCBtYXhfc21hbGxfZGlzY2FyZHMgc3lzZnMgZnVu
Y3Rpb25hbGl0eT8gb3IganVzdCBkcm9wIHRoZQo+IGZ1bmN0aW9uYWxpdHk/Cj4gCj4+Cj4+IFNp
bmNlIHdlIGRvIG5vdCBzdWJtaXQgc21hbGwgZGlzY2FyZHMgYW55bW9yZSBkdXJpbmcgY2hlY2tw
b2ludC4gV2h5IG5vdCByZWx5aW5nCj4+IG9uIHRoZSBkaXNjYXJkIHRocmVhZCB0byBpc3N1ZSB0
aGVtPwo+IAo+IFNvcnJ5LCBJJ20gbm90IHN1cmUgSSBnZXQgeW91ciBwb2ludCwgZG8geW91IG1l
YW4gbWF4X3NtYWxsX2Rpc2NhcmRzIGZ1bmN0aW9uYWxpdHkKPiBpcyBvYnNvbGV0ZWQsIHNvIGl0
IHJlY29tbWVuZGVkIHRvIHVzZSBmc3RyaW0gdG8gY2FjaGUgJiBzdWJtaXQgc21hbGwgZGlzY2Fy
ZHM/Cj4gCj4gTGV0IG1lIGtub3csIGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyBvciBtaXN1bmRl
cnN0YW5kaW5nIHRoZSBwb2ludC4KPiAKPiBUaGFua3MsCj4gCj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+
Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHRoZXJlIGlzIGFub3RoZXIgd2F5IHRvIGFjaGll
dmUgImF2b2lkIGxvbmcgY2hlY2twb2ludCBsYXRlbmN5IGNhdXNlZAo+Pj4+PiBieSBjb21taXR0
aW5nIGh1Z2UgIyBvZiBzbWFsbCBkaXNjYXJkcyIsIHRoZSB3YXkgaXMgd2UgY2FuIHNldCBtYXhf
c21hbGxfZGlzY2FyZHMKPj4+Pj4gdG8gc21hbGwgdmFsdWUgb3IgemVybywgdy8gc3VjaCBjb25m
aWd1cmF0aW9uLCBpdCB3aWxsIHRha2UgY2hlY2twb2ludCBtdWNoIGxlc3MKPj4+Pj4gdGltZSBv
ciBubyB0aW1lIHRvIGNvbW1pdHRpbmcgc21hbGwgZGlzY2FyZCBkdWUgdG8gYmVsb3cgY29udHJv
bCBsb2dpYzoKPj4+Pj4KPj4+Pj4gZjJmc19mbHVzaF9zaXRfZW50cmllcygpCj4+Pj4+IHsKPj4+
Pj4gLi4uCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCEoY3BjLT5yZWFzb24gJiBD
UF9ESVNDQVJEKSkgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3BjLT50
cmltX3N0YXJ0ID0gc2Vnbm87Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
ZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgZmFsc2UpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPj4+Pj4gLi4uCj4+Pj4+IH0KPj4+Pj4KPj4+Pj4gYWRkX2Rpc2NhcmRfYWRkcnMo
KQo+Pj4+PiB7Cj4+Pj4+IC4uLgo+Pj4+PiDCoMKgwqDCoHdoaWxlIChmb3JjZSB8fCBTTV9JKHNi
aSktPmRjY19pbmZvLT5ucl9kaXNjYXJkcyA8PQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU01fSShzYmkpLT5kY2NfaW5mby0+bWF4X2Rpc2NhcmRzKSB7Cj4+Pj4+Cj4+Pj4+
IEl0IHdpbGwgYnJlYWsgdGhlIGxvb3Agb25jZSBucl9kaXNjYXJkcyBpcyBsYXJnZXIgdGhhbiBt
YXhfZGlzY2FyZHMsIGlmCj4+Pj4+IG1heF9kaXNjYXJkcyBpcyBzZXQgdG8gemVybywgY2hlY2tw
b2ludCB3b24ndCB0YWtlIHRpbWUgdG8gaGFuZGxlIHNtYWxsIGRpc2NhcmRzLgo+Pj4+Pgo+Pj4+
PiAuLi4KPj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKCFkZSkgewo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRlID0gZjJmc19rbWVtX2NhY2hlX2FsbG9jKGRpc2NhcmRfZW50cnlfc2xhYiwK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBf
RjJGU19aRVJPLCB0cnVlLCBOVUxMKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZS0+
c3RhcnRfYmxrYWRkciA9IFNUQVJUX0JMT0NLKHNiaSwgY3BjLT50cmltX3N0YXJ0KTsKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2FkZF90YWlsKCZkZS0+bGlzdCwgaGVhZCk7Cj4+
Pj4+IMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gLi4uCj4+Pj4+IMKgwqDCoMKgfQo+Pj4+PiAuLi4K
Pj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoYW5rcywK
Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IMKgwqDCoCBGcm9tIGViODlkOWI1
NmU4MTdlMzA0NmQ3ZmExNzE2NWIxMjQxNmYwOWQ0NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Cj4+Pj4+Pj4+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4+PiBEYXRl
OiBNb24sIDMgSnVsIDIwMjMgMDk6MDY6NTMgKzA4MDAKPj4+Pj4+Pj4+IFN1YmplY3Q6IFtQQVRD
SF0gUmV2ZXJ0ICJmMmZzOiBlbmFibGUgc21hbGwgZGlzY2FyZCBieSBkZWZhdWx0Igo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZDYxOGViYWYwYWE4M2QxNzU2NThhZWE1
MjkxZTBjNDU5ZDQ3MWQzOSBpbiBvcmRlcgo+Pj4+Pj4+Pj4gdG8gZGlzYWJsZSBzbWFsbCBkaXNj
YXJkIGJ5IGRlZmF1bHQsIHNvIHRoYXQgaWYgdGhlcmUncmUgaHVnZSBudW1iZXIgb2YKPj4+Pj4+
Pj4+IHNtYWxsIGRpc2NhcmRzLCBpdCB3aWxsIGRlY3JlYXNlIGNoZWNrcG9pbnQncyBsYXRlbmN5
IG9idmlvdXNseS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBBbHNvLCB0aGlzIHBhdGNoIHJldmVydHMg
OWFjMDBlN2NlZjEwICgiZjJmczogZG8gbm90IGlzc3VlIHNtYWxsIGRpc2NhcmQKPj4+Pj4+Pj4+
IGNvbW1hbmRzIGR1cmluZyBjaGVja3BvaW50IiksIGR1ZSB0byBpdCBicmVha3Mgc21hbGwgZGlz
Y2FyZCBmZWF0dXJlIHdoaWNoCj4+Pj4+Pj4+PiBtYXkgYmUgY29uZmlndXJlZCB2aWEgc3lzZnMg
ZW50cnkgbWF4X3NtYWxsX2Rpc2NhcmRzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEZpeGVzOiA5YWMw
MGU3Y2VmMTAgKCJmMmZzOiBkbyBub3QgaXNzdWUgc21hbGwgZGlzY2FyZCBjb21tYW5kcyBkdXJp
bmcgY2hlY2twb2ludCIpCj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+Cj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+IMKgwqDCoMKgIGZzL2YyZnMvc2VnbWVu
dC5jIHwgNCArKy0tCj4+Pj4+Pj4+PiDCoMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4+Pj4+PiBpbmRleCAxNGM4
MjJlNWM5YzkuLjBhMzEzMzY4ZjE4YiAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jCj4+Pj4+Pj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+Pj4+Pj4gQEAgLTIx
OTMsNyArMjE5Myw3IEBAIHZvaWQgZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRzKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxlbiA9IG5leHRfcG9zIC0gY3VyX3BvczsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSB8
fAo+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICFmb3Jj
ZSB8fCBsZW4gPCBjcGMtPnRyaW1fbWlubGVuKQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAoZm9yY2UgJiYgbGVuIDwgY3BjLT50cmltX21pbmxlbikpCj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2tpcDsKPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2lz
c3VlX2Rpc2NhcmQoc2JpLCBlbnRyeS0+c3RhcnRfYmxrYWRkciArIGN1cl9wb3MsCj4+Pj4+Pj4+
PiBAQCAtMjI2OSw3ICsyMjY5LDcgQEAgc3RhdGljIGludCBjcmVhdGVfZGlzY2FyZF9jbWRfY29u
dHJvbChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
IGF0b21pY19zZXQoJmRjYy0+cXVldWVkX2Rpc2NhcmQsIDApOwo+Pj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoCBhdG9taWNfc2V0KCZkY2MtPmRpc2NhcmRfY21kX2NudCwgMCk7Cj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGRjYy0+bnJfZGlzY2FyZHMgPSAwOwo+Pj4+Pj4+Pj4gLcKgwqDCoCBk
Y2MtPm1heF9kaXNjYXJkcyA9IE1BSU5fU0VHUyhzYmkpIDw8IHNiaS0+bG9nX2Jsb2Nrc19wZXJf
c2VnOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBkY2MtPm1heF9kaXNjYXJkcyA9IDA7Cj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGRjYy0+bWF4X2Rpc2NhcmRfcmVxdWVzdCA9IERFRl9NQVhfRElTQ0FS
RF9SRVFVRVNUOwo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBkY2MtPm1pbl9kaXNjYXJkX2lz
c3VlX3RpbWUgPSBERUZfTUlOX0RJU0NBUkRfSVNTVUVfVElNRTsKPj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqAgZGNjLT5taWRfZGlzY2FyZF9pc3N1ZV90aW1lID0gREVGX01JRF9ESVNDQVJEX0lT
U1VFX1RJTUU7Cj4+Pj4+Pj4+PiAtLSAKPj4+Pj4+Pj4+IDIuNDAuMQo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZjJmc19pc3N1ZV9kaXNjYXJkKHNiaSwgZW50cnktPnN0YXJ0X2Jsa2FkZHIgKyBjdXJfcG9z
LAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
