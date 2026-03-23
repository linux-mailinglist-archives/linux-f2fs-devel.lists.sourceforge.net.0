Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK9qNPb8wGmiPQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 09:42:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 886832EE65D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 09:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDNsZsdXHQAS9aGxkuSPSOyV8Hr37R1kt/2FMQziFLU=; b=CO5qgEH6p+1G+TFUY9lqQYs5rk
	9gtgM4kkZXK/C3XznZkJMqpzWuYebDSdueqkhIEUstykmOuM3tPXlPcSiEoL8FJ/qucu7ThdLtuwo
	5u/vUETOm7fKPeR9N6K2DjJ3lIL+bLaHFuCtBthxHxnhGLoeVYBZc0FKheFDuG+HVGLA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4arh-0000Bl-P0;
	Mon, 23 Mar 2026 08:42:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w4arW-00006m-Bw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 08:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3U0t5j7Gh02lMHTMdPmfFlfZmwjO87cfCryHjQ/uLAI=; b=S/VgY0gJK/tF7e96YhArPQacuK
 /Ape9wtF8V7tH1lFGaPvQH3JD7VR6tzdZn8PH0x5hXQcitnzvk9hhnZrRABqwl8DmJ+D27qub5Ook
 1jdIAipp38hjHdapk9ViAKsfzQv9ZITApAAPQ8rYDy2u/7/f/RMTyxXTRvK8VgSHSXoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3U0t5j7Gh02lMHTMdPmfFlfZmwjO87cfCryHjQ/uLAI=; b=k/uhwde1wdHgspLLO0AnPNsmV+
 No3uQXC+38S4K2Sf6g1wDmP4n1zqR1DAqbSHuj4/TG1KXt2rFierwKaOm42u1R6El4k0hGsatGhih
 QYRwWwxbWYYHqV6gZ4oWvzc+OBocMFdfiV7X2TZUvYZn7Fl0ZX3isPvjk2BaQ8aSdA0I=;
Received: from smtp153-162.sina.com.cn ([61.135.153.162])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4arU-0005MW-RA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 08:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1774255333; bh=3U0t5j7Gh02lMHTMdPmfFlfZmwjO87cfCryHjQ/uLAI=;
 h=Message-ID:Date:Subject:From;
 b=S3yBTTSBmQSqsu+rOTTOsQsBSedvYPKhsSetFQQ2n3340DA8+17ZJqVLBko7gfSc7
 5gPcBSXf8lvVDpc/sW/AmG7q7UL62AlwammPX8GuoHA8eDBSvYyq/+8K0lxjU7+D5y
 NTwch3PsaUpC9poUqOFUYL5VwAhnXbTX15Y78DDo=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 69C0FCD90000709D; Mon, 23 Mar 2026 16:42:03 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 7437296816410
