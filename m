Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0A953EEE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 03:34:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1selqu-0003HD-07;
	Fri, 16 Aug 2024 01:34:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1selqr-0003Gv-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 01:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ha9UOl8Cqt7/vJ1W24JtKC2cGQSSED+HfOXsXxA7Esk=; b=mKiBewNifkOkXFK5NTlm4EXt5i
 fUM5G+FtKYVX9r/B57gVi+4G5PO8okjKzpdal3JRe1K2U5co8A7+IODC3ZBQjiiBWq/nxNcuHwo30
 dVEDUXQqFGDoHivP/oCLgIChMwm1BvBEoGf/1lK1yh+TGqXN0ky8nuitdqFLpVeFp6aA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ha9UOl8Cqt7/vJ1W24JtKC2cGQSSED+HfOXsXxA7Esk=; b=EFsI3w0/kaarF1gOVDQ8iv1PrP
 8Rt6PayrhPtOISLizJn4i8PnT/lJ0E1FZm5UFXaOtMLCZqXoRUbndwtpVjhWXOS913irGfvKyeaW5
 p6jb7IUQJSfMDn/lp0G3bL+OJlk18tc75Oq9x9/DbR2N81g+9drkwCMNNzkgiYglM5kE=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1selqp-0006AY-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 01:34:01 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240816013347epoutp02634aacb1d996b2b4cfa4ac08abb20ded~sEYa40dTY2211322113epoutp02N
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2024 01:33:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240816013347epoutp02634aacb1d996b2b4cfa4ac08abb20ded~sEYa40dTY2211322113epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723772027;
 bh=ha9UOl8Cqt7/vJ1W24JtKC2cGQSSED+HfOXsXxA7Esk=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=UdtycpPDgQvpWF98dC0+prdDcgqpd21VrBPDqb5HUtelr64unXxn2u8r1FxN2jL7R
 g7K/rcxJeLPWrRj1UasHZcQ72NCoUi2b5RBHbt/y98ohRr4NeIr63+F/2VyU+DW8mZ
 yY2cM05MQigN8LlzHk3H0eIEx1xgtfulZcygTu9w=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20240816013347epcas2p1d6f77fb9fa22777f07c5bfc75fd92484~sEYaTGvP51217512175epcas2p1s;
 Fri, 16 Aug 2024 01:33:47 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4WlPf23S1qz4x9QG; Fri, 16 Aug
 2024 01:33:46 +0000 (GMT)
