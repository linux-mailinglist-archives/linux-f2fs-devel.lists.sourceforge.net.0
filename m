Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF86DD4E0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 10:14:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm994-0005AD-A7;
	Tue, 11 Apr 2023 08:14:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pm992-0005A5-UH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k7sHpHCCYMUBkLrD6mmEeR6OQIpy9GhlbhOMlisCE7U=; b=a33gWAFYAfF7FxbR9AtkrzB/e8
 6QVyQiKAkwy4KJK3TdbEb1PBZlu+NWD4SKjZ6XJF9WCzoKqqTQJkftVfK2SAiXFxaF87Kh7YoeP9O
 wqzH9HHGPZnhe7CFdAdJoJEXKz8QEvBkyiENwIA/7pfApAIVi/KRIRcvtcS1coeXJ1NE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k7sHpHCCYMUBkLrD6mmEeR6OQIpy9GhlbhOMlisCE7U=; b=jQAAHUNRESL4TByCxz1V1Z2hZu
 XwQ0db/QZXANUz95E8om7/rnSMVWZQZkIJkkbhHIbxQZT5Hvmjj67rkBMjv1dM/hc2guxl8eLpOCf
 aWPUe24OJAmug2Q35N1U8iUjnZiBNJS+2JmXWaxRQSggACOw2i0uoUtCJ+N6KNt/DBIc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm991-0001Mm-TV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:14:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC6DA61BB3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 08:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A11C433D2;
 Tue, 11 Apr 2023 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681200861;
 bh=vJBK6C5ZuJ6A5e6j1DfsjQOW7O+Z+ViMotqjJS2EuUE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KOIQLwmQ2ZVlFB1a0dNjUGn36Gu0GkpeFs5U+hJg7nzxoIh1u2btinWig/X3EguwG
 VOCGh2R4fXkTO4jsL8c6VsaBXl7by1vAidRdmFFPE77ASdGqHkNrFSN5whuCroeVyu
 v/wrd/24DXc5moygc5x000aEk/4EYg8kXTR0Shfe7kiTbCbZF+3SecI3Kj/WLh3aGx
 ki63jzc11oeg1UOVPW8DYUwEtE1G+grhSwYWuE5so4kyCcTGpmmPrpHp9KyF+l9Nvp
 hWMbuzkJkpDl/eHI9dgv6I2z6UhNW/qI4EcNdCH+b9A+uwCCOBcNki51sAUK6IBqRg
 z23jP5/KJ+boQ==
