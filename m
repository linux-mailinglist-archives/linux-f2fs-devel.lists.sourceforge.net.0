Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F38648CA0BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2024 18:32:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s95w6-0002ni-Bz;
	Mon, 20 May 2024 16:32:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1s95w4-0002nY-90
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 16:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pteqz9EqrB1HuxeqdKZY9V1ON401Ec4Sd8n11c1ZY2A=; b=XCq9RRM2hzHqQC7uRj9F0pMcWo
 Wc0GB3KbXy1N4AW8If2z/dfHV+ysCI0E9XWZsWZ/DDyFDt3EEo1pCsfh5ZCJpH+Y/xjByvMDSYoav
 5TUzorREh0hytWnJRv5Uj7bSn/nsBTRt27lwpbqpJCCAWWNlAjjBl7DS+/6D+HmCH3II=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pteqz9EqrB1HuxeqdKZY9V1ON401Ec4Sd8n11c1ZY2A=; b=lyjhL6v6HeKlnOCEctbfjmBSFP
 LnpO/i+2IM3XKU57OiAY9EgrCLLX0BFd1cxpYVYvHbOxuym3miiWevF7r1Vr6W0rHmxtACqSbkZgj
 99onR5NShUWSTIsLkqOg2FhzmRNGnYwfTO0yZeuQDrvhwYoyG2j7aFaVOTl7gQdVvXz0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s95w4-0007Ap-A4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 16:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F78861C0A;
 Mon, 20 May 2024 16:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8994BC2BD10;
 Mon, 20 May 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716222741;
 bh=IOVeDBIBgbZBq6FG6hT4klVSpGGEc7bbkMIX+YHEsJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTg4WIaxs+C8saprx7ioL6bpyZv7azRxB+X1K4jHjtmZEwJ4tM3JIQ+ijw5ZHNU5K
 FwwzpH5XQ+A3sIjRcO5VOyyKfZ2ITTOVasssvZP3ro84wVrdxjV6unVCfiucNCQZHA
 r3drXbVtOkI0V+XZ+n0f4FOH8YspNbv7mxN2burEHYiT2G1mzXqn7ClNT3J82dbgOm
 kGlaWEJggMQ1HIe8FS1OspBGIExXSBt+mACeCI8+nwhK8WhBU5DoQyBCyRBg13dkP/
 HxhkzqlItQNU2OeI6BrlJJie4H/F51wLxuxUoflqwn91FQr+XMLvUdB5Hd3h6brpYX
 4sec4xhhgR7GQ==
