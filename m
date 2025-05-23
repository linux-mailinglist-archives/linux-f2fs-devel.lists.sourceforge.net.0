Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFAAC1A17
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 04:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3s2p+g1iTB9zbuhBx0Ml35btpnCkXqkMtQ9DBO/kkso=; b=fqa305Bg/vl05vOFntwfKIJYEj
	AcPJPhHUd3g0hphhXe2O5n2CYlsbn1lRHxu4R3xI3ngScrVo87unOOOpS7NeSdYhq9wLkHaPtSw7C
	gQ+RYs7jY0V/yTzJhzT8D9Wxk/qpDOtzk9xK7BiXbYy9xA/uksjo6V5xUqNm8QH5AH0w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIIDV-0001nc-E6;
	Fri, 23 May 2025 02:33:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uIIDT-0001nW-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 02:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p4Wwmq/Uo4hs38PdQTmmnkZXVRJ7sfB4WXNpS8ox+Eg=; b=QN0Wdhhjfw5pZiepXSfe4Vv6ps
 4Ffvb0i6Ihz22Ka6P3LsOE5TzXiPDWoj6HR3Suu9JeUokh5k5F2/xu/6kmB6rN0AmeSCcvnz4IncM
 dz5g7sTMt/qUD2lI2P5Ji98vlLfSD0jUurQo+6rNtB01L5hp3JHwcPkhWXWXCmhlasVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p4Wwmq/Uo4hs38PdQTmmnkZXVRJ7sfB4WXNpS8ox+Eg=; b=bcNbixUHqG0EDYY1NBGH5eD/Rc
 Y0MpHGZS0JUpy41CsIaOsMrI71tXXxnJZnnlQL4nt+wPrQz1q5QYmr13bPsr9aK8/0TooN/K4Jh+k
 fULgChzdXquTzX1nhA2FzE+If3DB5fwmXLLwULe7Ufztrf+sG9G3bo2KqFYq911c5cJQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uIIDS-0004hp-OA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 02:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4B2ED437D0;
 Fri, 23 May 2025 02:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEDEC4CEE4;
 Fri, 23 May 2025 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747967573;
 bh=S25lebnZRW5zzcfOg+loS2fbdOdPCUzd3TChisW/CfM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=F70IWq7dbwv1hU8ShOf7gZi/CeN0tFvoDF/xdoDjSTCg7r69c/Nt/aZXOj63N0ij6
 EsTNnnsgvIGGihMY7zUF3qyupf5ueE3KRoR0fr4rXRjgahIQmOM85ZWuMF3CsmcSsl
 PACw7y/5qOob1AoSrjQvhQmhqzo84vhUsN3AwDgKjXOiCzLORdjAkUw0EMOYXEA9J7
 D090s/p8cjd12xL6xZf+uYZ8/54BLYTuPVCdfW8D76FPtHfq41zWbh0wk5ARVTo4Df
 ROP1ePaGxKlyCO0NFHJanemjV1dV7+MGBSSuw/Xvf440cMwssyrOhVKyBclXAM1lkP
 ZA4j77cZtlZPw==
