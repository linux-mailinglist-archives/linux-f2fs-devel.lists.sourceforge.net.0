Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CBE9160A9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 10:10:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM1FV-00007d-2i;
	Tue, 25 Jun 2024 08:09:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1sM1FT-00007H-BX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 08:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TFe37Lm2kh+1TC1JA7q8jV7ydRwDp1EsP+Y+byFXD4U=; b=g0MvMpC1OLn8/We5sr70KZwF87
 R1Z1GUN4dk6RjuySauO/zgqyUcTdnbfE8IJmH4HJJFeyGF3qtYDuO4LR+nynzPsYB+JAqzSOH6D3g
 494OoMb08RQ8ps6bh5M4NR9aOMthSLDC+6PUaOnA8ISZah2aStbiZSMbDRJ9PEroE3kI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TFe37Lm2kh+1TC1JA7q8jV7ydRwDp1EsP+Y+byFXD4U=; b=NcuA52glSWd41bDNC75g23AgcD
 2P0YQyG+lrVdAfNzef4ugWOS0QcAgZS0uPxLgobkbGQmtBtGuxEeFGrRabpN6hRtCX5FnFrhGcwJE
 EhmJZB+eg6/5yNI1jhhqyAEmm89/wDmD8XS7j32Jt+zXKB+06KTHychZlobMLraNsGHc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM1FS-0008L8-LO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 08:09:55 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 45P89In1041528;
 Tue, 25 Jun 2024 16:09:18 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4W7cn20YQWz2RR8CR;
 Tue, 25 Jun 2024 16:04:38 +0800 (CST)
Received: from BJMBX02.spreadtrum.com (10.0.64.8) by BJMBX01.spreadtrum.com
 (10.0.64.7) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 25 Jun
 2024 16:09:16 +0800
Received: from BJMBX02.spreadtrum.com ([fe80::c8c3:f3a0:9c9f:b0fb]) by
 BJMBX02.spreadtrum.com ([fe80::c8c3:f3a0:9c9f:b0fb%19]) with mapi id
 15.00.1497.023; Tue, 25 Jun 2024 16:09:16 +0800
