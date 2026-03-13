Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGb0F7OjtGk7rgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 00:54:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D78928AC4A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 00:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pelFJnXF88tvz6nRZzymlkajcvCNyeP/+uPgjXCVDm0=; b=LX1YJytBfT7bTjA2kggoq4qllb
	dTW4Ak5CchQsKjQSbwheZW6YUmxq2F1Tf9NkPEzxiDu5Vk182JS6QEVXGjL546A030Hf5NmdlkiSu
	xrzqNbFFr8qm4rz19nZ5Jp+tyJdok0E2xW+qO2h9JWstYmONjjX/HjNV9XTeQOc2Prxs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1CKl-0006KP-2q;
	Fri, 13 Mar 2026 23:54:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w1CKj-0006KD-7K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 23:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j2/mpmWn10ghFaJaWccVA33ThLwn3bMOgOuqJLxQdVE=; b=WpJMlIVJyyloZ48CDllFfJNCx3
 NWXt5JwNcqdf5mLAIIJ4swG/P8S0jibY6ZL89cJoIAB5s/ncxnfAxlWEqik1BruQsE9w0h9/lIVQ5
 r5LgPsQ+NC1jXu2+4l9qlQH1gnBPSulQ2Bcp8ByccnzEiRuaZlN+oO2LCDEvTrHKi/9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j2/mpmWn10ghFaJaWccVA33ThLwn3bMOgOuqJLxQdVE=; b=RI5zzDlqAqsPm9vd60f/9Nx1ER
 zFZRWrZ9R35SAtpb64I9ax6DQlio7PPZgVn3kde/yInkXDTgBduloIyPhw8DRKjOBMZQOMJfl0dLP
 jJCgXHgI/mr2lj+qI+5Y8vBKz6LtGg2SClW7+Yc9eJ+4mwUy483Whfo9sgxPsBaNh7gs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1CKi-0004xF-H1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 23:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2945842A43;
 Fri, 13 Mar 2026 23:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA04AC19421;
 Fri, 13 Mar 2026 23:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773446050;
 bh=cTly7AG26jp+SrXfvTHxxDlweOt/bOL9lQQAROTKzzY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gMjQNj4AR7uNQ3ir0vdJFk6WFO5bymBVTITRM6/1xWzRkAAsCGCbX+/DlUQ9zOh61
 pNKcGKJrz3apPg5wPdqDkDtxVf84pimWfGRacZPdrVEa6PLevyUV+y0psAry4trjyb
 loc1zjz2iOiYgPIB/mxB5f1hN746DCESjKU0+PT5xGCX74/hNnCiKO5whO9rA4rBOc
 F6u753gyMzDkr9+T3T6tfofeZ6cl639QrA9feIq5Ay9dW35HKkbg0VkW1Hl0IP4ffJ
 cozY1xkJAvHZOjAf1qcDzv5kz7sXpQkVAqNf64Wt3jotMRq/HsJVBW4VVQ4bDyH9Ac
 zTA7A4NzRem3Q==
