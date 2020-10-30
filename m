Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0E2A016E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 10:30:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYQkA-0004Qq-Kj; Fri, 30 Oct 2020 09:30:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kYQk8-0004Qd-JG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 09:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/GGhapQ9N9pbleNYDX4oojw6U6/ctL5zdXO2+CKaGo=; b=gVdlxLblkUvVIkdwsF/Ow+mHra
 VkgAjOT0+WItVekYti0w6vE2cWLZVh1DRqNkb4JVnW1WxjDMo8lIhWJQNJHws08T9pKOn/NMzglsp
 JW4BYwIscdhCCp6gSzA3ASz0KbfH7aPJCouDUhBF5R+MGENFg67kDKd2G8IrvOuUiSh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/GGhapQ9N9pbleNYDX4oojw6U6/ctL5zdXO2+CKaGo=; b=mS5tg38T4ddGyAt7tnEbx0NKEH
 iwDh956NKXdHyQ551GAXKWY9OANyvimU06ov64mgeX8VgcyLbI+HDV0Tj+ScU9xcPOW2TGXfSwrBz
 MpL+4KuJHJHmQ3kx/hx0UKKCYcvDh1GUzm+8s68kB4zhJE2kEmL+TVLEBQnEABnkd6sE=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYQjz-002Jd3-LR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 09:30:44 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMxJT2Bygz15MDP;
 Fri, 30 Oct 2020 17:06:49 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 17:06:45 +0800
To: kitestramuort <kitestramuort@autistici.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
 <1c0ea7b6-73b5-9027-e67f-3dfff8e50855@huawei.com>
 <2a029c2ad9ae558adb5147be767329e542b20b50.camel@autistici.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ab249f17-0c0c-6a16-c38b-e0a702cd5223@huawei.com>
