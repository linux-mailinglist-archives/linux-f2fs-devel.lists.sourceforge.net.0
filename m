Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEC0OOKhtGmxrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 00:46:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACA28ABD1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 00:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZTQS3kR5TrCwhGuedbHLiSI7+X5RrZfMNHWdDvBHTY=; b=PkORcFiwFsfjcogoQvwijdgLRm
	gCDsPPyw5MYY2/Bpsja342rb3s1sZ7yNFgMvi3J5IFl3v5JF7QF6rnRQIJ7bmMZiBVA2kSjyhwAsZ
	7JHuoQjCqMMj8QLMxx8ZHpVXM48plDYSrhVSy5L7DXt6nYQgRnFbBUQyuZ2yWzRYGlGU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1CDA-0002jb-0I;
	Fri, 13 Mar 2026 23:46:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w1CD7-0002jU-S3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 23:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjBTs7lE4KfqWC7A07wVx+qO3LawH9VuPWGK8+hGcDM=; b=bJPOFWoK/NLVO6gr85Ympj60ox
 cB9KubIyuaNS1MNSDu4rMbeWrf5/UWsgCYZyH605OvdfRAnFHQx6QpUD734yyPP3J99wrNRRzPb/Q
 5j9VjR8NSnAAfb7PXAgBVVPK3yWPQzD90GL8nxYFTr6mfvV6xuTdaz0/kfBxXUwlU9tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjBTs7lE4KfqWC7A07wVx+qO3LawH9VuPWGK8+hGcDM=; b=NuGKY0bU5A/SoReoceFxDjky/n
 6XTUDOOysTitsZETNbM9X81uqQuohOXThAXeW1dyFRb0Pv8ubQdsc3i+m4PbZ4kC5CYz7y2KwDdA5
 qs62oQ+UBVgLMH//+TYhObrFMDfE1sv1Qt+x2r+UV4iN11QYKhUBQ5XsjRqwbroPwKTg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1CD7-0004Qy-4L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 23:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9B1C409F8;
 Fri, 13 Mar 2026 23:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6558C19421;
 Fri, 13 Mar 2026 23:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773445578;
 bh=1F3fbIVyxe721BfUqOiVZA7awAX/GI9/8eWNpIS3ANU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=KjnRypMHHaZm8iROPnbPjSUjaV8tOwGaeVkSp0xTSh31HxJawrVdvtxxDBgEEBjJ/
 qZZ8fxGlacdSrnMi7+4ncwGoSZjd8esS/QFe+rPRWZrcL6vtoNEP9aCuTgmsf07WnL
 FrDnIL+k5tnQNnPj3qpt0V/WUTXlaLbXyF00LKrvWjCWh9o6+c51N+E4MI1wQ9qEj0
 yl7eSrib1ywJEQ1wUhmhtvPY8fNtzmUzPpcdhm6DfisqfOA/kc1GZaOnQ/J6cy16uA
 RpnmaSocJ16QdrNKEUB4avIXKPng2eThDZQBLs4Rex88xKWx+a6mEZu0duK+0ZFfnJ
 NYRI/0sHEfSAw==