Message-ID: <538fd229-28ae-0ec5-ef07-35d505fbb8a9@kernel.org>
Date: Tue, 11 Apr 2023 16:14:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
 <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
 <ZDROBJFxSUdGaqAa@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDROBJFxSUdGaqAa@google.com>
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/11 1:57, Jaegeuk Kim wrote: > On 04/08, Chao Yu
 wrote: >> On 2023/4/8 4:59, Jaegeuk Kim wrote: >>> This breaks generic/009?
 >> >> I guess it is as expected? >> >> Please check description of [...] 
 Content analysis details:   (-7.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pm991-0001Mm-TV
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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

T24gMjAyMy80LzExIDE6NTcsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA0LzA4LCBDaGFvIFl1
IHdyb3RlOgo+PiBPbiAyMDIzLzQvOCA0OjU5LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IFRoaXMg
YnJlYWtzIGdlbmVyaWMvMDA5Pwo+Pgo+PiBJIGd1ZXNzIGl0IGlzIGFzIGV4cGVjdGVkPwo+Pgo+
PiBQbGVhc2UgY2hlY2sgZGVzY3JpcHRpb24gb2YgZmllbWFwIGlvY3RsIG1hbnVhbCBmcm9tIFsx
XToKPj4KPj4gRklFTUFQX0VYVEVOVF9VTktOT1dOCj4+IFRoZSBsb2NhdGlvbiBvZiB0aGlzIGV4
dGVudCBpcyBjdXJyZW50bHkgdW5rbm93bi4gVGhpcyBtYXkKPj4gaW5kaWNhdGUgdGhlIGRhdGEg
aXMgc3RvcmVkIG9uIGFuIGluYWNjZXNzaWJsZSB2b2x1bWUgb3IgdGhhdAo+PiBubyBzdG9yYWdl
IGhhcyBiZWVuIGFsbG9jYXRlZCBmb3IgdGhlIGZpbGUgeWV0Lgo+Pgo+PiBGSUVNQVBfRVhURU5U
X0RFTEFMTE9DCj4+IFRoaXMgd2lsbCBhbHNvIHNldCBGSUVNQVBfRVhURU5UX1VOS05PV04uCj4+
Cj4+IERlbGF5ZWQgYWxsb2NhdGlvbiAtIHdoaWxlIHRoZXJlIGlzIGRhdGEgZm9yIHRoaXMgZXh0
ZW50LCBpdHMKPj4gcGh5c2ljYWwgbG9jYXRpb24gaGFzIG5vdCBiZWVuIGFsbG9jYXRlZCB5ZXQu
Cj4+Cj4+IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOCj4+IFVud3JpdHRlbiBleHRlbnQgLSB0aGUg
ZXh0ZW50IGlzIGFsbG9jYXRlZCBidXQgaXRzIGRhdGEgaGFzIG5vdAo+PiBiZWVuIGluaXRpYWxp
emVkLiBUaGlzIGluZGljYXRlcyB0aGUgZXh0ZW504oCZcyBkYXRhIHdpbGwgYmUgYWxsCj4+IHpl
cm8gaWYgcmVhZCB0aHJvdWdoIHRoZSBmaWxlc3lzdGVtIGJ1dCB0aGUgY29udGVudHMgYXJlIHVu
ZGVmaW5lZAo+PiBpZiByZWFkIGRpcmVjdGx5IGZyb20gdGhlIGRldmljZS4KPj4KPj4gWzFdIGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2ZpbGVzeXN0ZW1zL2ZpZW1hcC5o
dG1sCj4+Cj4+IEFjY29yZGluZyB0byBpdHMgZGVzY3JpcHRpb24sIGYyZnMgb25seSBzdXBwb3J0
Cj4+IEZJRU1BUF9FWFRFTlRfe1VOS05PV04sIERFTEFMTE9DfSwgYnV0IG5vdCBzdXBwb3J0Cj4+
IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOLgo+IAo+IE5vLCBJIGRvbid0IHRoaW5rIHNvLgoKSmFl
Z2V1aywKCkNvdWxkIHlvdSBwbGVhc2UgY2hlY2sgdGhlIGRldGFpbGVkIGRlc2NyaXB0aW9uIG9m
IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOPwpUaGUgZmxhZyBpbmRpY2F0ZXMgdHdvIGNvbmRpdGlv
bnM6CjEuIG9uLWRpc2sgYmxrYWRkcnMgd2VyZSBhbGxvY2F0ZWQgZm9yIGV4dGVudCwgYW5kIHRo
ZSBleHRlbnQgaXMgdGFnZ2VkIGFzCnVud3JpdHRlbiBzdGF0dXMuCjIuIGRhdGEgcmVhZGVkIG9u
IHRob3NlIGJsb2NrcyB3aWxsIGJlIGFsbCB6ZXJvLgoKU28sIGxldCdzIGNoZWNrIGYyZnMnIHN0
YXR1czoKLSBmYWxsb2NhdGUgb25seSByZXNlcnZlIHZhbGlkIGJsb2NrIGNvdW50IGFuZCBzZXQg
TkVXX0FERFIgaW4gZG5vZGUsIHNvCml0IGRvZXMgbm90IG1hdGNoIGNvbmRpdGlvbiAxKQotIHBp
biAmIGZhbGxvY2F0ZSBwcmVhbGxvY2F0ZXMgYmxrYWRkcnMgYW5kIHNldCBibGthZGRycyBpbiBk
bm9kZSwgYnV0CmNvbnRlbnQgb24gdGhvc2UgYmxrYWRkcnMgbWF5IGNvbnRhaW4gemVybyBvciBy
YW5kb20gZGF0YSwgc28gaXQgZG9lcyBub3QKbWF0Y2ggIGNvbmRpdGlvbiAyKQoKQ2hyaXN0b3Bo
IGRlc2NyaWJlcyB0aGlzIGlzc3VlIGluIGJlbG93IHBhdGNoIGFzIHdlbGwsIHlvdSBjYW4gY2hl
Y2sgaXQuCmRhOGM3ZmVjYzljNyAoImYyZnM6IHJlbmFtZSBGMkZTX01BUF9VTldSSVRURU4gdG8g
RjJGU19NQVBfREVMQUxMT0MiKQoKQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KClRoYW5rcywKCj4g
Cj4+Cj4+IFNvIDAwOSwgMDkyLCAwOTQgLi4gd2hpY2ggZXhwZWN0cyB1bndyaXR0ZW4gc3RhdHVz
IGZyb20gZXh0ZW50IHdpbGwKPj4gZmFpbC4KPj4KPj4gSG93IGFib3V0IGRpc2FibGluZyB0aG9z
ZSB0ZXN0Y2FzZT8KPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IE9uIDA0LzA1LCBDaGFvIFl1IHdy
b3RlOgo+Pj4+IHhmc3Rlc3QgZ2VuZXJpYy82MTQgZmFpbHMgdG8gcnVuIGR1ZSBiZWxvdyByZWFz
b246Cj4+Pj4KPj4+PiBnZW5lcmljLzYxNCAxcyAuLi4gW25vdCBydW5dIHRlc3QgcmVxdWlyZXMg
ZGVsYXllZCBhbGxvY2F0aW9uIGJ1ZmZlcmVkIHdyaXRlcwo+Pj4+Cj4+Pj4gVGhlIHJvb3QgY2F1
c2UgaXMgZjJmcyB0YWdzIHdyb25nIGZpZW1hcCBmbGFnIGZvciBkZWxheSBhbGxvY2F0ZWQKPj4+
PiBleHRlbnQuCj4+Pj4KPj4+PiBRdW90ZWQgZnJvbSBmaWVtYXAuaDoKPj4+PiBGSUVNQVBfRVhU
RU5UX1VOS05PV04JCTB4MDAwMDAwMDIgLyogRGF0YSBsb2NhdGlvbiB1bmtub3duLiAqLwo+Pj4+
IEZJRU1BUF9FWFRFTlRfREVMQUxMT0MJCTB4MDAwMDAwMDQgLyogTG9jYXRpb24gc3RpbGwgcGVu
ZGluZy4KPj4+PiAJCQkJCQkgICAgKiBTZXRzIEVYVEVOVF9VTktOT1dOLiAqLwo+Pj4+IEZJRU1B
UF9FWFRFTlRfVU5XUklUVEVOCQkweDAwMDAwODAwIC8qIFNwYWNlIGFsbG9jYXRlZCwgYnV0Cj4+
Pj4gCQkJCQkJICAgICogbm8gZGF0YSAoaS5lLiB6ZXJvKS4gKi8KPj4+Pgo+Pj4+IEZJRU1BUF9F
WFRFTlRfVU5XUklUVEVOIG1lYW5zIGJsb2NrIGFkZHJlc3MgaXMgcHJlYWxsb2NhdGVkLCBidXQg
dy9vCj4+Pj4gYmVlbiB3cml0dGVuIGFueSBkYXRhLCB3aGljaCBzdGF0dXMgZjJmcyBpcyBub3Qg
c3VwcG9ydGVkIG5vdywgZm9yIGFsbAo+Pj4+IE5FV19BRERSIGJsb2NrIGFkZHJlc3NlcywgaXQg
bWVhbnMgZGVsYXkgYWxsb2NhdGVkIGJsb2Nrcywgc28gbGV0J3MKPj4+PiB0YWcgRklFTUFQX0VY
VEVOVF9ERUxBTExPQyBpbnN0ZWFkLgo+Pj4+Cj4+Pj4gVGVzdGNhc2U6Cj4+Pj4geGZzX2lvIC1m
IC1jICdwd3JpdGUgMCA2NGsnIC9tbnQvZjJmcy9maWxlOwo+Pj4+IGZpbGVmcmFnIC12IC9tbnQv
ZjJmcy9maWxlCj4+Pj4KPj4+PiBPdXRwdXQ6Cj4+Pj4gLSBCZWZvcmUKPj4+PiBGaWxlc3lzdGVt
IHR5cGUgaXM6IGYyZjUyMDEwCj4+Pj4gRml6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAo
MTYgYmxvY2tzIG9mIDQwOTYgYnl0ZXMpCj4+Pj4gICAgZXh0OiAgICAgbG9naWNhbF9vZmZzZXQ6
ICAgICAgICBwaHlzaWNhbF9vZmZzZXQ6IGxlbmd0aDogICBleHBlY3RlZDogZmxhZ3M6Cj4+Pj4g
ICAgICAwOiAgICAgICAgMC4uICAgICAgMTU6ICAgICAgICAgIDAuLiAgICAgICAgMTU6ICAgICAx
NjogICAgICAgICAgICAgbGFzdCx1bndyaXR0ZW4sbWVyZ2VkLGVvZgo+Pj4+IC9tbnQvZjJmcy9m
aWxlOiAxIGV4dGVudCBmb3VuZAo+Pj4+Cj4+Pj4gQWZ0ZXI6Cj4+Pj4gRmlsZXN5c3RlbSB0eXBl
IGlzOiBmMmY1MjAxMAo+Pj4+IEZpbGUgc2l6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAo
MTYgYmxvY2tzIG9mIDQwOTYgYnl0ZXMpCj4+Pj4gICAgZXh0OiAgICAgbG9naWNhbF9vZmZzZXQ6
ICAgICAgICBwaHlzaWNhbF9vZmZzZXQ6IGxlbmd0aDogICBleHBlY3RlZDogZmxhZ3M6Cj4+Pj4g
ICAgICAwOiAgICAgICAgMC4uICAgICAgMTU6ICAgICAgICAgIDAuLiAgICAgICAgIDA6ICAgICAg
MDogICAgICAgICAgICAgbGFzdCx1bmtub3duX2xvYyxkZWxhbGxvYyxlb2YKPj4+PiAvbW50L2Yy
ZnMvZmlsZTogMSBleHRlbnQgZm91bmQKPj4+Pgo+Pj4+IEZpeGVzOiA3ZjYzZWI3N2FmN2IgKCJm
MmZzOiByZXBvcnQgdW53cml0dGVuIGFyZWEgaW4gZjJmc19maWVtYXAiKQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAgICBmcy9mMmZz
L2RhdGEuYyB8IDcgKysrKystLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMg
Yi9mcy9mMmZzL2RhdGEuYwo+Pj4+IGluZGV4IDM1OWRlNjUwNzcyZS4uM2FmYzk3NjQ3NDNlIDEw
MDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMK
Pj4+PiBAQCAtMTk5NSw3ICsxOTk1LDEwIEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+Pj4+ICAgIAl9Cj4+
Pj4gICAgCWlmIChzaXplKSB7Cj4+Pj4gLQkJZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9NRVJHRUQ7
Cj4+Pj4gKwkJaWYgKGZsYWdzICYgRklFTUFQX0VYVEVOVF9ERUxBTExPQykKPj4+PiArCQkJcGh5
cyA9IDA7Cj4+Pj4gKwkJZWxzZQo+Pj4+ICsJCQlmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdF
RDsKPj4+PiAgICAJCWlmIChJU19FTkNSWVBURUQoaW5vZGUpKQo+Pj4+ICAgIAkJCWZsYWdzIHw9
IEZJRU1BUF9FWFRFTlRfREFUQV9FTkNSWVBURUQ7Cj4+Pj4gQEAgLTIwMzUsNyArMjAzOCw3IEBA
IGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVu
dF9pbmZvICpmaWVpbmZvLAo+Pj4+ICAgIAkJCQlzaXplICs9IGJsa3NfdG9fYnl0ZXMoaW5vZGUs
IDEpOwo+Pj4+ICAgIAkJCX0KPj4+PiAgICAJCX0gZWxzZSBpZiAobWFwLm1fZmxhZ3MgJiBGMkZT
X01BUF9ERUxBTExPQykgewo+Pj4+IC0JCQlmbGFncyA9IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVO
Owo+Pj4+ICsJCQlmbGFncyA9IEZJRU1BUF9FWFRFTlRfREVMQUxMT0M7Cj4+Pj4gICAgCQl9Cj4+
Pj4gICAgCQlzdGFydF9ibGsgKz0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc2l6ZSk7Cj4+Pj4gLS0g
Cj4+Pj4gMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
