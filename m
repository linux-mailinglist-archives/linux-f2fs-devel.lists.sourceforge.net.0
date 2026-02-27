Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMeiHJNLoWkKsAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 08:45:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9C1B40FF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 08:45:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3IaJ1lmpnDNLoMLgHDqbzBs0bupEipLVSOwBi5MBcA=; b=eG/kUNu3fJKDAilVWc58LsQ19U
	4izduWQjbPNJIt93SlUJBVMhAfWsE4nsniTTXX1p3QTqaknX1UWbjkjxtyINwXzYWfEWvBkfjDVT5
	y/KTPqsCPxo+5qItsQIOsvokR7eFPR+vr1DVOiXOqkAeeBrMmnXSlfwsuitsd4NnFmo8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvsXC-0005ow-JB;
	Fri, 27 Feb 2026 07:45:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vvsXB-0005oq-FS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOnIK88N45fN9Rvid+wFBeuoaHpgfCLg/k7dw5EYJX8=; b=UAluFkSTH5xea+74r/oL3d2i7J
 7OwN+tCyvs5SRlAZ0YjlR5Zp15JymzUNhGNJnMG/oKYJkSjSizDtbFZ0WNZ8UebPewZbvDVtJN/FN
 FgHytvgjjYV+IsGLBDGfqMEE/mmGGk8NbpQaWfRJ8hY80I+nv8pwYivrRAaLhzz95oHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOnIK88N45fN9Rvid+wFBeuoaHpgfCLg/k7dw5EYJX8=; b=lA71t5og8caGwTsWye9zsxemkP
 RttY6NOeXoJvoMdlYvWj+woitGZBZI14hz7dzwyOBgZTwC8xMZ60lJzvsmfhPXn6ucFP0w6aVyaIu
 Lxk8IOkad+4UfjTZOaMz0blNctAfhgPKUb0t5QfS/faobHAZxT/WkZLT7ztBrNOD0LNo=;
Received: from mail3-164.sinamail.sina.com.cn ([202.108.3.164])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvsXB-0004fA-6q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772178313; bh=uOnIK88N45fN9Rvid+wFBeuoaHpgfCLg/k7dw5EYJX8=;
 h=Message-ID:Date:Subject:From;
 b=oPoGXUKGPz+vlT7nlZFECkUdmWawT77rpKSz3+3AjYx0ReIRSmIjweo3JNfdJFYOj
 EJOJAn8Rh28qV+PENmyxohaIK+46KLO+4SyDAp92ii+yVs+EBAgp+vEpOindjWxUu/
 y5NR8AxTp6+YW5U0aVqRD8skGszgmDqyjVhEWMkQ=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69A14B7900001514; Fri, 27 Feb 2026 15:44:59 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 3797884456623
X-SMAIL-UIID: 7990E26ACC664A759E0DE7294D05273A-20260227-154459-1
Message-ID: <d6fbea59-1212-4426-898e-e9f436bd5972@sina.com>
Date: Fri, 27 Feb 2026 15:44:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <20260203133635.3942502-5-monty_pavel@sina.com> <aZ0rNWT8kvhVlID5@google.com>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <aZ0rNWT8kvhVlID5@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/24/26 12:38, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > On 02/03, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> f2fs_fiemap()
 calls f2fs_map_blocks() to obtain the block mapping a >> file, a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vvsXB-0004fA-6q
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,syzkaller.appspot.com:url,sina.com:mid]
X-Rspamd-Queue-Id: 3EF9C1B40FF
X-Rspamd-Action: no action