From: =?utf-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v4] f2fs: reduce expensive checkpoint trigger frequency
Thread-Index: AQHaxsyvfbyyiC9cGUGrinilm9Ljg7HYIB4A
Date: Tue, 25 Jun 2024 08:09:16 +0000
Message-ID: <a861d9aaf9394aa6bc77548735629f87@BJMBX02.spreadtrum.com>
References: <20240625065459.3665791-1-chao@kernel.org>
In-Reply-To: <20240625065459.3665791-1-chao@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.93.65]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 45P89In1041528
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  -----邮件原件----- 发件人: Chao Yu <chao@kernel.org>
    发送时间: 2024年6月25日 14:55 收件人: jaegeuk@kernel.org 抄送:
    linux-f2fs-devel@lists.sourceforge.net; linux-kernel@vger.kernel. [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [222.66.158.135 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [222.66.158.135 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [222.66.158.135 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sM1FS-0008L8-LO
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IHJlZHVjZSBl?=
 =?utf-8?q?xpensive_checkpoint_trigger_frequency?=
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
Cc: =?utf-8?B?546L55qTIChIYW9faGFvIFdhbmcp?= <Hao_hao.Wang@unisoc.com>,
 wangzijie <wangzijie1@honor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPiANCuWPkemAgeaXtumXtDogMjAyNOW5tDbmnIgyNeaXpSAxNDo1NQ0K5pS25Lu25Lq6
OiBqYWVnZXVrQGtlcm5lbC5vcmcNCuaKhOmAgTogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz47IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+OyDniZvlv5flm70g
KFpoaWd1byBOaXUpIDxaaGlndW8uTml1QHVuaXNvYy5jb20+OyBZdW5sZWkgSGUgPGhleXVubGVp
QGhpaG9ub3IuY29tPg0K5Li76aKYOiBbUEFUQ0ggdjRdIGYyZnM6IHJlZHVjZSBleHBlbnNpdmUg
Y2hlY2twb2ludCB0cmlnZ2VyIGZyZXF1ZW5jeQ0KDQoNCuazqOaEjzog6L+Z5bCB6YKu5Lu25p2l
6Ieq5LqO5aSW6YOo44CC6Zmk6Z2e5L2g56Gu5a6a6YKu5Lu25YaF5a655a6J5YWo77yM5ZCm5YiZ
5LiN6KaB54K55Ye75Lu75L2V6ZO+5o6l5ZKM6ZmE5Lu244CCDQpDQVVUSU9OOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5k
ZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KDQoNCldlIG1heSB0cmlnZ2VyIGhp
Z2ggZnJlcXVlbnQgY2hlY2twb2ludCBmb3IgYmVsb3cgY2FzZToNCjEuIG1rZGlyIC9tbnQvZGly
MTsgc2V0IGRpcjEgZW5jcnlwdGVkDQoyLiB0b3VjaCAvbW50L2ZpbGUxOyBmc3luYyAvbW50L2Zp
bGUxDQozLiBta2RpciAvbW50L2RpcjI7IHNldCBkaXIyIGVuY3J5cHRlZA0KNC4gdG91Y2ggL21u
dC9maWxlMjsgZnN5bmMgL21udC9maWxlMg0KLi4uDQoNCkFsdGhvdWdoLCBuZXdseSBjcmVhdGVk
IGRpciBhbmQgZmlsZSBhcmUgbm90IHJlbGF0ZWQsIGR1ZSB0byBjb21taXQgYmJmMTU2ZjdhZmE3
ICgiZjJmczogZml4IGxvc3QgeGF0dHJzIG9mIGRpcmVjdG9yaWVzIiksIHdlIHdpbGwgdHJpZ2dl
ciBjaGVja3BvaW50IHdoZW5ldmVyIGZzeW5jKCkgY29tZXMgYWZ0ZXIgYSBuZXcgZW5jcnlwdGVk
IGRpciBjcmVhdGVkLg0KDQpJbiBvcmRlciB0byBhdm9pZCBzdWNoIHBlcmZvcm1hbmNlIHJlZ3Jl
c3Npb24gaXNzdWUsIGxldCdzIHJlY29yZCBhbiBlbnRyeSBpbmNsdWRpbmcgZGlyZWN0b3J5J3Mg
aW5vIGluIGdsb2JhbCBjYWNoZSB3aGVuZXZlciB3ZSB1cGRhdGUgZGlyZWN0b3J5J3MgeGF0dHIg
ZGF0YSwgYW5kIHRoZW4gdHJpZ2dlcnJpbmcgY2hlY2twb2ludCgpIG9ubHkgaWYgeGF0dHIgbWV0
YWRhdGEgb2YgdGFyZ2V0IGZpbGUncyBwYXJlbnQgd2FzIHVwZGF0ZWQuDQoNClRoaXMgcGF0Y2gg
dXBkYXRlcyB0byBjb3ZlciBiZWxvdyBubyBlbmNyeXB0aW9uIGNhc2UgYXMgd2VsbDoNCjEpIHBh
cmVudCBpcyBjaGVja3BvaW50ZWQNCjIpIHNldF94YXR0cihkaXIpIHcvIG5ldyB4bmlkDQozKSBj
cmVhdGUoZmlsZSkNCjQpIGZzeW5jKGZpbGUpDQoNCkZpeGVzOiBiYmYxNTZmN2FmYTcgKCJmMmZz
OiBmaXggbG9zdCB4YXR0cnMgb2YgZGlyZWN0b3JpZXMiKQ0KUmVwb3J0ZWQtYnk6IHdhbmd6aWpp
ZSA8d2FuZ3ppamllMUBob25vci5jb20+DQpSZXBvcnRlZC1ieTogWmhpZ3VvIE5pdSA8emhpZ3Vv
Lm5pdUB1bmlzb2MuY29tPg0KVGVzdGVkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNv
Yy5jb20+DQpSZXBvcnRlZC1ieTogWXVubGVpIEhlIDxoZXl1bmxlaUBoaWhvbm9yLmNvbT4NClNp
Z25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4NCi0tLQ0KIGZzL2YyZnMvZjJm
cy5oICAgICAgICAgICAgICB8ICAyICsrDQogZnMvZjJmcy9maWxlLmMgICAgICAgICAgICAgIHwg
IDMgKysrDQogZnMvZjJmcy94YXR0ci5jICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrLS0N
CiBpbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmggfCAgMyArKy0NCiA0IGZpbGVzIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9mcy9mMmZz
L2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4IGYxZDY1ZWUzYWRkZi4uZjNjOTEwYjg5ODNi
IDEwMDY0NA0KLS0tIGEvZnMvZjJmcy9mMmZzLmgNCisrKyBiL2ZzL2YyZnMvZjJmcy5oDQpAQCAt
Mjg0LDYgKzI4NCw3IEBAIGVudW0gew0KICAgICAgICBBUFBFTkRfSU5PLCAgICAgICAgICAgICAv
KiBmb3IgYXBwZW5kIGlubyBsaXN0ICovDQogICAgICAgIFVQREFURV9JTk8sICAgICAgICAgICAg
IC8qIGZvciB1cGRhdGUgaW5vIGxpc3QgKi8NCiAgICAgICAgVFJBTlNfRElSX0lOTywgICAgICAg
ICAgLyogZm9yIHRyYW5zYWN0aW9ucyBkaXIgaW5vIGxpc3QgKi8NCisgICAgICAgRU5DX0RJUl9J
Tk8sICAgICAgICAgICAgLyogZm9yIGVuY3J5cHRlZCBkaXIgaW5vIGxpc3QgKi8NCiAgICAgICAg
RkxVU0hfSU5PLCAgICAgICAgICAgICAgLyogZm9yIG11bHRpcGxlIGRldmljZSBmbHVzaGluZyAq
Lw0KICAgICAgICBNQVhfSU5PX0VOVFJZLCAgICAgICAgICAvKiBtYXguIGxpc3QgKi8NCiB9Ow0K
QEAgLTExNTAsNiArMTE1MSw3IEBAIGVudW0gY3BfcmVhc29uX3R5cGUgew0KICAgICAgICBDUF9G
QVNUQk9PVF9NT0RFLA0KICAgICAgICBDUF9TUEVDX0xPR19OVU0sDQogICAgICAgIENQX1JFQ09W
RVJfRElSLA0KKyAgICAgICBDUF9FTkNfRElSLA0KIH07DQoNCiBlbnVtIGlvc3RhdF90eXBlIHsN
CmRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jIGluZGV4IGE1Mjdk
ZTFlN2EyZi4uMjc4NTczOTc0ZGI0IDEwMDY0NA0KLS0tIGEvZnMvZjJmcy9maWxlLmMNCisrKyBi
L2ZzL2YyZnMvZmlsZS5jDQpAQCAtMjE3LDYgKzIxNyw5IEBAIHN0YXRpYyBpbmxpbmUgZW51bSBj
cF9yZWFzb25fdHlwZSBuZWVkX2RvX2NoZWNrcG9pbnQoc3RydWN0IGlub2RlICppbm9kZSkNCiAg
ICAgICAgICAgICAgICBmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0YShzYmksIEYyRlNfSShpbm9kZSkt
PmlfcGlubywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVFJBTlNfRElSX0lOTykpDQogICAgICAgICAgICAgICAgY3BfcmVhc29uID0gQ1Bf
UkVDT1ZFUl9ESVI7DQorICAgICAgIGVsc2UgaWYgKGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNi
aSwgRjJGU19JKGlub2RlKS0+aV9waW5vLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBFTkNfRElSX0lOTykpDQorICAgICAgICAgICAgICAg
Y3BfcmVhc29uID0gQ1BfRU5DX0RJUjsNCg0KICAgICAgICByZXR1cm4gY3BfcmVhc29uOw0KIH0N
CmRpZmYgLS1naXQgYS9mcy9mMmZzL3hhdHRyLmMgYi9mcy9mMmZzL3hhdHRyLmMgaW5kZXggZjI5
MGZlOTMyN2M0Li5kMDRjMGI0N2E0ZTQgMTAwNjQ0DQotLS0gYS9mcy9mMmZzL3hhdHRyLmMNCisr
KyBiL2ZzL2YyZnMveGF0dHIuYw0KQEAgLTYyOSw2ICs2MjksNyBAQCBzdGF0aWMgaW50IF9fZjJm
c19zZXR4YXR0cihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgaW5kZXgsDQogICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLCBjb25zdCB2b2lkICp2YWx1ZSwgc2l6ZV90IHNp
emUsDQogICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqaXBhZ2UsIGludCBmbGFn
cykgIHsNCisgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2Rl
KTsNCiAgICAgICAgc3RydWN0IGYyZnNfeGF0dHJfZW50cnkgKmhlcmUsICpsYXN0Ow0KICAgICAg
ICB2b2lkICpiYXNlX2FkZHIsICpsYXN0X2Jhc2VfYWRkcjsNCiAgICAgICAgaW50IGZvdW5kLCBu
ZXdzaXplOw0KQEAgLTc3Miw5ICs3NzMsMTggQEAgc3RhdGljIGludCBfX2YyZnNfc2V0eGF0dHIo
c3RydWN0IGlub2RlICppbm9kZSwgaW50IGluZGV4LA0KICAgICAgICBpZiAoaW5kZXggPT0gRjJG
U19YQVRUUl9JTkRFWF9FTkNSWVBUSU9OICYmDQogICAgICAgICAgICAgICAgICAgICAgICAhc3Ry
Y21wKG5hbWUsIEYyRlNfWEFUVFJfTkFNRV9FTkNSWVBUSU9OX0NPTlRFWFQpKQ0KICAgICAgICAg
ICAgICAgIGYyZnNfc2V0X2VuY3J5cHRlZF9pbm9kZShpbm9kZSk7DQotICAgICAgIGlmIChTX0lT
RElSKGlub2RlLT5pX21vZGUpKQ0KLSAgICAgICAgICAgICAgIHNldF9zYmlfZmxhZyhGMkZTX0lf
U0IoaW5vZGUpLCBTQklfTkVFRF9DUCk7DQoNCisgICAgICAgaWYgKCFTX0lTRElSKGlub2RlLT5p
X21vZGUpKQ0KKyAgICAgICAgICAgICAgIGdvdG8gc2FtZTsNCisgICAgICAgLyoNCisgICAgICAg
ICogSW4gcmVzdHJpY3QgbW9kZSwgZnN5bmMoKSBhbHdheXMgdHJ5IHRvIHRyaWdnZXIgY2hlY2tw
b2ludCBmb3IgYWxsDQorICAgICAgICAqIG1ldGFkYXRhIGNvbnNpc3RlbmN5LCBpbiBvdGhlciBt
b2RlLCBpdCB0cmlnZ2VycyBjaGVja3BvaW50IHdoZW4NCisgICAgICAgICogcGFyZW50J3MgeGF0
dHIgbWV0YWRhdGEgd2FzIHVwZGF0ZWQuDQorICAgICAgICAqLw0KKyAgICAgICBpZiAoRjJGU19P
UFRJT04oc2JpKS5mc3luY19tb2RlID09IEZTWU5DX01PREVfU1RSSUNUKQ0KKyAgICAgICAgICAg
ICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0NQKTsNCkhpIENoYW8sIA0KRm9yIHRoaXMg
Y2FzZSwgd2lsbCBpdCBhbHNvIGNhdXNlIHRoZSBzYW1lIGlzc3VlIHdpdGggb3JpZ2luYWwgaXNz
dWUgd2hlbiBmc3luY19tb2RlID09IEZTWU5DX01PREVfU1RSSUNUID8NCmlmIGNrcHQgdGhyZWFk
IGlzIGJsb2NrZWQgYnkgc29tZSByZWFzb25zIGFuZCBTQklfTkVFRF9DUCBpcyBub3QgY2xlYXJl
ZCBpbiB0aW1lLCBTdWJzZXF1ZW50IGZzeW5jIHdpbGwgdHJpZ2dlciBjcD8NCisgICAgICAgZWxz
ZQ0KKyAgICAgICAgICAgICAgIGYyZnNfYWRkX2lub19lbnRyeShzYmksIGlub2RlLT5pX2lubywg
RU5DX0RJUl9JTk8pOw0KVGhpcyBwYXRjaCB2ZXJzaW9uIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBk
aXIgaXMgZW5jcnlwdGVkIG9yIG5vdCwgc28gdGhpcyBuYW1lKEVOQ19ESVJfSU5PKSBjYW4gYmUg
cmVuYW1lIG90aGVyIGZvciBtb3JlIGFjY3VyYXRlPw0KVGhhbmtz77yBDQogc2FtZToNCiAgICAg
ICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BQ0xfTU9ERSkpIHsNCiAgICAgICAg
ICAgICAgICBpbm9kZS0+aV9tb2RlID0gRjJGU19JKGlub2RlKS0+aV9hY2xfbW9kZTsgZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCBiL2luY2x1ZGUvdHJhY2UvZXZlbnRz
L2YyZnMuaCBpbmRleCBlZDc5NGI1ZmVmYmUuLmU0YTk0OTk1ZTlhOCAxMDA2NDQNCi0tLSBhL2lu
Y2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaA0KKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJm
cy5oDQpAQCAtMTM5LDcgKzEzOSw4IEBAIFRSQUNFX0RFRklORV9FTlVNKEVYX0JMT0NLX0FHRSk7
DQogICAgICAgICAgICAgICAgeyBDUF9OT0RFX05FRURfQ1AsICAgICAgIm5vZGUgbmVlZHMgY3Ai
IH0sICAgICAgICAgICAgICBcDQogICAgICAgICAgICAgICAgeyBDUF9GQVNUQk9PVF9NT0RFLCAg
ICAgImZhc3Rib290IG1vZGUiIH0sICAgICAgICAgICAgICBcDQogICAgICAgICAgICAgICAgeyBD
UF9TUEVDX0xPR19OVU0sICAgICAgImxvZyB0eXBlIGlzIDIiIH0sICAgICAgICAgICAgICBcDQot
ICAgICAgICAgICAgICAgeyBDUF9SRUNPVkVSX0RJUiwgICAgICAgImRpciBuZWVkcyByZWNvdmVy
eSIgfSkNCisgICAgICAgICAgICAgICB7IENQX1JFQ09WRVJfRElSLCAgICAgICAiZGlyIG5lZWRz
IHJlY292ZXJ5IiB9LCAgICAgICAgIFwNCisgICAgICAgICAgICAgICB7IENQX0VOQ19ESVIsICAg
ICAgICAgICAicGVyc2lzdCBlbmNyeXB0aW9uIHBvbGljeSIgfSkNCg0KICNkZWZpbmUgc2hvd19z
aHV0ZG93bl9tb2RlKHR5cGUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KICAgICAgICBfX3ByaW50X3N5bWJvbGljKHR5cGUsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXA0KLS0NCjIuNDAuMQ0KDQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
