Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC38C5ED0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 03:34:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s73XU-0004v6-6w;
	Wed, 15 May 2024 01:34:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s73XT-0004uz-3K
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 01:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I8gn9hUnMbR056skao/cT8y+YjEZ+lJPz+kbOh3T7Do=; b=LJL9L0IdkRR3HW5I52mTyjFKE7
 r94u8xczTYmwLgCiHDXsPHaqnZoxTT9z/4hYiheJ6tvRLZ1Pf8xQWRF8WQpReAS3bSBe/9/lmRd2l
 Zb6Iz03s5eCYTYsX5bEwrryuscRL0pEzQZuEk9oKNhTvgCM4ho8LHC64tKsE8kXneL74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I8gn9hUnMbR056skao/cT8y+YjEZ+lJPz+kbOh3T7Do=; b=i8ynkRs3QYLSqpRM6YoiU1R0X/
 XccoAESGixQwTwGGvOkxpC+3CgbF2sUwPcjxwEroEfSF9byhQW2tkFX0ato5Wdju0qLryQcvstShZ
 YrIaUM4qv8QmH7DC2kf6qWMtzpCZU2elPegBY0qYCAd0xkFdLEohws1e/alqCzm1lg8k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s73XT-0007rJ-AN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 01:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E349612DC;
 Wed, 15 May 2024 01:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D10C2BD10;
 Wed, 15 May 2024 01:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715736872;
 bh=VjlVMK0VLtnbMICT7jQ/JYzOP302qxtpqkzwsgNzVbY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=riTySqg4KKK4IWdLpx47Os0OV5sgHxzdH35QT5AuSPRyyKSwbSBid5ww2nvcYOJNH
 /yUEWKhyIOo8uyX9zfc1b2t/C9NGWynIybRjynXGjvytUXPxuO2GL3qvrlVOHbwMr7
 Dbt/EUUWqp9JNEgtgPyoK88rJaMyMCfhtCmbliNaWjZc+0FRccayBOfybs3MLCoaDb
 DBoDwosHUR7HAQV5PiTIM9qQTFQzD2t3A8hrSSssB0EeGtkPuOd+BdlIhzfJ9SOafO
 yAtL2j5/8gPX8P2PYYY2CKKYbz+Y1gO5t+cRZrQexjzmHW35OCUvQa6Yz55S3bswYT
 msme8QQUfZm0A==