X-AuditID: b6c32a46-24fff70000002752-28-66beac7a9392
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B4.6B.10066.A7CAEB66; Fri, 16 Aug 2024 10:33:46 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ce74a0ac-1c64-43db-ae74-eac621982484@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240816013245epcms2p73f8a02fcca3f452f7e7a0ff87c5eb992@epcms2p7>
Date: Fri, 16 Aug 2024 10:32:45 +0900
X-CMS-MailID: 20240816013245epcms2p73f8a02fcca3f452f7e7a0ff87c5eb992
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTTLdqzb40g4VbRS1OTz3LZPHykKbF
 qgfhFj9Omlj0725nsXiyfhazxf2t1xgtLi1yt2j542RxfuJrJotVHXMZLaaeP8LkwOOxaVUn
 m8fuBZ+ZPPq2rGIMYI7KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21
 VXLxCdB1y8wBukhJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeu
 l5daYmVoYGBkClSYkJ3x4IN8wTGJil37PjM3ML4T72Lk5JAQMJGYceooWxcjF4eQwA5GiUmn
 HrF3MXJw8AoISvzdIQxSIyxgJdF8eT8LiC0koCSx/uIsdoi4nsSth2sYQWw2AR2J6Sfus4PM
 ERGYzygx6/92sAZmgb1MEk3LyyCW8UrMaH/KAmFLS2xfvhWsmVPATuLFxL/sEHENiR/Lepkh
 bFGJm6vfssPY74/NZ4SwRSRa752FqhGUePBzN1RcUuL23E1Q9fkS/68sh7JrJLYdmAdl60tc
 69gIdgOvgK/ExmevmUD+ZRFQlTi33wOixEViybWjTBDna0ssW/iaGaSEWUBTYv0ufRBTQkBZ
 4sgtqAf5JDoOwxzPK9Gw8TdW9o55T5ggbDWJdT/XM01gVJ6FCOdZSHbNQti1gJF5FaNYakFx
 bnpqsVGBETxmk/NzNzGCU6aW2w7GKW8/6B1iZOJgPMQowcGsJML79MveNCHelMTKqtSi/Pii
 0pzU4kOMpkBPTmSWEk3OBybtvJJ4QxNLAxMzM0NzI1MDcyVx3nutc1OEBNITS1KzU1MLUotg
 +pg4OKUamM6mvjnDeyDxwtV9Cys8fkbGKOgKNHlY/hAU4tzaW1Ek3OHeYZexwf5+dE1Vj059
 TFQwn1wK2wzGkLmhngeEjHcLOp8+u0/BPCbn/plIDpt33VONK7j3inCXzGZ7WLeboYVtvv4p
 lV3mkg8WPjZe/XXd20ePJwmbiTwzMIvfdKzdudNhzbzcXXZuxp43NDdOKqmUmXLgpUp/9vzC
 9F9ayg6rI98xVpWaWz9XqDZuWx74ulnIV3ty/f98ueBbphoaZZUy/0L2Ny9YtXN90w2m6/Fl
 Z/555p9a1/7aq3TbfN6ZtdazbgjevpuUfdUt//i3lAe3UteHxFn3zDMvz7/zRMw07MybizP/
 uc+a7HVJiaU4I9FQi7moOBEAhZS0WCIEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240809073246epcms2p134ead07aadfe72e7e3506efc5098ad7f