Date: Mon, 20 May 2024 16:32:19 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Zkt7E95z5SEXe0Vo@google.com>
References: <ZjzxWp4-wmpCzBeB@google.com>
 <b58d0a62-9491-4b77-a3be-70331f849bb8@kernel.org>
 <Zj2WWpHmHaWKbDgG@google.com>
 <948ecc86-63f5-48bb-b71c-61d57cbf446c@kernel.org>
 <Zj6-Fl5OQrHyg0g_@google.com>
 <02a4e80f-a146-4862-8399-3db42979b8fb@kernel.org>
 <ZkOMSQK6hitduUYK@google.com>
 <43f128b0-5151-4ae6-9bc0-438c7a9871e9@kernel.org>
 <ZkQ8mSYP50Etp0-C@google.com>
 <404a39af-b3b7-4898-a158-dd1e92f09a95@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <404a39af-b3b7-4898-a158-dd1e92f09a95@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 05/15, Chao Yu wrote: > On 2024/5/15 12:39, Jaegeuk Kim
    wrote: > > On 05/15, Chao Yu wrote: > > > On 2024/5/15 0:07, Jaegeuk Kim
   wrote: > > > > 外部邮件/External Mail > > > > > > > > > > > > On [...]
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s95w4-0007Ap-A4
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDUvMTUsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC81LzE1IDEyOjM5LCBKYWVnZXVrIEtp
bSB3cm90ZToKPiA+IE9uIDA1LzE1LCBDaGFvIFl1IHdyb3RlOgo+ID4gPiBPbiAyMDI0LzUvMTUg
MDowNywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiA+ID4g5aSW6YOo6YKu5Lu2L0V4dGVybmFsIE1h
aWwKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBPbiAwNS8xMSwgQ2hhbyBZdSB3cm90ZToKPiA+
ID4gPiA+IE9uIDIwMjQvNS8xMSA4OjM4LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gPiA+ID4g
T24gMDUvMTAsIENoYW8gWXUgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gMjAyNC81LzEwIDExOjM2
LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIDA1LzEwLCBDaGFvIFl1IHdy
b3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBPbiAyMDI0LzUvOSAyMzo1MiwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gT24gMDUvMDYsIENoYW8gWXUgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBzeXpib3QgcmVwb3J0cyBhIGYyZnMgYnVnIGFzIGJlbG93Ogo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0tLS0tLS0tLS1bIGN1dCBo
ZXJlIF0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGtlcm5lbCBCVUcgYXQgZnMv
ZjJmcy9pbmxpbmUuYzoyNTghCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBDUFU6IDEgUElEOiAzNCBD
b21tOiBrd29ya2VyL3U4OjIgTm90IHRhaW50ZWQgNi45LjAtcmM2LXN5emthbGxlci0wMDAxMi1n
OWU0YmM0YmNhZTAxICMwCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBSSVA6IDAwMTA6ZjJmc193cml0
ZV9pbmxpbmVfZGF0YSsweDc4MS8weDc5MCBmcy9mMmZzL2lubGluZS5jOjI1OAo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gQ2FsbCBUcmFjZToKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIGYyZnNf
d3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweGI2NS8weDFkNjAgZnMvZjJmcy9kYXRhLmM6MjgzNAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgZjJmc193cml0ZV9jYWNoZV9wYWdlcyBmcy9mMmZz
L2RhdGEuYzozMTMzIFtpbmxpbmVdCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBfX2YyZnNf
d3JpdGVfZGF0YV9wYWdlcyBmcy9mMmZzL2RhdGEuYzozMjg4IFtpbmxpbmVdCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHgxZWZlLzB4M2E5MCBmcy9m
MmZzL2RhdGEuYzozMzE1Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBkb193cml0ZXBhZ2Vz
KzB4MzViLzB4ODcwIG1tL3BhZ2Utd3JpdGViYWNrLmM6MjYxMgo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gICAgICAgX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4MTY1LzB4MTBiMCBmcy9mcy13cml0
ZWJhY2suYzoxNjUwCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB3cml0ZWJhY2tfc2JfaW5v
ZGVzKzB4OTA1LzB4MTI2MCBmcy9mcy13cml0ZWJhY2suYzoxOTQxCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICB3Yl93cml0ZWJhY2srMHg0NTcvMHhjZTAgZnMvZnMtd3JpdGViYWNrLmM6MjEx
Nwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgd2JfZG9fd3JpdGViYWNrIGZzL2ZzLXdyaXRl
YmFjay5jOjIyNjQgW2lubGluZV0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIHdiX3dvcmtm
bisweDQxMC8weDEwOTAgZnMvZnMtd3JpdGViYWNrLmM6MjMwNAo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gICAgICAgcHJvY2Vzc19vbmVfd29yayBrZXJuZWwvd29ya3F1ZXVlLmM6MzI1NCBbaW5saW5l
XQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgcHJvY2Vzc19zY2hlZHVsZWRfd29ya3MrMHhh
MTIvMHgxN2MwIGtlcm5lbC93b3JrcXVldWUuYzozMzM1Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICB3b3JrZXJfdGhyZWFkKzB4ODZkLzB4ZDcwIGtlcm5lbC93b3JrcXVldWUuYzozNDE2Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBrdGhyZWFkKzB4MmYyLzB4MzkwIGtlcm5lbC9rdGhy
ZWFkLmM6Mzg4Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICByZXRfZnJvbV9mb3JrKzB4NGQv
MHg4MCBhcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzcy5jOjE0Nwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwIGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0
LlM6MjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoZSBy
b290IGNhdXNlIGlzOiBpbmxpbmVfZGF0YSBpbm9kZSBjYW4gYmUgZnV6emVkLCBzbyB0aGF0IHRo
ZXJlIG1heQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gYmUgdmFsaWQgYmxrYWRkciBpbiBpdHMgZGly
ZWN0IG5vZGUsIG9uY2UgZjJmcyB0cmlnZ2VycyBiYWNrZ3JvdW5kIEdDCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiB0byBtaWdyYXRlIHRoZSBibG9jaywgaXQgd2lsbCBoaXQgZjJmc19idWdfb24oKSBk
dXJpbmcgZGlydHkgcGFnZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gd3JpdGViYWNrLgo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBMZXQncyBhZGQgc2FuaXR5IGNo
ZWNrIG9uIGlfbmlkIGZpZWxkIGZvciBpbmxpbmVfZGF0YSBpbm9kZSwgbWVhbndoaWxlLAo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gZm9yYmlkIHRvIG1pZ3JhdGUgaW5saW5lX2RhdGEgaW5vZGUncyBk
YXRhIGJsb2NrIHRvIGZpeCB0aGlzIGlzc3VlLgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBSZXBvcnRlZC1ieTogc3l6Ym90Kzg0ODA2MmJhMTljODc4MmNhNWM4
QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IENsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8wMDAwMDAwMDAwMDBkMTAz
Y2UwNjE3NGQ3ZWMzQGdvb2dsZS5jb20KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgZnMvZjJmcy9mMmZzLmggICB8ICAyICstCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICBmcy9mMmZzL2djLmMgICAgIHwgIDYgKysrKysrCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICBmcy9mMmZzL2lubGluZS5jIHwgMTcgKysrKysrKysrKysr
KysrKy0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIGZzL2YyZnMvaW5vZGUuYyAgfCAgMiAr
LQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgNCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggZmNlZDJiNzY1MmY0Li5jODc2ODEzYjU1MzIgMTAw
NjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEBA
IC00MTQ2LDcgKzQxNDYsNyBAQCBleHRlcm4gc3RydWN0IGttZW1fY2FjaGUgKmYyZnNfaW5vZGVf
ZW50cnlfc2xhYjsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAqIGlubGluZS5jCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgKi8KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIGJv
b2wgZjJmc19tYXlfaW5saW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSk7Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiAtYm9vbCBmMmZzX3Nhbml0eV9jaGVja19pbmxpbmVfZGF0YShzdHJ1Y3QgaW5v
ZGUgKmlub2RlKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICtib29sIGYyZnNfc2FuaXR5X2NoZWNr
X2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICppcGFnZSk7Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBib29sIGYyZnNfbWF5X2lubGluZV9kZW50cnkoc3Ry
dWN0IGlub2RlICppbm9kZSk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB2b2lkIGYyZnNf
ZG9fcmVhZF9pbmxpbmVfZGF0YShzdHJ1Y3QgcGFnZSAqcGFnZSwgc3RydWN0IHBhZ2UgKmlwYWdl
KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIHZvaWQgZjJmc190cnVuY2F0ZV9pbmxpbmVf
aW5vZGUoc3RydWN0IGlub2RlICppbm9kZSwKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGlu
ZGV4IGU4NmM3ZjAxNTM5YS4uMDQxOTU3NzUwNDc4IDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gLS0tIGEvZnMvZjJmcy9nYy5jCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9mcy9mMmZz
L2djLmMKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xNTYzLDYgKzE1NjMsMTIgQEAgc3RhdGlj
IGludCBnY19kYXRhX3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgZjJm
c19zdW1tYXJ5ICpzdW0sCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICBpZiAoZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpKSB7Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGlwdXQoaW5vZGUpOwo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklf
TkVFRF9GU0NLKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gQW55
IHJhY2UgY29uZHRpb24gdG8gZ2V0IHRoaXMgYXMgZmFsc2UgYWxhcm0/Cj4gPiA+ID4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBTaW5jZSB0aGVyZSBpcyBubyByZXByb2R1Y2VyIGZvciB0
aGUgYnVnLCBJIGRvdWJ0IGl0IHdhcyBjYXVzZWQgYnkgbWV0YWRhdGEKPiA+ID4gPiA+ID4gPiA+
ID4gZnV6emluZywgc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gPiA+IC0gaW5saW5lIGlub2RlIGhhcyBvbmUgdmFsaWQgYmxrYWRkciBpbiBpX2Fk
ZHIgb3IgaW4gZG5vZGUgcmVmZXJlbmNlIGJ5IGlfbmlkOwo+ID4gPiA+ID4gPiA+ID4gPiAtIFNJ
VC9TU0EgZW50cnkgb2YgdGhlIGJsb2NrIGlzIHZhbGlkOwo+ID4gPiA+ID4gPiA+ID4gPiAtIGJh
Y2tncm91bmQgR0MgbWlncmF0ZXMgdGhlIGJsb2NrOwo+ID4gPiA+ID4gPiA+ID4gPiAtIGt3b3Jr
ZXIgd3JpdGViYWNrIGl0LCBhbmQgdHJpZ2dlciB0aGUgYnVnX29uKCkuCj4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+IFdhc24ndCBkZXRlY3RlZCBieSBzYW5pdHlfY2hlY2tfaW5vZGU/
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSSBmdXp6ZWQgbm9uLWlubGluZSBpbm9kZSB3
LyBiZWxvdyBtZXRhZGF0YSBmaWVsZHM6Cj4gPiA+ID4gPiA+ID4gLSBpX2Jsb2NrcyA9IDEKPiA+
ID4gPiA+ID4gPiAtIGlfc2l6ZSA9IDIwNDgKPiA+ID4gPiA+ID4gPiAtIGlfaW5saW5lIHw9IDB4
MDIKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBzYW5pdHlfY2hlY2tfaW5vZGUoKSBkb2Vz
bid0IGNvbXBsYWluLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSBtZWFuLCB0aGUgYmVsb3cg
c2FuaXR5X2NoZWNrX2lub2RlKCkgY2FuIGNvdmVyIHRoZSBmdXp6ZWQgY2FzZT8gSSdtIHdvbmRl
cmluZwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGRpZG4ndCBmaWd1cmUgb3V0IGEgZ2VuZXJpYyB3
YXkgaW4gc2FuaXR5X2NoZWNrX2lub2RlKCkgdG8gY2F0Y2ggYWxsIGZ1enplZCBjYXNlcy4KPiA+
ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGUgcGF0Y2ggZGVzY3JpYmVkOgo+ID4gPiA+ICAgICJU
aGUgcm9vdCBjYXVzZSBpczogaW5saW5lX2RhdGEgaW5vZGUgY2FuIGJlIGZ1enplZCwgc28gdGhh
dCB0aGVyZSBtYXkKPiA+ID4gPiAgICBiZSB2YWxpZCBibGthZGRyIGluIGl0cyBkaXJlY3Qgbm9k
ZSwgb25jZSBmMmZzIHRyaWdnZXJzIGJhY2tncm91bmQgR0MKPiA+ID4gPiAgICB0byBtaWdyYXRl
IHRoZSBibG9jaywgaXQgd2lsbCBoaXQgZjJmc19idWdfb24oKSBkdXJpbmcgZGlydHkgcGFnZQo+
ID4gPiA+ICAgIHdyaXRlYmFjay4iCj4gPiA+ID4gCj4gPiA+ID4gRG8geW91IHN1c3BlY3QgdGhl
IG5vZGUgYmxvY2sgYWRkcmVzcyB3YXMgc3VkZGVubHkgYXNzaWduZWQgYWZ0ZXIgZjJmc19pZ2V0
KCk/Cj4gPiA+IAo+ID4gPiBObywgSSBzdXNwZWN0IHRoYXQgdGhlIGltYWdlIHdhcyBmdXp6ZWQg
YnkgdG9vbHMgb2ZmbGluZSwgbm90IGluIHJ1bnRpbWUgYWZ0ZXIKPiA+ID4gbW91bnQoKS4KPiA+
ID4gCj4gPiA+ID4gT3RoZXJ3aXNlLCBpdCBsb29rcyBjaGVja2luZyB0aGVtIGluIHNhbml0eV9j
aGVja19pbm9kZSB3b3VsZCBiZSBlbm91Z2guCj4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IGUuZy4KPiA+ID4gPiA+IGNhc2UgIzEKPiA+ID4gPiA+IC0gYmxrYWRkciwgaXRzIGRub2RlLCBT
U0EgYW5kIFNJVCBhcmUgY29uc2lzdGVudAo+ID4gPiA+ID4gLSBkbm9kZS5mb290ZXIuaW5vIHBv
aW50cyB0byBpbmxpbmUgaW5vZGUKPiA+ID4gPiA+IC0gaW5saW5lIGlub2RlIGRvZXNuJ3QgbGlu
ayB0byB0aGUgZG9uZGUKPiA+ID4gPiA+IAo+ID4gPiA+ID4gU29tZXRoaW5nIGxpa2UgZnV6emVk
IHNwZWNpYWwgZmlsZSwgcGxlYXNlIGNoZWNrIGRldGFpbHMgaW4gYmVsb3cgY29tbWl0Ogo+ID4g
PiA+ID4gCj4gPiA+ID4gPiA5MDU2ZDY0ODlmNWEgKCJmMmZzOiBmaXggdG8gZG8gc2FuaXR5IGNo
ZWNrIG9uIGlub2RlIHR5cGUgZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbiIpCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IGNhc2UgIzIKPiA+ID4gPiA+IC0gYmxrYWRkciwgaXRzIGRub2RlLCBTU0EgYW5k
IFNJVCBhcmUgY29uc2lzdGVudAo+ID4gPiA+ID4gLSBibGthZGRyIGxvY2F0ZXMgaW4gaW5saW5l
IGlub2RlJ3MgaV9hZGRyCj4gPiA+IAo+ID4gPiBUaGUgaW1hZ2Ugc3RhdHVzIGlzIHNvbWV0aGlu
ZyBsaWtlIGFib3ZlIGFzIEkgZGVzY3JpYmVkLgo+ID4gCj4gPiBUaGVuLCB3aHkgbm90IGp1c3Qg
Y2hlY2tpbmcgdGhlIGdjIHBhdGggb25seT8KPiAKPiBZZXMsIHdlIGNhbi4KPiAKPiBoYXNfbm9k
ZV9ibG9ja3MoKSBpcyBhZGRlZCBmb3IgdXNpbmcgYSBxdWljayBjaGVjayB0byBzZWUgd2hldGhl
ciBpX25pZAo+IGFuZCBpbmxpbmVfZGF0YSBmbGFnIGFyZSBpbmNvbnNpc3RlbnQsIHNob3VsZCB3
ZSBjaGFuZ2UgdGhpcyBpbiBhIHNlcGFyYXRlZAo+IHBhdGNoPwoKWXVwLCBJIHRoaW5rIGl0J2Qg
YmUgYmV0dGVyIHRvIGhhdmUgYSBwYXRjaCBwZXIgaXNzdWUgdG8gYXR0YWNrIHRoZSBleGFjdApw
cm9ibGVtLgoKPiAKPiBUaGFua3MsCj4gCj4gPiAKPiA+ID4gCj4gPiA+IFRoYW5rcywKPiA+ID4g
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiB3aGV0
aGVyIHdlIHJlYWxseSBuZWVkIHRvIGNoZWNrIGl0IGluIHRoZSBnYyBwYXRoLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IFRob3Vn
aHRzPwo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX2djX3Bpbm5lZF9j
b250cm9sKGlub2RlLCBnY190eXBlLCBzZWdubyk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVyciA9PSAtRUFHQUlOKSB7Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcHV0KGlub2Rl
KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lubGluZS5jIGIv
ZnMvZjJmcy9pbmxpbmUuYwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggYWMwMDQyM2YxMTdi
Li4wNjc2MDBmZWQzZDQgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9mcy9mMmZz
L2lubGluZS5jCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9mcy9mMmZzL2lubGluZS5jCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzMsMTEgKzMzLDI2IEBAIGJvb2wgZjJmc19tYXlfaW5s
aW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgIHJldHVybiAhZjJmc19wb3N0X3JlYWRfcmVxdWlyZWQoaW5vZGUpOwo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLWJvb2wgZjJmc19zYW5p
dHlfY2hlY2tfaW5saW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSkKPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICtzdGF0aWMgYm9vbCBoYXNfbm9kZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwg
c3RydWN0IHBhZ2UgKmlwYWdlKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgc3RydWN0IGYyZnNfaW5vZGUgKnJpID0gRjJGU19JTk9ERShpcGFnZSk7Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiArIGludCBpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyBmb3IgKGkgPSAwOyBpIDwgREVGX05JRFNfUEVSX0lOT0RFOyBp
KyspIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICBpZiAocmktPmlfbmlkW2ldKQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiArIH0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgcmV0dXJuIGZhbHNl
Owo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICtib29sIGYyZnNfc2FuaXR5X2NoZWNrX2lubGluZV9kYXRhKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICppcGFnZSkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ICAgICAgIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgIGlmICghZjJmc19oYXNf
aW5saW5lX2RhdGEoaW5vZGUpKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArIGlmIChoYXNfbm9kZV9i
bG9ja3MoaW5vZGUsIGlwYWdlKSkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICBpZiAoIXN1cHBvcnRfaW5saW5lX2RhdGEoaW5vZGUpKQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiA+ID4gPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IGMyNmVmZmRjZTlhYS4uMTQyM2NkMjdhNDc3IDEwMDY0
NAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiArKysgYi9mcy9mMmZzL2lub2RlLmMKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEBA
IC0zNDMsNyArMzQzLDcgQEAgc3RhdGljIGJvb2wgc2FuaXR5X2NoZWNrX2lub2RlKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpub2RlX3BhZ2UpCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAg
IH0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0gaWYgKGYyZnNfc2FuaXR5X2NoZWNrX2lubGluZV9k
YXRhKGlub2RlKSkgewo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyBpZiAoZjJmc19zYW5pdHlfY2hl
Y2tfaW5saW5lX2RhdGEoaW5vZGUsIG5vZGVfcGFnZSkpIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgZjJmc193YXJuKHNiaSwgIiVzOiBpbm9kZSAoaW5vPSVseCwg
bW9kZT0ldSkgc2hvdWxkIG5vdCBoYXZlIGlubGluZV9kYXRhLCBydW4gZnNjayB0byBmaXgiLAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5j
X18sIGlub2RlLT5pX2lubywgaW5vZGUtPmlfbW9kZSk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0t
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