Message-ID: <43f128b0-5151-4ae6-9bc0-438c7a9871e9@kernel.org>
Date: Wed, 15 May 2024 09:34:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240506103313.773503-1-chao@kernel.org>
 <20240506103313.773503-3-chao@kernel.org> <ZjzxWp4-wmpCzBeB@google.com>
 <b58d0a62-9491-4b77-a3be-70331f849bb8@kernel.org>
 <Zj2WWpHmHaWKbDgG@google.com>
 <948ecc86-63f5-48bb-b71c-61d57cbf446c@kernel.org>
 <Zj6-Fl5OQrHyg0g_@google.com>
 <02a4e80f-a146-4862-8399-3db42979b8fb@kernel.org>
 <ZkOMSQK6hitduUYK@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZkOMSQK6hitduUYK@google.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/5/15 0:07, Jaegeuk Kim wrote: > 外部邮件/External
    Mail > > > On 05/11, Chao Yu wrote: >> On 2024/5/11 8:38, Jaegeuk Kim wrote:
    >>> On 05/10, Chao Yu wrote: >>>> On 2024/5/10 11:36, Jaegeuk [...] 
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s73XT-0007rJ-AN
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to do sanity check on i_nid
 for inline_data inode
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC81LzE1IDA6MDcsIEphZWdldWsgS2ltIHdyb3RlOgo+IOWklumDqOmCruS7ti9FeHRl
cm5hbCBNYWlsCj4gCj4gCj4gT24gMDUvMTEsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjQvNS8x
MSA4OjM4LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IE9uIDA1LzEwLCBDaGFvIFl1IHdyb3RlOgo+
Pj4+IE9uIDIwMjQvNS8xMCAxMTozNiwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+IE9uIDA1LzEw
LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4gT24gMjAyNC81LzkgMjM6NTIsIEphZWdldWsgS2ltIHdy
b3RlOgo+Pj4+Pj4+IE9uIDA1LzA2LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4+PiBzeXpib3QgcmVw
b3J0cyBhIGYyZnMgYnVnIGFzIGJlbG93Ogo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+Pj4+Pj4ga2VybmVsIEJVRyBhdCBmcy9mMmZzL2lu
bGluZS5jOjI1OCEKPj4+Pj4+Pj4gQ1BVOiAxIFBJRDogMzQgQ29tbToga3dvcmtlci91ODoyIE5v
dCB0YWludGVkIDYuOS4wLXJjNi1zeXprYWxsZXItMDAwMTItZzllNGJjNGJjYWUwMSAjMAo+Pj4+
Pj4+PiBSSVA6IDAwMTA6ZjJmc193cml0ZV9pbmxpbmVfZGF0YSsweDc4MS8weDc5MCBmcy9mMmZz
L2lubGluZS5jOjI1OAo+Pj4+Pj4+PiBDYWxsIFRyYWNlOgo+Pj4+Pj4+PiAgICAgIGYyZnNfd3Jp
dGVfc2luZ2xlX2RhdGFfcGFnZSsweGI2NS8weDFkNjAgZnMvZjJmcy9kYXRhLmM6MjgzNAo+Pj4+
Pj4+PiAgICAgIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMgZnMvZjJmcy9kYXRhLmM6MzEzMyBbaW5s
aW5lXQo+Pj4+Pj4+PiAgICAgIF9fZjJmc193cml0ZV9kYXRhX3BhZ2VzIGZzL2YyZnMvZGF0YS5j
OjMyODggW2lubGluZV0KPj4+Pj4+Pj4gICAgICBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHgxZWZl
LzB4M2E5MCBmcy9mMmZzL2RhdGEuYzozMzE1Cj4+Pj4+Pj4+ICAgICAgZG9fd3JpdGVwYWdlcysw
eDM1Yi8weDg3MCBtbS9wYWdlLXdyaXRlYmFjay5jOjI2MTIKPj4+Pj4+Pj4gICAgICBfX3dyaXRl
YmFja19zaW5nbGVfaW5vZGUrMHgxNjUvMHgxMGIwIGZzL2ZzLXdyaXRlYmFjay5jOjE2NTAKPj4+
Pj4+Pj4gICAgICB3cml0ZWJhY2tfc2JfaW5vZGVzKzB4OTA1LzB4MTI2MCBmcy9mcy13cml0ZWJh
Y2suYzoxOTQxCj4+Pj4+Pj4+ICAgICAgd2Jfd3JpdGViYWNrKzB4NDU3LzB4Y2UwIGZzL2ZzLXdy
aXRlYmFjay5jOjIxMTcKPj4+Pj4+Pj4gICAgICB3Yl9kb193cml0ZWJhY2sgZnMvZnMtd3JpdGVi
YWNrLmM6MjI2NCBbaW5saW5lXQo+Pj4+Pj4+PiAgICAgIHdiX3dvcmtmbisweDQxMC8weDEwOTAg
ZnMvZnMtd3JpdGViYWNrLmM6MjMwNAo+Pj4+Pj4+PiAgICAgIHByb2Nlc3Nfb25lX3dvcmsga2Vy
bmVsL3dvcmtxdWV1ZS5jOjMyNTQgW2lubGluZV0KPj4+Pj4+Pj4gICAgICBwcm9jZXNzX3NjaGVk
dWxlZF93b3JrcysweGExMi8weDE3YzAga2VybmVsL3dvcmtxdWV1ZS5jOjMzMzUKPj4+Pj4+Pj4g
ICAgICB3b3JrZXJfdGhyZWFkKzB4ODZkLzB4ZDcwIGtlcm5lbC93b3JrcXVldWUuYzozNDE2Cj4+
Pj4+Pj4+ICAgICAga3RocmVhZCsweDJmMi8weDM5MCBrZXJuZWwva3RocmVhZC5jOjM4OAo+Pj4+
Pj4+PiAgICAgIHJldF9mcm9tX2ZvcmsrMHg0ZC8weDgwIGFyY2gveDg2L2tlcm5lbC9wcm9jZXNz
LmM6MTQ3Cj4+Pj4+Pj4+ICAgICAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwIGFyY2gveDg2
L2VudHJ5L2VudHJ5XzY0LlM6MjQ0Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSByb290IGNhdXNlIGlz
OiBpbmxpbmVfZGF0YSBpbm9kZSBjYW4gYmUgZnV6emVkLCBzbyB0aGF0IHRoZXJlIG1heQo+Pj4+
Pj4+PiBiZSB2YWxpZCBibGthZGRyIGluIGl0cyBkaXJlY3Qgbm9kZSwgb25jZSBmMmZzIHRyaWdn
ZXJzIGJhY2tncm91bmQgR0MKPj4+Pj4+Pj4gdG8gbWlncmF0ZSB0aGUgYmxvY2ssIGl0IHdpbGwg
aGl0IGYyZnNfYnVnX29uKCkgZHVyaW5nIGRpcnR5IHBhZ2UKPj4+Pj4+Pj4gd3JpdGViYWNrLgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBMZXQncyBhZGQgc2FuaXR5IGNoZWNrIG9uIGlfbmlkIGZpZWxkIGZv
ciBpbmxpbmVfZGF0YSBpbm9kZSwgbWVhbndoaWxlLAo+Pj4+Pj4+PiBmb3JiaWQgdG8gbWlncmF0
ZSBpbmxpbmVfZGF0YSBpbm9kZSdzIGRhdGEgYmxvY2sgdG8gZml4IHRoaXMgaXNzdWUuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrODQ4MDYyYmExOWM4NzgyY2E1YzhAc3l6
a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+Pj4+Pj4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMDAwMDAwMDAwMDAwZDEwM2NlMDYxNzRkN2VjM0Bnb29n
bGUuY29tCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4K
Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+ICAgICAgZnMvZjJmcy9mMmZzLmggICB8ICAyICstCj4+Pj4+
Pj4+ICAgICAgZnMvZjJmcy9nYy5jICAgICB8ICA2ICsrKysrKwo+Pj4+Pj4+PiAgICAgIGZzL2Yy
ZnMvaW5saW5lLmMgfCAxNyArKysrKysrKysrKysrKysrLQo+Pj4+Pj4+PiAgICAgIGZzL2YyZnMv
aW5vZGUuYyAgfCAgMiArLQo+Pj4+Pj4+PiAgICAgIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+Pj4gaW5kZXggZmNlZDJiNzY1MmY0
Li5jODc2ODEzYjU1MzIgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+
Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+Pj4+IEBAIC00MTQ2LDcgKzQxNDYsNyBAQCBl
eHRlcm4gc3RydWN0IGttZW1fY2FjaGUgKmYyZnNfaW5vZGVfZW50cnlfc2xhYjsKPj4+Pj4+Pj4g
ICAgICAgKiBpbmxpbmUuYwo+Pj4+Pj4+PiAgICAgICAqLwo+Pj4+Pj4+PiAgICAgIGJvb2wgZjJm
c19tYXlfaW5saW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSk7Cj4+Pj4+Pj4+IC1ib29sIGYy
ZnNfc2FuaXR5X2NoZWNrX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUpOwo+Pj4+Pj4+
PiArYm9vbCBmMmZzX3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QgcGFnZSAqaXBhZ2UpOwo+Pj4+Pj4+PiAgICAgIGJvb2wgZjJmc19tYXlfaW5saW5l
X2RlbnRyeShzdHJ1Y3QgaW5vZGUgKmlub2RlKTsKPj4+Pj4+Pj4gICAgICB2b2lkIGYyZnNfZG9f
cmVhZF9pbmxpbmVfZGF0YShzdHJ1Y3QgcGFnZSAqcGFnZSwgc3RydWN0IHBhZ2UgKmlwYWdlKTsK
Pj4+Pj4+Pj4gICAgICB2b2lkIGYyZnNfdHJ1bmNhdGVfaW5saW5lX2lub2RlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2dj
LmMKPj4+Pj4+Pj4gaW5kZXggZTg2YzdmMDE1MzlhLi4wNDE5NTc3NTA0NzggMTAwNjQ0Cj4+Pj4+
Pj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4+PiArKysgYi9mcy9mMmZzL2djLmMKPj4+Pj4+
Pj4gQEAgLTE1NjMsNiArMTU2MywxMiBAQCBzdGF0aWMgaW50IGdjX2RhdGFfc2VnbWVudChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBmMmZzX3N1bW1hcnkgKnN1bSwKPj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICBpZiAo
ZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpKSB7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgaXB1dChpbm9kZSk7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
c2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURfRlNDSyk7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7Cj4+Pj4+Pj4KPj4+Pj4+PiBBbnkgcmFjZSBjb25kdGlvbiB0
byBnZXQgdGhpcyBhcyBmYWxzZSBhbGFybT8KPj4+Pj4+Cj4+Pj4+PiBTaW5jZSB0aGVyZSBpcyBu
byByZXByb2R1Y2VyIGZvciB0aGUgYnVnLCBJIGRvdWJ0IGl0IHdhcyBjYXVzZWQgYnkgbWV0YWRh
dGEKPj4+Pj4+IGZ1enppbmcsIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4+Pgo+Pj4+Pj4gLSBp
bmxpbmUgaW5vZGUgaGFzIG9uZSB2YWxpZCBibGthZGRyIGluIGlfYWRkciBvciBpbiBkbm9kZSBy
ZWZlcmVuY2UgYnkgaV9uaWQ7Cj4+Pj4+PiAtIFNJVC9TU0EgZW50cnkgb2YgdGhlIGJsb2NrIGlz
IHZhbGlkOwo+Pj4+Pj4gLSBiYWNrZ3JvdW5kIEdDIG1pZ3JhdGVzIHRoZSBibG9jazsKPj4+Pj4+
IC0ga3dvcmtlciB3cml0ZWJhY2sgaXQsIGFuZCB0cmlnZ2VyIHRoZSBidWdfb24oKS4KPj4+Pj4K
Pj4+Pj4gV2Fzbid0IGRldGVjdGVkIGJ5IHNhbml0eV9jaGVja19pbm9kZT8KPj4+Pgo+Pj4+IEkg
ZnV6emVkIG5vbi1pbmxpbmUgaW5vZGUgdy8gYmVsb3cgbWV0YWRhdGEgZmllbGRzOgo+Pj4+IC0g
aV9ibG9ja3MgPSAxCj4+Pj4gLSBpX3NpemUgPSAyMDQ4Cj4+Pj4gLSBpX2lubGluZSB8PSAweDAy
Cj4+Pj4KPj4+PiBzYW5pdHlfY2hlY2tfaW5vZGUoKSBkb2Vzbid0IGNvbXBsYWluLgo+Pj4KPj4+
IEkgbWVhbiwgdGhlIGJlbG93IHNhbml0eV9jaGVja19pbm9kZSgpIGNhbiBjb3ZlciB0aGUgZnV6
emVkIGNhc2U/IEknbSB3b25kZXJpbmcKPj4KPj4gSSBkaWRuJ3QgZmlndXJlIG91dCBhIGdlbmVy
aWMgd2F5IGluIHNhbml0eV9jaGVja19pbm9kZSgpIHRvIGNhdGNoIGFsbCBmdXp6ZWQgY2FzZXMu
Cj4gCj4gCj4gVGhlIHBhdGNoIGRlc2NyaWJlZDoKPiAgICJUaGUgcm9vdCBjYXVzZSBpczogaW5s
aW5lX2RhdGEgaW5vZGUgY2FuIGJlIGZ1enplZCwgc28gdGhhdCB0aGVyZSBtYXkKPiAgIGJlIHZh
bGlkIGJsa2FkZHIgaW4gaXRzIGRpcmVjdCBub2RlLCBvbmNlIGYyZnMgdHJpZ2dlcnMgYmFja2dy
b3VuZCBHQwo+ICAgdG8gbWlncmF0ZSB0aGUgYmxvY2ssIGl0IHdpbGwgaGl0IGYyZnNfYnVnX29u
KCkgZHVyaW5nIGRpcnR5IHBhZ2UKPiAgIHdyaXRlYmFjay4iCj4gCj4gRG8geW91IHN1c3BlY3Qg
dGhlIG5vZGUgYmxvY2sgYWRkcmVzcyB3YXMgc3VkZGVubHkgYXNzaWduZWQgYWZ0ZXIgZjJmc19p
Z2V0KCk/CgpObywgSSBzdXNwZWN0IHRoYXQgdGhlIGltYWdlIHdhcyBmdXp6ZWQgYnkgdG9vbHMg
b2ZmbGluZSwgbm90IGluIHJ1bnRpbWUgYWZ0ZXIKbW91bnQoKS4KCj4gT3RoZXJ3aXNlLCBpdCBs
b29rcyBjaGVja2luZyB0aGVtIGluIHNhbml0eV9jaGVja19pbm9kZSB3b3VsZCBiZSBlbm91Z2gu
Cj4gCj4+Cj4+IGUuZy4KPj4gY2FzZSAjMQo+PiAtIGJsa2FkZHIsIGl0cyBkbm9kZSwgU1NBIGFu
ZCBTSVQgYXJlIGNvbnNpc3RlbnQKPj4gLSBkbm9kZS5mb290ZXIuaW5vIHBvaW50cyB0byBpbmxp
bmUgaW5vZGUKPj4gLSBpbmxpbmUgaW5vZGUgZG9lc24ndCBsaW5rIHRvIHRoZSBkb25kZQo+Pgo+
PiBTb21ldGhpbmcgbGlrZSBmdXp6ZWQgc3BlY2lhbCBmaWxlLCBwbGVhc2UgY2hlY2sgZGV0YWls
cyBpbiBiZWxvdyBjb21taXQ6Cj4+Cj4+IDkwNTZkNjQ4OWY1YSAoImYyZnM6IGZpeCB0byBkbyBz
YW5pdHkgY2hlY2sgb24gaW5vZGUgdHlwZSBkdXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uIikKPj4K
Pj4gY2FzZSAjMgo+PiAtIGJsa2FkZHIsIGl0cyBkbm9kZSwgU1NBIGFuZCBTSVQgYXJlIGNvbnNp
c3RlbnQKPj4gLSBibGthZGRyIGxvY2F0ZXMgaW4gaW5saW5lIGlub2RlJ3MgaV9hZGRyCgpUaGUg
aW1hZ2Ugc3RhdHVzIGlzIHNvbWV0aGluZyBsaWtlIGFib3ZlIGFzIEkgZGVzY3JpYmVkLgoKVGhh
bmtzLAoKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gd2hldGhlciB3ZSByZWFsbHkgbmVlZCB0byBjaGVj
ayBpdCBpbiB0aGUgZ2MgcGF0aC4KPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+
Pj4+Cj4+Pj4+PiBUaG91Z2h0cz8KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+Pj4+
Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgIH0KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX2djX3Bpbm5lZF9jb250cm9sKGlub2RlLCBn
Y190eXBlLCBzZWdubyk7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChl
cnIgPT0gLUVBR0FJTikgewo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlwdXQoaW5vZGUpOwo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbmxpbmUuYyBi
L2ZzL2YyZnMvaW5saW5lLmMKPj4+Pj4+Pj4gaW5kZXggYWMwMDQyM2YxMTdiLi4wNjc2MDBmZWQz
ZDQgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvaW5saW5lLmMKPj4+Pj4+Pj4gKysrIGIv
ZnMvZjJmcy9pbmxpbmUuYwo+Pj4+Pj4+PiBAQCAtMzMsMTEgKzMzLDI2IEBAIGJvb2wgZjJmc19t
YXlfaW5saW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSkKPj4+Pj4+Pj4gICAgICAgICAgICBy
ZXR1cm4gIWYyZnNfcG9zdF9yZWFkX3JlcXVpcmVkKGlub2RlKTsKPj4+Pj4+Pj4gICAgICB9Cj4+
Pj4+Pj4+IC1ib29sIGYyZnNfc2FuaXR5X2NoZWNrX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAq
aW5vZGUpCj4+Pj4+Pj4+ICtzdGF0aWMgYm9vbCBoYXNfbm9kZV9ibG9ja3Moc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IHBhZ2UgKmlwYWdlKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArIHN0cnVj
dCBmMmZzX2lub2RlICpyaSA9IEYyRlNfSU5PREUoaXBhZ2UpOwo+Pj4+Pj4+PiArIGludCBpOwo+
Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgZm9yIChpID0gMDsgaSA8IERFRl9OSURTX1BFUl9JTk9ERTsg
aSsrKSB7Cj4+Pj4+Pj4+ICsgICAgICAgICBpZiAocmktPmlfbmlkW2ldKQo+Pj4+Pj4+PiArICAg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPj4+Pj4+Pj4gKyB9Cj4+Pj4+Pj4+ICsgcmV0dXJu
IGZhbHNlOwo+Pj4+Pj4+PiArfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICtib29sIGYyZnNfc2FuaXR5
X2NoZWNrX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICppcGFn
ZSkKPj4+Pj4+Pj4gICAgICB7Cj4+Pj4+Pj4+ICAgICAgICAgICAgaWYgKCFmMmZzX2hhc19pbmxp
bmVfZGF0YShpbm9kZSkpCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4+Pj4+Pj4+ICsgaWYgKGhhc19ub2RlX2Jsb2Nrcyhpbm9kZSwgaXBhZ2UpKQo+Pj4+Pj4+PiAr
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICAgICAgICAgICAgaWYg
KCFzdXBwb3J0X2lubGluZV9kYXRhKGlub2RlKSkKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
IHJldHVybiB0cnVlOwo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMv
ZjJmcy9pbm9kZS5jCj4+Pj4+Pj4+IGluZGV4IGMyNmVmZmRjZTlhYS4uMTQyM2NkMjdhNDc3IDEw
MDY0NAo+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+Pj4gKysrIGIvZnMvZjJm
cy9pbm9kZS5jCj4+Pj4+Pj4+IEBAIC0zNDMsNyArMzQzLDcgQEAgc3RhdGljIGJvb2wgc2FuaXR5
X2NoZWNrX2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpub2RlX3BhZ2Up
Cj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICB9Cj4+Pj4+Pj4+ICAgICAgICAgICAgfQo+Pj4+
Pj4+PiAtIGlmIChmMmZzX3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShpbm9kZSkpIHsKPj4+Pj4+
Pj4gKyBpZiAoZjJmc19zYW5pdHlfY2hlY2tfaW5saW5lX2RhdGEoaW5vZGUsIG5vZGVfcGFnZSkp
IHsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIGYyZnNfd2FybihzYmksICIlczogaW5vZGUg
KGlubz0lbHgsIG1vZGU9JXUpIHNob3VsZCBub3QgaGF2ZSBpbmxpbmVfZGF0YSwgcnVuIGZzY2sg
dG8gZml4IiwKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
aW5vZGUtPmlfaW5vLCBpbm9kZS0+aV9tb2RlKTsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
IHJldHVybiBmYWxzZTsKPj4+Pj4+Pj4gLS0KPj4+Pj4+Pj4gMi40MC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