References: <ce74a0ac-1c64-43db-ae74-eac621982484@kernel.org>
 <20240809073246epcms2p134ead07aadfe72e7e3506efc5098ad7f@epcms2p1>
 <CGME20240809073246epcms2p134ead07aadfe72e7e3506efc5098ad7f@epcms2p7>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao Yu, >  >--------- Original Message --------- >Sender
    : Chao Yu <chao@kernel.org> >Date : 2024-08-15 12:33 (GMT+9) >Title : Re:
    [PATCH] f2fs-tools: add write hint support >  >On 2024/8/9 15:32, Daejun
    Pa [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [203.254.224.25 listed in list.dnswl.org]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: samsung.com]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [203.254.224.25 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1selqp-0006AY-Rd
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs-tools: add write hint support
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
Reply-To: daejun7.park@samsung.com
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbyBZdSwKCj7CoA0KPi0tLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tLQ0K
PlNlbmRlciA6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4NCj5EYXRlIDogMjAyNC0wOC0xNSAx
MjozMyAoR01UKzkpDQo+VGl0bGUgOiBSZTogW1BBVENIXSBmMmZzLXRvb2xzOiBhZGQgd3JpdGUg
aGludCBzdXBwb3J0DQo+wqANCj5PbiAyMDI0LzgvOSAxNTozMiwgRGFlanVuIFBhcmsgd3JvdGU6
DQo+PiBUaGlzIHBhdGNoIGVuYWJsZXMgc3VwcG9ydCBmb3Igd3JpdGUgaGludHMgYnkgc2VnbWVu
dCB0eXBlLg0KPg0KPldoYXQgYWJvdXQgYWRkaW5nIGFuIG9wdGlvbiB0byBlbmFibGUgdGhpcyBm
dW5jdGlvbmFsaXR5PyBvdGhlcndpc2UsDQo+Zm9yIGEgZGV2aWNlIHdoaWNoIGRvZXNuJ3Qgc3Vw
cG9ydCB3aGludCBmZWF0dXJlLCBpdCB3aWxsIGNhdXNlDQo+b3ZlcmhlYWQgd2hlbmV2ZXIgY2Fs
bGluZyBmY250bCgpIHN5c2NhbGwuDQoNCkkgd2lsbCBhZGQgb3B0aW9uIGZvciB0aGlzIGZ1bmN0
aW9uYWxpdHkuDQoNCj4NCj5bc25pcF0NCj4NCj4+IEBAIC0xMDA1LDcgKzEwMDUsNyBAQCBpbnQg
Z2V0X2RldmljZV9pbmZvKGludCBpKQ0KPj7CoCAjZW5kaWYNCj4+wqANCj4+wqAgwqAgwqAgwqAg
wqAgwqBpZiAoIWMuc3BhcnNlX21vZGUpIHsNCj4+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
ZiAoZGV2LT56b25lZF9tb2RlbCA9PSBGMkZTX1pPTkVEX0hNICYmIGMuZnVuYyA9PSBGU0NLKQ0K
Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChkZXYtPnpvbmVkX21vZGVsID09IEYyRlNf
Wk9ORURfSE0pDQo+DQo+V2h5IGRvIHdlIG5lZWQgdG8gY2hhbmdlIHRoZSBjb25kdGlvbj8NCg0K
VGhpcyBpcyB0byBlbnN1cmUgdGhhdCB3cml0ZXMgcGVyZm9ybWVkIGJ5IGZ1bmN0aW9ucyBvdGhl
ciB0aGFuIGZzY2sNCmFyZSBhbHNvIGFwcGxpZWQgZGlyZWN0bHkgdG8gdGhlIGRldmljZS4NClRo
aXMgcGF0Y2ggbW9kaWZpZXMgcndfaGludCBvbiBkZXZpY2UgZmQgdG8gcGFzcyB0aGUgd3JpdGUg
aGludCB0byBkZXZpY2UsDQpzbyB0aGUgd3JpdGUgbXVzdCBiZSBzeW5jaHJvbm91cy4NCg0KPltz
bmlwXQ0KPg0KPj4gLWludCBkZXZfd3JpdGUodm9pZCAqYnVmLCBfX3U2NCBvZmZzZXQsIHNpemVf
dCBsZW4pDQo+PiArc3RhdGljIGludCBfX2Rldl93cml0ZSh2b2lkICpidWYsIF9fdTY0IG9mZnNl
dCwgc2l6ZV90IGxlbiwgZW51bSByd19oaW50IHdoaW50KQ0KPj7CoCB7DQo+PiArIMKgIMKgIMKg
IMKgYm9vbCBzZXRfd2hpbnQgPSB3aGludCAhPSBXUklURV9MSUZFX05PTkU7DQo+PiArIMKgIMKg
IMKgIMKgdTY0IGhpbnQgPSB3aGludDsNCj4+wqAgwqAgwqAgwqAgwqAgwqBpbnQgZmQ7DQo+PsKg
DQo+PiArIMKgIMKgIMKgIMKgZmQgPSBfX2dldF9kZXZpY2VfZmQoJm9mZnNldCk7DQo+PiArIMKg
IMKgIMKgIMKgaWYgKGZkIDwgMCkNCj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4g
ZmQ7DQo+PiArDQo+PiArIMKgIMKgIMKgIMKgaWYgKGxzZWVrKGZkLCAob2ZmX3Qpb2Zmc2V0LCBT
RUVLX1NFVCkgPCAwKQ0KPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtMTsNCj4+
ICsNCj4+ICsgwqAgwqAgwqAgwqBpZiAoc2V0X3doaW50KQ0KPj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGZjbnRsKGZkLCBGX1NFVF9SV19ISU5ULCAmaGludCk7DQo+DQo+V2hhdCBhYm91dCBr
ZWVwaW5nIGxhc3QgaGludCBpbiBmZCwgYW5kIHVwZGF0ZSBpdCBvbmNlIG5ldyBoaW50IGlzDQo+
bm90IHNhbWUgdG8gb2xkIG9uZT8NCg0KT0ssIEkgd2lsbCBjaGFuZ2UgaXQuDQoNClRoYW5rcywN
CkRhZWp1bg0KDQo+DQo+VGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