X-SMAIL-UIID: 352C79A520534D72A959F2F0767398CE-20260323-164203-1
Message-ID: <4fa623df-5ccc-4635-82da-31a9f2a3a1a7@sina.com>
Date: Mon, 23 Mar 2026 16:42:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319132607.686096-2-monty_pavel@sina.com>
 <20260319132607.686096-4-monty_pavel@sina.com>
 <03e452c8-b68e-4132-a5d2-aa1300673231@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <03e452c8-b68e-4132-a5d2-aa1300673231@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/26 11:28, Chao Yu via Linux-f2fs-devel wrote: > On
 3/19/26 21:26, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> f2fs_fiemap()
 calls f2fs_map_blocks() to obtain the block mapping a >> fi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w4arU-0005MW-RA
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix fiemap boundary handling
 when read extent cache is incomplete
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,sina.com:mid]
X-Rspamd-Queue-Id: 886832EE65D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDMvMjMvMjYgMTE6MjgsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMy8xOS8yNiAyMToyNiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gRnJvbTogWW9uZ3Blbmcg
WWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Cj4+IGYyZnNfZmllbWFwKCkgY2FsbHMg
ZjJmc19tYXBfYmxvY2tzKCkgdG8gb2J0YWluIHRoZSBibG9jayBtYXBwaW5nIGEKPj4gZmlsZSwg
YW5kIHRoZW4gbWVyZ2VzIGNvbnRpZ3VvdXMgbWFwcGluZ3MgaW50byBleHRlbnRzLiBJZiB0aGUg
bWFwcGluZwo+PiBpcyBmb3VuZCBpbiB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIG5vZGUgYmxvY2tz
IGRvIG5vdCBuZWVkIHRvIGJlIHJlYWQuCj4+IEhvd2V2ZXIsIGluIHRoZSBmb2xsb3dpbmcgc2Nl
bmFyaW8sIGEgY29udGlndW91cyBleHRlbnQgY2FuIGJlIHNwbGl0Cj4+IGludG8gdHdvIGV4dGVu
dHM6Cj4+Cj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBi
cz0xTSBjb3VudD00ICYmIHN5bmMKPj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVy
byBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0yIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4+
IHJvb3RAdm06L21udC9mMmZzIyBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMgIyBk
cm9wIDJNfjRNIGV4dGVudCBjYWNoZQo+PiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rldi96
ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTAgY29udj1ub3RydW5jICYmIHN5bmMK
Pj4gcm9vdEB2bTovbW50L2YyZnMjIGYyZnNfaW8gZmllbWFwIDAgMTAyNCBkYXRhLjRNCj4+IEZp
ZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxMDI0Cj4+IGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwg
YWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+IDAJMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDA2NDAwMDAwIDAwMDAwMDAwMDAyMDAwMDAgMDAwMDEwMDAKPj4gMQkwMDAwMDAwMDAwMjAw
MDAwIDAwMDAwMDAwMDY2MDAwMDAgMDAwMDAwMDAwMDIwMDAwMCAwMDAwMTAwMQo+IAo+IFdlbGws
IEkgY2FuIG5vdCByZXByb2R1Y2UgdGhpcyB3LyBhYm92ZSBzY3JpcHRzLCBjYW4geW91IHBsZWFz
ZSBjaGVjawo+IHRoYXQ/IGFueXdheSwgdGhlIGNvZGUgcGFydCBsb29rcyBmaW5lIHRvIG1lLgoK
U29ycnkgZm9yIG9taXR0aW5nIHRvbyBtYW55IGRldGFpbHMgZWFybGllci4gVGhlIGZ1bGwgc2Ny
aXB0cyBJIHVzZWQgdG8KcmVwcm9kdWNlIHRoZSBpc3N1ZSBpcyBhcyBiZWxvdy4gVGhlIGJhc2lj
IGlkZWEgaXMgdG8gbWFrZQpnZXRfbmV3X3NlZ21lbnQoKSBhbHdheXMgc3RhcnQgc2Nhbm5pbmcg
ZnJvbSBzZWN0aW9uICMwIGZvciBlYWNoCmFsbG9jYXRpb24sIGFuZCB0byBhbGxvY2F0ZSBoaWdo
ZXIgYWRkcmVzc2VzIGZpcnN0LCBmb2xsb3dlZCBieSBsb3dlcgphZGRyZXNzZXMuCgpkZCBpZj0v
ZGV2L3plcm8gb2Y9ZGF0YS4xMjhNIGJzPTFNIGNvdW50PTEyOApsb3NldHVwIC1mIGRhdGEuMTI4
TQpta2ZzLmYyZnMgL2Rldi9sb29wMCAtZgptb3VudCAtbyBtb2RlPWxmcyAvZGV2L2xvb3AwIC9t
bnQvZjJmcy8KY2QgL21udC9mMmZzLwpkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS43Mk0gYnM9MU0g
Y291bnQ9NzIgJiYgc3luYwpkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD00
ICYmIHN5bmMKZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTIg
Y29udj1ub3RydW5jICYmIHN5bmMKZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCmRk
IGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0wIGNvbnY9bm90cnVu
YyAmJiBzeW5jCmRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0w
IGNvbnY9bm90cnVuYyAmJiBzeW5jCmYyZnNfaW8gZmllbWFwIDAgMTAyNCBkYXRhLjRNCgpUaGFu
a3MKWW9uZ3BlbmcsCgo+IAo+IFRoYW5rcywKPiAKPj4KPj4gQWx0aG91Z2ggdGhlIHBoeXNpY2Fs
IGFkZHJlc3NlcyBvZiB0aGUgcmFuZ2VzIDDvvZ4yTUIgYW5kIDJN772eNE1CIGFyZQo+PiBjb250
aWd1b3VzLCB0aGUgbWFwcGluZyBmb3IgdGhlIDJN772eNE1CIHJhbmdlIGlzIG5vdCBwcmVzZW50
IGluIG1lbW9yeS4KPj4gV2hlbiB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIGZvciB0aGUgMO+9njJN
QiByYW5nZSBhcmUgdXBkYXRlZCwgbm8gbWVyZ2UKPj4gaGFwcGVucyBiZWNhdXNlIHRoZSBhZGph
Y2VudCBtYXBwaW5nIGlzIG1pc3NpbmcgZnJvbSB0aGUgaW4tbWVtb3J5Cj4+IGNhY2hlLiBBcyBh
IHJlc3VsdCwgZmllbWFwIHJlcG9ydHMgdHdvIHNlcGFyYXRlIGV4dGVudHMgaW5zdGVhZCBvZiBh
Cj4+IHNpbmdsZSBjb250aWd1b3VzIG9uZS4KPj4KPj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB0
aGUgcmVhZCBleHRlbnQgY2FjaGUgZG9lcyBub3QgZ3VhcmFudGVlIHRoYXQgYWxsCj4+IGJsb2Nr
cyBvZiBhbiBleHRlbnQgYXJlIHByZXNlbnQgaW4gbWVtb3J5LiBUaGVyZWZvcmUsIHdoZW4gdGhl
IGV4dGVudAo+PiBsZW5ndGggcmV0dXJuZWQgYnkgZjJmc19tYXBfYmxvY2tzX2NhY2hlZCgpIGlz
IHNtYWxsZXIgdGhhbiBtYXhibG9ja3MsCj4+IHRoZSByZW1haW5pbmcgbWFwcGluZ3MgYXJlIHJl
dHJpZXZlZCB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgpIHRvCj4+IGVuc3VyZSBjb3JyZWN0
IGZpZW1hcCBleHRlbnQgYm91bmRhcnkgaGFuZGxpbmcuCj4+Cj4+IENjOiBzdGFibGVAa2VybmVs
Lm9yZwo+PiBGaXhlczogY2Q4ZmM1MjI2YmVmICgiZjJmczogcmVtb3ZlIHRoZSBjcmVhdGUgYXJn
dW1lbnQgdG8gZjJmc19tYXBfYmxvY2tzIikKPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFu
ZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+IC0tLQo+PiB2MzoKPj4gLSBDYyB0byBzdGFi
bGUga2VybmVsLgo+PiB2MjoKPj4gLSBGaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGNhdXNl
ZCBieSBtYXAtPm1fbXVsdGlkZXZfZGlvLgo+PiAtIFJlZHVjZSBjYWxscyB0byBmMmZzX2dldF9k
bm9kZV9vZl9kYXRhKCkuCj4+IC0tLQo+PiAgZnMvZjJmcy9kYXRhLmMgfCAyNSArKysrKysrKysr
KysrKysrKysrKysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMKPj4gaW5kZXggOWU0ZGI2ZjA1MDhhLi5hMjEwYTdhNjI3YzYgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0xNjM3LDggKzE2
MzcsMjYgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
ZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+PiAgCWxmc19kaW9fd3JpdGUgPSAoZmxh
ZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYgZjJmc19sZnNfbW9kZShzYmkpICYmCj4+ICAJCQkJ
bWFwLT5tX21heV9jcmVhdGUpOwo+PiAgCj4+IC0JaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSAmJiBm
MmZzX21hcF9ibG9ja3NfY2FjaGVkKGlub2RlLCBtYXAsIGZsYWcpKQo+PiAtCQlnb3RvIG91dDsK
Pj4gKwlpZiAoIW1hcC0+bV9tYXlfY3JlYXRlICYmIGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoaW5v
ZGUsIG1hcCwgZmxhZykpIHsKPj4gKwkJc3RydWN0IGV4dGVudF9pbmZvIGVpOwo+PiArCj4+ICsJ
CS8qCj4+ICsJCSAqIDEuIElmIG1hcC0+bV9tdWx0aWRldl9kaW8gaXMgdHJ1ZSwgbWFwLT5tX3Bi
bGsgY2Fubm90IGJlCj4+ICsJCSAqIHdhaXR0ZWQgYnkgZjJmc193YWl0X29uX2Jsb2NrX3dyaXRl
YmFja19yYW5nZSgpIGFuZCBhcmUgbm90Cj4+ICsJCSAqIG1lcmdlYWJsZS4KPj4gKwkJICogMi4g
SWYgcGdvZnMgaGl0cyB0aGUgcmVhZCBleHRlbnQgY2FjaGUsIGl0IG1lYW5zIHRoZSBtYXBwaW5n
Cj4+ICsJCSAqIGlzIGFscmVhZHkgY2FjaGVkIGluIHRoZSBleHRlbnQgY2FjaGUsIGJ1dCBpdCBp
cyBub3QKPj4gKwkJICogbWVyZ2VhYmxlLCBhbmQgdGhlcmUgaXMgbm8gbmVlZCB0byBxdWVyeSB0
aGUgbWFwcGluZyBhZ2Fpbgo+PiArCQkgKiB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgpLgo+
PiArCQkgKi8KPj4gKwkJcGdvZnMgPQkocGdvZmZfdCltYXAtPm1fbGJsayArIG1hcC0+bV9sZW47
Cj4+ICsJCWlmIChtYXAtPm1fbGVuID09IG1heGJsb2NrcyB8fAo+PiArCQkJbWFwLT5tX211bHRp
ZGV2X2RpbyB8fAo+PiArCQkJZjJmc19sb29rdXBfcmVhZF9leHRlbnRfY2FjaGUoaW5vZGUsIHBn
b2ZzLCAmZWkpKQo+PiArCQkJZ290byBvdXQ7Cj4+ICsJCW9mcyA9IG1hcC0+bV9sZW47Cj4+ICsJ
CWdvdG8gbWFwX21vcmU7Cj4+ICsJfQo+PiAgCj4+ICAJbWFwLT5tX2JkZXYgPSBpbm9kZS0+aV9z
Yi0+c19iZGV2Owo+PiAgCW1hcC0+bV9tdWx0aWRldl9kaW8gPQo+PiBAQCAtMTY0OSw3ICsxNjY3
LDggQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJm
c19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+PiAgCj4+ICAJLyogaXQgb25seSBzdXBwb3J0
cyBibG9jayBzaXplID09IHBhZ2Ugc2l6ZSAqLwo+PiAgCXBnb2ZzID0JKHBnb2ZmX3QpbWFwLT5t
X2xibGs7Cj4+IC0JZW5kID0gcGdvZnMgKyBtYXhibG9ja3M7Cj4+ICttYXBfbW9yZToKPj4gKwll
bmQgPSAocGdvZmZfdCltYXAtPm1fbGJsayArIG1heGJsb2NrczsKPj4gIAo+PiAgCWlmIChmbGFn
ID09IEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKQo+PiAgCQltb2RlID0gTE9PS1VQX05PREVfUkE7
Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
