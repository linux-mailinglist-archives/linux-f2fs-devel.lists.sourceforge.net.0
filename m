Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPlaILQ952no5QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 11:04:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D359438960
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 11:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ie8xApmzQ5EX6l396DCsHDJlrF1M5BvjOG4waqc1/lo=; b=FZNqmLg4hCP2g18x5/6MmgbpEq
	A0yqlxF+MVqS7gRd9YlgDAzYqPo955pVEOec8j4wnsXtbvgnyp6rWVz1ySwoIO/5WnxWXzTGzQ2fV
	94TDUXMOv4+t+giBNZn14bq9b2ngAcnj0R/L92oe3Un2wunLGBVZ2bRm7tiBWQPnnYVU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wF72E-0004Ti-2F;
	Tue, 21 Apr 2026 09:04:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wF72C-0004TZ-Sn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 09:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Og3MAnxRKlnvnA9g6C+1z9AXV53mhxDKWqLhAxiVCa4=; b=VbX6eqII/oL24gnhYDqYaB3+23
 tvIl/GI/3e3wIRvMxQifCeb9SoXyYwJ9Wv1tz2YL8wpgSjkHqL6sEjW1/ylzOXIdyb3FUk4XQbAhf
 8RVMpje4wZ5KJKkw2rnDDjuVNLPR5t0/LSW/NnfuNHpQIWR0DKFQ49NtKAkn4d8bEMrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Og3MAnxRKlnvnA9g6C+1z9AXV53mhxDKWqLhAxiVCa4=; b=AMCjF6c4U8QNVVUPso1v/trGvO
 H1Sg/8b1FU7rJur0sNeOF6kt7CxLvf9ZhsdAiC7K6ZhEuLxG1nU9oGIMomTmWr7ds6m8W5FJa1HE+
 2xap+Xd9ooK9I0Xvd/668Clq+gcic4PXT5LphSpW3kPUxaFWVH9UbD+ZLnM5UgmSyRzo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wF729-0007Tq-Lb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 09:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47F6F43F80;
 Tue, 21 Apr 2026 09:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9795AC2BCB0;
 Tue, 21 Apr 2026 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776762271;
 bh=A/KWQMopmFsUYglVJ2p0D/NDGUpoQO0F3Mg9epddvf0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DmwCklvLzUKJH3u3+dzoMYnUG5sBHGSyhQPQf/nRr6aUEYcm2iT8F1g+EMK86wRfi
 QmWO5pVnQ5aJvD2vAWaCnJlFj+TvAu34UwDK9SvwBbXAT+RF468hH4JY7fcrW9pJZP
 peEtrrcllyU/wlrpZSox+z43E6aoMaZ0QtZgriixk/J0wU6nTdiOaB+wQ5sOD6m+OI
 7ImaoR+a19GcLS7EZIyvZFjVZsMJwnMu0A4iW9aExHSZww52UaroU3Fwf9UoFay/YG
 kdbzq73rzolHO7s2UPVHC9l3ffF9quSVK/2xif77PTZXkJjX5+KUovIiLxB9IIPfDX
 /Cfn2Tic+c+pg==
Message-ID: <9b518ad1-18ad-4eb4-86d4-3a27e40a7635@kernel.org>
Date: Tue, 21 Apr 2026 17:04:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
 <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
 <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
 <a643b967-cb05-4de5-96f2-f1b783c9758d@sina.com>
 <bedd1951-681b-4364-80c9-c7fe6886c992@kernel.org>
 <252cb446-e313-417b-b780-85dcdcf34a87@sina.com>