Date: Fri, 30 Oct 2020 17:06:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2a029c2ad9ae558adb5147be767329e542b20b50.camel@autistici.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kYQjz-002Jd3-LR
Subject: Re: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8xMC8zMCAxNjo1Niwga2l0ZXN0cmFtdW9ydCB3cm90ZToKPiBPbiBGcmksIDIwMjAt
MTAtMzAgYXQgMDk6NTAgKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjAvMTAvMzAgMDo0
MCwga2l0ZXN0cmFtdW9ydCB3cm90ZToKPj4+IEhlbGxvLAo+Pj4gdGhlIG5ldyByYyBpcyBnZW5l
cmF0aW5nwqB0aGUgZXJyb3IgYmVsb3cgbXVsdGlwbGUgdGltZXMgYSBmZXcKPj4+IG1pbnV0ZXMK
Pj4+IGFmdGVyIGJvb3QuCj4+Pgo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIHRyeSBmc2NrIC0tZHJ5
LXJ1biwgYW5kIHNoYXJlIHRoZSBvdXRwdXQ/CgpXaGF0J3MgeW91ciBmc2NrIHZlcnNpb24/IGNv
dWxkIHlvdSB0cnkgbGFzdCB2MS4xNCBmc2NrPwoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1ay9mMmZzLXRvb2xzLmdpdAoKID4gWyAxNDA1LjUz
MjQ4OV0gID8gMHhmZmZmZmZmZmE1MzczMWZiCgpJdCBkb2Vzbid0IHByaW50IGZ1bmN0aW9uIG5h
bWUgaW4gY2FsbHN0YWNrLCBjb3VsZCB5b3UgY2hlY2sgeW91ciBsaW5rZXIKb3B0aW9uLCBJIGd1
ZXNzIGl0IG5lZWRzIHRvIGFkZCAtcmR5bmFtaWMgb3B0aW9uPyBub3Qgc3VyZS4KCj4gCj4gSW5m
bzogRHJ5IHJ1bgo+IEluZm86IFNlZ21lbnRzIHBlciBzZWN0aW9uID0gMQo+IEluZm86IFNlY3Rp
b25zIHBlciB6b25lID0gMQo+IEluZm86IHNlY3RvciBzaXplID0gNTEyCj4gSW5mbzogdG90YWwg
c2VjdG9ycyA9IDE2OTI0Mjc2NjMgKDgyNjM4MCBNQikKPiBJbmZvOiBNS0ZTIHZlcnNpb24KPiAg
ICAiTGludXggdmVyc2lvbiA0LjIwLjAtYXJjaDEtMS1BUkNIIChidWlsZHVzZXJAaGVmdGlnLTI5
ODU5KSAoZ2NjCj4gdmVyc2lvbiA4LjIuMSAyMDE4MTEyNyAoR0NDKSkgIzEgU01QIFBSRUVNUFQg
TW9uIERlYyAyNCAwMzowMDo0MCBVVEMKPiAyMDE4Igo+IEluZm86IEZTQ0sgdmVyc2lvbgo+ICAg
IGZyb20gIkxpbnV4IHZlcnNpb24gNS4yLjUtYXJjaDEtMS1BUkNIIChidWlsZHVzZXJAaGVmdGln
LTExODkwOCkgKGdjYwo+IHZlcnNpb24gOS4xLjAgKEdDQykpICMxIFNNUCBQUkVFTVBUIFdlZCBK
dWwgMzEgMDg6MzA6MzQgVVRDIDIwMTkiCj4gICAgICB0byAiTGludXggdmVyc2lvbiA1LjEwLjAt
cmMxLVMgKHJvb3RAeDIxMCkgKGdjYyAoR0NDKSAxMC4yLjAsIEdOVQo+IGxkIChHTlUgQmludXRp
bHMpIDIuMzUuMSkgIzggU01QIFBSRUVNUFQgV2VkIE9jdCAyOCAxODo1ODoyOCBDRVQgMjAyMCIK
PiBJbmZvOiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMCA6Cj4gSW5mbzogc3VwZXJibG9jayBlbmNy
eXB0IGxldmVsID0gMCwgc2FsdCA9Cj4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAK
PiBJbmZvOiB0b3RhbCBGUyBzZWN0b3JzID0gMTY5MjQyNzY1NiAoODI2MzgwIE1CKQo+IEluZm86
IENLUFQgdmVyc2lvbiA9IDI4NDc3NTUKPiBJbmZvOiBjaGVja3BvaW50IHN0YXRlID0gNTUgOiAg
Y3JjIGZzY2sgY29tcGFjdGVkX3N1bW1hcnkgdW5tb3VudAo+IAo+IFtGU0NLXSBVbnJlYWNoYWJs
ZSBuYXQgZW50cmllcyAgICAgICAgICAgICAgICAgICAgICAgIFtPay4uXSBbMHgwXQo+IFtGU0NL
XSBTSVQgdmFsaWQgYmxvY2sgYml0bWFwIGNoZWNraW5nICAgICAgICAgICAgICAgIFtPay4uXQo+
IFtGU0NLXSBIYXJkIGxpbmsgY2hlY2tpbmcgZm9yIHJlZ3VsYXIgZmlsZSAgICAgICAgICAgIFtP
ay4uXSBbMHg1MGNdCj4gW0ZTQ0tdIHZhbGlkX2Jsb2NrX2NvdW50IG1hdGNoaW5nIHdpdGggQ1Ag
ICAgICAgICAgICAgW09rLi5dCj4gWzB4OTU4OTgxOV0KPiBbRlNDS10gdmFsaWRfbm9kZV9jb3Vu
dCBtYXRjaGluZyB3aXRoIENQIChkZSBsb29rdXApICBbT2suLl0gWzB4MmJlYzk3XQo+IFtGU0NL
XSB2YWxpZF9ub2RlX2NvdW50IG1hdGNoaW5nIHdpdGggQ1AgKG5hdCBsb29rdXApIFtPay4uXSBb
MHgyYmVjOTddCj4gW0ZTQ0tdIHZhbGlkX2lub2RlX2NvdW50IG1hdGNoZWQgd2l0aCBDUCAgICAg
ICAgICAgICAgW09rLi5dIFsweDI5Zjk4NV0KPiBbRlNDS10gZnJlZSBzZWdtZW50X2NvdW50IG1h
dGNoZWQgd2l0aCBDUCAgICAgICAgICAgICBbT2suLl0gWzB4MTgxMDVdCj4gW0ZTQ0tdIG5leHQg
YmxvY2sgb2Zmc2V0IGlzIGZyZWUgICAgICAgICAgICAgICAgICAgICAgW09rLi5dCj4gW0ZTQ0td
IGZpeGluZyBTSVQgdHlwZXMKPiBbRlNDS10gb3RoZXIgY29ycnVwdGVkIGJ1Z3MgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbT2suLl0KPiAKPiBEb25lOiAyNjMuMjUwODUwIHNlY3MKPiAKPiAu
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