T24gMi8yNC8yNiAxMjozOCwgSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6
Cj4gT24gMDIvMDMsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5nIFlhbmcg
PHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBmMmZzX2ZpZW1hcCgpIGNhbGxzIGYyZnNf
bWFwX2Jsb2NrcygpIHRvIG9idGFpbiB0aGUgYmxvY2sgbWFwcGluZyBhCj4+IGZpbGUsIGFuZCB0
aGVuIG1lcmdlcyBjb250aWd1b3VzIG1hcHBpbmdzIGludG8gZXh0ZW50cy4gSWYgdGhlIG1hcHBp
bmcKPj4gaXMgZm91bmQgaW4gdGhlIHJlYWQgZXh0ZW50IGNhY2hlLCBub2RlIGJsb2NrcyBkbyBu
b3QgbmVlZCB0byBiZSByZWFkLgo+PiBIb3dldmVyLCBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlv
LCBhIGNvbnRpZ3VvdXMgZXh0ZW50IGNhbiBiZSBzcGxpdAo+PiBpbnRvIHR3byBleHRlbnRzOgo+
Pgo+PiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0g
Y291bnQ9NCAmJiBzeW5jCj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9
ZGF0YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MiBjb252PW5vdHJ1bmMgJiYgc3luYwo+PiByb290
QHZtOi9tbnQvZjJmcyMgZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzICMgZHJvcCAy
TX40TSBleHRlbnQgY2FjaGUKPj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBv
Zj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0wIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4+IHJv
b3RAdm06L21udC9mMmZzIyBmMmZzX2lvIGZpZW1hcCAwIDEwMjQgZGF0YS40TQo+PiBGaWVtYXA6
IG9mZnNldCA9IDAgbGVuID0gMTAyNAo+PiBsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIu
ICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+PiAwCTAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
NjQwMDAwMCAwMDAwMDAwMDAwMjAwMDAwIDAwMDAxMDAwCj4+IDEJMDAwMDAwMDAwMDIwMDAwMCAw
MDAwMDAwMDA2NjAwMDAwIDAwMDAwMDAwMDAyMDAwMDAgMDAwMDEwMDEKPj4KPj4gQWx0aG91Z2gg
dGhlIHBoeXNpY2FsIGFkZHJlc3NlcyBvZiB0aGUgcmFuZ2VzIDDvvZ4yTUIgYW5kIDJN772eNE1C
IGFyZQo+PiBjb250aWd1b3VzLCB0aGUgbWFwcGluZyBmb3IgdGhlIDJN772eNE1CIHJhbmdlIGlz
IG5vdCBwcmVzZW50IGluIG1lbW9yeS4KPj4gV2hlbiB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIGZv
ciB0aGUgMO+9njJNQiByYW5nZSBhcmUgdXBkYXRlZCwgbm8gbWVyZ2UKPj4gaGFwcGVucyBiZWNh
dXNlIHRoZSBhZGphY2VudCBtYXBwaW5nIGlzIG1pc3NpbmcgZnJvbSB0aGUgaW4tbWVtb3J5Cj4+
IGNhY2hlLiBBcyBhIHJlc3VsdCwgZmllbWFwIHJlcG9ydHMgdHdvIHNlcGFyYXRlIGV4dGVudHMg
aW5zdGVhZCBvZiBhCj4+IHNpbmdsZSBjb250aWd1b3VzIG9uZS4KPj4KPj4gVGhlIHJvb3QgY2F1
c2UgaXMgdGhhdCB0aGUgcmVhZCBleHRlbnQgY2FjaGUgZG9lcyBub3QgZ3VhcmFudGVlIHRoYXQg
YWxsCj4+IGJsb2NrcyBvZiBhbiBleHRlbnQgYXJlIHByZXNlbnQgaW4gbWVtb3J5LiBUaGVyZWZv
cmUsIHdoZW4gdGhlIGV4dGVudAo+PiBsZW5ndGggcmV0dXJuZWQgYnkgZjJmc19tYXBfYmxvY2tz
X2NhY2hlZCgpIGlzIHNtYWxsZXIgdGhhbiBtYXhibG9ja3MsCj4+IHRoZSByZW1haW5pbmcgbWFw
cGluZ3MgYXJlIHJldHJpZXZlZCB2aWEgZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgpIHRvCj4+IGVu
c3VyZSBjb3JyZWN0IGZpZW1hcCBleHRlbnQgYm91bmRhcnkgaGFuZGxpbmcuCj4+Cj4+IEZpeGVz
OiBjZDhmYzUyMjZiZWYgKCJmMmZzOiByZW1vdmUgdGhlIGNyZWF0ZSBhcmd1bWVudCB0byBmMmZz
X21hcF9ibG9ja3MiKQo+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3Bl
bmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+ICBmcy9mMmZzL2RhdGEuYyB8IDE0ICsrKysrKysrKysr
Ky0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5k
ZXggNDJmMTVmZDljNjhlLi5lZWRhZGNjZjg2YmIgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0
YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0xNjIzLDggKzE2MjMsMTggQEAgaW50
IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxv
Y2tzICptYXAsIGludCBmbGFnKQo+PiAgCWxmc19kaW9fd3JpdGUgPSAoZmxhZyA9PSBGMkZTX0dF
VF9CTE9DS19ESU8gJiYgZjJmc19sZnNfbW9kZShzYmkpICYmCj4+ICAJCQkJbWFwLT5tX21heV9j
cmVhdGUpOwo+PiAgCj4+IC0JaWYgKCFtYXAtPm1fbWF5X2NyZWF0ZSAmJiBmMmZzX21hcF9ibG9j
a3NfY2FjaGVkKGlub2RlLCBtYXAsIGZsYWcpKQo+PiAtCQlnb3RvIG91dDsKPj4gKwlpZiAoIW1h
cC0+bV9tYXlfY3JlYXRlKSB7Cj4+ICsJCWlmIChmMmZzX21hcF9ibG9ja3NfY2FjaGVkKGlub2Rl
LCBtYXAsIGZsYWcpKSB7Cj4+ICsJCQlpZiAobWFwLT5tX2xlbiA9PSBtYXhibG9ja3MpCj4+ICsJ
CQkJZ290byBvdXQ7Cj4+ICsJCQllbHNlIHsKPj4gKwkJCQlwZ29mcyA9CShwZ29mZl90KW1hcC0+
bV9sYmxrICsgbWFwLT5tX2xlbjsKPj4gKwkJCQllbmQgPSBtYXAtPm1fbGJsayArIG1heGJsb2Nr
czsKPj4gKwkJCQlvZnMgPSBtYXAtPm1fbGVuOwo+PiArCQkJCWdvdG8gbmV4dF9kbm9kZTsKPj4g
KwkJCX0KPj4gKwkJfQo+PiArCX0KPiAKPiBUaGlzIHBhdGNoIG1ha2VzIGEgc3lzdGVtIHBhbmlj
LgoKSSBoYXZlIGRvbmUgc29tZSB0ZXN0aW5nIGFuZCBvbmx5IG9ic2VydmVkIHRoZSBwYW5pYyBp
biB0aGUKZjJmc193cml0ZV9lbmRfaW8oKSBwYXRoLiBTeXpib3QgaGFzIGFsc28gcmVwb3J0ZWQg
aXQ6Cmh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD02ZTRjYjFjYWM1ZWZj
OTZlYTBjYQpNeSBwcm9wb3NlZCBmaXggaXMgaGVyZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwMjI3MDczMDUyLjM5NDA5NTgtMi1tb250eV9wYXZlbEBzaW5hLmNvbS8KCklzIHRo
aXMgdGhlIHNhbWUgaXNzdWU/CgpUaGFua3MKWW9uZ3BlbmcsCgo+IAo+PiAgCj4+ICAJbWFwLT5t
X2JkZXYgPSBpbm9kZS0+aV9zYi0+c19iZGV2Owo+PiAgCW1hcC0+bV9tdWx0aWRldl9kaW8gPQo+
PiAtLSAKPj4gMi40My4wCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