Message-ID: <c6a042fd-274c-4596-9538-492b07ca055e@kernel.org>
Date: Sat, 14 Mar 2026 07:46:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
 <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
 <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
 <2625a3fc-7dc6-4764-877c-ffeeeb42276c@kernel.org>
 <CACOAw_wJunzUqUY2CKiEDqGKNSeFF8J_e=Qj2BqRoON=dJB==A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_wJunzUqUY2CKiEDqGKNSeFF8J_e=Qj2BqRoON=dJB==A@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/14 00:21, Daeho Jeong wrote: > On Thu, Mar 12, 2026
 at 11:49 PM Chao Yu <chao@kernel.org> wrote: >> >> On 3/12/2026 11:28 PM,
 Daeho Jeong wrote: >>> On Thu, Mar 12, 2026 at 2:07 AM Chao Yu < [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w1CD7-0004Qy-4L
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 21ACA28ABD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzE0IDAwOjIxLCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBUaHUsIE1hciAxMiwg
MjAyNiBhdCAxMTo0OeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+
IE9uIDMvMTIvMjAyNiAxMToyOCBQTSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBPbiBUaHUsIE1h
ciAxMiwgMjAyNiBhdCAyOjA34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToK
Pj4+Pgo+Pj4+IE9uIDIwMjYvMy8xMiAwMDowNSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+IE9u
IFdlZCwgTWFyIDExLCAyMDI2IGF0IDY6NDTigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IE9uIDIwMjYvMy8xMSAwMTo1NCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4+Pj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+
Pj4+Pgo+Pj4+Pj4+IEluIGFnZS1iYXNlZCB2aWN0aW0gc2VsZWN0aW9uIChBVEdDLCBBVF9TU1Is
IG9yIEdDX0NCKSwgZjJmc19nZXRfdmljdGltCj4+Pj4+Pj4gY2FuIGVuY291bnRlciBzZWN0aW9u
cyB3aXRoIHplcm8gdmFsaWQgYmxvY2tzLiBUaGlzIHNpdHVhdGlvbiBvZnRlbgo+Pj4+Pj4+IGFy
aXNlcyB3aGVuIGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQgb3IgZHVlIHRvIHJhY2UgY29uZGl0aW9u
cyBiZXR3ZWVuCj4+Pj4+Pj4gU0lUIHVwZGF0ZXMgYW5kIGRpcnR5IGxpc3QgbWFuYWdlbWVudC4K
Pj4+Pj4+Pgo+Pj4+Pj4+IEluIHN1Y2ggY2FzZXMsIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoKSBy
ZXR1cm5zIElOVkFMSURfTVRJTUUsIHdoaWNoCj4+Pj4+Pj4gc3Vic2VxdWVudGx5IHRyaWdnZXJz
IGEgZmF0YWwgZjJmc19idWdfb24oc2JpLCBtdGltZSA9PSBJTlZBTElEX01USU1FKQo+Pj4+Pj4+
IGluIGFkZF92aWN0aW1fZW50cnkoKSBvciBnZXRfY2JfY29zdCgpLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
VGhpcyBwYXRjaCBhZGRzIGEgY2hlY2sgaW4gZjJmc19nZXRfdmljdGltJ3Mgc2VsZWN0aW9uIGxv
b3AgdG8gc2tpcAo+Pj4+Pj4+IHNlY3Rpb25zIHdpdGggbm8gdmFsaWQgYmxvY2tzLiBUaGlzIHBy
ZXZlbnRzIHVubmVjZXNzYXJ5IGFnZQo+Pj4+Pj4+IGNhbGN1bGF0aW9ucyBmb3IgZW1wdHkgc2Vj
dGlvbnMgYW5kIGF2b2lkcyB0aGUgYXNzb2NpYXRlZCBrZXJuZWwgcGFuaWMuCj4+Pj4+Pj4gVGhp
cyBjaGFuZ2UgYWxzbyBhbGxvd3MgcmVtb3ZpbmcgcmVkdW5kYW50IGNoZWNrcyBpbiBhZGRfdmlj
dGltX2VudHJ5KCkuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8
ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICAgICAgZnMvZjJmcy9n
Yy5jIHwgOSArKystLS0tLS0KPj4+Pj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4gaW5kZXggMmUwZjY3OTQ2OTE0Li45ODFlYWM2
MjlmZTkgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4gKysrIGIvZnMv
ZjJmcy9nYy5jCj4+Pj4+Pj4gQEAgLTUyMSwxMiArNTIxLDYgQEAgc3RhdGljIHZvaWQgYWRkX3Zp
Y3RpbV9lbnRyeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Pj4+Pj4gICAgICAgICAgc3Ry
dWN0IHNpdF9pbmZvICpzaXRfaSA9IFNJVF9JKHNiaSk7Cj4+Pj4+Pj4gICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBsb25nIG10aW1lID0gMDsKPj4+Pj4+Pgo+Pj4+Pj4+IC0gICAgIGlmICh1bmxpa2Vs
eShpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpKSkgewo+Pj4+Pj4+IC0gICAg
ICAgICAgICAgaWYgKHAtPmdjX21vZGUgPT0gR0NfQVQgJiYKPj4+Pj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCB0cnVlKSA9PSAwKQo+Pj4+Pj4+
IC0gICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4+Pj4+Pj4gLSAgICAgfQo+Pj4+Pj4+IC0K
Pj4+Pj4+PiAgICAgICAgICBtdGltZSA9IGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoc2JpLCBzZWdu
byk7Cj4+Pj4+Pj4gICAgICAgICAgZjJmc19idWdfb24oc2JpLCBtdGltZSA9PSBJTlZBTElEX01U
SU1FKTsKPj4+Pj4+Pgo+Pj4+Pj4+IEBAIC04ODksNiArODgzLDkgQEAgaW50IGYyZnNfZ2V0X3Zp
Y3RpbShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCAqcmVzdWx0LAo+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgaWYgKHNlY191c2FnZV9jaGVjayhzYmksIHNlY25vKSkKPj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4+Pj4+Cj4+Pj4+Pj4g
KyAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkpCj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPj4+Pj4+Cj4+Pj4+PiBXZWxs
LCBmb3IgZjJmc19nZXRfdmljdGltKCwgQVRfU1NSKSwgb25jZSB0aGVyZSBhcmUgbm8gZGlydHkg
c2VnbWVudCwgaWYgd2UKPj4+Pj4+IGRvbid0IGNvdW50IGZyZWUgc2VnbWVudCBhcyBjYW5kaWRh
dGVzLCB0aGVuLCB3ZSBjYW4gbm90IGZpbmQgYW55IHZhbGlkIHZpY3RpbT8KPj4+Pj4KPj4+Pj4g
T2gsIEFUX1NTUiBuZWVkcyB0byBzZWxlY3QgdGhlIGZyZWUgc2VjdGlvbiBpbiB0aGlzIGNhc2U/
Cj4+Pj4KPj4+PiBJIHRoaW5rIHNvLCBmb3IgZXh0cmVtZSBjYXNlLgo+Pgo+PiBPaCwgY2hlY2sg
dGhlIGNvZGUgYWdhaW4sIGl0IHNlZW1zIHdlIHNlbGVjdCB2aWN0aW0gZnJvbSBkaXJ0eSBiaXRt
YXAsCj4+IHRoZSB2aWN0aW0gc2hvdWxkIG5vdCBiZSBhIGZyZWUgb25lLi4uCj4+Cj4+IEJ1dCB0
aGVyZSBpcyBzb21lIGV4Y2VwdGlvbnM6Cj4+Cj4+IGxvY2F0ZV9kaXJ0eV9zZWdtZW50KCkKPj4K
Pj4gICAgICAgICAgaWYgKHZhbGlkX2Jsb2NrcyA9PSAwICYmICghaXNfc2JpX2ZsYWdfc2V0KHNi
aSwgU0JJX0NQX0RJU0FCTEVEKSB8fAo+PiAgICAgICAgICAgICAgICAgIGNrcHRfdmFsaWRfYmxv
Y2tzID09IHVzYWJsZV9ibG9ja3MpKSB7Cj4+ICAgICAgICAgICAgICAgICAgX19sb2NhdGVfZGly
dHlfc2VnbWVudChzYmksIHNlZ25vLCBQUkUpOwo+PiAgICAgICAgICAgICAgICAgIF9fcmVtb3Zl
X2RpcnR5X3NlZ21lbnQoc2JpLCBzZWdubywgRElSVFkpOwo+Pgo+PiBJZiB2YWxpZF9ibG9ja3Mg
ZXF1YWxzIHRvIHplcm8sIGJ1dCBpZiB0aGUgY2hlY2twb2ludCBpcyBkaXNhYmxlZCBhbmQgYWxz
bwo+PiBja3B0X3ZhbGlkX2Jsb2NrcyBkb2Vzbid0IGVxdWFscyB0byB1c2FibGVfYmxvY2tzLiBU
aGUgc2VnbWVudCAob3Igc2VjdGlvbikKPj4gd2lsbCBzdGlsbCBiZSBkaXJ0eSBzdGF0ZSBpbiBk
aXJ0eSBiaXRtYXAuCj4+Cj4+IFdlIG5lZWQgdG8gaGFuZGxlIHRoaXMgY29ycmVjdGx5IGluIGYy
ZnNfZ2V0X3ZpY3RpbSgpIGNvcnJlY3RseSBiZWZvcmUgY2FsbGluZwo+PiBpbnRvIGFkZF92aWN0
aW1fZW50cnkoKSBvciBnZXRfZ2NfY29zdCgpPwo+Pgo+Pgo+PiAgICAgICAgICAgICAgICAgIC8q
IERvbid0IHRvdWNoIGNoZWNrcG9pbnRlZCBkYXRhICovCj4+ICAgICAgICAgICAgICAgICAgaWYg
KHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKSB7Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAocC5hbGxvY19tb2RlID09IExGUykgewo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKiBMRlMgaXMgc2V0IHRvIGZpbmQgc291cmNlIHNlY3Rpb24gZHVyaW5nIEdD
Lgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBUaGUgdmljdGltIHNob3Vs
ZCBoYXZlIG5vIGNoZWNrcG9pbnRlZCBkYXRhLgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKi8KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGdldF9j
a3B0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCB0cnVlKSkKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICB9IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBTU1IgfCBBVF9TU1IgYXJlIHNldCB0
byBmaW5kIHRhcmdldCBzZWdtZW50Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAqIGZvciB3cml0ZXMgd2hpY2ggY2FuIGJlIGZ1bGwgYnkgY2hlY2twb2ludGVkCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGFuZCBuZXdseSB3cml0dGVuIGJsb2Nrcy4K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmICghZjJmc19zZWdtZW50X2hhc19mcmVlX3Nsb3Qoc2JpLCBz
ZWdubykpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBu
ZXh0Owo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+Pgo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRydWUpKQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4+IENh
biB0aGlzIGJlIHRoZSBmaXg/Cj4gCj4gRGlkIHlvdSBzYXkgQVRfU1NSIGNhbiB1c2UgYSBmcmVl
IHNlZ21lbnQ/IElmIHdlIHB1dCB0aGlzIGNvbmRpdGlvbgo+IGhlcmUsIEFUX1NTUiB3aWxsIG5v
dCB1c2UgYSBmcmVlIHNlZ21lbnQgYW55bW9yZS4KClNvcnJ5LCBJIHJlbWVtYmVyIHRoZSB3cm9u
ZyBwbGFjZSB3ZSBmYWxsYmFjayB0byBhbGxvY2F0ZSBhIGZyZWUgc2VnbWVudCwgc2VlCmdldF9h
dHNzcl9zZWdtZW50KCkgYmVsb3csIGluc2lkZSBnZXRfc3NyX3NlZ21lbnQoKSB3ZSBvbmx5IHNl
YXJjaCBkaXJ0eQpzZWdtZW50L3NlY3Rpb24sIG9uY2UgaXQgZmFpbGVkLCB3ZSBjYWxsIG5ld19j
dXJzZWcoKSB0byBmaW5kIGEgZnJlZSBvbmUuCgozMDgzIHN0YXRpYyBpbnQgZ2V0X2F0c3NyX3Nl
Z21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKMzA4NCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHRhcmdldF90eXBlLCBpbnQgYWxsb2Nf
bW9kZSwKMzA4NSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBsb25nIGFnZSkKMzA4NiB7CjMwODcgICAgICAgICBzdHJ1Y3QgY3Vyc2VnX2luZm8g
KmN1cnNlZyA9IENVUlNFR19JKHNiaSwgdHlwZSk7CjMwODggICAgICAgICBpbnQgcmV0ID0gMDsK
MzA4OQozMDkwICAgICAgICAgY3Vyc2VnLT5zZWdfdHlwZSA9IHRhcmdldF90eXBlOwozMDkxCjMw
OTIgICAgICAgICBpZiAoZ2V0X3Nzcl9zZWdtZW50KHNiaSwgdHlwZSwgYWxsb2NfbW9kZSwgYWdl
KSkgewozMDkzICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2VnX2VudHJ5ICpzZSA9IGdldF9zZWdf
ZW50cnkoc2JpLCBjdXJzZWctPm5leHRfc2Vnbm8pOwozMDk0CjMwOTUgICAgICAgICAgICAgICAg
IGN1cnNlZy0+c2VnX3R5cGUgPSBzZS0+dHlwZTsKMzA5NiAgICAgICAgICAgICAgICAgcmV0ID0g
Y2hhbmdlX2N1cnNlZyhzYmksIHR5cGUpOwozMDk3ICAgICAgICAgfSBlbHNlIHsKMzA5OCAgICAg
ICAgICAgICAgICAgLyogYWxsb2NhdGUgY29sZCBzZWdtZW50IGJ5IGRlZmF1bHQgKi8KMzA5OSAg
ICAgICAgICAgICAgICAgY3Vyc2VnLT5zZWdfdHlwZSA9IENVUlNFR19DT0xEX0RBVEE7CjMxMDAg
ICAgICAgICAgICAgICAgIHJldCA9IG5ld19jdXJzZWcoc2JpLCB0eXBlLCB0cnVlKTsKMzEwMSAg
ICAgICAgIH0KMzEwMiAgICAgICAgIHN0YXRfaW5jX3NlZ190eXBlKHNiaSwgY3Vyc2VnKTsKMzEw
MyAgICAgICAgIHJldHVybiByZXQ7CjMxMDQgfQoKSUlVQywgaW4gZjJmc19nZXRfdmljdGltKCks
IHdlIHNob3VsZCBuZXZlciBleHBlY3QgdG8gZmluZCBhIGZyZWUgc2VnbWVudCBmcm9tIGRpcnR5
CmJpdG1hcCwgZXhjZXB0IGZvciB0aGUgY2hlY2twb2ludCBkaXNhYmxlZCBjYXNlLCB0aGF0J3Mg
d2hhdCB3ZSBuZWVkIHRvIGZpeCwgcmlnaHQ/CgpUaGFua3MsCgo+IAo+Pgo+Pj4+Cj4+Pj4+IEkg
YW0gY29uZnVzZWQuIFdoeSBkbyB3ZSBuZWVkIHRoZSBiZWxvdyBsb2dpYz8KPj4+Pj4gTG9va3Mg
bGlrZSBXQSBmb3IgdGhlIEFUX1NTUiBjYXNlPwo+Pj4+Pgo+Pj4+PiBJbiBmMmZzX2dldF9zZWN0
aW9uX210aW1lKCkKPj4+Pj4gb3V0Ogo+Pj4+PiAgICAgICAgICAgIGlmICh1bmxpa2VseShtdGlt
ZSA9PSBJTlZBTElEX01USU1FKSkKPj4+Pj4gICAgICAgICAgICAgICAgICAgIG10aW1lIC09IDE7
Cj4+Pj4+ICAgICAgICAgICAgcmV0dXJuIG10aW1lOwo+Pj4+Cj4+Pj4gVGhlcmUgYXJlIHR3byBj
b25kaXRpb25zLCBpbiBhIHNlY3Rpb246Cj4+Pj4KPj4+PiBhKSBpZiB0aGVyZSBhcmUgbm8gdmFs
aWQgYmxvY2tzLCBpdCB3aWxsIHJldHVybiBJTlZBTElEX01USU1FLgo+Pj4+IGIpIGlmIHRoZXJl
IGFyZSB2YWlsZCBibG9ja3MsIGl0IHRyaWVzIHRvIHJldHVybiBtdGltZSB3aGljaCBpcyBjYWxj
dWxhdGVkLCBidXQKPj4+PiBpZiB1bmx1Y2t5IHRoZSBjYWxjdWxhdGVkIG10aW1lIGlzIGVxdWFs
IHRvIElOVkFMSURfTVRJTUUsIGluIG9yZGVyIHRvIGRpc3Rpbmd1aXNoCj4+Pj4gZnJvbSBjYXNl
IGEpLCB3ZSB3aWxsIHJldHVybiBJTlZBTElEX01USU1FIC0gMSBpbnN0ZWFkLgo+Pj4KPj4+IElm
IHdlIGZpbmQgYSBmcmVlIHNlZ21lbnQgYW5kIHBhc3MgaXQgdG8gZjJmc19nZXRfc2VjdGlvbl9t
dGltZSgpIGZvcgo+Pj4gKCFfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSkgY2FzZS4KPj4+IFdoYXQg
aXMgdGhlIGV4cGVjdGVkIG91dHB1dCBvZiBpdD8gKElOVkFMSURfTVRJTUUgLSAxKT8KPj4KPj4g
SXQgZGVwZW5kcyBvbiB0aGUgc3RhdHVzIG9mIHNlY3Rpb24gdGhhdCBmcmVlIHNlZ21lbnQgYmVs
b25nIHRvOgo+PiBJZiB0aGVyZSBpcyBubyB2YWxpZCBibG9jayBpbiB0aGUgc2VjdGlvbiwgaXQg
d2lsbCByZXR1cm4gSU5WQUxJRF9NVElNRSwKPj4gb3RoZXJ3aXNlIGl0IHdpbGwgcmV0dXJuIGNh
bGN1YXRlZCBtdGltZSwgb3IgSU5WQUxJRF9NVElNRSAtIDEgZm9yCj4+IGV4dHJlbWUgY2FzZSB0
aGF0IG10aW1lIGlzIGp1c3QgdW5sdWNraWx5IGVxdWFscyB0byBJTlZBTElEX01USU1FLgo+Pgo+
PiBUaGFua3MsCj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMganVzdCBhbiB1bmx1Y2t5IGNh
c2UuIElzIHRoaXMgZXhwZWN0ZWQgcmVzdWx0Pwo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+
Pj4+Pgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4gKwo+Pj4+Pj4+
ICAgICAgICAgICAgICAgICAgLyogRG9uJ3QgdG91Y2ggY2hlY2twb2ludGVkIGRhdGEgKi8KPj4+
Pj4+PiAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShpc19zYmlfZmxhZ19zZXQoc2JpLCBT
QklfQ1BfRElTQUJMRUQpKSkgewo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
cC5hbGxvY19tb2RlID09IExGUykgewo+Pj4+Pj4KPj4+Pgo+PgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