Content-Language: en-US
In-Reply-To: <252cb446-e313-417b-b780-85dcdcf34a87@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/21/2026 4:44 PM, Yongpeng Yang wrote: > > On 4/20/26
 15:28, Chao Yu via Linux-f2fs-devel wrote: >> On 4/19/2026 12:29 AM, Yongpeng
 Yang wrote: >>> >>> On 4/18/26 8:51 AM, Chao Yu via Linux-f2fs-d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wF729-0007Tq-Lb
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
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
X-Rspamd-Queue-Id: 8D359438960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8yMS8yMDI2IDQ6NDQgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gCj4gT24gNC8yMC8y
NiAxNToyOCwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24gNC8xOS8y
MDI2IDEyOjI5IEFNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIDQvMTgvMjYgODo1
MSBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+PiBPbiA0LzE3LzI2
IDIxOjI2LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiA0LzE3LzI2IDE3OjAw
LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+Pj4gT24gNC8zLzI2IDIy
OjQwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gZjJmc19kZXN0cm95X2V4dGVu
dF9ub2RlKCkgZG9lcyBub3Qgc2V0IEZJX05PX0VYVEVOVCBiZWZvcmUgY2xlYXJpbmcKPj4+Pj4+
PiBleHRlbnQgbm9kZXMuIFdoZW4gY2FsbGVkIGZyb20gZjJmc19kcm9wX2lub2RlKCkgd2l0aCBJ
X1NZTkMgc2V0LAo+Pj4+Pj4+IGNvbmN1cnJlbnQga3dvcmtlciB3cml0ZWJhY2sgY2FuIGluc2Vy
dCBuZXcgZXh0ZW50IG5vZGVzIGludG8gdGhlCj4+Pj4+Pj4gc2FtZQo+Pj4+Pj4+IGV4dGVudCB0
cmVlLCByYWNpbmcgd2l0aCB0aGUgZGVzdHJveSBhbmQgdHJpZ2dlcmluZyBmMmZzX2J1Z19vbigp
IGluCj4+Pj4+Pj4gX19kZXN0cm95X2V4dGVudF9ub2RlKCkuIFRoZSBzY2VuYXJpbyBpcyBhcyBm
b2xsb3dzOgo+Pj4+Pj4+Cj4+Pj4+Pj4gZHJvcCBpbm9kZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWJhY2sKPj4+Pj4+PiAgwqDCoMKg
IC0gaXB1dAo+Pj4+Pj4+ICDCoMKgwqDCoCAtIGYyZnNfZHJvcF9pbm9kZcKgIC8vIElfU1lOQyBz
ZXQKPj4+Pj4+PiAgwqDCoMKgwqDCoCAtIGYyZnNfZGVzdHJveV9leHRlbnRfbm9kZQo+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqAgLSBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUKPj4+Pj4+PiAgwqDCoMKgwqDC
oMKgwqAgLSB3aGlsZSAobm9kZV9jbnQpIHsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
d3JpdGVfbG9jaygmZXQtPmxvY2spCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnJl
ZV9leHRlbnRfdHJlZQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2so
JmV0LT5sb2NrKQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gX193cml0ZWJh
Y2tfc2luZ2xlX2lub2RlCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYy
ZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtCj4+Pj4+Pj4gZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGUKPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtCj4+Pj4+Pj4gX191cGRhdGVfZXh0ZW50X3Ry
ZWVfcmFuZ2UKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEZJ
X05PX0VYVEVOVCBub3QKPj4+Pj4+PiBzZXQsCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvLyBpbnNlcnQgbmV3IGV4dGVudAo+Pj4+Pj4+IG5vZGUKPj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgIH0gLy8gbm9kZV9jbnQgPT0gMCwgZXhpdCB3aGlsZQo+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfYnVnX29uKG5vZGVfY250KcKgIC8vIG5vZGVfY250ID4g
MAo+Pj4+Pj4+Cj4+Pj4+Pj4gQWRkaXRpb25hbGx5LCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5n
ZSgpIG9ubHkgY2hlY2tzCj4+Pj4+Pj4gRklfTk9fRVhURU5UIGZvcgo+Pj4+Pj4+IEVYX1JFQUQg
dHlwZSwgbGVhdmluZyBFWF9CTE9DS19BR0UgdXBkYXRlcyBjb21wbGV0ZWx5IHVucHJvdGVjdGVk
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBwYXRjaCBzZXQgRklfTk9fRVhURU5UIHVuZGVyIGV0LT5s
b2NrIGluCj4+Pj4+Pj4gX19kZXN0cm95X2V4dGVudF9ub2RlKCksCj4+Pj4+Pj4gY29uc2lzdGVu
dCB3aXRoIG90aGVyIGNhbGxlcnMgKF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlIGFuZAo+Pj4+
Pj4+IF9fZHJvcF9leHRlbnRfdHJlZSkgYW5kIGNoZWNrIEZJX05PX0VYVEVOVCBmb3IgYm90aCBF
WF9SRUFEIGFuZAo+Pj4+Pj4+IEVYX0JMT0NLX0FHRSB0cmVlLgo+Pj4+Pj4KPj4+Pj4+IEkgc3Vm
ZmVyZWQgYmVsb3cgdGVzdCBmYWlsdXJlLCB0aGVuIEkgYmlzZWN0IHRvIHRoaXMgY2hhbmdlLgo+
Pj4+Pj4KPj4+Pj4+ICDCoMKgwqDCoMKgIGdlbmVyaWMvNDc1wqAgODRzIC4uLiBbZmFpbGVkLCBl
eGl0IHN0YXR1cyAxXS0gb3V0cHV0IG1pc21hdGNoCj4+Pj4+PiAoc2VlIC8KPj4+Pj4+IHNoYXJl
L2dpdC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQpCj4+Pj4+PiAgwqDCoMKg
wqDCoCAtLS0gdGVzdHMvZ2VuZXJpYy80NzUub3V0wqDCoCAyMDI1LTAxLTEyIDIxOjU3OjQwLjI3
OTQ0MDY2NCArMDgwMAo+Pj4+Pj4gIMKgwqDCoMKgwqAgKysrIC9zaGFyZS9naXQvZnN0ZXN0cy9y
ZXN1bHRzLy9nZW5lcmljLzQ3NS5vdXQuYmFkIDIwMjYtMDQtMTcKPj4+Pj4+IDEyOjA4OjI4LjAw
MDAwMDAwMCArMDgwMAo+Pj4+Pj4gIMKgwqDCoMKgwqAgQEAgLTEsMiArMSw2IEBACj4+Pj4+PiAg
wqDCoMKgwqDCoMKgIFFBIG91dHB1dCBjcmVhdGVkIGJ5IDQ3NQo+Pj4+Pj4gIMKgwqDCoMKgwqDC
oCBTaWxlbmNlIGlzIGdvbGRlbi4KPj4+Pj4+ICDCoMKgwqDCoMKgICttb3VudDogL21udC9zY3Jh
dGNoX2YyZnM6IG1vdW50IHN5c3RlbSBjYWxsIGZhaWxlZDogU3RydWN0dXJlCj4+Pj4+PiBuZWVk
cwo+Pj4+Pj4gY2xlYW5pbmcuCj4+Pj4+PiAgwqDCoMKgwqDCoCArwqDCoMKgwqDCoMKgIGRtZXNn
KDEpIG1heSBoYXZlIG1vcmUgaW5mb3JtYXRpb24gYWZ0ZXIgZmFpbGVkIG1vdW50Cj4+Pj4+PiBz
eXN0ZW0KPj4+Pj4+IGNhbGwuCj4+Pj4+PiAgwqDCoMKgwqDCoCArbW91bnQgZmFpbGVkCj4+Pj4+
PiAgwqDCoMKgwqDCoCArKHNlZSAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy80
NzUuZnVsbCBmb3IgZGV0YWlscykKPj4+Pj4+ICDCoMKgwqDCoMKgIC4uLgo+Pj4+Pj4gIMKgwqDC
oMKgwqAgKFJ1biAnZGlmZiAtdSAvc2hhcmUvZ2l0L2ZzdGVzdHMvdGVzdHMvZ2VuZXJpYy80NzUu
b3V0IC8KPj4+Pj4+IHNoYXJlL2dpdC8KPj4+Pj4+IGZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy80
NzUub3V0LmJhZCfCoCB0byBzZWUgdGhlIGVudGlyZSBkaWZmKQo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+
PiAgwqDCoMKgwqDCoCBnZW5lcmljLzM4OMKgIDczcyAuLi4gW2ZhaWxlZCwgZXhpdCBzdGF0dXMg
MV0tIG91dHB1dCBtaXNtYXRjaAo+Pj4+Pj4gKHNlZSAvCj4+Pj4+PiBzaGFyZS9naXQvZnN0ZXN0
cy9yZXN1bHRzLy9nZW5lcmljLzM4OC5vdXQuYmFkKQo+Pj4+Pj4gIMKgwqDCoMKgwqAgLS0tIHRl
c3RzL2dlbmVyaWMvMzg4Lm91dMKgwqAgMjAyNS0wMS0xMiAyMTo1Nzo0MC4yNzU0NDA2MDIgKzA4
MDAKPj4+Pj4+ICDCoMKgwqDCoMKgICsrKyAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2Vu
ZXJpYy8zODgub3V0LmJhZCAyMDI2LTA0LTE3Cj4+Pj4+PiAxMTo1ODowNS4wMDAwMDAwMDAgKzA4
MDAKPj4+Pj4+ICDCoMKgwqDCoMKgIEBAIC0xLDIgKzEsNiBAQAo+Pj4+Pj4gIMKgwqDCoMKgwqDC
oCBRQSBvdXRwdXQgY3JlYXRlZCBieSAzODgKPj4+Pj4+ICDCoMKgwqDCoMKgwqAgU2lsZW5jZSBp
cyBnb2xkZW4uCj4+Pj4+PiAgwqDCoMKgwqDCoCArbW91bnQ6IC9tbnQvc2NyYXRjaF9mMmZzOiBt
b3VudCBzeXN0ZW0gY2FsbCBmYWlsZWQ6IFN0cnVjdHVyZQo+Pj4+Pj4gbmVlZHMKPj4+Pj4+IGNs
ZWFuaW5nLgo+Pj4+Pj4gIMKgwqDCoMKgwqAgK8KgwqDCoMKgwqDCoCBkbWVzZygxKSBtYXkgaGF2
ZSBtb3JlIGluZm9ybWF0aW9uIGFmdGVyIGZhaWxlZCBtb3VudAo+Pj4+Pj4gc3lzdGVtCj4+Pj4+
PiBjYWxsLgo+Pj4+Pj4gIMKgwqDCoMKgwqAgK2N5Y2xlIG1vdW50IGZhaWxlZAo+Pj4+Pj4gIMKg
wqDCoMKgwqAgKyhzZWUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvMzg4LmZ1
bGwgZm9yIGRldGFpbHMpCj4+Pj4+PiAgwqDCoMKgwqDCoCAuLi4KPj4+Pj4+ICDCoMKgwqDCoMKg
IChSdW4gJ2RpZmYgLXUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Rlc3RzL2dlbmVyaWMvMzg4Lm91dCAv
Cj4+Pj4+PiBzaGFyZS9naXQvCj4+Pj4+PiBmc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvMzg4Lm91
dC5iYWQnwqAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gIMKg
wqDCoMKgwqAgRjJGUy1mcyAoZG0tMCk6IHNhbml0eV9jaGVja19leHRlbnRfY2FjaGU6IGlub2Rl
IChpbm89MTc2MSkKPj4+Pj4+IGV4dGVudAo+Pj4+Pj4gaW5mbyBbMjIwMDU3LCA1NywgNl0gaXMg
aW5jb3JyZWN0LCBydW4gZnNjayB0byBmaXgKPj4+Pj4+Cj4+Pj4+PiBJIHN1c3BlY3Qgd2UgbWF5
IG1pc3MgYW55IGV4dGVudCB1cGRhdGVzIGFmdGVyIHdlIHNldCBGSV9OT19FWFRFTlQgaW4KPj4+
Pj4+IF9fZGVzdHJveV9leHRlbnRfbm9kZSgpLCByZXN1bHQgaW4gZmFpbGluZyBpbgo+Pj4+Pj4g
c2FuaXR5X2NoZWNrX2V4dGVudF9jYWNoZSgpLgo+Pj4+Pj4KPj4+Pj4+IENhbiB3ZSBqdXN0IHJl
bG9jYXRlIGYyZnNfYnVnX29uKG5vZGVfY250KSByYXRoZXIgdGhhbiBjb21wbGljYXRlZAo+Pj4+
Pj4gY2hhbmdlPwo+Pj4+Pj4gVGhvdWdodHM/Cj4+Pj4+Cj4+Pj4+IE9oLCBJIG92ZXJsb29rZWQg
bGFyZ2VzdCBleHRlbnQuIEhvdyBhYm91dCByZWxvY2F0ZQo+Pj4+PiBmMmZzX2J1Z19vbihub2Rl
X2NudCkgdG8gX19kZXN0cm95X2V4dGVudF90cmVlPwo+Pj4+Pgo+Pj4+PiBzdGF0aWMgdm9pZCBf
X2Rlc3Ryb3lfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgZW51bSBleHRlbnRfdHlw
ZQo+Pj4+PiB0eXBlKQo+Pj4+Pgo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGZyZWUgYWxs
IGV4dGVudCBpbmZvIGJlbG9uZyB0byB0aGlzIGV4dGVudCB0cmVlICovCj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqAgbm9kZV9jbnQgPSBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoaW5vZGUsIHR5cGUp
Owo+Pj4+PiArwqDCoMKgwqDCoMKgIGYyZnNfYnVnX29uKHNiaSwgYXRvbWljX3JlYWQoJmV0LT5u
b2RlX2NudCkpOwo+Pj4+Cj4+Pj4gIMKgIMKgwqDCoMKgLyogZnJlZSBhbGwgZXh0ZW50IGluZm8g
YmVsb25nIHRvIHRoaXMgZXh0ZW50IHRyZWUgKi8KPj4+PiAgwqAgwqDCoMKgwqBub2RlX2NudCA9
IF9fZGVzdHJveV9leHRlbnRfbm9kZShpbm9kZSwgdHlwZSk7Cj4+Pj4KPj4+PiAgwqAgwqDCoMKg
wqAvKiBkZWxldGUgZXh0ZW50IHRyZWUgZW50cnkgaW4gcmFkaXggdHJlZSAqLwo+Pj4+ICDCoCDC
oMKgwqDCoG11dGV4X2xvY2soJmV0aS0+ZXh0ZW50X3RyZWVfbG9jayk7Cj4+Pj4gIMKgIMKgwqDC
oMKgZjJmc19idWdfb24oc2JpLCBhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSk7wqAgPC0tLQo+
Pj4+Cj4+Pj4gT2gsIGl0IGhhcyBhbHJlYWR5IGNoZWNrZWQgbm9kZV9jbnQsIHNvLCBtYXliZSB3
ZSBjYW4ganVzdCByZW1vdmUgdGhlCj4+Pj4gY2hlY2sgaW4KPj4+PiBfX2Rlc3Ryb3lfZXh0ZW50
X25vZGUoKT8KPj4+Cj4+PiBZZXMuIEJUVywgaXMgaXQgY29ycmVjdCB0byByZW1vdmUgdGhlIGNh
bGwgdG8gZjJmc19kZXN0cm95X2V4dGVudF9ub2RlKCkKPj4+IGluIGYyZnNfZHJvcF9pbm9kZSgp
PyBJdCBzZWVtcyB0aGlzIGNhbGwgaXMgdW5uZWNlc3NhcnksIHNpbmNlCj4+PiBmMmZzX2V2aWN0
X2lub2RlKCkgd2lsbCBldmVudHVhbGx5IGRlbGV0ZSBhbGwgZXh0ZW50IG5vZGVzIHByb3Blcmx5
Lgo+Pgo+PiBJIHRoaW5rIGl0J3MgZmluZSB0byBrZWVwIGl0IGFjY29yZGluZyB0byBvcmlnaW5h
bCBpbnRlbnRpb24gImRlc3Ryb3kKPj4gZXh0ZW50X3RyZWUgZm9yIHRoZSB0cnVuY2F0aW9uIGNh
c2UiIGludHJvZHVjZWQgZnJvbSAzZTcyZjcyMTM5MGQKPj4gKCJmMmZzOiB1c2UgZXh0ZW50X2Nh
Y2hlIGJ5IGRlZmF1bHQiKS4gSXQgaGVscHMgdGhlIHBlcmZvcm1hbmNlIHcvCj4+IGluIGJhdGNo
IGV4dGVudCBub2RlIHJlbGVhc2UuCj4gCj4gT2gsIEkgc2VlLiBUaGlzIHBhdGNoIGhhcyBhbHJl
YWR5IGJlZW4gbWVyZ2VkIGludG8gdGhlIGRldiBicmFuY2guIFdoaWNoCj4gb2YgdGhlIGZvbGxv
d2luZyBhcHByb2FjaGVzIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGU/Cj4gMS4gRHJvcCB0aGUg
Y3VycmVudCBwYXRjaCBmcm9tIHRoZSBkZXYgYnJhbmNoLCB0aGVuIHN1Ym1pdCBhIHBhdGNoIHRv
Cj4gcmVtb3ZlIHRoZSBmMmZzX2J1Z19vbigpIGluIF9fZGVzdHJveV9leHRlbnRfbm9kZS4KPiAy
LiBTZW5kIHR3byBwYXRjaGVzOiB0aGUgZmlyc3QgcmV2ZXJ0cyB0aGUgY2hhbmdlLCBhbmQgdGhl
IHNlY29uZAo+IHJlbW92ZXMgdGhlIGYyZnNfYnVnX29uKCkgaW4gX19kZXN0cm95X2V4dGVudF9u
b2RlKCkuCgpJdCdzIG5lYXIgdGhlIGVuZCBvZiBtZXJnZSB3aW5kb3csIEkgdGhpbmsgd2UgbmVl
ZCB0byBrZWVwIGRldiBhcwppdCBpcywgYW5kIGNyZWF0ZSBhbm90aGVyIHBhdGNoIHRvIHJldmVy
dCBwcmV2aW91cyBjaGFuZ2UgYW5kIGRyb3AKdGhlIGYyZnNfYnVnX29uKCkgYXMgd2VsbCwgd2hh
dCBkbyB5b3UgdGhpbms/CgpUbyBKYWVnZXVrLCB0aG91Z2h0cz8KClRoYW5rcywKCj4gCj4gVGhh
bmtzCj4gWW9uZ3BlbmcsCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBUaGFua3MKPj4+IFlv
bmdwZW5nLAo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5r
cwo+Pj4+PiBZb25ncGVuZywKPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+
Pj4+Cj4+Pj4+Pj4gRml4ZXM6IDNmYzVkNWExODJmNiAoImYyZnM6IGZpeCB0byBzaHJpbmsgcmVh
ZCBleHRlbnQgbm9kZSBpbgo+Pj4+Pj4+IGJhdGNoZXMiKQo+Pj4+Pj4+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gIMKgwqDCoCBmcy9mMmZzL2V4
dGVudF9jYWNoZS5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KPj4+Pj4+PiAgwqDCoMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9j
YWNoZS5jCj4+Pj4+Pj4gaW5kZXggMGVkODRjYzA2NWE3Li44NzE2OWZkMjlkODkgMTAwNjQ0Cj4+
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZXh0ZW50X2NhY2hlLmMKPj4+Pj4+PiBAQCAtMTE5LDkgKzExOSwxMCBAQCBzdGF0aWMgYm9vbCBf
X21heV9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUKPj4+Pj4+PiAqaW5vZGUsIGVudW0gZXh0ZW50
X3R5cGUgdHlwZSkKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgaWYgKCFfX2luaXRfbWF5X2V4dGVu
dF90cmVlKGlub2RlLCB0eXBlKSkKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gZmFsc2U7Cj4+Pj4+Pj4gIMKgwqDCoCArwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfTk9fRVhURU5UKSkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNl
Owo+Pj4+Pj4+ICsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgaWYgKHR5cGUgPT0gRVhfUkVBRCkg
ewo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJ
X05PX0VYVEVOVCkpCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNl
Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChp
bm9kZSwgRklfQ09NUFJFU1NFRF9GSUxFKSAmJgo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICFmMmZzX3NiX2hhc19yZWFkb25seShGMkZTX0lfU0IoaW5v
ZGUpKSkKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxz
ZTsKPj4+Pj4+PiBAQCAtNjQ0LDYgKzY0NSw4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19kZXN0
cm95X2V4dGVudF9ub2RlKHN0cnVjdAo+Pj4+Pj4+IGlub2RlICppbm9kZSwKPj4+Pj4+PiAgwqDC
oMKgIMKgwqDCoMKgwqAgd2hpbGUgKGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKSB7Cj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRF
TlQpKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2Rl
LCBGSV9OT19FWFRFTlQpOwo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGVfY250
ICs9IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0LCBucl9zaHJpbmspOwo+Pj4+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+Pj4+Pj4+ICDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gQEAgLTY4OCwxMiArNjkxLDEyIEBAIHN0YXRpYyB2b2lkIF9f
dXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdAo+Pj4+Pj4+IGlub2RlICppbm9kZSwKPj4+
Pj4+PiAgwqDCoMKgIMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+Pj4+Pj4+ICDC
oMKgwqAgLcKgwqDCoCBpZiAodHlwZSA9PSBFWF9SRUFEKSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkgewo+Pj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+Pj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
fQo+Pj4+Pj4+ICvCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRF
TlQpKSB7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4g
IMKgwqDCoCArwqDCoMKgIGlmICh0eXBlID09IEVYX1JFQUQpIHsKPj4+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwcmV2ID0gZXQtPmxhcmdlc3Q7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGVpLmxlbiA9IDA7Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4gCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