Message-ID: <c9b5f109-e161-4698-b7f4-0761540c3c9d@kernel.org>
Date: Sat, 14 Mar 2026 07:54:05 +0800
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
 <c6a042fd-274c-4596-9538-492b07ca055e@kernel.org>
 <CACOAw_wMybBhQqxfoBoBwPJbqreG7Art1-_7EQh+6X3tEJK1sg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_wMybBhQqxfoBoBwPJbqreG7Art1-_7EQh+6X3tEJK1sg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/14 07:50, Daeho Jeong wrote: > On Fri, Mar 13, 2026
 at 4:46 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2026/3/14 00:21, Daeho
 Jeong wrote: >>> On Thu, Mar 12, 2026 at 11:49 PM Chao Yu <cha [...] 
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
X-Headers-End: 1w1CKi-0004xF-H1
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
X-Rspamd-Queue-Id: 9D78928AC4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzE0IDA3OjUwLCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBGcmksIE1hciAxMywg
MjAyNiBhdCA0OjQ24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNi8zLzE0IDAwOjIxLCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IE9uIFRodSwgTWFyIDEy
LCAyMDI2IGF0IDExOjQ54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+
Pgo+Pj4+IE9uIDMvMTIvMjAyNiAxMToyOCBQTSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+IE9u
IFRodSwgTWFyIDEyLCAyMDI2IGF0IDI6MDfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IE9uIDIwMjYvMy8xMiAwMDowNSwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4+Pj4+Pj4gT24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjo0NOKAr0FNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIwMjYvMy8xMSAwMTo1
NCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+Pj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEluIGFnZS1iYXNlZCB2aWN0aW0g
c2VsZWN0aW9uIChBVEdDLCBBVF9TU1IsIG9yIEdDX0NCKSwgZjJmc19nZXRfdmljdGltCj4+Pj4+
Pj4+PiBjYW4gZW5jb3VudGVyIHNlY3Rpb25zIHdpdGggemVybyB2YWxpZCBibG9ja3MuIFRoaXMg
c2l0dWF0aW9uIG9mdGVuCj4+Pj4+Pj4+PiBhcmlzZXMgd2hlbiBjaGVja3BvaW50IGlzIGRpc2Fi
bGVkIG9yIGR1ZSB0byByYWNlIGNvbmRpdGlvbnMgYmV0d2Vlbgo+Pj4+Pj4+Pj4gU0lUIHVwZGF0
ZXMgYW5kIGRpcnR5IGxpc3QgbWFuYWdlbWVudC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJbiBzdWNo
IGNhc2VzLCBmMmZzX2dldF9zZWN0aW9uX210aW1lKCkgcmV0dXJucyBJTlZBTElEX01USU1FLCB3
aGljaAo+Pj4+Pj4+Pj4gc3Vic2VxdWVudGx5IHRyaWdnZXJzIGEgZmF0YWwgZjJmc19idWdfb24o
c2JpLCBtdGltZSA9PSBJTlZBTElEX01USU1FKQo+Pj4+Pj4+Pj4gaW4gYWRkX3ZpY3RpbV9lbnRy
eSgpIG9yIGdldF9jYl9jb3N0KCkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhpcyBwYXRjaCBhZGRz
IGEgY2hlY2sgaW4gZjJmc19nZXRfdmljdGltJ3Mgc2VsZWN0aW9uIGxvb3AgdG8gc2tpcAo+Pj4+
Pj4+Pj4gc2VjdGlvbnMgd2l0aCBubyB2YWxpZCBibG9ja3MuIFRoaXMgcHJldmVudHMgdW5uZWNl
c3NhcnkgYWdlCj4+Pj4+Pj4+PiBjYWxjdWxhdGlvbnMgZm9yIGVtcHR5IHNlY3Rpb25zIGFuZCBh
dm9pZHMgdGhlIGFzc29jaWF0ZWQga2VybmVsIHBhbmljLgo+Pj4+Pj4+Pj4gVGhpcyBjaGFuZ2Ug
YWxzbyBhbGxvd3MgcmVtb3ZpbmcgcmVkdW5kYW50IGNoZWNrcyBpbiBhZGRfdmljdGltX2VudHJ5
KCkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4gICAgICAgZnMvZjJmcy9n
Yy5jIHwgOSArKystLS0tLS0KPj4+Pj4+Pj4+ICAgICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4+Pj4gaW5kZXggMmUwZjY3OTQ2OTE0
Li45ODFlYWM2MjlmZTkgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+Pj4+
Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4+Pj4gQEAgLTUyMSwxMiArNTIxLDYgQEAgc3Rh
dGljIHZvaWQgYWRkX3ZpY3RpbV9lbnRyeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Pj4+
Pj4+PiAgICAgICAgICAgc3RydWN0IHNpdF9pbmZvICpzaXRfaSA9IFNJVF9JKHNiaSk7Cj4+Pj4+
Pj4+PiAgICAgICAgICAgdW5zaWduZWQgbG9uZyBsb25nIG10aW1lID0gMDsKPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+PiAtICAgICBpZiAodW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJ
U0FCTEVEKSkpIHsKPj4+Pj4+Pj4+IC0gICAgICAgICAgICAgaWYgKHAtPmdjX21vZGUgPT0gR0Nf
QVQgJiYKPj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICBnZXRfdmFsaWRfYmxvY2tzKHNi
aSwgc2Vnbm8sIHRydWUpID09IDApCj4+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+Pj4+Pj4+Pj4gLSAgICAgfQo+Pj4+Pj4+Pj4gLQo+Pj4+Pj4+Pj4gICAgICAgICAgIG10
aW1lID0gZjJmc19nZXRfc2VjdGlvbl9tdGltZShzYmksIHNlZ25vKTsKPj4+Pj4+Pj4+ICAgICAg
ICAgICBmMmZzX2J1Z19vbihzYmksIG10aW1lID09IElOVkFMSURfTVRJTUUpOwo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IEBAIC04ODksNiArODgzLDkgQEAgaW50IGYyZnNfZ2V0X3ZpY3RpbShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCAqcmVzdWx0LAo+Pj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgaWYgKHNlY191c2FnZV9jaGVjayhzYmksIHNlY25vKSkKPj4+Pj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgaWYgKCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRydWUpKQo+Pj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPj4+Pj4+Pj4KPj4+Pj4+Pj4g
V2VsbCwgZm9yIGYyZnNfZ2V0X3ZpY3RpbSgsIEFUX1NTUiksIG9uY2UgdGhlcmUgYXJlIG5vIGRp
cnR5IHNlZ21lbnQsIGlmIHdlCj4+Pj4+Pj4+IGRvbid0IGNvdW50IGZyZWUgc2VnbWVudCBhcyBj
YW5kaWRhdGVzLCB0aGVuLCB3ZSBjYW4gbm90IGZpbmQgYW55IHZhbGlkIHZpY3RpbT8KPj4+Pj4+
Pgo+Pj4+Pj4+IE9oLCBBVF9TU1IgbmVlZHMgdG8gc2VsZWN0IHRoZSBmcmVlIHNlY3Rpb24gaW4g
dGhpcyBjYXNlPwo+Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgc28sIGZvciBleHRyZW1lIGNhc2UuCj4+
Pj4KPj4+PiBPaCwgY2hlY2sgdGhlIGNvZGUgYWdhaW4sIGl0IHNlZW1zIHdlIHNlbGVjdCB2aWN0
aW0gZnJvbSBkaXJ0eSBiaXRtYXAsCj4+Pj4gdGhlIHZpY3RpbSBzaG91bGQgbm90IGJlIGEgZnJl
ZSBvbmUuLi4KPj4+Pgo+Pj4+IEJ1dCB0aGVyZSBpcyBzb21lIGV4Y2VwdGlvbnM6Cj4+Pj4KPj4+
PiBsb2NhdGVfZGlydHlfc2VnbWVudCgpCj4+Pj4KPj4+PiAgICAgICAgICAgaWYgKHZhbGlkX2Js
b2NrcyA9PSAwICYmICghaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FCTEVEKSB8fAo+
Pj4+ICAgICAgICAgICAgICAgICAgIGNrcHRfdmFsaWRfYmxvY2tzID09IHVzYWJsZV9ibG9ja3Mp
KSB7Cj4+Pj4gICAgICAgICAgICAgICAgICAgX19sb2NhdGVfZGlydHlfc2VnbWVudChzYmksIHNl
Z25vLCBQUkUpOwo+Pj4+ICAgICAgICAgICAgICAgICAgIF9fcmVtb3ZlX2RpcnR5X3NlZ21lbnQo
c2JpLCBzZWdubywgRElSVFkpOwo+Pj4+Cj4+Pj4gSWYgdmFsaWRfYmxvY2tzIGVxdWFscyB0byB6
ZXJvLCBidXQgaWYgdGhlIGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQgYW5kIGFsc28KPj4+PiBja3B0
X3ZhbGlkX2Jsb2NrcyBkb2Vzbid0IGVxdWFscyB0byB1c2FibGVfYmxvY2tzLiBUaGUgc2VnbWVu
dCAob3Igc2VjdGlvbikKPj4+PiB3aWxsIHN0aWxsIGJlIGRpcnR5IHN0YXRlIGluIGRpcnR5IGJp
dG1hcC4KPj4+Pgo+Pj4+IFdlIG5lZWQgdG8gaGFuZGxlIHRoaXMgY29ycmVjdGx5IGluIGYyZnNf
Z2V0X3ZpY3RpbSgpIGNvcnJlY3RseSBiZWZvcmUgY2FsbGluZwo+Pj4+IGludG8gYWRkX3ZpY3Rp
bV9lbnRyeSgpIG9yIGdldF9nY19jb3N0KCk/Cj4+Pj4KPj4+Pgo+Pj4+ICAgICAgICAgICAgICAg
ICAgIC8qIERvbid0IHRvdWNoIGNoZWNrcG9pbnRlZCBkYXRhICovCj4+Pj4gICAgICAgICAgICAg
ICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkp
KSB7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocC5hbGxvY19tb2RlID09IExG
Uykgewo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBMRlMgaXMgc2V0IHRvIGZpbmQgc291cmNl
IHNlY3Rpb24gZHVyaW5nIEdDLgo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKiBUaGUgdmljdGltIHNob3VsZCBoYXZlIG5vIGNoZWNrcG9pbnRlZCBkYXRhLgo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGdldF9ja3B0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCB0
cnVlKSkKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG5leHQ7Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKiBTU1IgfCBBVF9TU1IgYXJlIHNldCB0byBmaW5kIHRhcmdldCBzZWdt
ZW50Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGZvciB3cml0ZXMg
d2hpY2ggY2FuIGJlIGZ1bGwgYnkgY2hlY2twb2ludGVkCj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAqIGFuZCBuZXdseSB3cml0dGVuIGJsb2Nrcy4KPj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghZjJmc19zZWdtZW50X2hhc19mcmVlX3Nsb3Qoc2JpLCBzZWdubykp
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0
Owo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Cj4+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkpCj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl4KPj4+PiBDYW4gdGhpcyBiZSB0aGUgZml4Pwo+IAo+IFRoZW4sIEkgdGhpbmsgd2UgYWdy
ZWUgb24gdGhpcyBjaGVjayBpcyBlbm91Z2gsIHJpZ2h0PwoKSSB0aGluayBzbywgbGV0IG1lIGtu
b3cgb25jZSB5b3UgaGF2ZSBhbnkgb3RoZXIgZm91bmRzLiA7KQoKVGhhbmtzLAoKPiAKPj4+Cj4+
PiBEaWQgeW91IHNheSBBVF9TU1IgY2FuIHVzZSBhIGZyZWUgc2VnbWVudD8gSWYgd2UgcHV0IHRo
aXMgY29uZGl0aW9uCj4+PiBoZXJlLCBBVF9TU1Igd2lsbCBub3QgdXNlIGEgZnJlZSBzZWdtZW50
IGFueW1vcmUuCj4+Cj4+IFNvcnJ5LCBJIHJlbWVtYmVyIHRoZSB3cm9uZyBwbGFjZSB3ZSBmYWxs
YmFjayB0byBhbGxvY2F0ZSBhIGZyZWUgc2VnbWVudCwgc2VlCj4+IGdldF9hdHNzcl9zZWdtZW50
KCkgYmVsb3csIGluc2lkZSBnZXRfc3NyX3NlZ21lbnQoKSB3ZSBvbmx5IHNlYXJjaCBkaXJ0eQo+
PiBzZWdtZW50L3NlY3Rpb24sIG9uY2UgaXQgZmFpbGVkLCB3ZSBjYWxsIG5ld19jdXJzZWcoKSB0
byBmaW5kIGEgZnJlZSBvbmUuCj4+Cj4+IDMwODMgc3RhdGljIGludCBnZXRfYXRzc3Jfc2VnbWVu
dChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLAo+PiAzMDg0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgdGFyZ2V0X3R5cGUsIGludCBhbGxvY19t
b2RlLAo+PiAzMDg1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGxvbmcgYWdlKQo+PiAzMDg2IHsKPj4gMzA4NyAgICAgICAgIHN0cnVjdCBjdXJz
ZWdfaW5mbyAqY3Vyc2VnID0gQ1VSU0VHX0koc2JpLCB0eXBlKTsKPj4gMzA4OCAgICAgICAgIGlu
dCByZXQgPSAwOwo+PiAzMDg5Cj4+IDMwOTAgICAgICAgICBjdXJzZWctPnNlZ190eXBlID0gdGFy
Z2V0X3R5cGU7Cj4+IDMwOTEKPj4gMzA5MiAgICAgICAgIGlmIChnZXRfc3NyX3NlZ21lbnQoc2Jp
LCB0eXBlLCBhbGxvY19tb2RlLCBhZ2UpKSB7Cj4+IDMwOTMgICAgICAgICAgICAgICAgIHN0cnVj
dCBzZWdfZW50cnkgKnNlID0gZ2V0X3NlZ19lbnRyeShzYmksIGN1cnNlZy0+bmV4dF9zZWdubyk7
Cj4+IDMwOTQKPj4gMzA5NSAgICAgICAgICAgICAgICAgY3Vyc2VnLT5zZWdfdHlwZSA9IHNlLT50
eXBlOwo+PiAzMDk2ICAgICAgICAgICAgICAgICByZXQgPSBjaGFuZ2VfY3Vyc2VnKHNiaSwgdHlw
ZSk7Cj4+IDMwOTcgICAgICAgICB9IGVsc2Ugewo+PiAzMDk4ICAgICAgICAgICAgICAgICAvKiBh
bGxvY2F0ZSBjb2xkIHNlZ21lbnQgYnkgZGVmYXVsdCAqLwo+PiAzMDk5ICAgICAgICAgICAgICAg
ICBjdXJzZWctPnNlZ190eXBlID0gQ1VSU0VHX0NPTERfREFUQTsKPj4gMzEwMCAgICAgICAgICAg
ICAgICAgcmV0ID0gbmV3X2N1cnNlZyhzYmksIHR5cGUsIHRydWUpOwo+PiAzMTAxICAgICAgICAg
fQo+PiAzMTAyICAgICAgICAgc3RhdF9pbmNfc2VnX3R5cGUoc2JpLCBjdXJzZWcpOwo+PiAzMTAz
ICAgICAgICAgcmV0dXJuIHJldDsKPj4gMzEwNCB9Cj4+Cj4+IElJVUMsIGluIGYyZnNfZ2V0X3Zp
Y3RpbSgpLCB3ZSBzaG91bGQgbmV2ZXIgZXhwZWN0IHRvIGZpbmQgYSBmcmVlIHNlZ21lbnQgZnJv
bSBkaXJ0eQo+PiBiaXRtYXAsIGV4Y2VwdCBmb3IgdGhlIGNoZWNrcG9pbnQgZGlzYWJsZWQgY2Fz
ZSwgdGhhdCdzIHdoYXQgd2UgbmVlZCB0byBmaXgsIHJpZ2h0Pwo+Pgo+PiBUaGFua3MsCj4+Cj4+
Pgo+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+IEkgYW0gY29uZnVzZWQuIFdoeSBkbyB3ZSBuZWVkIHRoZSBi
ZWxvdyBsb2dpYz8KPj4+Pj4+PiBMb29rcyBsaWtlIFdBIGZvciB0aGUgQVRfU1NSIGNhc2U/Cj4+
Pj4+Pj4KPj4+Pj4+PiBJbiBmMmZzX2dldF9zZWN0aW9uX210aW1lKCkKPj4+Pj4+PiBvdXQ6Cj4+
Pj4+Pj4gICAgICAgICAgICAgaWYgKHVubGlrZWx5KG10aW1lID09IElOVkFMSURfTVRJTUUpKQo+
Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgbXRpbWUgLT0gMTsKPj4+Pj4+PiAgICAgICAgICAg
ICByZXR1cm4gbXRpbWU7Cj4+Pj4+Pgo+Pj4+Pj4gVGhlcmUgYXJlIHR3byBjb25kaXRpb25zLCBp
biBhIHNlY3Rpb246Cj4+Pj4+Pgo+Pj4+Pj4gYSkgaWYgdGhlcmUgYXJlIG5vIHZhbGlkIGJsb2Nr
cywgaXQgd2lsbCByZXR1cm4gSU5WQUxJRF9NVElNRS4KPj4+Pj4+IGIpIGlmIHRoZXJlIGFyZSB2
YWlsZCBibG9ja3MsIGl0IHRyaWVzIHRvIHJldHVybiBtdGltZSB3aGljaCBpcyBjYWxjdWxhdGVk
LCBidXQKPj4+Pj4+IGlmIHVubHVja3kgdGhlIGNhbGN1bGF0ZWQgbXRpbWUgaXMgZXF1YWwgdG8g
SU5WQUxJRF9NVElNRSwgaW4gb3JkZXIgdG8gZGlzdGluZ3Vpc2gKPj4+Pj4+IGZyb20gY2FzZSBh
KSwgd2Ugd2lsbCByZXR1cm4gSU5WQUxJRF9NVElNRSAtIDEgaW5zdGVhZC4KPj4+Pj4KPj4+Pj4g
SWYgd2UgZmluZCBhIGZyZWUgc2VnbWVudCBhbmQgcGFzcyBpdCB0byBmMmZzX2dldF9zZWN0aW9u
X210aW1lKCkgZm9yCj4+Pj4+ICghX19pc19sYXJnZV9zZWN0aW9uKHNiaSkpIGNhc2UuCj4+Pj4+
IFdoYXQgaXMgdGhlIGV4cGVjdGVkIG91dHB1dCBvZiBpdD8gKElOVkFMSURfTVRJTUUgLSAxKT8K
Pj4+Pgo+Pj4+IEl0IGRlcGVuZHMgb24gdGhlIHN0YXR1cyBvZiBzZWN0aW9uIHRoYXQgZnJlZSBz
ZWdtZW50IGJlbG9uZyB0bzoKPj4+PiBJZiB0aGVyZSBpcyBubyB2YWxpZCBibG9jayBpbiB0aGUg
c2VjdGlvbiwgaXQgd2lsbCByZXR1cm4gSU5WQUxJRF9NVElNRSwKPj4+PiBvdGhlcndpc2UgaXQg
d2lsbCByZXR1cm4gY2FsY3VhdGVkIG10aW1lLCBvciBJTlZBTElEX01USU1FIC0gMSBmb3IKPj4+
PiBleHRyZW1lIGNhc2UgdGhhdCBtdGltZSBpcyBqdXN0IHVubHVja2lseSBlcXVhbHMgdG8gSU5W
QUxJRF9NVElNRS4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiBJIGRvbid0IHRoaW5rIHRo
aXMgaXMganVzdCBhbiB1bmx1Y2t5IGNhc2UuIElzIHRoaXMgZXhwZWN0ZWQgcmVzdWx0Pwo+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiAgICAgICAgICAg
ICAgICAgICAvKiBEb24ndCB0b3VjaCBjaGVja3BvaW50ZWQgZGF0YSAqLwo+Pj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9E
SVNBQkxFRCkpKSB7Cj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwLmFs
bG9jX21vZGUgPT0gTEZTKSB7Cj4+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Cj4+CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