Message-ID: <6c51b7aa-8caa-4dae-b079-01ea8571599b@kernel.org>
Date: Fri, 23 May 2025 10:32:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250521115635.829744-1-chao@kernel.org>
 <CAHJ8P3J8cX5+pVkE4TT24zh+wvW06KrpKXT2-7cRx3i8XzBbNw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3J8cX5+pVkE4TT24zh+wvW06KrpKXT2-7cRx3i8XzBbNw@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 5/23/25 09:39, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年5月21日周三 20:02写道：
    >> >> INFO: task syz-executor328:5856 blocked for [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [172.234.252.31 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [172.234.252.31 listed in bl.score.senderscore.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uIIDS-0004hp-OA
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
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
Cc: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com,
 Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS8yMy8yNSAwOTozOSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IHZpYSBMaW51eC1m
MmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiDkuo4y
MDI15bm0NeaciDIx5pel5ZGo5LiJIDIwOjAy5YaZ6YGT77yaCj4+Cj4+IElORk86IHRhc2sgc3l6
LWV4ZWN1dG9yMzI4OjU4NTYgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDE0NCBzZWNvbmRzLgo+PiAg
ICAgICBOb3QgdGFpbnRlZCA2LjE1LjAtcmM2LXN5emthbGxlci0wMDIwOC1nM2MyMTQ0MWVlZmZj
ICMwCj4+ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3Mi
IGRpc2FibGVzIHRoaXMgbWVzc2FnZS4KPj4gdGFzazpzeXotZXhlY3V0b3IzMjggc3RhdGU6RCBz
dGFjazoyNDM5MiBwaWQ6NTg1NiAgdGdpZDo1ODMyICBwcGlkOjU4MjYgICB0YXNrX2ZsYWdzOjB4
NDAwMDQwIGZsYWdzOjB4MDAwMDQwMDYKPj4gQ2FsbCBUcmFjZToKPj4gIDxUQVNLPgo+PiAgY29u
dGV4dF9zd2l0Y2gga2VybmVsL3NjaGVkL2NvcmUuYzo1MzgyIFtpbmxpbmVdCj4+ICBfX3NjaGVk
dWxlKzB4MTY4Zi8weDRjNzAga2VybmVsL3NjaGVkL2NvcmUuYzo2NzY3Cj4+ICBfX3NjaGVkdWxl
X2xvb3Aga2VybmVsL3NjaGVkL2NvcmUuYzo2ODQ1IFtpbmxpbmVdCj4+ICBzY2hlZHVsZSsweDE2
NS8weDM2MCBrZXJuZWwvc2NoZWQvY29yZS5jOjY4NjAKPj4gIGlvX3NjaGVkdWxlKzB4ODEvMHhl
MCBrZXJuZWwvc2NoZWQvY29yZS5jOjc3NDIKPj4gIGYyZnNfYmFsYW5jZV9mcysweDRiNC8weDc4
MCBmcy9mMmZzL3NlZ21lbnQuYzo0NDQKPj4gIGYyZnNfbWFwX2Jsb2NrcysweDNhZjEvMHg0M2Iw
IGZzL2YyZnMvZGF0YS5jOjE3OTEKPj4gIGYyZnNfZXhwYW5kX2lub2RlX2RhdGErMHg2NTMvMHhh
ZjAgZnMvZjJmcy9maWxlLmM6MTg3Mgo+PiAgZjJmc19mYWxsb2NhdGUrMHg0ZjUvMHg5OTAgZnMv
ZjJmcy9maWxlLmM6MTk3NQo+PiAgdmZzX2ZhbGxvY2F0ZSsweDZhMC8weDgzMCBmcy9vcGVuLmM6
MzM4Cj4+ICBpb2N0bF9wcmVhbGxvY2F0ZSBmcy9pb2N0bC5jOjI5MCBbaW5saW5lXQo+PiAgZmls
ZV9pb2N0bCBmcy9pb2N0bC5jOi0xIFtpbmxpbmVdCj4+ICBkb192ZnNfaW9jdGwrMHgxYjhmLzB4
MWViMCBmcy9pb2N0bC5jOjg4NQo+PiAgX19kb19zeXNfaW9jdGwgZnMvaW9jdGwuYzo5MDQgW2lu
bGluZV0KPj4gIF9fc2Vfc3lzX2lvY3RsKzB4ODIvMHgxNzAgZnMvaW9jdGwuYzo4OTIKPj4gIGRv
X3N5c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo2MyBbaW5saW5lXQo+PiAg
ZG9fc3lzY2FsbF82NCsweGY2LzB4MjEwIGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo5NAo+
PiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zgo+Pgo+PiBUaGUgcm9v
dCBjYXVzZSBpcyBhZnRlciBjb21taXQgODRiNWJiOGJmMGY2ICgiZjJmczogbW9kaWZ5Cj4+IGYy
ZnNfaXNfY2hlY2twb2ludF9yZWFkeSBsb2dpYyB0byBhbGxvdyBtb3JlIGRhdGEgdG8gYmUgd3Jp
dHRlbiB3aXRoIHRoZQo+PiBDUCBkaXNhYmxlIiksIHdlIHdpbGwgZ2V0IGNoYW5jZSB0byBhbGxv
dyBmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoKSB0bwo+PiByZXR1cm4gdHJ1ZSBvbmNlIGJlbG93
IGNvbmRpdGlvbnMgYXJlIGFsbCB0cnVlOgo+PiAxLiBjaGVja3BvaW50IGlzIGRpc2FibGVkCj4+
IDIuIHRoZXJlIGFyZSBub3QgZW5vdWdoIGZyZWUgc2VnbWVudHMKPj4gMy4gdGhlcmUgYXJlIGVu
b3VnaCBmcmVlIGJsb2Nrcwo+Pgo+PiBUaGVuIGl0IHdpbGwgY2F1c2UgZjJmc19iYWxhbmNlX2Zz
KCkgdG8gdHJpZ2dlciBmb3JlZ3JvdW5kIEdDLgo+Pgo+PiB2b2lkIGYyZnNfYmFsYW5jZV9mcyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgbmVlZCkKPj4gLi4uCj4+ICAgICAgICAgaWYg
KCFmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPj4gICAgICAgICAgICAgICAgIHJldHVy
bjsKPj4KPj4gQW5kIGl0IG1vdW50cyBmMmZzIGltYWdlIHcvIGdjX21lcmdlLGNoZWNrcG9pbnQ9
ZGlzYWJsZSwgc28gYmVsb3cgZGVhZGxvb3AKPj4gd2lsbCBoYXBwZW46Cj4+Cj4+IC0gZjJmc19k
b19zaHV0ZG93biAgICAgICAgICAgICAgLSB2ZnNfZmFsbG9jYXRlICAgICAgICAgICAgICAgICAg
ICAgICAgIC0gZ2NfdGhyZWFkX2Z1bmMKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLSBmaWxlX3N0YXJ0X3dyaXRlCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIF9fc2Jfc3RhcnRfd3JpdGUoU0JfRlJFRVpFX1dSSVRFKQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtIGYyZnNfZmFsbG9jYXRlCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtIGYyZnNfZXhwYW5kX2lub2RlX2RhdGEKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbWFwX2Jsb2Nrcwo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtIGYyZnNfYmFsYW5jZV9mcwo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLSBwcmVwYXJlX3RvX3dhaXQKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0gd2FrZV91cChnY193YWl0X3F1ZXVlX2hlYWQpCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGlvX3NjaGVkdWxlCj4+ICAtIGJk
ZXZfZnJlZXplCj4+ICAgLSBmcmVlemVfc3VwZXIKPj4gICAgLSBzYi0+c193cml0ZXJzLmZyb3pl
biA9IFNCX0ZSRUVaRV9XUklURTsKPj4gICAgLSBzYl93YWl0X3dyaXRlKHNiLCBTQl9GUkVFWkVf
V1JJVEUpOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBpZiAoc2JpLT5zYi0+c193cml0ZXJzLmZyb3pl
biA+PSBTQl9GUkVFWkVfV1JJVEUpIGNvbnRpbnVlOwo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBjYXVz
ZSBkZWFkbG9vcAo+Pgo+PiBUaGlzIHBhdGNoIGZpeCB0byBhZGQgY2hlY2sgY29uZGl0aW9uIGlu
IGYyZnNfYmFsYW5jZV9mcygpLCBzbyB0aGF0IGlmCj4+IGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQs
IHdlIHdpbGwganVzdCBza2lwIHRyaWdnZXIgZm9yZWdyb3VuZCBHQyB0bwo+PiBhdm9pZCBhYm92
ZSBkZWFkbG9vcCBpc3N1ZS4KPj4KPj4gUmVwb3J0ZWQtYnk6IHN5emJvdCthYTViYjVmNjg2MGUw
OGE2MDQ1MEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC82ODJkNzQzYS5hMDBhMDIyMC4yOWJjMjYuMDI4
OS5HQUVAZ29vZ2xlLmNvbQo+PiBGaXhlczogODRiNWJiOGJmMGY2ICgiZjJmczogbW9kaWZ5IGYy
ZnNfaXNfY2hlY2twb2ludF9yZWFkeSBsb2dpYyB0byBhbGxvdyBtb3JlIGRhdGEgdG8gYmUgd3Jp
dHRlbiB3aXRoIHRoZSBDUCBkaXNhYmxlIikKPj4gQ2M6IFFpIEhhbiA8aGFucWlAdml2by5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+IHYy
Ogo+PiAtIGFkZCBtaXNzaW5nIENsb3NlcyBsaW5lCj4+IC0gZml4IHRvIHVzZSBnaXQgY29tbWl0
IGRlc2NyaXB0aW9uIHN0eWxlCj4+Cj4+ICBmcy9mMmZzL3NlZ21lbnQuYyB8IDIgKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gaW5kZXggNWZmMDExMWVkOTc0Li4xOWI3
MTZmZGE3MmEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+ICsrKyBiL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4+IEBAIC00MzMsNiArNDMzLDggQEAgdm9pZCBmMmZzX2JhbGFuY2VfZnMo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIG5lZWQpCj4+ICAgICAgICAgaWYgKG5lZWQg
JiYgZXhjZXNzX2NhY2hlZF9uYXRzKHNiaSkpCj4+ICAgICAgICAgICAgICAgICBmMmZzX2JhbGFu
Y2VfZnNfYmcoc2JpLCBmYWxzZSk7Cj4+Cj4+ICsgICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9m
bGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKQo+PiArICAgICAgICAgICAgICAgcmV0dXJu
Owo+PiAgICAgICAgIGlmICghZjJmc19pc19jaGVja3BvaW50X3JlYWR5KHNiaSkpCj4+ICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4gSGkgQ2hhbywKPiBXaGVuIEkgcmVhZCB0aGlzIHBhdGNoLCBJ
IGZlZWwgdGhhdCBpdCBpcyBzb21ld2hhdCByZWR1bmRhbnQgd2l0aCB0aGUKPiBmb2xsb3dpbmcg
Y2hlY2tpbmcgYWJvdXQgU0JJX0NQX0RJU0FCTEVEIGluIGYyZnNfaXNfY2hlY2twb2ludF9yZWFk
eS4KPiBDYW4gd2UgcmVvcmdhbml6ZSB0aGVzZSBjaGVja3MgZm9yIHRoZSBmMmZzX2JhbGFuY2Vf
ZnMgY2FzZT8KClpoaWd1bywKCk9oLCBJIGFncmVlZC4gSSB0aGluayB3ZSBjYW4ganVzdCB1c2Ug
aXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQX0RJU0FCTEVEKQppbnN0ZWFkIG9mIGYyZnNfaXNf
Y2hlY2twb2ludF9yZWFkeSgpIGhlcmUsIGxldCBtZSByZXZpc2UgaXQgaW4gdjMuCgotICAgICAg
IGlmICghZjJmc19pc19jaGVja3BvaW50X3JlYWR5KHNiaSkpCisgICAgICAgaWYgKHVubGlrZWx5
KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKQoKVGhhbmtzLAoKPiBUaGlz
IHdpbGwgbWFrZSB0aGUgY29kZSBlYXNpZXIgdG8gcmVhZCBhbmQgdW5kZXJzdGFuZC4KPiB0aGFu
a3MhCj4+Cj4+IC0tCj4+IDIuNDkuMAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
